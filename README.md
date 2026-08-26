# Sonic CD Disassembly

This is an incomplete disassembly of Sonic CD for the Sega CD. Builds a working ISO, as long as you provide the rest of the files in the "original" folder. Unfortunately, I do not have the time or motivation to continue working on this, but hopefully this new home for the project will encourage others to contribute.

Special thanks to flamewing and TheStoneBanana for helping out and contributing, especially for R11A in the disassembly's infancy stages back in 2015.

Devon  
July 27, 2025

## Reconstruction status

The configured Japan, USA, and Europe component comparisons can reach complete
matches while the disc reconstruction is still incomplete. The comparison covers the files listed in
`check.sh`; it does not certify that every ISO file is assembled from source,
that every level data slice is disassembled, or that the ISO is independent of
the regional original tree. The current build still requires three externally
supplied encoded media streams (`BADEND.STM`, `GOODEND.STM`, and `PTEST.STM`),
but these can be supplied independently through `FMV_STREAM_DIR`; they are not
executable game logic. A byte-exact USA filesystem also needs the three retail
ISO identification text files (`ABS.TXT`, `BIB.TXT`, and `CPY.TXT`), supplied
through `ISO_METADATA_DIR`; the deterministic builder does not read a reference
ISO. The padding slices
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

`BRAMMAIN.MMD` is now emitted from source for Japan, USA, and Europe. Its
regional path still contains explicit `dc.b` spans pending semantic
decomposition, so source-only generation is not being presented as a fully
readable disassembly of every routine and data table.

The non-USA `BRAMMAIN.MMD` entry now expresses its complete 390-byte `Start`
image at `$FF2000-$FF2185` as labeled 68000 instructions, including the
localized startup, Backup RAM initialization, controller handshake, and
initialization-table pointer copy. Numeric calls retain the regional ABI until
their later routine spans are decomposed. The `VInterrupt` and following data
spans remain explicit source bytes pending further decomposition. Japan, USA,
and Europe still produce byte-exact component outputs.

The non-USA `BRAMMAIN.MMD` V-interrupt dispatch and VDP setup path now adds 354
bytes of labeled 68000 source from `$FF2186` through `$FF22E6`, including its
state dispatch word, two VDP update paths, and both interrupt exits. The next
helper at `$FF22E8` is covered by the following paragraph; later
V-interrupt/data spans remain explicit source bytes pending decomposition.
This is not a claim that the whole manager is fully disassembled.

The next non-USA `BRAMMAIN.MMD` helper is now labeled from `$FF22E8` through
`$FF233B` (84 bytes), covering its frame/counter checks, `$CD53` byte loop, and
`$CD52` result write. Three `$05xx` words at `$FF2312`, `$FF2326`, and
`$FF232C` remain explicit `dc.w` values until their instruction/data role is
established; the following routine begins at `$FF233C` and is covered by the
next paragraph. Japan, USA, and Europe still produce byte-exact component
outputs.

The following non-USA `BRAMMAIN.MMD` routine is now labeled from `$FF233C`
through `$FF235D` (34 bytes). It writes `$A12012`, polls `$A12022` in both
directions, and returns. The four short hardware-polling routines from
`$FF235E` through `$FF2395` (56 bytes) are also now labeled; the larger
routine beginning at `$FF2396` is covered by the following paragraph. This is
a bounded source-recovery milestone, not a claim that the remaining
`BRAMMAIN` routines and data tables are fully disassembled. Japan, USA, and
Europe still produce byte-exact component outputs.

The non-USA `BRAMMAIN.MMD` polling span at `$FF235E-$FF2395` covers the
`$A12003` bit-set/test waits and both `$A1200F` bit-7 wait directions. The
following setup routine begins at `$FF2396` and is covered below.

The non-USA `BRAMMAIN.MMD` setup routine from `$FF2396` through `$FF2487`
(242 bytes) is now labeled source. It initializes the VDP and controller
ports, clears and fills VRAM, uploads the table-backed block, and returns;
numeric calls retain the regional ABI. The following table begins at `$FF2488`
and is covered by the following paragraph, while later manager routines remain
explicit source-emitted bytes pending semantic decomposition.

The non-USA `BRAMMAIN.MMD` 148-byte table from `$FF2488` through `$FF251B` is
now declared as 37 `dc.l` values, matching the regional VDP pattern data and
preserving its historical layout. The next routine begins at `$FF251C` and is
covered by the following paragraph.

The two non-USA `BRAMMAIN.MMD` handoff helpers from `$FF251C` through `$FF2541`
(38 bytes) are now labeled source. They save and restore the interrupt status
around the `$A11100` handoff/reset sequence; the next raw routine begins at
`$FF2542`, with later recovered code covered by the following paragraphs.

The non-USA `BRAMMAIN.MMD` latch and event-handler routines from `$FF25B8`
through `$FF25F9` (66 bytes) are now labeled source. They update the input
latches, dispatch the pending `$F00B`/`$F00C` event, and restore the handoff
state; the preceding `$FF2542-$FF25B7` span remains explicit bytes. The
following pattern data begins at `$FF25FA` and is covered by the following
paragraph.

The non-USA `BRAMMAIN.MMD` pattern-data block from `$FF25FA` through `$FF2701`
(264 bytes) is now emitted as 66 explicit `dc.l` declarations, preserving its
repeated 68000 instruction-pattern words and exact layout. The next raw routine
begins at `$FF2702`; later manager spans remain pending semantic decomposition.

The next non-USA `BRAMMAIN.MMD` handoff routine from `$FF2702` through
`$FF2713` (18 bytes) is now labeled source. It requests the sub-CPU handoff via
`$CD00`, raises the interrupt mask to `$2500`, polls until the request clears,
and returns; the following `$FF2714` span remains explicit source bytes pending
decomposition.

The following non-USA `BRAMMAIN.MMD` span from `$FF2714` through `$FF2747`
(52 bytes) is now labeled source. It contains the VSRAM-mode setter and the
random-value helper, including its `$2A6D365A` seed, arithmetic sequence, and
state update; the pointer/data table beginning at `$FF2748` remains explicit
source bytes pending decomposition.

The non-USA `BRAMMAIN.MMD` pointer table from `$FF2748` through `$FF275F`
(24 bytes) is now declared as six explicit `dc.l` targets. The following
routine begins at `$FF2760`; later manager code remains pending semantic
decomposition.

The non-USA `BRAMMAIN.MMD` state/animation-sequence routine from `$FF2760`
through `$FF280B` (172 bytes) is now labeled source. It updates the current
sequence state from indexed animation data, handles its marker branches, and
returns; the following helper begins at `$FF280C` and remains pending.

The non-USA `BRAMMAIN.MMD` dispatcher from `$FF280C` through `$FF2833` (40 bytes)
is now labeled source. It scans the 54-entry object area, selects a routine
through the `$FF2748` pointer table, invokes it, and advances to the next
entry; the following routine begins at `$FF2834`.

The next non-USA `BRAMMAIN.MMD` camera/position gate from `$FF2834` through
`$FF28B1` (126 bytes) is now labeled source. It checks the object's horizontal
and vertical bounds, selects a `$C000` table slot from the object angle, and
writes the current object address; the following data begins at `$FF28B2`.

The following non-USA `BRAMMAIN.MMD` object-processing dispatcher from `$FF28D0`
through `$FF29BD` (238 bytes) is now labeled source. It scans active `$C000`
object slots, derives viewport-relative coordinates, follows object mapping
data, and emits active-object records to `$B000`; its embedded 24-byte table is
still explicit data, and the called helper begins at `$FF29BE`.

The called non-USA `BRAMMAIN.MMD` object-record helper from `$FF29BE` through
`$FF2A03` (70 bytes) is now labeled source. It handles the default record format
and writes transformed position and mapping fields into the `$B000` output
stream; bit-selected variants begin at `$FF2A04` and `$FF2A52`.

The first bit-selected non-USA `BRAMMAIN.MMD` object-record helper from
`$FF2A04` through `$FF2A51` (78 bytes) is now labeled source. It emits the
alternate record format, including the transformed tile/attribute word, and
returns at `$FF2A50`; the next variant begins at `$FF2A52`.

The second bit-selected non-USA `BRAMMAIN.MMD` object-record helper from
`$FF2A52` through `$FF2A97` (70 bytes) is now labeled source. It emits the
mirrored record format with its alternate tile/attribute transformation and
returns at `$FF2A96`; the next variant begins at `$FF2A98`.

The final bit-selected non-USA `BRAMMAIN.MMD` object-record helper from
`$FF2A98` through `$FF2AEB` (84 bytes) is now labeled source. It emits the
remaining record format and returns at `$FF2AEA`; the following data table
begins at `$FF2AEC`.

The non-USA `BRAMMAIN.MMD` command dispatcher from `$FF2B48` through
`$FF2B93` (76 bytes) is now labeled source. It reads a command byte from
`$200020`, dispatches through the `$FF2B94` routine table, records the result
and status at `$200021-$200024`, and clears the command byte; the routine table
remains explicit data.

The non-USA command-offset table at `$FF2B94-$FF2BA5` (18 bytes) is now a
labeled source-level `dc.w` table with all nine dispatch offsets explicit. The
following command routine begins at `$FF2BA6`.

The non-USA `BRAMMAIN.MMD` command handlers from `$FF2BA6` through `$FF2C8B`
(230 bytes) are now labeled source. They initialize the command-specific
buffers and dispatch the nine Backup RAM operations through the common helper;
the following zero-filled data begins at `$FF2C8C`.

The non-USA `BRAMMAIN.MMD` status helpers from `$FF3BDA` through `$FF3BF9`
(32 bytes) are now labeled source. They run the status check, normalize its
result into `$200026`, and expose the `$200026/$200027` state tests; the
following regional data begins at `$FF3BFA`.

The non-USA `BRAMMAIN.MMD` buffer-copy helper from `$FF3C78` through `$FF3C8F`
(24 bytes) is now labeled source. It copies the command buffer from `a0` into
the `$200030` state area and restores the caller registers; the following data
begins at `$FF3C90`.

The non-USA `BRAMMAIN.MMD` status-dispatch helper from `$FF3C90` through
`$FF3CB9` (42 bytes) is now labeled source. It checks the status result,
updates `$200028`, invokes the regional VDP/status routines, and reports the
command status through `$200021`; the following helper begins at `$FF3CBA`.

The non-USA `BRAMMAIN.MMD` command-result helper from `$FF3CBA` through
`$FF3D43` (138 bytes) is now labeled source. It initializes and submits the
command state, performs the two status paths, and returns result/error values
in `d0/d1`; the following regional helper begins at `$FF3D44`.

The non-USA `BRAMMAIN.MMD` RAM-cartridge verification helper from `$FF3D44`
through `$FF3E43` (256 bytes) is now labeled source. It validates the
cartridge signature and both data banks, tests RAM writability when needed, and
returns a zero/nonzero status; the cartridge identifier data begins at
`$FF3E44`.

The non-USA `BRAMMAIN.MMD` command-submission helper from `$FF3E5C` through
`$FF3E81` (38 bytes) is now labeled source. It saves the command value,
submits it through the regional buffer/status path, and enters the command
completion state; the following marker data begins at `$FF3E82`.

The three non-USA `BRAMMAIN.MMD` command wrappers from `$FF3E8E` through
`$FF3EC3` (54 bytes) are now labeled source. They issue command values 2, 3,
and 4 through the regional status dispatcher; the following raw helper begins
at `$FF3EC4`.

The non-USA `BRAMMAIN.MMD` command-10 wrapper from `$FF3EC4` through `$FF3ED5`
(18 bytes) and command-5 wrapper from `$FF3ED6` through `$FF3EEF` (26 bytes)
are now labeled source. They submit their commands through the regional status
dispatcher, with command 5 conditionally invoking the following routine; the
next raw helper begins at `$FF3EF0`.

The non-USA `BRAMMAIN.MMD` command-11 wrapper from `$FF3EF0` through `$FF3F03`
(20 bytes), command-6 wrapper from `$FF3F04` through `$FF3F15` (18 bytes), and
command-7 wrapper from `$FF3F16` through `$FF3F27` (18 bytes) are now labeled
source. They submit their command values through the regional status
dispatcher; the next raw helper begins at `$FF3F28`.

The non-USA `BRAMMAIN.MMD` command-9 wrapper from `$FF3F28` through `$FF3F39`
(18 bytes) is now labeled source. It submits command value 9 through the
regional status dispatcher; the following hardware routine begins at
`$FF3F3A`.

The non-USA `BRAMMAIN.MMD` hardware-setup routine from `$FF3F3A` through
`$FF3FBD` (132 bytes) is now labeled source. It clears and configures VDP state,
initializes cartridge and controller data, and restores the status flag before
returning; the next raw routine begins at `$FF3FBE`.

The non-USA `BRAMMAIN.MMD` indexed dispatch helper from `$FF3FBE` through
`$FF3FCE` (18 bytes) and its five-entry offset table from `$FF3FD0` through
`$FF3FE3` (20 bytes) are now labeled source. The helper reads the `$CD15`
selector, doubles it, and dispatches through the table; the next raw routine
begins at `$FF3FE4`.

The non-USA `BRAMMAIN.MMD` initialization/cleanup loop and exit branches from
`$FF3FE4` through `$FF4007` (36 bytes) are now labeled source. They perform the
`$CD20` initialization loop, restore its saved counter, and branch to the
corresponding manager exits; the next raw routine begins at `$FF4008`.

The non-USA `BRAMMAIN.MMD` buffer-selection and status-dispatch routine from
`$FF4008` through `$FF403D` (54 bytes) is now labeled source. It selects the
regional buffer, runs the status path, and branches on the `$CD1E` operation
codes; the next raw handler begins at `$FF403E`.

The non-USA `BRAMMAIN.MMD` command-6 and command-5 handlers from `$FF403E`
through `$FF4085` (72 bytes) are now labeled source. They initialize their
operation state, invoke the shared `$FF5480` path, and return; the next raw
handler begins at `$FF4086`.

The non-USA `BRAMMAIN.MMD` operation dispatcher and code-2 handler from
`$FF4086` through `$FF40B9` (52 bytes) are now labeled source. They select
operation codes 1 and 2, loop code 1 through the initialization routine, and
submit code 2 through `$FF5014`; the next raw handler begins at `$FF40BA`.

The non-USA `BRAMMAIN.MMD` status/result routine from `$FF40BA` through
`$FF413B` (132 bytes) is now labeled source. It checks the command-6 path,
selects the regional result buffer, routes status outcomes for operations 1 and
3, and retains its three-word tail table; the next raw routine begins at
`$FF413C`.

The non-USA `BRAMMAIN.MMD` state-finalization routine from `$FF413C` through
`$FF4175` (58 bytes) is now labeled source. It records the resulting command
state, clears the status bytes, and returns; the next raw routine begins at
`$FF4176`.

The following non-USA `BRAMMAIN.MMD` handler from `$FF4176` through `$FF422D`
(184 bytes) is now labeled source. It dispatches the result bits, updates
command/status state, and handles the failure path; the next raw helper begins
at `$FF422E`.

The following non-USA `BRAMMAIN.MMD` status-selection helper from `$FF422E`
through `$FF4273` (70 bytes) is now labeled source. It selects status-byte
paths for command states 5 and 6 and branches to the shared dispatch at
`$FF42AC`; the next raw entry begins at `$FF4274`.

The following non-USA `BRAMMAIN.MMD` status-clear helper from `$FF4274` through
`$FF42AB` (56 bytes) is now labeled source. It clears the status bytes for the
normal and alternate paths and enters the dispatch at `$FF42AC`.

The following non-USA `BRAMMAIN.MMD` state-code dispatcher from `$FF42AC`
through `$FF4305` (90 bytes) is now labeled source. It maps state codes 1
through 6 to their status-byte flags and returns for unrecognized states; the
next raw routine begins at `$FF4306`.

The following non-USA `BRAMMAIN.MMD` indexed jump wrapper and 12-word offset
table from `$FF4306` through `$FF432D` (40 bytes) are now labeled source. The
wrapper selects a table entry from the command-state byte; the first raw target
routine begins at `$FF432E`.

The first non-USA `BRAMMAIN.MMD` table target from `$FF432E` through `$FF43E1`
(180 bytes) is now labeled source. It handles the command-2 path, result/status
updates, and the associated display-state branches; the next table target begins
at `$FF43E2`.

The second non-USA `BRAMMAIN.MMD` table target from `$FF43E2` through `$FF4453`
(114 bytes) is now labeled source. It handles the status/result path and its
reset fallback; the next table target begins at `$FF4454`.

The third non-USA `BRAMMAIN.MMD` table target from `$FF4454` through `$FF4467`
(20 bytes) is now labeled source. It checks the Backup RAM state byte, handles
the nonmatching-state return, writes the next command state, and branches to
the shared handler; the next table target begins at `$FF4468`.

The fourth non-USA `BRAMMAIN.MMD` table target from `$FF4468` through `$FF4493`
(44 bytes) is now labeled source. It checks the status byte, handles the
clear/status path, and sets up the command-6 path; the next table target begins
at `$FF4494`.

The fifth non-USA `BRAMMAIN.MMD` table target from `$FF4494` through `$FF452D`
(154 bytes) is now labeled source. It dispatches the status/result paths,
invokes the shared result handlers, and initializes the command-state branches;
the next table target begins at `$FF452E`.

The sixth non-USA `BRAMMAIN.MMD` table target from `$FF452E` through `$FF45ED`
(192 bytes) is now labeled source. It selects the result buffers, routes the
success/failure status paths, and finalizes the command state; the next table
target begins at `$FF45EE`.

The seventh non-USA `BRAMMAIN.MMD` table target from `$FF45EE` through
`$FF460D` (32 bytes) is now labeled source. It checks the Backup RAM state,
sets the command state for the success path, and enters the shared handler; the
next table target begins at `$FF460E`.

The eighth non-USA `BRAMMAIN.MMD` table target from `$FF460E` through
`$FF4661` (84 bytes) is now labeled source. It checks the status flag, updates
the Backup RAM state and command bytes, and invokes the completion handlers; the
next table target begins at `$FF4662`.

The ninth non-USA `BRAMMAIN.MMD` table target from `$FF4662` through `$FF4685`
(36 bytes) is now labeled source. It checks and clears the completion flag,
restores the status bytes, and invokes the completion handler; the next table
target begins at `$FF4686`.

The tenth non-USA `BRAMMAIN.MMD` table target from `$FF4686` through `$FF46A7`
(34 bytes) is now labeled source. It runs the completion/status handlers,
clears the result flag, and sets the follow-up command state; the next table
target begins at `$FF46A8`.

The eleventh non-USA `BRAMMAIN.MMD` table target from `$FF46A8` through
`$FF46C9` (34 bytes) is now labeled source. It checks the result flag, sets the
command state, invokes the shared handler, and routes the result through the
common dispatcher; the next table target begins at `$FF46CA`.

The twelfth and final non-USA `BRAMMAIN.MMD` table target from `$FF46CA`
through `$FF4731` (104 bytes) is now labeled source. It clears and updates the
Backup RAM state, handles the completion paths, tests the result, invokes the
cleanup handlers, and returns; the independent dispatcher begins at `$FF4732`.

The non-USA `BRAMMAIN.MMD` post-table dispatcher and 13-word offset table from
`$FF4732` through `$FF475B` (42 bytes) are now labeled source. The dispatcher
selects a routine offset from the Backup RAM command-state byte; the next raw
routine begins at `$FF475C`.

The first non-USA post-table `BRAMMAIN.MMD` routine from `$FF475C` through
`$FF4789` (46 bytes) is now labeled source. It checks the status flag, updates
the command and result state, and calls the shared handlers; the next
table-selected routine begins at `$FF478A`.

The second non-USA post-table `BRAMMAIN.MMD` routine from `$FF478A` through
`$FF47A1` (24 bytes) is now labeled source. It checks and clears the
command-result flag, sets command state 2, and returns; the next table-selected
routine begins at `$FF47A2`.

The third non-USA post-table `BRAMMAIN.MMD` routine from `$FF47A2` through
`$FF47B3` (18 bytes) is now labeled source. It sets command state 3, calls the
shared handler at `$FF5716`, loads `d0 = 1`, and branches to `$FF4B7A`; the next
table-selected routine begins at `$FF47B4`.

The fourth non-USA post-table `BRAMMAIN.MMD` routine from `$FF47B4` through
`$FF482F` (124 bytes) is now labeled source. It checks the Backup RAM command
flag and status byte, runs the shared handlers, resets the result state, and
includes helper entry points at `$FF4808`, `$FF480C`, and `$FF481E`; the next
table-selected routine begins at `$FF4830`.

The fifth non-USA post-table `BRAMMAIN.MMD` routine from `$FF4830` through
`$FF4857` (40 bytes) is now labeled source. It clears and checks the
command-result byte, handles the completion path, and restores the
command/result state; the next table-selected routine begins at `$FF4858`.

The next non-USA post-table `BRAMMAIN.MMD` routine from `$FF4858` through
`$FF486F` (24 bytes) is now labeled source. It clears and checks the
`$CD50/$CD51` command-result state, then clears the result byte and sets command
state 9 on the completion path; the next table-selected routine begins at
`$FF4870`.

The next non-USA post-table `BRAMMAIN.MMD` routine from `$FF4870` through
`$FF4881` (18 bytes) is now labeled source. It sets command state A, calls the
shared handler at `$FF5716`, loads `d0 = 1`, and branches to `$FF4B7A`; the next
table-selected routine begins at `$FF4882`.

The following non-USA post-table `BRAMMAIN.MMD` routine from `$FF4882` through
`$FF48AF` (46 bytes) is now labeled source. It checks the command flag, handles
the direct `$CD50` completion path, and otherwise runs the shared handler before
dispatching with command state C; the next table-selected routine begins at
`$FF48B0`.

The following non-USA post-table `BRAMMAIN.MMD` routine from `$FF48B0` through
`$FF48D7` (40 bytes) is now labeled source. It clears and checks the
`$CD50/$CD51` command-result state, runs the completion handlers, and restores
the command/result state; the next raw routine begins at `$FF48D8`.

The final non-USA post-table `BRAMMAIN.MMD` target from `$FF48D8` through
`$FF4929` (82 bytes) is now labeled source. It runs the result/status handlers,
updates `$FF0F1F` and `$CD50`, restores the command/result state, and returns;
the next raw routine begins at `$FF492A`.

The next non-USA raw `BRAMMAIN.MMD` routine from `$FF492A` through `$FF4959`
(48 bytes) is now labeled source. It checks the Backup RAM status mode, takes
the mode-2 alternate path when needed, runs the shared handlers, and returns;
the next raw routine begins at `$FF495A`.

The next non-USA raw `BRAMMAIN.MMD` routine from `$FF495A` through `$FF49B5`
(92 bytes) is now labeled source. It selects the status-dependent setup path,
constructs ten buffer records at `$B4C0`, advances the record coordinates, and
returns; the following raw routine begins at `$FF49B6`.

The next non-USA raw `BRAMMAIN.MMD` routine from `$FF49B6` through `$FF4A79`
(196 bytes) is now labeled source. It builds the alternate `$B4C0` buffer
records, applies the fixed record identifiers and coordinate adjustments, runs
both bounded loops, and returns; the following raw routine begins at
`$FF4A7A`.

The next non-USA raw `BRAMMAIN.MMD` routine from `$FF4A7A` through `$FF4AA3`
(42 bytes) is now labeled source. It synchronizes the command-state bytes,
runs the status handler, selects the follow-up command, and returns; the
following raw routine begins at `$FF4AA4`.

The next non-USA raw `BRAMMAIN.MMD` routine from `$FF4AA4` through `$FF4B29`
(134 bytes) is now labeled source. It runs the status/clock update path,
clamps the two mode-dependent byte fields, writes the updated value, and
returns; the following raw routine begins at `$FF4B2A`.

The next non-USA raw `BRAMMAIN.MMD` routine from `$FF4B2A` through `$FF4B79`
(80 bytes) is now labeled source. It dispatches the status result, updates the
`$CD14`, `$CD2A`, and `$CD2B` state bytes, and returns; the following raw
routine begins at `$FF4B7A`.

The next non-USA raw `BRAMMAIN.MMD` routine from `$FF4B7A` through `$FF4BA3`
(42 bytes) is now labeled source. It initializes the `$CD2C`, `$CD2A`,
`$CD2B`, and `$CD27` state bytes, copies `$CD14` to `$CD1A`, sets `$CD14` to 5,
and returns; the following raw routine begins at `$FF4BA4`.

The next non-USA raw `BRAMMAIN.MMD` routine from `$FF4BA4` through `$FF4BDB`
(56 bytes) is now labeled source. It handles the status-result branches,
conditionally runs the `$009B` status action, updates the `$CD2A`, `$CD26`, and
`$CD27` state bytes, and returns; the following raw routine begins at
`$FF4BDC`.

The next non-USA raw `BRAMMAIN.MMD` routine from `$FF4BDC` through `$FF4C13`
(56 bytes) is now labeled source. It handles the second status path,
conditionally runs the `$009B` status action, updates the `$CD2A`, `$CD26`, and
`$CD27` state bytes, and provides both return paths; the following raw routine
begins at `$FF4C14`.

The next non-USA raw `BRAMMAIN.MMD` routine from `$FF4C14` through `$FF4C37`
(36 bytes) is now labeled source. It selects the `$CD2B` state from `$CD2A`,
joins through the alignment path, calls `$FF4C86`, restores `$CD14` from
`$CD1A`, and returns; the following raw routine begins at `$FF4C38`.

The next non-USA raw `BRAMMAIN.MMD` routine from `$FF4C38` through `$FF4C49`
(18 bytes) is now labeled source. It calls `$FF4C5E`, copies `$CD14` to
`$CD18`, sets `$CD14` to 6, and returns; the following raw routine begins at
`$FF4C4A`.

The next non-USA raw `BRAMMAIN.MMD` routine from `$FF4C4A` through `$FF4C51`
(8 bytes) is now labeled source. It calls `$FF4F4A`, returns when the result is
zero, and branches to the following raw routine at `$FF4C52` when nonzero.

The next non-USA raw `BRAMMAIN.MMD` routine from `$FF4C52` through `$FF4C5D`
(12 bytes) is now labeled source. It calls the clear-state entry at `$FF4C86`,
restores `$CD14` from `$CD18`, and returns; the following raw routine begins at
`$FF4C5E`.

The next non-USA raw `BRAMMAIN.MMD` routine from `$FF4C5E` through `$FF4C85`
(40 bytes) is now labeled source. It calls `$FF6430`, clears `$CD26` and
`$CD27`, checks `$FF3BEA`, selects `$CD29 = 2` or `$CD29 = 1`, and returns; the
following raw clear-state entry begins at `$FF4C86`.

The next non-USA raw `BRAMMAIN.MMD` routine from `$FF4C86` through `$FF4C8F`
(10 bytes) is now labeled source. It clears `$CD2C` and `$CD29`, then returns;
the following raw routine begins at `$FF4C90`.

The next non-USA raw `BRAMMAIN.MMD` routine from `$FF4C90` through `$FF4CD3`
(68 bytes) is now labeled source. It calls `$FF4F3A`, masks the low nibble of
`d0` into `d1`, invokes `$FF4D40`, checks the selected flag bits against offsets
1 through 4 of `a0`, returns when none match, and branches to the following raw
entry at `$FF4CD4` on a match.

The next non-USA raw `BRAMMAIN.MMD` routine from `$FF4CD4` through `$FF4D3F`
(108 bytes) is now labeled source. It handles the command values 5, 6, and 2,
runs the related status checks, preserves the historical stack encodings,
updates `$CD1E` when needed, and returns; the following raw helper begins at
`$FF4D40`.

The next non-USA raw `BRAMMAIN.MMD` routine from `$FF4D40` through `$FF4D4F`
(16 bytes) is now labeled source. It loads `$CD1E`, scans five-byte records
through `a0`, and returns on a matching record; the following table begins at
`$FF4D50`.

The next non-USA raw `BRAMMAIN.MMD` helper span from `$FF4DA6` through
`$FF4DE5` (64 bytes) is now labeled source. It preserves the two related
status loops, their three `$FF20E4` calls, the `$FF4E76`/`$FF4DE6` helper calls,
and the historical transfers to `$FF546E`; the next raw routine begins at
`$FF4DE6`. Japan, USA, and Europe still produce byte-exact component outputs.

The next non-USA raw `BRAMMAIN.MMD` routine from `$FF4DE6` through `$FF4E75`
(144 bytes) is now labeled source. It implements the decrementing status
helper, tests the `$2`, `$10`, and `$12` fields of `a1`, preserves the regional
`$FF532C` helper call, updates the `$6`/`$4` fields, and returns `-1`, `0`, or
`1`; the next raw routine begins at `$FF4E76`. Japan, USA, and Europe still
produce byte-exact component outputs.

The next non-USA raw `BRAMMAIN.MMD` incrementing status helper from `$FF4E76`
through `$FF4F29` (180 bytes) is now labeled source. It preserves the
`$FF546E`, `$FF4F2A`, `$FF532C`, `$FF5480`, and `$FF54B6` helper calls, updates
the `$6`, `$4`, and `$12` fields of `a1`, and returns `-1`, `0`, or `1`; the
next raw helper begins at `$FF4F2A`. Japan, USA, and Europe still produce
byte-exact component outputs.

The next non-USA raw `BRAMMAIN.MMD` fallback-pointer helper from `$FF4F2A`
through `$FF4F39` (16 bytes) is now labeled source. It selects `$FFFFCFA0`,
calls the `$FF3BEA` status helper, and selects `$FFFFDFD0` when that call is
nonzero; the next raw routine begins at `$FF4F3A`. Japan, USA, and Europe
still produce byte-exact component outputs.

The next non-USA raw `BRAMMAIN.MMD` status-result routine from `$FF4F3A`
through `$FF4F49` (16 bytes) is now labeled source. It tests `$CD1F`, returns
`$CD52` when the status byte is clear, and otherwise returns zero through the
shared `$FF4F46` tail; the next raw routine begins at `$FF4F4A`. Japan, USA,
and Europe still produce byte-exact component outputs.

The next non-USA raw `BRAMMAIN.MMD` status-processing routine from `$FF4F4A`
through `$FF4FB7` (110 bytes) is now labeled source. It checks `$CD1F`,
samples `$A1201F`, performs the `$92`, `$AE`, and `$AD` status actions through
`$FF25B8`, restores `d0`, and returns `-1`, `0`, or `1`; the next raw routine
begins at `$FF4FB8`. Japan, USA, and Europe still produce byte-exact
component outputs.

The next non-USA raw `BRAMMAIN.MMD` status predicate from `$FF4FB8` through
`$FF4FDB` (36 bytes) is now labeled source. It tests the `$CD1E` status
against values 1, 3, 4, and 5 and returns through the shared `$FF4FDA` tail;
the next raw routine begins at `$FF4FDC`. Japan, USA, and Europe still
produce byte-exact component outputs.

The next non-USA raw `BRAMMAIN.MMD` setup/table-selection routine from
`$FF4FDC` through `$FF5013` (56 bytes) is now labeled source. It checks
`$CD17`, selects the `$CD60` or `$CD30` buffer path using `$FF5134`, preserves
the `$FF3C6C` table path, and converges through `$FF503C`; the next raw
routine begins at `$FF5014`. Japan, USA, and Europe still produce byte-exact
component outputs.

The shared non-USA R71 Padding1 fragment now expresses its two 68000 animation
routines with labels and instructions in `src/r7/nonusa_padding_1c_1.asm`.
The surrounding animation tables remain declarative data, and the two fixed
legacy branch encodings remain explicit `dc.w` values so the historical link
layout is unchanged. Japan, USA, and Europe still produce byte-exact outputs.

The non-USA R42A Padding1 fragment now also expresses 246 bytes of retained
68000 code before that animated-art routine: the continuation of the
animal-removal helper and the historical three-pass `AnimateStageGfx` copy.
Its fixed branch words and historical absolute targets remain explicit where
needed to preserve the fixed link layout; the animation-buffer traversal and
no-update tails are labeled 68000 source. `R42A__.MMD` remains byte-exact in
the regional comparisons.

The non-USA R63D Padding1 fragment now likewise expresses both legacy animated-
art routines in `src/r6/data_3d.asm`. Their fixed `$6A00,$0034`,
`$B029,$0001`, and `$6502` branch/comparison words remain explicit `dc.w`
values, while the animation-buffer traversal and no-update entries are labeled
68000 source. `R63D__.MMD` remains byte-exact in Japan, USA, and Europe.

The non-USA R63C Padding1 fragment now expresses its 148-byte pair of legacy
animated-art routines in `src/r6/data_3c.asm`. The fixed `$6A42`, `$B011`,
`$6A00,$0034`, `$B029,$0001`, and `$6502` branch/comparison words remain
explicit `dc.w` values, while the animation-buffer traversal and no-update
entries are labeled 68000 source. The surrounding wrapper and animation tables
remain declarative source data, and `R63C__.MMD` remains byte-exact in Japan,
USA, and Europe.

The USA R31B/R31C/R31D Padding1 fragments now reuse the labeled 548-byte
animation tail in `src/Level/USA Legacy Animation Tail.asm`, preserving only
their distinct six-byte prefixes locally. This removes the duplicated raw
68000 tail from all three source files while preserving the historical
`$20FDDC-$20FFFF` layout. Fresh Japan, USA, and Europe builds and component
comparisons remain byte-exact.

The USA R51B/R51C/R51D and R52A/R52B/R52C/R52D Padding1 fragments now reuse
one exact `$48C`-byte suffix in `src/r5/USA Legacy R5 Shared PreChunk.asm` and
retain only their distinct prefixes locally. The retained break-block/object
helpers and compatibility routines in that suffix are labeled 68000 source;
the packed graphics and mapping records remain declarative data. This removes
the duplicated retained suffix from seven source fragments while preserving
their historical offsets. Fresh Japan, USA, and Europe builds and component
comparisons remain byte-exact.

The USA R51A pre-chunk fragment now reuses the same shared source with its
historical six-byte leading record omitted. Its remaining `$486` bytes use the
labeled retained helper and compatibility routines, while the packed graphics
and mapping records remain declarative data. Fresh Japan, USA, and Europe
builds and component comparisons remain byte-exact.

The USA R52B/R52C/R52D graphics-list tails now express 426 bytes of legacy
main, section, single, results, and signpost PLC records as labeled pointer and
VRAM fields. Their final records deliberately continue into the adjacent
Padding1 source at the historical boundary. R52A's leading legacy object record
and `$2064C2` flower trampoline are also source-labeled, while its following
mapping table remains packed data. Fresh Japan, USA, and Europe builds and
component comparisons remain byte-exact; this is incremental source recovery,
not a claim that every packed data table has been decoded.

The Palmtree Panic regional reconciliation now makes `R12A__.MMD`,
`R12B__.MMD`, `R12C__.MMD`, `R12D__.MMD`, `R13C__.MMD`, and `R13D__.MMD`
byte-exact for both Japan and Europe. The source preserves USA's existing
exact output while selecting the regional object-map byte, scroll order and
R13 start position, roll-tunnel operands, debug-object flag, R13 boss
allocator calls, and future-level pre-chunk layout. Subsequent regional and
demo reconciliations brought the current local Japan, USA, and Europe
build/check set to a byte-exact result for every listed comparison target.
This is component parity, not a claim that the entire disc is reconstructable
from source and freely supplied assets.

The sixteen former Padding3 files share an identical 258-byte suffix. That
suffix is now one source-backed table of signed rotation-vector pairs, reused
after bounded per-level prefixes. This replaces 4,128 binary-included bytes
across R33C/R33D, R51A/R53C, R62A-D, and R71A-D/R72A-D while their distinct
prefixes remain to be decomposed. The preceding identical 76-byte mapping and
animation tail is shared source as well, including its historical alignment;
that replaces another 1,216 binary-included bytes across the same consumers.
R62B/R62C/R72A/R72C also share a preceding 64-byte non-USA mapping suffix,
now emitted once from source. Local, ignored Japan and Europe retail comparison
trees are now available for direct regional validation; earlier milestones
that report only tracked-slice or assembly evidence predate their extraction.

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
The older retained level `Data/Padding` set is now fully source-emitted. No
tracked binaries or build references remain in those directories: the former
collision, layout, compressed-art, PLC, object-table, mapping, animation, and
chunk suffixes are represented by named assembly fragments and assets. These
regions remain part of the byte-exact link layout and must not be replaced by
alignment fill.

## Building

Every region still requires externally supplied `BADEND.STM`, `GOODEND.STM`,
and `PTEST.STM` encoded media. By default they are read from
`original/<region>/`; set `FMV_STREAM_DIR` to keep those media inputs separate
from the regional comparison tree. The USA byte-exact filesystem additionally
requires `ABS.TXT`, `BIB.TXT`, and `CPY.TXT`; these default to
`original/usa/`, or can be supplied separately with `ISO_METADATA_DIR`. They
are disc identification text, not executable game logic. The configured
Japan, USA, and Europe executable/data outputs are now source-emitted; the
regional comparison trees remain local prerequisites for byte checks, not build
inputs. The Time Attack main image is now source-emitted for every region. Its common
packed suffix is represented by the existing source table, with the shared
Japan/Europe presentation-table differences in `src/Time Attack/Regional Data.asm`;
no regional `ATTACK.MMD` is read during compilation. Generated files are written
to `out/`.

Locally owned disc images may be kept under the ignored
`original/disc-images/<region>/` directories and extracted into the matching
ignored `original/<region>/` comparison tree. Never add either the images or
their extracted proprietary files to a commit. The current local validation
set includes USA, Japan, and Europe; this is a workstation prerequisite, not
content distributed by the repository.

On Windows, run `make.bat`, followed by `check.bat` to compare every rebuilt binary
with the originals.

On Linux, install Wine with 32-bit Windows application support or Steam Proton,
then run:

```sh
./make.sh
./check.sh
```

For example, a USA build can use media supplied outside the repository without
populating `original/usa/` for compilation:

```sh
FMV_STREAM_DIR=/path/to/user-supplied/usa-media ./make.sh
```

To keep both external input classes outside the comparison tree:

```sh
FMV_STREAM_DIR=/path/to/usa-media ISO_METADATA_DIR=/path/to/usa-iso-text ./make.sh
```

The comparison command still requires the corresponding originals under
`original/<region>/`. The checked-in `MakeSTM` currently supports only the
opening stream format, so the ending and pencil-test streams cannot yet be
regenerated from source media. Both comparison frontends verify all three
externally supplied streams; a successful USA check covers 133 reconstructed
components, three media inputs, and three ISO identification files.

The Linux build uses Wine (or an automatically detected Steam Proton installation)
to run the checked-in, byte-exact Windows toolchain; the comparison script itself
uses the native `cmp` utility. Both scripts default to the USA release. Set
`REGION=0` for Japan or `REGION=2` for Europe, using the same value for both
commands:

```sh
REGION=2 ./make.sh
REGION=2 ./check.sh
```

The build clears the generated `out/files/` entries before assembling and
copies only externally supplied media plus USA ISO metadata. The build does not
remove other stale files under `out/`,
so use a fresh `out/` directory after switching regions. If the Wine or Proton executable has
a custom name or path, set `WINE_BIN` or `PROTON_BIN` when running `make.sh`.

## Currently Contains
* Initial program
* System program
* Main program file (IPX)
* System program extension file (SPX)
* Backup RAM initialization file (BRAMINIT)
* Backup RAM manager main CPU program (BRAMMAIN)
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
* Time attack main CPU program (ATTACK.MMD, source plus regional packed-data tables)
* Time attack Sub CPU program (ATTACK.BIN)
* "Thank You" screen main CPU program (THANKS_M.MMD)
* "Comin' Soon" screen main CPU program (COME__.MMD)
* "Thank You" screen Sub CPU program (THANKS_S.BIN)
* "Thank You" screen Nemesis graphics data (THANKS_D.BIN)
* FMVs
    - Opening FMV (OPEN_M, OPEN_S, OPN.STM)
    - Ending FMV main CPU program (ENDING.MMD)
    - Good ending Sub CPU program (BADEND.BIN, not a typo)
    - Bad ending Sub CPU program (GOODEND.BIN, not a typo)
    - Pencil test main CPU program (PTEST.MMD)
    - Pencil test Sub CPU program (PTEST.BIN)
* DA Garden (PLANET_M, PLANET_S, PLANET_D)
* Visual Mode menu (VM)
