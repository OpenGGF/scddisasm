# Repository Guidelines

## Project Structure & Module Organization

This repository is an incomplete Sonic CD disassembly. Most implementation lives under `src/`, grouped by game subsystem: `Level/`, `Sound Drivers/`, `Special Stage/`, `Title Screen/`, and other program components. Shared 68000/Z80 definitions are in `src/_Include/`. SonLVL object definitions and editor configuration are in `src/_SonLVL/`; IDA helper scripts are in `ida/`. The `bin/` directory contains the Windows assembler and image-building tools used by the batch scripts.

Original game files required for comparison and ISO assembly belong in the region directories under `original/` (`usa/`, `japan/`, or `europe/`). Do not commit generated files from `out/`, assembler listings, logs, symbols, or generated label includes covered by `.gitignore`.

## Build, Test, and Development Commands

Run these commands from a Windows command prompt at the repository root:

- `make.bat` assembles all supported programs, copies the selected region's original files, and creates `out/scdbuilt.iso`.
- `check.bat` compares each rebuilt binary byte-for-byte with its corresponding original using `fc /b`.

Both scripts default to USA (`REGION=1`). Change the local `REGION` value to `0` for Japan or `2` for Europe when validating another version. A complete build requires the untracked/copyrighted source files described in `README.md` to be present under `original/<region>/`.

## Coding Style & Naming Conventions

Match the surrounding assembly style: tabs align opcodes, operands, and trailing comments; labels use descriptive PascalCase (for example, `LevelStart`); routine-local labels begin with a dot (for example, `.FadeToBlack`). Use uppercase hexadecimal literals (`$FF`) and keep explanatory comments concise. Preserve established filenames with spaces and region/game identifiers such as `R11A__`. C# SonLVL definitions use tabs, PascalCase types and members, and existing namespace patterns.

## Testing Guidelines

There is no unit-test framework or stated coverage target. After assembly changes, run `make.bat`, confirm there are no assembler errors in generated `.log` files, then run `check.bat`. Expected output is successful binary comparison for every rebuilt component. If a deliberate byte-level difference is introduced, document the affected binary and reason in the pull request.

## Commit & Pull Request Guidelines

Recent history uses short, imperative subjects such as `Add link to source code of MakeSTM` and `Rename ".i" files to ".inc"`. Keep each commit focused and avoid checking in build products or proprietary originals. Pull requests should summarize the subsystem changed, state the tested region, list build/comparison results, and link relevant issues. Include screenshots only for visible gameplay or SonLVL changes.
