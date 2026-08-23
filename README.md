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
data pending source decomposition and regional validation. The 160 padding
slices replaced so far, covering R8/R81D, R6, R12B/R12C/R12D, R4, R31B, R5, R7,
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
R82A/R82B/R82C/R82D/R83C, were exact references or declarative source data;
28 opaque padding slices totalling 236,195 bytes remain.

Instruction-level recovery has also begun for the remaining executable R81
pre-chunk regions. R81D's first 1,442 bytes, covering its object-spawn and
movement/state handlers, shared helpers, palette loading, child/overlay object
logic, and their inline tables, are now real 68000 source; the unresolved
remainder of that mixed code/data block is still included from its tracked
padding file and is not counted as complete. A further 658-byte boss-object
logic block at offsets `$85E`-`$AEF` is also semantic source, with the
intervening asset/data regions retained as explicitly bounded binary slices
rather than misidentified as executable code. Another 522 bytes of executable
logic and dispatch records between offsets `$C4C` and `$ED1` now cover the
boss overlay and a platform controller; only their named mapping and motion
record slices remain binary-backed within that range. The final executable
trampoline at `$F6C` is also source-backed, so no identified 68000 logic remains
inside `r81d_e_1.bin`; that file is still required for its bounded palette,
animation, mapping, path, packed graphics, and pointer/placement data.

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
is semantic source too, while its animation and mapping assets remain bounded
binary data. The 646-byte boss-overlay/platform island at `$D6C` is also
source-backed, including its mappings and four path-record tables. The final
six-byte trampoline at `$108C` is source-backed too, leaving no identified
68000 logic in the shared tail's retained slices. The unique R81B/R81C prefixes
are now declarative source records, including the USA one-byte variant. The
shared tail's retained slices still contain bounded
palette, animation, mapping, pointer, placement, path, and packed asset data
requiring source decomposition.

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
