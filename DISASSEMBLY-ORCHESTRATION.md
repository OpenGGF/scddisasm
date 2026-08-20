# Disassembly Orchestration Ledger

## 2026-08-20

- **R31A audit:** The current Collision Chaos source/build entry is absent. The focused reconstruction finalized exactly two intended files under `src/Level/Collision Chaos`: `Data (Act 1 Present).asm` and `Data/Collision (Act 1 Present).bin`. The retained binary is 700 bytes with SHA-256 `7c606a40992f3bab8e995c4e2a343a0c7ee0583de53b3c10039e09e903e537d6`; `cmp` matched both `origin/test:src/maps/r31a/collision.bin` and the `original/usa/R31A__.MMD` range `[0x1F700, 0x1F9BC)`. No scratch or whole-MMD files remain. No full R31A build/check is claimed because the build graph remains absent. The two intended files are untracked pending review.
- **R12A-D:** Absent from the current build graph. Metadata/dependency graph audited; no complete byte-verifiable current-architecture slice was integrated.
- **R13C-D:** Absent from the current build graph. Metadata/dependency graph audited; no complete byte-verifiable current-architecture slice was integrated.
- **Clean USA baseline:** `REGION=1 ./check.sh` passed all 51 existing comparisons.
- **Milestone commit:** `7f30ec4` — “Clarify backup RAM and boss PCM disassembly”.
- **Current R31A reconstruction:** The focused reconstruction is finalized in the two intended untracked files above, pending review; the full R31A build/check graph remains absent.

Scope note: The ledger and the two intended R31A slice files are the only untracked task outputs; no build/check scripts, generated files, or originals were changed.
