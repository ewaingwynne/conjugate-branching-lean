# Audit AU-4 — equivalence and conjugate forms (W-B3), Example 1.5 (W-A9): seal audits

**Role.** You are a fresh, independent auditor. Work **refute-first**.
- Compilation is not a fidelity verdict.
- Read-only: edit nothing under `Conjugate/`, nor any of `frozen-anchor-manifest.json`,
  `DEPGRAPH*.md`, `STATUS.md`, `ERRATA.md`, `PLAN.md`, `briefs/`, `tools/` or the lake
  configuration.
- Scratch Lean files go under `.lake/probes/au4/`. Compile them with the lakefile options
  (`-DautoImplicit=false -DrelaxedAutoImplicit=false`, or a module target). Delete them afterwards.
- No commits.

Workflow skill: `~/.claude/skills/lean-statement-audit/SKILL.md`. Read it first.

**Context.** Read:
- `CLAUDE.md`;
- `PLAN.md` §6;
- `ERRATA.md`: R3 (Thm 1.4 split), R4 (Ex 1.5 "at least three"), R5 and E7 (Prop 1.6), E1;
- the earlier audits in `review/audits/`.

Source: `source/arxiv-2411.06301v2/fixed-pt-finite-type.tex`. `Conjugate/Frozen/Defs/IsConjugate.lean`
is the frozen Definition 1.1.

```bash
export PATH="$HOME/.elan/bin:$HOME/.local/bin:$PATH"
```

## Part A — seal audits (as in `review/audits/AU-1.md` Part A, checks 1-6 for each)

The anchors, each with its provider file in `Conjugate/Internal/`:
- `Conjugate.exists_conjugate_iff_exists_fixedPoint` (paper.tex:238);
- `Conjugate.theorem_1_4_conjugate` (paper.tex:241-250);
- `Conjugate.proposition_1_6_conjugate` (paper.tex:343-356). The conclusion is existence **and**
  uniqueness in law of `ℙ̂` started from one individual.
- `Conjugate.remark_hypIII_necessary` (paper.tex:252). Check the constants, the law (point masses
  `b` at `0` and `a m⁻³` at `m ≥ 1`), Hyps I–II, `f = ∞` on `(1,∞)`, and that no conjugate exists.
- `Conjugate.example_1_5` (paper.tex:255-262), **if** it is SEALED in the manifest when you
  start. Otherwise skip it and say so.

For each, verify:
1. **Bytes.** Only the body line changed since `0a46d78`.
2. **ABI.** Run `verify-abi`.
3. **Fidelity.** Classify every binder, and check the semantics of `IsConjugate`.
4. **No smuggled steps.**
5. **Content.** It is genuine and non-vacuous. For the remark, the example must really be a
   probability law with the stated masses.
6. **Axioms.**

## Part B — node audit

The files are:
- `Conjugate/Internal/Analytic/Subcritical.lean`;
- `Conjugate/Internal/Conjugacy/*.lean`;
- `Conjugate/Internal/Examples/*.lean`.

The briefs are `briefs/W-B3-equivalence-conjugates.md` and `briefs/W-A9-example-1-5.md`.

For each public theorem named in those briefs:
1. The brief match is exact, or a harmless generalization.
2. It is faithful to the graph node and the paper.
3. There are no hidden assumptions, no `sorry`/axioms, and no DRAFT imports. Run the checker.

**Route deviation to confirm.** "Conjugate ⇒ fixed point" reads the tilt off generation 1 by
the time-1 Markov property, instead of applying Prop 2.1 to `X̂`. It is approved. Confirm that
it is sound, and that the graph leaf `thm-fixed-gf.equivalence#conjugate-regularity` is
therefore not needed.

**Specific checks.**
- `isSubcritical_of_sum_lt_one` uses the operator norm only as a local or scoped instance. It must
  not change the meaning of the frozen `IsSubcritical`, whose spectrum is algebraic.
- For `isSubcritical_fin_one_iff`, check both directions.
- For Example 1.5: are the three fixed points genuinely distinct and in `(1,∞)²`? Is the
  generating-function identification from the four point masses correct?

## Report format

```text
PART A: per anchor, PASS | FAIL | SKIPPED — checks 1-6 with evidence
PART B: per theorem: PASS | FAIL | NOTE — reason
Route deviation: verdict
Blocking findings: <list, or none>
Non-blocking notes: <list>
Commands run: <exact commands with output excerpts>
```
