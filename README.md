# Sonic CD Disassembly

This is an incomplete disassembly of Sonic CD for the Sega CD. Builds a working ISO, as long as you provide the rest of the files in the "original" folder. Unfortunately, I do not have the time or motivation to continue working on this, but hopefully this new home for the project will encourage others to contribute.

Special thanks to flamewing and TheStoneBanana for helping out and contributing, especially for R11A in the disassembly's infancy stages back in 2015.

Devon  
July 27, 2025

## Reconstruction status

The USA component comparison can reach a complete match while the disc
reconstruction is still incomplete. The comparison covers the files listed in
`check.sh`; it does not certify that every ISO file is assembled from source,
that every level data slice is disassembled, or that the ISO is independent of
the regional original tree. The current build still copies three FMV streams
(`BADEND.STM`, `GOODEND.STM`, and `PTEST.STM`) and retains tracked level padding
data pending source decomposition and regional validation. The padding slices
replaced so far cover R8/R81D, R6, R12B/R12C/R12D, R4, R31B, R5, R7,
R73D/R83D, all R73D opaque regions, regional graphics tables, R41B/R41C,
R42/R42A/R42B/R42C,
R51A-D, R71A/R71B/R71C/R71D, R41D/R42D, R51C/R52C/R51D/R52D,
R31D/R32A, R61C/R61D, R13C/R13D pre-chunk data and Padding2/Padding3,
R32A/R32B Padding2, all R73C opaque regions,
R12B/R12C/R12D pre-chunk data, R12C/R12D Padding3,
R31B/R31C pre-chunk data,
R31C/R31D/R32C/R32D Padding2,
R31B/R31C/R31D Padding3,
R32A/R32B/R32C/R32D Padding3,
R33C/R33D pre-chunk data and Padding2, R41B/R41C/R41D pre-chunk data,
R41B/R42B Padding2,
R51C/R51D Padding2, R52A/R52B/R52C/R52D pre-chunk data,
R52C/R52D/R53C/R53D Padding2, R71A/R72A, R71B/R72B, R71C/R72C,
and R71D/R72D Padding2,
R32B/R32C/R32D Padding1, R61A/R61C/R61D/R63D Padding3,
R81A/R81B/R81C Padding2, R82C/R83C/R83D Padding2,
R81A/R81B/R81C/R81D and R82A/R82B/R82C/R83C Padding3, and
R82A/R82B/R82C/R82D/R83C, and the four shared R81 platform paths, were exact
references or declarative source data. No opaque files remain under `padding/`.
Some packed-data fragments are deliberately source-emitted as bytes and remain
to be semantically classified; eliminating the retained containers does not by
itself mean every packed datum has been decoded.

All sixteen remaining Padding3 files share an identical 258-byte suffix. That
suffix is now one source-backed table of signed rotation-vector pairs, reused
after bounded per-level prefixes. This replaces 4,128 binary-included bytes
across R33C/R33D, R51A/R53C, R62A-D, and R71A-D/R72A-D while their distinct
prefixes remain to be decomposed. The preceding identical 76-byte mapping and
animation tail is shared source as well, including its historical alignment;
that replaces another 1,216 binary-included bytes across the same consumers.
R62B/R62C/R72A/R72C also share a preceding 64-byte non-USA mapping suffix,
now emitted once from source. Japan and Europe retail comparison trees remain
unavailable, so that regional-only path has exact tracked-slice evidence but
not a retail binary comparison.

R51A's remaining distinct 2,392-byte packed graphics/mapping prefix is now a
named source-emitted fragment. Together with the shared tails, this removes
the complete 2,726-byte `r51a_e_3.bin` dependency.

R42A's Padding2 region now emits its distinct `$1232`-byte packed prefix from
source and reuses the exact `$728`-byte declarative R42B stage-data tail. This
removes the complete 6,490-byte `r42a_e_2.bin` dependency.

R61B's Padding2 region now reuses the exact final `$400` bytes of the named
R61A chunk map and the shared `$1600`-byte Act 1 Present Padding2 asset. This
removes the duplicate 6,656-byte `r61b_e_2.bin` dependency.

R52A's Padding2 region now selects the exact final `$1E00` bytes of the
declarative R52 Padding2 table at its natural `$A00` boundary. This removes the
duplicate 7,680-byte `r52a_e_2.bin` dependency.

R51A's Padding2 region now selects the exact final `$2000` bytes of the
declarative R51 Padding2 table at its `$600` boundary. This removes the
duplicate 8,192-byte `r51a_e_2.bin` dependency.

R51B's Padding2 region now reuses `$200` bytes of the named R51A chunk map at
`$D800` followed by the complete declarative R51 Padding2 table. This removes
the duplicate 10,240-byte `r51b_e_2.bin` dependency.

R52B's Padding2 region now reuses the same named R51A chunk-map fragment at
`$D800` followed by the final `$2600` bytes of the declarative R52 Padding2
table. This removes the duplicate 10,240-byte `r52b_e_2.bin` dependency.

R12C's Padding2 region now emits its distinct `$1BCB`-byte packed
mapping/animation prefix from source and reuses the exact `$47A`-byte tail of
the named Act 2 Present Padding2 asset. This removes the complete 8,261-byte
`r12c_e_2.bin` dependency from both consumers.

R53C's Padding3 region now emits its distinct `$2056`-byte packed
mapping/animation prefix from source before the shared mapping and
rotation-vector tails. This removes the complete 8,612-byte
`r53c_e_3.bin` dependency.

R62D's Padding3 region now emits its distinct `$206C`-byte packed
mapping/animation prefix from source before the shared mapping and
rotation-vector tails. This removes the complete 8,634-byte
`r62d_e_3.bin` dependency.

The four R71 Padding3 regions now emit their distinct packed
mapping/animation prefixes from source before the shared mapping and
rotation-vector tails. This removes the complete R71A, R71B, R71C, and R71D
retained blobs, totalling 36,962 bytes.

The four R72 Padding3 regions now source their packed prefixes directly. R72A
and R72C preserve their true regional split: USA uses the corrected graphics
tail, while non-USA emits its distinct continuation and mapping suffix. This
removes all four retained R72 blobs, totalling 38,510 bytes.

R33C and R33D now source-emit their distinct packed mapping/animation prefixes
before the shared mapping and rotation-vector tails. This removes both retained
R33 blobs, totalling 21,652 bytes.

R62A now source-emits its packed head and the continuation shared with USA
R62B. Non-USA R62B emits its distinct prefix and regional mapping suffix. R62C
is split at its true regional divergence, preserving the USA legacy tail and
the distinct non-USA continuation. This removes all three retained R62
Padding3 blobs, totalling 28,090 bytes.

The final non-USA R62B/R62C Padding2 tables are now explicitly regional
source-emitted packed data. Their true European entry points assemble
successfully without the retained files, leaving no opaque blobs under
`padding/`.

Instruction-level recovery has completed for the retained executable R81
pre-chunk regions. R81D's first 1,442 bytes, covering its object-spawn and
movement/state handlers, shared helpers, palette loading, child/overlay object
logic, and their inline tables, are now real 68000 source. A further 658-byte boss-object
logic block at offsets `$85E`-`$AEF` is also semantic source, with the
intervening asset/data regions retained as explicitly bounded binary slices
rather than misidentified as executable code. Another 522 bytes of executable
logic and dispatch records between offsets `$C4C` and `$ED1` now cover the
boss overlay and a platform controller; its four motion datasets and both boss
sprite-mapping sets are now shared declarative records. The final executable
trampoline at `$F6C` is also source-backed. Its two boss animation tables and
twelve named scripts are shared declarative source as well. Its two boss mapping tables now resolve
twelve frames into 45 source-backed sprite pieces, including three deliberate
cross-table references. The final shared compressed asset is identified as an
Enigma tilemap stream and emitted from named source, so `r81d_e_1.bin` is no
longer required.

R81A's 4,600-byte non-USA pre-chunk region is also the exact shared tail of
R81B from offset `$214` and R81C from offset `$7A`. Those three variants now
use one shared source include after their unique prefixes. The first 64
instruction bytes in that shared tail—record-copy completion and marker-table
search routines—are semantic 68000 source. The 134-byte region at offsets
`$8A`-`$10F` is source-backed as well, recovering the object dispatcher, its
state table, and the object initializer. The first 72-byte dispatched state at
`$174` is now source-backed too, covering its acceleration, position clamp,
falling transition, and next-state setup. The 282-byte state at `$1BC` is also
semantic source, recovering its collision/contact handling, speed limiting,
player-relative movement, animation selection, stopping, and deletion paths.
The remaining four states from `$2D6` through `$3D3`, another 254 bytes, are
source-backed as well; the complete dispatcher state graph is therefore
semantic source. The 402-byte helper cluster at `$3D4`-`$565` is semantic
source too, covering player collision transfer, velocity integration,
animation stepping, child spawning, player lookup/facing, and direction flags.
The following 348-byte island at `$566`-`$6C1` is source-backed as well,
covering palette loading/data, child-object and overlay logic, mappings, and an
external trampoline. The byte-identical 658-byte boss state machine at `$97E`
is semantic source too, with its animation and mapping assets now declarative
source. The 646-byte boss-overlay/platform island at `$D6C` is also
source-backed, including its mappings and four path-record tables. The final
six-byte trampoline at `$108C` is source-backed too. The retained 56-byte
`$28`-`$5F` slice is now source as well, including four mapping records and its
blink/display helper. The unique R81B/R81C prefixes are declarative source
records, including the USA one-byte variant. The shared tail's retained slices
now emit the complete 100-byte `$110`-`$173` main state as source too, covering
player distance, child/effect spawning, sound, player reversal, timer/routine
advancement, and its animation transition. The identical final 358-byte
pointer/placement/attribute record block is now shared declarative source for
R81A/B/C/D, with R81A/B/C's additional alignment word emitted explicitly. The
small retained `$7A`-`$89` R81A/B/C marker mapping is labeled source as well.
The four byte-identical R81A/B/C/D platform paths are shared declarative
records with named frame, duration, direction, and signed X-offset fields.
The two byte-identical R81A/B/C/D boss animation sets are also shared source,
with their offset tables resolved to twelve named animation scripts.
Their two byte-identical boss sprite-mapping sets are shared source too,
including all twelve frames and 45 piece records.
The adjacent 16-byte boss-overlay mapping is shared source as well, with named
empty and visible frames replacing its final retained mapping slice.
The final 154-byte R81A/B/C/D platform mapping is shared declarative source,
covering its four frames, 28 sprite pieces, and historical alignment. The last
shared 698-byte region is now identified and source-emitted as an Enigma
tilemap stream, with R81A/B/C's following zero alignment word explicit. Both
former R81 retained binary files have therefore been removed.

R43C and R43D now share one retained pre-chunk body after R43C's unique
source-backed initializer. The first 204 bytes of shared executable logic are
also semantic source, covering the vertical moving-block setup, child spawns,
horizontal movement, and position wrapping. The following 384-byte switch
object, collision helper, and sprite mappings also reuse their semantic R4
source. The adjacent 646-byte door object, subtype and dispatch tables,
movement/collision helpers, and sprite mappings are source-backed as well. The
following 304-byte twin moving-block object also reuses source for its linked
parent/child lifetime, collision and movement states, motion records, and sprite
mapping. The following 618-byte discarded Tonbo copy is namespaced source,
including its legacy sine/cosine call, movement and animation logic, animation
records, and both sprite mapping sets. The adjacent 820-byte discarded Amenbo
copy is namespaced source too, including its movement states, water-relative
motion, projectile spawning and checks, child-projectile behavior, animation
records, and both sprite mapping sets. The following 1,054-byte discarded
TagaTaga cluster is namespaced source as well, covering the main object, linked
body parts, movement helpers, missile object, animation records, and all three
mapping sets. Both discarded Yago subtype graphs are now namespaced source too,
including their movement/collision states, two animation sets, and two mapping
sets. The complete discarded Animal object is namespaced source as well,
preserving its regional presence-check target, historical sine/cosine calls,
movement states, animations, mappings, and tile table. The retained suffix now
continues with a namespaced 576-byte CrushBlocks implementation, including its
linked children, packed pointers, layouts, synchronized movement, timing data,
collision, and mappings. The adjacent 216-byte BlockObject, size records, and
seven mapping variants are namespaced source too. The following namespaced
234-byte future FanObject covers parent lifetime, switch
activation, orientation setup, drawing/deletion, and both mapping sets. Its
post-object cursor is aligned at `$1B02` for the historical overlay. The
adjacent 738-byte Mace cluster is namespaced source as well, recovering its six
linked chain/ball children, circular positioning, historical sine/cosine call,
child lifetime handling, and three mapping sets. The following 80-byte
SpikeBallObject initializer, collision setup, draw/despawn tail, and mapping are
semantic source too. The adjacent 396-byte CircleSpikeBallObject cluster is
namespaced source as well, including its parent check, three linked children,
four-object initialization, subtype-selected direction and radius, historical
sine/cosine call, circular movement, and mapping. The adjacent 834-byte
CollapseFloorObject cluster is namespaced source too, covering top-solid
collision, trigger timing, progressive fragment spawning, fragment fall and
player-release states, sound, and the full mapping set. The following 498-byte
PlatformChainObject cluster is namespaced source as well, including top-solid
correction, eight linked segments, subtype geometry, switch-controlled
direction, historical sine/cosine call, circular motion, derived velocity, and
mappings. The adjacent 440-byte PressureElevatorObject cluster is namespaced
source too, covering player-relative activation, capped descent, top-solid
transfer and release, triggered ascent/reset, sound, and both mapping frames.
The adjacent 394-byte BigDoorObject cluster is namespaced source as well,
including switch-controlled solid collision, three cloned opening segments,
alternating and timed segment motion, deletion, and mappings. The following
518-byte BreakBlockObject cluster is namespaced source too, covering collision
triggering, four debris spawns, impact-selected trajectories, gravity/deletion,
mappings, piece offsets, and every trajectory table. The final 724-byte tail is
source-emitted as well: its compatibility helper is readable namespaced 68000
source, while its packed legacy records share the pre-existing R51 non-USA
source table. The former `padding/r43d_e_1.bin` dependency has been removed, so
the complete shared R43 retained pre-chunk body is now built without that binary
blob. Field-level naming of the final packed records remains unfinished.

## Building

The remaining original game files must be placed in `original/japan/`,
`original/usa/`, or `original/europe/` before building. Generated files are
written to `out/`.

On Windows, run `make.bat`, followed by `check.bat` to compare every rebuilt binary
with the originals.

On Linux, install Wine with 32-bit Windows application support or Steam Proton,
then run:

```sh
./make.sh
./check.sh
```

The Linux build uses Wine (or an automatically detected Steam Proton installation)
to run the checked-in, byte-exact Windows toolchain; the comparison script itself
uses the native `cmp` utility. Both scripts default to the USA release. Set
`REGION=0` for Japan or `REGION=2` for Europe, using the same value for both
commands:

```sh
REGION=2 ./make.sh
REGION=2 ./check.sh
```

The build clears the generated `out/files/` entries before assembling and copies
only runtime files that still lack source-backed build steps. It does not remove
other stale files under `out/`, so use a fresh `out/` directory after switching
regions. If the Wine or Proton executable has
a custom name or path, set `WINE_BIN` or `PROTON_BIN` when running `make.sh`.

## Currently Contains
* Initial program
* System program
* Main program file (IPX)
* System program extension file (SPX)
* Backup RAM initialization file (BRAMINIT)
* Backup RAM manager main CPU program (BRAMMAIN, USA source only)
* Sub CPU Backup RAM functions file (BRAMSUB)
* Mega Drive initialization file (MDINIT)
* FM sound driver (SMPS Z80)
* SMPS-PCM
    - Palmtree Panic (SNCBNK1B)
    - Collision Chaos (SNCBNK3B)
    - Tidal Tempest (SNCBNK4B)
    - Quartz Quadrant (SNCBNK5B)
    - Wacky Workbench (SNCBNK6B)
    - Stardust Speedway (SNCBNK7B)
    - Metallic Madness (SNCBNK8B)
    - Boss (SNCBNKB1)
    - Final Boss (SNCBNKB2)
* Title screen (TITLEM and TITLES)
    - Secrets
        - Stage select (STSEL)
        - Sound test (SOSEL)
            - Prototype version (DUMMY5, DUMMY6, DUMMY7, DUMMY8, DUMMY9)
        - Easter eggs (NISI, DUMMY0, DUMMY1, DUMMY2, DUMMY3)
        - Best of staff times (DUMMY4)
	    - Secret special stage credits (SPEEND)
* Level
    - Palmtree Panic Act 1 (R11A, R11B, R11C, R11D, DEMO11A)
    - Palmtree Panic Act 2 Present (R12A)
    - Palmtree Panic Act 2 Past (R12B)
    - Palmtree Panic Act 2 Good Future (R12C)
    - Palmtree Panic Act 2 Bad Future (R12D)
    - Palmtree Panic Act 3 Good Future (R13C)
    - Palmtree Panic Act 3 Bad Future (R13D)
    - Wacky Workbench Act 1 (R61A, R61B, R61C, R61D)
    - Wacky Workbench Act 2 (R62A, R62B, R62C, R62D)
    - Wacky Workbench Act 3 Good/Bad Future (R63C, R63D)
    - Collision Chaos Act 1 Present (R31A)
    - Collision Chaos Act 1 Past (R31B)
    - Collision Chaos Act 1 Good Future (R31C)
    - Collision Chaos Act 1 Bad Future (R31D)
    - Collision Chaos Act 2 Present (R32A)
    - Collision Chaos Act 2 Past (R32B)
    - Collision Chaos Act 2 Good Future (R32C)
    - Collision Chaos Act 2 Bad Future (R32D)
    - Collision Chaos Act 3 Good Future (R33C)
    - Collision Chaos Act 3 Bad Future (R33D)
    - Tidal Tempest Act 1 Present (R41A)
    - Tidal Tempest Act 1 Past (R41B)
    - Tidal Tempest Act 1 Good Future (R41C)
    - Tidal Tempest Act 1 Bad Future (R41D)
    - Tidal Tempest Act 2 (R42A, R42B, R42C, R42D)
    - Tidal Tempest Act 3 Good/Bad Future (R43C, R43D, DEMO43C)
    - Quartz Quadrant Act 1 (R51A, R51B, R51C, R51D)
    - Quartz Quadrant Act 2 (R52A, R52B, R52C, R52D)
    - Quartz Quadrant Act 3 Good/Bad Future (R53C, R53D)
    - Stardust Speedway Act 1 (R71A, R71B, R71C, R71D)
    - Stardust Speedway Act 2 (R72A, R72B, R72C, R72D)
    - Stardust Speedway Act 3 Good/Bad Future (R73C, R73D)
    - Metallic Madness Act 1 (R81A, R81B, R81C, R81D)
    - Metallic Madness Act 2 (R82A, R82B, R82C, R82D, DEMO82A)
    - Metallic Madness Act 3 Good/Bad Future (R83C, R83D)
* Special Stage (SPMM and SPSS)
* Time warp cutscene (WARP)
* Time attack main CPU program (ATTACK.MMD, USA source only)
* Time attack Sub CPU program (ATTACK.BIN)
* "Thank You" screen main CPU program (THANKS_M.MMD, USA source only)
* "Comin' Soon" screen main CPU program (COME__.MMD, USA source only)
* "Thank You" screen Sub CPU program (THANKS_S.BIN)
* "Thank You" screen Nemesis graphics data (THANKS_D.BIN, USA source only)
* FMVs
    - Opening FMV (OPEN_M, OPEN_S, OPN.STM)
    - Ending FMV main CPU program (ENDING.MMD, USA source only)
    - Good ending Sub CPU program (BADEND.BIN, not a typo)
    - Bad ending Sub CPU program (GOODEND.BIN, not a typo)
    - Pencil test main CPU program (PTEST.MMD, USA source only)
    - Pencil test Sub CPU program (PTEST.BIN)
* DA Garden (PLANET_M, PLANET_S, PLANET_D)
* Visual Mode menu (VM)
