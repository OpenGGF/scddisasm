# Sonic CD Disassembly

This is an incomplete disassembly of Sonic CD for the Sega CD. Builds a working ISO, as long as you provide the rest of the files in the "original" folder. Unfortunately, I do not have the time or motivation to continue working on this, but hopefully this new home for the project will encourage others to contribute.

Special thanks to flamewing and TheStoneBanana for helping out and contributing, especially for R11A in the disassembly's infancy stages back in 2015.

Devon  
July 27, 2025

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

Use a fresh `out/` directory after switching regions because the build overwrites
outputs but does not remove stale files first. If the Wine or Proton executable has
a custom name or path, set `WINE_BIN` or `PROTON_BIN` when running `make.sh`.

## Currently Contains
* Initial program
* System program
* Main program file (IPX)
* System program extension file (SPX)
* Backup RAM initialization file (BRAMINIT)
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
    - Tidal Tempest Act 1 Present (R41A)
    - Tidal Tempest Act 1 Past (R41B)
    - Tidal Tempest Act 1 Good Future (R41C)
    - Tidal Tempest Act 1 Bad Future (R41D)
    - Quartz Quadrant Act 1 (R51A, R51B, R51C, R51D)
    - Quartz Quadrant Act 2 (R52A, R52B, R52C, R52D)
    - Quartz Quadrant Act 3 Good/Bad Future (R53C, R53D)
* Special Stage (SPMM and SPSS)
* Time warp cutscene (WARP)
* FMVs
    - Opening FMV (OPEN_M, OPEN_S, OPN.STM)
    - Good ending Sub CPU program (BADEND.BIN, not a typo)
    - Bad ending Sub CPU program (GOODEND.BIN, not a typo)
    - Pencil test Sub CPU program (PTEST.BIN)
* DA Garden (PLANET_M, PLANET_S, PLANET_D)
* Visual Mode menu (VM)
