#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
REGION=${REGION:-1}
OUTPUT=${OUTPUT:-scdbuilt.iso}
TOOL_TIMEOUT_SECONDS=${SCDDISASM_TOOL_TIMEOUT_SECONDS:-120}
HEADLESS_CONFIG_DIR="$ROOT_DIR/out/headless-config"
HEADLESS_CACHE_DIR="$ROOT_DIR/out/headless-cache"
HEADLESS_DATA_DIR="$ROOT_DIR/out/headless-data"
HEADLESS_STATE_DIR="$ROOT_DIR/out/headless-state"
HEADLESS_RUNTIME_DIR="$ROOT_DIR/out/headless-runtime"
HEADLESS_GLX_DIR="$ROOT_DIR/out/headless-glx"
HEADLESS_HOME_DIR="$ROOT_DIR/out/headless-home"
HEADLESS_TEMP_DIR="$ROOT_DIR/out/headless-tmp"
HEADLESS_WINE_PREFIX="$ROOT_DIR/out/headless-wine"
HEADLESS_GLX_LIBRARY="$HEADLESS_GLX_DIR/libGLX_nvidia.so.0"
HEADLESS_LOCK_FILE="$ROOT_DIR/out/headless-build.lock"

if ! [[ $TOOL_TIMEOUT_SECONDS =~ ^[1-9][0-9]*$ ]] || (( TOOL_TIMEOUT_SECONDS > 300 )); then
	echo "Invalid SCDDISASM_TOOL_TIMEOUT_SECONDS '$TOOL_TIMEOUT_SECONDS' (expected 1-300)." >&2
	exit 2
fi
if ! command -v timeout >/dev/null 2>&1; then
	echo 'The Linux build requires the timeout command to enforce its headless process bound.' >&2
	exit 1
fi
if ! command -v flock >/dev/null 2>&1; then
	echo 'The Linux build requires flock to prevent concurrent headless Wine prefixes.' >&2
	exit 1
fi

case "$REGION" in
	0)
		REGION_DIR=japan
		FMV_WAV='FMV\Data\Opening (Japan, Europe).wav'
		;;
	1)
		REGION_DIR=usa
		FMV_WAV='FMV\Data\Opening (USA).wav'
		;;
	2)
		REGION_DIR=europe
		FMV_WAV='FMV\Data\Opening (Japan, Europe).wav'
		;;
	*)
		echo "Invalid REGION '$REGION' (expected 0 for Japan, 1 for USA, or 2 for Europe)." >&2
		exit 2
		;;
esac

RUNNER=wine
PROTON_ROOT=
WINE_SERVER_BIN=
if [[ -n ${WINE_BIN:-} ]]; then
	if ! command -v "$WINE_BIN" >/dev/null 2>&1; then
		echo "WINE_BIN '$WINE_BIN' was not found." >&2
		exit 1
	fi
elif command -v wine >/dev/null 2>&1; then
	WINE_BIN=wine
elif command -v wine64 >/dev/null 2>&1; then
	WINE_BIN=wine64
else
	RUNNER=proton
	STEAM_ROOT=${STEAM_ROOT:-"$HOME/.local/share/Steam"}
	if [[ -n ${PROTON_BIN:-} ]]; then
		if [[ ! -x $PROTON_BIN ]]; then
			echo "PROTON_BIN '$PROTON_BIN' is not executable." >&2
			exit 1
		fi
	else
		for candidate in \
			"$STEAM_ROOT/steamapps/common/Proton - Experimental/proton" \
			"$STEAM_ROOT/steamapps/common/Proton 11.0/proton" \
			"$STEAM_ROOT/steamapps/common/Proton Hotfix/proton"; do
			if [[ -x $candidate ]]; then
				PROTON_BIN=$candidate
				break
			fi
		done
	fi
	if [[ -z ${PROTON_BIN:-} ]]; then
		echo 'Wine or Steam Proton is required to run the checked-in Windows build tools.' >&2
		exit 1
	fi
	PROTON_ROOT=$(CDPATH= cd -- "$(dirname -- "$PROTON_BIN")" && pwd)
	# Keep Proton's prefix inside the ignored repository output tree. An
	# externally supplied prefix may contain a desktop shell, VR configuration,
	# or a wineserver shared with unrelated applications.
	PROTON_COMPAT_DATA_PATH="$ROOT_DIR/out/proton"
fi

# A native Wine installation provides wineserver beside wine/wine64. Resolve
# it before entering the allow-listed child environment.
if [[ $RUNNER == wine ]]; then
	WINE_SERVER_BIN=$(command -v wineserver || true)
fi

ORIGINAL_DIR="$ROOT_DIR/original/$REGION_DIR"
FMV_STREAM_DIR=${FMV_STREAM_DIR:-$ORIGINAL_DIR}
if [[ $FMV_STREAM_DIR != /* ]]; then
	FMV_STREAM_DIR="$ROOT_DIR/$FMV_STREAM_DIR"
fi
ISO_METADATA_DIR=${ISO_METADATA_DIR:-$ORIGINAL_DIR}
if [[ $ISO_METADATA_DIR != /* ]]; then
	ISO_METADATA_DIR="$ROOT_DIR/$ISO_METADATA_DIR"
fi
for file in BADEND.STM GOODEND.STM PTEST.STM; do
	if [[ ! -f $FMV_STREAM_DIR/$file ]]; then
		echo "Missing externally supplied FMV stream: $FMV_STREAM_DIR/$file" >&2
		echo 'See README.md for the required media inputs.' >&2
		exit 1
	fi
done
if [[ $REGION == 1 ]]; then
	if ! command -v python3 >/dev/null 2>&1; then
		echo 'Python 3 is required to construct the byte-exact USA ISO filesystem.' >&2
		exit 1
	fi
	for file in ABS.TXT BIB.TXT CPY.TXT; do
		if [[ ! -f $ISO_METADATA_DIR/$file ]]; then
			echo "Missing externally supplied ISO metadata file: $ISO_METADATA_DIR/$file" >&2
			echo 'See README.md for the required ISO inputs.' >&2
			exit 1
		fi
	done
fi
if [[ $REGION != 1 ]]; then
	for file in ATTACK.MMD BRAMMAIN.MMD COME__.MMD ENDING.MMD PTEST.MMD THANKS_D.BIN THANKS_M.MMD; do
		if [[ ! -f $ORIGINAL_DIR/$file ]]; then
			echo "Missing regional executable input: $ORIGINAL_DIR/$file" >&2
			echo 'See README.md for the remaining non-USA reconstruction requirements.' >&2
			exit 1
		fi
	done
fi

# The checked-in Windows tools are console programs, but asm68k can create a
# Win32 information window. Never let a build attach to the user's desktop.
if [[ ${HEADLESS_DESKTOP:-1} != 1 ]]; then
	echo 'HEADLESS_DESKTOP=0 is disabled; the Linux build must remain displayless.' >&2
	exit 2
fi

# Proton's launcher probes libGLX_nvidia.so.0 even when WineD3D and NVAPI are
# disabled. Give that probe a private Mesa implementation instead, so neither
# the launcher nor a child tool can open the host NVIDIA device or shader cache.
MESA_GLX_LIBRARY=
if command -v ldconfig >/dev/null 2>&1; then
	MESA_GLX_LIBRARY=$(ldconfig -p 2>/dev/null | awk '$1 == "libGLX_mesa.so.0" {print $NF; exit}' || true)
fi
if [[ -z $MESA_GLX_LIBRARY ]]; then
	for candidate in \
		/usr/lib64/libGLX_mesa.so.0 \
		/usr/lib/x86_64-linux-gnu/libGLX_mesa.so.0 \
		/usr/lib/libGLX_mesa.so.0 \
		/lib64/libGLX_mesa.so.0 \
		/lib/x86_64-linux-gnu/libGLX_mesa.so.0 \
		/lib/libGLX_mesa.so.0; do
		if [[ -r $candidate ]]; then
			MESA_GLX_LIBRARY=$candidate
			break
		fi
	done
fi
if [[ -z $MESA_GLX_LIBRARY || ! -r $MESA_GLX_LIBRARY ]]; then
	echo 'A Mesa libGLX_mesa.so.0 is required to keep the Linux build GPU-free.' >&2
	exit 1
fi
mkdir -p "$HEADLESS_CONFIG_DIR" "$HEADLESS_CACHE_DIR" "$HEADLESS_DATA_DIR" \
	"$HEADLESS_STATE_DIR" "$HEADLESS_RUNTIME_DIR" "$HEADLESS_GLX_DIR" "$HEADLESS_HOME_DIR" \
	"$HEADLESS_TEMP_DIR"
cp -f -- "$MESA_GLX_LIBRARY" "$HEADLESS_GLX_LIBRARY"
# Use an allow-list rather than subtracting a known set of desktop variables.
# This keeps DBus, XDG_RUNTIME_DIR, host shader caches, and future session/GPU
# variables from reaching Wine or Proton. The child also gets a private home,
# temporary directory, and (for Wine) prefix, so it cannot touch the user's
# GUI/runtime state even if a tool tries to initialize it.
HEADLESS_ENV=(
	env
	-i
	"PATH=$PATH"
	"HOME=$HEADLESS_HOME_DIR"
	"LANG=${LANG:-C}"
	"LC_ALL=${LC_ALL:-C}"
	"TMPDIR=$HEADLESS_TEMP_DIR"
	"TMP=$HEADLESS_TEMP_DIR"
	"TEMP=$HEADLESS_TEMP_DIR"
	"REGION=$REGION"
	"OUTPUT=$OUTPUT"
	"FMV_STREAM_DIR=$FMV_STREAM_DIR"
	"SCDDISASM_TOOL_TIMEOUT_SECONDS=$TOOL_TIMEOUT_SECONDS"
	"HEADLESS_DESKTOP=1"
	XDG_CONFIG_HOME="$HEADLESS_CONFIG_DIR"
	XDG_CACHE_HOME="$HEADLESS_CACHE_DIR"
	XDG_DATA_HOME="$HEADLESS_DATA_DIR"
	XDG_STATE_HOME="$HEADLESS_STATE_DIR"
	XDG_RUNTIME_DIR="$HEADLESS_RUNTIME_DIR"
	LD_LIBRARY_PATH="$HEADLESS_GLX_DIR"
	LIBGL_ALWAYS_SOFTWARE=1
	MESA_LOADER_DRIVER_OVERRIDE=llvmpipe
	PROTON_USE_WINED3D=1
	PROTON_NO_D3D11=1
	PROTON_NO_D3D10=1
	PROTON_DISABLE_NVAPI=1
	PROTON_HIDE_NVIDIA_GPU=1
	WINE_HIDE_NVIDIA_GPU=1
	PROTON_USE_XALIA=0
	WINE_DISABLE_VULKAN_OPWR=1
	DXVK_ENABLE_NVAPI=0
	WINEDLLOVERRIDES='winex11.drv=d;winewayland.drv=d'
	NO_AT_BRIDGE=1
	WINEDEBUG=-all
	PROTON_LOG=0
	SCDDISASM_HEADLESS=1
)
if [[ $RUNNER == proton ]]; then
	HEADLESS_ENV+=(
		"PROTON_BIN=$PROTON_BIN"
		"STEAM_ROOT=$STEAM_ROOT"
		"PROTON_COMPAT_DATA_PATH=$PROTON_COMPAT_DATA_PATH"
		"WINEPREFIX=$PROTON_COMPAT_DATA_PATH/pfx"
	)
else
	HEADLESS_ENV+=(
		"WINE_BIN=$WINE_BIN"
		"WINEPREFIX=$HEADLESS_WINE_PREFIX"
	)
fi
if [[ ${SCDDISASM_HEADLESS:-0} != 1 ]]; then
	exec "${HEADLESS_ENV[@]}" "$ROOT_DIR/make.sh" "$@"
fi

# Wine keeps a server process alive after a console tool exits. Do not leave
# one attached to the build prefix: it can retain runtime resources and, on
# some desktop configurations, outlive the terminal that launched the build.
stop_runtime() {
	if [[ $RUNNER == proton ]]; then
		if [[ -x $PROTON_ROOT/files/bin/wineserver ]]; then
			timeout --kill-after=2s 5s \
				"${HEADLESS_ENV[@]}" \
				"WINEPREFIX=$PROTON_COMPAT_DATA_PATH/pfx" \
				"$PROTON_ROOT/files/bin/wineserver" -k >/dev/null 2>&1 || true
		fi
	elif [[ -n $WINE_SERVER_BIN ]]; then
		timeout --kill-after=2s 5s \
			"${HEADLESS_ENV[@]}" "$WINE_SERVER_BIN" -k >/dev/null 2>&1 || true
	fi
	return 0
}

cleanup_runtime() {
	local status=$?
	trap - EXIT
	stop_runtime
	exit "$status"
}

mkdir -p "$ROOT_DIR/out" "$ROOT_DIR/out/files" "$ROOT_DIR/out/misc"
exec 9>"$HEADLESS_LOCK_FILE"
if ! flock -n 9; then
	echo 'Another headless Linux build is already using the private Wine prefix.' >&2
	exit 1
fi
trap cleanup_runtime EXIT
# A terminal can be killed before the EXIT trap runs. Once this build owns the
# lock, clear any private server left behind by that earlier invocation.
stop_runtime

# Keep proprietary input limited to the runtime files that still have no
# source-backed build step. Every reconstructed component must be regenerated
# into a clean output directory instead of being inherited from the original.
find "$ROOT_DIR/out/files" -mindepth 1 -maxdepth 1 -type f -delete
for file in BADEND.STM GOODEND.STM PTEST.STM; do
	cp "$FMV_STREAM_DIR/$file" "$ROOT_DIR/out/files/$file"
done
if [[ $REGION == 1 ]]; then
	for file in ABS.TXT BIB.TXT CPY.TXT; do
		cp "$ISO_METADATA_DIR/$file" "$ROOT_DIR/out/files/$file"
	done
fi
if [[ $REGION != 1 ]]; then
	for file in ATTACK.MMD BRAMMAIN.MMD COME__.MMD ENDING.MMD PTEST.MMD THANKS_D.BIN THANKS_M.MMD; do
		cp "$ORIGINAL_DIR/$file" "$ROOT_DIR/out/files/$file"
	done
fi

run_tool() {
	local status=0
	if [[ $RUNNER == proton ]]; then
		mkdir -p "$PROTON_COMPAT_DATA_PATH"
		timeout --kill-after=5s "${TOOL_TIMEOUT_SECONDS}s" \
			"${HEADLESS_ENV[@]}" \
			STEAM_COMPAT_DATA_PATH="$PROTON_COMPAT_DATA_PATH" \
			STEAM_COMPAT_CLIENT_INSTALL_PATH="$STEAM_ROOT" \
			"$PROTON_BIN" runinprefix "$@" || status=$?
	else
		timeout --kill-after=5s "${TOOL_TIMEOUT_SECONDS}s" \
			"${HEADLESS_ENV[@]}" "$WINE_BIN" "$@" || status=$?
	fi
	# Stop the private server after every tool, not only when the complete build
	# exits. A failed or GUI-capable child must not keep a Wine process alive
	# while later build steps run or after a terminal closes.
	stop_runtime
	if (( status == 0 )); then
		return 0
	fi
	if [[ $status == 124 || $status == 137 ]]; then
		echo "Headless tool timed out after ${TOOL_TIMEOUT_SECONDS}s: $*" >&2
	fi
	return "$status"
}

assemble() {
	local source=$1 output=$2 listing=$3
	shift 3
	run_tool "$ROOT_DIR/bin/asm68k.exe" /q /p /o 'ae-,l.,ow+' /e "REGION=$REGION" "$@" \
		"$source," "$output," , "$listing"
}

assemble_symbols() {
	local source=$1 output=$2 symbols=$3
	run_tool "$ROOT_DIR/bin/asm68k.exe" /q /p /o 'ae-,l.,ow+' /e "REGION=$REGION" \
		"$source," "$output," "$symbols"
}

cd "$ROOT_DIR/src"

rm -f 'Sound Drivers/FM/_Driver.p'
run_tool "$ROOT_DIR/bin/asw.exe" -q -xx -n -A -L -U -E -i . 'Sound Drivers\FM\_Driver.asm'
if [[ ! -f 'Sound Drivers/FM/_Driver.p' ]]; then
	echo 'FM sound driver failed to build. See "Sound Drivers/FM/_Driver.log" for more information.' >&2
	exit 1
fi
run_tool "$ROOT_DIR/bin/p2bin.exe" 'Sound Drivers\FM\_Driver.p' '..\out\misc\fm_driver.bin'
rm -f 'Sound Drivers/FM/_Driver.p'

assemble_symbols 'DA Garden\Track Titles.asm' '..\out\files\PLANET_D.BIN' 'DA Garden\Track Titles.sym'
run_tool "$ROOT_DIR/bin/dumpasmsym.exe" -m asm 'DA Garden\Track Titles.sym' -o 'DA Garden\Track Title Labels.inc'
rm -f 'DA Garden/Track Titles.sym'
assemble 'DA Garden\Main.asm' '..\out\files\PLANET_M.MMD' 'DA Garden\Main.lst'
assemble 'DA Garden\Sub.asm' '..\out\files\PLANET_S.BIN' 'DA Garden\Sub.lst'

assemble 'CD Initial Program\IP.asm' '..\out\misc\ip.bin' 'CD Initial Program\IP.lst'
assemble 'CD Initial Program\IPX.asm' '..\out\files\IPX___.MMD' 'CD Initial Program\IPX.lst'
assemble 'CD System Program\SP.asm' '..\out\misc\sp.bin' 'CD System Program\SP.lst'
assemble 'CD System Program\SPX.asm' '..\out\files\SPX___.BIN' 'CD System Program\SPX.lst'
assemble 'Backup RAM\Initialization\Main.asm' '..\out\files\BRAMINIT.MMD' 'Backup RAM\Initialization\Main.lst'
if [[ $REGION == 1 ]]; then
	assemble 'Backup RAM\Main.asm' '..\out\files\BRAMMAIN.MMD' 'Backup RAM\Main.lst'
fi
assemble 'Backup RAM\Sub.asm' '..\out\files\BRAMSUB.BIN' 'Backup RAM\Sub.lst'
assemble 'Mega Drive Init\Main.asm' '..\out\files\MDINIT.MMD' 'Mega Drive Init\Main.lst'
assemble 'Time Warp Cutscene\Main.asm' '..\out\files\WARP__.MMD' 'Time Warp Cutscene\Main.lst'

assemble 'Sound Drivers\PCM\Palmtree Panic.asm' '..\out\files\SNCBNK1B.BIN' 'Sound Drivers\PCM\Palmtree Panic.lst'
assemble 'Sound Drivers\PCM\Collision Chaos.asm' '..\out\files\SNCBNK3B.BIN' 'Sound Drivers\PCM\Collision Chaos.lst'
assemble 'Sound Drivers\PCM\Tidal Tempest.asm' '..\out\files\SNCBNK4B.BIN' 'Sound Drivers\PCM\Tidal Tempest.lst'
assemble 'Sound Drivers\PCM\Quartz Quadrant.asm' '..\out\files\SNCBNK5B.BIN' 'Sound Drivers\PCM\Quartz Quadrant.lst'
assemble 'Sound Drivers\PCM\Wacky Workbench.asm' '..\out\files\SNCBNK6B.BIN' 'Sound Drivers\PCM\Wacky Workbench.lst'
assemble 'Sound Drivers\PCM\Stardust Speedway.asm' '..\out\files\SNCBNK7B.BIN' 'Sound Drivers\PCM\Stardust Speedway.lst'
assemble 'Sound Drivers\PCM\Metallic Madness.asm' '..\out\files\SNCBNK8B.BIN' 'Sound Drivers\PCM\Metallic Madness.lst'
assemble 'Sound Drivers\PCM\Boss.asm' '..\out\files\SNCBNKB1.BIN' 'Sound Drivers\PCM\Boss.lst'
assemble 'Sound Drivers\PCM\Final Boss.asm' '..\out\files\SNCBNKB2.BIN' 'Sound Drivers\PCM\Final Boss.lst'

assemble 'Title Screen\Main.asm' '..\out\files\TITLEM.MMD' 'Title Screen\Main.lst'
assemble 'Title Screen\Sub.asm' '..\out\files\TITLES.BIN' 'Title Screen\Sub.lst'
assemble 'Title Screen\Secrets\Sound Test.asm' '..\out\files\SOSEL_.MMD' 'Title Screen\Secrets\Sound Test.lst' /e PROTOTYPE=0 /e H32=0
assemble 'Title Screen\Secrets\Stage Select.asm' '..\out\files\STSEL_.MMD' 'Title Screen\Secrets\Stage Select.lst' /e PROTOTYPE=0 /e H32=0
assemble 'Title Screen\Secrets\Best Staff Times.asm' '..\out\files\DUMMY4.MMD' 'Title Screen\Secrets\Best Staff Times.lst' /e PROTOTYPE=0 /e H32=1
assemble 'Title Screen\Secrets\Special Stage 8 Credits.asm' '..\out\files\SPEEND.MMD' 'Title Screen\Secrets\Special Stage 8 Credits.lst' /e PROTOTYPE=0 /e H32=0

rm -f "$ROOT_DIR/out/files/DUMMY5.MMD"
assemble 'Title Screen\Secrets\Sound Test (Prototype).asm' '..\out\files\DUMMY5.MMD' 'Title Screen\Secrets\Sound Test (Prototype).lst' /e PROTOTYPE=1 /e H32=0
for copy in DUMMY6.MMD DUMMY7.MMD DUMMY8.MMD DUMMY9.MMD; do
	cp "$ROOT_DIR/out/files/DUMMY5.MMD" "$ROOT_DIR/out/files/$copy"
done

assemble 'Title Screen\Secrets\Sound Test Image.asm' '..\out\files\NISI.MMD' 'Title Screen\Secrets\Sound Test Image (Fun Is Infinite).lst' /e PROTOTYPE=0 /e H32=0 /e EASTEREGG=0
assemble 'Title Screen\Secrets\Sound Test Image.asm' '..\out\files\DUMMY0.MMD' 'Title Screen\Secrets\Sound Test Image (M.C. Sonic).lst' /e PROTOTYPE=0 /e H32=0 /e EASTEREGG=1
assemble 'Title Screen\Secrets\Sound Test Image.asm' '..\out\files\DUMMY1.MMD' 'Title Screen\Secrets\Sound Test Image (Tails).lst' /e PROTOTYPE=0 /e H32=0 /e EASTEREGG=2
assemble 'Title Screen\Secrets\Sound Test Image.asm' '..\out\files\DUMMY2.MMD' 'Title Screen\Secrets\Sound Test Image (Batman).lst' /e PROTOTYPE=0 /e H32=0 /e EASTEREGG=3
assemble 'Title Screen\Secrets\Sound Test Image.asm' '..\out\files\DUMMY3.MMD' 'Title Screen\Secrets\Sound Test Image (Cute Sonic).lst' /e PROTOTYPE=0 /e H32=0 /e EASTEREGG=4

assemble 'Time Attack\Sub.asm' '..\out\files\ATTACK.BIN' 'Time Attack\Sub.lst'
assemble 'Thank You\Sub.asm' '..\out\files\THANKS_S.BIN' 'Thank You\Sub.lst'
if [[ $REGION == 1 ]]; then
	assemble 'Time Attack\Main.asm' '..\out\files\ATTACK.MMD' 'Time Attack\Main.lst'
	assemble 'Thank You\Main.asm' '..\out\files\THANKS_M.MMD' 'Thank You\Main.lst'
	assemble 'Thank You\Data.asm' '..\out\files\THANKS_D.BIN' 'Thank You\Data.lst'
	assemble 'Comin Soon\Main.asm' '..\out\files\COME__.MMD' 'Comin Soon\Main.lst'
	assemble 'FMV\Main (Pencil Test).asm' '..\out\files\PTEST.MMD' 'FMV\Main (Pencil Test).lst'
	assemble 'FMV\Main (Ending).asm' '..\out\files\ENDING.MMD' 'FMV\Main (Ending).lst'
fi

assemble 'FMV\Main (Opening).asm' '..\out\files\OPEN_M.MMD' 'FMV\Main (Opening).lst'
assemble 'FMV\Sub (Opening).asm' '..\out\files\OPEN_S.BIN' 'FMV\Sub (Opening).lst'
assemble 'FMV\Sub (Ending).asm' '..\out\files\GOODEND.BIN' 'FMV\Sub (Good Ending).lst' /e DATAFILE=0
assemble 'FMV\Sub (Ending).asm' '..\out\files\BADEND.BIN' 'FMV\Sub (Bad Ending).lst' /e DATAFILE=1
assemble 'FMV\Sub (Pencil Test).asm' '..\out\files\PTEST.BIN' 'FMV\Sub (Pencil Test).lst'

echo 'Making opening FMV STM...'
run_tool "$ROOT_DIR/bin/MakeSTM.exe" 'FMV\Data\Opening.gif' "$FMV_WAV" 0 0 '..\out\files\OPN.STM'

assemble 'Visual Mode\Main.asm' '..\out\files\VM____.MMD' 'Visual Mode\Main.lst'

assemble 'Level\Palmtree Panic\Act 1 Present.asm' '..\out\files\R11A__.MMD' 'Level\Palmtree Panic\Act 1 Present.lst' /e DEMO=0
assemble 'Level\Palmtree Panic\Act 2 Present.asm' '..\out\files\R12A__.MMD' 'Level\Palmtree Panic\Act 2 Present.lst' /e DEMO=0
assemble 'Level\Palmtree Panic\Act 2 Past.asm' '..\out\files\R12B__.MMD' 'Level\Palmtree Panic\Act 2 Past.lst' /e DEMO=0
assemble 'Level\Palmtree Panic\Act 2 Good Future.asm' '..\out\files\R12C__.MMD' 'Level\Palmtree Panic\Act 2 Good Future.lst' /e DEMO=0
assemble 'Level\Palmtree Panic\Act 2 Bad Future.asm' '..\out\files\R12D__.MMD' 'Level\Palmtree Panic\Act 2 Bad Future.lst' /e DEMO=0
assemble 'Level\Palmtree Panic\Act 3 Good Future.asm' '..\out\files\R13C__.MMD' 'Level\Palmtree Panic\Act 3 Good Future.lst' /e DEMO=0
assemble 'Level\Palmtree Panic\Act 3 Bad Future.asm' '..\out\files\R13D__.MMD' 'Level\Palmtree Panic\Act 3 Bad Future.lst' /e DEMO=0
assemble 'Level\Palmtree Panic\Act 1 Present.asm' '..\out\files\DEMO11A.MMD' 'Level\Palmtree Panic\Act 1 Present (Demo).lst' /e DEMO=1
assemble 'Level\Palmtree Panic\Act 1 Past.asm' '..\out\files\R11B__.MMD' 'Level\Palmtree Panic\Act 1 Past.lst' /e DEMO=0
assemble 'Level\Palmtree Panic\Act 1 Good Future.asm' '..\out\files\R11C__.MMD' 'Level\Palmtree Panic\Act 1 Good Future.lst' /e DEMO=0
assemble 'Level\Palmtree Panic\Act 1 Bad Future.asm' '..\out\files\R11D__.MMD' 'Level\Palmtree Panic\Act 1 Bad Future.lst' /e DEMO=0
assemble 'Level\Wacky Workbench\Act 1 Present.asm' '..\out\files\R61A__.MMD' 'Level\Wacky Workbench\Act 1 Present.lst' /e DEMO=0
assemble 'Level\Wacky Workbench\Act 1 Past.asm' '..\out\files\R61B__.MMD' 'Level\Wacky Workbench\Act 1 Past.lst' /e DEMO=0
assemble 'Level\Wacky Workbench\Act 1 Good Future.asm' '..\out\files\R61C__.MMD' 'Level\Wacky Workbench\Act 1 Good Future.lst' /e DEMO=0
assemble 'Level\Wacky Workbench\Act 1 Bad Future.asm' '..\out\files\R61D__.MMD' 'Level\Wacky Workbench\Act 1 Bad Future.lst' /e DEMO=0
assemble 'Level\Wacky Workbench\Act 2 Present.asm' '..\out\files\R62A__.MMD' 'Level\Wacky Workbench\Act 2 Present.lst' /e DEMO=0
assemble 'Level\Wacky Workbench\Act 2 Past.asm' '..\out\files\R62B__.MMD' 'Level\Wacky Workbench\Act 2 Past.lst' /e DEMO=0
assemble 'Level\Wacky Workbench\Act 2 Good Future.asm' '..\out\files\R62C__.MMD' 'Level\Wacky Workbench\Act 2 Good Future.lst' /e DEMO=0
assemble 'Level\Wacky Workbench\Act 2 Bad Future.asm' '..\out\files\R62D__.MMD' 'Level\Wacky Workbench\Act 2 Bad Future.lst' /e DEMO=0
assemble 'Level\Wacky Workbench\Act 3 Good Future.asm' '..\out\files\R63C__.MMD' 'Level\Wacky Workbench\Act 3 Good Future.lst' /e DEMO=0
assemble 'Level\Wacky Workbench\Act 3 Bad Future.asm' '..\out\files\R63D__.MMD' 'Level\Wacky Workbench\Act 3 Bad Future.lst' /e DEMO=0
assemble 'Level\Collision Chaos\Act 1 Present.asm' '..\out\files\R31A__.MMD' 'Level\Collision Chaos\Act 1 Present.lst' /e DEMO=0
assemble 'Level\Collision Chaos\Act 1 Past.asm' '..\out\files\R31B__.MMD' 'Level\Collision Chaos\Act 1 Past.lst' /e DEMO=0
assemble 'Level\Collision Chaos\Act 1 Good Future.asm' '..\out\files\R31C__.MMD' 'Level\Collision Chaos\Act 1 Good Future.lst' /e DEMO=0
assemble 'Level\Collision Chaos\Act 1 Bad Future.asm' '..\out\files\R31D__.MMD' 'Level\Collision Chaos\Act 1 Bad Future.lst' /e DEMO=0
assemble 'Level\Collision Chaos\Act 2 Present.asm' '..\out\files\R32A__.MMD' 'Level\Collision Chaos\Act 2 Present.lst' /e DEMO=0
assemble 'Level\Collision Chaos\Act 2 Past.asm' '..\out\files\R32B__.MMD' 'Level\Collision Chaos\Act 2 Past.lst' /e DEMO=0
assemble 'Level\Collision Chaos\Act 2 Good Future.asm' '..\out\files\R32C__.MMD' 'Level\Collision Chaos\Act 2 Good Future.lst' /e DEMO=0
assemble 'Level\Collision Chaos\Act 2 Bad Future.asm' '..\out\files\R32D__.MMD' 'Level\Collision Chaos\Act 2 Bad Future.lst' /e DEMO=0
assemble 'Level\Collision Chaos\Act 3 Good Future.asm' '..\out\files\R33C__.MMD' 'Level\Collision Chaos\Act 3 Good Future.lst' /e DEMO=0
assemble 'Level\Collision Chaos\Act 3 Bad Future.asm' '..\out\files\R33D__.MMD' 'Level\Collision Chaos\Act 3 Bad Future.lst' /e DEMO=0
assemble 'Level\Tidal Tempest\Act 1 Present.asm' '..\out\files\R41A__.MMD' 'Level\Tidal Tempest\Act 1 Present.lst' /e DEMO=0
assemble 'Level\Tidal Tempest\Act 1 Past.asm' '..\out\files\R41B__.MMD' 'Level\Tidal Tempest\Act 1 Past.lst' /e DEMO=0
assemble 'Level\Tidal Tempest\Act 1 Good Future.asm' '..\out\files\R41C__.MMD' 'Level\Tidal Tempest\Act 1 Good Future.lst' /e DEMO=0
assemble 'Level\Tidal Tempest\Act 1 Bad Future.asm' '..\out\files\R41D__.MMD' 'Level\Tidal Tempest\Act 1 Bad Future.lst' /e DEMO=0
assemble 'Level\Tidal Tempest\Act 2 Present.asm' '..\out\files\R42A__.MMD' 'Level\Tidal Tempest\Act 2 Present.lst' /e DEMO=0
assemble 'Level\Tidal Tempest\Act 2 Past.asm' '..\out\files\R42B__.MMD' 'Level\Tidal Tempest\Act 2 Past.lst' /e DEMO=0
assemble 'Level\Tidal Tempest\Act 2 Good Future.asm' '..\out\files\R42C__.MMD' 'Level\Tidal Tempest\Act 2 Good Future.lst' /e DEMO=0
assemble 'Level\Tidal Tempest\Act 2 Bad Future.asm' '..\out\files\R42D__.MMD' 'Level\Tidal Tempest\Act 2 Bad Future.lst' /e DEMO=0
assemble 'Level\Tidal Tempest\Act 3 Good Future.asm' '..\out\files\R43C__.MMD' 'Level\Tidal Tempest\Act 3 Good Future.lst' /e DEMO=0
assemble 'Level\Tidal Tempest\Act 3 Bad Future.asm' '..\out\files\R43D__.MMD' 'Level\Tidal Tempest\Act 3 Bad Future.lst' /e DEMO=0
assemble 'Level\Tidal Tempest\Act 3 Good Future.asm' '..\out\files\DEMO43C.MMD' 'Level\Tidal Tempest\Act 3 Good Future (Demo).lst' /e DEMO=1
assemble 'Level\Quartz Quadrant\Act 1 Present.asm' '..\out\files\R51A__.MMD' 'Level\Quartz Quadrant\Act 1 Present.lst' /e DEMO=0
assemble 'Level\Quartz Quadrant\Act 1 Past.asm' '..\out\files\R51B__.MMD' 'Level\Quartz Quadrant\Act 1 Past.lst' /e DEMO=0
assemble 'Level\Quartz Quadrant\Act 1 Good Future.asm' '..\out\files\R51C__.MMD' 'Level\Quartz Quadrant\Act 1 Good Future.lst' /e DEMO=0
assemble 'Level\Quartz Quadrant\Act 1 Bad Future.asm' '..\out\files\R51D__.MMD' 'Level\Quartz Quadrant\Act 1 Bad Future.lst' /e DEMO=0
assemble 'Level\Quartz Quadrant\Act 2 Present.asm' '..\out\files\R52A__.MMD' 'Level\Quartz Quadrant\Act 2 Present.lst' /e DEMO=0
assemble 'Level\Quartz Quadrant\Act 2 Past.asm' '..\out\files\R52B__.MMD' 'Level\Quartz Quadrant\Act 2 Past.lst' /e DEMO=0
assemble 'Level\Quartz Quadrant\Act 2 Good Future.asm' '..\out\files\R52C__.MMD' 'Level\Quartz Quadrant\Act 2 Good Future.lst' /e DEMO=0
assemble 'Level\Quartz Quadrant\Act 2 Bad Future.asm' '..\out\files\R52D__.MMD' 'Level\Quartz Quadrant\Act 2 Bad Future.lst' /e DEMO=0
assemble 'Level\Quartz Quadrant\Act 3 Good Future.asm' '..\out\files\R53C__.MMD' 'Level\Quartz Quadrant\Act 3 Good Future.lst' /e DEMO=0
assemble 'Level\Quartz Quadrant\Act 3 Bad Future.asm' '..\out\files\R53D__.MMD' 'Level\Quartz Quadrant\Act 3 Bad Future.lst' /e DEMO=0
assemble 'Level\Stardust Speedway\Act 1 Present.asm' '..\out\files\R71A__.MMD' 'Level\Stardust Speedway\Act 1 Present.lst' /e DEMO=0
assemble 'Level\Stardust Speedway\Act 1 Past.asm' '..\out\files\R71B__.MMD' 'Level\Stardust Speedway\Act 1 Past.lst' /e DEMO=0
assemble 'Level\Stardust Speedway\Act 1 Good Future.asm' '..\out\files\R71C__.MMD' 'Level\Stardust Speedway\Act 1 Good Future.lst' /e DEMO=0
assemble 'Level\Stardust Speedway\Act 1 Bad Future.asm' '..\out\files\R71D__.MMD' 'Level\Stardust Speedway\Act 1 Bad Future.lst' /e DEMO=0
assemble 'Level\Stardust Speedway\Act 2 Present.asm' '..\out\files\R72A__.MMD' 'Level\Stardust Speedway\Act 2 Present.lst' /e DEMO=0
assemble 'Level\Stardust Speedway\Act 2 Past.asm' '..\out\files\R72B__.MMD' 'Level\Stardust Speedway\Act 2 Past.lst' /e DEMO=0
assemble 'Level\Stardust Speedway\Act 2 Good Future.asm' '..\out\files\R72C__.MMD' 'Level\Stardust Speedway\Act 2 Good Future.lst' /e DEMO=0
assemble 'Level\Stardust Speedway\Act 2 Bad Future.asm' '..\out\files\R72D__.MMD' 'Level\Stardust Speedway\Act 2 Bad Future.lst' /e DEMO=0
assemble 'Level\Stardust Speedway\Act 3 Good Future.asm' '..\out\files\R73C__.MMD' 'Level\Stardust Speedway\Act 3 Good Future.lst' /e DEMO=0
assemble 'Level\Stardust Speedway\Act 3 Bad Future.asm' '..\out\files\R73D__.MMD' 'Level\Stardust Speedway\Act 3 Bad Future.lst' /e DEMO=0
assemble 'Level\Metallic Madness\Act 1 Present.asm' '..\out\files\R81A__.MMD' 'Level\Metallic Madness\Act 1 Present.lst' /e DEMO=0
assemble 'Level\Metallic Madness\Act 1 Past.asm' '..\out\files\R81B__.MMD' 'Level\Metallic Madness\Act 1 Past.lst' /e DEMO=0
assemble 'Level\Metallic Madness\Act 1 Good Future.asm' '..\out\files\R81C__.MMD' 'Level\Metallic Madness\Act 1 Good Future.lst' /e DEMO=0
assemble 'Level\Metallic Madness\Act 1 Bad Future.asm' '..\out\files\R81D__.MMD' 'Level\Metallic Madness\Act 1 Bad Future.lst' /e DEMO=0
assemble 'Level\Metallic Madness\Act 2 Present.asm' '..\out\files\R82A__.MMD' 'Level\Metallic Madness\Act 2 Present.lst' /e DEMO=0
assemble 'Level\Metallic Madness\Act 2 Present.asm' '..\out\files\DEMO82A.MMD' 'Level\Metallic Madness\Act 2 Present (Demo).lst' /e DEMO=1
assemble 'Level\Metallic Madness\Act 2 Past.asm' '..\out\files\R82B__.MMD' 'Level\Metallic Madness\Act 2 Past.lst' /e DEMO=0
assemble 'Level\Metallic Madness\Act 2 Good Future.asm' '..\out\files\R82C__.MMD' 'Level\Metallic Madness\Act 2 Good Future.lst' /e DEMO=0
assemble 'Level\Metallic Madness\Act 2 Bad Future.asm' '..\out\files\R82D__.MMD' 'Level\Metallic Madness\Act 2 Bad Future.lst' /e DEMO=0
assemble 'Level\Metallic Madness\Act 3 Good Future.asm' '..\out\files\R83C__.MMD' 'Level\Metallic Madness\Act 3 Good Future.lst' /e DEMO=0
assemble 'Level\Metallic Madness\Act 3 Bad Future.asm' '..\out\files\R83D__.MMD' 'Level\Metallic Madness\Act 3 Bad Future.lst' /e DEMO=0

assemble_symbols 'Special Stage\Stage Data.asm' 'Special Stage\Stage Data.bin' 'Special Stage\Stage Data.sym'
run_tool "$ROOT_DIR/bin/dumpasmsym.exe" -m asm 'Special Stage\Stage Data.sym' -o 'Special Stage\Stage Data Labels.inc'
rm -f 'Special Stage/Stage Data.sym'
assemble 'Special Stage\Main.asm' '..\out\files\SPMM__.MMD' 'Special Stage\Main.lst'
assemble 'Special Stage\Sub.asm' '..\out\files\SPSS__.BIN' 'Special Stage\Sub.lst'

echo 'Compiling filesystem...'
if [[ $REGION == 1 ]]; then
	python3 "$ROOT_DIR/tools/build_retail_iso.py" "$ROOT_DIR/out/files" "$ROOT_DIR/out/misc/files.bin"
else
	run_tool "$ROOT_DIR/bin/mkisofs.exe" -quiet -abstract ABS.TXT -biblio BIB.TXT -copyright CPY.TXT \
		-A 'SEGA ENTERPRISES' -V SONIC_CD___ -publisher 'SEGA ENTERPRISES' -p 'SEGA ENTERPRISES' \
		-sysid MEGA_CD -iso-level 1 -o '..\out\misc\files.bin' '..\out\files'
fi

run_tool "$ROOT_DIR/bin/asm68k.exe" /q /p /o 'ae-,l.,ow+' /e "REGION=$REGION" \
	'Main.asm,' "..\\out\\$OUTPUT"
rm -f "$ROOT_DIR/out/misc/files.bin"

echo "Built out/$OUTPUT for region $REGION."
