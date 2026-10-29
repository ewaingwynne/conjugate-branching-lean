# Audit AU-3 — path space (W-B2), Theorem 2.7 assembly (W-A7), and four seals

**Role.** You are a fresh, independent auditor. Work **refute-first**.
- Compilation is not a fidelity verdict.
- Read-only: edit nothing under `Conjugate/`, nor any of `frozen-anchor-manifest.json`,
  `DEPGRAPH*.md`, `STATUS.md`, `ERRATA.md`, `PLAN.md`, `briefs/`, `tools/` or the lake
  configuration.
- Scratch Lean files go under `.lake/probes/au3/`. Compile them with the lakefile options: a bare
  `lake env lean` ignores `autoImplicit false`, so pass
  `-DautoImplicit=false -DrelaxedAutoImplicit=false` or use a module target. Delete them
  afterwards.
- No commits.

Workflow skill: `~/.claude/skills/lean-statement-audit/SKILL.md`. Read it first.

**Context.** Read:
- `CLAUDE.md`;
- `PLAN.md` §6 (approved routes: Prop 2.2 and the Thm 1.4 equivalence as a Doob h-transform on
  cylinders, without formalizing [JL08] or [AN72]; Thm 2.7 by Brouwer on the simplex, without
  the annulus);
- `ERRATA.md` (R3, R6);
- the earlier audits in `review/audits/`.

Source: `source/arxiv-2411.06301v2/fixed-pt-finite-type.tex`.

```bash
export PATH="$HOME/.elan/bin:$HOME/.local/bin:$PATH"
```

## Part A — seal audits

Four anchors are now SEALED:
- `Conjugate.proposition_2_1_condLaw`, provider `Conjugate/Internal/Proposition_2_1_CondLaw.lean`;
- `Conjugate.proposition_2_2`, provider `Conjugate/Internal/Proposition_2_2.lean`;
- `Conjugate.theorem_2_7`, provider `Conjugate/Internal/Theorem_2_7.lean`, built on
  `Conjugate/Internal/Section2/Assembly{Ray,Map}.lean`;
- `Conjugate.theorem_1_4_fixedPoint`, provider `Conjugate/Internal/Theorem_1_4_FixedPoint.lean`.
  This provider imports the sealed frozen `Conjugate.Frozen.Theorem_2_7`.

For **each**, verify with explicit verdicts (as in `review/audits/AU-1.md` Part A):
1. **Bytes.** Only the proof-body line changed since the freeze commit `0a46d78`. Use the checker
   and `git diff`.
2. **ABI.** Run `verify-abi`.
3. **Fidelity.** Compare to the source and rulings, classifying every binder. For the
   conditional-law statements, check `ProbabilityTheory.cond` semantics: `P[|s]` is
   `(P s)⁻¹ • P.restrict s`.
4. **No smuggled steps.** The provider type equals the frozen type, and no hard step is a
   hypothesis.
5. **Content.**
   - The h-transform argument is genuine. `tilt` is a genuine `PMF`, not a junk default.
   - `measure_eq_of_cylinder` really proves equality of measures on the full product σ-algebra.
   - `pathLaw_cylinder_inter_shift` is a correct Markov property.
   - The Theorem 2.7 assembly applies `Conjugate.Infrastructure.brouwer_simplex` to a genuinely
     continuous self-map of the simplex, and the fixed point it produces is a genuine fixed point
     of `logGenFun μ` in `(0,∞)^d`.
   - No result from [JL08] or [AN72] is silently assumed.
6. **Axioms.** For all four exports.

## Part B — node audit of the internal API

The files are `Conjugate/Internal/PathSpace/*.lean` (brief `briefs/W-B2-path-space-h-transform.md`)
and `Conjugate/Internal/Section2/Assembly{Ray,Map}.lean` (brief `briefs/W-A7-theorem-2-7.md`).

For each public theorem named in the W-B2 brief, and for the main assembly lemmas
(`rayParam`, `continuousOn_rayParam`, `lt_rayParam_iff`, `rayParam_lt_iff`,
`continuousOn_simplexMap`, `simplexMap_mem`, `exists_logGenFun_rayPt_eq`):
1. The brief match is exact, or a harmless generalization.
2. The statement means what the `DEPGRAPH.md` node(s) it serves say. Flag weaker-than-needed
   forms or wrong objects.
3. There are no hidden assumptions, no `sorry`/axioms (probe), and no imports of DRAFT anchors
   or quarantined providers. Run the anchor checker.
4. **Definitions.** Check every new definition for faithfulness (`tilt`, `rayParam`, `rayPt`,
   `toE`, `simplexMap`, `cylinders`, …). A choice from an `∃!` is legitimate. A choice from a
   mere `∃` that leaks into a statement would be a FAIL.

**Route deviations to confirm.** Record each, and confirm it is approved or purely internal:
- the h-transform in place of [JL08] Thm 1;
- the extinction probability of `X̂` computed from generation-`n` laws, in place of [AN72];
- continuity of the ray parameter via open basins, in place of the paper's
  compactness/homeomorphism argument;
- Brouwer on the simplex, in place of the annulus.

## Report format

```text
PART A: per anchor, PASS | FAIL — checks 1-6 with evidence
PART B: per theorem / definition: PASS | FAIL | NOTE — reason
Route deviations: list with verdicts
Blocking findings: <list, or none>
Non-blocking notes: <list>
Commands run: <exact commands with output excerpts>
```
