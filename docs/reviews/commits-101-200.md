# Review of remediation commits 101–200

## Range and coverage

This is the 100 commits immediately before the first sampled batch, anchored
to `aed7ceab` so later commits cannot shift the boundary. Oldest to newest:
`8102ae84` through `172a72a8`, inclusive, September 3–4, 2026.

Exact revision range:
`ef9f86e3e4d434a3e5506a5b3cac98b719271cbb..172a72a844ec4d82a9525cfefd001223fc907fe5`.

All 100 commits received mechanical source-diff triage. The source changes are
confined to Time Attack main, Thank You main, and ending FMV main. After
removing comments/blank lines and resolving same-file labels/aliases to their
statement positions, 94 commits have equivalent normalized statements. Five
need additional operand/data inspection; one changes documentation only.
This normalization is a heuristic, not an assembler or semantic proof.

All five operand/data cases were manually inspected. Additional semantic
sampling followed hardware definitions, register data flow, loop bounds,
fall-through paths, and table consumers. Every newly added comment was
inventoried; the resulting findings below identify the verified errors.
This is not a claim that every label or encoded data range in these 100
commits has been semantically verified. Historical builds for each individual
commit were not rerun, and gameplay was not emulated.

## Verified findings and corrections

| Scope / originating commits | Evidence | Correction |
| --- | --- | --- |
| Time Attack save wrappers (`78008bcc`, `9967ba1e`) | `$FF0F1F` is `saveDisabled`, not region. IPX uses the same flag to select `$87/$88` saved-data commands or `$8B/$8C` temporary-data commands. | Name the wrappers read/write save data, use `saveDisabled.l`, and correct the command-selection comments. |
| Time Attack palette DMA (`d8ffb819`, `2cbc5dab`) | `$C0000080` and `$C0600080` are CRAM DMA commands. Registers 19/20 hold length; 21–23 hold source word address. | Document 64 words from `$FFD0A0` to CRAM `$0000`, and 16 from `$FFD100` to CRAM `$0060`; correct the source/length labels. |
| Time Attack VInterrupt (`2cbc5dab`) | `$A12000` is `GAIRQ2`, the Sub CPU interrupt request register. | Replace the acknowledgement label with an IRQ2-request label and use `GAIRQ2.l`. |
| Time Attack buffered time rendering (`68c6f24e`, `761a5d05`) | Both iterations read offsets 1/2/3 of the same A1 record. Only the output row and tile-map half advance. | Name one-record rendering; document two rows and A4 advancing by `$40`; correct row-loop labels. |
| Time Attack compact tile upload (`761a5d05`) | DBRA counters 1 and 2 produce two rows of three tiles, rereading the same three source indices. | Document one 3x2 block, not two blocks, and the four-byte source stride. |
| Time Attack controller and rotated upload (`477aecde`) | The read phases use TH low/high, then retain two upper button bits and six lower bits. `lsl.w #3` multiplies the row count by eight. | Replace low/high-nibble names and the misleading "DoubleRowCount" name. |
| Thank You fill helper (`f7d05b14`) | `FillLongs` falls through 16 more writes in `FillObject`: 32 total before RTS. | Document `$80` bytes for the full entry and `$40` bytes for the tail entry. |
| Thank You trigonometry (`f7d05b14`) | The routine adds `$80` to a 512-unit angle, performs one signed lookup, then copies D4.w to D3.w. | Document one phase-shifted sample, duplicated in D3/D4, rather than independent sine/cosine outputs. |
| Thank You Nemesis output (`861eeb4e`) | A write emits a 32-bit/eight-pixel row. `(A4)` keeps the CPU port pointer fixed; VDP register 15 controls hardware address advance. XOR uses the D2 accumulator, not a VDP read. `(A4)+` variants advance the RAM pointer. | Correct the comments and distinguish VDP/RAM row-writer names. Preserve retained encoded instruction bodies. |
| Thank You Nemesis table builder (`1ada20d3`, `861eeb4e`) | The routine loops through descriptors until `$FF`, expanding two-byte lookup entries. The decoder subsequently loops until all header-specified rows are emitted. | Name the complete table builder and correct the single-byte/single-codeword descriptions. |
| Thank You object searches (`49818978`) | A 64-slot pool starts at `$FF9200`; each search covers 61 slots, one starting at slot zero and the other at slot three. The ranges overlap. | Document overlapping search windows, not separate primary/secondary pools. |
| Ending VDP initialization (`94ae3de7`) | `$A10003` is controller port 1 data, distinct from control at `$A10009`. | Correct the controller-data label. |

The bad Thank You timer-region descriptions introduced by `57c7baa2` were
already corrected in the preceding review. They were checked again but are
not counted as newly fixed here.

## Operand/data cases checked

- `1764ca82`: the digit-map label is moved before the initial `$42CC` word
  when callers start using it, matching the previous `$FF2E5A` address.
- `761a5d05`: the digit renderer uses the map plus two bytes, matching its
  former `$FF2E5C` operand; other table references preserve their anchors.
- `2cbc5dab`: the animation table operand is replaced by its label. The
  separate return-instruction/table-relative dispatch bases are retained.
- `672689db`: retained Time Attack Nemesis XOR writers and table-builder bytes
  become instructions. Their output/loop structure was compared with the
  previous encoded sequences and the existing shared decoder.
- `861eeb4e`: the retained RAM-output entry points to the row-writer symbol
  instead of subtracting `ThankYouFullShift` from a hard-coded low address.
  The regional layout contract is preserved.

No new runtime regression was identified in these checks. That conclusion
does not independently certify every historical intermediate binary.

## Validation of corrections

Source base: `c0018b55`. Corrected standalone entry points are
`Time Attack/Main.asm` (`ATTACK.MMD`), `Thank You/Main.asm` (`THANKS_M.MMD`),
and `FMV/Main (Ending).asm` (`ENDING.MMD`). The full regional frontends are
used to check the complete component set, not only these three programs.

Final source-diff SHA-256 (`git diff c0018b55 -- src` before commit):
`1e219dfb9b1de3c3159aa32e85b8e8ce19d82e292ff5ff77e2ccfaa2638d0ab1`.

| Region | Fresh displayless Proton build | Component comparison |
| --- | --- | --- |
| Japan | Passed | 133/133 match |
| USA | Passed | 133/133 match |
| Europe | Passed | 133/133 match |

All builds and checks exited successfully on September 4, 2026. Build logs
contain no reported errors. The structural audit and all six audit regression
tests pass; `git diff --check` is clean. No proprietary originals or generated
build outputs are included in the correction commit.

Logs and isolated outputs:
`/tmp/scddisasm-older100-validation.NpYZ7H/`. Each region starts with a fresh
`out/`. Temporary artifacts are not committed and may disappear after reboot.
Fresh CHD data-track comparison remains unavailable because `chdman` and
`bchunk` are missing; component comparisons are not presented as CHD results.

## Commit triage manifest

"Symbolic" means equivalent normalized statements, not verified semantic
meaning. "Operands/data" refers to the five manually inspected cases above.

| Commit | Triage | Subject |
| --- | --- | --- |
| `8102ae84` | Symbolic | Name Thank You palette helpers |
| `be907f1c` | Symbolic | Name Thank You startup helpers |
| `74ec2c3d` | Symbolic | Name Thank You object helpers |
| `d8ffb819` | Symbolic | Name Time Attack VInterrupt handlers |
| `301f55f8` | Symbolic | Name Time Attack VDP primitives |
| `239578be` | Symbolic | Name Time Attack I/O helpers |
| `b56c4f28` | Symbolic | Name Time Attack rotated upload helper |
| `124e6d7c` | Symbolic | Name Time Attack Nemesis decoders |
| `ec74d530` | Symbolic | Name Time Attack Enigma decoder |
| `fc35ab32` | Symbolic | Name Time Attack Enigma bit helpers |
| `e6e48134` | Symbolic | Name Time Attack record renderer |
| `68c6f24e` | Symbolic | Correct Time Attack helper aliases |
| `47cd2faf` | Symbolic | Name Time Attack selection input handler |
| `e4b6d0bb` | Symbolic | Name Time Attack record preparation |
| `e2acb801` | Symbolic | Name Thank You palette writer |
| `844c1860` | Symbolic | Name Thank You exit signal check |
| `aa7a4061` | Symbolic | Name Thank You Sub CPU wait loop |
| `afb5ebe2` | Symbolic | Name Thank You Z80 helpers |
| `cab3d978` | Symbolic | Name Thank You controller reader |
| `40543d0b` | Symbolic | Name Time Attack controller latch |
| `66bea5e3` | Symbolic | Name Time Attack tile animation handler |
| `8fc6ad93` | Symbolic | Name Time Attack title uploader |
| `8d5632d2` | Symbolic | Name Time Attack time table renderer |
| `6a6e5627` | Symbolic | Name Time Attack selection graphics prep |
| `0927c65d` | Symbolic | Name Thank You idle VInterrupt path |
| `6e40378a` | Symbolic | Name Thank You screen-data dispatcher |
| `f3f2fcf2` | Symbolic | Name Thank You palette fade-in |
| `de87b51c` | Symbolic | Name Time Attack palette fade helpers |
| `10e00113` | Symbolic | Name Time Attack dispatch tables |
| `56f657cc` | Symbolic | Name Thank You display-state check |
| `03f960d8` | Symbolic | Name Time Attack initials entry helpers |
| `00251b3d` | Symbolic | Name Time Attack selection highlight helper |
| `8487f241` | Symbolic | Name Time Attack selection tile uploader |
| `7f1899c1` | Symbolic | Name Time Attack record insertion animation |
| `e341d1c6` | Symbolic | Classify Thank You Enigma refill helper |
| `49818978` | Symbolic | Name Thank You object-list helpers |
| `62cccd83` | Symbolic | Classify Time Attack time-record tile maps |
| `78008bcc` | Symbolic | Name Time Attack Sub CPU command wrappers |
| `9e66b8c6` | Symbolic | Name Time Attack palette step helpers |
| `17dd3a26` | Symbolic | Name ending FMV dispatch helpers |
| `1764ca82` | Operands/data | Route Time Attack callers through semantic symbols |
| `d172d6d4` | Documentation | Separate remediation governance changes |
| `b64040bb` | Symbolic | Name remaining Time Attack wrapper callers |
| `53b5cfad` | Symbolic | Name Time Attack VDP wait callers |
| `53365ef6` | Symbolic | Name Time Attack hardware helper callers |
| `0aaeaf17` | Symbolic | Name ending FMV startup helpers |
| `2fd58763` | Symbolic | Name ending FMV VBlank helpers |
| `7f9b4a68` | Symbolic | Name ending FMV synchronization helpers |
| `223a0142` | Symbolic | Name ending FMV command lifecycle handlers |
| `6a2d5878` | Symbolic | Name Thank You palette callers |
| `0847d764` | Symbolic | Name Thank You object pipeline callers |
| `b0262a51` | Symbolic | Name Thank You display callers |
| `e69a88c4` | Symbolic | Name Thank You hardware callers |
| `66791566` | Symbolic | Name Thank You startup callers |
| `c5e245dd` | Symbolic | Canonicalize Time Attack semantic labels |
| `5c49484e` | Symbolic | Canonicalize Thank You semantic labels |
| `1ada20d3` | Symbolic | Canonicalize Thank You decoder labels |
| `861eeb4e` | Operands/data | Canonicalize Thank You Nemesis internals |
| `deee7d5a` | Symbolic | Canonicalize Thank You Enigma internals |
| `f3ccd70e` | Symbolic | Canonicalize Thank You object pipeline |
| `57c7baa2` | Symbolic | Canonicalize Thank You timer tables |
| `df9f2a71` | Symbolic | Canonicalize Thank You startup callers |
| `34e71b64` | Symbolic | Canonicalize Thank You hardware init |
| `5213f40a` | Symbolic | Canonicalize Thank You VInterrupt paths |
| `f7d05b14` | Symbolic | Canonicalize Thank You utility helpers |
| `eef7b04a` | Symbolic | Canonicalize Thank You screen data dispatch |
| `97c8cce0` | Symbolic | Canonicalize Thank You display transitions |
| `b2611eab` | Symbolic | Canonicalize Thank You hardware probe |
| `9ca39563` | Symbolic | Canonicalize Thank You palette internals |
| `daf07368` | Symbolic | Complete Thank You label cleanup |
| `12a99ead` | Symbolic | Canonicalize ending FMV startup loops |
| `764d2895` | Symbolic | Canonicalize ending command loaders |
| `3f015494` | Symbolic | Canonicalize ending event stream |
| `94207df6` | Symbolic | Canonicalize ending VBlank transfers |
| `a868c5f8` | Symbolic | Canonicalize ending Word RAM and VDP helpers |
| `50025422` | Symbolic | Canonicalize ending command state handlers |
| `21ed8c3d` | Symbolic | Canonicalize ending event stream renderer |
| `6b577fc3` | Symbolic | Canonicalize ending startup graphics helpers |
| `a68fe432` | Symbolic | Canonicalize ending startup teardown loops |
| `292d085b` | Symbolic | Canonicalize ending VBlank transfer loop |
| `45b8f191` | Symbolic | Canonicalize ending VBlank animation handlers |
| `32cb0d15` | Symbolic | Canonicalize ending event handshake anchors |
| `92068b77` | Symbolic | Canonicalize ending image startup |
| `1b76d072` | Symbolic | Canonicalize ending tile buffer transforms |
| `fd95391f` | Symbolic | Canonicalize ending synchronization helpers |
| `94ae3de7` | Symbolic | Canonicalize ending VDP and art decompressor |
| `d96da856` | Symbolic | Canonicalize Time Attack period animation |
| `672689db` | Operands/data | Canonicalize Time Attack Nemesis decoder |
| `933f8e2a` | Symbolic | Canonicalize Time Attack Enigma dispatch |
| `30aa6c10` | Symbolic | Canonicalize Time Attack Enigma bit reader |
| `863689ba` | Symbolic | Canonicalize Time Attack palette fades |
| `46d8145c` | Symbolic | Canonicalize Time Attack VDP helpers |
| `477aecde` | Symbolic | Canonicalize Time Attack hardware helpers |
| `2cbc5dab` | Operands/data | Canonicalize Time Attack VDP interrupt family |
| `9967ba1e` | Symbolic | Canonicalize Time Attack Sub CPU handoff |
| `761a5d05` | Operands/data | Canonicalize Time Attack time rendering |
| `52f04b39` | Symbolic | Canonicalize Time Attack record table rendering |
| `537b866a` | Symbolic | Canonicalize Time Attack record preparation |
| `cfb3594a` | Symbolic | Canonicalize Time Attack selection graphics |
| `172a72a8` | Symbolic | Canonicalize Time Attack initials input |
