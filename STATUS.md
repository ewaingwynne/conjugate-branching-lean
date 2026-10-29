# Campaign status

Single writer: orchestrator. Proof status is never inferred from compilation alone.

## Phase

- Phase 0 (setup): done
- Phase 1 (anchors): **done** — 15 definitions sealed, 13 root theorems frozen as DRAFT_SORRY (author-approved 2026-10-28)
- Phase 2 (dependency graph): **done** — 199 nodes, 400 edges, 13 roots, 12 external inputs, 56 SOURCE_GAP nodes; every node and coverage item independently REVIEWED; global review PASS after corrections; linter gate (`--require-reviewed … --check`) passes
- Phase 3 (proofs): **done** (2026-10-28) — all 13 theorem anchors sealed and PROVED (AU-1–AU-5); every numbered result mapped in `RESULTS.md`
- Phase 4 (closure): **done** — full gate passes (96 modules), closure audit AU-6 verdict CLOSED (`review/audits/AU-6.md`)

## Mandatory report fields

```text
DRAFT_ANCHORS: 0
UNREGISTERED_SORRIES: 0
DRAFT_IMPORT_VIOLATIONS: 0
SEALED_THIS_TURN: 0 (closure)
SEALED_CUMULATIVE: 13 — all 13 theorem anchors PROVED (AU-1 remark_hypIII_automatic; AU-2 proposition_1_6_fixedPoint; AU-3 proposition_2_1_condLaw, proposition_2_2, theorem_2_7, theorem_1_4_fixedPoint; AU-4 exists_conjugate_iff_exists_fixedPoint, theorem_1_4_conjugate, proposition_1_6_conjugate, remark_hypIII_necessary, example_1_5; AU-5 theorem_3_1, example_3_5); all 28 manifest entries SEALED
```

## Anchors

| Anchor | Kind | File | State | Statement audit | Author | Proof audit |
|--------|------|------|-------|-----------------|--------|-------------|
| `Conjugate.populationMeasurableSpace` | def | `PopulationMeasurableSpace.lean` | SEALED (definition) | PASS (2026-10-28) | R1 | n/a |
| `Conjugate.stepKernel` | def | `StepKernel.lean` | SEALED (definition) | PASS (2026-10-28) | R1 | n/a |
| `Conjugate.pathLaw` | def | `PathLaw.lean` | SEALED (definition) | PASS (2026-10-28) | R1 | n/a |
| `Conjugate.extinctionEvent` | def | `ExtinctionEvent.lean` | SEALED (definition) | PASS (2026-10-28) | R1 | n/a |
| `Conjugate.IsConjugate` | def | `IsConjugate.lean` | SEALED (definition) | PASS (2026-10-28) | R1 | n/a |
| `Conjugate.genFun` | def | `GenFun.lean` | SEALED (definition) | PASS (2026-10-28) | R1 | n/a |
| `Conjugate.meanMatrix` | def | `MeanMatrix.lean` | SEALED (definition) | PASS (2026-10-28) | R1 | n/a |
| `Conjugate.IsSubcritical` | def | `IsSubcritical.lean` | SEALED (definition) | PASS (2026-10-28) | R1 | n/a |
| `Conjugate.IsPositiveRegular` | def | `IsPositiveRegular.lean` | SEALED (definition) | PASS (2026-10-28) | R1 | n/a |
| `Conjugate.IsNonsingular` | def | `IsNonsingular.lean` | SEALED (definition) | PASS (2026-10-28) | R1 | n/a |
| `Conjugate.logGenFun` | def | `LogGenFun.lean` | SEALED (definition) | PASS (2026-10-28) | R1 | n/a |
| `Conjugate.basinZero` | def | `BasinZero.lean` | SEALED (definition) | PASS (2026-10-28) | R1 | n/a |
| `Conjugate.basinInfty` | def | `BasinInfty.lean` | SEALED (definition) | PASS (2026-10-28) | R1 | n/a |
| `Conjugate.truncate` | def | `Truncate.lean` | SEALED (definition) | PASS (2026-10-28) | R1 | n/a |
| `Conjugate.StochDominated` | def | `StochDominated.lean` | SEALED (definition) | PASS (2026-10-28) | approved | n/a |
| `Conjugate.theorem_1_4_fixedPoint` | theorem | `Theorem_1_4_FixedPoint.lean` | **PROVED** (sealed 5e015e1) | PASS (2026-10-28) | approved | AU-3 PASS (2026-10-28) |
| `Conjugate.theorem_1_4_conjugate` | theorem | `Theorem_1_4_Conjugate.lean` | **PROVED** (sealed b7bb629) | PASS (2026-10-28) | approved | AU-4 PASS (2026-10-28) |
| `Conjugate.exists_conjugate_iff_exists_fixedPoint` | theorem | `ExistsConjugateIff.lean` | **PROVED** (sealed b7bb629) | PASS (2026-10-28) | approved | AU-4 PASS (2026-10-28) |
| `Conjugate.proposition_1_6_fixedPoint` | theorem | `Proposition_1_6_FixedPoint.lean` | **PROVED** (sealed d3a4c17) | PASS (2026-10-28) | approved | AU-2 PASS (2026-10-28) |
| `Conjugate.proposition_1_6_conjugate` | theorem | `Proposition_1_6_Conjugate.lean` | **PROVED** (sealed b7bb629) | PASS (2026-10-28) | approved | AU-4 PASS (2026-10-28) |
| `Conjugate.proposition_2_1_condLaw` | theorem | `Proposition_2_1_CondLaw.lean` | **PROVED** (sealed 7581f95) | PASS (2026-10-28) | approved | AU-3 PASS (2026-10-28) |
| `Conjugate.proposition_2_2` | theorem | `Proposition_2_2.lean` | **PROVED** (sealed 7581f95) | PASS (2026-10-28) | approved | AU-3 PASS (2026-10-28) |
| `Conjugate.theorem_2_7` | theorem | `Theorem_2_7.lean` | **PROVED** (sealed 5e015e1) | PASS (2026-10-28) | approved | AU-3 PASS (2026-10-28) |
| `Conjugate.theorem_3_1` | theorem | `Theorem_3_1.lean` | **PROVED** (sealed 260327e) | PASS (2026-10-28) | approved | AU-5 PASS (2026-10-28) |
| `Conjugate.example_1_5` | theorem | `Example_1_5.lean` | **PROVED** (sealed 3ea9ad2) | PASS (2026-10-28) | approved | AU-4 PASS (2026-10-28) |
| `Conjugate.example_3_5` | theorem | `Example_3_5.lean` | **PROVED** (sealed 4d7fe6a) | PASS (2026-10-28) | approved | AU-5 PASS (2026-10-28) |
| `Conjugate.remark_hypIII_necessary` | theorem | `Remark_HypIII_Necessary.lean` | **PROVED** (sealed b7bb629) | PASS (2026-10-28) | approved | AU-4 PASS (2026-10-28) |
| `Conjugate.remark_hypIII_automatic` | theorem | `Remark_HypIII_Automatic.lean` | **PROVED** (sealed a25a4fd) | PASS (2026-10-28) | approved | AU-1 PASS (2026-10-28) |

## Phase 3 work

Lane A = Sonnet writers (sequential); Lane B = Fable (Brouwer). Two agents in total.
Briefs are in `briefs/`. A graph node is PROVED only after writer evidence, orchestrator
checks, and a fresh Sonnet audit.

| Brief | Lane | Target | Graph nodes | State |
|-------|------|--------|-------------|-------|
| W-B1 | B (Fable) | `Conjugate.Infrastructure.brouwer_simplex` | `ext:brouwer` (now proved in-project) | **audited** (AU-2 PASS) |
| W-A1 | A (Sonnet) | `stepKernel` / `pathLaw` characterization, (1.2), `M^n` | `claim:branching-property` (Markov part), `eqn-gen-func-n`, `claim:mean-matrix-powers` | **audited** (AU-1 PASS) |
| W-A2 | A (Sonnet) | branching (convolution), absorption, extinction formulas, subcritical extinction, `M^n → 0`, Neumann vector | `claim:branching-property` (independence), `claim:subcritical-extinction` | **audited** (AU-1 PASS) |
| W-A3 | A (Sonnet) | analytic basics of `f`, `g`; provider for `remark_hypIII_automatic` | `eqn-convex-func-n`, `eqn-fixed-pt-equiv`, `lem-basin-open#g-iter-continuous`, `lem-mono` (part 1), `rem:hyp-iii-automatic` | **audited** (AU-1 PASS); anchor PROVED |
| W-A4 | A (Sonnet) | Lemmas 2.3, 2.4, 2.9 (strict), (2.10), 2.14 | `lem-fixed-pos`, `lem-gf-pos`, `lem-mono#*`, `eqn-infty-subset*`, `lem-basin-closed` | **audited** (AU-2 PASS) |
| W-A5 | A (Sonnet) | Lemmas 2.5, 2.10, 2.11, 2.12 | `lem-gf-bded`, `prop-unstable`, `lem-unstable-scaled`, `lem-unstable-ssl` | **audited** (AU-2 PASS) |
| W-A6 | A (Sonnet) | Lemmas 2.13, 2.15-2.18 | `lem-monotone-lim`, `lem-attractive-*`, `lem-basin-open`, `lem-ray-intersect` | **audited** (AU-2 PASS) |
| W-A8 | B (Sonnet) | Prop 1.6 fixed-point provider + seal | `prop-single-type.fixed-point` and steps | **audited** (AU-2 PASS) |
| W-A7 | A | Thm 2.7 (simplex route) + Thm 1.4 fixed-point providers | `thm-fixed`, `thm-fixed-gf.fixed-point` | written, checked, both anchors sealed (5e015e1); **audited** (AU-3 PASS) |
| W-B2 | B | path-space Markov property, cylinder uniqueness, h-transform; Props 2.1(b), 2.2 providers | `prop-cond-on-ext.cond-law`, `prop-conjugate` | written, checked, both anchors sealed (7581f95); **audited** (AU-3 PASS) |
| W-A9 | any | Example 1.5 provider | `counterexample` and steps | written, checked, anchor sealed (3ea9ad2); **audited** (AU-4 PASS) |
| W-B3 | A (Sonnet) | equivalence (both directions, explicit tilt), Thm 1.4 conj, Prop 1.6 conj, Hyp III necessary, subcriticality criteria | `thm-fixed-gf.equivalence`, `thm-fixed-gf.conjugate`, `prop-single-type.conjugate`, `rem:hyp-iii-necessary` | written, checked, four anchors sealed (b7bb629); **audited** (AU-4 PASS) |
| W-A10 | B (Sonnet) | §3 truncation (3.2), Lemma 3.2, Lemma 3.4 | `eqn-gf-truncated`, `eqn-log-gf-*`, `lem-fixed-limsup`, `lem-1d-soln` | **audited** (AU-5 PASS) |
| W-A11 | B (Fable) | Lemma 3.3, Theorem 3.1 provider + seal | `lem-fixed-liminf`, `thm-fixed-pt-infty` | written, checked, anchor sealed (260327e); **audited** (AU-5 PASS) |
| W-A12 | any | Example 3.5 provider + seal | `example-ctble` | written, checked, anchor sealed (4d7fe6a); **audited** (AU-5 PASS) |
| W-A13 | A (Sonnet) | Lemma 2.19 (deformation retraction) | `lem-retract` and steps | **audited** (AU-6 PASS) |

Known limits (from AU-1): the branching property is proved at the level of generation laws
(cylinder formula, convolution, Chapman–Kolmogorov), not yet as a path-level statement; briefs
for Props 2.1/2.2 must add the path-level Markov property. Theorem-anchor `definition_closure`
lists omit the transitively reached `Defs/StepKernel.lean` (sealed separately; revisit at closure).

Numbering note (AU-2): briefs W-A4–W-A7 and the Section2 Lean docstrings label §2 lemmas off by
one from 2.12 on. Compiled numbering: 2.12 unstable-ssl, 2.13 monotone-lim, 2.14 basin-closed,
2.15 attractive-zero, 2.16 attractive-infty, 2.17 basin-open, 2.18 ray-intersect, 2.19 retract;
display (2.10) is [0,∞]^d∖[0,∞)^d ⊆ S∞. DEPGRAPH, ERRATA and frozen files are correct; Lean
docstring sweep applied (all Internal docstrings now use the compiled numbering).

## Agent log

| Date | Agent | Model | Task | Result |
|------|-------|-------|------|--------|
| 2026-10-28 | extractors A-D | Sonnet ×4 | dependency-graph slice extraction | 48 / 53 / 46 / 52 nodes |
| 2026-10-28 | slice reviewers A-D | Sonnet ×4 | adversarial topology review | 76 node + 9 coverage FAILs, all fixed |
| 2026-10-28 | global reviewer | Sonnet | root-closure review + follow-up | 1 blocking (G1) + 8 fixes; 14/15 follow-up PASS |
| 2026-10-28 | queue reviewer | Sonnet | review of rewritten / orchestrator records + 2 follow-ups | 12 FAILs fixed; all final PASS |
| 2026-10-28 | statement auditor (fresh) | Sonnet | lean-statement-audit of batch 1A definitions | 14/14 PASS; 17 semantic probes proved; 3 author questions |
| 2026-10-28 | statement auditor A (fresh) | Sonnet | batch 1B: Thm 1.4 ×3, Prop 1.6 ×2, Thm 2.7, Ex 1.5, remarks ×2 | 9/9 PASS; found E7 |
| 2026-10-28 | statement auditor B (fresh) | Sonnet | batch 1B: Props 2.1/2.2, Thm 3.1, Ex 3.5, StochDominated | 5/5 PASS; found E8, R6 wording |
| 2026-10-28 | writer W-B1 | Fable | Brouwer on the simplex | done in ~50 min: Kuhn/Sperner parity route, 5 files / 1175 lines, standard axioms |
| 2026-10-28 | writer W-A1 | Sonnet | path-space foundations | 13 public theorems, standard axioms; orchestrator checks pass |
| 2026-10-28 | writer W-A2 | Sonnet | branching, extinction, mean decay | 10 public theorems, standard axioms; orchestrator checks pass |
| 2026-10-28 | writer W-A3 | Sonnet | analytic basics; Hyp III remark provider | 17 public theorems, standard axioms; seal probe OK |
| 2026-10-28 | auditor AU-1 (fresh) | Sonnet | W-A1-A3 node audit + seal audit of remark_hypIII_automatic | PASS, no blocking findings (`review/audits/AU-1.md`) |
| 2026-10-28 | writer W-A4 | Sonnet | §2 positivity layer | 12 public theorems, standard axioms; orchestrator checks pass |
| 2026-10-28 | writer W-A5 | Sonnet | Lemmas 2.5, 2.10, 2.11, 2.12 | 5 public theorems, standard axioms; orchestrator checks pass |
| 2026-10-28 | writer W-A8 | Sonnet | Prop 1.6 fixed-point provider | provider + 21 helpers, standard axioms; seal probe OK |
| 2026-10-28 | writer W-A6 | Sonnet | Lemmas 2.13, 2.15-2.18 | 9 public theorems, standard axioms; orchestrator checks pass |
| 2026-10-28 | writer W-B2 | Sonnet | path space: Markov, uniqueness, h-transform; Props 2.1(b), 2.2 | 14 public decls + 2 providers, standard axioms; seal probes OK |
| 2026-10-28 | auditor AU-2 (fresh) | Sonnet | W-A4..W-A6 nodes, Brouwer, seal of proposition_1_6_fixedPoint | PASS, no blocking findings (`review/audits/AU-2.md`); numbering note |
| 2026-10-28 | writer W-A7 | Sonnet | Thm 2.7 via Brouwer on the simplex (phase 1) | provider + 8 helpers, standard axioms; seal probe OK; phase 2 (Thm 1.4 fp, 3 lines) by orchestrator |
| 2026-10-28 | writer W-B3 | Sonnet | equivalence, Thm 1.4 conj, Prop 1.6 conj, Hyp III necessary | 4 providers + criteria, standard axioms; seal probes OK |
| 2026-10-28 | writer W-A10 | Sonnet | §3 truncation layer, Lemmas 3.2, 3.4 | 8 public theorems, standard axioms; orchestrator checks pass |
| 2026-10-28 | writer W-A11 | Fable | Lemma 3.3, Theorem 3.1 | done in ~13 min: provider + 2 API theorems, standard axioms; seal probe OK |
| 2026-10-28 | writer W-A9 | Sonnet | Example 1.5 | provider + helpers, standard axioms; seal probe OK |
| 2026-10-28 | auditor AU-3 (fresh) | Sonnet | path space, Thm 2.7 assembly, 4 seals | PASS, no blocking findings (`review/audits/AU-3.md`); composition witness on Ex 1.5 law |
| 2026-10-28 | auditor AU-4 (fresh) | Sonnet | W-B3 four seals, Example 1.5 seal | PASS, no blocking findings (`review/audits/AU-4.md`) |
| 2026-10-28 | writer W-A12 | Sonnet | Example 3.5 | provider + 41 helpers, standard axioms; seal probe OK |
| 2026-10-28 | auditor AU-5 (fresh) | Sonnet | §3, Thm 3.1 and Ex 3.5 seals | PASS, no blocking findings (`review/audits/AU-5.md`); non-vacuity witness for Ex 3.5 |
| 2026-10-28 | writer W-A13 | Sonnet | Lemma 2.19 | done, standard axioms |
| 2026-10-28 | auditor AU-6 (fresh) | Sonnet | Phase 4 full-closure audit | CLOSED, no blocking findings (`review/audits/AU-6.md`) |
