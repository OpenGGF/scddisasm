"""Regression checks for the structural audit's file-resolution gate."""

import contextlib
import io
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

import audit_disassembly as audit


class IncludeResolutionTests(unittest.TestCase):
	def setUp(self):
		self.directory = tempfile.TemporaryDirectory()
		self.addCleanup(self.directory.cleanup)
		self.root = Path(self.directory.name)
		self.source = self.root / "src"
		self.source.mkdir()
		for name, value in (("REPOSITORY", self.root), ("SOURCE_ROOT", self.source)):
			mock = patch.object(audit, name, value)
			mock.start()
			self.addCleanup(mock.stop)

	def trace(self, text):
		entry = self.source / "Main.asm"
		entry.write_text(text)
		return audit.trace_active_sources({entry})

	def test_binary_assets_are_checked_but_not_traversed(self):
		(self.source / "Art.bin").write_bytes(b'include "Missing.asm"')
		active, issues = self.trace('incbin "Art.bin", 0, 4\n')
		self.assertEqual(active, {self.source / "Main.asm"})
		self.assertEqual(issues, [])

	def test_missing_binary_is_reported(self):
		_, issues = self.trace('; incbin "Comment.bin"\nincbin "Missing.bin"\n')
		self.assertEqual([(i.requested, i.classification) for i in issues],
			[("Missing.bin", "missing")])

	def test_case_mismatch_is_reported_for_source_and_assets(self):
		(self.source / "Helper.asm").write_text("rts\n")
		(self.source / "Art.bin").write_bytes(b"\x00")
		_, issues = self.trace('include "helper.asm"\nincbin "art.bin"\n')
		self.assertEqual([i.classification for i in issues],
			["case-mismatch", "case-mismatch"])

	def test_only_known_generated_binaries_are_exempt(self):
		_, issues = self.trace('incbin "../out/misc/ip.bin"\nincbin "Typo.bin"\n')
		self.assertEqual([i.classification for i in issues], ["generated", "missing"])

	def test_numbered_routine_debt_survives_address_label_renaming(self):
		entry = self.source / "Object.asm"
		entry.write_text("FreezerObject_0_RoutineA:\nrts\nDecompEnigmaSub0:\nrts\n")
		metrics = audit.Metrics()
		metrics.add_file(entry)
		self.assertEqual(metrics.address_labels, 0)
		self.assertEqual(metrics.numbered_routine_labels, 2)

	def test_check_exit_status_rejects_resolution_errors(self):
		coverage_keys = (
			"duplicate_component_outputs", "component_outputs_missing_from_build",
			"component_outputs_missing_from_check", "component_outputs_missing_from_status",
			"status_outputs_missing_from_build",
		)
		for counts, expected in (({}, 0), ({"missing": 1}, 1),
				({"case-mismatch": 1}, 1), ({"generated": 1}, 0)):
			with self.subTest(counts=counts):
				result = {key: [] for key in coverage_keys}
				result["include_issue_counts"] = counts
				with patch.object(audit, "audit", return_value=result), \
						patch("sys.argv", ["audit", "--check", "--json"]), \
						contextlib.redirect_stdout(io.StringIO()):
					self.assertEqual(audit.main(), expected)


if __name__ == "__main__":
	unittest.main()
