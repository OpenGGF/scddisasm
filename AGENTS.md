# Repository Guidelines

## Project Structure & Module Organization

This repository is an incomplete Sonic CD disassembly. Most implementation lives under `src/`, grouped by game subsystem: `Level/`, `Sound Drivers/`, `Special Stage/`, `Title Screen/`, and other program components. Shared 68000/Z80 definitions are in `src/_Include/`. `src/Main.asm` is the final ISO wrapper; individual binaries are assembled from the entry points listed in `make.bat`.

Many `.asm` files are include fragments, not standalone translation units. Before changing one, find the entry point that includes it and note that shared fragments may feed several binaries or regional variants. Level entry points, for example, include shared engine code plus zone- and time-period-specific data in a deliberate order.

SonLVL object definitions and editor configuration are in `src/_SonLVL/`; `src/SonPLN.ini` configures SonPLN. IDA helper scripts are in `ida/`; their stage-MMD automation currently targets the European version only. The `bin/` directory contains the checked-in Windows assemblers and image-building tools used by the batch scripts.

Regional game files required for comparison and ISO assembly belong under `original/usa/`, `original/japan/`, or `original/europe/`; the common IP/SP comparison files live directly under `original/`. Do not commit generated files from `out/`, assembler listings, logs, symbols, or generated label includes covered by `.gitignore`.

## Build Toolchain & Generated Files

The batch build changes into `src/`, so assembly `include` and `incbin` paths are relative to that directory. Most 68000 programs use `bin/asm68k.exe`. The FM driver is the exception: it uses `bin/asw.exe` plus `bin/p2bin.exe` and mixes 68000 setup with Z80 source. `MakeSTM.exe` builds the opening movie stream, `dumpasmsym.exe` produces assembly label includes, and `mkisofs.exe` constructs the ISO filesystem.

The build regenerates these ignored intermediates inside `src/`:

- `src/DA Garden/Track Title Labels.inc`
- `src/Special Stage/Stage Data.bin`
- `src/Special Stage/Stage Data Labels.inc`

Do not hand-edit or commit them. A missing generated include can be a consequence of an earlier assembler failure, so diagnose the first failing command or its adjacent `.log` file.

## Build, Test, and Development Commands

Run these commands from a Windows command prompt at the repository root:

- `make.bat` assembles all supported programs, copies the selected region's original files, and creates `out/scdbuilt.iso`.
- `check.bat` compares each rebuilt binary byte-for-byte with its corresponding original using `fc /b`.

Both scripts default to USA (`REGION=1`). Change the local `REGION` value to `0` for Japan or `2` for Europe when validating another version. A complete build requires the untracked/copyrighted source files described in `README.md` to be present under `original/<region>/`.

Keep `REGION` identical in `make.bat` and `check.bat`; the scripts do not share this setting. The numeric constants are `JAPAN=0`, `USA=1`, and `EUROPE=2`, as defined in `src/_Include/Common.inc`. If region values are changed only for local testing, restore both tracked scripts before committing. Use a fresh `out/` when switching regions because `make.bat` creates and overwrites outputs but does not clean the directory first.

The repository only tracks the common IP/SP originals and placeholder region directories. If `original/<region>/` lacks the copyrighted game files, record the build/check as blocked by missing prerequisites rather than treating it as a source regression. The supplied build tools are Windows executables and the supported workflow is native Windows `cmd.exe`; do not claim validation from an untested compatibility-layer run.

## Coding Style & Naming Conventions

Match the surrounding assembly style: tabs align opcodes, operands, and trailing comments; labels use descriptive PascalCase (for example, `LevelStart`); routine-local labels begin with a dot (for example, `.FadeToBlack`). Use uppercase hexadecimal literals (`$FF`) and keep explanatory comments concise. Preserve established filenames with spaces and region/game identifiers such as `R11A__`.

This is a byte-exact reconstruction. Treat include order, `org`/`phase`, alignment and padding, table widths, branch sizes, and data ordering as observable output. Avoid cleanup refactors that alter layout unless the binary difference is intentional. Assembly dialect differs between the asm68k and AS sound-driver sources, so copy syntax from the relevant subsystem rather than normalizing it globally. C# SonLVL definitions use tabs, PascalCase types and members, existing namespace patterns, and paths relative to `src/_SonLVL/`.

## Testing Guidelines

There is no unit-test framework or stated coverage target. After assembly or binary-data changes, run `make.bat`, confirm there are no assembler errors in generated `.log` files, then run `check.bat` with the same region. Expected output is successful binary comparison for every rebuilt component; inspect the complete `fc /b` output because `check.bat` does not summarize the run or compare the final ISO itself. If a deliberate byte-level difference is introduced, document the affected binary, offsets if useful, and reason in the pull request.

For documentation, IDA, SonLVL, or editor-only changes, run the narrowest relevant validation and explicitly state that the ISO build/comparison was not applicable or could not run. Before handing off any change, inspect `git status --short` and ensure ignored build products, proprietary originals, and temporary region edits are absent from the commit.

## Commit & Pull Request Guidelines

Recent history uses short, imperative subjects such as `Add link to source code of MakeSTM` and `Rename ".i" files to ".inc"`. Keep each commit focused and avoid checking in build products or proprietary originals. Pull requests should summarize the subsystem changed, state the tested region, list build/comparison results, and link relevant issues. Include screenshots only for visible gameplay or SonLVL changes.
