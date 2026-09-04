# September 4 semantic correction validation

These corrections address the concrete errors found in the review. They do
not certify the semantics of the rest of the disassembly.

## Scope and semantic evidence

- Time Attack startup writes to `IOCTRL1`, `IOCTRL2`, `IOCTRL3`, and `IODATA1`,
  as defined in `_Include/Main CPU.inc`. The surrounding helpers request and
  release the Z80 bus; the I/O writes themselves are not Z80 bank controls.
  Explicit `.l` addressing is preserved.
- Enigma's input pointer is A0 and its output pointer is A1. Its exit aligns
  A0 and restores D0-D7/A1-A5. The input-alignment name and entry contract now
  reflect this data flow.
- Kosinski accumulates the short-match length in D3 and reads the displacement
  into D2. Names distinguish the encoding selector, length bits, and distance.
- Shared stage music indexes rows by zone and columns by time period, adding
  `good_future` only to Future outside Time Attack.
- Thank You selects its timer tables by runtime byte `$FFFFBA7B`, which the
  interrupt handler mutates. Its full meaning remains explicitly unresolved.
- Shared lifetime helpers discard their own return address on suppression
  paths. Their comments now warn that the calling object routine does not resume.
- Five checkpoint-art references now match the tracked `Art.nem` spelling.

True standalone outputs include `ATTACK.MMD` and `THANKS_M.MMD`. The changed
shared fragments also feed level entry graphs (including demo variants), so
validation uses the full regional frontends rather than assembling fragments.

## Tested source snapshot

Base commit: `96988bfaf0771b19c5266fd722094bbea30b4f50`.

SHA-256 of `git diff 96988bfaf0771b19c5266fd722094bbea30b4f50 -- src`
before committing the corrections:

`f0f3070b0acb1bd7694e1f550f66a42bd5f239c104f149128eb4657d1ace73db`

The intervening review-guidance commit changes documentation only. Builds ran
in `/tmp/scddisasm-review.iCtLdy`, using the checked-in tools through the
displayless Steam Proton Experimental runner. Each region started with a
fresh `out/`; local originals were accessed through ignored symlinks.

| Region | Full build | Component comparison |
| --- | --- | --- |
| Japan (`REGION=0`) | Exit 0 | 133/133; exit 0 |
| USA (`REGION=1`) | Exit 0 | 133/133; exit 0 |
| Europe (`REGION=2`) | Exit 0 | 133/133; exit 0 |

Build/check logs and preserved outputs are under
`/tmp/scddisasm-validation.9koXQU/`. The first Japan run also matched all 133
components; its separately named logs precede the five case-only path fixes.
Temporary artifacts are not committed and may disappear after reboot.

The ISO is built by each frontend. Fresh CHD data-track comparisons were not
run: `chdman` and `bchunk` are unavailable on this host. Component matches are
not reported as CHD verification.

No assembler errors were found in the build logs or the final generated
assembler `.log` files. Existing sign-extension warnings remain unchanged.

## Structural checks

Six regression tests pass, covering missing assets, case mismatches in source
and assets, generated-file exceptions, binary files not being traversed as
assembly, exit status, and numbered-routine debt metrics.

The strengthened audit reports zero missing literal includes/assets, zero case
mismatches, and no component coverage gaps. It also reports 1,099 numbered
routine labels; this is remaining review debt, not a new failure threshold.

Tested audit SHA-256:
`d3cac54e82565f3a0d99872c1d399a6accadb0c84200f5b868ed32841b6b4969`

Tested regression-test SHA-256:
`a5e76eef98a8424fa63563097c9889383a87ce4456079bbc92f21f2036846ffa`
