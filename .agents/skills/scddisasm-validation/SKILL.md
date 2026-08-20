---
name: scddisasm-validation
description: Validate region-aware changes to this Sonic CD disassembly, including finding true assembly entry points, running the Windows build and byte comparisons, and distinguishing source failures from missing proprietary files. Use for assembly or game-data changes, build failures, and binary-match verification in this repository.
---

# Validate Sonic CD Disassembly Changes

Use the repository's byte-exact output as the primary correctness signal. Scope validation to the binaries affected by the change, then run the full supported build/check when its prerequisites are available.

## Trace the affected output

1. Read `make.bat` to identify the standalone assembly entry point and output binary. Do not assume the edited `.asm` file is assembled directly; most source files are included fragments.
2. Search all inclusion sites for a changed shared fragment. Level engine and common object files can affect multiple zones, time periods, the demo build, and regional variants.
3. Note compile-time switches on the relevant command, especially `REGION`, `DEMO`, `PROTOTYPE`, `H32`, `EASTEREGG`, and `DATAFILE`.
4. Preserve include order, origins, phases, alignment, padding, table entry widths, and data order unless a byte-level change is intentional.

## Preflight the supported build

- Run from a Windows command prompt at the repository root. The checked-in tools are Windows executables, and `make.bat` changes into `src/` so include paths resolve from there.
- Confirm the selected `original/<region>/` directory contains the copyrighted files that `make.bat` copies and `check.bat` compares. The tracked `.gitkeep` alone is not sufficient.
- Set the same region in both scripts: Japan `0`, USA `1`, or Europe `2`. Restore temporary edits to the tracked batch files afterward.
- Start with a fresh `out/` when changing regions; the build does not clean stale files.

If the originals or a native Windows environment are unavailable, do not reinterpret that as a code failure and do not claim a successful build. Report the exact missing prerequisite and continue with non-build checks appropriate to the edited files.

## Build and compare

1. Run `make.bat`.
2. Diagnose the first failed assembler or tool invocation. Inspect the corresponding ignored `.log` beside its source; later missing generated includes may only be cascading failures.
3. Confirm that ignored intermediates were regenerated where relevant:
   - `src/DA Garden/Track Title Labels.inc`
   - `src/Special Stage/Stage Data.bin`
   - `src/Special Stage/Stage Data Labels.inc`
4. Run `check.bat` with the identical region.
5. Inspect every `fc /b` result because the script has no aggregate pass/fail summary. Record any mismatching output and offset; intentional differences must be explained.

## Handoff

Report the tested region, affected binaries, whether assembly completed, and whether every comparison matched. If validation was partial, name the unrun checks and why. Finish with `git status --short` and keep `out/`, logs, listings, symbols, generated intermediates, proprietary originals, and temporary region-selection edits out of the commit.
