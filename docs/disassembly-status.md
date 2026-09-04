# Non-BRAM Disassembly Status

## Purpose

This is the manually reviewed component inventory required by
`DISASSEMBLY-REMEDIATION-PLAN.md`. It covers every built component
compared by the retail check frontend except the explicitly excluded Backup
RAM outputs and independently supplied media/metadata. It is a baseline, not
a claim that entries marked mostly semantic are complete.

Run the structural audit from the repository root:

```sh
python3 tools/audit_disassembly.py --check
```

Use `--json` for machine-readable metrics and
`--list-unreachable` to inspect tracked sources outside the
active non-BRAM include graph.

## Status Vocabulary

- Graph: S = structured, H = hybrid structured/legacy, L = legacy.
- Mostly semantic means the active code is substantially named and organized;
  it does not certify every routine or datum.
- Partial means meaningful high-level structure exists alongside material
  address-label or legacy debt.
- Legacy means the active source still substantially follows a historical or
  address-derived disassembly graph.
- Classified binary assets may remain binary when that is their natural
  representation. Mixed or opaque data requires manual range classification.
- A `J/U/E YYYY-MM-DD` validation entry means fresh Japan, USA, and Europe
  builds and all 133 regional comparisons passed on that date. It does not by
  itself record a fresh CHD data-track comparison.

## Baseline

The M1 audit reports:

- 133 comparison outputs in total;
- 124 built non-BRAM components represented below;
- 3 excluded BRAM outputs;
- 6 external media/metadata comparison inputs;
- 114 non-BRAM assembly build roots;
- 2,320 tracked non-BRAM ASM/INC files;
- 2,227 active tracked ASM/INC files;
- 93 tracked but unreachable ASM/INC files;
- zero missing active includes;
- 15 references to the intentionally absent, inactive
  `standalone/block_write.asm`; and
- zero include-path case mismatches.

M2 then completed fresh displayless Steam Proton Experimental builds for
Japan, USA, and Europe. All 133 comparisons matched in each region on
2026-09-01. The pre-validation `out/` tree was preserved and restored.

The 93 unreachable files are not automatically dead. They include editor-only
data, alternatives selected only by unfinished graphs, and the structured
Collision Chaos and Tidal Tempest sources targeted by the roadmap.

## Exclusions and Intermediates

The following are intentionally absent from the component rows:

- BRAM: `BRAMINIT.MMD`, `BRAMMAIN.MMD`, and `BRAMSUB.BIN`.
- External media: `BADEND.STM`, `GOODEND.STM`, and `PTEST.STM`.
- External ISO metadata: `ABS.TXT`, `BIB.TXT`, and `CPY.TXT`.

The FM driver binary and generated Special Stage/DA Garden label files are
active intermediates rather than independently compared product components.
The final data-track ISO is a product wrapper around the component set and is
validated separately against a regional CHD.

## Component Matrix

M415-M482 (2026-09-04) canonicalize the shared `objects/player.asm` boredom,
initialization, splash, routine-dispatch, camera, main-update, power-up, and
water-state, warp-transition, player-state, booster, ground-movement, and
velocity/focus helpers, including focus-mode, acceleration, braking, roll/look,
velocity-deceleration, wall-response, left/right movement, rolling, and standing
restoration control flow, plus air-movement gating, horizontal clamping, focus
adjustment, falling drag, bounds, roll eligibility, roll initialization, jump
input/impulse, height caps, slope resistance, fall detection, angle reset, and
air block-collision/landing responses, ground normalization, hurt recovery, and
death/restart lifecycle handling, chunk/loop detection with roll entry, and
animation frame/loop/state selection with the shrink map, graphics upload, and
flipper interaction, plus the R6 ground movement/focus/velocity, wall-response,
left/right movement, rolling, air-movement, bounds, roll-entry, jump-input,
jump-height, slope-resistance, fall-detection, angle-reset, air-collision, and
ground-normalization, hurt-recovery, death-processing, restart-selection,
chunk/loop-check, roll-entry, animation-frame/loop, dynamic-movement,
shrink-map, graphics-upload, flipper, object-collision, pole, hang-bar, beam,
spark, bounce, camera, main-dispatch, power-up, warp-transition, ground/fall/roll/jump,
pole, hang-bar, booster, Eggman encounter setup/hover, attack, defeat, capsule,
and escape families, plus boss machine, spikes, exhaust, smoke, and falling-spike
child-object families, plus floor-debris, electricity, floor-piece motion, and
player-collision, conductor child-object, and shared boss motion/spawn/band/bound/
palette-cycle helper families, plus the R6 stage-draw and stage-GFX animation
scroll/block-transfer/placement/initialization families and the 1A/1B/2B/1C/
3C/1D/3D/2A/2C/2D scroll movement families, plus the shared Snake Blocks
motion/pattern, Electric Beams activation/palette, Spin Platform/Bounce Platform
motion/collision, Freezer state/shatter, and Tunnel Path transport/path-data
object families, plus the Act 1/2 Bata-pyon, Poh-Bee, Semi, and Minomusi
parent/child state families and the shared Robot Generator/Eggman Statue
machine-destruction, Seesaw, Tube Door, Projector, Door, and Switch
player-interaction/control families, plus Piston, Platform, Crusher, Animal,
Spike Chain, Launcher, and Goddess Statue mechanical motion/collision/
parent-child families, plus all four R6 palette-cycle timing/color variants,
and the shared title-card state machine with six regional character-layout
tables, plus the R6 Act 3 C/D boss and escape graphics lists.
Fresh J/U/E validation covers the R3/R4/R5/R6/R7/R8 level outputs that include
this shared family, including `DEMO43C` and `DEMO82A`.

M478 also canonicalizes the shared stage-object spawn, object-slot allocation,
and despawn family, including its dispatch table, eight-byte stage records, and
time-zone state slots.

M479 canonicalizes the shared object update, movement, draw-queue, sprite,
delete, and visibility family, including the layer-camera table.

M480 canonicalizes shared block lookup plus the horizontal/vertical collision
probes and their secondary-edge paths.

M481 labels the retained stage-collision column-to-row converter and records
its no-op retail entry hook.

M482 canonicalizes the shared solid-object attach/detach, support, push/crush,
carry, and player-contact lifecycle.

### Core and system programs

| Output | Entry point | Graph | Code | Data | Unresolved labels/ranges | Binary assets | Regions/switches | Validation | Next milestone |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `IPX___.MMD` | `CD Initial Program/IPX.asm` | S | Mostly semantic | Mixed | Residual unknown fields and embedded tables | Classified security/system data | J/U/E | J/U/E 2026-09-01 | Inventory residual labels and tables |
| `MDINIT.MMD` | `Mega Drive Init/Main.asm` | S | Mostly semantic | Mostly classified | Residual unknown fields/tables | Mostly classified | J/U/E | J/U/E 2026-09-01 | Inventory residual labels and data |
| `SPX___.BIN` | `CD System Program/SPX.asm` | S | Mostly semantic | Mixed | Residual unknown fields and embedded tables | Classified security/system data | J/U/E | J/U/E 2026-09-01 | Inventory residual labels and tables |
| `WARP__.MMD` | `Time Warp Cutscene/Main.asm` | S | Mostly semantic | Mostly classified | Residual unknown fields/tables | Mostly classified | J/U/E | J/U/E 2026-09-01 | Inventory residual labels and data |
| `ip.bin` | `CD Initial Program/IP.asm` | S | Mostly semantic | Mixed | Residual unknown fields and embedded tables | Classified security/system data | J/U/E | J/U/E 2026-09-01 | Inventory residual labels and tables |
| `sp.bin` | `CD System Program/SP.asm` | S | Mostly semantic | Mixed | Residual unknown fields and embedded tables | Classified security/system data | J/U/E | J/U/E 2026-09-01 | Inventory residual labels and tables |

### Sound drivers and banks

| Output | Entry point | Graph | Code | Data | Unresolved labels/ranges | Binary assets | Regions/switches | Validation | Next milestone |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `SNCBNK1B.BIN` | `Sound Drivers/PCM/Palmtree Panic.asm` | S | Mostly semantic | Structured sound data | Unknown SFX names/fields remain | Classified PCM/music | J/U/E | J/U/E 2026-09-01 | Name unknown SFX and driver fields |
| `SNCBNK3B.BIN` | `Sound Drivers/PCM/Collision Chaos.asm` | S | Mostly semantic | Structured sound data | Unknown SFX names/fields remain | Classified PCM/music | J/U/E | J/U/E 2026-09-01 | Name unknown SFX and driver fields |
| `SNCBNK4B.BIN` | `Sound Drivers/PCM/Tidal Tempest.asm` | S | Mostly semantic | Structured sound data | Unknown SFX names/fields remain | Classified PCM/music | J/U/E | J/U/E 2026-09-01 | Name unknown SFX and driver fields |
| `SNCBNK5B.BIN` | `Sound Drivers/PCM/Quartz Quadrant.asm` | S | Mostly semantic | Structured sound data | Unknown SFX names/fields remain | Classified PCM/music | J/U/E | J/U/E 2026-09-01 | Name unknown SFX and driver fields |
| `SNCBNK6B.BIN` | `Sound Drivers/PCM/Wacky Workbench.asm` | S | Mostly semantic | Structured sound data | Unknown SFX names/fields remain | Classified PCM/music | J/U/E | J/U/E 2026-09-01 | Name unknown SFX and driver fields |
| `SNCBNK7B.BIN` | `Sound Drivers/PCM/Stardust Speedway.asm` | S | Mostly semantic | Structured sound data | Unknown SFX names/fields remain | Classified PCM/music | J/U/E | J/U/E 2026-09-01 | Name unknown SFX and driver fields |
| `SNCBNK8B.BIN` | `Sound Drivers/PCM/Metallic Madness.asm` | S | Mostly semantic | Structured sound data | Unknown SFX names/fields remain | Classified PCM/music | J/U/E | J/U/E 2026-09-01 | Name unknown SFX and driver fields |
| `SNCBNKB1.BIN` | `Sound Drivers/PCM/Boss.asm` | S | Mostly semantic | Structured sound data | Unknown SFX names/fields remain | Classified PCM/music | J/U/E | J/U/E 2026-09-01 | Name unknown SFX and driver fields |
| `SNCBNKB2.BIN` | `Sound Drivers/PCM/Final Boss.asm` | S | Mostly semantic | Structured sound data | Unknown SFX names/fields remain | Classified PCM/music | J/U/E | J/U/E 2026-09-01 | Name unknown SFX and driver fields |

### Title screen and secrets

| Output | Entry point | Graph | Code | Data | Unresolved labels/ranges | Binary assets | Regions/switches | Validation | Next milestone |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `DUMMY0.MMD` | `Title Screen/Secrets/Sound Test Image.asm` | S | Mostly semantic | Mostly classified | Residual unknown fields and mappings | Mostly classified | J/U/E PROTOTYPE=0 H32=0 EASTEREGG=1 | J/U/E 2026-09-01 | Inventory residual title/secret data |
| `DUMMY1.MMD` | `Title Screen/Secrets/Sound Test Image.asm` | S | Mostly semantic | Mostly classified | Residual unknown fields and mappings | Mostly classified | J/U/E PROTOTYPE=0 H32=0 EASTEREGG=2 | J/U/E 2026-09-01 | Inventory residual title/secret data |
| `DUMMY2.MMD` | `Title Screen/Secrets/Sound Test Image.asm` | S | Mostly semantic | Mostly classified | Residual unknown fields and mappings | Mostly classified | J/U/E PROTOTYPE=0 H32=0 EASTEREGG=3 | J/U/E 2026-09-01 | Inventory residual title/secret data |
| `DUMMY3.MMD` | `Title Screen/Secrets/Sound Test Image.asm` | S | Mostly semantic | Mostly classified | Residual unknown fields and mappings | Mostly classified | J/U/E PROTOTYPE=0 H32=0 EASTEREGG=4 | J/U/E 2026-09-01 | Inventory residual title/secret data |
| `DUMMY4.MMD` | `Title Screen/Secrets/Best Staff Times.asm` | S | Mostly semantic | Mostly classified | Residual unknown fields and mappings | Mostly classified | J/U/E PROTOTYPE=0 H32=1 | J/U/E 2026-09-01 | Inventory residual title/secret data |
| `DUMMY5.MMD` | `Title Screen/Secrets/Sound Test (Prototype).asm` | S | Mostly semantic | Mostly classified | Residual unknown fields and mappings | Mostly classified | J/U/E PROTOTYPE=1 H32=0 | J/U/E 2026-09-01 | Inventory residual title/secret data |
| `DUMMY6.MMD` | `Title Screen/Secrets/Sound Test (Prototype).asm` | S | Mostly semantic | Mostly classified | Residual unknown fields and mappings | Mostly classified | J/U/E PROTOTYPE=1 H32=0 (copy of DUMMY5.MMD) | J/U/E 2026-09-01 | Inventory residual title/secret data |
| `DUMMY7.MMD` | `Title Screen/Secrets/Sound Test (Prototype).asm` | S | Mostly semantic | Mostly classified | Residual unknown fields and mappings | Mostly classified | J/U/E PROTOTYPE=1 H32=0 (copy of DUMMY5.MMD) | J/U/E 2026-09-01 | Inventory residual title/secret data |
| `DUMMY8.MMD` | `Title Screen/Secrets/Sound Test (Prototype).asm` | S | Mostly semantic | Mostly classified | Residual unknown fields and mappings | Mostly classified | J/U/E PROTOTYPE=1 H32=0 (copy of DUMMY5.MMD) | J/U/E 2026-09-01 | Inventory residual title/secret data |
| `DUMMY9.MMD` | `Title Screen/Secrets/Sound Test (Prototype).asm` | S | Mostly semantic | Mostly classified | Residual unknown fields and mappings | Mostly classified | J/U/E PROTOTYPE=1 H32=0 (copy of DUMMY5.MMD) | J/U/E 2026-09-01 | Inventory residual title/secret data |
| `NISI.MMD` | `Title Screen/Secrets/Sound Test Image.asm` | S | Mostly semantic | Mostly classified | Residual unknown fields and mappings | Mostly classified | J/U/E PROTOTYPE=0 H32=0 EASTEREGG=0 | J/U/E 2026-09-01 | Inventory residual title/secret data |
| `SOSEL_.MMD` | `Title Screen/Secrets/Sound Test.asm` | S | Mostly semantic | Mostly classified | Residual unknown fields and mappings | Mostly classified | J/U/E PROTOTYPE=0 H32=0 | J/U/E 2026-09-01 | Inventory residual title/secret data |
| `SPEEND.MMD` | `Title Screen/Secrets/Special Stage 8 Credits.asm` | S | Mostly semantic | Mostly classified | Residual unknown fields and mappings | Mostly classified | J/U/E PROTOTYPE=0 H32=0 | J/U/E 2026-09-01 | Inventory residual title/secret data |
| `STSEL_.MMD` | `Title Screen/Secrets/Stage Select.asm` | S | Mostly semantic | Mostly classified | Residual unknown fields and mappings | Mostly classified | J/U/E PROTOTYPE=0 H32=0 | J/U/E 2026-09-01 | Inventory residual title/secret data |
| `TITLEM.MMD` | `Title Screen/Main.asm` | S | Mostly semantic | Mostly classified | Residual unknown fields and mappings | Mostly classified | J/U/E | J/U/E 2026-09-01 | Inventory residual title/secret data |
| `TITLES.BIN` | `Title Screen/Sub.asm` | S | Mostly semantic | Mostly classified | Residual unknown fields and mappings | Mostly classified | J/U/E | J/U/E 2026-09-01 | Inventory residual title/secret data |

### DA Garden

| Output | Entry point | Graph | Code | Data | Unresolved labels/ranges | Binary assets | Regions/switches | Validation | Next milestone |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `PLANET_D.BIN` | `DA Garden/Track Titles.asm` | S | N/A | Structured | No executable code | N/A | J/U/E | J/U/E 2026-09-01 | Document table format |
| `PLANET_M.MMD` | `DA Garden/Main.asm` | S | Mostly semantic | Mostly classified | Residual unknown fields/tables | Mostly classified | J/U/E | J/U/E 2026-09-01 | Inventory residual labels and data |
| `PLANET_S.BIN` | `DA Garden/Sub.asm` | S | Mostly semantic | Mostly classified | Residual unknown fields/tables | Mostly classified | J/U/E | J/U/E 2026-09-01 | Inventory residual labels and data |

### Presentation and auxiliary programs

| Output | Entry point | Graph | Code | Data | Unresolved labels/ranges | Binary assets | Regions/switches | Validation | Next milestone |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `ATTACK.BIN` | `Time Attack/Sub.asm` | S | Mostly semantic | Mostly classified | Residual unknown fields/tables | Mostly classified | J/U/E | J/U/E 2026-09-01 | Inventory residual labels and data |
| `ATTACK.MMD` | `Time Attack/Main.asm` | L | Legacy | Opaque/mixed | Period-animation dispatch stubs/overlapping frame targets, stage/period navigation and selected-stage handoff, selection transition loop, highlight updates, and title/table screen upload, region/stage selection initialization and record-ranking insertion, startup reset, VDP clear, and initial graphics upload, initials-entry, selection-input, and initials-display, selection highlight/tile upload, VDP-command, indexed-stage upload, and record-insertion animation, selection graphics preparation and stage-record aggregation, selection-title upload and selected-record-table rendering, selected map, dispatch, palette fade/channel-step, VDP register/rectangle helpers, Z80/controller/rotated-upload helpers, VDP-transfer interrupt/DMA/controller-latch/animated-tile helpers, Sub CPU command/ready/request handoff, time-record conversion and digit/tile rendering, VDP-wait, time-period selection/animation, Nemesis decompressor, Enigma dispatch, and Enigma bit-reader/refill families are canonical semantic labels with migrated callers | Mixed | J/U/E | J/U/E 2026-09-04 (M410) | Recover one Time Attack routine family |
| `BADEND.BIN` | `FMV/Sub (Ending).asm` | S | Mostly semantic | Mostly classified | Residual unknown fields/tables | Mostly classified | J/U/E DATAFILE=1 | J/U/E 2026-09-01 | Inventory residual labels and data |
| `COME__.MMD` | `Comin Soon/Main.asm` | S | Mostly semantic | Mostly classified | Residual unknown fields/tables | Mostly classified | J/U/E | J/U/E 2026-09-01 | Inventory residual labels and data |
| `ENDING.MMD` | `FMV/Main (Ending).asm` | L | Legacy | Opaque/mixed | 822 address labels and a large source-emitted image; VDP initialization/VRAM-CRAM clear and compressed-art output family, source-image startup initializer/VDP map uploader, tile-buffer initialization/snapshot/restore transforms, Z80 bus and VBlank synchronization helpers, startup/teardown loops, timer waits, VBlank dispatcher/common transfer and state-specific animation/tile uploads, event-playback setup, Word RAM handshake/name-table clear, startup VDP-row clear, palette/font upload, hardware gate, command-dispatch state handlers, Word RAM transfer descriptors, and event-stream VDP-address/row-emission loops now have semantic entry points and callers alongside the command-loader, Word RAM swap, joypad, and command-lifecycle helpers | Mixed | J/U/E | J/U/E 2026-09-04 (M391) | Recover one ending-FMV routine/data family |
| `GOODEND.BIN` | `FMV/Sub (Ending).asm` | S | Mostly semantic | Mostly classified | Residual unknown fields/tables | Mostly classified | J/U/E DATAFILE=0 | J/U/E 2026-09-01 | Inventory residual labels and data |
| `OPEN_M.MMD` | `FMV/Main (Opening).asm` | S | Mostly semantic | Mostly classified | Residual unknown fields/tables | Mostly classified | J/U/E | J/U/E 2026-09-01 | Inventory residual labels and data |
| `OPEN_S.BIN` | `FMV/Sub (Opening).asm` | S | Mostly semantic | Mostly classified | Residual unknown fields/tables | Mostly classified | J/U/E | J/U/E 2026-09-01 | Inventory residual labels and data |
| `OPN.STM` | `bin/MakeSTM.exe + src/FMV/Data/Opening.gif + Opening.wav` | S | N/A | Generated stream | MakeSTM format documentation | Source GIF/WAV classified | J/U/E | J/U/E 2026-09-01 | Document MakeSTM inputs and reproducibility |
| `PTEST.BIN` | `FMV/Sub (Pencil Test).asm` | S | Mostly semantic | Mostly classified | Residual unknown fields/tables | Mostly classified | J/U/E | J/U/E 2026-09-01 | Inventory residual labels and data |
| `PTEST.MMD` | `FMV/Main (Pencil Test).asm` | S | Mostly semantic | Mostly classified | Residual unknown fields/tables | Mostly classified | J/U/E | J/U/E 2026-09-01 | Inventory residual labels and data |
| `THANKS_D.BIN` | `Thank You/Data.asm` | S | N/A | Classified compressed graphics | No executable code | Classified | J/U/E | J/U/E 2026-09-01 | Document the data format and round trip |
| `THANKS_M.MMD` | `Thank You/Main.asm` | H | Partial | Opaque/mixed | No remaining `L_FF…` address labels; large source-emitted declaration/encoded-dispatch regions remain, while connected startup, command, display-state, hardware-init, hardware-probe, palette, object, screen-data, fade, dispatch, decoder, sprite-queue, timer, VInterrupt, and utility families use canonical semantic labels | Mixed | J/U/E | J/U/E 2026-09-03 (M375) | Recover one Thank You routine/data family |
| `THANKS_S.BIN` | `Thank You/Sub.asm` | S | Mostly semantic | Mostly classified | Residual unknown fields/tables | Mostly classified | J/U/E | J/U/E 2026-09-01 | Inventory residual labels and data |
| `VM____.MMD` | `Visual Mode/Main.asm` | S | Mostly semantic | Mostly classified | Residual unknown fields/tables | Mostly classified | J/U/E | J/U/E 2026-09-01 | Inventory residual labels and data |

### Levels — Palmtree Panic

| Output | Entry point | Graph | Code | Data | Unresolved labels/ranges | Binary assets | Regions/switches | Validation | Next milestone |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `DEMO11A.MMD` | `Level/Palmtree Panic/Act 1 Present.asm` | S | Mostly semantic | Mixed | Packed/legacy data tails and residual generic labels | Mixed but mostly named | J/U/E DEMO=1 | J/U/E 2026-09-01 | Classify active data debt, then relabel residual code |
| `R11A__.MMD` | `Level/Palmtree Panic/Act 1 Present.asm` | S | Mostly semantic | Mixed | Packed/legacy data tails and residual generic labels | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Classify active data debt, then relabel residual code |
| `R11B__.MMD` | `Level/Palmtree Panic/Act 1 Past.asm` | S | Mostly semantic | Mixed | Packed/legacy data tails and residual generic labels | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Classify active data debt, then relabel residual code |
| `R11C__.MMD` | `Level/Palmtree Panic/Act 1 Good Future.asm` | S | Mostly semantic | Mixed | Packed/legacy data tails and residual generic labels | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Classify active data debt, then relabel residual code |
| `R11D__.MMD` | `Level/Palmtree Panic/Act 1 Bad Future.asm` | S | Mostly semantic | Mixed | Packed/legacy data tails and residual generic labels | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Classify active data debt, then relabel residual code |
| `R12A__.MMD` | `Level/Palmtree Panic/Act 2 Present.asm` | S | Mostly semantic | Mixed | Packed/legacy data tails and residual generic labels; USA retained helper routines and orphan PLC graph are shared and named | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-03 (M271) | Classify active data debt, then relabel residual code |
| `R12B__.MMD` | `Level/Palmtree Panic/Act 2 Past.asm` | S | Mostly semantic | Mixed | Packed/legacy data tails and residual generic labels | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Classify active data debt, then relabel residual code |
| `R12C__.MMD` | `Level/Palmtree Panic/Act 2 Good Future.asm` | S | Mostly semantic | Mixed | Packed/legacy data tails and residual generic labels; USA retained helper routines and orphan PLC graph are shared and named; R12C Padding 3 is the structured shared tail provider; R12C pre-chunks are shared with R12D | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-03 (M282) | Classify active data debt, then relabel residual code |
| `R12D__.MMD` | `Level/Palmtree Panic/Act 2 Bad Future.asm` | S | Mostly semantic | Mixed | Packed/legacy data tails and residual generic labels; USA retained helper routines and orphan PLC graph are shared and named; R12D Padding 3 reuses the R31C provider; R12D pre-chunks reuse R12C | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-03 (M282) | Classify active data debt, then relabel residual code |
| `R13C__.MMD` | `Level/Palmtree Panic/Act 3 Good Future.asm` | S | Mostly semantic | Mixed | Shared USA animation tail is semantically labeled; packed/legacy data tails and residual generic labels remain; R13D pre-chunks and rotation-vector suffixes shared | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-04 (M412) | Classify active data debt, then relabel residual code |
| `R13D__.MMD` | `Level/Palmtree Panic/Act 3 Bad Future.asm` | S | Mostly semantic | Mixed | Shared USA animation tail is semantically labeled; packed/legacy data tails and residual generic labels remain; R12D pre-chunks and rotation-vector suffixes shared | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-04 (M412) | Classify active data debt, then relabel residual code |

### Levels — Collision Chaos

| Output | Entry point | Graph | Code | Data | Unresolved labels/ranges | Binary assets | Regions/switches | Validation | Next milestone |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `R31A__.MMD` | `Level/Collision Chaos/Act 1 Present.asm` | H | Hybrid zone graph with semantic shared engine; intro, saved-object despawn, shared objects through Projector, animated tiles, and PLC graph semantically labelled | Mixed; Present palette, section-art tables, shared-object data, stage descriptor, and PLC records structured | Camera-scroll deformation and water-row helpers are semantically labeled; shared USA animation tail is semantically labeled; address-labelled/padding data tails remain | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-04 (M413) | Classify the Collision Chaos variant data tails |
| `R31B__.MMD` | `Level/Collision Chaos/Act 1 Past.asm` | L | Legacy zone graph with semantic shared engine core, shared objects through Projector, animated tiles, and PLC graph semantically labelled | Mixed; Past palette, shared-object data, stage descriptor, and PLC records structured; R31C Padding 3 and non-USA pre-chunk data are reused as shared providers | Shared USA animation tail is semantically labeled; zone-specific scroll/draw/load, address labels, and R31B Padding 3 prefix remain | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-04 (M412) | Classify Collision Chaos variant data tails |
| `R31C__.MMD` | `Level/Collision Chaos/Act 1 Good Future.asm` | L | Legacy zone graph with semantic shared engine core, shared objects through Projector, animated tiles, and PLC graph semantically labelled | Mixed; Good Future palette, shared-object data, stage descriptor, and PLC records structured; R31C Padding 3 is the shared suffix provider and reuses structured R12C tail data; non-USA pre-chunks are shared with R31B; USA R31C main Padding 1 stream is also shared | Shared USA animation tail is semantically labeled; zone-specific scroll/draw/load, address labels, and padding streams remain | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-04 (M412) | Classify the USA R31C animation/data tail |
| `R31D__.MMD` | `Level/Collision Chaos/Act 1 Bad Future.asm` | L | Legacy zone graph with semantic shared engine core, shared objects through Projector, animated tiles, and PLC graph semantically labelled | Mixed; Bad Future palette, shared-object data, stage descriptor, and PLC records structured; R31C Padding 3 is reused as the shared suffix | Shared USA animation tail is semantically labeled; zone-specific scroll/draw/load, address labels, and R31D Padding 3 prefix remain | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-04 (M412) | Classify Collision Chaos variant data tails |
| `R32A__.MMD` | `Level/Collision Chaos/Act 2 Present.asm` | L | Legacy zone graph with semantic shared engine core, shared objects through Projector, animated tiles, PLC graph, and retained title-card/Results fragments semantically labelled | Mixed; Present palette/shared-object data, animated tile windows, stage descriptor, PLC records, three-section layout table, complete region-specific pre-chunk program/data snapshots, regional title-card and Results units, retained animated/static PLC metadata and helpers, retained Collision Chaos and orphaned stage/PLC graphs, `DEMO11A` PLC slices, Quartz break-wall tables, the first nine post-chunk Nemesis assets, both complete KamaKama mapping families, the retained shared height-profile data, a complete label-linked Act 1 Past collision/layout graph, and the complete retained legacy demo mapping fragment/table family including all anomalous uncounted tails structured; USA helper/PLC graph now uses the shared provider; R32A Padding 3 reuses the R31C suffix | Zone-specific scroll/draw/load and address labels; both JE and USA pre-chunk blocks and the complete `R32A Padding 2` provider are classified by exact range | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-03 (M276) | Classify exact code/table ranges in the R32B padding streams |
| `R32B__.MMD` | `Level/Collision Chaos/Act 2 Past.asm` | L | Legacy zone graph with semantic shared engine core, shared objects through Projector, animated tiles, and PLC graph semantically labelled | Mixed; retained `R32B` Padding 1/2/3 streams fully range-classified, including the legacy animation tables, Nemesis assets, mapping/animation records, and rotation-vector table | Zone-specific scroll/draw/load and address labels | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-03 (M247) | Classify the remaining R32C/R32D padding streams |
| `R32C__.MMD` | `Level/Collision Chaos/Act 2 Good Future.asm` | L | Legacy zone graph with semantic shared engine core, shared objects through Projector, animated tiles, and PLC graph semantically labelled | Mixed; Good Future palette/shared-object data, shared R33 collision-geometry metadata, collision maps, Act 1 Past relative layout-pointer/background/null graph, GHZ2/GHZ3 fallback layouts, shared Wacky Workbench suffix, R32C Padding 1 PLC/provider graph, and R32C Padding 3 shared suffix provider | Zone-specific scroll/draw/load, address labels | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-03 (M276) | Classify remaining R32C/R32D padding streams |
| `R32D__.MMD` | `Level/Collision Chaos/Act 2 Bad Future.asm` | L | Legacy zone graph with semantic shared engine core, shared objects through Projector, animated tiles, and PLC graph semantically labelled | Mixed; Bad Future palette/shared-object data, collision maps, Act 1 Past relative layout-pointer/background/null graph, GHZ2/GHZ3 fallback layouts, R32D Padding 1 PLC/Results/Signpost prefix, USA helper/PLC graph, and R32D Padding 3 prefix plus R31C-shared suffix | Zone-specific scroll/draw/load, address labels | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-03 (M276) | Classify remaining R32C/R32D padding streams |
| `R33C__.MMD` | `Level/Collision Chaos/Act 3 Good Future.asm` | H | Partial zone graph with semantic shared engine core, complete boss/Drain, shared objects through Projector, animated tiles, and PLC graph semantically labelled | Mixed; Good Future palette, Results/boss/Drain data, shared-object data, stage descriptor, boss/escape PLC records, shared Padding 2 collision-geometry metadata at `$0200-$0283`, packed Padding 3 provider shared with R33D, and pre-chunk provider shared with R33D | Shared USA animation tail is semantically labeled; hybrid R3 zone graph, address labels, and packed data remain | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-04 (M412) | Classify remaining Collision Chaos variant data tails |
| `R33D__.MMD` | `Level/Collision Chaos/Act 3 Bad Future.asm` | H | Partial zone graph with semantic shared engine core, complete boss/Drain, shared objects through Projector, animated tiles, and PLC graph semantically labelled | Mixed; Bad Future palette, Results/boss/Drain data, shared-object data, stage descriptor, boss/escape PLC records, shared Padding 2 collision-geometry metadata at `$0200-$0283`, and R33C-shared packed Padding 3 and pre-chunk streams after their regional prefixes | Shared USA animation tail is semantically labeled; hybrid R3 zone graph, address labels, and packed data remain | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-04 (M412) | Classify remaining Collision Chaos variant data tails |

### Levels — Tidal Tempest

| Output | Entry point | Graph | Code | Data | Unresolved labels/ranges | Binary assets | Regions/switches | Validation | Next milestone |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `DEMO43C.MMD` | `Level/Tidal Tempest/Act 3 Good Future.asm` | H | Partial | Mixed | Hybrid R4 graph, address labels, and retained/padding data | Mixed but mostly named | J/U/E DEMO=1 | J/U/E 2026-09-01 | Converge R42/R43 shared graph |
| `R41A__.MMD` | `Level/Tidal Tempest/Act 1 Present.asm` | L | Legacy | Opaque/mixed | Legacy R41 graph, address labels, and retained streams | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Migrate the R41 act graph |
| `R41B__.MMD` | `Level/Tidal Tempest/Act 1 Past.asm` | L | Legacy | Opaque/mixed | Legacy R41 graph, address labels, and retained streams; USA Padding 1 provider for R41C/R41D | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-03 (M295) | Migrate the R41 act graph |
| `R41C__.MMD` | `Level/Tidal Tempest/Act 1 Good Future.asm` | L | Legacy | Opaque/mixed | Legacy R41 graph, address labels, and retained streams; USA R41B Padding 1 shared after `$0428` | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-03 (M295) | Migrate the R41 act graph |
| `R41D__.MMD` | `Level/Tidal Tempest/Act 1 Bad Future.asm` | L | Legacy | Opaque/mixed | Legacy R41 graph, address labels, and retained streams; USA R41C Padding 1 shared after `$0012` | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-03 (M295) | Migrate the R41 act graph |
| `R42A__.MMD` | `Level/Tidal Tempest/Act 2 Present.asm` | H | Partial | Mixed | Hybrid R4 graph, address labels, and retained/padding data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge R42/R43 shared graph |
| `R42B__.MMD` | `Level/Tidal Tempest/Act 2 Past.asm` | H | Partial | Mixed | Hybrid R4 graph, address labels, and retained/padding data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge R42/R43 shared graph |
| `R42C__.MMD` | `Level/Tidal Tempest/Act 2 Good Future.asm` | H | Partial | Mixed | Hybrid R4 graph, address labels, and retained/padding data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge R42/R43 shared graph |
| `R42D__.MMD` | `Level/Tidal Tempest/Act 2 Bad Future.asm` | H | Partial | Mixed | Hybrid R4 graph, address labels, and retained/padding data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge R42/R43 shared graph |
| `R43C__.MMD` | `Level/Tidal Tempest/Act 3 Good Future.asm` | H | Partial | Mixed | Hybrid R4 graph, address labels, and retained/padding data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge R42/R43 shared graph |
| `R43D__.MMD` | `Level/Tidal Tempest/Act 3 Bad Future.asm` | H | Partial | Mixed | Hybrid R4 graph, address labels, and retained/padding data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge R42/R43 shared graph |

### Levels — Quartz Quadrant

| Output | Entry point | Graph | Code | Data | Unresolved labels/ranges | Binary assets | Regions/switches | Validation | Next milestone |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `R51A__.MMD` | `Level/Quartz Quadrant/Act 1 Present.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data; USA Act 1 stage-object map shared through R5A provider | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-03 (M300) | Converge this zone graph, then classify data |
| `R51B__.MMD` | `Level/Quartz Quadrant/Act 1 Past.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data; USA Act 1 stage-object map shared through R5A provider | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-03 (M300) | Converge this zone graph, then classify data |
| `R51C__.MMD` | `Level/Quartz Quadrant/Act 1 Good Future.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data; USA Act 1 stage-object map shared through R5A provider | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-03 (M300) | Converge this zone graph, then classify data |
| `R51D__.MMD` | `Level/Quartz Quadrant/Act 1 Bad Future.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data; USA Act 1 stage-object map shared through R5A provider | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-03 (M300) | Converge this zone graph, then classify data |
| `R52A__.MMD` | `Level/Quartz Quadrant/Act 2 Present.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data; non-USA pre-chunks shared with R52B | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-03 (M284) | Converge this zone graph, then classify data |
| `R52B__.MMD` | `Level/Quartz Quadrant/Act 2 Past.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data; R52A pre-chunks reused after `$00A0` prefix | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-03 (M284) | Converge this zone graph, then classify data |
| `R52C__.MMD` | `Level/Quartz Quadrant/Act 2 Good Future.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data; R52B pre-chunks shared after `$0156` prefix | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-03 (M285) | Converge this zone graph, then classify data |
| `R52D__.MMD` | `Level/Quartz Quadrant/Act 2 Bad Future.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data; R52B pre-chunks shared after `$005E` prefix | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-03 (M285) | Converge this zone graph, then classify data |
| `R53C__.MMD` | `Level/Quartz Quadrant/Act 3 Good Future.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge this zone graph, then classify data |
| `R53D__.MMD` | `Level/Quartz Quadrant/Act 3 Bad Future.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data; R52 Padding 2 shared after `$0800` prefix | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-03 (M288) | Converge this zone graph, then classify data |

### Levels — Wacky Workbench

| Output | Entry point | Graph | Code | Data | Unresolved labels/ranges | Binary assets | Regions/switches | Validation | Next milestone |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `R61A__.MMD` | `Level/Wacky Workbench/Act 1 Present.asm` | S | Mostly semantic | Mixed | R6 player, stage-draw/scroll, stage-GFX animation, environmental objects, Piston/Platform, Animal/Spike Chain, Launcher/Goddess Statue, Act 1/2 enemies, Robot Generator/Eggman Statue, Seesaw, Tube Door, Projector, Door, and Switch families are semantically labeled; packed/legacy data tails and residual generic labels remain | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-04 (M476) | Classify active data debt, then relabel residual code |
| `R61B__.MMD` | `Level/Wacky Workbench/Act 1 Past.asm` | S | Mostly semantic | Mixed | R6 player, stage-draw/scroll, stage-GFX animation, environmental objects, Piston/Platform, Animal/Spike Chain, Launcher/Goddess Statue, Act 1/2 enemies, Robot Generator/Eggman Statue, Seesaw, Tube Door, Projector, Door, and Switch families are semantically labeled; packed/legacy data tails and residual generic labels remain | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-04 (M476) | Classify active data debt, then relabel residual code |
| `R61C__.MMD` | `Level/Wacky Workbench/Act 1 Good Future.asm` | S | Mostly semantic | Mixed | R6 player, stage-draw/scroll, stage-GFX animation, environmental objects, Piston/Platform, Animal/Spike Chain, Launcher/Goddess Statue, Act 1/2 enemies, Robot Generator/Eggman Statue, Seesaw, Tube Door, Projector, Door, and Switch families are semantically labeled; packed/legacy data tails and residual generic labels remain; bridge and rotation-vector suffix are shared | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-04 (M476) | Classify active data debt, then relabel residual code |
| `R61D__.MMD` | `Level/Wacky Workbench/Act 1 Bad Future.asm` | S | Mostly semantic | Mixed | R6 player, stage-draw/scroll, stage-GFX animation, environmental objects, Piston/Platform, Animal/Spike Chain, Launcher/Goddess Statue, Act 1/2 enemies, Robot Generator/Eggman Statue, Seesaw, Tube Door, Projector, Door, and Switch families are semantically labeled; packed/legacy data tails and residual generic labels remain; rotation-vector suffix shared via R61 final table | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-04 (M476) | Classify active data debt, then relabel residual code |
| `R62A__.MMD` | `Level/Wacky Workbench/Act 2 Present.asm` | S | Mostly semantic | Mixed | R6 player, stage-draw/scroll, stage-GFX animation, environmental objects, Piston/Platform/Crusher, Animal/Spike Chain, Launcher/Goddess Statue, Act 1/2 enemies, Robot Generator/Eggman Statue, Seesaw, Tube Door, Projector, Door, and Switch families are semantically labeled; packed/legacy data tails and residual generic labels remain | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-04 (M476) | Classify active data debt, then relabel residual code |
| `R62B__.MMD` | `Level/Wacky Workbench/Act 2 Past.asm` | S | Mostly semantic | Mixed | R6 player, stage-draw/scroll, stage-GFX animation, environmental objects, Piston/Platform/Crusher, Animal/Spike Chain, Launcher/Goddess Statue, Act 1/2 enemies, Robot Generator/Eggman Statue, Seesaw, Tube Door, Projector, Door, and Switch families are semantically labeled; packed/legacy data tails and residual generic labels remain; unique `$0200` prefix then R62C non-USA Padding 2 stream | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-04 (M476) | Classify active data debt, then relabel residual code |
| `R62C__.MMD` | `Level/Wacky Workbench/Act 2 Good Future.asm` | S | Mostly semantic | Mixed | R6 player, stage-draw/scroll, stage-GFX animation, environmental objects, Piston/Platform/Crusher, Animal/Spike Chain, Launcher/Goddess Statue, Act 1/2 enemies, Robot Generator/Eggman Statue, Seesaw, Tube Door, Projector, Door, and Switch families are semantically labeled; packed/legacy data tails and residual generic labels remain; provides R62B non-USA Padding 2 continuation; shared-prefix suffix reuses the R61C bridge | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-04 (M476) | Classify active data debt, then relabel residual code |
| `R62D__.MMD` | `Level/Wacky Workbench/Act 2 Bad Future.asm` | S | Mostly semantic | Mixed | R6 player, stage-draw/scroll, stage-GFX animation, environmental objects, Piston/Platform/Crusher, Animal/Spike Chain, Launcher/Goddess Statue, Act 1/2 enemies, Robot Generator/Eggman Statue, Seesaw, Tube Door, Projector, Door, and Switch families are semantically labeled; packed/legacy data tails and residual generic labels remain | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-04 (M476) | Classify active data debt, then relabel residual code |
| `R63C__.MMD` | `Level/Wacky Workbench/Act 3 Good Future.asm` | S | Mostly semantic | Mixed | USA stage-GFX orchestration, tile-animation, shared stage-draw, 3C scroll, Piston/Platform/Crusher, Animal/Spike Chain, Launcher/Goddess Statue, Snake Blocks, Electric Beams, Spin Platform, Bounce Platform, Freezer, Tunnel Path, Projector, Door, and Switch families are semantically labeled; packed/legacy data tails and residual generic labels remain elsewhere | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-04 (M477) | Classify active data debt, then relabel residual code |
| `R63D__.MMD` | `Level/Wacky Workbench/Act 3 Bad Future.asm` | S | Mostly semantic | Mixed | R6 player, 3D stage-draw/scroll, stage-GFX animation, Piston/Platform/Crusher, Animal/Spike Chain, Launcher/Goddess Statue, Snake Blocks, Electric Beams, Spin Platform, Bounce Platform, Freezer, Tunnel Path, Projector, Door, and Switch families are semantically labeled; packed/legacy data tails and residual generic labels remain | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-04 (M477) | Classify active data debt, then relabel residual code |

### Levels — Stardust Speedway

| Output | Entry point | Graph | Code | Data | Unresolved labels/ranges | Binary assets | Regions/switches | Validation | Next milestone |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `R71A__.MMD` | `Level/Stardust Speedway/Act 1 Present.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data; packed Prefix provider for R71B/R71C; Padding 2 provider via R7B | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-03 (M290) | Converge this zone graph, then classify data |
| `R71B__.MMD` | `Level/Stardust Speedway/Act 1 Past.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data; R71A packed prefix and Padding 2 shared via R7B | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-03 (M290) | Converge this zone graph, then classify data |
| `R71C__.MMD` | `Level/Stardust Speedway/Act 1 Good Future.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data; R71A packed prefix shared after `$08D0`; R7B Padding 2 shared after `$0200` | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-03 (M290) | Converge this zone graph, then classify data |
| `R71D__.MMD` | `Level/Stardust Speedway/Act 1 Bad Future.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data; R7B Padding 2 shared after `$0E00` | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-03 (M290) | Converge this zone graph, then classify data |
| `R72A__.MMD` | `Level/Stardust Speedway/Act 2 Present.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data; Padding 2/packed-prefix providers and shared R72A/R72C non-USA continuation | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-03 (M298) | Converge this zone graph, then classify data |
| `R72B__.MMD` | `Level/Stardust Speedway/Act 2 Past.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge this zone graph, then classify data |
| `R72C__.MMD` | `Level/Stardust Speedway/Act 2 Good Future.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data; R72A packed prefix and non-USA continuation shared after `$04E4` | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-03 (M298) | Converge this zone graph, then classify data |
| `R72D__.MMD` | `Level/Stardust Speedway/Act 2 Bad Future.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data; R7B Padding 2 shared after `$0E00` | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-03 (M290) | Converge this zone graph, then classify data |
| `R73C__.MMD` | `Level/Stardust Speedway/Act 3 Good Future.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data; Padding 2 provider for R81A/B/C | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-03 (M294) | Converge this zone graph, then classify data |
| `R73D__.MMD` | `Level/Stardust Speedway/Act 3 Bad Future.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge this zone graph, then classify data |

### Levels — Metallic Madness

| Output | Entry point | Graph | Code | Data | Unresolved labels/ranges | Binary assets | Regions/switches | Validation | Next milestone |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `DEMO82A.MMD` | `Level/Metallic Madness/Act 2 Present.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data; rotation-vector suffix shared | Mixed but mostly named | J/U/E DEMO=1 | J/U/E 2026-09-03 (M297) | Converge this zone graph, then classify data |
| `R81A__.MMD` | `Level/Metallic Madness/Act 1 Present.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data; R73C Padding 2 shared after `$194B` | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-03 (M294) | Converge this zone graph, then classify data |
| `R81B__.MMD` | `Level/Metallic Madness/Act 1 Past.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data; R73C Padding 2 shared after `$194B` | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-03 (M294) | Converge this zone graph, then classify data |
| `R81C__.MMD` | `Level/Metallic Madness/Act 1 Good Future.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data; R73C Padding 2 shared after `$194B` | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-03 (M294) | Converge this zone graph, then classify data |
| `R81D__.MMD` | `Level/Metallic Madness/Act 1 Bad Future.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge this zone graph, then classify data |
| `R82A__.MMD` | `Level/Metallic Madness/Act 2 Present.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data; retail/JE tails reuse rotation vectors | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-03 (M297) | Converge this zone graph, then classify data |
| `R82B__.MMD` | `Level/Metallic Madness/Act 2 Past.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge this zone graph, then classify data |
| `R82C__.MMD` | `Level/Metallic Madness/Act 2 Good Future.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge this zone graph, then classify data |
| `R82D__.MMD` | `Level/Metallic Madness/Act 2 Bad Future.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge this zone graph, then classify data |
| `R83C__.MMD` | `Level/Metallic Madness/Act 3 Good Future.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge this zone graph, then classify data |
| `R83D__.MMD` | `Level/Metallic Madness/Act 3 Bad Future.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge this zone graph, then classify data |

### Special Stage

| Output | Entry point | Graph | Code | Data | Unresolved labels/ranges | Binary assets | Regions/switches | Validation | Next milestone |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `SPMM__.MMD` | `Special Stage/Main.asm` | S | Mostly semantic | Mixed | Residual unknown fields and binary frame/animation data | Mixed but named | J/U/E | J/U/E 2026-09-01 | Classify Special Stage data formats |
| `SPSS__.BIN` | `Special Stage/Sub.asm` | S | Mostly semantic | Mixed | Residual unknown fields and binary frame/animation data | Mixed but named | J/U/E | J/U/E 2026-09-01 | Classify Special Stage data formats |

## Updating This Inventory

For each completed milestone:

1. Update every affected component row, including shared consumers.
2. Record the exact regions and date freshly validated.
3. Keep unresolved ranges concrete; do not replace them with a general claim
   of source-backed completeness.
4. Run `python3 tools/audit_disassembly.py --check` so the
   matrix, build producers, and comparison frontend remain in agreement.
5. Update the remediation-plan milestone ledger in the same commit.
