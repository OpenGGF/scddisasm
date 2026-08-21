#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
REGION=${REGION:-1}
OUTPUT=${OUTPUT:-scdbuilt.iso}

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
	PROTON_COMPAT_DATA_PATH=${PROTON_COMPAT_DATA_PATH:-"$ROOT_DIR/out/proton"}
fi

ORIGINAL_DIR="$ROOT_DIR/original/$REGION_DIR"
if ! find "$ORIGINAL_DIR" -maxdepth 1 -type f ! -name .gitkeep -print -quit | grep -q .; then
	echo "Missing proprietary game files in $ORIGINAL_DIR." >&2
	echo 'See README.md for the required original files.' >&2
	exit 1
fi

mkdir -p "$ROOT_DIR/out/files" "$ROOT_DIR/out/misc"
cp -a "$ORIGINAL_DIR"/. "$ROOT_DIR/out/files/"
rm -f "$ROOT_DIR/out/files/.gitkeep"

run_tool() {
	if [[ $RUNNER == proton ]]; then
		mkdir -p "$PROTON_COMPAT_DATA_PATH"
		STEAM_COMPAT_DATA_PATH="$PROTON_COMPAT_DATA_PATH" \
		STEAM_COMPAT_CLIENT_INSTALL_PATH="$STEAM_ROOT" \
			"$PROTON_BIN" run "$@"
	else
		"$WINE_BIN" "$@"
	fi
}

assemble() {
	local source=$1 output=$2 listing=$3
	shift 3
	run_tool "$ROOT_DIR/bin/asm68k.exe" /p /o 'ae-,l.,ow+' /e "REGION=$REGION" "$@" \
		"$source," "$output," , "$listing"
}

assemble_symbols() {
	local source=$1 output=$2 symbols=$3
	run_tool "$ROOT_DIR/bin/asm68k.exe" /p /o 'ae-,l.,ow+' /e "REGION=$REGION" \
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
assemble 'Level\Collision Chaos\Act 1 Present.asm' '..\out\files\R31A__.MMD' 'Level\Collision Chaos\Act 1 Present.lst' /e DEMO=0
assemble 'Level\Collision Chaos\Act 1 Past.asm' '..\out\files\R31B__.MMD' 'Level\Collision Chaos\Act 1 Past.lst' /e DEMO=0
assemble 'Level\Collision Chaos\Act 1 Good Future.asm' '..\out\files\R31C__.MMD' 'Level\Collision Chaos\Act 1 Good Future.lst' /e DEMO=0
assemble 'Level\Collision Chaos\Act 1 Bad Future.asm' '..\out\files\R31D__.MMD' 'Level\Collision Chaos\Act 1 Bad Future.lst' /e DEMO=0
assemble 'Level\Collision Chaos\Act 2 Present.asm' '..\out\files\R32A__.MMD' 'Level\Collision Chaos\Act 2 Present.lst' /e DEMO=0
assemble 'Level\Collision Chaos\Act 2 Past.asm' '..\out\files\R32B__.MMD' 'Level\Collision Chaos\Act 2 Past.lst' /e DEMO=0
assemble 'Level\Collision Chaos\Act 2 Good Future.asm' '..\out\files\R32C__.MMD' 'Level\Collision Chaos\Act 2 Good Future.lst' /e DEMO=0
assemble 'Level\Collision Chaos\Act 2 Bad Future.asm' '..\out\files\R32D__.MMD' 'Level\Collision Chaos\Act 2 Bad Future.lst' /e DEMO=0
assemble 'Level\Tidal Tempest\Act 1 Present.asm' '..\out\files\R41A__.MMD' 'Level\Tidal Tempest\Act 1 Present.lst' /e DEMO=0
assemble 'Level\Tidal Tempest\Act 1 Past.asm' '..\out\files\R41B__.MMD' 'Level\Tidal Tempest\Act 1 Past.lst' /e DEMO=0
assemble 'Level\Tidal Tempest\Act 1 Good Future.asm' '..\out\files\R41C__.MMD' 'Level\Tidal Tempest\Act 1 Good Future.lst' /e DEMO=0
assemble 'Level\Tidal Tempest\Act 1 Bad Future.asm' '..\out\files\R41D__.MMD' 'Level\Tidal Tempest\Act 1 Bad Future.lst' /e DEMO=0
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

assemble_symbols 'Special Stage\Stage Data.asm' 'Special Stage\Stage Data.bin' 'Special Stage\Stage Data.sym'
run_tool "$ROOT_DIR/bin/dumpasmsym.exe" -m asm 'Special Stage\Stage Data.sym' -o 'Special Stage\Stage Data Labels.inc'
rm -f 'Special Stage/Stage Data.sym'
assemble 'Special Stage\Main.asm' '..\out\files\SPMM__.MMD' 'Special Stage\Main.lst'
assemble 'Special Stage\Sub.asm' '..\out\files\SPSS__.BIN' 'Special Stage\Sub.lst'

echo 'Compiling filesystem...'
run_tool "$ROOT_DIR/bin/mkisofs.exe" -quiet -abstract ABS.TXT -biblio BIB.TXT -copyright CPY.TXT \
	-A 'SEGA ENTERPRISES' -V SONIC_CD___ -publisher 'SEGA ENTERPRISES' -p 'SEGA ENTERPRISES' \
	-sysid MEGA_CD -iso-level 1 -o '..\out\misc\files.bin' '..\out\files'

run_tool "$ROOT_DIR/bin/asm68k.exe" /p /o 'ae-,l.,ow+' /e "REGION=$REGION" \
	'Main.asm,' "..\\out\\$OUTPUT"
rm -f "$ROOT_DIR/out/misc/files.bin"

echo "Built out/$OUTPUT for region $REGION."
