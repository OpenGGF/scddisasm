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
	OPEN_M.MMD OPEN_S.BIN OPN.STM GOODEND.BIN BADEND.BIN PTEST.BIN
	PLANET_M.MMD PLANET_S.BIN PLANET_D.BIN VM____.MMD
	R11A__.MMD R12A__.MMD R12B__.MMD R12C__.MMD R12D__.MMD R13C__.MMD R13D__.MMD DEMO11A.MMD R11B__.MMD R11C__.MMD R11D__.MMD R61A__.MMD R31A__.MMD R31B__.MMD R31C__.MMD R31D__.MMD R32A__.MMD R32B__.MMD R32C__.MMD R32D__.MMD
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
