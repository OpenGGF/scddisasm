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
| `ATTACK.MMD` | `Time Attack/Main.asm` | L | Legacy | Opaque/mixed | About 1,600 address labels and a packed suffix | Mixed | J/U/E | J/U/E 2026-09-01 | Recover one Time Attack routine family |
| `BADEND.BIN` | `FMV/Sub (Ending).asm` | S | Mostly semantic | Mostly classified | Residual unknown fields/tables | Mostly classified | J/U/E DATAFILE=1 | J/U/E 2026-09-01 | Inventory residual labels and data |
| `COME__.MMD` | `Comin Soon/Main.asm` | S | Mostly semantic | Mostly classified | Residual unknown fields/tables | Mostly classified | J/U/E | J/U/E 2026-09-01 | Inventory residual labels and data |
| `ENDING.MMD` | `FMV/Main (Ending).asm` | L | Legacy | Opaque/mixed | 822 address labels and a large source-emitted image | Mixed | J/U/E | J/U/E 2026-09-01 | Recover one ending-FMV routine/data family |
| `GOODEND.BIN` | `FMV/Sub (Ending).asm` | S | Mostly semantic | Mostly classified | Residual unknown fields/tables | Mostly classified | J/U/E DATAFILE=0 | J/U/E 2026-09-01 | Inventory residual labels and data |
| `OPEN_M.MMD` | `FMV/Main (Opening).asm` | S | Mostly semantic | Mostly classified | Residual unknown fields/tables | Mostly classified | J/U/E | J/U/E 2026-09-01 | Inventory residual labels and data |
| `OPEN_S.BIN` | `FMV/Sub (Opening).asm` | S | Mostly semantic | Mostly classified | Residual unknown fields/tables | Mostly classified | J/U/E | J/U/E 2026-09-01 | Inventory residual labels and data |
| `OPN.STM` | `bin/MakeSTM.exe + src/FMV/Data/Opening.gif + Opening.wav` | S | N/A | Generated stream | MakeSTM format documentation | Source GIF/WAV classified | J/U/E | J/U/E 2026-09-01 | Document MakeSTM inputs and reproducibility |
| `PTEST.BIN` | `FMV/Sub (Pencil Test).asm` | S | Mostly semantic | Mostly classified | Residual unknown fields/tables | Mostly classified | J/U/E | J/U/E 2026-09-01 | Inventory residual labels and data |
| `PTEST.MMD` | `FMV/Main (Pencil Test).asm` | S | Mostly semantic | Mostly classified | Residual unknown fields/tables | Mostly classified | J/U/E | J/U/E 2026-09-01 | Inventory residual labels and data |
| `THANKS_D.BIN` | `Thank You/Data.asm` | S | N/A | Classified compressed graphics | No executable code | Classified | J/U/E | J/U/E 2026-09-01 | Document the data format and round trip |
| `THANKS_M.MMD` | `Thank You/Main.asm` | H | Partial | Opaque/mixed | 163 address labels and large declaration regions | Mixed | J/U/E | J/U/E 2026-09-01 | Recover one Thank You routine/data family |
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
| `R12A__.MMD` | `Level/Palmtree Panic/Act 2 Present.asm` | S | Mostly semantic | Mixed | Packed/legacy data tails and residual generic labels | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Classify active data debt, then relabel residual code |
| `R12B__.MMD` | `Level/Palmtree Panic/Act 2 Past.asm` | S | Mostly semantic | Mixed | Packed/legacy data tails and residual generic labels | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Classify active data debt, then relabel residual code |
| `R12C__.MMD` | `Level/Palmtree Panic/Act 2 Good Future.asm` | S | Mostly semantic | Mixed | Packed/legacy data tails and residual generic labels | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Classify active data debt, then relabel residual code |
| `R12D__.MMD` | `Level/Palmtree Panic/Act 2 Bad Future.asm` | S | Mostly semantic | Mixed | Packed/legacy data tails and residual generic labels | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Classify active data debt, then relabel residual code |
| `R13C__.MMD` | `Level/Palmtree Panic/Act 3 Good Future.asm` | S | Mostly semantic | Mixed | Packed/legacy data tails and residual generic labels | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Classify active data debt, then relabel residual code |
| `R13D__.MMD` | `Level/Palmtree Panic/Act 3 Bad Future.asm` | S | Mostly semantic | Mixed | Packed/legacy data tails and residual generic labels | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Classify active data debt, then relabel residual code |

### Levels — Collision Chaos

| Output | Entry point | Graph | Code | Data | Unresolved labels/ranges | Binary assets | Regions/switches | Validation | Next milestone |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `R31A__.MMD` | `Level/Collision Chaos/Act 1 Present.asm` | H | Hybrid zone graph with semantic shared engine and expanding zone/common-object cluster; intro and shared animal families semantically labelled | Mixed; Present palette, section-art tables, object state/animation/mapping records structured; intro and animal data classified | Later recovered object implementations, address labels, and padding/data tails | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 (M67) | Recover the next Collision Chaos object implementation |
| `R31B__.MMD` | `Level/Collision Chaos/Act 1 Past.asm` | L | Legacy zone graph with semantic shared engine core; shared animal family semantically labelled | Mixed; Past palette and animal data structured | Zone-specific scroll/draw/load, object code, address labels, and padding streams | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 (M67) | Converge the next zone-specific routine cluster |
| `R31C__.MMD` | `Level/Collision Chaos/Act 1 Good Future.asm` | L | Legacy zone graph with semantic shared engine core; shared animal family semantically labelled | Mixed; Good Future palette and animal data structured | Zone-specific scroll/draw/load, object code, address labels, and padding streams | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 (M67) | Converge the next zone-specific routine cluster |
| `R31D__.MMD` | `Level/Collision Chaos/Act 1 Bad Future.asm` | L | Legacy zone graph with semantic shared engine core; shared animal family semantically labelled | Mixed; Bad Future palette and animal data structured | Zone-specific scroll/draw/load, object code, address labels, and padding streams | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 (M67) | Converge the next zone-specific routine cluster |
| `R32A__.MMD` | `Level/Collision Chaos/Act 2 Present.asm` | L | Legacy zone graph with semantic shared engine core; shared animal family semantically labelled | Mixed; Present palette and animal data structured | Zone-specific scroll/draw/load, object code, address labels, and padding streams | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 (M67) | Converge the next zone-specific routine cluster |
| `R32B__.MMD` | `Level/Collision Chaos/Act 2 Past.asm` | L | Legacy zone graph with semantic shared engine core; shared animal family semantically labelled | Mixed; Past palette and animal data structured | Zone-specific scroll/draw/load, object code, address labels, and padding streams | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 (M67) | Converge the next zone-specific routine cluster |
| `R32C__.MMD` | `Level/Collision Chaos/Act 2 Good Future.asm` | L | Legacy zone graph with semantic shared engine core; shared animal family semantically labelled | Mixed; Good Future palette and animal data structured | Zone-specific scroll/draw/load, object code, address labels, and padding streams | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 (M67) | Converge the next zone-specific routine cluster |
| `R32D__.MMD` | `Level/Collision Chaos/Act 2 Bad Future.asm` | L | Legacy zone graph with semantic shared engine core; shared animal family semantically labelled | Mixed; Bad Future palette and animal data structured | Zone-specific scroll/draw/load, object code, address labels, and padding streams | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 (M67) | Converge the next zone-specific routine cluster |
| `R33C__.MMD` | `Level/Collision Chaos/Act 3 Good Future.asm` | H | Partial zone graph with semantic shared engine core; shared animal family semantically labelled | Mixed; Good Future palette and animal data structured | Hybrid R3 zone graph, address labels, and packed data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 (M67) | Converge the next zone-specific routine cluster |
| `R33D__.MMD` | `Level/Collision Chaos/Act 3 Bad Future.asm` | H | Partial zone graph with semantic shared engine core; shared animal family semantically labelled | Mixed; Bad Future palette and animal data structured | Hybrid R3 zone graph, address labels, and packed data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 (M67) | Converge the next zone-specific routine cluster |

### Levels — Tidal Tempest

| Output | Entry point | Graph | Code | Data | Unresolved labels/ranges | Binary assets | Regions/switches | Validation | Next milestone |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `DEMO43C.MMD` | `Level/Tidal Tempest/Act 3 Good Future.asm` | H | Partial | Mixed | Hybrid R4 graph, address labels, and retained/padding data | Mixed but mostly named | J/U/E DEMO=1 | J/U/E 2026-09-01 | Converge R42/R43 shared graph |
| `R41A__.MMD` | `Level/Tidal Tempest/Act 1 Present.asm` | L | Legacy | Opaque/mixed | Legacy R41 graph, address labels, and retained streams | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Migrate the R41 act graph |
| `R41B__.MMD` | `Level/Tidal Tempest/Act 1 Past.asm` | L | Legacy | Opaque/mixed | Legacy R41 graph, address labels, and retained streams | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Migrate the R41 act graph |
| `R41C__.MMD` | `Level/Tidal Tempest/Act 1 Good Future.asm` | L | Legacy | Opaque/mixed | Legacy R41 graph, address labels, and retained streams | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Migrate the R41 act graph |
| `R41D__.MMD` | `Level/Tidal Tempest/Act 1 Bad Future.asm` | L | Legacy | Opaque/mixed | Legacy R41 graph, address labels, and retained streams | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Migrate the R41 act graph |
| `R42A__.MMD` | `Level/Tidal Tempest/Act 2 Present.asm` | H | Partial | Mixed | Hybrid R4 graph, address labels, and retained/padding data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge R42/R43 shared graph |
| `R42B__.MMD` | `Level/Tidal Tempest/Act 2 Past.asm` | H | Partial | Mixed | Hybrid R4 graph, address labels, and retained/padding data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge R42/R43 shared graph |
| `R42C__.MMD` | `Level/Tidal Tempest/Act 2 Good Future.asm` | H | Partial | Mixed | Hybrid R4 graph, address labels, and retained/padding data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge R42/R43 shared graph |
| `R42D__.MMD` | `Level/Tidal Tempest/Act 2 Bad Future.asm` | H | Partial | Mixed | Hybrid R4 graph, address labels, and retained/padding data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge R42/R43 shared graph |
| `R43C__.MMD` | `Level/Tidal Tempest/Act 3 Good Future.asm` | H | Partial | Mixed | Hybrid R4 graph, address labels, and retained/padding data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge R42/R43 shared graph |
| `R43D__.MMD` | `Level/Tidal Tempest/Act 3 Bad Future.asm` | H | Partial | Mixed | Hybrid R4 graph, address labels, and retained/padding data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge R42/R43 shared graph |

### Levels — Quartz Quadrant

| Output | Entry point | Graph | Code | Data | Unresolved labels/ranges | Binary assets | Regions/switches | Validation | Next milestone |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `R51A__.MMD` | `Level/Quartz Quadrant/Act 1 Present.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge this zone graph, then classify data |
| `R51B__.MMD` | `Level/Quartz Quadrant/Act 1 Past.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge this zone graph, then classify data |
| `R51C__.MMD` | `Level/Quartz Quadrant/Act 1 Good Future.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge this zone graph, then classify data |
| `R51D__.MMD` | `Level/Quartz Quadrant/Act 1 Bad Future.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge this zone graph, then classify data |
| `R52A__.MMD` | `Level/Quartz Quadrant/Act 2 Present.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge this zone graph, then classify data |
| `R52B__.MMD` | `Level/Quartz Quadrant/Act 2 Past.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge this zone graph, then classify data |
| `R52C__.MMD` | `Level/Quartz Quadrant/Act 2 Good Future.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge this zone graph, then classify data |
| `R52D__.MMD` | `Level/Quartz Quadrant/Act 2 Bad Future.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge this zone graph, then classify data |
| `R53C__.MMD` | `Level/Quartz Quadrant/Act 3 Good Future.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge this zone graph, then classify data |
| `R53D__.MMD` | `Level/Quartz Quadrant/Act 3 Bad Future.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge this zone graph, then classify data |

### Levels — Wacky Workbench

| Output | Entry point | Graph | Code | Data | Unresolved labels/ranges | Binary assets | Regions/switches | Validation | Next milestone |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `R61A__.MMD` | `Level/Wacky Workbench/Act 1 Present.asm` | S | Mostly semantic | Mixed | Packed/legacy data tails and residual generic labels | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Classify active data debt, then relabel residual code |
| `R61B__.MMD` | `Level/Wacky Workbench/Act 1 Past.asm` | S | Mostly semantic | Mixed | Packed/legacy data tails and residual generic labels | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Classify active data debt, then relabel residual code |
| `R61C__.MMD` | `Level/Wacky Workbench/Act 1 Good Future.asm` | S | Mostly semantic | Mixed | Packed/legacy data tails and residual generic labels | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Classify active data debt, then relabel residual code |
| `R61D__.MMD` | `Level/Wacky Workbench/Act 1 Bad Future.asm` | S | Mostly semantic | Mixed | Packed/legacy data tails and residual generic labels | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Classify active data debt, then relabel residual code |
| `R62A__.MMD` | `Level/Wacky Workbench/Act 2 Present.asm` | S | Mostly semantic | Mixed | Packed/legacy data tails and residual generic labels | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Classify active data debt, then relabel residual code |
| `R62B__.MMD` | `Level/Wacky Workbench/Act 2 Past.asm` | S | Mostly semantic | Mixed | Packed/legacy data tails and residual generic labels | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Classify active data debt, then relabel residual code |
| `R62C__.MMD` | `Level/Wacky Workbench/Act 2 Good Future.asm` | S | Mostly semantic | Mixed | Packed/legacy data tails and residual generic labels | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Classify active data debt, then relabel residual code |
| `R62D__.MMD` | `Level/Wacky Workbench/Act 2 Bad Future.asm` | S | Mostly semantic | Mixed | Packed/legacy data tails and residual generic labels | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Classify active data debt, then relabel residual code |
| `R63C__.MMD` | `Level/Wacky Workbench/Act 3 Good Future.asm` | S | Mostly semantic | Mixed | Packed/legacy data tails and residual generic labels | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Classify active data debt, then relabel residual code |
| `R63D__.MMD` | `Level/Wacky Workbench/Act 3 Bad Future.asm` | S | Mostly semantic | Mixed | Packed/legacy data tails and residual generic labels | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Classify active data debt, then relabel residual code |

### Levels — Stardust Speedway

| Output | Entry point | Graph | Code | Data | Unresolved labels/ranges | Binary assets | Regions/switches | Validation | Next milestone |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `R71A__.MMD` | `Level/Stardust Speedway/Act 1 Present.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge this zone graph, then classify data |
| `R71B__.MMD` | `Level/Stardust Speedway/Act 1 Past.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge this zone graph, then classify data |
| `R71C__.MMD` | `Level/Stardust Speedway/Act 1 Good Future.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge this zone graph, then classify data |
| `R71D__.MMD` | `Level/Stardust Speedway/Act 1 Bad Future.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge this zone graph, then classify data |
| `R72A__.MMD` | `Level/Stardust Speedway/Act 2 Present.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge this zone graph, then classify data |
| `R72B__.MMD` | `Level/Stardust Speedway/Act 2 Past.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge this zone graph, then classify data |
| `R72C__.MMD` | `Level/Stardust Speedway/Act 2 Good Future.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge this zone graph, then classify data |
| `R72D__.MMD` | `Level/Stardust Speedway/Act 2 Bad Future.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge this zone graph, then classify data |
| `R73C__.MMD` | `Level/Stardust Speedway/Act 3 Good Future.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge this zone graph, then classify data |
| `R73D__.MMD` | `Level/Stardust Speedway/Act 3 Bad Future.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge this zone graph, then classify data |

### Levels — Metallic Madness

| Output | Entry point | Graph | Code | Data | Unresolved labels/ranges | Binary assets | Regions/switches | Validation | Next milestone |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `DEMO82A.MMD` | `Level/Metallic Madness/Act 2 Present.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data | Mixed but mostly named | J/U/E DEMO=1 | J/U/E 2026-09-01 | Converge this zone graph, then classify data |
| `R81A__.MMD` | `Level/Metallic Madness/Act 1 Present.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge this zone graph, then classify data |
| `R81B__.MMD` | `Level/Metallic Madness/Act 1 Past.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge this zone graph, then classify data |
| `R81C__.MMD` | `Level/Metallic Madness/Act 1 Good Future.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge this zone graph, then classify data |
| `R81D__.MMD` | `Level/Metallic Madness/Act 1 Bad Future.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge this zone graph, then classify data |
| `R82A__.MMD` | `Level/Metallic Madness/Act 2 Present.asm` | H | Partial | Mixed | Hybrid common/objects/rN graph and packed/retained data | Mixed but mostly named | J/U/E DEMO=0 | J/U/E 2026-09-01 | Converge this zone graph, then classify data |
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
