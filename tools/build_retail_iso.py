#!/usr/bin/env python3
"""Build the USA retail ISO9660 layout from staged, independently supplied files."""

from __future__ import annotations

import argparse
import os
import struct
import sys
from pathlib import Path


SECTOR_SIZE = 2048
ROOT_EXTENT = 20
ROOT_SIZE = 3 * SECTOR_SIZE
VOLUME_SECTORS = 59111
PHYSICAL_SECTORS = 59261


def level_names() -> list[str]:
	result = []
	for zone, acts in {
		"1": ("11ABCD", "12ABCD", "13CD"),
		"3": ("31ABCD", "32ABCD", "33CD"),
		"4": ("41ABCD", "42ABCD", "43CD"),
		"5": ("51ABCD", "52ABCD", "53CD"),
		"6": ("61ABCD", "62ABCD", "63CD"),
		"7": ("71ABCD", "72ABCD", "73CD"),
		"8": ("81ABCD", "82ABCD", "83CD"),
	}.items():
		for group in acts:
			act = group[:2]
			result.extend(f"R{act}{period}__.MMD" for period in group[2:])
	return result


LAYOUT = [
	"SNCBNK1B.BIN", "SNCBNK3B.BIN", "SNCBNK4B.BIN", "SNCBNK5B.BIN",
	"SNCBNK6B.BIN", "SNCBNK7B.BIN", "SNCBNK8B.BIN", "SNCBNKB1.BIN",
	"SNCBNKB2.BIN",
	*level_names(),
	"STSEL_.MMD", "SOSEL_.MMD", "SPMM__.MMD", "SPSS__.BIN", "TITLEM.MMD",
	"TITLES.BIN", "WARP__.MMD", "VM____.MMD", "MDINIT.MMD", "ATTACK.MMD",
	"ATTACK.BIN", "PLANET_M.MMD", "PLANET_S.BIN", "PLANET_D.BIN", "IPX___.MMD",
	"SPX___.BIN", "BRAMINIT.MMD", "BRAMSUB.BIN", "OPEN_M.MMD", "OPEN_S.BIN",
	"OPN.STM", "COME__.MMD", "THANKS_M.MMD", "THANKS_S.BIN", "THANKS_D.BIN",
	"BRAMMAIN.MMD", "DEMO11A.MMD", "DEMO43C.MMD", "DEMO82A.MMD", "GOODEND.BIN",
	"BADEND.STM", "ENDING.MMD", "BADEND.BIN", "GOODEND.STM", "PTEST.STM",
	"PTEST.MMD", "PTEST.BIN", "NISI.MMD", "SPEEND.MMD",
	*(f"DUMMY{i}.MMD" for i in range(10)),
	"CPY.TXT", "ABS.TXT", "BIB.TXT",
]


def both16(value: int) -> bytes:
	return struct.pack("<H", value) + struct.pack(">H", value)


def both32(value: int) -> bytes:
	return struct.pack("<I", value) + struct.pack(">I", value)


def recording_time(hour: int) -> bytes:
	return bytes((93, 10, 13, 0, 39, hour, 0))


def directory_record(name: bytes, extent: int, size: int, hour: int, directory: bool = False) -> bytes:
	length = 33 + len(name) + (len(name) % 2 == 0)
	record = bytearray(length)
	record[0] = length
	record[2:10] = both32(extent)
	record[10:18] = both32(size)
	record[18:25] = recording_time(hour)
	record[25] = 2 if directory else 0
	record[28:32] = both16(1)
	record[32] = len(name)
	record[33:33 + len(name)] = name
	return bytes(record)


def pvd(root_record: bytes) -> bytes:
	result = bytearray(SECTOR_SIZE)
	result[0:7] = b"\x01CD001\x01"
	result[8:40] = b"MEGA_CD".ljust(32)
	result[40:72] = b"SONIC_CD___".ljust(32)
	result[80:88] = both32(VOLUME_SECTORS)
	result[120:124] = both16(1)
	result[124:128] = both16(1)
	result[128:132] = both16(SECTOR_SIZE)
	result[132:140] = both32(10)
	result[140:144] = struct.pack("<I", 18)
	result[148:152] = struct.pack(">I", 19)
	result[156:190] = root_record
	result[190:318] = b" " * 128
	result[318:446] = b"SEGA ENTERPRISES".ljust(128)
	result[446:574] = b"SEGA ENTERPRISES".ljust(128)
	result[574:702] = b"SEGA ENTERPRISES".ljust(128)
	result[702:739] = b"CPY.TXT".ljust(37)
	result[739:776] = b"ABS.TXT".ljust(37)
	result[776:813] = b"BIB.TXT".ljust(37)
	result[813:830] = b"0000000000000000\0"
	result[830:847] = b"1993082012000000\0"
	result[847:864] = b"0000000000000000\0"
	result[864:881] = b"0000000000000000\0"
	result[881] = 1
	return bytes(result)


def write_sector(output, sector: int, data: bytes) -> None:
	if len(data) > SECTOR_SIZE:
		raise ValueError("sector data is too large")
	output.seek(sector * SECTOR_SIZE)
	output.write(data)
	output.write(bytes(SECTOR_SIZE - len(data)))


def main() -> int:
	parser = argparse.ArgumentParser()
	parser.add_argument("source", type=Path)
	parser.add_argument("output", type=Path)
	args = parser.parse_args()

	files = {path.name: path for path in args.source.iterdir() if path.is_file()}
	expected = set(LAYOUT)
	missing = sorted(expected - files.keys())
	extra = sorted(files.keys() - expected)
	if missing or extra:
		if missing:
			print("Missing ISO input files: " + ", ".join(missing), file=sys.stderr)
		if extra:
			print("Unexpected ISO input files: " + ", ".join(extra), file=sys.stderr)
		return 1

	extents: dict[str, tuple[int, int]] = {}
	next_extent = 23
	for name in LAYOUT:
		size = files[name].stat().st_size
		extents[name] = (next_extent, size)
		next_extent += (size + SECTOR_SIZE - 1) // SECTOR_SIZE
	if next_extent != VOLUME_SECTORS:
		print(f"ISO layout ends at sector {next_extent}, expected {VOLUME_SECTORS}", file=sys.stderr)
		return 1

	root = directory_record(b"\0", ROOT_EXTENT, ROOT_SIZE, 9, True)
	directory = bytearray()
	for record in (root, directory_record(b"\1", ROOT_EXTENT, ROOT_SIZE, 9, True)):
		directory.extend(record)
	for name in sorted(LAYOUT):
		extent, size = extents[name]
		hour = 9 if extent < 1720 else 10 if extent < 17103 else 11
		record = directory_record((name + ";1").encode("ascii"), extent, size, hour)
		sector_remaining = SECTOR_SIZE - (len(directory) % SECTOR_SIZE)
		if len(record) > sector_remaining:
			directory.extend(bytes(sector_remaining))
		directory.extend(record)
	if len(directory) > ROOT_SIZE:
		raise ValueError("root directory exceeds its retail allocation")
	directory.extend(bytes(ROOT_SIZE - len(directory)))

	args.output.parent.mkdir(parents=True, exist_ok=True)
	with args.output.open("w+b") as output:
		output.truncate(PHYSICAL_SECTORS * SECTOR_SIZE)
		write_sector(output, 16, pvd(root))
		write_sector(output, 17, b"\xffCD001\x01")
		write_sector(output, 18, b"\x01\x00" + struct.pack("<I", ROOT_EXTENT) + b"\x01\x00\x00\x00")
		write_sector(output, 19, b"\x01\x00" + struct.pack(">I", ROOT_EXTENT) + b"\x00\x01\x00\x00")
		output.seek(ROOT_EXTENT * SECTOR_SIZE)
		output.write(directory)
		for name in LAYOUT:
			extent, _ = extents[name]
			output.seek(extent * SECTOR_SIZE)
			with files[name].open("rb") as source:
				while chunk := source.read(1024 * 1024):
					output.write(chunk)

	os.chmod(args.output, 0o644)
	return 0


if __name__ == "__main__":
	raise SystemExit(main())
