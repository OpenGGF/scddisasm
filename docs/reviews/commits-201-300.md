# Review of remediation commits 201–300

## Range and coverage

This is the next 100 commits before the preceding review, anchored to
`aed7ceab`: `b2e155ec` through `ef9f86e3`, inclusive, September 2–3, 2026.

Exact revision range:
`cf7948f5568eb25e889483b8995cedeaf8f66870..ef9f86e3e4d434a3e5506a5b3cac98b719271cbb`
(`aed7ceab~300..aed7ceab~200`).

All 100 commits received source-diff triage. Unlike the later label-heavy
batches, most changes here restructure retained data or share include providers.
The initial mechanical pass recursively expanded historical includes/incbins,
expanded literal numeric dc/dcb declarations, ignored comments/labels/aliases,
and compared remaining normalized statements. It did not evaluate conditional
branches or assemble instructions. There were 89 expanded-equivalent commits,
nine requiring additional inspection, and two documentation-only commits.

All nine additional-inspection cases were followed up below. Semantic checks
focused on retained mapping identity, PLC counts/offsets, documented byte ranges,
DMA register data flow, and the Time Attack/Thank You helper descriptions.
Neither this heuristic nor the final builds certifies every semantic name.
The 100 historical commits were not each independently built or emulated.

## Verified findings and corrections

| Origin / scope | Evidence | Correction |
| --- | --- | --- |
| `91ed8423`: R33/R32C “collision geometry metadata” | All 132 bytes exactly match `sprites/r3/kama_kama_2.asm` at family offset `$D8`. The live KamaKama object selects this mapping family; the retained slice begins inside a sprite piece, not at a collision-table boundary. | Rename the binary to `sprites/r3/kama_kama_2_retained_tail.bin`, correct both consumer labels/comments and the inventory/M260 classification, and add identity/schema tests. Binary contents are unchanged. |
| `af50e492` and following R32B milestones | The break-wall tail has two words (4 bytes), six frame bytes, and six longwords (24 bytes): `$22` bytes, not `$16`. The assembler listing agrees. | Correct `$0DEE–$0E0F` and the subsequent 13 ranges through `$0F43`, including ledger M225–M238. The historical validation entries are not claims of newly rerun historical builds. |
| `b8c69d08`, `c43b56bb`: retained PLC selection tables | Repeated offsets refer to the same complete PLC records. Record sizes and boundaries account for the table values without overlapping continuation bytes. | Remove the unsupported explanation that records share continuation bytes. Keep historical literal offsets and pointer identities unchanged. |
| `758e3eed`: retained DMA helper | The wrapper copies 32 longwords, then writes VDP registers 19–23 and command `$55400081`: 64 words from `$FF1980` to VRAM `$5540`. It never saves/restores prior VDP registers. | Correct the DMA description and document timer/index advancement, return values, and copy-path clobbers. Clarify that both helpers animate: one uses per-frame delays, the other a fixed delay. |
| `e7cf222e`: Time Attack destination builder | `$FF3468` selects between base commands `$61840003` and `$61D00003`; `$FF3474` supplies the selected row. This is selection layout, not the game's regional variant. | Correct the entry contract: D7 receives the VRAM command and D0 is preserved. |

### Retained mapping schema

The renamed asset remains a byte-exact historical slice, not a standalone
mapping table. Its offsets are relative to the 132-byte asset:

| Offset | Contents |
| --- | --- |
| `$00–$11` | Tail of Throw: tile-low/X of piece seven, three remaining five-byte pieces, then alignment. |
| `$12–$35` | WatchA: count 7, seven Y/size/tile-high/tile-low/X records. |
| `$36–$69` | WatchB: count 10, ten records, then alignment. |
| `$6A–$83` | Recover: count 5, five records. |

`tools/test_retained_mapping.py` checks every source frame's count/length and
alignment, then reconstructs the exact retained suffix from the structured
source. This establishes content identity and schema; it does not claim the
padding copy itself is used by the live collision or object code.

### Range evidence

The pre-correction Europe listing places R32B Padding 1's first retained label
at `$20F0BC`, break-wall data at `$20FEAA`, the next jump at `$20FECC`,
and the final Signpost prefix at `$20FFF4`. Relative to the first label these
are `$DEE`, `$E10`, and `$F38`. The final 12-byte prefix ends at `$F44`
exclusive. Fresh builds below validate the corrected source without byte changes.

## Additional-inspection cases

| Commit | Follow-up |
| --- | --- |
| `95418ecf` | Six bytes `4E F9 00 20 62 94` become `jmp $206294`, preserving the absolute-long jump. |
| `921ac19f` | Six bytes `4E F9 00 20 63 76` become `jmp $206376`; the instruction is correct, but its documented offset was wrong. |
| `a4c88565` | A second, narrow data encoder resolves relative labels, repetition, alignment, and included assets: both historical forms produce the same 10,752 bytes. |
| `5259ed6c` | The same encoder checks R32C (6,850 bytes) and R32D (6,718 bytes); the repeated layout tables resolve to their former literal offsets. |
| `758e3eed` | Inspect the recovered 68000 wrapper, variable/fixed-delay loops, branch targets, DBRA copy counts, and metadata against the previous encoded words and the pre-existing R11A helper copy. Correct the semantic contract above. |
| `2f1034de` | The data encoder produces the same 298-byte stage/PLC graph suffix on both sides, including all 19 index entries. |
| `44b6aa45` | The shared helper substitution changes the relative table's base-symbol spelling; normalized statements otherwise agree and the same record ordering/base is retained. |
| `cc047df9` | Expanded literal data is identical (12,288 bytes). Additional tokens are the provider's default conditional guards; R53D does not set either prefix-suppression flag. |
| `277f4106` | All three deleted USA map variants expand identically to the surviving provider. All three changed consumers preserve the outer USA/variant guards and non-USA provider. |

No new runtime regression was identified. Shared-provider equivalence and
historical data encoding are narrower claims than a full historical build.

## Validation of corrections

Source base: `906532a4`. The source changes affect Time Attack main
(`ATTACK.MMD`), Collision Chaos retained data (including `R32B__.MMD`,
`R32C__.MMD`, `R33C__.MMD`, `R33D__.MMD`), and the shared USA helper
graph consumed by Palmtree Panic Act 2 and Collision Chaos R32A/R32C/R32D.
The real entry points and regional/variant guards were traced through
`make.sh`, the zone data files, and their shared providers. Full builds check
the complete configured set, including other shared consumers.

Final source-diff SHA-256 (`git diff 906532a4 -- src` before commit):
`312f50630ce095d8fc28234a93447308fefba1d0e14150a05bd58c6fa6bb6ae2`.

| Region | Fresh displayless Proton build | Component comparison |
| --- | --- | --- |
| Japan | Passed | 133/133 match |
| USA | Passed | 133/133 match |
| Europe | Passed | 133/133 match |

All eight regression tests pass (six audit tests and two new mapping tests).
The structural audit reports zero missing or case-mismatched references.
All builds/checks exited successfully on September 4, 2026; build logs report
no errors. `git diff --check` passes and no proprietary originals or generated
outputs are included in the commit.

Logs and isolated outputs: `/tmp/scddisasm-next100-validation.0O2H0E/`.
Every region starts with a fresh `out/`. Temporary triage scripts/results are
under `/tmp/review_201_300*` and `/tmp/review_data_encoder.py`; they are
heuristics, not replacements for the pinned assembler. Temporary artifacts are
not committed and may disappear after reboot. Fresh CHD data-track comparison
remains unavailable because `chdman` and `bchunk` are missing. Component
comparisons are not represented as CHD results.

## Commit triage manifest

“Expanded-equivalent” refers to the initial heuristic described above, not
semantic certification. “Additional inspection” refers to the nine cases above.

| Commit | Triage | Subject |
| --- | --- | --- |
| `b2e155ec` | Expanded-equivalent | Structure R32B camera five PLC |
| `2689da38` | Expanded-equivalent | Structure R32B camera one PLC |
| `69581a3c` | Expanded-equivalent | Structure R32B camera two PLC |
| `13f6e991` | Expanded-equivalent | Structure R32B camera three PLC |
| `04e4fb9e` | Expanded-equivalent | Structure R32B camera four PLC |
| `cd0fcec2` | Expanded-equivalent | Structure R32B camera five PLC |
| `a48ab071` | Expanded-equivalent | Structure R32B graph results PLC |
| `56fea6d1` | Expanded-equivalent | Structure R32B graph signpost PLC |
| `95418ecf` | Additional inspection | Structure R32B historical act three jump |
| `7e78fb6c` | Expanded-equivalent | Structure R32B historical stage descriptor |
| `b8c69d08` | Expanded-equivalent | Structure R32B historical PLC offset table |
| `bfbe9b70` | Expanded-equivalent | Structure R32B historical stage PLC |
| `ee100175` | Expanded-equivalent | Structure R32B historical main PLC |
| `bc8428a4` | Expanded-equivalent | Structure R32B historical section PLC |
| `85319b68` | Expanded-equivalent | Structure R32B historical boss PLC |
| `0442da6f` | Expanded-equivalent | Structure R32B historical results PLC |
| `2ca7f97c` | Expanded-equivalent | Structure R32B historical capsule PLC |
| `af50e492` | Expanded-equivalent | Structure R32B break wall tail |
| `921ac19f` | Additional inspection | Structure R32B historical good future jump |
| `7c42a7dc` | Expanded-equivalent | Structure R32B historical good stage descriptor |
| `c43b56bb` | Expanded-equivalent | Structure R32B good future PLC table |
| `3d8c8293` | Expanded-equivalent | Structure R32B good future stage PLC |
| `0b119768` | Expanded-equivalent | Structure R32B good future main PLC |
| `97edbf6e` | Expanded-equivalent | Structure R32B good future section PLC |
| `edcda7df` | Expanded-equivalent | Structure R32B good future boss PLC |
| `980de062` | Expanded-equivalent | Structure R32B good future results PLC |
| `b0a4c955` | Expanded-equivalent | Structure R32B good future capsule PLC |
| `7a0d9b15` | Expanded-equivalent | Structure R32B demo main PLC tail |
| `edfe2357` | Expanded-equivalent | Structure R32B demo section PLC |
| `c5600cd1` | Expanded-equivalent | Structure R32B demo results PLC |
| `b456c80c` | Expanded-equivalent | Structure R32B demo signpost prefix |
| `a4c88565` | Additional inspection | Share structured R32B padding data |
| `3608d5ed` | Expanded-equivalent | Structure R32B graphics tail |
| `1d9fcac2` | Expanded-equivalent | Structure R32B wobble table |
| `0464cad8` | Expanded-equivalent | Structure R32B robot transport art |
| `fe0aa9f0` | Expanded-equivalent | Structure R32B hologram animals art |
| `e735b91b` | Expanded-equivalent | Structure R32B hologram art |
| `71fa9bd7` | Expanded-equivalent | Classify R32B legacy mapping suffix |
| `e7fc4285` | Expanded-equivalent | Structure R32B legacy animation table |
| `f85c9605` | Expanded-equivalent | Structure R32B secondary mapping table |
| `aee2ce1c` | Expanded-equivalent | Structure R32C Padding 3 suffix |
| `b455d666` | Expanded-equivalent | Structure R32C collision row map |
| `99e51663` | Expanded-equivalent | Structure R32C collision index map |
| `f106ffa2` | Expanded-equivalent | Structure R32C foreground layout |
| `40c02adc` | Expanded-equivalent | Structure R32C fallback layouts |
| `16bacc9e` | Expanded-equivalent | Reuse R32C Wacky suffix |
| `c2564550` | Expanded-equivalent | Structure R32D collision row map |
| `8362ce58` | Expanded-equivalent | Structure R32D collision index map |
| `7af4f31e` | Expanded-equivalent | Structure R32D foreground layout |
| `8bae294a` | Expanded-equivalent | Structure R32D fallback layouts |
| `ea229aad` | Expanded-equivalent | Structure R32D Wacky suffix |
| `dd213863` | Expanded-equivalent | Structure R32D collision column tail |
| `91ed8423` | Expanded-equivalent | Share R33 collision geometry block |
| `5259ed6c` | Additional inspection | Structure R32C D layout pointers |
| `f21fe1f5` | Expanded-equivalent | Share R32C padding tail |
| `a50290c7` | Expanded-equivalent | Share R31C prechunk tail |
| `90fdc1f7` | Expanded-equivalent | Structure R32C PLC prefix |
| `b3c055d7` | Expanded-equivalent | Structure R32D PLC prefix |
| `819015e0` | Expanded-equivalent | Share USA R32C padding tail |
| `028f53bb` | Expanded-equivalent | Structure USA R32C PLC prefix |
| `7c6b3fae` | Expanded-equivalent | Share USA R31C padding stream |
| `ff553af4` | Expanded-equivalent | Share USA retained helper graph |
| `758e3eed` | Additional inspection | Structure retained helper routines |
| `2f1034de` | Additional inspection | Structure retained PLC graph |
| `44b6aa45` | Additional inspection | Reuse USA retained helper graph |
| `92d1686c` | Expanded-equivalent | Share R31C padding suffix |
| `8bcbc90d` | Expanded-equivalent | Share R31C padding with R32A |
| `c313fd33` | Expanded-equivalent | Share R32C padding with R32D |
| `c3579a9a` | Expanded-equivalent | Share R31C padding suffix with R32C |
| `b785c109` | Expanded-equivalent | Share R31C padding with R12D |
| `e1980a3f` | Expanded-equivalent | Structure R12C padding tail |
| `4cca213d` | Expanded-equivalent | Share R12C padding tail with R31C |
| `8b33aea7` | Expanded-equivalent | Share R33C packed padding with R33D |
| `6cf646a9` | Expanded-equivalent | Share R33C pre-chunks with R33D |
| `62dbd26d` | Expanded-equivalent | Share R12C pre-chunks with R12D |
| `d590bf1e` | Expanded-equivalent | Share R31C pre-chunks with R31B |
| `4b212c4d` | Expanded-equivalent | Share R52A pre-chunks with R52B |
| `828f9913` | Expanded-equivalent | Share R52B pre-chunks with R52C and R52D |
| `eed0c29b` | Expanded-equivalent | Share R41 pre-chunks across future variants |
| `e30b8dcb` | Expanded-equivalent | Share Palmtree Panic R13 pre-chunks |
| `cc047df9` | Additional inspection | Share R52 Padding 2 with R53D |
| `12312b2c` | Expanded-equivalent | Share R71A packed prefix data |
| `92512686` | Expanded-equivalent | Share Stardust Speedway Padding 2 tails |
| `3fca4c1d` | Expanded-equivalent | Share non-USA Padding 3 continuation data |
| `95232608` | Expanded-equivalent | Share R72A Padding 2 tail data |
| `3da469a2` | Expanded-equivalent | Share R72A packed prefix with R72C |
| `55b202d5` | Expanded-equivalent | Share R73C Padding 2 with R81 |
| `c6a58796` | Expanded-equivalent | Share USA R41 Padding 1 data |
| `663209e7` | Expanded-equivalent | Share Wacky Workbench Padding 3 bridge |
| `79f1ee1d` | Expanded-equivalent | Share rotation-vector suffixes |
| `5aca34f0` | Expanded-equivalent | Share R72 non-USA continuation |
| `82426a81` | Expanded-equivalent | Share R62 non-USA padding stream |
| `277f4106` | Additional inspection | Share USA Quartz Quadrant object maps |
| `a92d54cb` | Expanded-equivalent | Name Time Attack sync helpers |
| `e7cf222e` | Expanded-equivalent | Name Time Attack transfer helpers |
| `cf9fe18e` | Expanded-equivalent | Name Time Attack period helpers |
| `4f50c95d` | Documentation | Complete Time Attack period milestone |
| `0feb4a23` | Expanded-equivalent | Name Time Attack clock helpers |
| `ae0654a2` | Documentation | Complete Time Attack clock milestone |
| `ef9f86e3` | Expanded-equivalent | Name Thank You display helpers |
