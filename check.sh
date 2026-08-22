#!/usr/bin/env bash

set -u

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
REGION=${REGION:-1}

case "$REGION" in
	0)
		REGION_DIR=japan
		IP_NAME=ip_japan.bin
		;;
	1)
		REGION_DIR=usa
		IP_NAME=ip_usa.bin
		;;
	2)
		REGION_DIR=europe
		IP_NAME=ip_europe.bin
		;;
	*)
		echo "Invalid REGION '$REGION' (expected 0 for Japan, 1 for USA, or 2 for Europe)." >&2
		exit 2
		;;
esac

status=0

compare() {
	local original=$1 built=$2
	if [[ ! -f $original ]]; then
		echo "MISSING: ${original#"$ROOT_DIR"/}" >&2
		status=1
	elif [[ ! -f $built ]]; then
		echo "MISSING: ${built#"$ROOT_DIR"/}" >&2
		status=1
	elif cmp -s "$original" "$built"; then
		echo "MATCH: ${built#"$ROOT_DIR"/}"
	else
		echo "DIFFER: ${built#"$ROOT_DIR"/}" >&2
		cmp "$original" "$built" >&2 || true
		status=1
	fi
}

compare "$ROOT_DIR/original/$IP_NAME" "$ROOT_DIR/out/misc/ip.bin"
compare "$ROOT_DIR/original/sp.bin" "$ROOT_DIR/out/misc/sp.bin"

files=(
	IPX___.MMD SPX___.BIN BRAMINIT.MMD BRAMSUB.BIN MDINIT.MMD WARP__.MMD
	SNCBNK1B.BIN SNCBNK3B.BIN SNCBNK4B.BIN SNCBNK5B.BIN SNCBNK6B.BIN
	SNCBNK7B.BIN SNCBNK8B.BIN SNCBNKB1.BIN SNCBNKB2.BIN
	TITLEM.MMD TITLES.BIN STSEL_.MMD SOSEL_.MMD NISI.MMD
	DUMMY0.MMD DUMMY1.MMD DUMMY2.MMD DUMMY3.MMD DUMMY4.MMD DUMMY5.MMD
	DUMMY6.MMD DUMMY7.MMD DUMMY8.MMD DUMMY9.MMD SPEEND.MMD
	ATTACK.BIN THANKS_M.MMD THANKS_S.BIN THANKS_D.BIN COME__.MMD OPEN_M.MMD OPEN_S.BIN OPN.STM GOODEND.BIN BADEND.BIN PTEST.MMD PTEST.BIN
	PLANET_M.MMD PLANET_S.BIN PLANET_D.BIN VM____.MMD
	R11A__.MMD R12A__.MMD R12B__.MMD R12C__.MMD R12D__.MMD R13C__.MMD R13D__.MMD DEMO11A.MMD R11B__.MMD R11C__.MMD R11D__.MMD R61A__.MMD R61B__.MMD R61C__.MMD R61D__.MMD R62A__.MMD R62B__.MMD R62C__.MMD R62D__.MMD R63C__.MMD R63D__.MMD R31A__.MMD R31B__.MMD R31C__.MMD R31D__.MMD R32A__.MMD R32B__.MMD R32C__.MMD R32D__.MMD R33C__.MMD R33D__.MMD R41A__.MMD R41B__.MMD R41C__.MMD R41D__.MMD
	R42A__.MMD R42B__.MMD R42C__.MMD R42D__.MMD R43C__.MMD R43D__.MMD DEMO43C.MMD
	R51A__.MMD R51B__.MMD R51C__.MMD R51D__.MMD R52A__.MMD R52B__.MMD R52C__.MMD R52D__.MMD R53C__.MMD R53D__.MMD
	R71A__.MMD R71B__.MMD R71C__.MMD R71D__.MMD R72A__.MMD R72B__.MMD R72C__.MMD R72D__.MMD R73C__.MMD R73D__.MMD
	R81A__.MMD R81B__.MMD R81C__.MMD R81D__.MMD R82A__.MMD DEMO82A.MMD R82B__.MMD R82C__.MMD R82D__.MMD R83C__.MMD R83D__.MMD
	SPMM__.MMD SPSS__.BIN
)

for file in "${files[@]}"; do
	compare "$ROOT_DIR/original/$REGION_DIR/$file" "$ROOT_DIR/out/files/$file"
done

if (( status == 0 )); then
	echo "All files match for region $REGION."
else
	echo "One or more files are missing or differ for region $REGION." >&2
fi

exit "$status"
