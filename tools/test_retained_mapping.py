"""Verify the retained KamaKama slice against its structured mapping source."""

from pathlib import Path
import re
import unittest


ROOT = Path(__file__).resolve().parents[1]
MAPPING = ROOT / "src/sprites/r3/kama_kama_2.asm"
TAIL = ROOT / "src/sprites/r3/kama_kama_2_retained_tail.bin"


def mapping_frames():
    """Read this family's literal frame bodies, not arbitrary assembly code."""
    frames = {}
    current = None
    for raw in MAPPING.read_text().splitlines():
        line = raw.split(";", 1)[0].strip()
        if line == ".Sprites:":
            continue
        if re.fullmatch(r"\.[A-Za-z]+:", line):
            current = line[:-1]
            frames[current] = bytearray()
        elif current is None or not line:
            continue
        elif line == "even":
            frames[current].extend(bytes(len(frames[current]) % 2))
        elif line.startswith("dc.b"):
            for token in line[4:].split(","):
                token = token.strip()
                value = int(token[1:], 16) if token.startswith("$") else int(token)
                if not 0 <= value <= 255:
                    raise ValueError("Not a byte: " + token)
                frames[current].append(value)
        else:
            raise ValueError("Unexpected frame source: " + line)
    return frames


class RetainedMappingTests(unittest.TestCase):
    def test_frame_record_schema(self):
        frames = mapping_frames()
        self.assertEqual(list(frames), [
            ".WalkA", ".WalkB", ".WalkC", ".WalkD",
            ".Throw", ".WatchA", ".WatchB", ".Recover",
        ])
        table = MAPPING.read_text().split(".WalkA:", 1)[0]
        self.assertEqual(re.findall(r"dc\.w\s+(\.[A-Za-z]+)-\.Sprites", table),
                         list(frames))
        for name, frame in frames.items():
            with self.subTest(frame=name):
                size = 1 + 5 * frame[0]  # Count then Y/size/tile-high/tile-low/X.
                self.assertEqual(len(frame), (size + 1) & ~1)
                self.assertTrue(all(byte == 0 for byte in frame[size:]))

    def test_retained_tail_identity_and_boundary(self):
        frames = mapping_frames()
        # The retained slice starts at Throw's seventh piece, tile-low byte.
        expected = frames[".Throw"][34:]
        for name in (".WatchA", ".WatchB", ".Recover"):
            expected += frames[name]
        self.assertEqual(len(expected), 132)
        self.assertEqual(TAIL.read_bytes(), expected)
        # Eight offset words precede the frames: Throw + 34 is family +$D8.
        self.assertEqual(16 + sum(len(frames[n]) for n in (
            ".WalkA", ".WalkB", ".WalkC", ".WalkD")) + 34, 0xD8)


if __name__ == "__main__":
    unittest.main()
