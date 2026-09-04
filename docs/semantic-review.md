# Semantic review and remaining debt

Use this alongside the remediation plan when selecting and reviewing work.
Byte equality verifies reconstruction. It cannot verify a name, comment,
record schema, or calling convention.

## Acceptance criteria for a routine family

1. Trace the real entry points, regional switches, callers, and table consumers.
2. Check hardware addresses against `_Include` definitions. Use known symbols
   while preserving explicit addressing widths and emitted bytes.
3. Follow register data flow before naming operations. Distinguish input from
   output pointers, lengths from displacements, and runtime states from regions.
4. Document important entry contracts: inputs, outputs, clobbers, object-field
   meanings, side effects, and unusual return/stack behavior. Mark unknowns as
   unresolved instead of choosing a plausible but unsupported name.
5. Explain dispatch states and record layouts, including counts, terminators,
   bounds, signedness, and field reuse where relevant. A renamed table alone
   does not classify its contents.
6. Review nearby copies and consumers for the same mistake. Keep routine-local
   labels local where compatible with the existing graph. Do not manufacture
   a global semantic label for every instruction merely to lower a metric.
7. Run the required regional builds/comparisons and structural audit. Record
   semantic review evidence separately from the byte-comparison result.

## Reporting and validation evidence

Describe each milestone as label cleanup, semantic review, data classification,
or graph consolidation (several may apply). For label cleanup, explicitly list
what remains unreviewed. Do not label a component semantically complete until
all eight criteria in the remediation plan are satisfied.

Keep build/check logs in ignored output or a temporary validation directory.
Record the base commit and a hash of the tested source diff when validating
uncommitted work, regions and switches, runner, process exit statuses, and
comparison totals. Distinguish freshly built outputs from pre-existing output
comparisons. Record a separate result for CHD data-track comparison; component
equality does not substitute for it. Never commit logs, originals, or binaries.

`python3 tools/audit_disassembly.py --check` checks structural coverage and
literal include/incbin path existence and case. Known generated files are
exempt from existence checks. It scans the union of textual branches, not an
evaluated assembler graph, and does not resolve macro-generated paths. Its
address-label and numbered-routine counts are debt indicators, not semantic
correctness checks. Run its regression tests with:

```sh
python3 -m unittest discover -s tools -p 'test_*.py'
```

## Bounded follow-up review

Finish these scopes before another broad label-renaming pass. Each is a review
task, not an instruction to alter game behavior or relax binary validation.

| Scope | Remaining work | Evidence to record |
| --- | --- | --- |
| Time Attack startup and hardware helpers | Review the remaining per-instruction names and numeric hardware operands; consolidate only unneeded labels after checking references. | Hardware definitions and the purpose of each register write. |
| Shared Enigma/Nemesis/Kosinski decoders | Review mode handlers and refill names; explain header fields, termination, and decoding state. Enigma still has `Sub0`/`Sub4`/etc. | Register roles, mode schemas, input/output contracts, and callers. |
| Wacky Workbench Freezer | Replace numbered lifecycle states with verified names and document reused object fields, parent links, freeze/release behavior. | Dispatch transitions and field reads/writes across parent and child states. |
| Thank You timer dispatch | Recover the meaning of `$FFFFBA7B`; separate the relative-offset table and encoded handler bodies currently grouped under `ThankYou_ObjectTimerJumpTable`. | State writers, timer consumers, exact table bounds, and executable targets. |
| Shared object lifetime helpers | Review helper clobbers and all callers of the paths that discard a return address. | Stack contract and whether each caller resumes or exits. |

The controller-I/O names, Enigma input alignment, Kosinski short-match length,
shared music-table order, and unsupported Thank You regional descriptions were
identified by the September 4 review. Correcting these examples does not certify
all earlier names. The component inventory continues to carry the broader
data-classification and graph-consolidation debt.
