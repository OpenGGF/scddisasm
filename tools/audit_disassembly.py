#!/usr/bin/env python3
"""Audit active non-BRAM assembly sources and build-component coverage.

This is a structural inventory tool, not a semantic classifier. In particular,
it does not treat a file as opaque merely because it contains many data
declarations. The manually reviewed component status lives in
docs/disassembly-status.md.
"""

from __future__ import annotations

import argparse
import json
import re
import shlex
import subprocess
import sys
from collections import Counter
from dataclasses import asdict, dataclass
from pathlib import Path, PurePosixPath


REPOSITORY = Path(__file__).resolve().parents[1]
SOURCE_ROOT = REPOSITORY / "src"
MAKE_SH = REPOSITORY / "make.sh"
CHECK_SH = REPOSITORY / "check.sh"
STATUS_DOCUMENT = REPOSITORY / "docs/disassembly-status.md"

SOURCE_SUFFIXES = {".asm", ".inc"}
BRAM_PREFIX = "src/Backup RAM/"
BRAM_OUTPUTS = {"BRAMINIT.MMD", "BRAMMAIN.MMD", "BRAMSUB.BIN"}
EXTERNAL_CHECK_INPUTS = {
	"BADEND.STM",
	"GOODEND.STM",
	"PTEST.STM",
	"ABS.TXT",
	"BIB.TXT",
	"CPY.TXT",
}
GENERATED_INCLUDES = {
	"DA Garden/Track Title Labels.inc",
	"Special Stage/Stage Data Labels.inc",
}
CONDITIONAL_MISSING_INCLUDES = {
	"standalone/block_write.asm",
}

BUILD_COMMAND = re.compile(
	r"^(assemble(?:_symbols)?)\s+'([^']+)'\s+'([^']+)'(.*)$"
)
INCLUDE = re.compile(r"^\s*include\s+[\"']([^\"']+)[\"']", re.I | re.M)
DATA_DECLARATION = re.compile(r"(?:^|\s)dc\.(?:b|w|l)(?:\s|$)", re.I)
INCBIN = re.compile(r"(?:^|\s)incbin(?:\s|$)", re.I)
ADDRESS_LABEL = re.compile(
	r"^(?:"
	r"L_[0-9A-Fa-f]+|"
	r"loc(?:ret)?_[0-9A-Fa-f]+|"
	r"sub_[0-9A-Fa-f]+|"
	r"off_[0-9A-Fa-f]+|"
	r"(?:byte|word|dword|data|unk|asc)_[0-9A-Fa-f]+"
	r"):",
	re.M,
)
STATUS_OUTPUT = re.compile(r"^\| `([^`]+)` \|", re.M)


@dataclass(frozen=True)
class Component:
	output: str
	source: str
	switches: str
	derived: bool = False


@dataclass
class Metrics:
	files: int = 0
	lines: int = 0
	comment_only_lines: int = 0
	inline_comment_lines: int = 0
	data_declaration_lines: int = 0
	incbin_lines: int = 0
	address_labels: int = 0

	def add_file(self, path: Path) -> None:
		self.files += 1
		text = path.read_text(errors="replace")
		for line in text.splitlines():
			self.lines += 1
			stripped = line.lstrip()
			if stripped.startswith(";"):
				self.comment_only_lines += 1
			elif ";" in line:
				self.inline_comment_lines += 1
			if DATA_DECLARATION.search(line):
				self.data_declaration_lines += 1
			if INCBIN.search(line):
				self.incbin_lines += 1
		self.address_labels += len(ADDRESS_LABEL.findall(text))


@dataclass
class IncludeIssue:
	including_file: str
	requested: str
	classification: str
	resolved_path: str = ""


def repository_path(path: Path) -> str:
	return path.relative_to(REPOSITORY).as_posix()


def source_path(path: str) -> Path:
	return SOURCE_ROOT / PurePosixPath(path.replace("\\", "/"))


def git_tracked_sources() -> set[Path]:
	result = subprocess.run(
		["git", "ls-files", "-z", "src"],
		cwd=REPOSITORY,
		check=True,
		stdout=subprocess.PIPE,
	).stdout
	paths = set()
	for raw in result.split(b"\0"):
		if not raw:
			continue
		path = REPOSITORY / raw.decode()
		if path.suffix.lower() not in SOURCE_SUFFIXES:
			continue
		if repository_path(path).startswith(BRAM_PREFIX):
			continue
		paths.add(path)
	return paths


def parse_build() -> tuple[list[Component], set[Path]]:
	components: list[Component] = []
	roots: set[Path] = set()
	for line in MAKE_SH.read_text().splitlines():
		match = BUILD_COMMAND.match(line)
		if not match:
			continue
		_, raw_source, raw_output, tail = match.groups()
		source = source_path(raw_source)
		if not repository_path(source).startswith(BRAM_PREFIX):
			roots.add(source)

		output = raw_output.replace("\\", "/")
		if not output.startswith("../out/"):
			continue
		name = PurePosixPath(output).name
		if name in BRAM_OUTPUTS:
			continue
		extra_switches = " ".join(re.findall(r"/e\s+([^\s]+)", tail))
		switches = "REGION" + (f" {extra_switches}" if extra_switches else "")
		components.append(
			Component(name, repository_path(source), switches)
		)

	# These outputs are deliberately derived outside the assemble() helper.
	for number in range(6, 10):
		components.append(
			Component(
				f"DUMMY{number}.MMD",
				"src/Title Screen/Secrets/Sound Test (Prototype).asm",
				"REGION PROTOTYPE=1 H32=0 (copy of DUMMY5.MMD)",
				True,
			)
		)
	components.append(
		Component(
			"OPN.STM",
			"bin/MakeSTM.exe + src/FMV/Data/Opening.gif + Opening.wav",
			"REGION",
			True,
		)
	)

	# The AS-built driver is an active intermediate included by MDINIT.MMD.
	roots.add(SOURCE_ROOT / "Sound Drivers/FM/_Driver.asm")
	# The final ISO wrapper is active source even though it is not a component
	# compared by check.sh.
	roots.add(SOURCE_ROOT / "Main.asm")
	return components, roots


def parse_comparison_outputs() -> set[str]:
	text = CHECK_SH.read_text()
	outputs = {"ip.bin", "sp.bin"}
	for match in re.finditer(r"files(?:\+)?=\((.*?)\)", text, re.S):
		outputs.update(shlex.split(match.group(1), comments=True))
	return outputs


def parse_status_outputs() -> set[str]:
	if not STATUS_DOCUMENT.is_file():
		return set()
	return set(STATUS_OUTPUT.findall(STATUS_DOCUMENT.read_text()))


def path_index() -> dict[str, Path]:
	index: dict[str, Path] = {}
	for path in SOURCE_ROOT.rglob("*"):
		if path.is_file():
			key = path.relative_to(SOURCE_ROOT).as_posix().lower()
			index.setdefault(key, path)
	return index


def normalized_candidate(base: PurePosixPath, requested: str) -> str:
	parts: list[str] = []
	for part in (base / PurePosixPath(requested.replace("\\", "/"))).parts:
		if part in {"", "."}:
			continue
		if part == "..":
			if parts:
				parts.pop()
			continue
		parts.append(part)
	return PurePosixPath(*parts).as_posix()


def resolve_include(
	including_file: Path,
	requested: str,
	index: dict[str, Path],
) -> tuple[Path | None, IncludeIssue | None]:
	parent = including_file.relative_to(SOURCE_ROOT).parent
	candidates = [
		normalized_candidate(PurePosixPath(), requested),
		normalized_candidate(PurePosixPath(parent.as_posix()), requested),
	]
	for candidate in dict.fromkeys(candidates):
		path = SOURCE_ROOT / PurePosixPath(candidate)
		if path.is_file():
			return path, None

	for candidate in dict.fromkeys(candidates):
		resolved = index.get(candidate.lower())
		if resolved is not None:
			return resolved, IncludeIssue(
				repository_path(including_file),
				requested,
				"case-mismatch",
				repository_path(resolved),
			)

	requested_normalized = normalized_candidate(PurePosixPath(), requested)
	if requested_normalized in GENERATED_INCLUDES:
		return None, IncludeIssue(
			repository_path(including_file), requested, "generated"
		)
	if requested_normalized in CONDITIONAL_MISSING_INCLUDES:
		return None, IncludeIssue(
			repository_path(including_file), requested, "inactive-conditional"
		)
	return None, IncludeIssue(
		repository_path(including_file), requested, "missing"
	)


def trace_active_sources(
	roots: set[Path],
) -> tuple[set[Path], list[IncludeIssue]]:
	index = path_index()
	active: set[Path] = set()
	issues: list[IncludeIssue] = []
	stack = sorted(roots, reverse=True)
	while stack:
		path = stack.pop()
		if path in active:
			continue
		if not path.is_file():
			issues.append(
				IncludeIssue("<build-root>", repository_path(path), "missing")
			)
			continue
		active.add(path)
		if path.suffix.lower() not in SOURCE_SUFFIXES:
			continue
		for requested in INCLUDE.findall(path.read_text(errors="replace")):
			resolved, issue = resolve_include(path, requested, index)
			if issue is not None:
				issues.append(issue)
			if resolved is not None and resolved not in active:
				stack.append(resolved)
	return active, issues


def metric_set(paths: set[Path]) -> Metrics:
	metrics = Metrics()
	for path in sorted(paths):
		metrics.add_file(path)
	return metrics


def issue_counts(issues: list[IncludeIssue]) -> Counter[str]:
	return Counter(issue.classification for issue in issues)


def audit() -> dict:
	components, roots = parse_build()
	comparison_outputs = parse_comparison_outputs()
	component_output_counts = Counter(component.output for component in components)
	component_outputs = {component.output for component in components}
	expected_built_outputs = comparison_outputs - BRAM_OUTPUTS - EXTERNAL_CHECK_INPUTS
	status_outputs = parse_status_outputs()
	tracked = git_tracked_sources()
	active, issues = trace_active_sources(roots)
	active_tracked = active & tracked
	unreachable = tracked - active_tracked

	groups: dict[str, dict[str, int]] = {}
	for path in tracked:
		group = path.relative_to(SOURCE_ROOT).parts[0]
		counts = groups.setdefault(group, {"active": 0, "unreachable": 0})
		counts["active" if path in active_tracked else "unreachable"] += 1

	return {
		"components": [asdict(component) for component in sorted(
			components, key=lambda component: component.output
		)],
		"component_count": len(components),
		"duplicate_component_outputs": sorted(
			output for output, count in component_output_counts.items() if count > 1
		),
		"component_outputs_missing_from_build": sorted(
			expected_built_outputs - component_outputs
		),
		"component_outputs_missing_from_check": sorted(
			component_outputs - expected_built_outputs
		),
		"component_outputs_missing_from_status": sorted(
			component_outputs - status_outputs
		),
		"status_outputs_missing_from_build": sorted(
			status_outputs - component_outputs
		),
		"status_output_count": len(status_outputs),
		"comparison_output_count": len(comparison_outputs),
		"external_comparison_input_count": len(EXTERNAL_CHECK_INPUTS),
		"excluded_bram_output_count": len(BRAM_OUTPUTS),
		"build_root_count": len(roots),
		"tracked_source_count": len(tracked),
		"active_tracked_source_count": len(active_tracked),
		"unreachable_tracked_source_count": len(unreachable),
		"unreachable_sources": sorted(repository_path(path) for path in unreachable),
		"include_issue_counts": dict(sorted(issue_counts(issues).items())),
		"include_issues": [asdict(issue) for issue in issues],
		"active_metrics": asdict(metric_set(active_tracked)),
		"tracked_metrics": asdict(metric_set(tracked)),
		"groups": dict(sorted(groups.items())),
	}


def print_text(result: dict, list_unreachable: bool) -> None:
	print("Non-BRAM disassembly audit")
	print("===========================")
	print(f"Compared outputs: {result['comparison_output_count']}")
	print(f"Built non-BRAM components: {result['component_count']}")
	print(f"Excluded BRAM outputs: {result['excluded_bram_output_count']}")
	print(
		"External media/metadata comparison inputs: "
		f"{result['external_comparison_input_count']}"
	)
	print(f"Assembly build roots: {result['build_root_count']}")
	print(f"Tracked non-BRAM ASM/INC: {result['tracked_source_count']}")
	print(
		"Active tracked ASM/INC: "
		f"{result['active_tracked_source_count']}"
	)
	print(
		"Tracked but unreachable ASM/INC: "
		f"{result['unreachable_tracked_source_count']}"
	)

	print("\nComponent coverage")
	print("------------------")
	missing_build = result["component_outputs_missing_from_build"]
	missing_check = result["component_outputs_missing_from_check"]
	print("Check outputs lacking a build producer: " + (", ".join(missing_build) or "none"))
	print("Build components lacking a comparison: " + (", ".join(missing_check) or "none"))
	duplicates = result["duplicate_component_outputs"]
	print("Duplicate build component producers: " + (", ".join(duplicates) or "none"))
	missing_status = result["component_outputs_missing_from_status"]
	extra_status = result["status_outputs_missing_from_build"]
	print("Build components lacking a status row: " + (", ".join(missing_status) or "none"))
	print("Status rows lacking a build component: " + (", ".join(extra_status) or "none"))

	print("\nInclude resolution")
	print("------------------")
	counts = result["include_issue_counts"]
	for classification in (
		"missing",
		"case-mismatch",
		"generated",
		"inactive-conditional",
	):
		print(f"{classification}: {counts.get(classification, 0)}")
	for issue in result["include_issues"]:
		if issue["classification"] == "missing":
			print(
				f"  {issue['including_file']}: {issue['requested']}"
			)

	print("\nActive-source metrics")
	print("---------------------")
	for name, value in result["active_metrics"].items():
		print(f"{name.replace('_', ' ')}: {value}")

	print("\nTracked source by group")
	print("-----------------------")
	for group, counts in result["groups"].items():
		print(
			f"{group}: active={counts['active']} "
			f"unreachable={counts['unreachable']}"
		)

	if list_unreachable:
		print("\nTracked but unreachable sources")
		print("-------------------------------")
		for path in result["unreachable_sources"]:
			print(path)


def main() -> int:
	parser = argparse.ArgumentParser(description=__doc__)
	parser.add_argument(
		"--json", action="store_true", help="emit the complete audit as JSON"
	)
	parser.add_argument(
		"--list-unreachable",
		action="store_true",
		help="list tracked sources not reached from a non-BRAM build root",
	)
	parser.add_argument(
		"--check",
		action="store_true",
		help="fail for missing includes or build/comparison coverage gaps",
	)
	args = parser.parse_args()

	result = audit()
	if args.json:
		json.dump(result, sys.stdout, indent=2)
		print()
	else:
		print_text(result, args.list_unreachable)

	if args.check:
		missing_include = result["include_issue_counts"].get("missing", 0)
		coverage_gap = bool(
			result["duplicate_component_outputs"]
			or result["component_outputs_missing_from_build"]
			or result["component_outputs_missing_from_check"]
			or result["component_outputs_missing_from_status"]
			or result["status_outputs_missing_from_build"]
		)
		if missing_include or coverage_gap:
			return 1
	return 0


if __name__ == "__main__":
	raise SystemExit(main())
