---
name: scddisasm-validation
description: Validate region-aware changes to this Sonic CD disassembly, including finding true assembly entry points, running Windows or Linux builds and byte comparisons, safely recovering originals from a local disc image, and distinguishing source failures from missing prerequisites. Use for assembly or game-data changes, build failures, and binary-match verification in this repository.
---

# Validate Sonic CD Disassembly Changes

Use the repository's byte-exact output as the primary correctness signal. Scope validation to the binaries affected by the change, then run the full supported build/check when its prerequisites are available.

## Trace the affected output

1. Read `make.bat` or `make.sh` to identify the standalone assembly entry point and output binary. Do not assume the edited `.asm` file is assembled directly; most source files are included fragments.
2. Search all inclusion sites for a changed shared fragment. Level engine and common object files can affect multiple zones, time periods, the demo build, and regional variants.
3. Note compile-time switches on the relevant command, especially `REGION`, `DEMO`, `PROTOTYPE`, `H32`, `EASTEREGG`, and `DATAFILE`.
4. Preserve include order, origins, phases, alignment, padding, table entry widths, and data order unless a byte-level change is intentional.

## Preflight the build

- On Windows, run from a command prompt at the repository root using `make.bat` and `check.bat`.
- On Linux, use `make.sh` and `check.sh`. `make.sh` runs the same checked-in Windows executables through Wine or an automatically detected Steam Proton installation. Use `WINE_BIN` or `PROTON_BIN` to select a nonstandard runtime. On Bazzite, use the Proton launcher through `make.sh`, not Proton's bundled `files/bin/wine` directly; the launcher performs required prefix setup.
- Both build frontends change into `src/` so include paths resolve from there. Do not replace the pinned `mkisofs.exe` or assemblers with native alternatives when claiming byte-exact validation.
- Confirm the selected `original/<region>/` directory contains the copyrighted files that the build frontend copies and the check frontend compares. The tracked `.gitkeep` alone is not sufficient.
- Use the same region for build and check: Japan `0`, USA `1`, or Europe `2`. On Linux, set the `REGION` environment variable for both commands. Restore temporary edits to tracked batch files afterward.
- Start with a fresh `out/` when changing regions; the build does not clean stale files.

If the originals or a usable Windows/Wine/Proton runtime are unavailable, do not reinterpret that as a code failure and do not claim a successful build. Report the exact missing prerequisite and continue with non-build checks appropriate to the edited files.

## Recover originals from a local disc image

When regional originals are absent, check ignored `original/disc-images/` for a locally supplied image. Do not obtain copyrighted game data from the network.

1. Before extraction, use `git check-ignore` to confirm that the disc image and `original/<region>/` destination contents are ignored.
2. For a CHD, extract its cue/bin to a temporary directory with `chdman extractcd`.
3. Convert the MODE1/2352 data track to an ISO with `bchunk`, then extract its filesystem into the matching region directory with `7z`.
4. Verify the region from the image metadata and use the matching `REGION` value.
5. Run `git ls-files --others --exclude-standard original`; it must produce no output. Never force-add the image or extracted files.

If extraction utilities are missing on an immutable Linux host, unpack distribution packages into a temporary directory rather than modifying the OS when practical.

## Build and compare

1. Run `make.bat` on Windows or `./make.sh` on Linux.
2. Diagnose the first failed assembler or tool invocation. Inspect the corresponding ignored `.log` beside its source; later missing generated includes may only be cascading failures.
3. Confirm that ignored intermediates were regenerated where relevant:
   - `src/DA Garden/Track Title Labels.inc`
   - `src/Special Stage/Stage Data.bin`
   - `src/Special Stage/Stage Data Labels.inc`
4. Run `check.bat` or `./check.sh` with the identical region.
5. Inspect every comparison. `check.bat` has no aggregate pass/fail summary; `check.sh` reports an aggregate result and exits nonzero on missing or different files. Record any mismatch and offset; intentional differences must be explained.

The component comparisons are authoritative. The scripts do not compare the final ISO, whose filesystem metadata can differ even when every rebuilt component matches.

## Handoff

Report the host path used (Windows, Wine, or Proton), tested region, affected binaries, whether assembly completed, and whether every component comparison matched. If validation was partial, name the unrun checks and why. Finish with `git status --short`; if originals were handled, also confirm that `git ls-files --others --exclude-standard original` is empty. Keep `out/`, logs, listings, symbols, generated intermediates, proprietary originals, disc images, and temporary region-selection edits out of the commit.
