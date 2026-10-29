# Audit AU-7 — seal audits of the five batch-2 anchors (countable-type conjugates)

**Role.** You are a fresh, independent auditor. Work refute-first, following
`~/.claude/skills/lean-statement-audit/SKILL.md`.
- Read-only. Scratch files go under `.lake/probes/au7/`; compile them with
  `-DautoImplicit=false -DrelaxedAutoImplicit=false`, and delete them afterwards.
- No commits. Never run `lake build` with no target.

**Context.** Read:
- `CLAUDE.md`;
- `ERRATA.md`: R8, E10, and R6, R7, E6, E8;
- `review/batch-2.md`, the approved exact bytes;
- `review/audits/AU-B2-statement.md`, the pre-approval audit;
- `briefs/W-B4-countable-conjugates.md`.

Source: `source/arxiv-2411.06301v2/fixed-pt-finite-type.tex`, especially L928-934, L958-959 and
L1183.

```bash
export PATH="$HOME/.elan/bin:$HOME/.local/bin:$PATH"
```

## Part A — seal audits (checks 1-6 each, as in `review/audits/AU-1.md` Part A)

The anchors (frozen files in `Conjugate/Frozen/`, providers in `Conjugate/Internal/`):
- `proposition_2_1_condLaw_countable`;
- `proposition_2_2_countable`;
- `exists_conjugate_iff_exists_fixedPoint_countable`;
- `theorem_3_1_conjugate`;
- `example_3_5_conjugate`.

For each:
1. **Bytes.** The frozen file equals the approved bytes in `review/batch-2.md`, except for the
   one proof-body line. The freeze commit is `e731893`. Use `git diff e731893 HEAD`.
2. **ABI.** Run `verify-abi`.
3. **Fidelity.** Already audited in AU-B2. Re-confirm the binder table quickly.
4. **No smuggled steps.** Check `rfl` between the frozen and provider statements.
5. **Content.** It is genuine and non-vacuous. Instantiate each on a concrete countable law, for
   example an iid type law with a two-point offspring count.
   - #4 and #5 must not assume positive regularity of `X`. Check that their providers do not
     route through the frozen #2 or #3, which carry `hpr`/`hns`.
   - Check that the direction "fixed point ⇒ conjugate" uses no regularity.
6. **Axioms.**

## Part B — node audit

Files: `Conjugate/Internal/Countable/*.lean`. Check the public theorems
`isConjugate_of_fixedPoint_nat`, `exists_fixedPoint_of_isConjugate_nat`,
`exists_fixedPoint_of_isConjugate_countable`, `Conjugacy.exists_tilt_condLaw` and
`Conjugacy.exists_tilt_of_fixedPoint`. For each:
- the brief match;
- faithfulness to the graph nodes in `graph/packets/slice-E.md`;
- no hidden assumptions;
- no import of a DRAFT module (there should be none left).

## Part C — gate

Run `tools/check.sh`, which builds everything, and report the result.

## Report format

```text
PART A: per anchor PASS | FAIL — checks 1-6
PART B: per theorem PASS | FAIL | NOTE
PART C: gate output
Blocking findings / Non-blocking notes / Commands run
```
