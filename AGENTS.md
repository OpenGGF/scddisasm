# Repository Guidelines

## Project Structure & Module Organization

This repository is an incomplete Sonic CD disassembly. Most implementation lives under `src/`, grouped by game subsystem: `Level/`, `Sound Drivers/`, `Special Stage/`, `Title Screen/`, and other program components. Shared 68000/Z80 definitions are in `src/_Include/`. `src/Main.asm` is the final ISO wrapper; individual binaries are assembled from the entry points listed in `make.bat` and `make.sh`.

Many `.asm` files are include fragments, not standalone translation units. Before changing one, find the entry point that includes it and note that shared fragments may feed several binaries or regional variants. Level entry points, for example, include shared engine code plus zone- and time-period-specific data in a deliberate order.

SonLVL object definitions and editor configuration are in `src/_SonLVL/`; `src/SonPLN.ini` configures SonPLN. IDA helper scripts are in `ida/`; their stage-MMD automation currently targets the European version only. The `bin/` directory contains the checked-in Windows assemblers and image-building tools used by both build frontends.

Regional game files required for comparison and ISO assembly belong under `original/usa/`, `original/japan/`, or `original/europe/`; the common IP/SP comparison files live directly under `original/`. Locally owned disc images belong under `original/disc-images/`. The disc images and all extracted regional files are ignored except for the tracked `.gitkeep` placeholders. Do not commit proprietary originals or generated files from `out/`, assembler listings, logs, symbols, or generated label includes covered by `.gitignore`.

## Build Toolchain & Generated Files

Both build frontends change into `src/`, so assembly `include` and `incbin` paths are relative to that directory. Most 68000 programs use `bin/asm68k.exe`. The FM driver is the exception: it uses `bin/asw.exe` plus `bin/p2bin.exe` and mixes 68000 setup with Z80 source. `MakeSTM.exe` builds the opening movie stream, `dumpasmsym.exe` produces assembly label includes, and the checked-in `mkisofs.exe` constructs the ISO filesystem. The Linux frontend deliberately runs these pinned Windows executables through Wine or Proton instead of substituting native tools that might change byte output.

The build regenerates these ignored intermediates inside `src/`:

- `src/DA Garden/Track Title Labels.inc`
- `src/Special Stage/Stage Data.bin`
- `src/Special Stage/Stage Data Labels.inc`

Do not hand-edit or commit them. A missing generated include can be a consequence of an earlier assembler failure, so diagnose the first failing command or its adjacent `.log` file.

## Build, Test, and Development Commands

From a Windows command prompt at the repository root:

- `make.bat` assembles all supported programs, copies the selected region's original files, and creates `out/scdbuilt.iso`.
- `check.bat` compares each rebuilt binary byte-for-byte with its corresponding original using `fc /b`.

On Linux from the repository root:

- `./make.sh` runs the same checked-in toolchain through Wine or an automatically detected Steam Proton installation and creates `out/scdbuilt.iso`.
- `./check.sh` compares all rebuilt components with native `cmp`, prints an aggregate result, and returns nonzero if anything is missing or differs.
- Set `REGION=0`, `REGION=1`, or `REGION=2` in the environment for Japan, USA, or Europe, respectively; for example, `REGION=2 ./make.sh` followed by `REGION=2 ./check.sh`.
- Use `WINE_BIN` or `PROTON_BIN` when automatic runtime detection is insufficient. On Bazzite, invoke the Proton launcher through `make.sh`; the script uses Proton's `runinprefix` path so the checked-in tools run directly under the prepared prefix without starting Proton's built-in Steam bootstrap. Do not bypass the script with Proton's bundled `files/bin/wine`, because that skips the runner's prefix/environment setup. Proton compatibility data is kept under ignored `out/proton/`.
- The Linux frontend always runs Wine/Proton completely displayless (`HEADLESS_DESKTOP=1`): it launches each child with an allow-listed environment rather than inheriting the desktop/session environment, leaves display, VR-runtime, DBus, Vulkan, and GPU-offload variables absent, points XDG config/cache/data/state, `HOME`, and temporary paths at ignored `out/headless-*` directories, and uses a private ignored Wine prefix when Wine is selected. It sets software-only WineD3D with D3D/NVAPI paths disabled and copies the host Mesa `libGLX_mesa.so.0` into ignored `out/headless-glx/libGLX_nvidia.so.0`; this satisfies Proton's optional NVIDIA-DLL probe without loading the host NVIDIA GLX library. Proton may provision standard VR DLLs in its ignored prefix, but no host OpenVR configuration or runtime is supplied. No Windows GUI surface, Xwayland server, desktop window, GPU framebuffer, NVIDIA device, DBus session, or host shader cache may be created. `HEADLESS_DESKTOP=0` is rejected; the build fails closed instead of attaching a tool to the local desktop. Every child tool is also bounded by `SCDDISASM_TOOL_TIMEOUT_SECONDS` (default 120 seconds, maximum 300) and its process group is killed on timeout. If a tool requires a display or exceeds the bound, stop and report that prerequisite rather than weakening this safety invariant or using a compositor. Some large Quartz Quadrant assembler inputs currently do not terminate displaylessly even with `/q`; that is a tool limitation, not a reason to weaken this safety invariant.
- The checked-in build frontends pass asm68k's `/q` option, and the Linux runner forces `WINEDEBUG=-all` and `PROTON_LOG=0`. Keep `/q` on direct asm68k invocations as well: it suppresses the assembler's local information window, while the displayless environment prevents any fallback window from reaching the desktop. Direct Wine/Proton commands must use the same display-variable stripping, isolated XDG paths, private Mesa GLX shim, software-rendering, GPU-disable, direct-prefix runner, and timeout settings; do not run the build through `cage`, `gamescope`, Xwayland, or a GPU-backed compositor.

The Linux path was previously validated on Bazzite with Steam Proton Experimental for USA inside a private software compositor: that full build completed and all 51 component comparisons matched. The current displayless default is the safe path for automated work, but it has not yet completed the Quartz Quadrant assembler inputs that require a display. The final ISO itself is not a byte-comparison target because ISO filesystem metadata may differ even when every rebuilt component matches.

All build scripts default to USA (`REGION=1`). On Windows, change the local `REGION` value in both batch files to `0` for Japan or `2` for Europe. On Linux, prefer the environment variable and use the same value for both shell commands. A complete build requires the untracked/copyrighted source files described in `README.md` to be present under `original/<region>/`.

Keep `REGION` identical between the matching build/check commands. The numeric constants are `JAPAN=0`, `USA=1`, and `EUROPE=2`, as defined in `src/_Include/Common.inc`. If region values are changed only in the tracked batch files for local testing, restore both before committing. Use a fresh `out/` when switching regions because the builds create and overwrite outputs but do not clean the directory first.

The repository only tracks the common IP/SP originals and placeholder region directories. If `original/<region>/` lacks the copyrighted game files, first check for a locally supplied image under ignored `original/disc-images/`. A CHD can be unpacked to a temporary directory with `chdman extractcd`, its MODE1/2352 data track converted to an ISO with `bchunk`, and the ISO filesystem extracted into the matching region directory with `7z`. Do not download or commit proprietary game data. Before extraction, confirm the destination and disc image are ignored with `git check-ignore`; afterward, `git ls-files --others --exclude-standard original` must print nothing. If no local image or originals are available, report the missing prerequisite rather than treating it as a source regression.

## Coding Style & Naming Conventions

Match the surrounding assembly style: tabs align opcodes, operands, and trailing comments; labels use descriptive PascalCase (for example, `LevelStart`); routine-local labels begin with a dot (for example, `.FadeToBlack`). Use uppercase hexadecimal literals (`$FF`) and keep explanatory comments concise. Preserve established filenames with spaces and region/game identifiers such as `R11A__`.

This is a byte-exact reconstruction. Treat include order, `org`/`phase`, alignment and padding, table widths, branch sizes, and data ordering as observable output. Avoid cleanup refactors that alter layout unless the binary difference is intentional. Assembly dialect differs between the asm68k and AS sound-driver sources, so copy syntax from the relevant subsystem rather than normalizing it globally. C# SonLVL definitions use tabs, PascalCase types and members, existing namespace patterns, and paths relative to `src/_SonLVL/`.

## Testing Guidelines

There is no unit-test framework or stated coverage target. After assembly or binary-data changes, run the platform-appropriate full build, confirm there are no assembler errors in generated `.log` files, then run the matching check script with the same region. Expected output is successful binary comparison for every rebuilt component. Inspect the complete `fc /b` output on Windows because `check.bat` does not summarize the run; `check.sh` does provide an aggregate exit status. Neither script compares the final ISO itself. If a deliberate byte-level difference is introduced, document the affected binary, offsets if useful, and reason in the pull request.

For documentation, IDA, SonLVL, or editor-only changes, run the narrowest relevant validation and explicitly state that the ISO build/comparison was not applicable or could not run. Before handing off any change, inspect `git status --short` and ensure ignored build products, proprietary originals, and temporary region edits are absent from the commit. When originals or disc images were handled, also run `git ls-files --others --exclude-standard original` and require empty output.

## Commit & Pull Request Guidelines

Recent history uses short, imperative subjects such as `Add link to source code of MakeSTM` and `Rename ".i" files to ".inc"`. Keep each commit focused and avoid checking in build products or proprietary originals. Pull requests should summarize the subsystem changed, state the tested region, list build/comparison results, and link relevant issues. Include screenshots only for visible gameplay or SonLVL changes.
