# Disassembly Orchestration Ledger

## 2026-08-24

- **R6 non-USA palette-layout milestone:** The R6 variant-1 source now emits
  its existing `S1LevelSelectPalette` table for Japan and Europe, and the R6
  variant-2/8 source now emits the corresponding existing `S1TitlePalette`
  table for those regions. This restores the retail 0x80-byte layout present
  in R61B, R61C, and R63C without retaining any original bytes. Fresh guarded
  displayless Japan and Europe builds/checks remain at 69 matches, 61 known
  level differences, and 0 missing targets, but the first differences move
  from the former vector/layout gap to later offsets: R61B byte 3938, R61C
  byte 1627, and R63C byte 4072. USA remains 133/0/0. The CHD-derived
  comparison trees remain ignored and no proprietary bytes were added to
  source control.

- **Regional pause-path layout milestone:** The shared `common/main.asm` and
  duplicated `r4/main.asm` entry paths now select the retail pause-input
  instruction sequence by region. Japan and Europe omit the USA-only
  eight-byte player-routine gate and emit the four-byte `cmpi.b #$70,d0`
  check present in their originals; USA retains its exact existing sequence.
  Fresh guarded displayless Japan and Europe builds/checks report 69 matches,
  61 known level differences, and 0 missing targets, with the R3/R4/R7/R8
  header/layout drift moved past the shared entry code into later level data.
  USA remains 133/0/0 (matches/differences/missing). This is a verified
  regional layout correction, not a claim that those level binaries are yet
  byte-exact. The three local CHD-derived comparison trees remain ignored and
  no proprietary bytes were added to source control.

- **Initial regional CHD verification baseline:** The locally supplied Europe and Japan
  CHDs are present at `original/disc-images/europe/` and
  `original/disc-images/japan/`, where they remain ignored. The current Europe
  image is 338,666,574 bytes with SHA-1
  `eb4fc8879c4b6bf06831f16bb24db41597fb6b20`; the Japan image is 338,810,474
  bytes with SHA-1 `6cbd62c14119c45265baede9e261d19dd4087960`. Their ignored
  extracted comparison trees were used for the initial displayless `REGION=2`
  and `REGION=0` builds and checks; each reported 63 matches, 67 known level
  differences, and 0 missing targets before the later regional layout
  corrections. USA remains 133/0/0. `/var/home/james/Downloads`
  currently contains no remaining CHD files. No CHD, extracted original, or
  generated build output is tracked; this records the verification inputs and
  baseline, not completion of the regional reconstruction.

- **Legacy Quartz Quadrant regional layout milestone:** The R51A-R51D and
  R52A-R52D non-USA scroll sources now emit the 18-byte
  `InitPlayerObjectPointer` routine present in the Japan and Europe originals.
  Their signpost graphics lists also omit the six-byte `BigRingFlashGfx`
  entry in non-USA builds while retaining it for USA. Fresh guarded,
  displayless Japan and Europe builds now report 69 matches, 61 known level
  differences, and 0 missing targets; the eight corrected R5 outputs are all
  exactly 262,144 bytes. USA remains 133/0/0 (matches/differences/missing).
  The remaining differences are later non-USA entry-point and source-order
  regions, so this is a layout/parity milestone rather than a claim of
  byte-exact completion. The downloaded CHDs and extracted files remain
  ignored local verification inputs.

- **Palmtree Panic future pre-chunk milestone:** The R12C/R12D future-data
  paths no longer unconditionally overlay the USA-only Act 2 Present legacy
  table onto Japan/Europe pre-chunk data. The overlay and its relocated words
  are now guarded by `REGION=USA`, so the regional pre-chunk sources retain
  their original fixed layout. Fresh guarded displayless Japan and Europe
  builds now match `R12C__.MMD` and `R12D__.MMD` exactly; USA remains 133/0/0
  (matches/differences/missing). The remaining non-USA failures are other
  known level families. No original bytes or generated outputs were added to
  source control.

- **Palmtree Panic regional reconciliation milestone:** The source now emits
  the regional object-map byte, Act 2/Act 3 scroll order and start position,
  R13 roll-tunnel operand forms, Act 3 debug-object flag, and R13 boss
  allocator calls needed by `R12A__.MMD`, `R12B__.MMD`, `R13C__.MMD`, and
  `R13D__.MMD`. Fresh guarded displayless Japan and Europe builds compare all
  four targets byte-for-byte; the remaining non-USA failures are the other
  known incomplete level families. A fresh USA regression build still
  reports 133/0/0 (matches/differences/missing). The CHDs and extracted
  regional files remain ignored local verification inputs, and no original
  bytes were added to source control.

- **Cross-region Backup RAM manager milestone:** `BRAMMAIN.MMD` is now
  source-emitted for all three retail regions instead of being copied into
  non-USA builds. Japan produces 30,320 bytes with SHA-256
  `c677ea995d85712ee5a0d9952490fad729406402b40c128dbb6a2d167544d255`, Europe
  produces 30,370 bytes with SHA-256
  `578964dd827626146ad13980dbbe049e8a4f05a4bfbbcf633364d7a2770bca43`, and
  USA remains the exact 31,328-byte output with SHA-256
  `ed4a0bfbb4d6f1f18d191bc34780228c57641d7f2a0d6dd354da2f98e5072f65`.
  Fresh guarded displayless builds compare USA at 133/0/0 and Japan/Europe at
  63/67/0 (matches/differences/missing); the remaining non-USA differences are
  the known level binaries. The regional branch uses explicit source `dc.b`
  spans pending semantic decomposition, so this removes the copy-only runtime
  fallback without claiming that every BRAMMAIN routine and data table is yet a
  fully readable disassembly. No original files or disc images were added to
  source control.

- **Ending primary-program regional-layout milestone:** The USA, Japan, and
  Europe primary `ENDING.MMD` paths now emit their complete regional files from
  source, including the explicit event streams and tile tables. The rebuilt
  USA file is 44,052 bytes with SHA-256
  `a2de839be879145da035af6e1080a5264e849ff4ecd7813a83273ce60aaeb3e6`; the
  Japan file is 44,036 bytes with SHA-256
  `e6250e055d2f2f9f5774afac3ca9b4f75b1bfb11e0caf7c8905513155fb9d44c`; and the
  Europe file is 44,036 bytes with SHA-256
  `7e4082d0c4e1df119c0939852bdf1f6d10403d8f49083e3e56ba5d7bf7c05925`.
  Both build frontends now assemble `ENDING.MMD` for every region instead of
  copying the non-USA executable. Fresh guarded displayless builds complete
  against the locally supplied regional originals: USA remains 133/0/0
  (matches/differences/missing), while Japan and Europe remain 63/67/0 because
  of the known level reconstruction differences. No proprietary regional bytes
  were added to source control.

- **Cross-region Ending secondary-program milestone:** The complete secondary
  executable/data block at `$FFC100` through the end of `ENDING.MMD` is now
  region-aware source. Symbolic pointers replace fixed USA addresses; Japan
  and Europe omit the two USA-only delay sections and emit their two shorter
  Sub-CPU handshake routines. A diagnostic Japanese assembly matches every
  byte from file offset `$A200` to EOF, and the corresponding European retail
  span is identical. The production frontend now uses the regional primary and
  secondary source paths together. A fresh guarded
  displayless USA build still produces SHA-256
  `a2de839be879145da035af6e1080a5264e849ff4ecd7813a83273ce60aaeb3e6`,
  with all 133 comparison targets exact. No regional binary data was added to
  source control.

- **Ending decompressor disassembly milestone:** The 506-byte executable span
  at `$FFC606`-`$FFC7FF` in USA `ENDING.MMD` is now structured 68000 source
  instead of 126 opaque longword declarations. It identifies the decode-table
  builder, tilemap token dispatcher, four output helpers, value decoder,
  bit-refill path, eight-way handler table, and 16-word bit-mask table. The
  source preserves the original mid-routine loop entries and the mask-table
  base that intentionally aliases a branch opcode. A fresh guarded displayless
  USA build completes, ENDING retains SHA-256
  `a2de839be879145da035af6e1080a5264e849ff4ecd7813a83273ce60aaeb3e6`,
  and all 133 comparison targets remain exact. No original binary content was
  added to source control.

- **Ending I/O routine disassembly milestone:** Two more executable spans in
  USA `ENDING.MMD` are now labelled 68000 source instead of opaque longwords:
  controller sampling at `$FFC82A`-`$FFC861` and the Sub-CPU command handshake
  at `$FFC87A`-`$FFC8A9`. A fresh guarded displayless USA build completes, the
  ENDING output retains SHA-256
  `a2de839be879145da035af6e1080a5264e849ff4ecd7813a83273ce60aaeb3e6`,
  and all 133 comparison targets remain exact. No regional original bytes were
  added to source control.

- **Ending interrupt disassembly milestone:** The USA `ENDING.MMD` secondary
  V-blank handler at `$FFC1BA`-`$FFC23F` is now emitted as labelled 68000
  instructions instead of 34 opaque longword declarations. Its installed
  vector, delay counter, VDP path, and Z80 synchronization calls are symbolic.
  A fresh guarded displayless USA build completes, the 44,052-byte output has
  SHA-256 `a2de839be879145da035af6e1080a5264e849ff4ecd7813a83273ce60aaeb3e6`,
  and all 133 comparison targets remain exact. Regional ENDING reconstruction
  is still in progress; this milestone removes logic opacity without importing
  any Japanese or European bytes into source control.

- **Cross-region Time Attack logic milestone:** `ATTACK.MMD` is now assembled
  through `src/Time Attack/Main.asm` for all three regions instead of copying
  the complete non-USA executable. Japan and Europe select their two
  region-adjusted packed-data pointers and read only the bounded asset suffix
  at file offsets `$5674`-`$1FFFF` from the ignored regional original; the MMD
  header and every byte before that asset boundary are source-emitted. Fresh
  guarded displayless Japan, Europe, and USA builds complete, and all three
  131,072-byte outputs compare exactly. USA retains all 133 matches; each
  non-USA check remains at 63 matches, 67 known level differences, and 0
  missing targets. Only two complete non-USA executable/data fallbacks remain:
  `BRAMMAIN.MMD`; `ENDING.MMD` is now source-built for every region.

- **Cross-region Thank You main-CPU milestone:** `THANKS_M.MMD` is now
  assembled from `src/Thank You/Main.asm` for all three regions. Japan and
  Europe omit the USA-only initial `$2A30` countdown and its V-blank
  decrement/exit block; embedded legacy routine pointers are emitted as
  regional source expressions, and the 63-entry object-handler dispatch is a
  named table instead of fixed USA addresses. Fresh guarded displayless Japan,
  Europe, and USA builds complete. The 20,126-byte Japan/Europe and 20,144-byte
  USA outputs all compare exactly; USA retains all 133 matches, while each
  non-USA check reports 63 matches, 67 known level differences, and 0 missing
  targets. Three non-USA executable/data fallbacks remain: `ATTACK.MMD`,
  `BRAMMAIN.MMD`, and `ENDING.MMD`.

- **Cross-region shared-component milestone:** `COME__.MMD`, `PTEST.MMD`, and
  `THANKS_D.BIN` are identical in the Japan, USA, and Europe retail images, so
  both build frontends now assemble them from their existing source for every
  region instead of copying the non-USA files. Fresh guarded displayless Japan
  and Europe builds complete, and all three promoted outputs compare exactly
  in both regions. Each regional check now covers 130 files and reports 63
  matches, 67 known level differences, and 0 missing targets. Four non-USA
  executable/data fallbacks remain: `ATTACK.MMD`, `BRAMMAIN.MMD`, `ENDING.MMD`,
  and `THANKS_M.MMD`.

- **Japan/Europe reference-media milestone:** Locally supplied retail CHDs are
  now available for all three regions without entering source control. The
  The European image identifies as `MK-4407-00`; the current local copy is
  338,666,574 bytes with CHD SHA-1
  `eb4fc8879c4b6bf06831f16bb24db41597fb6b20`. The Japanese image identifies as
  `G-6021-00`; the current local copy is 338,810,474 bytes with CHD SHA-1
  `6cbd62c14119c45265baede9e261d19dd4087960`. Their MODE1/2352 data tracks
  were converted to 2,048-byte-sector ISO images and each 131-file filesystem
  was extracted into the ignored regional comparison tree. This establishes
  the missing byte-comparison prerequisites; it does not make the proprietary
  images or extracted files build inputs that may be committed.

- **Legacy Wacky Workbench collision/layout milestone:** The final 5,632-byte
  level `Data/Padding` binary is removed. Its complete form and seven bounded
  suffixes are assembled from the shared collision-width table, level
  collision/layout assets, Robot Generator art, and explicit retained mapping
  records. The guarded USA ISO remains byte-identical with all 133 comparisons
  passing; a guarded Japan build and direct checks against all eight former
  forms validate the non-USA paths. No tracked binaries or build references
  remain under level `Data/Padding` directories.

- **Legacy Wacky Workbench compressed-art milestone:** The 10,238-byte Act 1
  Present `Padding/3` binary is removed. Its full form and ten historical
  suffixes are assembled from named Palmtree Panic, Quartz Quadrant, Robot
  Generator, and Tidal Tempest compressed-art assets plus explicit retained
  Amy mapping/animation records. The USA R43 demo retains its source-level Amy
  overwrite. The guarded USA ISO remains byte-identical with all 133
  comparisons passing; a guarded Japan build and direct checks against all
  eleven former suffix forms validate the non-USA paths. This leaves one
  tracked level `Data/Padding` binary: Wacky Workbench `Padding/2`, at 5,632
  bytes.

## 2026-08-23

- **Legacy Act 2 Present post-data milestone:** The final 9,416-byte Palmtree
  Panic `Padding/2` binary is removed. Its full form is assembled from a named
  explosion-mapping tail, reusable object mappings, existing art assets, and
  the Act 1 chunk/mapping suffix. Historical `$204E` consumers use a dedicated
  declarative Sonic mapping suffix followed by the shared 3D-ramp mappings.
  Internal labels in the reused animation and mapping sources are local. The
  guarded USA ISO remains byte-identical with all 133 comparisons passing; a
  guarded Japan build and direct checks against the former full and `$204E`
  forms validate the non-USA paths. This leaves 2 tracked level `Data/Padding`
  binaries totalling 15,870 bytes, both in Wacky Workbench.

- **Legacy Act 1 post-chunk mapping milestone:** All six regional Act 1 Past
  and Good/Bad Future `Padding/2` binaries, totalling 44,376 bytes, are
  removed. Each retained area is now assembled from the exact suffix of the
  tracked Act 1 Present chunk map followed by the existing Sonic and 3D-ramp
  mapping sources. Their internal mapping labels are local so the same named
  sources can safely represent both the original post-chunk layout and its
  retained copies. The guarded USA ISO remains byte-identical with all 133
  comparisons passing; a guarded Japan build and direct checks against all
  three former JE forms validate the non-USA paths. This leaves 3 tracked
  level `Data/Padding` binaries totalling 25,286 bytes.

- **Legacy Act 1 Future pre-chunk milestone:** All four regional Good/Bad
  Future `Padding/1` binaries, totalling 17,456 bytes, are removed. Good Future
  now composes a single instruction-level legacy object-spawn/motion routine,
  named animation/offset and PLC record regions, and the regional Act 1 Past
  source; Bad Future adds only its distinct 14-byte PLC prefix. Eighteen word
  differences select the USA or Japan/Europe past body without duplicating it.
  The USA ISO remains byte-identical with all 133 comparisons passing, and a
  guarded Japan build plus direct output checks validate both JE forms. This
  leaves 9 tracked level `Data/Padding` binaries totalling 69,662 bytes.

- **Legacy Act 2 Present pre-chunk milestone:** The 3,344-byte regional Act 2
  Present `Padding/1` binary is removed. It was the exact `$40`-offset suffix
  of the existing R12B pre-chunk source, which now has a dedicated bounded
  mode alongside its full and Act 1 Past modes; the final JE trampoline/table
  area continues to use the shared named source. The USA ISO remains
  byte-identical with all 133 comparisons passing, and a guarded Japan build
  plus direct output checks validate the source-emitted regional suffix. This
  leaves 13 tracked level `Data/Padding` binaries totalling 87,118 bytes.

- **Legacy Act 1 Past pre-chunk milestone:** The 3,190-byte USA and 3,176-byte
  Japan/Europe Act 1 Past `Padding/1` binaries are removed. They were exact
  suffixes of the existing source-backed USA Act 2 Past and regional R12B
  pre-chunk areas, which now expose explicit suffix-only modes. Their duplicated
  final loader/table regions reuse the readable USA and JE R11A tail sources
  instead of repeating raw words. The USA ISO remains byte-identical with all
  133 comparisons passing, and a guarded Japan build validates the non-USA
  suffix and its compatibility consumers. This leaves 14 tracked level
  `Data/Padding` binaries totalling 90,462 bytes.

- **Legacy R11A regional/demo table milestone:** The remaining three Act 1
  Present `Padding/1` binaries (USA demo plus Japan/Europe retail and demo),
  totalling 1,584 bytes, are removed. Their retained graphics-load, PLC,
  animation, coordinate, and stage-tail records are now named declarative
  source; all three legacy absolute jump entries are explicit instructions.
  The USA ISO remains byte-identical with all 133 comparisons passing, and a
  guarded Japan build validates both non-USA paths. This leaves 16 tracked
  level `Data/Padding` binaries totalling 96,828 bytes.

- **Legacy R11A PLC loader milestone:** The 548-byte USA Act 1 Present
  `Padding/1` binary is removed. Its executable region is now readable 68000
  source for the retained animated/static PLC frame loaders, followed by
  explicitly source-emitted legacy metadata and tables. The USA ISO remains
  byte-identical with all 133 comparisons passing. This leaves 19 tracked level
  `Data/Padding` binaries totalling 98,412 bytes.

- **Legacy R12A/R12B tail milestone:** The 2,860-byte R12A `Padding/3` parent
  binary is removed. Its full form is composed from a named Palmtree Panic tile
  suffix, projector art, and the recovered Amy Rose tail. R12B's historical
  `$862` slice now uses an explicit Amy mapping-tail mode that omits 13 pointer
  words while preserving offsets relative to the original table base. The USA
  ISO remains byte-identical with all 133 comparisons passing, and a guarded
  Japan build validates the shared non-USA path. This leaves 20 tracked level
  `Data/Padding` binaries totalling 98,960 bytes.

- **Legacy Amy Rose tail milestone:** Three identical 1,520-byte R11B/R11C/R11D
  `Padding/3` binaries are removed. Their retained content is now assembled from
  the existing named Amy Rose art, mappings, animations, and recovered legacy
  object tables. Amy's internal mapping/animation labels are local so those
  sources can be included safely wherever the retail layout retained a copy;
  the R43 compatibility mode remains intact. The USA ISO is still byte-identical
  with all 133 comparisons passing, and a guarded Japan build validates the
  shared non-USA paths. This leaves 21 tracked level `Data/Padding` binaries
  totalling 101,820 bytes.

- **Legacy Palmtree Panic object-table milestone:** The 398-byte R11A
  `Padding/2` binary was structured leftover object mapping/coordinate data,
  not alignment fill. It is now emitted by one assembly source with explicit
  complete, `$40`-byte prefix, and `$2A`-offset modes for its R11A/R4 consumers.
  The USA ISO remains fully byte-identical and all 133 staged comparisons pass;
  a guarded Japan build validates the shared non-USA paths. This leaves 24
  tracked level `Data/Padding` binaries totalling 106,380 bytes.

- **Legacy Wacky Workbench PLC source milestone:** The two regional R61A
  `Padding/1` binaries are removed. Their contents are now named legacy PLC
  table source, with explicit source fragments for the historical R4/R5/R6
  consumers that began at offsets `$2E`, `$42`, `$A0`, or `$AC`. A guarded USA
  build remains identical to the complete retail ISO and all 133 staged-file
  comparisons pass. Guarded Japan and Europe assembly passes also complete;
  retail comparison remains unavailable for those regions. This leaves 25
  tracked files under level `Data/Padding` directories, totalling 106,778 bytes.

- **USA ISO filesystem reconstruction milestone:** The retail filesystem layout
  is now generated deterministically from staged files without reading a
  reference ISO. `tools/build_retail_iso.py` reproduces the USA primary volume
  descriptor, path tables, three-sector root directory, file extent order, and
  physical trailing sectors. Its generated filesystem matches the locally
  owned USA image from sector 16 onward. The three identification text files
  are explicit external inputs accepted through `ISO_METADATA_DIR`; none of
  their contents are embedded in source control. Japan and Europe continue to
  use the pinned `mkisofs` path until their retail layouts can be validated.
  Both comparison frontends include the three USA identification files, raising
  the USA validation surface to 133 staged files.

- **External-media validation milestone:** `check.sh` and `check.bat` now compare
  `BADEND.STM`, `GOODEND.STM`, and `PTEST.STM` instead of trusting the files
  copied into the ISO staging tree. The Windows comparison also gains the
  previously omitted `THANKS_M.MMD`. The USA validation surface is therefore
  130 files: 127 reconstructed components plus three externally supplied media
  streams. The expanded USA check reports all 130 matches.

- **Media/input boundary milestone:** The three copy-only USA runtime files are
  confirmed encoded audiovisual streams rather than executable logic:
  `BADEND.STM`, `GOODEND.STM`, and `PTEST.STM`. Both build frontends now accept
  them through `FMV_STREAM_DIR`, independently of the regional original tree,
  and fail with a media-specific diagnostic when one is absent. USA compilation
  therefore has no copy-only executable input. A guarded USA build using a
  separate temporary media directory completed and remained byte-exact for all
  127 targets. Japan and Europe still require seven regional executable/data
  fallbacks. The linked MakeSTM implementation supports only the opening
  format, so source generation of the ending and pencil-test streams remains
  unfinished.

- **Retained padding elimination milestone:** The final two blobs were distinct
  non-USA R62B/R62C packed mapping/animation tables. They are now emitted from
  explicitly regional source fragments, removing the last 12,800 bytes under
  `padding/`. Direct byte reconstruction checks passed for both fragments, and
  the true European R62B/R62C entry points assembled successfully through the
  guarded displayless Proton toolchain, and the full USA build/check remains
  byte-exact for all 127 targets. No retained padding blobs remain. This
  establishes source coverage, not semantic decoding of every packed byte;
  no data was obtained from an original disc.

- **R62 Padding3 completion milestone:** R62A now source-emits a packed head
  and the continuation shared with USA R62B. Non-USA R62B emits its distinct
  prefix before the regional mapping suffix. R62C is split at its true
  regional divergence, preserving the USA legacy tail and the distinct
  non-USA continuation. All three complete retained blobs, totalling 28,090
  bytes, are removed. The tracked padding inventory falls to 2 files totalling
  12,800 bytes. The guarded displayless USA build/check remains byte-exact for
  all 127 targets; no data was obtained from an original disc.

- **R33 Padding3 completion milestone:** The distinct packed
  mapping/animation prefixes for R33C and R33D are now source-emitted before
  the existing shared mapping and rotation-vector tails. Both complete
  retained blobs, totalling 21,652 bytes, are removed. The tracked padding
  inventory falls to 5 files totalling 40,890 bytes. The guarded displayless
  USA build/check remains byte-exact for all 127 targets; no data was obtained
  from an original disc.

- **R72 Padding3 completion milestone:** The four variants now source-emit
  their packed prefixes before the existing mapping and rotation-vector tails.
  R72A and R72C are split at their true regional divergence points: USA uses
  the corrected graphics tail, while non-USA emits its distinct continuation
  and mapping suffix. The four complete retained blobs, totalling 38,510
  bytes, are removed. The tracked padding inventory falls to 7 files totalling
  62,542 bytes. The guarded displayless USA build/check remains byte-exact for
  all 127 targets; no data was obtained from an original disc.

- **R71 Padding3 completion milestone:** The four distinct packed
  mapping/animation prefixes for R71A, R71B, R71C, and R71D are now
  source-emitted before the existing shared mapping and rotation-vector tails.
  The four complete retained blobs, totalling 36,962 bytes, are removed. The
  tracked padding inventory falls to 11 files totalling 101,052 bytes. The
  guarded displayless USA build/check remains byte-exact for all 127 targets;
  no data was obtained from an original disc.

- **R62D Padding3 completion milestone:** The distinct `$206C`-byte packed
  mapping/animation prefix is now source-emitted before the existing shared
  mapping and rotation-vector tails. The complete 8,634-byte
  `r62d_e_3.bin` dependency is removed. The tracked padding inventory falls to
  15 files totalling 138,014 bytes. The guarded displayless USA build/check
  remains byte-exact for all 127 targets; no data was obtained from an original
  disc.

- **R53C Padding3 completion milestone:** The distinct `$2056`-byte packed
  mapping/animation prefix is now source-emitted before the existing shared
  mapping and rotation-vector tails. The complete 8,612-byte
  `r53c_e_3.bin` dependency is removed. The tracked padding inventory falls to
  16 files totalling 146,648 bytes. The guarded displayless USA build/check
  remains byte-exact for all 127 targets; no data was obtained from an original
  disc.

- **R12C Padding2 completion milestone:** The distinct `$1BCB`-byte packed
  mapping/animation prefix is now source-emitted, while the final `$47A` bytes
  reuse the named Act 2 Present Padding2 asset at `$204E`. Both R12C consumers
  now use those sources directly, removing `r12c_e_2.bin`. The tracked padding
  inventory falls to 17 files totalling 155,260 bytes. The guarded displayless
  USA build/check remains byte-exact for all 127 targets; no data was obtained
  from an original disc.

- **R52B Padding2 completion milestone:** The retained 10,240-byte slice was an
  exact concatenation of the named R51A chunk-map fragment at `$D800` and the
  final `$2600` bytes of the declarative R52 Padding2 table. That table now
  exposes its `$200` entry boundary, and R52B references both sources directly,
  removing `r52b_e_2.bin`. The tracked padding inventory falls to 18 files
  totalling 163,521 bytes. The guarded displayless USA build/check remains
  byte-exact for all 127 targets; no data was obtained from an original disc.

- **R51B Padding2 completion milestone:** The retained 10,240-byte slice was an
  exact concatenation of `$200` bytes from the named R51A chunk map at `$D800`
  and the complete `$2600`-byte declarative R51 Padding2 table. R51B now
  references those sources directly, removing `r51b_e_2.bin`. The tracked
  padding inventory falls to 19 files totalling 173,761 bytes. The guarded
  displayless USA build/check remains byte-exact for all 127 targets; no data
  was obtained from an original disc.

- **R51A Padding2 completion milestone:** The retained 8,192-byte slice is the
  exact final `$2000` bytes of the existing declarative R51 Padding2 table.
  That table now exposes its `$600` boundary so R51A can source the shared
  suffix directly, removing `r51a_e_2.bin`. The tracked padding inventory
  falls to 20 files totalling 184,001 bytes. The guarded displayless USA
  build/check remains byte-exact for all 127 targets; no data was obtained
  from an original disc.

- **R52A Padding2 completion milestone:** The retained 7,680-byte slice is the
  exact final `$1E00` bytes of the existing declarative R52 Padding2 table.
  That table now exposes its natural `$A00` boundary so R52A can source the
  shared suffix directly, removing `r52a_e_2.bin`. The tracked padding
  inventory falls to 21 files totalling 192,193 bytes. The guarded displayless
  USA build/check remains byte-exact for all 127 targets; no data was obtained
  from an original disc.

- **R61B Padding2 completion milestone:** The retained 6,656-byte slice was an
  exact concatenation of the final `$400` bytes of the named R61A chunk map and
  the shared `$1600`-byte Act 1 Present Padding2 asset. R61B now references
  those existing sources directly, removing `r61b_e_2.bin`. The tracked
  padding inventory falls to 22 files totalling 199,873 bytes. The guarded
  displayless USA build/check remains byte-exact for all 127 targets; no data
  was obtained from an original disc.

- **R42A Padding2 completion milestone:** The distinct `$1232`-byte packed
  graphics/mapping prefix is now source-emitted, while the final `$728` bytes
  reuse the byte-identical declarative R42B stage-data tail. The complete
  6,490-byte `r42a_e_2.bin` dependency has therefore been removed. The guarded
  displayless USA build/check remains byte-exact for all 127 targets, including
  R42A. The tracked padding inventory falls to 23 files totalling 206,529
  bytes; no data was obtained from an original disc.

- **R51A Padding3 completion milestone:** The distinct 2,392-byte packed
  graphics/mapping prefix is now emitted from a named source fragment, followed
  by the shared mapping and rotation-vector tails. The complete 2,726-byte
  `r51a_e_3.bin` dependency has therefore been removed. The guarded displayless
  USA build/check remains byte-exact for all 127 targets, including R51A. The
  tracked padding inventory falls to 24 files totalling 213,019 bytes; no data
  was obtained from an original disc.

- **Non-USA Padding3 mapping-suffix milestone:** R62B, R62C, R72A, and R72C
  share another 64-byte non-USA mapping suffix before the all-layout tail. It
  is now one declarative source fragment, replacing 256 binary-included bytes.
  The R62C non-USA blob bound was also corrected from an unexercised oversized
  value to its actual `$256C` prefix boundary. The guarded displayless USA
  build/check remains byte-exact for all 127 targets; Japan/Europe comparison
  originals remain unavailable, so this branch is verified from the four
  byte-identical tracked slices but not regional retail binaries. The physical
  padding inventory remains 25 files totalling 215,745 bytes; no data was
  obtained from an original disc.

- **Shared Padding3 mapping-tail milestone:** The additional identical 76-byte
  suffix immediately before the rotation vectors in all sixteen Padding3
  files is now one source fragment. It preserves the trailing mapping records,
  six-piece frame, one-piece records, and historical zero alignment, replacing
  another 1,216 binary-included bytes across R33C/R33D, R51A/R53C, R62A-D,
  and R71A-D/R72A-D. The guarded displayless USA build/check remains
  byte-exact for all 127 targets. The physical padding inventory remains 25
  files totalling 215,745 bytes while their distinct prefixes are decomposed;
  no data was obtained from an original disc.

- **Shared Padding3 rotation-vector milestone:** The identical 258-byte suffix
  in all sixteen remaining Padding3 level blobs is now one declarative table of
  signed rotation-vector pairs. R33C/R33D, R51A/R53C, R62A/R62B/R62C/R62D,
  and R71A-D/R72A-D now include that source table after bounded blob prefixes,
  replacing 4,128 binary-included bytes across the graph. Conditional USA
  layouts retain their established corrected source paths. The guarded
  displayless USA build/check remains byte-exact for all 127 targets. The
  physical padding inventory remains 25 files totalling 215,745 bytes until
  their remaining prefixes are decomposed; no data was obtained from an
  original disc.

- **R81 retained-data completion milestone:** The last identical 698-byte R81
  binary slice is now a named, source-emitted Enigma tilemap stream with its
  header fields separated from the compressed command words. R81A/B/C's
  historical following zero word is explicit. With all logic, mappings,
  animations, paths, record tables, and compressed data now source-backed,
  `r81a_e_1.bin` and `r81d_e_1.bin` have been removed. The guarded displayless
  USA build/check remains byte-exact for all 127 targets. The tracked padding
  inventory falls to 25 files totalling 215,745 bytes; no data was obtained
  from an original disc.

- **R81A/R81B/R81C/R81D platform-mapping milestone:** The identical final
  154-byte retained slice is now a shared declarative four-frame sprite-mapping
  table. It names two seven-piece frames, one fourteen-piece frame, an empty
  frame, and the historical alignment byte. The guarded displayless USA
  build/check remains byte-exact for all 127 targets. The padding inventory
  remains 27 files totalling 224,657 bytes because the final 698-byte shared
  R81 packed-record region still references both retained files; no data was
  obtained from an original disc.

- **R81A/R81B/R81C/R81D boss-overlay-mapping milestone:** The final
  byte-identical 16-byte retained mapping slice around the R81 boss/platform
  logic is now shared declarative source. Its two-entry pointer table names an
  empty frame and a visible two-piece overlay frame. The guarded displayless
  USA build/check remains byte-exact for all 127 targets. The padding inventory
  remains 27 files totalling 224,657 bytes because unrelated bounded R81 data
  still shares both retained files; no data was obtained from an original disc.

- **R81A/R81B/R81C/R81D boss-mapping milestone:** Both byte-identical
  retained boss sprite-mapping sets are now shared declarative source. Twelve
  frame entries describe 45 source-backed sprite pieces, including the original
  Mapping A pointers that intentionally select three frames in Mapping B. This
  replaces 258 binary-included bytes in each R81 layout. The guarded
  displayless USA build/check remains byte-exact for all 127 targets. The
  padding inventory remains 27 files totalling 224,657 bytes because other
  bounded R81 assets still share the retained files; no data was obtained from
  an original disc.

- **R81A/R81B/R81C/R81D boss-animation milestone:** The two byte-identical
  retained boss animation sets are now shared declarative source. Their twelve
  table entries resolve to named idle, hold, activation, movement, step, and
  stop scripts, replacing 90 binary-included bytes in each R81 layout. The
  guarded displayless USA build/check remains byte-exact for all 127 targets.
  The padding inventory remains 27 files totalling 224,657 bytes because the
  adjacent mappings and other bounded R81 assets still share the retained
  files; no data was obtained from an original disc.

- **R81A/R81B/R81C/R81D platform-path milestone:** The four byte-identical
  retained motion datasets are now shared declarative assembly records with
  named frame, duration, direction, and signed X-offset fields. This replaces
  108 binary-included bytes in each R81 layout while preserving the historical
  interleaved placement of the tables. The guarded displayless USA build/check
  remains byte-exact for all 127 targets. The padding inventory remains 27
  files totalling 224,657 bytes because other bounded R81 records still share
  `r81a_e_1.bin` and `r81d_e_1.bin`; no data was obtained from an original
  disc.

- **R81A/R81B/R81C marker-mapping milestone:** The 16-byte retained slice at
  R81A shared offsets `$7A`-`$89` is now a labeled two-frame sprite mapping
  table. The guarded USA build/check remains byte-exact for all 127 targets,
  including all three consumers. The padding inventory remains 27 files
  totalling 224,657 bytes because other bounded R81 records still share
  `r81a_e_1.bin`.

- **R81A/R81B/R81C/R81D retained-tail-record milestone:** The identical
  358-byte final pointer/placement/attribute record block is now one shared
  declarative source fragment, reused from the pre-existing R82A source table.
  R81ABC emits its historical additional zero alignment word explicitly, so
  this replaces 360 retained bytes in each R81A/B/C consumer and 358 bytes in
  R81D. The guarded USA build/check remains byte-exact for all 127 targets. The
  padding inventory remains 27 files totalling 224,657 bytes because earlier
  bounded palette, animation, mapping, path, and packed-record slices still
  reference the two R81 files; no data was transcribed from an original disc.

- **R81A/R81B/R81C retained-main milestone:** The complete 100-byte main-state
  slice at R81A shared offsets `$110`-`$173` is now semantic source. It recovers
  player-distance calculation, effect-child spawning, sound, player vertical
  reversal, routine/timer advancement, and the no-spawn transition into the
  existing animation helper. The guarded USA build/check remains byte-exact for
  all 127 targets, including R81A, R81B, and R81C. The padding inventory remains
  27 files totalling 224,657 bytes because the remaining bounded R81 palette,
  animation, mapping, pointer, path, and packed-record slices still share the
  same retained files and require field-level decomposition.

- **R81A/R81B/R81C retained-blink milestone:** The 56-byte retained slice at
  R81A shared offsets `$28`-`$5F` is now semantic source. It recovers four
  mapping records and a blink/display helper with its historical `$20CE2E`
  relative call, frame toggle, conditional draw, and display dispatch. The
  guarded USA build/check remains byte-exact for all 127 targets, including all
  three consumers R81A, R81B, and R81C. The padding inventory remains 27 files
  totalling 224,657 bytes because other bounded data and executable slices still
  share `r81a_e_1.bin`; the `$110`-`$173` R81ABC main-state slice is the next
  identified logic target.

- **R43C/R43D retained-tail completion milestone:** The final 724 bytes at
  shared offsets `$2A3E`-`$2D11` are now emitted from repository source and the
  11,538-byte `padding/r43d_e_1.bin` file has been removed. Its 128-byte
  compatibility helper is readable 68000 source with named control flow and
  explicit historical call targets. The following 596 bytes are shared packed
  legacy records moved from the pre-existing R51 non-USA source table, with no
  data transcribed from an original disc; R43 and R51 now include one labeled
  source fragment. The guarded USA build/check remains byte-exact for all 127
  targets, including R43C, R43D, and DEMO43C. The tracked padding inventory is
  now 27 files totalling 224,657 bytes. Field-level naming of the packed records,
  other retained regions, three FMV streams, and full Japan/Europe validation
  remain unfinished.

- **R43C/R43D retained-BreakBlock milestone:** The complete 518-byte historical
  BreakBlockObject cluster at shared offsets `$2838`-`$2A3D` is now namespaced
  semantic source. It recovers solid collision and breakup triggering, four
  debris-object spawns, impact-direction trajectory selection, debris gravity
  and deletion, sprite mappings, piece offsets, and all trajectory tables. The
  retained suffix now begins at the next routine boundary, `$2A3E`. The guarded
  USA build/check remains byte-exact for all 127 targets, including R43C, R43D,
  and DEMO43C. The padding inventory remains 28 files totalling 236,195 bytes
  because the later 724-byte suffix still shares the same retained file; later
  R43 logic/data, three FMV streams, and full Japan/Europe validation remain
  unfinished.

- **R43C/R43D retained-BigDoor milestone:** The complete 394-byte historical
  BigDoorObject cluster at shared offsets `$26AE`-`$2837` is now namespaced
  semantic source. It recovers switch lookup and closed-state solid collision,
  three cloned opening segments, alternating segment motion, timed movement,
  drawing/despawning/deletion, and sprite mappings. The retained suffix now
  begins at the next clean dispatcher boundary, `$2838`. The guarded USA
  build/check remains byte-exact for all 127 targets, including R43C, R43D, and
  DEMO43C. The padding inventory remains 28 files totalling 236,195 bytes
  because the later 1,242-byte suffix still shares the same retained file;
  later R43 logic/data, three FMV streams, and full Japan/Europe validation
  remain unfinished.

- **R43C/R43D retained-PressureElevator milestone:** The complete 440-byte
  historical PressureElevatorObject cluster at shared offsets `$24F6`-`$26AD`
  is now namespaced semantic source. It recovers the six-state dispatcher,
  player-relative activation, acceleration and capped descent, top-solid
  transfer and release, triggered ascent and reset, sound, drawing/despawning,
  and both sprite mapping frames. The retained suffix now begins at the next
  clean object boundary, `$26AE`. The guarded USA build/check remains byte-exact
  for all 127 targets, including R43C, R43D, and DEMO43C. The padding inventory
  remains 28 files totalling 236,195 bytes because the later 1,636-byte suffix
  still shares the same retained file; later R43 logic/data, three FMV streams,
  and full Japan/Europe validation remain unfinished.

- **R43C/R43D retained-PlatformChain milestone:** The complete 498-byte
  historical PlatformChainObject cluster at shared offsets `$2304`-`$24F5` is
  now namespaced semantic source. It recovers screen-range handling, top-solid
  player correction, eight linked segment spawns, subtype-selected geometry,
  switch-controlled direction reversal, circular movement with the historical
  `$200700` sine/cosine entry, derived object velocity, and sprite mappings. The
  retained suffix now begins at the next clean dispatcher boundary, `$24F6`.
  The guarded USA build/check remains byte-exact for all 127 targets, including
  R43C, R43D, and DEMO43C. The padding inventory remains 28 files totalling
  236,195 bytes because the later 2,076-byte suffix still shares the same
  retained file; later R43 logic/data, three FMV streams, and full Japan/Europe
  validation remain unfinished.

- **R43C/R43D retained-CollapseFloor milestone:** The complete 834-byte
  historical CollapseFloorObject cluster at shared offsets `$1FC2`-`$2303` is
  now namespaced semantic source. It recovers the parent platform dispatcher,
  top-solid collision and trigger timing, progressive two-fragment spawning,
  fragment fall states, player-release handling, sound trigger, and the full
  collapse-floor sprite mapping set. The retained suffix now begins at the next
  clean dispatcher boundary, `$2304`. The guarded USA build/check remains
  byte-exact for all 127 targets, including R43C, R43D, and DEMO43C. The padding
  inventory remains 28 files totalling 236,195 bytes because the later
  2,574-byte suffix still shares the same retained file; later R43 logic/data,
  three FMV streams, and full Japan/Europe validation remain unfinished.

- **R43C/R43D retained-CircleSpikeBall milestone:** The complete 396-byte
  historical CircleSpikeBallObject cluster at shared offsets `$1E36`-`$1FC1`
  is now namespaced semantic source. It recovers parent-lifetime checking,
  three linked child spawns, initialization of all four collision objects,
  subtype-selected direction and radius, circular movement with the historical
  `$200700` sine/cosine entry, drawing/despawning, and the sprite mapping frame.
  The retained suffix now begins at the next clean object boundary, `$1FC2`.
  The guarded USA build/check remains byte-exact for all 127 targets, including
  R43C, R43D, and DEMO43C. The padding inventory remains 28 files totalling
  236,195 bytes because the later 3,408-byte suffix still shares the same
  retained file; later R43 logic/data, three FMV streams, and full Japan/Europe
  validation remain unfinished.

- **R43C/R43D retained-SpikeBall milestone:** The complete 80-byte historical
  SpikeBallObject cluster at shared offsets `$1DE6`-`$1E35` is now namespaced
  semantic source. It recovers initialization, collision dimensions, drawing,
  despawning, and the sprite mapping frame. The retained suffix now begins at
  the next clean object boundary, `$1E36`. The guarded USA build/check remains
  byte-exact for all 127 targets, including R43C, R43D, and DEMO43C. The padding
  inventory remains 28 files totalling 236,195 bytes because the later
  3,804-byte suffix still shares the same retained file; later R43 logic/data,
  three FMV streams, and full Japan/Europe validation remain unfinished.

- **R43C/R43D retained-Mace milestone:** The complete 738-byte historical Mace
  cluster at shared offsets `$1B04`-`$1DE5` is now namespaced semantic source.
  It recovers the parent object, six linked chain/ball children, circular
  positioning with the historical `$200700` sine/cosine entry, child lifetime
  handling, and all three sprite mapping sets. The retained suffix now begins
  at the clean SpikeBallObject boundary, `$1DE6`. The guarded USA build/check
  remains byte-exact for all 127 targets, including R43C, R43D, and DEMO43C.
  The padding inventory remains 28 files totalling 236,195 bytes because the
  later 3,884-byte suffix still shares the same retained file; later R43
  logic/data, three FMV streams, and full Japan/Europe validation remain
  unfinished.

- **R43C/R43D retained-Fan milestone:** The complete 234-byte historical future
  FanObject cluster at shared offsets `$1A1A`-`$1B03` is now namespaced semantic
  source. It recovers parent-lifetime checking, horizontal/vertical setup,
  switch-controlled activation, orientation flags, drawing/deletion, and both
  mapping sets. The following retained cursor is aligned at `$1B02` to preserve
  the historical overlay boundary without dropping the next dispatcher word.
  The guarded USA build/check remains byte-exact for all 127 targets, including
  R43C, R43D, and DEMO43C. The padding inventory remains 28 files totalling
  236,195 bytes because the later 4,624-byte suffix still shares the same
  retained file; later R43 logic/data, three FMV streams, and full Japan/Europe
  validation remain unfinished.

- **R43C/R43D retained-Block milestone:** The complete 216-byte historical
  cluster at shared offsets `$1942`-`$1A19` is now namespaced semantic source.
  It recovers initialization, subtype-to-size selection, solid collision,
  drawing/despawning, the seven size records, and all seven sprite mapping
  variants. The retained suffix now begins at the clean future FanObject
  boundary, `$1A1A`. The guarded USA build/check remains byte-exact for all 127
  targets, including R43C, R43D, and DEMO43C. The padding inventory remains 28
  files totalling 236,195 bytes because the later 4,856-byte suffix still shares
  the same retained file; later R43 logic/data, three FMV streams, and full
  Japan/Europe validation remain unfinished.

- **R43C/R43D retained-CrushBlocks milestone:** The complete 576-byte
  historical cluster at shared offsets `$1702`-`$1941` is now namespaced
  semantic source. It recovers parent and child modes, eight linked block
  spawns with packed pointers, subtype layout records, solid collision,
  synchronized horizontal movement, timing/velocity records, despawning, and
  sprite mappings. The retained suffix now begins at the clean BlockObject
  boundary, `$1942`. The guarded USA build/check remains byte-exact for all 127
  targets, including R43C, R43D, and DEMO43C. The padding inventory remains 28
  files totalling 236,195 bytes because the later 5,072-byte suffix still shares
  the same retained file; later R43 logic/data, three FMV streams, and full
  Japan/Europe validation remain unfinished.

- **R43C/R43D retained-Animal milestone:** The complete 598-byte historical
  cluster at shared offsets `$14AC`-`$1701` is now namespaced semantic source.
  It recovers released and parent-linked animal states, two sine-driven movement
  paths, direction and layer updates, animation, two sprite mapping sets, and
  the regional tile table. The source preserves the USA animal-presence entry
  at `$20FD6E`, the non-USA symbolic entry, and both historical `$200700`
  sine/cosine calls. The retained suffix now begins at the clean CrushBlocks
  boundary, `$1702`. The guarded USA build/check remains byte-exact for all 127
  targets, including R43C, R43D, and DEMO43C. The padding inventory remains 28
  files totalling 236,195 bytes because the later 5,648-byte suffix still shares
  the same retained file; later R43 logic/data, three FMV streams, and full
  Japan/Europe validation remain unfinished.

- **R43C/R43D retained-Yago milestone:** The complete 1,260-byte historical
  cluster at shared offsets `$FC0`-`$14AB` is now namespaced semantic source.
  It recovers both subtype dispatchers and their nine-state movement graphs,
  floor/wall collision, turnaround, jumping and falling behavior, two animation
  sets, and two sprite mapping sets. The following animal-presence call remains
  source-emitted by the USA legacy overlay; the retained suffix is aligned at
  `$14AE` so that overlay and the following opcode meet without duplicated
  bytes. The guarded USA build/check remains byte-exact for all 127 targets,
  including R43C, R43D, and DEMO43C. The padding inventory remains 28 files
  totalling 236,195 bytes because the later 6,244-byte suffix still shares the
  same retained file; later R43 logic/data, three FMV streams, and full
  Japan/Europe validation remain unfinished.

- **R43C/R43D retained-TagaTaga milestone:** The complete 1,054-byte historical
  cluster at shared offsets `$BA2`-`$FBF` is now namespaced semantic source. It
  recovers the discarded five-state TagaTaga object, its three linked body
  parts, player-distance and trajectory helpers, missile object and delete
  path, animation records, two body mapping sets, and missile mappings.
  Namespacing keeps the retained copy distinct from the live Act 3 object. The
  binary suffix now begins at the next clean object boundary, `$FC0`. The
  guarded USA build/check remains byte-exact for all 127 targets, including
  R43C, R43D, and DEMO43C. The padding inventory remains 28 files totalling
  236,195 bytes because the later 7,506-byte suffix still shares the same
  retained file; later R43 logic/data, three FMV streams, and full Japan/Europe
  validation remain unfinished.

- **R43C/R43D retained-Amenbo milestone:** The complete 820-byte historical
  object cluster at shared offsets `$86E`-`$BA1` is now namespaced semantic
  source. It recovers the discarded Amenbo dispatcher and five states,
  acceleration and turnaround logic, water-relative movement, projectile
  spawning and player-facing checks, child-projectile handling, two animation
  sets, and two sprite mapping sets. Namespacing keeps this retained copy
  distinct from the live Act 3 Amenbo object. The binary suffix now begins at
  the next clean object boundary, `$BA2`. The guarded USA build/check remains
  byte-exact for all 127 targets, including R43C, R43D, and DEMO43C. The padding
  inventory remains 28 files totalling 236,195 bytes because the later
  8,560-byte suffix still shares the same retained file; later R43 logic/data,
  three FMV streams, and full Japan/Europe validation remain unfinished.

- **R43C/R43D retained-Tonbo milestone:** The complete 618-byte historical
  object cluster at shared offsets `$604`-`$86D` is now namespaced semantic
  source. It recovers the discarded Tonbo dispatcher, two movement variants,
  sinusoidal flight and direction reversal, animation records, and both sprite
  mapping sets while preserving its legacy `$200700` sine/cosine call target.
  Namespacing keeps this retained copy distinct from the live Act 3 Tonbo
  object. The binary suffix now begins at the next clean object boundary,
  `$86E`. The guarded USA build/check remains byte-exact for all 127 targets,
  including R43C, R43D, and DEMO43C. The padding inventory remains 28 files
  totalling 236,195 bytes because the later 9,380-byte suffix still shares the
  same retained file; later R43 logic/data, three FMV streams, and full
  Japan/Europe validation remain unfinished.

- **R43C/R43D twin-block milestone:** The complete 304-byte object cluster at
  shared offsets `$4D4`-`$603` now reuses the semantic R4 twin moving-block
  source. This recovers parent/child setup, linked-object lifetime handling,
  solid collision, the four-phase vertical movement state, its motion records,
  and sprite mapping. The retained binary range now begins at the next clean
  object boundary, `$604`. The guarded USA build/check remains byte-exact for
  all 127 targets, including R43C, R43D, and DEMO43C. The padding inventory
  remains 28 files totalling 236,195 bytes because the later 9,998-byte suffix
  still shares the same retained file; later R43 logic/data, three FMV streams,
  and full Japan/Europe validation remain unfinished.

- **R43C/R43D door-object milestone:** The complete 646-byte object cluster at
  shared offsets `$24E`-`$4D3` now reuses the semantic R4 door source. This
  recovers its dispatcher, initialization and subtype tables, switch-controlled
  states, player collision, horizontal/vertical opening helpers, movement
  clamping, and all three sprite mappings. The retained binary range now begins
  at the next clean object boundary, `$4D4`. The guarded USA build/check remains
  byte-exact for all 127 targets, including R43C, R43D, and DEMO43C. The padding
  inventory remains 28 files totalling 236,195 bytes because the later
  10,302-byte suffix still shares the same retained file; later R43 logic/data,
  three FMV streams, and full Japan/Europe validation remain unfinished.

- **R43C/R43D switch-object milestone:** The complete 384-byte object cluster
  at shared offsets `$CE`-`$24D` now reuses the semantic R4 switch source,
  including initialization, parent-relative positioning, solid collision,
  switch-state updates, despawning, its player-position helper, and both sprite
  mappings. The retained binary range now begins at the next clean object
  boundary, `$24E`. The guarded USA build/check remained byte-exact for all
  127 targets, including R43C, R43D, and DEMO43C. The padding inventory remains
  28 files totalling 236,195 bytes because the later 10,948-byte suffix still
  shares the same retained file; later R43 logic/data, three FMV streams, and
  full Japan/Europe validation remain unfinished.

- **R43C/R43D first-logic milestone:** The first complete executable cluster in
  the retained common body, shared offsets `$2`-`$CD` (204 bytes), is now
  semantic 68000 source. It recovers the remainder of the vertical moving-block
  initializer, two child-object spawns, horizontal velocity integration, and
  a position-wrap helper, while retaining the next object's clean `$CE`
  boundary. Both isolated R43C/R43D fragments remained byte-exact at 11,558 and
  11,538 bytes respectively, complete REGION=2 entries assembled at 262,148
  bytes, and the guarded USA build/check matched all 127 targets including
  R43C, R43D, and DEMO43C. The retained shared body still contains later object
  logic and data; the padding inventory remains 28 files totalling 236,195
  bytes, and three FMV streams plus full Japan/Europe validation remain
  unfinished.

- **R43C/R43D shared-body milestone:** R43D's complete 11,538-byte non-USA
  pre-chunk slice is byte-identical to R43C from offset `$14` onward. A shared
  include now emits R43C's 20-byte unique prefix as bounded words plus its
  source-backed object initializer, emits R43D's leading `$0002` word, and
  consumes one retained common body from offset `$2`. The redundant
  `r43c_e_1.bin` was removed, reducing the padding inventory by 11,558 bytes to
  28 files totalling 236,195 bytes. Both isolated fragments matched their
  former blobs exactly, complete REGION=2 R43C/R43D entries assembled at
  262,148 bytes, and the guarded USA build/check matched all 127 targets,
  including R43C, R43D, and DEMO43C after their extensive USA source overlays.
  The retained R43D common body still contains executable logic and data that
  require boundary-driven recovery; three FMV streams and full Japan/Europe
  validation also remain unfinished.

- **R81B/R81C unique-prefix source milestone:** R81B's complete 532-byte
  pre-shared-tail prefix is now declarative `dc.w` source, and comparison proves
  that R81C's complete 122-byte prefix is its exact suffix beginning at `$19A`.
  One conditional include emits either layout and expresses the USA-specific
  `$A572` to `$A564` word change directly, eliminating all regional reads of
  `r81b_e_1.bin` and `r81c_e_1.bin`. The two obsolete tracked blobs were removed,
  reducing the padding inventory by 9,854 bytes to 29 files totalling 247,753
  bytes. Complete REGION=2 R81B/R81C entries remained exactly 262,148 bytes,
  and the guarded USA build/check matched all 127 targets, including exact
  R81B/R81C outputs. The shared R81A data slices, three FMV streams, other
  padding files, and full Japan/Europe validation remain unfinished.

- **R81ABC shared-tail logic-complete milestone:** The final identified
  executable island in the 4,600-byte shared R81A/R81B/R81C tail, a six-byte
  trampoline at offset `$108C`, is now semantic source. The retained suffix is
  an exact shifted copy of R81D's already classified data-only suffix, and the
  earlier bounded gaps likewise align with palette, animation, mapping,
  pointer, placement, path, and packed asset regions. No identified 68000 logic
  therefore remains in the shared tail's retained slices. This does not remove
  `r81a_e_1.bin`, decompose those data regions, or classify R81B/R81C's unique
  prefixes. The isolated shared tail and all three complete 262,148-byte
  REGION=2 entries remained exact, and the guarded USA build/check matched all
  127 comparison targets. The tracked padding count remains 31 files totalling
  257,607 bytes; data-source decomposition, unique-prefix analysis, three FMV
  streams, other padding slices, and full Japan/Europe validation remain
  unfinished.

- **R81ABC boss-overlay/platform milestone:** The complete 646-byte island at
  offsets `$D6C`-`$FF1` is now source-backed. Boundary comparison established
  that it is byte-identical to R81D's recovered boss-overlay/platform block:
  522 bytes of executable overlay acquisition/release and platform dispatcher,
  positioning, mode, path-following, and frame-selection logic, plus 124 bytes
  of explicitly bounded mappings and four path-record tables. The retained
  slice now resumes at `$FF2`. The isolated 4,600-byte shared tail and all three
  complete 262,148-byte REGION=2 R81A/R81B/R81C entries remained exact, and
  the guarded USA build/check matched all 127 comparison targets. The tracked
  padding count remains 31 files totalling 257,607 bytes; later shared
  logic/data, three FMV streams, other padding slices, and full Japan/Europe
  validation remain unfinished.

- **R81ABC boss-state milestone:** The complete 658-byte boss state machine at
  offsets `$97E`-`$C0F` is now semantic 68000 source. Boundary comparison
  established that this island is byte-identical to the previously recovered
  R81D boss logic, including its 15-entry dispatcher, movement/path states,
  player-launch attack, reset logic, and collision-aware motion helper. Its
  four animation/mapping asset blocks remain explicitly bounded at
  `$C10`-`$D6B`; the next executable island starts at `$D6C`. The isolated
  4,600-byte shared tail and all three complete 262,148-byte REGION=2
  R81A/R81B/R81C entries remained exact, and the guarded USA build/check
  matched all 127 comparison targets. The tracked padding count remains 31
  files totalling 257,607 bytes; later shared logic/data, three FMV streams,
  other padding slices, and full Japan/Europe validation remain unfinished.

- **R81ABC palette/child/overlay milestone:** The complete 348-byte logic/data
  island at offsets `$566`-`$6C1` is now source-backed. It recovers the palette
  loader and palette words, including the meaningful `$56A` alternate entry
  used when a caller supplies `a3`; a child-object dispatcher and motion state;
  overlay acquisition/release behavior and mappings; and an external
  trampoline. The retained slice now begins at the verified table/pointer-data
  boundary `$6C2`. The isolated 4,600-byte shared tail and all three complete
  262,148-byte REGION=2 R81A/R81B/R81C entries remained exact, while the
  guarded USA build/check matched all 127 comparison targets. The tracked
  padding count remains 31 files totalling 257,607 bytes; later shared
  logic/data, three FMV streams, other padding slices, and full Japan/Europe
  validation remain unfinished.

- **R81ABC shared-helper milestone:** The contiguous 402-byte helper cluster at
  offsets `$3D4`-`$565` is now semantic 68000 source. It recovers player
  collision/state transfer, horizontal and vertical velocity integration,
  animation stepping, child-object spawning, player lookup/facing, and paired
  direction-bit updates. The following PC-relative `lea` is retained at its
  exact `$566` boundary because the known caller deliberately enters at the
  next instruction, `$56A`; its enclosing routine remains to be mapped. The
  isolated 4,600-byte shared tail and all three complete 262,148-byte REGION=2
  R81A/R81B/R81C entries remained exact, and the guarded USA build/check
  matched all 127 comparison targets. The tracked padding count remains 31
  files totalling 257,607 bytes; later shared logic/data, three FMV streams,
  other padding slices, and full Japan/Europe validation remain unfinished.

- **R81ABC complete-state-graph milestone:** The four remaining shared states
  at offsets `$2D6`-`$3D3`, totalling 254 bytes, are now semantic 68000 source.
  They recover horizontal launch and stopping behavior, vertical acceleration
  and landing transitions, player-object synchronization/deletion, and a
  second synchronized-position state whose four historical `nop` instructions
  are preserved explicitly. Together with the dispatcher and earlier states,
  every entry in the nine-word state table is now source-backed. The isolated
  4,600-byte shared tail and all three complete 262,148-byte REGION=2
  R81A/R81B/R81C entries remained exact; the guarded USA build/check matched
  all 127 comparison targets. The tracked padding count remains 31 files
  totalling 257,607 bytes; shared helpers and mixed data, three FMV streams,
  other padding slices, and full Japan/Europe validation remain unfinished.

- **R81ABC movement-state milestone:** The complete 282-byte shared state at
  offsets `$1BC`-`$2D5` is now semantic 68000 source. It recovers contact and
  collision checks, acceleration and signed speed limiting, player-relative
  movement, animation selection, stopping, and deletion paths. Calls into the
  retained helper area now use exact labels at `$3D4`, `$480`, `$48E`, `$4F0`,
  and `$53A`, preserving the original branch encodings and preparing those
  helpers for subsequent recovery. The isolated 4,600-byte shared tail and all
  three complete 262,148-byte REGION=2 R81A/R81B/R81C entries remained exact;
  the guarded USA build/check matched all 127 comparison targets. The tracked
  padding count remains 31 files totalling 257,607 bytes; the other shared
  states and helpers, three FMV streams, other padding slices, and full
  Japan/Europe validation remain unfinished.

- **R81ABC first-state milestone:** The 72-byte shared object state at offsets
  `$174`-`$1BB` is now semantic 68000 source, including its acceleration and
  position clamp, falling transition, and setup for the following state. Calls
  into the retained helper area now use labels at the exact `$472`, `$48E`, and
  `$53A` boundaries, ready for later helper recovery. The complete 4,600-byte
  shared tail remained byte-exact, all three complete 262,148-byte REGION=2
  R81A/R81B/R81C entries matched their prior outputs, and the guarded USA
  build/check matched all 127 comparison targets. The tracked padding count
  remains 31 files totalling 257,607 bytes; the other shared states and helpers,
  three FMV streams, other padding slices, and full Japan/Europe validation
  remain unfinished.

- **R81ABC object-dispatch milestone:** The 134-byte shared region at offsets
  `$8A`-`$10F` now expresses the R81A/R81B/R81C non-USA object dispatcher,
  nine-entry state table, and object initializer as semantic 68000 source.
  The historical branch target at `$56A` is labeled explicitly, while the
  dispatched state implementations remain bounded slices for subsequent
  recovery. The isolated 4,600-byte shared tail matched `r81a_e_1.bin`
  exactly, all three complete 262,148-byte REGION=2 R81A/R81B/R81C entries
  matched their prior outputs exactly, and the guarded USA build/check matched
  all 127 comparison targets. The tracked padding count remains 31 files
  totalling 257,607 bytes; the shared state handlers, three FMV streams, other
  padding slices, and full Japan/Europe validation remain unfinished.

- **Status clarification after the USA DEMO43C milestone:** The USA
  `check.sh` comparison now passes for every listed component, including all
  retail level binaries and the reconstructed DEMO files. This is byte-exact
  coverage for the comparison set, not completion of the entire disc: the
  build still copies `BADEND.STM`, `GOODEND.STM`, and `PTEST.STM`, retains 31
  tracked padding slices totalling 257,607 bytes, and has no Japan/Europe
  original trees available for regional validation. The ledger therefore
  distinguishes component byte equality, source-only ISO reconstruction, and
  full regional validation as separate milestones.

- **R81ABC shared-tail/first-routines milestone:** R81A's complete 4,600-byte
  non-USA pre-chunk block is byte-identical to R81B from offset `$214` onward
  and R81C from offset `$7A` onward. The three entries now consume one shared
  source include after R81B/R81C's unique prefixes instead of independently
  embedding three copies of the same tail. The first 64 instruction bytes in
  that shared tail are now semantic 68000 source: the completion of a
  record-copy loop and a marker-table search. The latter explicitly preserves
  its historical zero-displacement compare encoding. The isolated shared tail
  matched all 4,600 bytes of `r81a_e_1.bin`, all three complete 262,148-byte
  REGION=2 R81A/R81B/R81C entries matched their prior outputs exactly, and the
  guarded USA build/check matched all 127 comparison targets. The unique
  prefixes and later shared mixed code/data remain binary-backed, so the
  tracked padding count stays 31 files totalling 257,607 bytes. Further R81
  logic/data recovery, the three FMV streams, other padding slices, and full
  Japan/Europe validation remain unfinished.

- **R81D logic-complete milestone:** The final identified executable island in
  `r81d_e_1.bin`, a six-byte trampoline at offset `$F6C`, is now source-backed.
  Combined with the earlier contiguous object routines, boss state machine,
  overlay, and platform controller, boundary analysis now finds no identified
  68000 logic remaining in the retained R81D slices. Those slices are still
  required for bounded palette, animation, mapping, path, packed graphics, and
  pointer/placement data, so this is explicitly a logic-complete milestone—not
  removal of the blob or completion of all R81 data reconstruction. The
  complete 4,312-byte mixed-region probe matched the former blob exactly, the
  complete 262,148-byte REGION=2 R81D entry matched its prior output exactly,
  and the guarded USA build/check matched all 127 comparison targets. The
  tracked padding count remains 31 files totalling 257,607 bytes. Other R81
  executable blobs, data-source replacement, the three FMV streams, remaining
  padding slices, and full Japan/Europe validation remain unfinished.

- **R81D overlay/platform disassembly milestone:** Another 522 bytes of
  executable logic and dispatch records between offsets `$C4C` and `$ED1` of
  the mixed R81D non-USA pre-chunk block are now source-backed. This recovers
  the boss overlay handler and a two-state platform controller with nine
  submodes, camera-relative positioning, visibility gating, frame selection,
  and shared motion-record playback. The second controller state is expressed
  as an intentional entry at the camera-position refresh label, preserving a
  subtle behavior previously hidden in its numeric dispatch offset. Mapping
  and motion records remain as named, tightly bounded data slices. The
  complete 4,312-byte mixed-region probe matched the former blob exactly, the
  complete 262,148-byte REGION=2 R81D entry matched its prior output exactly,
  and the guarded USA build/check matched all 127 comparison targets. The
  retained data means `r81d_e_1.bin` and the overall count of 31 files
  totalling 257,607 bytes are unchanged. Further R81 logic/data recovery, the
  three FMV streams, other padding slices, and full Japan/Europe validation
  remain unfinished.

- **R81D boss-state disassembly milestone:** The 658-byte executable region at
  offsets `$85E`-`$AEF` of the mixed R81D non-USA pre-chunk block is now real
  68000 source. It contains a 15-state dispatcher, boss initialization,
  falling and path-following states, slow/fast movement setup, player-launch
  logic, state transitions, and shared collision-aware movement helpers. Its
  PC-relative animation/mapping pointers now target four named, bounded binary
  data slices; the preceding `$5A2`-`$85B` region was classified as data and
  deliberately not presented as disassembled logic. The complete 4,312-byte
  mixed-region probe matched the former blob exactly, the complete
  262,148-byte REGION=2 R81D entry matched its prior output exactly, and the
  guarded USA build/check matched all 127 comparison targets. The first 1,442
  bytes remain continuously source-backed, but the retained data means
  `r81d_e_1.bin` and the overall count of 31 files totalling 257,607 bytes are
  unchanged. Further R81 logic/data recovery, the three FMV streams, other
  padding slices, and full Japan/Europe validation remain unfinished.

- **R81D palette/child-object disassembly milestone:** The first 1,442 bytes
  of the mixed R81D non-USA pre-chunk region are now real 68000 source. The
  newly recovered 348-byte span contains a palette-transfer routine and its
  32-byte declarative palette, a dispatched child-object state machine, an
  overlay object handler, its mapping records, and an external trampoline.
  Code and inline data are separated at their actual boundaries rather than
  treating the whole span as instructions. The complete 4,312-byte
  mixed-region probe matched the former blob exactly, the complete
  262,148-byte REGION=2 R81D entry matched its prior output exactly, and the
  guarded USA build/check matched all 127 comparison targets. The unresolved
  remainder is still included from `r81d_e_1.bin`, so the tracked padding
  count remains 31 files totalling 257,607 bytes. Further R81 instruction/data
  recovery, the three FMV streams, other padding slices, and full Japan/Europe
  validation remain unfinished.

- **R81D helper-block disassembly milestone:** The first 1,094 bytes of the
  mixed R81D non-USA pre-chunk region are now real 68000 source. The newly
  recovered 402-byte helper block implements player collision and attachment,
  horizontal/vertical velocity integration, animation stepping, child-object
  spawning, player loading, and facing-direction updates. This removes every
  opaque gap before the next routine boundary at offset `$446`. The complete
  4,312-byte mixed-region probe matched the former blob exactly, the complete
  262,148-byte REGION=2 R81D entry matched its prior output exactly, and the
  guarded USA build/check matched all 127 comparison targets. The unresolved
  remainder is still included from `r81d_e_1.bin`, so the tracked padding
  count remains 31 files totalling 257,607 bytes. Further R81 instruction/data
  recovery, the three FMV streams, other padding slices, and full Japan/Europe
  validation remain unfinished.

- **R81D jump/synchronization disassembly milestone:** The first 692 bytes of
  the mixed R81D non-USA pre-chunk region are now real 68000 source. The newly
  recovered 254-byte span contains jump initialization and movement plus two
  player-synchronization handlers; the latter preserves four original `nop`
  instructions explicitly. The shared velocity helper now has a label at its
  exact retained-binary offset. The complete 4,312-byte mixed-region probe
  matched the former blob exactly, the complete 262,148-byte REGION=2 R81D
  entry matched its prior output exactly, and the guarded USA build/check
  matched all 127 comparison targets. The unresolved remainder is still
  included from `r81d_e_1.bin`, so the tracked padding count remains 31 files
  totalling 257,607 bytes. Further R81 instruction/data recovery, the three
  FMV streams, other padding slices, and full Japan/Europe validation remain
  unfinished.

- **R81D active-state disassembly milestone:** The first 438 bytes of the
  mixed R81D non-USA pre-chunk region are now real 68000 source. The newly
  recovered 282-byte routine covers its state timer, player attachment and
  detachment checks, horizontal acceleration, boundary handling, movement,
  animation selection, and terminal state transition. Calls into the
  unresolved remainder now use labels at their exact binary offsets. The
  complete 4,312-byte mixed-region probe matched the former blob exactly, the
  complete 262,148-byte REGION=2 R81D entry matched its prior output exactly,
  and the guarded USA build/check matched all 127 comparison targets. This
  also corrects the previous milestone's erroneous count of 129 targets. The
  unresolved remainder is still included from `r81d_e_1.bin`, so the tracked
  padding count remains 31 files totalling 257,607 bytes. Further R81
  instruction/data recovery, the three FMV streams, other padding slices, and
  full Japan/Europe validation remain unfinished.

- **R81D falling-state disassembly milestone:** The first 156 bytes of the
  mixed R81D non-USA pre-chunk region are now real 68000 source. In addition
  to the opening object-spawn routine, this recovers its common-state
  trampoline and falling-state handler, with named labels at the unresolved
  subroutine targets so the original branch displacements remain exact. The
  complete 4,312-byte mixed-region probe matched the former blob exactly, the
  complete 262,148-byte REGION=2 R81D entry matched its prior output exactly,
  and the guarded USA build/check matched all 127 comparison targets. The
  unresolved remainder is still included from `r81d_e_1.bin`, so the tracked
  padding count remains 31 files totalling 257,607 bytes. Further R81
  instruction/data recovery, the three FMV streams, other padding slices, and
  full Japan/Europe validation remain unfinished.

- **R81D opening-routine disassembly milestone:** The first 74 bytes of the
  mixed R81D non-USA pre-chunk region are now real 68000 instructions with
  named control-flow labels rather than bytes read from the blob. The source
  preserves the original zero-displacement `move.b` encoding explicitly. Its
  complete 4,312-byte mixed-region probe matched the former blob exactly, the
  complete REGION=2 R81D entry matched its prior output exactly, and the
  guarded USA build/check remained fully byte-exact. The unresolved remainder
  is still included from `r81d_e_1.bin`, so the tracked padding count remains
  31 files totalling 257,607 bytes. Further R81 instruction/data boundary
  recovery, the three FMV streams, other padding slices, and full Japan/Europe
  validation remain unfinished.

- **R63D Padding3 source milestone:** The 2,040-byte Wacky Workbench Act 3
  Bad Future compressed tail is now a named declarative source instead of an
  opaque padding include. Its isolated REGION=2 assembly matched every former
  byte exactly, the complete REGION=2 entry assembled successfully, and the
  guarded USA build/check remained fully byte-exact. The blob was removed,
  reducing the tracked padding set to 31 files totalling 257,607 bytes. The
  R81 executable pre-chunk work, three FMV streams,
  remaining padding slices, and full Japan/Europe validation remain
  unfinished.

- **R81B/R81C Padding3 source milestone:** The distinct 3,582-byte R81B and
  4,546-byte R81C stage-data tails are now named declarative sources instead
  of opaque padding includes. Both isolated REGION=2 fragments matched every
  former byte exactly, both complete REGION=2 Act 1 entries assembled
  successfully, and the guarded USA build/check remained fully byte-exact.
  The two data-only blobs were removed, reducing the tracked padding set to 32
  files totalling 259,647 bytes. All four remaining R81 Padding1
  blobs contain executable 68000 regions and remain pending instruction-level
  reconstruction, including the R81B/R81C USA byte overlays. The three FMV
  streams, other padding slices, and full Japan/Europe validation also remain
  unfinished.

- **R81A/R81D Padding3 source milestone:** The distinct 3,156-byte R81A
  stage-data tail and 11,172-byte R81D compressed tail are now named
  declarative sources instead of opaque padding includes. Both isolated
  REGION=2 fragments matched every former byte exactly, both complete REGION=2
  Act 1 entries assembled successfully, and the guarded USA build/check
  remained fully byte-exact. The two data-only blobs were removed, reducing
  the tracked padding set to 34 files totalling 267,775 bytes. The R81A/R81D
  pre-chunk blobs contain executable 68000 routines and
  remain unfinished pending instruction-level reconstruction rather than a
  byte-dump conversion. The three FMV streams, remaining padding slices, and
  full Japan/Europe validation also remain unfinished.

- **R83C/R83D tail-source milestone:** The 5,820-byte R83C compressed stage
  tail and 5,402-byte R83D nibble-pattern tail are now named declarative
  sources instead of opaque padding includes. Both isolated REGION=2 fragments
  matched every former byte exactly, both complete REGION=2 Act 3 entries
  assembled successfully, and the guarded USA build/check remained fully
  byte-exact. The two blobs were removed, reducing the tracked padding set to
  36 files totalling 282,103 bytes. The three FMV streams, remaining padding
  slices, and full Japan/Europe validation remain unfinished.

- **R82C/R83C Padding2 source milestone:** The repetitive 2,558-byte R82C and
  2,666-byte R83C nibble-pattern tails are now named declarative sources
  instead of opaque padding includes. Both isolated REGION=2 fragments matched
  every former byte exactly, both complete REGION=2 Good Future entries
  assembled successfully, and the guarded USA build/check remained fully
  byte-exact. The two blobs were removed, reducing the tracked padding set to
  38 files totalling 293,325 bytes. The three FMV streams, remaining padding
  slices, and full Japan/Europe validation remain unfinished.

- **R82B/R82C Padding3 source milestone:** The distinct 2,148-byte R82B and
  1,656-byte R82C compressed stage-data tails are now named declarative
  sources instead of opaque padding includes. Both isolated REGION=2
  fragments matched every former byte exactly, both complete REGION=2 Act 2
  entries assembled successfully, and the guarded USA build/check remained
  fully byte-exact. The two blobs were removed, reducing the tracked padding
  set to 40 files totalling 298,549 bytes. The three FMV streams, remaining
  padding slices, and full Japan/Europe validation remain unfinished.

- **R41B/R42B Padding2 source milestone:** The two 1,832-byte Tidal Tempest
  Past tails are now named declarative sources: compressed stage data for
  R41B and curve/mapping records for R42B. Both isolated REGION=2 fragments
  matched every former byte exactly, both complete REGION=2 Past entries
  assembled successfully, and the guarded USA build/check remained fully
  byte-exact across the standard and compatibility consumers. The two blobs
  were removed, reducing the tracked padding set to 42 files totalling 302,353
  bytes. The three FMV streams, remaining padding slices, and full
  Japan/Europe validation remain unfinished.

- **Complete R73D data-source milestone:** The remaining 2,682-byte non-USA
  pre-chunk mapping region and 4,642-byte compressed stage-data tail are now
  named declarative sources. R73D's third tail was already declarative, and
  USA continues to use its reconstructed pre-chunk source. Both isolated
  REGION=2 fragments matched every former byte exactly, the complete REGION=2
  Act 3 Bad Future entry assembled successfully, and the guarded USA
  build/check remained fully byte-exact. The two blobs were removed, reducing
  the tracked padding set to 44 files totalling 306,017 bytes. The three FMV
  streams, remaining padding slices, and full Japan/Europe validation remain
  unfinished.

- **Complete R73C data-source milestone:** The 2,568-byte non-USA pre-chunk
  mapping region, 2,229-byte stage-data tail, and 2,342-byte compressed
  graphics tail are now named declarative sources. The USA build continues to
  use its existing reconstructed pre-chunk source. All three isolated REGION=2
  fragments matched every former byte exactly, the complete REGION=2 Act 3
  Good Future entry assembled successfully, and the guarded USA build/check
  remained fully byte-exact. The three blobs were removed, reducing the
  tracked padding set to 46 files totalling 313,341 bytes. The three FMV
  streams, remaining padding slices, and full Japan/Europe validation remain
  unfinished.

- **R71C/R72C Padding2 source milestone:** The two 7,680-byte Stardust
  Speedway Past stage-data tails are now declarative source. R72C preserves
  its existing regional structure as a shared 2,048-byte prefix followed by
  either the USA legacy animation source or a 5,632-byte non-USA tail. Both
  isolated non-USA assemblies matched every former byte exactly, both
  complete REGION=2 entries assembled successfully, and the guarded USA
  build/check remained fully byte-exact. The two blobs were removed, reducing
  the tracked padding set to 49 files totalling 320,480 bytes. The three FMV
  streams, remaining padding slices, and full Japan/Europe validation remain
  unfinished.

- **R71A/R72A Padding2 source milestone:** The two 5,632-byte Stardust
  Speedway Present stage-data tails are now emitted from named declarative
  source fragments instead of opaque padding includes. Both isolated
  assemblies matched every former byte exactly, both complete REGION=2
  entries assembled successfully, and the guarded USA build/check remained
  fully byte-exact. The two blobs were removed, reducing the tracked padding
  set to 51 files totalling 335,840 bytes. The three FMV streams, remaining
  padding slices, and full Japan/Europe validation remain unfinished.

- **R71D/R72D Padding2 source milestone:** The two 10,752-byte Stardust
  Speedway Bad Future chunk-table tails are now emitted from named declarative
  source fragments instead of opaque padding includes. Their first 2,050 bytes
  are identical, while the remaining records stay stage-specific. Both
  isolated assemblies matched every former byte exactly, both complete
  REGION=2 entries assembled successfully, and the guarded USA build/check
  remained fully byte-exact. The two blobs were removed, reducing the tracked
  padding set to 53 files totalling 347,104 bytes. The three FMV streams,
  remaining padding slices, and full Japan/Europe validation remain
  unfinished.

- **R42A/R42B/R42C shared Padding3 milestone:** The three non-USA
  R42A/R42B/R42C `Padding3` fragments are now emitted from exact R42A/R42C
  prefixes and a shared R42B source table. Their former blob bytes match
  exactly; isolated non-USA probes assembled all three entries, and the
  guarded USA build/check remained fully byte-exact. The three blobs were
  removed, reducing the tracked padding set to 126 files totalling 824,992
  bytes. The three FMV streams, remaining padding slices, and Japan/Europe
  validation remain unfinished.

- **R41B/R41C shared Padding3 milestone:** The non-USA R41B/R41C `Padding3`
  fragments are now emitted from a shared R41B source table plus the exact
  R41C prefix. The corresponding variant data branches use the same source
  representation, and all former blob bytes match exactly; isolated non-USA
  probes assembled both entries, and the guarded USA build/check remained
  fully byte-exact. The two blobs were removed, reducing the tracked padding
  set to 124 files totalling 822,198 bytes. The three FMV streams, remaining
  padding slices, and Japan/Europe validation remain unfinished.

- **R71A/R71B/R71C/R71D shared Padding1 milestone:** The four non-USA R71
  `Padding1` fragments are now emitted from a shared R71C source table plus
  exact R71A, R71B, and R71D prefixes. All former blob bytes match exactly;
  isolated non-USA probes assembled all four entries, and the guarded USA
  build/check remained fully byte-exact. The four blobs were removed,
  reducing the tracked padding set to 120 files totalling 816,246 bytes. The
  three FMV streams, remaining padding slices, and Japan/Europe validation
  remain unfinished.

- **R41D/R42D shared Padding2 milestone:** The identical non-USA R41D/R42D
  `Padding2` tables are now emitted from one 3,304-byte declarative source
  table, including the Tidal Tempest variant branch that formerly referenced
  R41D's blob. Both former blob regions match exactly; isolated non-USA
  probes assembled both entries, and the guarded USA build/check remained
  fully byte-exact. The two blobs were removed, reducing the tracked padding
  set to 118 files totalling 809,638 bytes. The three FMV streams, remaining
  padding slices, and Japan/Europe validation remain unfinished.

- **R51C/R52C/R51D/R52D shared Padding3 milestone:** The exact duplicate
  non-USA R51C/R52C and R51D/R52D `Padding3` tables are now emitted from two
  shared declarative source tables. All four former blob regions match
  exactly; isolated non-USA probes assembled all four entries, and the
  guarded USA build/check remained fully byte-exact. The four blobs were
  removed, reducing the tracked padding set to 114 files totalling 795,362
  bytes. The three FMV streams, remaining padding slices, and Japan/Europe
  validation remain unfinished.

- **R31D/R32A compatibility-source reuse milestone:** The otherwise unwired
  Collision Chaos Act 1 Bad Future and Act 2 Present variant branches now
  reuse the existing exact 3,356-byte R32A declarative `Padding1` source
  instead of duplicate blobs. Static comparison matched both former blobs;
  isolated non-USA wrappers assembled both compatibility graphs, and the
  guarded USA build/check remained fully byte-exact. The two blobs were
  removed, reducing the tracked padding set to 112 files totalling 788,650
  bytes. The three FMV streams, remaining padding slices, and Japan/Europe
  validation remain unfinished.

- **R61C/R61D Padding2 source-asset milestone:** The identical 6,144-byte
  R61C/R61D `Padding2` regions are now emitted from the exact `$E800`-`$E9FF`
  range of the tracked Wacky Workbench Act 1 chunks followed by the complete
  tracked Act 1 `Padding/2` asset. Both former blobs match this composition
  exactly; isolated non-USA probes assembled both entries, and the guarded
  USA build/check remained fully byte-exact. The two blobs were removed,
  reducing the tracked padding set to 110 files totalling 776,362 bytes. The
  three FMV streams, remaining padding slices, and Japan/Europe validation
  remain unfinished.

- **R13C/R13D shared Padding2 milestone:** The identical non-USA R13C/R13D
  `Padding2` regions are now emitted from one exact 6,540-byte declarative
  source table shared by the Act 3 data and the `STAGE_R13` compatibility
  path. Both former blobs match exactly; isolated non-USA probes assembled
  both entries, and the guarded USA build/check remained fully byte-exact.
  The two blobs were removed, reducing the tracked padding set to 108 files
  totalling 763,282 bytes. The three FMV streams, remaining padding slices,
  and Japan/Europe validation remain unfinished.

- **R32A/R32B compatibility-source reuse milestone:** The Collision Chaos
  Act 2 Present/Past compatibility branches now include the existing exact
  R32A/R32B declarative `Padding2` source tables instead of duplicate blobs.
  Isolated table assemblies matched both former 10,752-byte blobs exactly;
  both complete non-USA compatibility graphs assembled successfully, and the
  guarded USA build/check remained fully byte-exact. The two blobs were
  removed, reducing the tracked padding set to 106 files totalling 741,778
  bytes. The three FMV streams, remaining padding slices, and Japan/Europe
  validation remain unfinished.

- **R51C/R51D shared Padding2 milestone:** The identical R51C/R51D
  `Padding2` regions are now emitted from one exact 9,728-byte declarative
  source table. An isolated table assembly matched both former blobs exactly;
  both non-USA entries assembled successfully, and the guarded USA build/check
  kept both retail binaries and every other comparison target byte-exact. The
  two blobs were removed, reducing the tracked padding set to 104 files
  totalling 722,322 bytes. The three FMV streams, remaining padding slices,
  and Japan/Europe validation remain unfinished.

- **R52C/R52D/R53C shared Padding2 milestone:** The identical R52C/R52D/R53C
  `Padding2` regions are now emitted from one exact 10,240-byte declarative
  source table under Quartz Quadrant. The prior R51 shared table was also
  relocated from the incorrectly named Metallic Madness directory into the
  same owning subsystem without changing its bytes. Isolated table assembly
  matched all three former R52/R53 blobs exactly; all three affected non-USA
  entries assembled successfully, and the guarded USA build/check remained
  fully byte-exact. The three blobs were removed, reducing the tracked padding
  set to 101 files totalling 691,602 bytes. The three FMV streams, remaining
  padding slices, and Japan/Europe validation remain unfinished.

- **R81A/R81B/R81C shared Padding2 milestone:** The identical R81A/R81B/R81C
  `Padding2` regions are now emitted from one exact 8,704-byte declarative
  source table under Metallic Madness. Isolated table assembly matched all
  three former blobs exactly; all three affected non-USA entries assembled
  successfully, and the guarded USA build/check remained fully byte-exact.
  The three blobs were removed, reducing the tracked padding set to 98 files
  totalling 665,490 bytes. The three FMV streams, remaining padding slices,
  and Japan/Europe validation remain unfinished.

- **R33C/R33D shared Padding2 milestone:** The identical non-USA R33C/R33D
  `Padding2` regions are now emitted from one exact 7,362-byte declarative
  source table under Collision Chaos. Isolated table assembly matched both
  former blobs exactly; both affected non-USA entries assembled successfully,
  and the guarded USA build/check remained fully byte-exact. The two blobs
  were removed, reducing the tracked padding set to 96 files totalling 650,766
  bytes. The three FMV streams, remaining padding slices, and Japan/Europe
  validation remain unfinished.

- **R71B/R72B shared Padding2 milestone:** The identical non-USA R71B/R72B
  `Padding2` regions are now emitted from one exact 7,168-byte declarative
  source table under Stardust Speedway. Isolated table assembly matched both
  former blobs exactly; both affected non-USA entries assembled successfully,
  and the guarded USA build/check remained fully byte-exact. The two blobs
  were removed, reducing the tracked padding set to 94 files totalling 636,430
  bytes. The three FMV streams, remaining padding slices, and Japan/Europe
  validation remain unfinished.

- **R31D/R32D compatibility-source reuse milestone:** The otherwise unwired
  Collision Chaos Act 1 and Act 2 Bad Future compatibility branches now reuse
  the existing exact R32D declarative `Padding2` source instead of duplicate
  blobs. Isolated assembly matched both former 6,718-byte blobs exactly; both
  complete non-USA compatibility graphs assembled successfully, and the
  guarded USA build/check remained fully byte-exact. The two blobs were
  removed, reducing the tracked padding set to 92 files totalling 622,994
  bytes. The three FMV streams, remaining padding slices, and Japan/Europe
  validation remain unfinished.

- **R32C compatibility-source reuse milestone:** The otherwise unwired
  Collision Chaos Act 2 Good Future compatibility branch now reuses the
  existing exact R32C declarative `Padding2` source instead of its duplicate
  blob. Isolated assembly matched the former 6,850-byte blob exactly; the
  complete non-USA compatibility graph assembled successfully, and the
  guarded USA build/check remained fully byte-exact. The blob was removed,
  reducing the tracked padding set to 91 files totalling 616,144 bytes. This
  is the 100th padding slice replaced. The three FMV streams, remaining
  padding slices, and Japan/Europe validation remain unfinished.

- **R31C inline-source extraction milestone:** The exact 6,850-byte R31C
  `Padding2` directives formerly embedded in `r3/data_1c.asm` now live in one
  named Collision Chaos source fragment shared by the normal R31C entry and
  the otherwise unwired Act 1 Good Future compatibility graph. Isolated
  assembly matched the former blob exactly; both consumers assembled
  successfully, and the guarded USA build/check remained fully byte-exact.
  The blob was removed, reducing the tracked padding set to 90 files totalling
  609,294 bytes. The three FMV streams, remaining padding slices, and
  Japan/Europe validation remain unfinished.

- **R32A/R32B/R32C/R32D Padding3 compatibility-source reuse milestone:** All
  four Collision Chaos Act 2 compatibility branches now reuse the existing
  exact declarative `Padding3` sources used by the normal R32 entries instead
  of duplicate blobs. Four isolated assemblies matched the former blobs
  exactly, totalling 41,444 bytes; all four complete non-USA compatibility
  graphs assembled successfully, and the guarded USA build/check remained
  fully byte-exact. The four blobs were removed, reducing the tracked padding
  set to 86 files totalling 567,850 bytes. The three FMV streams, remaining
  padding slices, and Japan/Europe validation remain unfinished.

- **R31B/R31C/R31D inline Padding3 extraction milestone:** The exact R31B,
  R31C, and R31D `Padding3` directive blocks formerly embedded at the ends of
  their normal data files now live in three named Collision Chaos fragments
  shared with the corresponding Act 1 compatibility branches. Isolated
  assembly matched all three former blobs exactly, totalling 39,708 bytes;
  all three normal entries and all three complete non-USA compatibility graphs
  assembled successfully, and the guarded USA build/check remained fully
  byte-exact. The three blobs were removed, reducing the tracked padding set
  to 83 files totalling 528,142 bytes. The three FMV streams, remaining padding
  slices, and Japan/Europe validation remain unfinished.

- **R82A Padding3 source milestone:** The former 14,484-byte R82A `Padding3`
  blob is now represented as an exact 12,774-byte common declarative base and
  a 1,710-byte retail tail. The USA demo keeps the same common base but selects
  the existing declarative legacy demo tail, making the regional/demo overlay
  explicit without duplicating the base source. Isolated retail and demo
  compositions both assembled to the required size; the full regional retail
  entry assembled successfully, and the guarded USA build/check kept both
  `R82A__.MMD` and `DEMO82A.MMD` fully byte-exact. The blob was removed,
  reducing the tracked padding set to 82 files totalling 513,658 bytes. The
  three FMV streams, remaining padding slices, and Japan/Europe validation
  remain unfinished.

- **R13C/R13D shared Padding3 milestone:** The R13C `Padding3` region is now
  represented as its exact 510-byte prefix followed by the complete shared
  13,294-byte R13D declarative base. This captures the proven containment
  relationship once and is used by both the normal Act 3 data and the
  `STAGE_R13` compatibility path. Isolated compositions matched both former
  blobs exactly; both non-USA Act 3 entries assembled to 262,144 bytes, and
  the guarded USA build/check remained fully byte-exact. The two blobs were
  removed, reducing the tracked padding set to 80 files totalling 486,560
  bytes. The three FMV streams, remaining padding slices, and Japan/Europe
  validation remain unfinished.

- **R53D Padding2 source milestone:** The former 12,288-byte R53D `Padding2`
  region is now emitted from an exact declarative source table under Quartz
  Quadrant. Isolated table assembly matched the former blob exactly; the full
  non-USA R53D entry assembled successfully, and the guarded USA build/check
  remained fully byte-exact. The blob was removed, reducing the tracked
  padding set to 79 files totalling 474,272 bytes. The three FMV streams,
  remaining padding slices, and Japan/Europe validation remain unfinished.

- **R61A/R61C/R61D shared Padding3 milestone:** The three Wacky Workbench
  Act 1 `Padding3` regions are now emitted from exact shared declarative
  segments: an R61C/R61D prefix, an R61A/R61C suffix prefix, a final
  7,028-byte table common to all three, and their minimal unique pieces. The
  R62C compatibility slice now reuses the exact 665-byte shared-prefix tail
  followed by that common final table instead of slicing R61D's blob. Isolated
  compositions matched all three former blobs and the historical R62C slice
  exactly; all four affected non-USA entries assembled successfully, and the
  guarded USA build/check remained fully byte-exact. The three blobs were
  removed, reducing the tracked padding set to 76 files totalling 441,362
  bytes. The three FMV streams, remaining padding slices, and Japan/Europe
  validation remain unfinished.

- **R52A non-USA pre-chunk source milestone:** The 1,572-byte regional
  graphics/code table before the R52A chunk data is now emitted as declarative
  source instead of an opaque padding include. An isolated assembly matched
  every former byte exactly; the complete REGION=2 R52A entry assembled
  successfully, and the guarded USA build/check remained fully byte-exact.
  The blob was removed, reducing the tracked padding set to 75 files totalling
  439,790 bytes. The three FMV streams, remaining padding slices, and full
  Japan/Europe validation remain unfinished.

- **R52B non-USA pre-chunk source milestone:** The adjacent 1,732-byte R52B
  regional graphics/code table before the chunk data is now declarative source
  rather than an opaque padding include. Its isolated assembly matched every
  former byte exactly; the complete REGION=2 R52B entry assembled successfully,
  and the guarded USA build/check remained fully byte-exact. The blob was
  removed, reducing the tracked padding set to 74 files totalling 438,058
  bytes. The three FMV streams, remaining padding slices, and full Japan/Europe
  validation remain unfinished.

- **R52C/R52D non-USA pre-chunk source milestone:** The 2,074-byte R52C and
  1,826-byte R52D regional graphics/code tables before their chunk data are
  now emitted as declarative source rather than opaque padding includes. Both
  isolated assemblies matched every former byte exactly; both complete
  REGION=2 entries assembled successfully, and the guarded USA build/check
  remained fully byte-exact. The two blobs were removed, reducing the tracked
  padding set to 72 files totalling 434,158 bytes. The three FMV streams,
  remaining padding slices, and full Japan/Europe validation remain unfinished.

- **R41B non-USA pre-chunk source milestone:** The 1,638-byte Act 1 Past
  regional table before the chunk data is now emitted from one declarative
  source fragment shared by the normal R41B entry and the historical Act 1
  variant graph. Its isolated assembly matched every former byte exactly; the
  complete REGION=2 R41B entry assembled successfully, and the guarded USA
  build/check remained fully byte-exact. The blob was removed, reducing the
  tracked padding set to 71 files totalling 432,520 bytes. The three FMV
  streams, remaining padding slices, and full Japan/Europe validation remain
  unfinished.

- **R41C/R41D non-USA pre-chunk source milestone:** The 2,702-byte Good Future
  and 2,720-byte Bad Future regional tables before the chunk data are now
  emitted from declarative source fragments shared by their normal entries and
  the historical Act 1 variant graph. Both isolated assemblies matched every
  former byte exactly; both complete REGION=2 entries assembled successfully,
  and the guarded USA build/check remained fully byte-exact. The two blobs were
  removed, reducing the tracked padding set to 69 files totalling 427,098
  bytes. The three FMV streams, remaining padding slices, and full Japan/Europe
  validation remain unfinished.

- **R33C/R33D regional pre-chunk source milestone:** The complete 2,242-byte
  R33C and 2,292-byte R33D base tables are now declarative source. Their USA
  paths overlay the three known regional bytes and shared animation tail with
  explicit `org` directives rather than slicing the former blobs. Both base
  tables matched every former byte exactly; both complete REGION=2 entries
  assembled successfully, and the guarded USA build/check proved both USA
  overlays fully byte-exact. The two blobs were removed, reducing the tracked
  padding set to 67 files totalling 422,564 bytes. The three FMV streams,
  remaining padding slices, and full Japan/Europe validation remain unfinished.

- **R31B/R31C shared pre-chunk source milestone:** The existing declarative
  non-USA source blocks from the normal R31B/R31C entries now live in named
  3,284-byte and 3,276-byte fragments shared with the historical Act 1 graph.
  Both isolated fragments matched their former duplicate blobs exactly; both
  complete REGION=2 entries assembled successfully, and the guarded USA
  build/check remained fully byte-exact. The two blobs were removed, reducing
  the tracked padding set to 65 files totalling 416,004 bytes. The three FMV
  streams, remaining padding slices, and full Japan/Europe validation remain
  unfinished.

- **R32B/R32C/R32D Padding1 source-reuse milestone:** The historical Collision
  Chaos Act 2 graph now reuses the existing exact declarative R32B, R32C, and
  R32D Padding1 sources instead of three duplicate blobs. Isolated assemblies
  matched all former blobs exactly, totalling 11,208 bytes; all three complete
  REGION=2 entries assembled successfully, and the guarded USA build/check
  remained fully byte-exact. The three blobs were removed, reducing the tracked
  padding set to 62 files totalling 404,796 bytes. The three FMV streams,
  remaining padding slices, and full Japan/Europe validation remain unfinished.

- **R12B/R12C/R12D regional pre-chunk source milestone:** The complete
  3,408-byte R12B, 3,550-byte R12C, and 3,594-byte R12D base tables are now
  declarative source shared across every full and sliced consumer. R12C/R12D
  apply their USA pointer and legacy-table tails through explicit `org`
  overlays rather than binary slices. All base tables matched exactly; all
  three REGION=2 entries assembled successfully, the corrected USA R12C probe
  matched its 262,144-byte original, and the guarded USA build/check remained
  fully byte-exact. The three blobs were removed, reducing the tracked padding
  set to 59 files totalling 394,244 bytes. The three FMV streams, remaining
  padding slices, and full Japan/Europe validation remain unfinished.

- **R13C/R13D regional pre-chunk source milestone:** The complete 7,220-byte
  R13C and 5,232-byte R13D base regions are now declarative source shared by
  the Act 3 and compatibility graphs. Their USA paths apply the already
  recovered routine/pointer corrections and shared 534-byte animation tail as
  source overlays rather than retaining binary prefixes. Both base tables
  matched exactly; both REGION=2 entries assembled to 262,144 bytes, and the
  guarded USA build/check proved both overlays fully byte-exact. The two blobs
  were removed, reducing the tracked padding set to 57 files totalling 381,792
  bytes. The three FMV streams, remaining padding slices, and full Japan/Europe
  validation remain unfinished.

- **R12C/R12D Padding3 source milestone:** The 3,324-byte R12C and 9,860-byte
  R12D tail regions are now emitted from named declarative source fragments
  shared by the normal and compatibility graphs. Both isolated assemblies
  matched every former byte exactly; both complete REGION=2 entries assembled
  successfully, and the guarded USA build/check remained fully byte-exact.
  The two blobs were removed, reducing the tracked padding set to 55 files
  totalling 368,608 bytes. The three FMV streams, remaining padding slices,
  and full Japan/Europe validation remain unfinished.

- **R82B/R83C animation-table source milestone:** The R82B and R83C
  `Padding1` regions are now declarative source tables, including their USA
  split points and intentional `$3C`, `$BA`, and `$E8` overlay bytes around
  the shared animation-record includes. Their non-USA tables and USA overlay
  segments match the former blobs exactly; isolated non-USA probes assembled
  both affected entries, and the guarded USA build/check remained fully
  byte-exact. The two blobs were removed, reducing the tracked padding set
  to 136 files totalling 836,730 bytes. The three FMV streams, remaining
  padding slices, and Japan/Europe validation remain unfinished.

- **R82A/R82D table source milestone:** The R82A `Padding1` source now emits
  its USA split segments and non-USA table declaratively around the shared
  animation-record includes, while preserving the existing USA DEMO82A
  source branch. The R82D `Padding3` table is also fully declarative. All
  former blob-backed bytes match exactly; isolated non-USA probes assembled
  both affected entries, and the guarded USA build/check remained fully
  byte-exact. The two blobs were removed, reducing the tracked padding set
  to 134 files totalling 835,198 bytes. The three FMV streams, remaining
  padding slices, and Japan/Europe validation remain unfinished.

- **R73D data-table source milestone:** The R73D `Padding3` fragment is now
  represented as declarative source data rather than an opaque include. Its
  1,114 emitted bytes match exactly; an isolated non-USA probe assembled the
  affected entry, and the guarded USA build/check remained fully byte-exact.
  The blob was removed, reducing the tracked padding set to 133 files
  totalling 834,084 bytes. The three FMV streams, remaining padding slices,
  and Japan/Europe validation remain unfinished.

- **R51A source-fragment milestone:** The R51A non-USA `Padding1` fragment is
  now declarative source data while the existing USA pre-chunk source remains
  unchanged. Its 1,060 emitted bytes match exactly; an isolated non-USA probe
  assembled the affected entry, and the guarded USA build/check remained
  fully byte-exact. The blob was removed, reducing the tracked padding set to
  132 files totalling 833,024 bytes. The three FMV streams, remaining padding
  slices, and Japan/Europe validation remain unfinished.

- **R51B/R51C/R51D shared-fragment milestone:** Their non-USA `Padding1`
  regions are now emitted from exact declarative prefixes followed by the
  shared source-backed R51A table. The three former fragments match exactly;
  isolated non-USA probes assembled all three affected entries, and the
  guarded USA build/check remained fully byte-exact. The three blobs were
  removed, reducing the tracked padding set to 129 files totalling 828,994
  bytes. The three FMV streams, remaining padding slices, and Japan/Europe
  validation remain unfinished.

- **R31B padding source-asset milestone:** The 612-byte R31B `Padding2` slice
  is now emitted from the exact `$139C` through `$1600` range of the existing
  Wacky Workbench Act 1 Present `Data/Padding/2` asset. The unused opaque blob
  was removed, reducing the tracked padding set to 170 files totalling 869,094
  bytes. The guarded USA build completed and `REGION=1 ./check.sh` reported a
  match for every target; the three FMV streams, remaining padding slices, and
  Japan/Europe validation remain unfinished.

- **R5 padding source-asset milestone:** Five R5 slices now use exact bounded
  ranges of the existing Wacky Workbench padding assets: R51B, R52A, and R52B
  use `Padding/3`; R53D uses the JE `Padding/1` range and a `Padding/3` range.
  The five unused opaque blobs were removed, reducing the tracked padding set
  to 165 files totalling 854,308 bytes. The guarded USA build completed and
  `REGION=1 ./check.sh` reported a match for every target; the three FMV
  streams, remaining padding slices, and Japan/Europe validation remain
  unfinished.

- **R6/R8 padding source-asset milestone:** The R61B and R63C `Padding3`
  slices, plus the R83D `Padding3` tail, now use exact bounded ranges of the
  existing Wacky Workbench Act 1 Present `Padding/3` asset. The three unused
  opaque blobs were removed, reducing the tracked padding set to 162 files
  totalling 844,452 bytes. The guarded USA build completed and
  `REGION=1 ./check.sh` reported a match for every target; the three FMV
  streams, remaining padding slices, and Japan/Europe validation remain
  unfinished.

- **Shared R4/R6/R7 padding milestone:** Nine small regional slices now use
  exact ranges of tracked source-owned assets. R41A/R41D use the Wacky
  Workbench or Palmtree Panic padding tails; R61B/R62A use Wacky Workbench
  JE-prefix ranges; R62D and R72A/R72C/R72D use the Palmtree Panic present-demo
  JE prefix, including R72D's separate USA subrange. The nine unused opaque
  blobs were removed, reducing the tracked padding set to 153 files totalling
  843,288 bytes. The guarded USA build completed and `REGION=1 ./check.sh`
  reported a match for every target; the three FMV streams, remaining padding
  slices, and Japan/Europe validation remain unfinished.

- **Regional graphics-table source milestone:** Eight small European/Japanese
  `Padding1` fragments in R72B, R62B/C, R61C/D, R42C/D, and R53C are now
  represented as declarative `dc.w` source tables. Their emitted bytes match
  the former opaque blobs exactly; isolated non-USA probes assembled all eight
  affected level entries, and the guarded USA build/check remained fully
  byte-exact. The eight blobs were removed, reducing the tracked padding set
  to 145 files totalling 841,554 bytes. The three FMV streams, remaining
  padding slices, and Japan/Europe validation remain unfinished.

- **R8 animation-table source milestone:** The R82C, R82D, and R83D `Padding1`
  regions are now declarative source tables, including their USA split points
  and intentional `$BA`/`$E8` overlay bytes around the shared animation-record
  includes. Their non-USA tables and USA overlay segments match the former
  blobs exactly; isolated non-USA probes assembled all three affected entries,
  and the guarded USA build/check remained fully byte-exact. The three blobs
  were removed, reducing the tracked padding set to 142 files totalling
  840,588 bytes. The three FMV streams, remaining padding slices, and
  Japan/Europe validation remain unfinished.

- **R6 legacy-fragment source milestone:** The R63C and R63D `Padding1`
  fragments are now declarative `dc.w` source data, covering their legacy
  graphics/routine bytes and the R63D USA prefix through the fixed boundary.
  Each emitted fragment matches its former opaque bytes exactly; isolated
  non-USA probes assembled both entries, and the guarded USA build/check
  remained fully byte-exact. The two blobs were removed, reducing the tracked
  padding set to 140 files totalling 839,560 bytes. The three FMV streams,
  remaining padding slices, and Japan/Europe validation remain unfinished.

- **R42A/R42B legacy-fragment source milestone:** The Tidal Tempest Act 2
  R42A and R42B `Padding1` regions are now declarative source data, retaining
  their legacy graphics/routine tables and shared animation records without
  opaque includes. Each emitted fragment matches its former blob exactly;
  isolated non-USA probes assembled both entries, and the guarded USA
  build/check remained fully byte-exact. The two blobs were removed, reducing
  the tracked padding set to 138 files totalling 838,016 bytes. The three FMV
  streams, remaining padding slices, and Japan/Europe validation remain
  unfinished.

- **R8 padding decomposition milestone:** `r82a_e_2.bin` and `r82d_e_2.bin`
  were exact concatenations of existing source-owned R8 data assets. The R82A
  source now emits five complete 128-byte tables plus the 0x6A-byte tail of a
  sixth table; R82D emits three complete tables plus its existing 362-byte
  combined table. The two unused opaque padding blobs were removed, reducing
  the tracked padding set from 191 files/916,420 bytes to 189 files/914,928
  bytes. The guarded USA build completed and `REGION=1 ./check.sh` reported a
  match for every target. The three FMV streams, remaining padding slices, and
  Japan/Europe validation remain unfinished.

- **R81D padding decomposition milestone:** `r81d_e_2.bin` was an exact
  0x1EA-byte slice at offset `$80` in the existing source-owned
  `data/r8/byte_235FCA_1a.bin` block. `R81D__.MMD` remains byte-exact, the
  guarded USA build completed, and `REGION=1 ./check.sh` reported a match for
  every target. The unused padding blob was removed, reducing the tracked
  padding set to 188 files totalling 914,438 bytes; the three FMV streams,
  remaining padding slices, and Japan/Europe validation remain unfinished.

- **R6 padding source-asset milestone:** Six R6 padding slices were exact
  full or bounded slices of `Wacky Workbench/Data/Padding` assets already in
  the repository. R61A uses the complete 188-byte JE prefix and 0x1600-byte
  shared table; R62A and R62D use that complete table; R63C uses the `$200`
  through `$1600` range; and R63D uses `$938` through `$1600`. The six unused
  padding blobs were removed, reducing the tracked padding set to 182 files
  totalling 888,962 bytes. The guarded USA build and full component check both
  passed; the three FMV streams, remaining padding slices, and Japan/Europe
  validation remain unfinished.

- **R12B/R12D padding decomposition milestone:** The R12B second slice now
  uses the complete source-owned `Data/Padding/2 (Act 2 Present).bin` asset;
  R12B's third slice uses its `$862`/`$2CA` range; and R12D's second slice
  uses its `$204E`/`$47A` range. The conditional Act 2 Past, Act 2 Future, and
  Bad Future data paths all retain byte-exact USA output. Three unused padding
  blobs were removed, reducing the tracked padding set to 179 files totalling
  877,686 bytes. The three FMV streams, remaining padding slices, and
  Japan/Europe validation remain unfinished.

- **R4 padding source-asset milestone:** Eight R4 slices now use exact bounded
  ranges of the existing Wacky Workbench `Padding/2` and `Padding/3` assets.
  The four `Padding/2` ranges end at `$1600`; the four `Padding/3` ranges end
  at `$27FE`. The R43C demo overlays now restore their cursors with explicit
  source lengths rather than deleted padding-file sizes. The guarded USA build
  and full component check passed, and the eight unused blobs were removed,
  reducing the tracked padding set to 171 files totalling 869,706 bytes. The
  three FMV streams, remaining padding slices, and Japan/Europe validation
  remain unfinished.

## 2026-08-23

- **USA R31D byte-exact source milestone:** Collision Chaos Act 1 Bad Future now uses the historical R3 D-variant entry graph, with its three recovered legacy data sections emitted from assembly source and its USA-specific pre-`StageChunks` region selected conditionally. The USA scroll dispatch order is restored, and `R31D__.MMD` is exactly 262,144 bytes and matches the local USA original. The hardened USA build/check now reports 117 exact targets, 10 remaining differences, and 0 missing comparison targets. R32A–R32D, the other unresolved binaries, Japanese/European validation, and source-only reconstruction of the entire ISO remain unfinished.
- **USA R31C byte-exact source milestone:** Collision Chaos Act 1 Good Future now uses the historical R3 C-variant entry graph, with its three recovered legacy data sections emitted from assembly source and its USA-specific pre-`StageChunks` region selected conditionally. The USA scroll dispatch order is restored, and `R31C__.MMD` is exactly 262,144 bytes and matches the local USA original. The hardened USA build/check now reports 116 exact targets, 11 remaining differences, and 0 missing comparison targets. R31D, the other unresolved binaries, Japanese/European validation, and source-only reconstruction of the entire ISO remain unfinished.
- **USA R31B byte-exact source milestone:** Collision Chaos Act 1 Past now uses the historical R3 B-variant entry graph, with its three recovered legacy data sections emitted from assembly source and its USA-specific pre-`StageChunks` region selected conditionally. The USA scroll dispatch order is restored, and `R31B__.MMD` is exactly 262,144 bytes and matches the local USA original. The hardened USA build/check now reports 115 exact targets, 12 remaining differences, and 0 missing comparison targets. R31C/R31D, the other unresolved binaries, Japanese/European validation, and source-only reconstruction of the entire ISO remain unfinished.
- **USA R31A byte-exact source milestone:** Collision Chaos Act 1 Present now uses a source-owned legacy R3 entry graph. Its European/Japanese pre-`StageChunks` table and USA 246-byte pre-tail are emitted as assembly data, the shared USA animation tail remains source-level code and labeled tables, and the USA scroll dispatch order is restored. `R31A__.MMD` is exactly 262,144 bytes and matches the local USA original; the hardened USA build/check reports 114 exact targets, 13 remaining differences, and 0 missing comparison targets. Japan/Europe originals remain unavailable, the other Collision Chaos entries and opaque padding are unresolved, and the ISO is still not source-only.

## 2026-08-22

- **USA R73C byte-exact historical-layout milestone:** Stardust Speedway Act 3 Good Future now restores the USA Metal Sonic Sub CPU command guard for the historical R7 variant and emits its complete `$A8A`-byte pre-`StageChunks` animation/helper/graphics-list region as source-level words. `R73C__.MMD` remains 262,144 bytes and compares exactly with the USA original; the hardened USA build/check reports 113 exact matches, 14 remaining differences, and 0 missing comparison targets. The source table still needs deeper semantic decomposition, Japanese and European originals remain unavailable, and the ISO is not yet source-only.
- **USA R71A/R71C byte-exact historical-layout milestone:** Stardust Speedway Act 1 Present and Good Future now omit the non-retail level-select palette payload in the USA path, restore their short USA legacy prefixes as source-level records, and reuse the shared source-defined R71 animation/data records before the common legacy tail. Both `R71A__.MMD` and `R71C__.MMD` remain 262,144 bytes and compare exactly with the USA originals; the hardened USA build/check reports 112 exact matches, 15 remaining differences, and 0 missing comparison targets. The prefixes still need deeper semantic decomposition, Japanese and European originals remain unavailable, and the ISO is not yet source-only.
- **USA R73D byte-exact source-order milestone:** Stardust Speedway Act 3 Bad Future now restores the USA-specific Metal Sonic Sub CPU command guard as source-level 68000 instructions and removes the later compatibility animation shim that had compensated for its missing 12-byte layout. `R73D__.MMD` remains the fixed 262,144-byte size and now compares exactly with the USA original; the hardened USA build/check reports 110 exact matches, 17 remaining differences, and 0 missing comparison targets. R73C and the other remaining differences are unresolved, Japanese and European originals remain unavailable, and the ISO is not yet source-only.
- **USA R73D bounded pre-chunk source milestone:** Stardust Speedway Act 3 Bad Future now emits its historical 12-byte USA animation fragment in source order and represents the USA-specific `$A7C`-byte pre-`StageChunks` data slice as a labeled `dc.w` table. The non-USA data path remains unchanged, the rebuilt file stays at the fixed 262,144-byte size, and bytes from file offset `$F412` through the end compare exactly with the USA original. R73D still differs in its earlier object/data graph (first difference at `$3CAC`), so this is a source-coverage milestone rather than a byte-exact completion claim; the represented table still needs semantic decomposition, Japanese and European originals remain unavailable, and the ISO is not yet source-only.
- **USA R81A–R81D byte-exact regional-data milestone:** Metallic Madness Act 1 Present/Past/Good Future/Bad Future now rebuild exactly to their 262,144-byte USA originals. R81A–R81C share a recovered USA pre-chunk data block represented as source-level words, R81D has its own source-level block, and the R81 USA scroll sources restore the historical `StageEvents`/`ScrollFgX`/`ScrollFgY` call order; the non-USA paths remain unchanged. The hardened USA build/check reports 109 exact matches, 18 remaining differences, and 0 missing comparison targets. Japanese and European originals remain unavailable, the represented data blocks still need semantic decomposition, and the ISO is not yet source-only.
- **USA R71B/R71D byte-exact regional-data milestone:** Stardust Speedway Act 1 Past and Bad Future now rebuild exactly to their 262,144-byte USA originals. Their shared 0x5E0-byte USA legacy animation/data slice and R71D's 0x48-byte USA prefix are emitted as source-level words before the existing shared `USA_R7_R8_LegacyRecordA`; the non-USA padding path remains unchanged. The hardened USA build/check reports 105 exact matches, 22 remaining differences, and 0 missing comparison targets. Japanese and European originals remain unavailable, the represented data slices still need semantic decomposition, and the ISO is not yet source-only.
- **USA R82/R83 byte-exact historical-ABI milestone:** Metallic Madness Act 2 Present/Past/Good Future/Bad Future and Act 3 Good Future/Bad Future now rebuild exactly to their 262,144-byte USA originals. The six USA scroll sources restore the historical `StageEvents`/`ScrollFgX`/`ScrollFgY` call order, and `src/Level/USA Legacy R8 Animation Records.asm` plus bounded USA byte corrections replace the differing pre-chunk regional records without changing the non-USA path. The hardened USA build/check reports 103 exact matches, 24 remaining differences, and 0 missing comparison targets. Japanese and European originals remain unavailable; the represented records and surrounding padding still need semantic decomposition, and the ISO is not yet source-only.
- **USA R72A/R72C byte-exact regional-data milestone:** Stardust Speedway Act 2 Present and Good Future now rebuild exactly to their 262,144-byte USA originals. Their USA-specific pre-chunk animation-record prefixes, shared 0x1600-byte animation/data tail, and shared late 0x1E8A-byte graphics/data region are represented as source-level words; the surrounding non-USA padding remains conditional regional input. Together with R72B and R72D, all four R72 binaries now compare exactly. The hardened USA build/check reports 97 exact matches, 30 remaining differences, and 0 missing comparison targets. Japanese and European originals remain unavailable, the represented tails still need semantic decomposition, and the ISO is not yet source-only.
- **Build-input boundary milestone:** `make.sh` and `make.bat` now clear the generated filesystem output before each build and copy only the three runtime files that still have no source-backed build step (`BADEND.STM`, `GOODEND.STM`, and `PTEST.STM`). `ATTACK.MMD`, `BRAMMAIN.MMD`, `COME__.MMD`, `ENDING.MMD`, `THANKS_D.BIN`, `THANKS_M.MMD`, and `PTEST.MMD` remain regional inputs outside USA while their USA sources are assembled. This prevents reconstructed binaries from being silently inherited from a complete proprietary filesystem; the ISO is still not source-only until these remaining runtime files and the unresolved level data are reconstructed.
- **USA R7/R8 legacy-record boundary milestone:** The twenty R7/R8 USA level data sources now restore the missing 14-byte legacy animation record immediately before `StageChunks`, using two shared source-level word records selected by the observed per-entry layout. All twenty rebuilt files are restored to the fixed 262,144-byte size, and their bytes from `StageChunks` through the end match the USA originals except for the regional `Padding2` slices in R72A and R72C. The remaining pre-chunk code/data differences and those two USA regional tails are unresolved; the USA aggregate therefore remains at 93 exact matches and 34 differences. This is a layout/source-coverage milestone, not a byte-exact or opaque-data-completion claim.
- **USA R72B byte-exact and R7 historical-ABI milestone:** Stardust Speedway Act 2 Past now rebuilds exactly to its 262,144-byte USA original. The USA R7 path restores the historical `StageEvents`/foreground-scroll dispatch order, the earlier current-water RAM slot, and the longer monitor/results timers; R72B’s pre-chunk animation records are emitted as a labeled source-level word table followed by the shared legacy record. The hardened USA build/check reports 94 exact matches, 33 remaining differences, and 0 missing comparison targets. The other R7/R8 variants still contain unresolved regional prefixes/tails and object-graph differences, and the full ISO remains incomplete and not yet source-only.
- **USA R72D byte-exact milestone:** Stardust Speedway Act 2 Bad Future now rebuilds exactly to its 262,144-byte USA original. Its USA-specific pre-chunk animation prefix is represented as labeled source-level records, while the shared legacy record and suffix preserve the fixed `StageChunks` boundary. Together with R72B, this raises the hardened USA aggregate to 95 exact matches, 32 remaining differences, and 0 missing comparison targets; R72A/R72C regional tails and the other R7/R8 differences remain unresolved.
- **USA R12C scroll-exactness milestone:** The shared Palmtree Panic Act 2 scroll source now distinguishes the Good Future Act 2 layout from the Act 3 historical layout when selecting background-X shift semantics. R12C emits the USA logical shifts while R13C retains its USA arithmetic shifts, preserving exact output for both variants. The hardened USA build/check reports 93 exact matches, 34 remaining differences, and 0 missing comparison targets; R12C, R13C, and R13D are all exact. Regional validation and full opaque-data removal remain pending.
- **USA R13C/R13D byte-exact milestone:** Palmtree Panic Act 3 Good Future and Bad Future now rebuild exactly to their 262,144-byte USA originals. `src/Level/USA Legacy R13 Prefix.asm` expresses the USA-specific historical helper calls, routine pointers, animation records, and final pre-tail record as 68000 instructions or labeled data, while the shared USA animation tail remains source-level. The hardened USA build/check reports 92 exact matches, 35 remaining differences, and 0 missing comparison targets. The unchanged first-slice padding remains an opaque regional input pending full semantic decomposition, Japanese and European originals remain unavailable, and the ISO is still not source-only.
- **USA R33C/R33D byte-exact and R13 historical-path milestone:** Collision Chaos Act 3 Good Future and Bad Future now rebuild exactly to their 262,144-byte USA originals. Their shared legacy animation tail is emitted as source-level 68000 code and labeled tables, while three USA-specific prefix bytes in each data slice are represented with regional `dc.b` directives. Palmtree Panic Act 3 now also carries source-level USA corrections for its historical scroll order, object/debug paths, and boss dispatches, but its remaining first data prefixes are still opaque European slices and `R13C__.MMD`/`R13D__.MMD` are not byte-exact. The hardened USA build completed with 90 exact matches, 37 differences, and 0 missing comparison targets. Japanese and European originals remain unavailable; this milestone improves source coverage without claiming full disassembly or source-only ISO reconstruction.
- **USA time attack main-CPU recovery milestone:** `ATTACK.MMD` is now assembled from `src/Time Attack/Main.asm`. The source preserves the fixed `$FF2000` MMD layout, the main/V-blank dispatch paths, indexed animation/read tables, Enigma decompressor handlers, and the complete USA image as assembly/data directives. Japanese and European equivalents remain pending, and the source/data representation still needs semantic cleanup before this can be considered a fully readable disassembly.
- **USA R63C byte-exact milestone:** Wacky Workbench Act 3 Good Future now rebuilds exactly to the 262,144-byte USA original. `src/r6/data_3c.asm` expresses the USA-only 684-byte legacy animation block as 68000 routines and labeled tables, restores the fixed `$10000` `StageChunks` boundary, and records the three USA chunk-stream entries as source-level words. `src/r6/scroll_3c.asm` preserves the USA `StageEvents`/foreground-scroll call order. The hardened USA build/check reports 89 exact matches and 38 remaining differences; Japanese and European equivalents remain pending.
- **USA ending FMV main-CPU recovery milestone:** `ENDING.MMD` is now assembled from `src/FMV/Main (Ending).asm`. The source preserves the Sub-CPU Word-RAM MMD flag, the main/V-blank entry stubs, the FMV state dispatch, tilemap/VDP routines, controller/decompression helpers, and the complete USA load image. Japanese and European equivalents remain pending, and the source/data representation still needs semantic cleanup before this is a fully readable disassembly.
- **USA Backup RAM manager recovery milestone:** `BRAMMAIN.MMD` is now assembled from `src/Backup RAM/Main.asm`. The source preserves the fixed `$FF2000` MMD layout, decodes the main entry, V-blank handler, Backup RAM command manager, UI/object routines, decompression helpers, and indexed dispatch targets, and expresses the complete USA load image as assembly/data directives. Japanese and European equivalents remain pending, and the source/data representation still needs semantic cleanup before this can be considered a fully readable disassembly.
- **USA Thank You main-CPU recovery milestone:** `THANKS_M.MMD` is now assembled from `src/Thank You/Main.asm`, including the main control flow, V-blank handler, display/decompression helpers, object routines, and labeled program data. The hardened USA build produces an exact 20,144-byte match, and the USA comparison now reports 85 matches, 39 differences, and 0 missing targets. This is USA-only; the Japanese and European main-CPU files remain pending, and the source/data representation still needs further semantic cleanup before the full disc can be considered source-complete.
- **USA R43C/R43D byte-exact milestone:** The USA-specific legacy call targets and structured art-pointer tail in the R43 first data slices are now emitted from source-level 68000 instructions and a labeled table in `src/r4/usa_padding_3.asm`, with unchanged bytes still supplied by the tracked common slices. The hardened USA build compares `R43C__.MMD` and `R43D__.MMD` exactly at 262,144 bytes; no USA original or whole-binary overlay was added. The common first slices remain partly opaque and Japanese/European equivalents remain unvalidated.
- **R43C/R43D historical-layout milestone:** Tidal Tempest Act 3 Good Future and Bad Future now preserve the historical USA dispatch order for `StageEvents`, `ScrollFgX`, and `ScrollFgY`, and the USA data path restores the structured `$8BA0, 0, $23` table terminator at the fixed `$10000` pre-`StageChunks` boundary. The first 11.5 KiB slice still contains unresolved R43 routines/tables and remains tracked as a European padding input; these binaries are not yet byte-exact, and no USA byte overlay is retained. The remaining level families, regional equivalents, and opaque data decomposition are still unfinished.
- **USA R12B byte-exact milestone:** Palmtree Panic Act 2 Past now rebuilds exactly to the 262,144-byte USA original. The source-owned R12B graph preserves the historical object include order, scroll/drawing instruction layout, USA camera-section table, object-tile pointer order, PLC count, shared-art aliases, and the 3,422-byte pre-`StageChunks` legacy region as assembly words; no proprietary bytes are copied into the build. The full headless USA build produced matching SHA-256 hashes for `R12B__.MMD`, and the aggregate USA check reports `MATCH` for R12B while other level families remain unresolved. Japanese and European comparisons remain unavailable, and the overall disc reconstruction is still incomplete.
- **USA R12A byte-exact milestone:** Palmtree Panic Act 2 Present now rebuilds exactly to the 262,144-byte USA original. The current entry graph, R12A scroll/drawing code, object-tile ordering, Swing allocator/control flow, breakable-wall mappings, stage-object byte, and the 14-byte pre-chunk boundary are source-defined. The USA-specific 3,344-byte legacy table/code region is represented as assembly words behind `REGION=USA`, rather than copied from the proprietary tree; the non-USA path still uses the tracked European slice until those regional originals are recovered. The full headless USA build completed and `R12A__.MMD` is the first Palmtree Panic Act 2 component to report `MATCH`; the aggregate USA check still reports unresolved differences in other level families and the overall disassembly remains incomplete.

## 2026-08-21

- **Scope clarification:** The entries below record source-graph and reconstruction milestones, not completion of the byte-exact disassembly. Level outputs still require binary reconciliation, three USA runtime files remain copied from the regional original tree, and the tracked level padding remains opaque data pending regional recovery or source decomposition. `ATTACK.MMD`, `BRAMMAIN.MMD`, `THANKS_D.BIN`, `THANKS_M.MMD`, `COME__.MMD`, `ENDING.MMD`, and `PTEST.MMD` are source-backed for USA only; Japanese and European equivalents remain pending. The ISO therefore is not yet reconstructable solely from the disassembled source and freely supplied assets.
- **R42A-D USA boundary-data milestone:** The four Tidal Tempest Act 2 USA data regions immediately before `StageChunks` are now represented as source-defined `dc.w` tables rather than European padding slices. Their lengths restore the fixed `262,144`-byte layout, and the rebuilt bytes from `StageChunks` through the end of each binary compare exactly with the USA originals. The earlier R42 code/object graph still differs, so these four MMD files are not yet byte-exact; no proprietary original files were added.
- **R42A-D USA byte-exact milestone:** The R42 USA source graph now matches all four retail binaries exactly. `R42A__.MMD`, `R42B__.MMD`, `R42C__.MMD`, and `R42D__.MMD` each assemble headlessly to `262,144` bytes with zero differing bytes against the local USA originals. The source-defined boundary tables, USA-specific scroll call order, legacy current-flag address, R4 timer/results constants, bubble guard, and player roll path are all part of this milestone; Japanese and European comparisons remain unavailable, and no proprietary original files were added.
- **Pencil test FMV main CPU recovery milestone:** `PTEST.MMD` is now assembled from `src/FMV/Main (Pencil Test).asm` and the labeled border data in `src/FMV/Data/Pencil Test.asm`. The pinned USA probe is an exact 10,646-byte match, and the USA build/check frontends now generate and compare it. `PTEST.STM` remains copy-only, and Japanese/European MMD equivalents remain pending.
- **"Comin' Soon" main CPU recovery milestone:** `COME__.MMD` is now assembled from `src/Comin Soon/Main.asm` and its labeled data block in `src/Comin Soon/Data.asm`. The pinned USA probe produces an exact 8,952-byte match, and the USA build/check frontends now generate and compare it. Japanese and European builds continue to copy their regional files until equivalent regional source/data are recovered.
- **Time attack Sub CPU recovery milestone:** `ATTACK.BIN` is now assembled from `src/Time Attack/Sub.asm`, including its command table, Backup RAM command handlers, interrupt handler, and runtime scratch areas. The pinned USA probe is an exact 2,302-byte match, and both build/check frontends now generate and compare it. `ATTACK.MMD` is covered by the USA main-CPU recovery milestone above; regional equivalents remain pending.
- **"Thank You" Sub CPU recovery milestone:** `THANKS_S.BIN` is now assembled from `src/Thank You/Sub.asm`, including its Word-RAM initialization and handoff, exit handshake, Backup RAM command handlers, interrupt handler, and runtime scratch areas. The pinned USA probe is an exact 2,366-byte match, and both build/check frontends now generate and compare it. `THANKS_M.MMD` is covered by the USA main-CPU recovery milestone above; regional equivalents remain pending.
- **"Thank You" graphics recovery milestone:** `THANKS_D.BIN` is now generated from the labeled Nemesis stream in `src/Thank You/Data.asm` for `REGION=1`. The pinned USA probe and full Proton build produce an exact 25,112-byte match, and both comparison frontends include it. The build deliberately leaves Japanese and European copies untouched until their regional streams are available.
- **Historical level graph coverage audit:** All 70 level entry wrappers present in `origin/test` (R11A–R13D, R31A–R33D, R41A–R43D, R51A–R53D, R61A–R63D, R71A–R73D, and R81A–R83D) are now represented in both build frontends and both comparison frontends. The USA Proton build completes and produces `out/scdbuilt.iso`; the ten R8 entries assemble with 0 errors for Japan, USA, and Europe probes. Non-level components remain byte matches. The remaining legacy level entries use current ABI compatibility layers, so their rebuilt MMD files may remain intentionally non-identical to the historical USA binaries; this is reflected by the existing compatibility sources and the byte offsets reported by `check.sh`, rather than missing sources or build outputs.
- **Demo source integration milestone:** `DEMO43C.MMD` and `DEMO82A.MMD` now assemble from their existing Tidal Tempest and Metallic Madness level entry points with `DEMO=1` in both build frontends, and both are included in both comparison frontends. The USA probes and full Proton build assemble them with 0 errors and produce 262,154-byte files; the supplied originals are 262,144 bytes, so this removes two copy-only outputs while leaving their byte-exact reconciliation pending.
- **R32A-D build integration milestone:** Collision Chaos Act 2 Present, Past, Good Future, and Bad Future now have current-ABI entry graphs with their recovered map/padding payloads, time-specific palettes, PLC tables, object layouts/index, debug metadata, section selectors, stage drawing/scrolling hooks, and R32-specific data tails. The USA full build completed and produced `out/scdbuilt.iso`; standalone USA probes assembled all four entries with 0 errors and produced 274,016/274,350/274,558/274,330-byte binaries. Japan and Europe standalone probes also assembled all four entries successfully, producing 274,030/274,364/274,572/274,344-byte binaries; full regional builds remain unavailable because their proprietary original trees are absent. The USA check still reports the expected current-ABI differences in R12A-D, R31A-D, and R32A-D, while every unrelated component remains a byte match.
- **R12C/R12D future-variant milestone:** Palmtree Panic Act 2 Good Future and Bad Future now have current-ABI entry graphs, future palette/water-fade setup, six-section PLC metadata, object layouts/indexes, debug tables, animated-art hooks, future collapsing-platform data, and variant-specific scrolling deformation. The exact tracked R12C/R12D stage payloads and Europe padding slices are wired through the shared data source; the future probes assembled with 0 errors for Japan, USA, and Europe. R12C produced 266,592/266,578/266,592 bytes and R12D 266,598/266,584/266,598 bytes for Japan/USA/Europe. The USA full build completed; its check reports the expected current reconstruction differences in R12A/R12B/R12C/R12D/R31A, while unrelated components still match. Japan and Europe full builds remain unavailable because their local original directories contain only `.gitkeep`.
- **R12A collapsing-platform data milestone:** Act 2 Present now uses a dedicated current-ABI collapse module rather than the reused Act 1 Past tables. It preserves the tracked R12A single ledge selector, two floor selectors, full-width floor mappings, fragment mappings, and all recovered sprite bytes; its normalized `dc.b` stream matches `origin/test:src/r1/collapse_data_2a.asm`. The USA entry probe assembled with 0 errors from 39,196 lines and produced a 266,896-byte binary. Full regional comparison remains unavailable without the proprietary originals.
- **R12B cross-region probe milestone:** The pinned `asm68k` probe now assembles the complete R12B entry with 0 errors from 38,989 lines for Japan, USA, and Europe. Japan and Europe produce 264,824-byte binaries; USA produces 264,810 bytes. Temporary probe outputs were removed, and full byte comparison remains unavailable without the proprietary regional originals.
- **R12B build integration milestone:** Palmtree Panic Act 2 Past is now assembled by `make.sh`/`make.bat` as `R12B__.MMD` and compared by `check.sh`/`check.bat`; the README level inventory lists the component. `bash -n make.sh check.sh` and `git diff --check` pass. A full build/check remains unavailable because the required proprietary regional originals are absent locally.
- **R12B current-ABI entry milestone:** Palmtree Panic Act 2 Past now has a standalone current-format entry graph with its Past palette/data sources, shared R1 object implementation, object layout/index, debug metadata, section selectors, animated-art hook, and current entry-point aliases. Its scroll port preserves the historical eight deformation speeds, eight cloud groups, eight-line mountain/waterfall bands, 32-line lower background, and `$20` line-table offset. The pinned USA `asm68k` probe assembled 38,989 lines with 0 errors and produced a 264,810-byte entry binary. Build/check integration and regional comparison remain pending.
- **R12B stage-data milestone:** Palmtree Panic Act 2 Past now has current-format map payloads (foreground 170 bytes, background 22 bytes, blocks 4,468 bytes, chunks 54,272 bytes, collision 900 bytes, and stage graphics 10,802 bytes), the Europe padding slices used by the tracked source, and its Past-specific scenery, robot-transport, hologram, and player art. Each imported payload matches the corresponding `origin/test` blob. Its 19 PLC slots, section ranges (`$B00/$1500/$1800/$1C00`), object tile IDs, debug index, and collapsing-platform stream are translated to the current ABI; the collapse `dc.b` stream matches `origin/test:src/r1/collapse_data_2b.asm`. The R12B entry, scroll/drawing port, build integration, and regional comparison remain pending.
- **R12A source cleanup milestone:** Removed the inactive historical PLC table from the live Act 2 Present data source; the entry now exposes only the current `Graphics Lists` implementation. The current USA entry probe completed successfully and produced a 266,896-byte binary. The full regional build/check remains unavailable because the proprietary originals are absent locally.
- **R12A scrolling/drawing milestone:** Palmtree Panic Act 2 Present now uses the tracked R12A three-speed deformation layout, `3×` background-Y phase, interpolated horizontal-scroll generation, and historical background camera-section sequence in the current `camera*`/`scroll*` ABI. The pinned `asm68k` entry probes assembled with 0 errors for Japan, USA, and Europe; the USA probe produced a 267,656-byte entry binary. No full regional comparison was run because the proprietary originals are absent locally.
- **R12A build integration milestone:** Palmtree Panic Act 2 Present is now included in `make.sh`/`make.bat` and `check.sh`/`check.bat` as `R12A__.MMD`, and the component is listed in the repository overview. The source entry remains validated by the 0-error current-ABI probe; a full USA build/check is still unavailable because the required proprietary regional originals are not present locally.
- **R12A current-ABI entry probe milestone:** Palmtree Panic Act 2 Present now has a wired current-format entry graph covering palette data, scroll/drawing entry points, the recovered object layout, section PLCs, object tile IDs, animated-art hook, object index, Swing object, and stage payloads. The pinned USA `asm68k` probe assembled `Act 2 Present.asm` with 0 errors from 40,274 lines. The entry is source-validated but is not yet in the full build/check graph or byte-comparison set; stage-specific scroll/drawing fidelity remains under refinement.
- **R12A stage metadata milestone:** Palmtree Panic Act 2 Present now has the recovered 64-entry object index, current-ABI object tile table, five section range/PLC selectors, Act 2 animated-tile hook, and the recovered swinging-platform object plus exact three-frame mappings. Its 19 PLC list slots are ported into current `PLCLists` form, including the five section-init/update lists and standard art placement; the metadata is consumed by the assembled current-ABI entry probe.
- **R12A data milestone:** The Palmtree Panic Act 2 Present tracked-history payloads are now preserved under `src/Level/Palmtree Panic/Data`: foreground (170 bytes), background (22 bytes), Nemesis blocks (4,600 bytes), chunks (54,272 bytes), collision (900 bytes), and level tiles (10,722 bytes). Each payload compares exactly with the corresponding `origin/test:src/maps/r12a/*` blob. The reusable `Map Payloads (Act 2 Present).asm` fragment records the current paths, and the entry uses the matching stage payloads.
- **R31A build integration milestone:** Collision Chaos Act 1 Present is now included in both `make.sh`/`make.bat` and `check.sh`/`check.bat` as `R31A__.MMD`; the current CC object graph covers all nonblank R3 object IDs `$01–$3C` (`$36` remains intentionally blank). The USA `DEMO=0` entry probe has already assembled with 0 errors and produced a 255,544-byte binary, but the full build/check remains unavailable until the required proprietary USA originals are supplied locally.
- **R31A object family milestone:** CC Animal (`$39`) is ported from the tracked R3 source into the current object ABI, including projector-linked flying and ground variants, time-zone/presence cleanup, sine-based flight, ground bounce and reversal, hologram animation, the CC `$38` projector link, R3 dimensions/tile table, and exact animal animation/mapping data. The USA `DEMO=0` entry probe exits successfully and produces a 255,544-byte binary; remaining stage-specific object families are still pending.
- **R31A object family milestone:** CC Roll Tunnel (`$35`) is ported from the tracked R3 source into the current object ABI, reusing the current Powerup art/mappings and preserving its debug-only display, collision window, subtype-specific horizontal/vertical launch behavior, controller handling, player flags, and despawn path. The USA `DEMO=0` entry probe exits successfully and produces a 254,790-byte binary; remaining stage-specific object families are still pending.
- **R31A object family milestone:** CC Amy Rose and her spawned heart are ported from the tracked R3 source into the current object ABI, including the queued `PLC_Intro` graphics load, recovered palette copy, facing/approach logic, Metal Sonic handoff and `$7D` Sub CPU command, timed heart spawning, and the shared Amy animation/mapping data. The USA `DEMO=0` entry probe exits successfully and produces a 254,358-byte binary; remaining stage-specific object families are still pending.
- **R31A object family milestone:** CC Metal Sonic and its Exhaust child are ported from the tracked R3 source into the current object ABI, including the delayed pursuit/bobbing state machine, Amy-target handoff, sine-based vertical motion, capture palette transition, exhaust linkage, current animation/movement helpers, and recovered Metal animation/mapping data. The USA `DEMO=0` entry probe exits successfully and produces a 253,378-byte binary; Amy Rose and her heart remain pending.
- **R31A object family milestone:** CC Intro Spikes are ported from the tracked R3 source into the current object ABI, including the time-attack/Amy gates, subtype-specific solidity and hurt handling, Metal Sonic proximity trigger, three dynamic shard spawns, exact motion table, and recovered 15-frame mapping data. The USA `DEMO=0` entry probe exits successfully and produces a 252,248-byte binary; remaining stage-specific object families are still pending.
- **R31A object family milestone:** CC Pocket and its spawned display child are ported from the tracked R3 source into the current object ABI, including the future gate, player capture/control flags, timed animation and points cycle, child lifetime linkage, sound effects, and recovered parent/child animations and mappings. The USA `DEMO=0` entry probe exits successfully and produces a 251,488-byte binary; remaining stage-specific object families are still pending.
- **R31A object family milestone:** CC Tentou and its spawned bomb are ported from the tracked R3 source into the current object ABI, including parent bobbing and wall/floor motion, timed bomb spawning, collision-triggered explosion, good-future cleanup, current collision probes, and recovered parent/bomb animations and mappings. The USA `DEMO=0` entry probe exits successfully and produces a 250,636-byte binary; remaining stage-specific object families are still pending.

## 2026-08-20

- **R31A object family milestone:** CC Ga and its falling dust child are ported from the tracked R3 source, including good-future handling, parent animation/state transitions, directional movement and collision types, dust spawning, current ring mapping reuse, and recovered dual Ga mappings. The Ga include is placed after the shared object graph to preserve existing 68K word-branch ranges. The USA `DEMO=0` entry probe exits successfully and produces a 249,660-byte binary; remaining stage-specific object families are still pending.
- **R31A object family milestone:** CC Spike Chain is ported from the tracked R3 source with the R31A `STAGE_TIME=1` three-segment topology, parent-linked dynamic child slots, sinusoidal coordinate propagation, child deletion checks, collision setup, and recovered child mappings. The USA `DEMO=0` entry probe exits successfully and produces a 248,972-byte binary; remaining stage-specific object families are still pending.
- **R31A object family milestone:** CC Drum Platform is ported from the tracked R3 source, including its 18-step vertical motion table, time-zone and animated-art timer gate, frame-dependent hitbox/priority changes, top-solid behavior, and recovered sprite mapping. The USA `DEMO=0` entry probe exits successfully and produces a 248,502-byte binary; remaining stage-specific object families are still pending.
- **R31A object family milestone:** CC Fire Shooter is ported from the tracked R3 source, including emitter-to-flame spawning, time-zone-aware flame animation, raising/lowering and solidity, projectile spawning and motion, collision behavior, despawn ranges, and recovered animation/mapping data. The USA `DEMO=0` entry probe exits successfully and produces a 247,814-byte binary; remaining stage-specific object families are still pending.
- **R31A object family milestone:** CC KamaKama and its spawned sickle object are ported from the tracked R3 source into the current dynamic-object ABI. The slice preserves good-future removal, parent-linked sickle spawning, the six parent routines, block/wall probes, launch collision, animation state, sound IDs, and recovered parent/child mappings. The USA `DEMO=0` entry probe exits successfully and produces a 246,778-byte binary; remaining stage-specific object families are still pending.
- **R31A object family milestone:** CC Glass Shatter, Bumper Platform, and Teleporter are ported from the tracked R3 sources into the current object ABI. The slice includes the original glass animation/point reward path, bumper-platform launch and oscillation logic, teleporter deletion behavior, and recovered sprite mappings. The USA `DEMO=0` entry probe exits successfully and produces a 244,936-byte binary; remaining stage-specific object families are still pending.
- **R31A object family milestone:** CC Metal Platform is ported with its R3 horizontal, vertical, bobbing, activation, and final-drop state machines, current top-solid/despawn integration, motion tables, and recovered sprite mapping. The USA `DEMO=0` entry probe exits successfully and produces a 244,380-byte binary.
- **R31A object family milestone:** CC Block and Hidden Block are ported with their R3 motion tables, current `FindNextObjSlot` child spawning, solidity, player-triggered movement, and recovered sprite mappings. The USA `DEMO=0` entry probe exits successfully and produces a 243,516-byte binary.
- **R31A object family milestone:** CC Bumper and Flipper are ported from the tracked R3 sources into the current object ABI, including collision response, point spawning, saved-object-state updates, animation scripts, sprite mappings, slope tables, and the recovered tile IDs. The USA `DEMO=0` entry probe exits successfully and produces a 242,876-byte binary. Remaining stage-specific object families are still pending.
- **R31A object ABI milestone:** The Collision Chaos object index now preserves all 60 R3 object-ID slots, and the recovered CC door object is ported to the current word-position object ABI with its original `$371` tile setup, vertical player-triggered movement, despawn range, and sprite mapping. The USA `DEMO=0` entry probe assembles with 0 errors and remains a 237 KiB binary; the other R3 stage-object slots are still explicitly marked pending.
- **R31A entry integration milestone:** Collision Chaos Act 1 Present now has a current-format entry scaffold, object index/layout wiring, palette cycle, debug/animated-tile hooks, and the remaining shared object data dependencies. The pinned USA `asm68k` probe with `DEMO=0` assembles the complete entry with 0 errors from 32,960 lines and produces a 237 KiB binary. The entry is not yet part of the main build/check graph or a byte comparison; Collision Chaos-specific gameplay objects remain to be ported.
- **R31A scrolling milestone:** `src/Level/Collision Chaos/Scroll (Act 1 Present).asm` ports the R3 camera bounds/start data, initialization, update/deformation behavior, and current camera/scroll ABI into the current architecture. A standalone USA probe including the CC palette/data sources before the scroll source assembled successfully; its temporary output was 194,644 bytes. This is not yet a complete current R31A entry, MMD, or byte comparison.
- **R31A data-graph milestone:** Collision Chaos Act 1 Present now has a current-format `LevelDataIndex`, 19-entry PLC index/list set, the recovered 36-entry layout table, shared collision lookup tables, palette metadata, section PLC ranges, and the recovered CC-specific PLC art labels. A standalone USA assembler probe including `_Definitions.inc`, the CC palette source, and the CC data source completed successfully; its temporary output was 192,586 bytes. This is a validated source graph, not yet a complete R31A MMD or byte comparison.
- **R31A graphics sources:** The PLC art and auxiliary map blobs were imported from the tracked `origin/test` history only where referenced by the new graph. `git ls-files --others --exclude-standard original` remains empty; no proprietary originals were added. Stage drawing now exports the current `DrawLevel*`/`InitLevelDraw*` entry labels while retaining the recovered routine bodies.
- **Milestone commit `5059d6c`:** “Add validated Collision Chaos collision data.” This commit contains the R31A collision slice under `src/Level/Collision Chaos`: `Data (Act 1 Present).asm` and `Data/Collision (Act 1 Present).bin` (700 bytes). The binary matches the tracked `origin/test:src/maps/r31a/collision.bin`; no ignored region files are part of this record.
- **R31A build status:** Collision Chaos still has no current build/check entry point. The committed collision slice is therefore source progress, not a claim that a complete R31A MMD can assemble or compare.
- **R31A tracked-history follow-up:** `origin/test:src/r3/scroll_1a.asm` supplies the Act 1 Present camera/start/special-chunk tables, and `origin/test:src/r3/data_1a.asm` supplies the historical include graph. The next bounded source slice is recorded in `src/Level/Collision Chaos/Scroll Metadata (Act 1 Present).asm`; it preserves camera bounds `$2E97/$0510`, start `$0060,$03EC`, and special chunks `$7F,$7F,$7F,$7F` with Collision Chaos-prefixed labels.
- **Milestone `c376170` — R31A stage chunks:** The independently reusable tracked-history payload `origin/test:src/maps/r31a/chunks.bin` was added as `src/Level/Collision Chaos/Data/Chunks (Act 1 Present).bin` (54,784 bytes), with the `StageChunks` include fragment in `src/Level/Collision Chaos/Chunks (Act 1 Present).asm`. `cmp` against the tracked `origin/test` blob matched exactly; this is a data slice only and is not wired into a complete R31A build.
- **Milestone `4ad233c` — R31A blocks:** The independently reusable tracked-history payload `origin/test:src/maps/r31a/blocks.nem` was added as `src/Level/Collision Chaos/Data/Blocks (Act 1 Present).nem` (3,960 bytes), with the `LevelBlocks` include fragment in `src/Level/Collision Chaos/Blocks (Act 1 Present).asm`. `cmp <(git show origin/test:src/maps/r31a/blocks.nem) 'src/Level/Collision Chaos/Data/Blocks (Act 1 Present).nem'` produced no output and returned 0; this is a data slice only and is not wired into a complete R31A build.
- **Milestone `7b5591e` — R31A foreground/background maps:** The tracked-history payloads `origin/test:src/maps/r31a/foreground.bin` and `origin/test:src/maps/r31a/background.bin` were added as `src/Level/Collision Chaos/Data/Foreground (Act 1 Present).bin` (290 bytes) and `src/Level/Collision Chaos/Data/Background (Act 1 Present).bin` (24 bytes), with concise `incbin` fragments in `src/Level/Collision Chaos/Foreground (Act 1 Present).asm` and `src/Level/Collision Chaos/Background (Act 1 Present).asm`. `cmp` against each corresponding tracked `origin/test` blob produced no output and returned 0; `wc -c` reported 290 and 24 bytes respectively. These remain data slices and are not wired into a complete R31A build.
- **Milestone `aa78d1d` — R31A stage graphics:** The tracked-history payload `origin/test:src/maps/r31a/gfx.nem` was added as `src/Level/Collision Chaos/Data/Graphics (Act 1 Present).nem` (10,162 bytes / `0x27B2`), with the concise `StageGfx` `incbin` fragment in `src/Level/Collision Chaos/Graphics (Act 1 Present).asm`. `cmp <(git show origin/test:src/maps/r31a/gfx.nem) 'src/Level/Collision Chaos/Data/Graphics (Act 1 Present).nem'` produced no output and returned 0; `wc -c` reported `10162`. This remains a data slice and is not wired into a complete R31A build.
- **Remaining R31A dependency graph:** The tracked historical source still requires scroll/drawing/loading/object-index code and the corresponding current-architecture entry point, so the metadata, chunk, blocks, map, and graphics slices are intentionally not wired into a build.
- **Milestone — R31A stage drawing:** `src/Level/Collision Chaos/Stage Draw (Act 1 Present).asm` ports the stage-specific labeled routines and tables from `origin/test:src/r3/stage_draw_1a.asm`. Its dependencies are representable by tracked current includes: `Level/Block Draw.asm` supplies block lookup/VDP/drawing helpers, `_Definitions.inc` supplies `levelLayout`, `blockBuffer`, and camera RAM, `Main CPU Variables.inc` supplies the V-INT camera/scroll copies, and `Chunks (Act 1 Present).asm` supplies `StageChunks`. Historical names were mapped to current names (`stage_map`/`stage_blocks`, VDP ports, camera and scroll-copy symbols); common block routines were not duplicated. The Collision Chaos level entry point, scroll/update caller, loader integration, and object-index graph remain unresolved, so this is a source slice and is not wired into a complete R31A build or byte comparison.
- **R12A-D:** Absent from the current build graph. Metadata/dependency graph audited; no complete byte-verifiable current-architecture slice was integrated.
- **R13C-D:** Absent from the current build graph. Metadata/dependency graph audited; no complete byte-verifiable current-architecture slice was integrated.
- **Clean USA baseline:** The existing 51-component check remains the prior validated baseline; no build/check was rerun during this tracked-only investigation.
- **Prior milestone commit:** `7f30ec4` — “Clarify backup RAM and boss PCM disassembly”.

Scope note: This investigation used tracked repository content and local git history only. No ignored region files, generated build products, whole-MMD dumps, or scratch files were created or modified.
