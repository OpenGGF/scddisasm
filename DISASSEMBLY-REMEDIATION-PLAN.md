# Non-BRAM Disassembly Remediation Plan

## Purpose

This document tracks the work required to turn the non-BRAM portion of this
repository from a byte-exact, source-backed reconstruction into a consistently
structured and documented disassembly.

Backup RAM programs and data are explicitly out of scope for this plan. They
must not be used when calculating progress or selecting the next milestone.

Byte equality remains a non-negotiable constraint. Semantic recovery must not
change include order, binary layout, regional behavior, or any generated
component unless a separately approved change intentionally does so.

## Reconstruction Boundary

The repository supports byte-exact reconstruction of the Japan, USA, and
Europe 2,048-byte-sector data tracks from tracked source plus explicitly
identified external inputs. It does not independently reproduce a complete
mixed-mode game disc:

- `BADEND.STM`, `GOODEND.STM`, and `PTEST.STM` remain externally supplied
  encoded media streams.
- `ABS.TXT`, `BIB.TXT`, and `CPY.TXT` remain externally supplied ISO
  identification metadata.
- The build emits the retail data-track ISO; it does not build the disc's audio
  tracks or a complete CUE/BIN-style mixed-mode image.

At the initial audit, the existing USA output passed all 133 comparisons in
`REGION=1 ./check.sh`. The repository records successful Japan, USA, and Europe
component comparisons and zero-mismatch data-track comparisons against local
CHDs. A fresh three-region build and CHD comparison was not repeated during the
audit.

## Initial Audit Findings

The audit was performed on commit `407be4b` and excluded `src/Backup RAM/`.
The measurements are heuristics for prioritization, not substitutes for manual
classification.

### What is already strong

- The build and comparison frontends identify the real assembly entry points
  and supported regional variants.
- Newer `src/Level/` modules commonly use descriptive routine names, symbolic
  object fields, functional file boundaries, and useful inline comments.
- Palmtree Panic and Wacky Workbench provide good examples of the intended
  subsystem-oriented level structure.
- Most `.nem`, `.kos`, `.eni`, `.unc`, map, graphics, and audio inputs are
  legitimate assets. A semantic disassembly does not require turning pixels or
  known compressed streams into thousands of `dc.b` declarations.

### Active legacy and hybrid source graphs

- Collision Chaos Acts 1 and 2 select legacy entry graphs directly, although
  partially structured alternatives are present in the tree.
- Tidal Tempest Act 1 also selects legacy entry graphs directly.
- Later Tidal Tempest acts, Quartz Quadrant, Stardust Speedway, and Metallic
  Madness use hybrid graphs that combine descriptive `Level/` modules with
  older `common/`, `objects/`, and `rN/` trees.
- A literal include-graph audit found 95 apparently unselected assembly or
  include files. Some are expected editor data or conditional helpers, but
  others are parallel or unfinished implementations. They require manual
  disposition rather than automatic deletion.

### Naming and commentary debt

The legacy `common/`, `objects/`, and `r1`/`r3`-`r8` trees contain approximately:

- 836 assembly/include files;
- 236,800 lines;
- 997 instruction lines with inline comments; and
- 11,600 address-derived labels before counting `L_FFxxxx` labels.

Across all non-BRAM source, the audit found approximately 17,300 definitions in
the common address-derived families `L_FFxxxx`, `loc_xxx`, `sub_xxx`,
`off_xxx`, and address-named data labels.

Large standalone examples include:

- `src/Time Attack/Main.asm`: 5,210 lines and about 1,600 address-derived
  labels;
- `src/FMV/Main (Ending).asm`: 16,190 lines, about 822 address-derived labels,
  and more than 14,000 `dc.*` declarations; and
- `src/Thank You/Main.asm`: partially named, but still heavily dependent on
  `L_FFxxxx` labels and embedded instruction bytes.

### Unclassified and mechanically emitted data

The non-BRAM assembly/include source contains approximately 149,900 `dc.b`,
`dc.w`, or `dc.l` lines. Data declarations are not inherently debt, but their
meaning must be explicit.

The initial audit found:

- 279 files with names containing terms such as `Padding`, `Legacy`, `Packed`,
  or `Retained`;
- approximately 44,966 `dc.*` lines in those files;
- 175 files that are at least 90 percent declarations and contain at least 100
  declaration lines, including both legitimate mappings and opaque streams;
  and
- 79 tracked binary assets with address-derived names such as
  `byte_238A42_1a.bin`.

The present source-backed status of these bytes is sufficient for
reconstruction, but not for semantic completion.

### Documentation debt

The main documentation is dominated by chronological milestone records. It
does not yet provide a concise architecture guide, active build graph, data
format index, or component-by-component semantic status matrix. The IDA README
is empty.

## Definition of Semantic Completion

A non-BRAM component is semantically complete only when all of the following
are true:

1. Every active executable range is expressed as assembly instructions rather
   than unexplained `dc.*` bytes.
2. Routines have functional names. Temporary address-derived labels are either
   renamed or recorded in a bounded, explicit debt inventory.
3. Important routines document their purpose, inputs, outputs, clobbers, and
   externally visible side effects. Comments should explain intent and unusual
   behavior, not merely restate every instruction.
4. RAM, hardware registers, object fields, commands, flags, and table entries
   use meaningful symbols where their purpose is known.
5. Every data range is classified as a structured table, known compressed
   stream, editable asset, genuine fill/alignment, or explicitly unresolved
   data.
6. Binary assets have descriptive names and documented formats. Binary assets
   may remain binary when that is their natural representation.
7. Each output has one canonical active source graph. Parallel implementations
   are removed, archived as documentation, or explicitly justified.
8. All affected regional component comparisons remain byte-exact.

Repository-wide completion additionally requires all non-BRAM entries in the
status inventory to meet this definition, all three regional checks to pass,
and the regional data tracks to match their reference CHDs when the local
comparison tools and images are available.

## Operating Rules

Every agent working on this plan must follow these rules:

1. Read `AGENTS.md`, this document, the current status inventory, `make.sh` or
   `make.bat`, and the latest relevant commits before editing.
2. Work on one bounded milestone at a time. A milestone should normally cover
   one executable range, one routine family, one data format, or one set of
   outputs that necessarily share the same source.
3. Trace every changed fragment to its true assembly entry points and all
   regional or compile-time variants before editing.
4. Preserve byte output. Prefer symbol aliases, labels, macros, comments, and
   include-boundary changes that do not alter emitted bytes.
5. Run the narrowest meaningful assembly checks during development, then run
   every affected regional comparison required by the shared source graph.
6. Update the status inventory and the progress ledger in this document as
   part of the same milestone.
7. Inspect `git status --short` before committing. Generated files, listings,
   logs, `out/`, proprietary originals, and disc images must remain untracked.
8. Commit each successfully validated milestone separately with a short,
   imperative subject.
9. Push that commit to the current branch's upstream immediately after the
   commit. Verify that the remote branch contains the local commit before
   starting the next milestone.
10. Do not accumulate several completed milestones into one final commit or
    defer all pushes until the end.
11. If validation or push fails, diagnose it before starting another
    milestone. Do not mark the milestone complete until its required checks
    pass and its commit is present on the remote.
12. Never weaken the displayless build safety rules to make an assembler run.
    Report a missing prerequisite or known headless tool limitation instead.

Commit subjects should describe the semantic result, for example:

- `Migrate Collision Chaos Act 1 entry graph`
- `Name Time Attack VDP initialization routines`
- `Classify R31B packed mapping stream`
- `Document legacy level data formats`

## Progress Tracking

Create `docs/disassembly-status.md` during milestone M1. It should contain one
row per built non-BRAM component, with at least these fields:

- output name;
- assembly entry point;
- active source graph (`structured`, `hybrid`, or `legacy`);
- code status;
- data status;
- unresolved labels/ranges;
- binary asset status;
- affected regions and switches;
- last validation result; and
- next recommended milestone.

Machine-generated measurements should live in a repeatable audit script rather
than being manually recomputed in prose. The script must exclude BRAM and
distinguish active source from tracked but unreachable source. Its output is an
aid to manual review; it must not automatically classify declarations as
opaque merely because they use `dc.*`.

### Milestone ledger

| Milestone | Status | Scope | Validation and handoff |
| --- | --- | --- | --- |
| M0 | Complete | Establish the non-BRAM audit, definitions, roadmap, and per-milestone commit/push protocol. | Existing USA output: all 133 `check.sh` comparisons matched; documentation-only change. |
| M1 | Complete | Add the 124-component status matrix and repeatable non-BRAM audit tooling. | Audit/check and JSON invariants pass: all build/check/status sets agree, active plus unreachable equals tracked, zero active includes are missing, and repository hygiene is clean. Documentation-only; no fresh assembly was required. |
| M2 | Complete | Normalize the shared Level Sonic animation include to its exact filesystem case. | Audit/check reports zero missing or case-mismatched includes. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe; all 133 comparisons matched in each region, including the eleven affected Palmtree Panic retail/demo outputs. |
| M3 | Complete | Converge the shared Collision Chaos present-time palette-cycle routine used by R31A and R32A. Replace the active address-labelled implementation with the descriptive source, preserve the original fall-through and short-call encodings, correct the first cycle color to `$0EE`, and remove the superseded duplicate. | Audit/check reports zero missing or case-mismatched includes and one fewer unreachable source. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe; all 133 comparisons matched in each region, including affected `R31A__.MMD` and `R32A__.MMD`. |
| M4 | Complete | Converge the shared `LoadPalette` implementation across all ten Collision Chaos outputs. Route the legacy and hybrid R3 graphs through the descriptive shared routine after confirming its label, ABI, instructions, and layout match; leave the four differently named palette fade/load routines for a dedicated compatibility milestone. | Audit/check reports zero missing or case-mismatched includes. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe; all 133 comparisons matched in each region, including affected `R31A-D`, `R32A-D`, and `R33C-D` outputs. |
| M5 | Complete | Converge the shared fade-palette loader across all ten Collision Chaos outputs. Give the descriptive `LoadFadePal` routine an opt-in `LoadFadePalette` entry alias for recovered graphs, then route every legacy and hybrid R3 graph through that canonical implementation. | Audit/check reports zero missing or case-mismatched includes. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe; all 133 comparisons matched in each region, including affected `R31A-D`, `R32A-D`, and `R33C-D` outputs. |
| M6 | Complete | Converge the shared water and water-fade palette loaders across all ten Collision Chaos outputs. Give `LoadWaterPal` and `LoadWaterFadePal` opt-in recovered-ABI entry labels, then route every legacy and hybrid R3 graph through the canonical descriptive implementations. | Audit/check reports zero missing or case-mismatched includes. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe; all 133 comparisons matched in each region, including affected `R31A-D`, `R32A-D`, and `R33C-D` outputs. |
| M7 | Complete | Converge the complete palette-fading engine across all ten Collision Chaos outputs. Bind its newer `ProcessPLCs` service name to the recovered byte-identical `AdvanceGfxQueue` implementation in the R3 compatibility layer, then replace every historical palette-fade include with the descriptive shared source. | Audit/check reports zero missing or case-mismatched includes. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe; all 133 comparisons matched in each region, including affected `R31A-D`, `R32A-D`, and `R33C-D` outputs. |
| M8 | Complete | Converge Collision Chaos Present palette data shared by R31A and R32A. Model the two distinct full stage palettes with a named record macro, retain semantic and recovered aliases for their consumers, route both outputs through the descriptive table/assets, and remove the superseded address-labelled source. | Audit/check reports zero missing or case-mismatched includes, one fewer tracked source, and two fewer unreachable ASM/INC files. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe; all 133 comparisons matched in each region, including affected `R31A__.MMD` and `R32A__.MMD`. |
| M9 | Complete | Converge Collision Chaos Past palette data shared by R31B and R32B. Correct the descriptive table to its single stage-palette entry, retain the recovered stage-palette alias, activate the variant source with `CC_VARIANT=1`, and remove the superseded address-labelled source. | Audit/check reports zero missing or case-mismatched includes and one fewer tracked source. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe; all 133 comparisons matched in each region, including affected `R31B__.MMD` and `R32B__.MMD`. Europe was rerun successfully after disposable prior validation outputs exhausted local disk space before assembly. |
| M10 | Complete | Converge Collision Chaos Good Future palette data shared by R31C, R32C, and R33C. Correct the pointer-table order, model the live and level-end stage palettes with a named record macro, retain recovered aliases for all four palette records, activate the source with `CC_VARIANT=2`, and remove the superseded address-labelled source. | Audit/check reports zero missing or case-mismatched includes and one fewer tracked source. After correcting a column-sensitive `EQU` syntax error found by the first build, fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe; all 133 comparisons matched in each region, including affected `R31C__.MMD`, `R32C__.MMD`, and `R33C__.MMD`. |
| M11 | Complete | Converge Collision Chaos Bad Future palette data shared by R31D, R32D, and R33D. Add recovered aliases to the already correctly ordered descriptive records, activate the source with `CC_VARIANT=3`, and remove the final address-labelled time-period palette source. | Audit/check reports zero missing or case-mismatched includes and one fewer tracked source. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe; all 133 comparisons matched in each region, including affected `R31D__.MMD`, `R32D__.MMD`, and `R33D__.MMD`. |
| M12 | Complete | Converge the no-op Collision Chaos Past palette cycle shared by R31B and R32B. Add the recovered `CyclePalette` entry alias to the descriptive routine, route both graphs through the canonical variant source, and remove the superseded six-line source. | Audit/check reports zero missing or case-mismatched includes and one fewer tracked source. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe; all 133 comparisons matched in each region, including affected `R31B__.MMD` and `R32B__.MMD`. |
| M13 | Complete | Converge the Good and Bad Future palette-cycle engine shared by R31C-D, R32C-D, and R33C-D. Preserve short intermediate calls and final-cycle fall-through in the descriptive variant routine, move the Act 3 variant selection ahead of the shared cycle/data includes, and remove the final two address-labelled palette-cycle sources. | Audit/check reports zero missing or case-mismatched includes and two fewer tracked sources. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe; all 133 comparisons matched in each region, including affected `R31C-D`, `R32C-D`, and `R33C-D` outputs. The complete Collision Chaos palette subsystem now has one canonical source graph. |
| M14 | Complete | Converge the shared Sonic 1 despawn, VSync, sine/cosine, and angle-calculation cluster across all ten Collision Chaos outputs. Add opt-in recovered entry aliases to `Level/Functions (Misc).asm` and replace the three historical includes in each R3 graph; retain the historical files because other zone graphs still consume them. | Audit/check reports zero missing or case-mismatched includes. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe; all 133 comparisons matched in each region, including affected `R31A-D`, `R32A-D`, and `R33C-D` outputs. |
| M15 | Complete | Converge the shared player floor-collision and block-collision engine across all ten Collision Chaos outputs. Route every R3 graph through `Level/Collision Floor.asm`, expose the recovered public entry names and `StageChunks` binding only for semantic R3 consumers, and retain the two historical common files because Tidal Tempest, Quartz Quadrant, Wacky Workbench, Stardust Speedway, and Metallic Madness still consume them. | Audit/check reports zero missing or case-mismatched includes. After validation exposed and bounded the missing `LevelChunks` binding and the Tidal Tempest compatibility scope, fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe; all 133 comparisons matched in each region, including affected `R31A-D`, `R32A-D`, and `R33C-D` outputs. |
| M16 | Complete | Converge the ten-file general-service sequence across all ten Collision Chaos outputs. Replace recovered random, controller, VDP, Z80, FM queue, tilemap, Nemesis, PLC, Enigma, and Kosinski fragments with `Level/Functions (General).asm`; bind historical public names only for R3 consumers, retain the recovered no-op `PlayFmMusic` label on the semantic initializer's existing unreachable `rts`, and omit the duplicate player-selection helper supplied by R3 scrolling. Retain the historical common files because other zone graphs still consume them. | Audit/check reports zero missing or case-mismatched includes. Validation first bounded three compatibility namespace collisions and then identified a repeated two-byte growth caused by emitting rather than labelling the existing no-op instruction. After those corrections, fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe; all 133 comparisons matched in each region, including affected `R31A-D`, `R32A-D`, and `R33C-D` outputs. |
| M17 | Complete | Converge the shared level main loop and interrupt handlers across all ten Collision Chaos outputs. Route every R3 graph through `Level/Main.asm`, suppress the recovered-to-semantic aliases inherited from the R6 layer for these consumers, and bind the structured main loop to the recovered R3 scroll, draw, loading, object, Sub CPU, animation, HUD, collision, and graphics providers without changing their instruction streams. Retain `common/main.asm` because Quartz Quadrant, Wacky Workbench, Stardust Speedway, and Metallic Madness still consume it. | Audit/check reports zero missing or case-mismatched includes. The first Japan build identified the complete inverse-ABI surface as unresolved symbols; after binding those definitions, fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A-D`, `R32A-D`, and `R33C-D` outputs. |
| M18 | Complete | Converge Collision Chaos Act 1 Present scrolling for `R31A`. Route the recovered graph through `Level/Collision Chaos/Scroll (Act 1 Present).asm`, preserve the retained Sonic 1 ending/demo start-position path, selected-player `a6` ABI, and USA event-before-camera ordering behind an R3-scoped compatibility switch, and remove the superseded recovered source. | Audit/check reports zero missing or case-mismatched includes and one fewer tracked source. Validation bounded a 42-byte omitted demo-start path, direct-player addressing differences, and the USA-specific event order; after restoring those retained behaviours, fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD`. |
| M19 | Complete | Converge Collision Chaos Act 1 Present stage drawing for `R31A`. Replace the recovered composite with `Stage Draw (Act 1 Present).asm` and the shared `Block Draw.asm`, preserve the historical placement of the block engine between live drawing and initialization under an R3-scoped switch, bind the recovered `PlaceBlock` ABI to `PlaceBlockAtPos`, and remove the superseded recovered source. | Audit/check reports zero missing or case-mismatched includes and one fewer tracked source. The first USA build exposed the missing block-replacement ABI; the next comparison localized address differences to the composite module's observable include order. After preserving both details, fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD`. |
| M20 | Complete | Converge Collision Chaos Act 1 Present level-data loading for `R31A`. Route the recovered graph through `Palmtree Panic/Load Level Data.asm`, expose its recovered `LoadStageData`, `InitSectionGfx`, and `StageMaps` providers through R3-scoped semantic aliases, and remove the superseded recovered loader. | Audit/check reports zero missing or case-mismatched includes and one fewer tracked source. The first USA build showed that the deliberately reduced R31A compatibility surface also needed an explicit `LevelLayouts` binding; after adding it, fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD`. |
| M21 | Complete | Converge the shared level-event engine for `R31A`. Route the graph through `Level/_Events.asm`, let the semantic `RunLevelEvents` entry own the implementation, and retain an R3-scoped inverse `StageEvents` alias for recovered callers. Retain `common/events.asm` because the other legacy zone graphs still consume it. | Audit/check reports zero missing or case-mismatched includes. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD`; the non-USA runs also verify the region-conditional Quartz Quadrant event bytes emitted within the shared module. |
| M22 | Complete | Converge the shared object update, movement, drawing, sprite, and visibility services for `R31A`. Route the graph through `Level/Object Functions.asm` and bind its semantic entries to the recovered `UpdateObjects`, `MoveObjectFall`, `MoveObject`, `DeleteOtherObject`, and visibility ABI under an R3-scoped switch. Retain `common/object.asm` because the other legacy zone graphs still consume it. | Audit/check reports zero missing or case-mismatched includes. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD`. |
| M23 | Complete | Converge the `R31A` object dispatch table. Route the graph through `Collision Chaos/Object Index (Act 1 Present).asm`, bind its descriptive object entries to the recovered providers under an R3-scoped switch, use the table's colocated semantic null routine, and remove the superseded R31A table. Retain `objects/null.asm` because sixteen other legacy graphs still consume it. | Audit/check reports zero missing or case-mismatched includes and one fewer tracked source. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, verifying every absolute object pointer and downstream address in affected `R31A__.MMD`. |
| M24 | Complete | Converge the Sub CPU command service for `R31A`. Route the graph through `Level/Sub CPU.asm`, invert the recovered `SubCpuCommand`/semantic `SubCPUCmd` ABI under an R3-scoped switch, and retain `common/sub_cpu.asm` because the other legacy zone graphs still consume it. | Audit/check reports zero missing or case-mismatched includes. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD`. |
| M25 | Complete | Converge the shared object-animation interpreter for `R31A`. Route the graph through `Level/Object Animate.asm`; the semantic source preserves all six script-control opcodes and the recovered offset-1 animation-frame access without requiring compatibility aliases. Retain `common/object_animate.asm` because the other legacy zone graphs still consume it. | Audit/check reports zero missing or case-mismatched includes. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD`. |
| M26 | Complete | Converge the checkpoint object and checkpoint-save routine for `R31A`. Route the graph through `Level/_Objects/Checkpoint/Main.asm`, bind the recovered object, mapping, animation, allocation, and despawn providers under an R3-scoped switch, and preserve R31A's saved mini-Sonic byte. Retain `objects/checkpoint.asm` because sixteen other legacy graphs still consume it. | Audit/check reports zero missing or case-mismatched includes. The first Japan build identified the two later recovered service providers needed by the semantic object; after binding them, fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD`. |
| M27 | Complete | Converge the Sonic 1 drowning-music reset leftover for `R31A`. Route the graph through the documented `Level/Resume Music (Leftover).asm` no-op and bind recovered `PlayerResetDrown` calls to semantic `ResumeMusicS1` under an R3-scoped switch. Retain `common/drown_reset.asm` because the other legacy zone graphs still consume it. | Audit/check reports zero missing or case-mismatched includes. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD`. |
| M28 | Complete | Converge the unused test badnik for `R31A`. Route the graph through `Level/_Objects/Test Badnik/Main.asm` and bind the recovered dispatch, powerup mappings, and powerup animation providers under an R3-scoped switch. Retain `objects/test.asm` because the other legacy zone graphs still consume it. | Audit/check reports zero missing or case-mismatched includes. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD`. |
| M29 | Complete | Converge the explosion and points-creation object for `R31A`. Route the graph through `Level/_Objects/Explosion/Main.asm`, bind the recovered dispatch and asset providers, and document/expose the byte-neutral `SpawnPoints` entry used directly by the R3 bumper, glass-shatter, and points-pocket objects. Retain `objects/explosion.asm` because the other legacy zone graphs still consume it. | Audit/check reports zero missing or case-mismatched includes. The first Japan assembly showed that the recovered global entry changed local-label scope; promoting the end label to `ObjExplosion_MakePoints_End` preserved the structure and bytes. Fresh displayless Steam Proton Experimental builds then completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD`. |
| M30 | Complete | Converge the flower seed/growth object for `R31A`. Route the graph through `Level/_Objects/Flower/Main.asm`, bind its recovered dispatch, mappings, animation, and floor-distance providers, preserve the non-water tile-priority path, and retain the semantic classification of its unfinished respawn bookkeeping. Retain `objects/flower.asm` because the other legacy zone graphs still consume it. | Audit/check reports zero missing or case-mismatched includes. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD`. |
| M31 | Complete | Converge the spin-tunnel waterfall splash object for `R31A`. Route the graph through `Level/_Objects/Spin Tunnel/Main (Waterfall Splash).asm` and bind its recovered dispatch, mapping, and animation providers under an R3-scoped switch while preserving the Past-specific tile selection. Retain `objects/r1/tunnel_splash.asm` because the other legacy zone graphs still consume it. | Audit/check reports zero missing or case-mismatched includes. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD`. |
| M32 | Complete | Converge the spin-tunnel door, door-splash setup, and door-splash objects for `R31A`. Route the graph through `Level/_Objects/Spin Tunnel/Main (Door).asm`; bind its recovered dispatch, mappings, animations, and tile-ID service under an R3-scoped switch; and preserve both the retail narrow-door subtype path and the scrapped splash-setup entry. Retain `objects/r1/h_door.asm` because the other legacy zone graphs still consume it. | Audit/check reports zero missing or case-mismatched includes. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD`. |
| M33 | Complete | Converge the shield, invincibility-star, and time-warp-star powerup object and its animated-art loader for `R31A`. Route the graph through `Level/_Objects/Powerup/Main.asm` and bind its recovered dispatch, art-loader entry, mappings, animations, and five art providers under an R3-scoped switch while preserving Collision Chaos's layer-priority path. Retain `objects/powerup.asm` because the other legacy zone graphs still consume it. | Audit/check reports zero missing or case-mismatched includes. The first Japan assembly exposed the recovered animated-tile caller and art-provider ABI that is normally hidden by the shared semantic-player compatibility branch; after binding those names explicitly, fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD`. |
| M34 | Complete | Converge the Collision Chaos roll-tunnel object for `R31A`. Route the graph through `Level/Collision Chaos/Objects/Roll Tunnel/Main.asm`, bind its recovered dispatch under an R3-scoped switch, and explicitly preserve R31A's all-region X-radius write and low-byte debug-mode test through a graph-local legacy ABI selector. Retain `objects/roll_tunnel.asm` because the other legacy zone graphs still consume it. | Audit/check reports zero missing or case-mismatched includes. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD`; the Japan and Europe results verify the two encodings selected by the R31A-specific ABI path. |
| M35 | Complete | Converge the boulder object for `R31A`. Route the graph through `Level/_Objects/Boulder/Main.asm`, bind its recovered dispatch under an R3-scoped switch, and finish the semantic mapping data by replacing its address-derived frame label and unexplained literal tail byte with a named local frame and the containing module's ordinary alignment. Retain `objects/r1/boulder.asm` because the other legacy zone graphs still consume it. | Audit/check reports zero missing or case-mismatched includes, and the semantic boulder mapping has no residual address-derived labels. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD`. |
| M36 | Complete | Converge the floating-block object for `R31A`. Route the graph through `Level/_Objects/Floating Block/Main.asm`, bind its recovered dispatch under an R3-scoped switch, and finish its semantic data by replacing three address-derived animation labels and six address-derived mapping labels with named scripts and sprite frames, compact frame records, and explicit alignment. Retain `objects/r1/float_block.asm` because the other legacy R3 graphs still consume it. | Audit/check reports zero missing or case-mismatched includes, and the semantic floating-block data has no residual address-derived labels. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD`. |
| M37 | Complete | Converge the normal, attached-sprite, and moving-spring code graph for `R31A`. Route the graph through `Level/_Objects/Spring/Main.asm` and bind both recovered dispatch entries, the four recovered mapping names used by later debug data, and the recovered bottom-solidity service under an R3-scoped switch. Retain `objects/spring.asm` because the other legacy zone graphs still consume it. The canonical spring animation and mapping files remain explicitly unresolved because their address-derived data labels require a separate structural milestone. | Audit/check reports zero missing or case-mismatched includes. The first Japan assembly exposed the later recovered `BottomSolidObject` provider required by the semantic downward spring; after binding it, fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD`. |
| M38 | Complete | Structure the six canonical spring animation and mapping files shared by `R31A` and the other semantic spring graphs. Replace all address-derived script/frame labels with descriptive names, consolidate fragmented bytes into animation commands and five-byte sprite pieces, and express every required padding byte as explicit record alignment. | Audit/check reports zero missing or case-mismatched includes and no address-derived labels in the canonical spring data. The first Japan assembly showed that the vertical table's forward local labels crossed the horizontal table's public-label scope; promoting all nine shared mapping frames to descriptive global labels resolved the source structure. Fresh displayless Steam Proton Experimental builds then completed for Japan, USA, and Europe, and all 133 comparisons matched in each region. |
| M39 | Complete | Converge the placed-ring, lost-ring, collection, and sparkle code graph for `R31A`. Route the graph through `Level/_Objects/Ring/Main.asm` and bind both recovered dispatch entries, the recovered mapping/animation names used by later objects, and the recovered allocate-after-current service under an R3-scoped switch. Retain `objects/ring.asm` because the other legacy zone graphs still consume it. The four canonical ring data files remain explicitly unresolved because their address-derived records require a separate structural milestone. | Audit/check reports zero missing or case-mismatched includes. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD`. |
| M40 | Complete | Structure the four canonical ring data files shared by `R31A` and the other semantic ring graphs. Replace the address-derived sparkle-script and sprite-frame labels with descriptive names, consolidate fragmented bytes into animation commands and five-byte sprite pieces, and let the containing module's existing alignment represent the normal ring table's genuine tail padding. | Audit/check reports zero missing or case-mismatched includes and no address-derived labels in the canonical ring data. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, verifying the nine normal-ring frames, four Sonic 1 large-ring views, and eight large-ring flash frames. |
| M41 | Complete | Converge the time icon, time post, monitor shell, and spawned monitor-item code graph for `R31A`. Route the graph through `Level/_Objects/Monitor and Time Post/Main.asm` and bind both recovered dispatch entries plus the recovered mapping/animation names used by later debug data under an R3-scoped switch. Retain `objects/monitor_time.asm` because the other legacy zone graphs still consume it. The two canonical monitor data files remain explicitly unresolved because their address-derived records require a separate structural milestone. | Audit/check reports zero missing or case-mismatched includes. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including the region-specific invincibility and speed-shoes timer paths in affected `R31A__.MMD`. |
| M42 | Complete | Structure the two canonical monitor/time-post data files shared by `R31A` and the other semantic monitor graphs. Replace all address-derived script and frame labels with descriptive reward, time-post, shell, and HUD roles; consolidate fragmented bytes into animation commands and five-byte sprite pieces; and express every required internal padding byte as record alignment. | Audit/check reports zero missing or case-mismatched includes and no address-derived labels in the canonical monitor/time-post data. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, verifying ten animation scripts and twenty mapping frames. |
| M43 | Complete | Converge the points popup, HUD object, score/ring update, and numeric drawing code graph for `R31A`. Route the graph through `Level/_Objects/HUD and Points/Main.asm`, invert the recovered main-loop HUD update bridge, and bind the recovered combined-object dispatch and HUD-number art provider under an R3-scoped switch. Retain `objects/hud_points.asm` because the other legacy zone graphs still consume it. The two canonical HUD/points mapping files remain explicitly unresolved because their address-derived records require a separate structural milestone. | Audit/check reports zero missing or case-mismatched includes. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD`. |
| M44 | Complete | Structure the two canonical HUD/points mapping files shared by `R31A` and the other semantic HUD graphs. Replace all ten address-derived frame labels and their twenty definitions/references with named reward-tier, score, lives, debug-position, and rings roles; consolidate fragmented bytes into five-byte sprite pieces; and express required internal padding as record alignment. | Audit/check reports zero missing or case-mismatched includes and no address-derived labels in the canonical HUD/points data. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, verifying six points-popup frames and four HUD frames. |
| M45 | Complete | Converge the Collision Chaos bumper and flipper code graph for `R31A`. Route the graph through `Level/Collision Chaos/Objects/Bumper and Flipper/Main.asm`, bind the recovered dispatch and mapping providers, and preserve the historical `d1` bumper dispatcher, `ADDI #-1` step counter, absolute asset/slope addressing, shared `SpawnPoints` call, and recovered despawn provider behind an R31A-only compatibility switch. Retain `objects/r3/bumper_flipper.asm` because the other legacy R3 and R8 graphs still consume it. | Audit/check reports zero missing or case-mismatched includes. Validation first exposed the recovered despawn-provider ABI and then localized the only byte difference to the bumper dispatcher's destination register. After bounding both details, fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD`. |
| M46 | Complete | Converge the Collision Chaos moving bumper-platform code graph for `R31A`. Route the graph through `Level/Collision Chaos/Objects/Bumper Platform/Main.asm`, bind the recovered dispatch and mapping providers used by the object index and later debug data, and preserve the historical `ADDI #-1` movement-step encoding behind an R31A-only compatibility switch. Retain `objects/r3/bumper_platform.asm` because the other legacy R3 graphs still consume it. | Audit/check reports zero missing or case-mismatched includes. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD`. |
| M47 | Complete | Converge the Collision Chaos glass-shatter code graph for `R31A`. Route the graph through `Level/Collision Chaos/Objects/Glass Shatter/Main.asm`, bind the recovered dispatch, animation, and mapping providers, and preserve the recovered graph's direct call to the earlier shared `SpawnPoints` entry without emitting the semantic helper body behind an R31A-only compatibility switch. Retain `objects/r3/glass_shatter.asm` because the other legacy R3 graphs still consume it. | Audit/check reports zero missing or case-mismatched includes. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD` and all downstream absolute addresses. |
| M48 | Complete | Converge the Collision Chaos Ga parent and dust-child code/data graph for `R31A`. Route the graph through `Level/Collision Chaos/Objects/Ga/Main.asm`, bind the recovered dispatch, time-check, animation, and mapping providers, and preserve the recovered entry's uncleared `d0`, five `ADDI #-1` timer encodings, absolute parent-animation reference, backward reuse of the first animation tail, and animation/mapping/dust include order behind an R31A-only compatibility switch. Retain `objects/r3/ga.asm` because the other legacy R3 graphs still consume it. | Audit/check reports zero missing or case-mismatched includes. Validation first exposed the recovered `DestroyInGoodFuture` provider bridge, then the ISO size check localized a two-byte growth to the semantic entry's extra `moveq`. After bounding both details, fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD`. |
| M49 | Complete | Converge the unused Collision Chaos teleporter object for `R31A`. Route the graph through `Level/Collision Chaos/Objects/Teleporter/Main.asm` and bind the recovered dispatch and mapping providers used by the object index and later debug data. The canonical source documents the retail implementation as an immediate deletion stub while retaining its classified sprite mapping. Retain `objects/r3/teleporter.asm` because the other legacy R3 graphs still consume it. | Audit/check reports zero missing or case-mismatched includes. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD`. |
| M50 | Complete | Converge the Collision Chaos points-pocket parent, player-capture checker, and animated child graph for `R31A`. Route the graph through `Level/Collision Chaos/Objects/Pocket/Main.asm`, bind the recovered dispatch, animation, and mapping providers, and preserve the recovered word-branch topology, checker-before-caught continuation, nine `ADDI #-1` timers, `a6` player-control update, recovered player-width field, `ADDI #-$10` Y adjustment, two shared `SpawnPoints` tail calls without a private helper body, absolute player-control bit clears, and child parent-check branch behind an R31A-only compatibility switch. Retain `objects/r3/points_pocket.asm` because the other legacy R3 graphs still consume it. | Audit/check reports zero missing or case-mismatched includes. Validation first localized a two-byte shrink and checker displacement to the caught-continuation order, then identified the recovered player-width/Y-adjust encodings and final word-sized child branch. After bounding those details, fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD`. |
| M51 | Complete | Converge the Collision Chaos Tentou parent and bomb-child code/data graph for `R31A`. Route the graph through `Level/Collision Chaos/Objects/Tentou/Main.asm`, bind the recovered dispatch, collision-distance, animation, and mapping providers, and preserve the recovered uncleared subtype register, `ADDI #-1` subtype/timer encodings, indirect left/right wall-check dispatch, animation/mapping order, and two bomb timers behind an R31A-only compatibility switch. Restore and classify the retained unreferenced player-range helper as executable code with a functional name and result description rather than omitting or emitting it as unexplained data. Retain `objects/r3/tentou.asm` because the other legacy R3 graphs still consume it. | Audit/check reports zero missing or case-mismatched includes. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD` and the restored unused helper range. |
| M52 | Complete | Converge the Collision Chaos rotating spike-chain parent and three Present-stage child segments for `R31A`. Route the graph through `Level/Collision Chaos/Objects/Spike Chain/Main.asm`, bind the recovered dispatch and two mapping providers used by the object index and later debug data, and preserve the recovered subtype-load flag encoding behind an R31A-only compatibility switch. The canonical source explicitly documents that R31A's recovered `STAGE_TIME=1` topology emits three visible segments. Retain `objects/r3/spike_chain.asm` because the other legacy R3 graphs and the distinct R6 implementation still consume their historical sources. | Audit/check reports zero missing or case-mismatched includes. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD`. |
| M53 | Complete | Converge the `R31A` section-art loader, update routine, range/PLC tables, and fixed object-tile helper. Replace the recovered composite with `Level/Section Art Load.asm` plus `Level/Collision Chaos/Section Data (Act 1 Present).asm`, make the semantic load/update/tile entries canonical, retain byte-neutral recovered routine/table aliases, and document the `$4F2` tile helper's boulder/tunnel-door/spring role. Retain `r3/section_gfx_1a.asm` because the other legacy R3 graph families still use their historical section modules. | Audit/check reports zero missing or case-mismatched includes. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD` and its loader→tables→tile-helper layout. |
| M54 | Complete | Recover the Collision Chaos stationary, attached, and four-direction retracting spikes implementation into the new canonical `Level/Collision Chaos/Objects/Spikes/Main.asm` module for `R31A`. Replace all address-derived routine/data labels with functional names, document object-state fields and the four width/radius/collision subtype records, express every active executable byte as an instruction, retain the R3 custom-despawn contract, and use the already structured four-frame R3 mapping asset. Retain `objects/r3/spikes.asm` because the other legacy R3 graphs still consume it; do not substitute the behaviorally narrower shared Palmtree spikes object. | Audit/check reports zero missing or case-mismatched includes and no address-derived labels in the new canonical module or its mapping asset. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD`. |
| M55 | Complete | Converge the Collision Chaos moving block and player-responsive hidden block pair for `R31A`. Route both recovered implementations through the combined canonical `Level/Collision Chaos/Objects/Block/Main.asm`, bind their recovered dispatch and mapping providers, and preserve the historical custom R3 despawn checks, short solid-object call, byte-sized motion-table indexing, stationary early-return placement, PC-relative hidden-block helper calls, shared clamp-return targets, and intervening block-mapping layout behind an R31A-only compatibility switch. Retain `objects/r3/block.asm` and `objects/r3/hidden_block.asm` because the other legacy R3 graphs still consume them. | Audit/check reports zero missing or case-mismatched includes and no address-derived labels in the canonical block module or its two mapping assets. Validation localized the initial differences to the moving block's early-return position and word-sized table indexing, then to the hidden block's shared clamp-return branches. After preserving those bounded encodings, fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD`. |
| M56 | Complete | Converge the Collision Chaos metal-platform dispatcher, player-weight bobbing, four looping horizontal/vertical motion paths, and three delayed-drop paths for `R31A`. Route the recovered implementation through `Level/Collision Chaos/Objects/Metal Platform/Main.asm`, bind its recovered dispatch and mapping providers, document the subtype families and four-byte motion-record schema, and preserve the historical custom R3 despawn flow, byte-sized table indexing, absolute motion-table addresses, PC-relative helper calls, setup-frame returns, shared solid/return joins, and later drum-platform player-slot helper dependency behind an R31A-only compatibility switch. Retain `objects/r3/metal_platform.asm` because the other legacy R3 graphs still consume it. | Audit/check reports zero missing or case-mismatched includes and no address-derived labels in the canonical metal-platform module or its mapping asset. Validation first exposed the recovered solid helper's narrower ABI and then localized all remaining size differences to duplicated return sites in the semantic control-flow layout; modelling those as shared named joins restored the exact stream without opaque data. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD`. |
| M57 | Complete | Converge the Collision Chaos vertically triggered sliding door for `R31A`. Route the recovered implementation through `Level/Collision Chaos/Objects/Door/Main.asm`, bind its recovered dispatch and mapping providers, document its subtype sign/delay roles, and preserve the custom R3 despawn check plus the historical direction-first control flow, separate PC-relative offset updater, and later drum-platform player-slot helper dependency behind an R31A-only compatibility switch. The canonical four-byte delay table and two-piece mapping frame remain structured data. Retain `objects/r3/door.asm` because the other legacy R3 graphs still consume it. | Audit/check reports zero missing or case-mismatched includes and no address-derived labels in the canonical door module. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD`; the same builds also verified the ordinary semantic door path used by the newer graph. |
| M58 | Complete | Converge the complete Collision Chaos fire-shooter family for `R31A`: subtype-zero emitter, subtype-one five-state flame, and both subtype-two accelerating projectiles. Route the graph through `Level/Collision Chaos/Objects/Fire Shooter/Main.asm`, bind the recovered dispatch/animation/mapping providers, document all three subtype roles and the animation/mapping records, and preserve the two custom R3 despawn paths, uncleared initial subtype register, emitter/flame initializer returns, relocated short solid helper, later drum-platform player-slot call, short lowering branch, byte-sized projectile Y adjustment, word-sized flame-timer clear, and recovered projectile deletion topology behind an R31A-only compatibility switch. Retain `objects/r3/fire_shooter.asm` because the other legacy R3 graphs still consume it. | Audit/check reports zero missing or case-mismatched includes and no address-derived labels in the canonical family or its animation/mapping data. Validation localized one short-call range failure to the recovered solid helper's historical placement, two size differences to the uncleared subtype register and initializer returns, and the final opcode difference to the word-sized timer clear. After modelling each as executable structure, fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD`. |
| M59 | Complete | Converge the Collision Chaos drum-platform dispatcher, subtype-selected bounce states, solidity adjustment, motion records, priority table, and mapping graph for `R31A`. Route the graph through `Level/Collision Chaos/Objects/Drum Platform/Main.asm`, bind its recovered dispatch and mapping providers, document the subtype/state families and three-byte motion-record schema, and preserve the custom R3 despawn flow plus the historically placed player-slot helper consumed by the preceding metal-platform, door, and fire-shooter modules behind an R31A-only compatibility switch. Give that cross-object helper a functional canonical name without moving its executable bytes. Retain `objects/r3/drum_platform.asm` because the other legacy R3 graphs still consume it. | Audit/check reports zero missing or case-mismatched includes and no address-derived labels in the canonical drum-platform module or its mapping asset. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD` and the three earlier objects' PC-relative helper calls. |
| M60 | Complete | Recover the Collision Chaos saved-object despawn helper into the new canonical `Level/Collision Chaos/Object Despawn.asm` module for `R31A`. Document the three-byte saved-object record, time-period selection, loaded-bit contract, and no-record deletion path; express the whole routine with semantic object/RAM names and a functional local label; and preserve its exact location after the drum-platform graph because eight canonical obstacle paths branch to it. Retain `r3/object_despawn.asm` because every other legacy R3 graph still consumes it. | Audit/check reports zero missing or case-mismatched includes and no address-derived labels or unexplained data declarations in the canonical helper. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD` and its eight incoming despawn branches. |
| M61 | Complete | Converge the Collision Chaos KamaKama parent and thrown-sickle child family for `R31A`. Route the graph through `Level/Collision Chaos/Objects/KamaKama/Main.asm`; name its parent timer and the sickle's parent, launch-delay, parent-flags, base-X, gravity, and damage-timer fields; document positive/negative subtype behavior and parent-slot lifetime validation; give both animation tables functional script names; and document the five-byte mapping-piece schema. Preserve the recovered shared animation join, PC-relative movement/spawn calls, parent-to-turnaround fall-through, negative-subtype early return, explicit parent-ID displacement, animation/mapping placement, and later parent-map providers behind an R31A-only compatibility switch. Retain `objects/r3/kama_kama.asm` because the other legacy R3 graphs still consume it. | Audit/check reports zero missing or case-mismatched includes and no address-derived labels in the canonical family or its animation/mapping assets. The first Japan build exposed two recovered collision-service names; the first comparison then localized its only four differing bytes to the negative-subtype sickle-spawn early return. After modelling both contracts explicitly, fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD`. |
| M62 | Complete | Converge the shared flower-capsule, big-ring/flash, goal-post, signpost, results-trigger, and capsule-palette level-end family for `R31A`. Route the recovered graph through `Level/_Objects/Level End/Main.asm`, bind its semantic object entries and later R3 animation/mapping providers, and expose the recovered entries and big-ring-flash asset names for downstream consumers behind an R31A-only compatibility switch. Documented canonical routines retain structured capsule explosion offsets, seed velocities, goal-post tile IDs, time-bonus records, palette data, animation/mapping data, and Nemesis art; retain `objects/stage_end.asm` because other legacy R3/R4/R5/R6/R7/R8 graphs still consume it. | Audit/check reports zero missing or case-mismatched includes and no address-derived labels in the canonical family. The first Japan build identified the recovered graph's unlabeled `StageDataIndex+$E` palette byte as the semantic `LevelPaletteID`; after adding that byte-neutral binding, fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD`. |
| M63 | Complete | Recover the active Collision Chaos introductory Metal Sonic parent range for `R31A`. Replace its address-derived dispatcher, six state labels, control-flow joins, bobbing helper, exhaust spawner, capture/abort path, and shared movement-helper names with functional labels; document its object-state ABI, side effects, fixed-point motion, and child-link contract; and propagate semantic names for the interleaved composite's shared facing, animation, palette, and player-load helpers without moving any executable bytes. Keep Amy, spikes, hearts, and exhaust as explicit follow-up ranges because their historical interleaving makes the complete composite too broad for one reviewable milestone. | Audit/check reports zero missing or case-mismatched includes and reduces active address-derived labels by nineteen, from 16,519 to 16,500. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD` and downstream absolute addresses. |
| M64 | Complete | Recover the active Collision Chaos Amy Rose parent, shared cutscene-animation engine, palette loader/table, heart emitter, and heart-child ranges for `R31A`. Replace their address-derived dispatchers, lifecycle states, acceleration/clamp joins, animation-parser states, palette records, spawn exits, and heart timing phases with functional labels; document Amy's object-state ABI and side effects, the two-byte animation-frame record, palette fall-through contract, overflow-driven heart emission, and heart lifetime; and classify the retained unreachable return between Amy's initialization and running states as an explicit executable leftover rather than unexplained data. Preserve the composite's historical interleaving and leave intro spikes and Metal Sonic exhaust as bounded follow-up ranges. | Audit/check reports zero missing or case-mismatched includes and reduces active address-derived labels by twenty-seven, from 16,500 to 16,473. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD` and downstream absolute addresses. |
| M65 | Complete | Recover the active Collision Chaos introductory spike-barrier parent and three flying shard children for `R31A`. Replace the address-derived dispatcher, solid/hurt flow, Metal Sonic slot scan and proximity joins, subtype setup, shard-spawn loop, motion initializer/table, lifetime state, and delete entry with functional labels; document all four subtype roles, the three-shard child contract, four-byte X/Y velocity records, gravity/lifetime fields, and the historical sound-to-motion fall-through that also initializes the broken parent. Preserve every active byte as structured instructions or classified motion records while leaving the following Metal Sonic exhaust range for a separate milestone. | Audit/check reports zero missing or case-mismatched includes, no address-derived labels in the recovered spike range, and reduces active address-derived labels by fifteen, from 16,473 to 16,458. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD` and downstream absolute addresses. |
| M66 | Complete | Recover the final active Collision Chaos introductory-object executable range for `R31A`: Metal Sonic's exhaust child and its animation script. Replace the address-derived dispatcher, initialization/main states, position join, and deletion entry with functional labels; document the 16-bit parent-slot link, object-ID lifetime check, facing-dependent follow offset, and four-frame looping flicker record; and give the single animation table/script descriptive local labels. Together with M63-M65, the complete interleaved `objects/r3/intro.asm` executable composite now has no address-derived label definitions while retaining its historical layout. | Audit/check reports zero missing or case-mismatched includes, no address-derived labels anywhere in the active intro composite, and reduces active address-derived labels by three, from 16,458 to 16,455. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including affected `R31A__.MMD` and downstream absolute addresses. |
| M67 | Complete | Recover the shared Collision Chaos freed-animal and Metal Sonic projector-hologram family used by all ten `R31A-D`, `R32A-D`, and `R33C-D` outputs. Replace both address-derived dispatchers, flying/ground lifecycle states, orbit helper, shared draw/delete/flip/tile helpers, and base-tile table label with functional names; document the subtype split, projector parent-slot contract, flying orbit fields, 16.16 ground velocity/gravity behavior, landing-state progression, and `[act * 4 + time_zone]` art selection. Structure and document both animation tables and all eight mapping frames with named freed/hologram scripts, pose roles, empty pulse frames, and the five-byte sprite-piece schema. | Audit/check reports zero missing or case-mismatched includes, no address-derived labels in the recovered family, and reduces active address-derived labels by twelve, from 16,455 to 16,443. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including all ten affected Collision Chaos outputs. |
| M68 | Complete | Recover the shared Collision Chaos robot-generator family used by all ten `R31A-D`, `R32A-D`, and `R33C-D` outputs. Replace its address-derived dispatcher, lifecycle joins, inactive/solid exits, explosion completion and allocation exits, float helper, explosion-schedule label, and base-tile table label with functional names; document its Past-only activation, reused object fields, one-pixel float cadence, `[act * 4 + time_zone]` art selection, and the twenty-one three-byte explosion records plus `$FF` terminator. Structure the shared animation and mapping assets with a named active-Past script, eight functional state/frame labels, and an explicit five-byte sprite-piece schema. | Audit/check reports zero missing or case-mismatched includes, no address-derived labels in the recovered family, and reduces active address-derived labels by fifteen, from 16,443 to 16,428. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including all ten affected Collision Chaos outputs. |
| M69 | Complete | Recover the shared Collision Chaos Metal Sonic projector and linked hologram-child family used by all ten `R31A-D`, `R32A-D`, and `R33C-D` outputs. Replace its address-derived dispatcher, parent/hologram lifecycle states, delete/solid/explosion joins, child-size/animation setup, and explosion-schedule label with functional names; document the projector's reused state fields, four spawned child contracts, 16-bit parent-slot links, parent invalidation byte, sixty-frame destruction delay, and twelve three-byte explosion records followed by a `$FF` terminator and explicit alignment byte. Structure both hologram animation scripts and all six projector/beam/Metal Sonic mapping frames with functional labels and the five-byte sprite-piece schema. | Audit/check reports zero missing or case-mismatched includes, no address-derived labels in the recovered family, and reduces active address-derived labels by eleven, from 16,428 to 16,417. Fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including all ten affected Collision Chaos outputs. |
| M70 | Complete | Converge the shared object time-zone checks across all ten `R31A-D`, `R32A-D`, and `R33C-D` outputs. Route every R3 graph through `Level/Object Time Check.asm`, expose the recovered `DestroyInGoodFuture` entry as a byte-neutral colocated label, select the recovered `CheckObjectDespawn` provider behind an explicit R3 switch, and invert the earlier Ga compatibility bridge only when a graph still uses the legacy provider. Preserve `common/time_check.asm` because Tidal Tempest, Quartz Quadrant, Wacky Workbench, Stardust Speedway, and Metallic Madness continue to consume it. | Audit/check reports zero missing or case-mismatched includes; the repository-wide address-label total is unchanged because both semantic and legacy modules remain active in distinct graphs. The first Japan build bounded asm68k's unresolved forward-`EQU` behavior and the recovered despawn-provider name; after moving both compatibility decisions to the semantic module, fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including all ten affected Collision Chaos outputs. |
| M71 | Complete | Converge the shared Game Over/Time Over object and mapping graph across all ten `R31A-D`, `R32A-D`, and `R33C-D` outputs. Route every R3 graph through `Level/_Objects/Game Over/Main.asm`, bind the recovered object-index and allocator/helper ABI behind an explicit R3 switch, and replace the canonical mapping file's four address-derived frame labels with functional Game, Time, and Over text roles plus its five-byte sprite-piece schema. Preserve `objects/game_over.asm` because Tidal Tempest, Quartz Quadrant, Wacky Workbench, Stardust Speedway, and Metallic Madness continue to consume it. | Audit/check reports zero missing or case-mismatched includes, no address-derived labels in the canonical Game Over family, and reduces active address-derived labels by four, from 16,417 to 16,413. The first Japan build bounded the recovered `SpawnObject` allocator name; after selecting it behind the R3 switch, fresh displayless Steam Proton Experimental builds completed for Japan, USA, and Europe, and all 133 comparisons matched in each region, including all ten affected Collision Chaos outputs. |

Add a row whenever a milestone is selected. Mark it complete only in the same
commit that contains the finished, validated work. The Git history and remote
branch are the authoritative commit record, so the table does not need to
embed its own commit hash.

## Roadmap

The roadmap is ordered by dependency and reviewability. Split any item further
when it cannot be understood, validated, committed, and pushed as one coherent
change.

### Track A: Establish a measurable baseline

1. Create `docs/disassembly-status.md` and the audit script described above.
2. Resolve false positives caused by conditional includes, generated includes,
   editor-only assembly data, and case-insensitive Windows include behavior.
3. Manually classify every active non-BRAM component as structured, hybrid, or
   legacy and identify its largest unresolved code/data ranges.

### Track B: Converge level source graphs

Migrate the existing parallel and hybrid graphs in this order:

1. Collision Chaos Act 1 (`R31A-D`)
2. Collision Chaos Act 2 (`R32A-D`)
3. Tidal Tempest Act 1 (`R41A-D`)
4. Tidal Tempest Acts 2 and 3 (`R42A-D`, `R43C-D`, and `DEMO43C`)
5. Quartz Quadrant (`R51A-D`, `R52A-D`, and `R53C-D`)
6. Stardust Speedway (`R71A-D`, `R72A-D`, and `R73C-D`)
7. Metallic Madness (`R81A-D`, `R82A-D`, `R83C-D`, and `DEMO82A`)

Treat each act family or smaller shared source cluster as a separate milestone.
Do not delete an alternative graph until all its consumers are accounted for
and the replacement matches every affected regional output.

### Track C: Recover active executable semantics

Within the active graphs:

1. Recover shared `common/` engine routines because they affect the most
   consumers.
2. Recover shared `objects/` routines in bounded object families.
3. Recover zone-specific `rN/` scroll, event, collision, object, boss, and
   stage-loading code.
4. Recover the standalone high-debt programs in independently verifiable
   address ranges:
   - Time Attack main CPU program;
   - ending FMV main CPU program; and
   - Thank You main CPU program.

For a large program, one semantic routine family is one milestone. Do not wait
for the entire program to be understood before committing and pushing useful,
verified progress.

### Track D: Classify and restructure data

Process active files named `Padding`, `Packed`, `Retained`, `Pre-Chunk`, or
`Legacy` by exact output range:

- executable bytes become instructions and labels;
- pointer, state, animation, mapping, path, and object records become named
  tables or macros;
- known compressed streams become descriptively named assets with the correct
  format extension;
- genuine padding becomes an alignment or fill directive with an explanation;
  and
- unresolved material remains explicitly recorded in the status matrix rather
  than being described as complete.

Then identify and rename the address-named `.bin` assets. Document a schema,
viewer, editor, extraction command, or round-trip process for each asset class.

### Track E: Make the documentation navigable

Create focused documentation as the corresponding knowledge becomes stable:

- `docs/architecture.md`
- `docs/build-graph.md`
- `docs/regional-variants.md`
- `docs/data-formats/`
- `docs/history/`
- a substantive `ida/README.md`

Reduce the main README to the project boundary, current headline status, build
instructions, and links to these documents. Preserve the existing milestone
history under `docs/history/` rather than discarding it.

### Track F: Enforce the standard

Add non-BRAM static checks for:

- new address-derived labels outside a reviewed allow-list;
- new address-named assets;
- unclassified large `dc.*` spans;
- include-path case mismatches;
- missing `include` or `incbin` targets;
- unexplained unreachable duplicate source;
- meaningful data named only as padding; and
- generated or proprietary files entering version control.

Where possible, add a component-only build mode that does not require the
externally supplied FMV streams or ISO text metadata. Public automation can run
static and source-only checks; protected local validation can perform the
regional byte comparisons and CHD data-track comparisons.

## Goal for a New Agent Instance

Use the following as the goal for a fresh instance:

> Execute the non-BRAM semantic disassembly remediation described in
> `DISASSEMBLY-REMEDIATION-PLAN.md`. Begin by reading `AGENTS.md`, the plan, the
> current progress ledger, `docs/disassembly-status.md` if it exists, and the
> latest relevant commits. Ignore Backup RAM work. Work autonomously on one
> bounded milestone at a time, preserving byte-exact Japan/USA/Europe output.
> For every milestone, trace the real entry points and shared consumers,
> implement semantic naming/structure/documentation or data classification,
> run the required narrow and regional validation, update the status matrix and
> milestone ledger, inspect repository hygiene, commit with an imperative
> subject, push immediately to the current upstream branch, and verify the
> remote commit before beginning the next milestone. Do not treat unexplained
> `dc.*` emission as semantic completion, but allow binary assets when their
> format and role are documented. Continue until the plan's completion criteria
> are met or a genuine external prerequisite blocks further progress.
