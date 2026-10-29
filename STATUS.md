# Campaign status

Single writer: orchestrator. Proof status is never inferred from compilation alone.

## Phase

- Phase 0 (setup): done
- Phase 1 (anchors): **done** — 15 definitions sealed, 13 root theorems frozen as DRAFT_SORRY (author-approved 2026-10-28)
- Phase 2 (dependency graph): **done** — 199 nodes, 400 edges, 13 roots, 12 external inputs, 56 SOURCE_GAP nodes; every node and coverage item independently REVIEWED; global review PASS after corrections; linter gate (`--require-reviewed … --check`) passes
- Phase 3 (proofs): **in progress** (started 2026-10-28) — see "Phase 3 work" below

## Mandatory report fields

```text
DRAFT_ANCHORS: 12 (Conjugate/Frozen/*.lean theorem anchors except Remark_HypIII_Automatic; all FROZEN_UNPROVED)
UNREGISTERED_SORRIES: 0
DRAFT_IMPORT_VIOLATIONS: 0
SEALED_THIS_TURN: 1 (Conjugate.remark_hypIII_automatic, a25a4fd; PROVED after AU-1)
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
| `Conjugate.theorem_1_4_fixedPoint` | theorem | `Theorem_1_4_FixedPoint.lean` | DRAFT_SORRY (FROZEN_UNPROVED) | PASS (2026-10-28) | approved | — |
| `Conjugate.theorem_1_4_conjugate` | theorem | `Theorem_1_4_Conjugate.lean` | DRAFT_SORRY (FROZEN_UNPROVED) | PASS (2026-10-28) | approved | — |
| `Conjugate.exists_conjugate_iff_exists_fixedPoint` | theorem | `ExistsConjugateIff.lean` | DRAFT_SORRY (FROZEN_UNPROVED) | PASS (2026-10-28) | approved | — |
| `Conjugate.proposition_1_6_fixedPoint` | theorem | `Proposition_1_6_FixedPoint.lean` | DRAFT_SORRY (FROZEN_UNPROVED) | PASS (2026-10-28) | approved | — |
| `Conjugate.proposition_1_6_conjugate` | theorem | `Proposition_1_6_Conjugate.lean` | DRAFT_SORRY (FROZEN_UNPROVED) | PASS (2026-10-28) | approved | — |
| `Conjugate.proposition_2_1_condLaw` | theorem | `Proposition_2_1_CondLaw.lean` | DRAFT_SORRY (FROZEN_UNPROVED) | PASS (2026-10-28) | approved | — |
| `Conjugate.proposition_2_2` | theorem | `Proposition_2_2.lean` | DRAFT_SORRY (FROZEN_UNPROVED) | PASS (2026-10-28) | approved | — |
| `Conjugate.theorem_2_7` | theorem | `Theorem_2_7.lean` | DRAFT_SORRY (FROZEN_UNPROVED) | PASS (2026-10-28) | approved | — |
| `Conjugate.theorem_3_1` | theorem | `Theorem_3_1.lean` | DRAFT_SORRY (FROZEN_UNPROVED) | PASS (2026-10-28) | approved | — |
| `Conjugate.example_1_5` | theorem | `Example_1_5.lean` | DRAFT_SORRY (FROZEN_UNPROVED) | PASS (2026-10-28) | approved | — |
| `Conjugate.example_3_5` | theorem | `Example_3_5.lean` | DRAFT_SORRY (FROZEN_UNPROVED) | PASS (2026-10-28) | approved | — |
| `Conjugate.remark_hypIII_necessary` | theorem | `Remark_HypIII_Necessary.lean` | DRAFT_SORRY (FROZEN_UNPROVED) | PASS (2026-10-28) | approved | — |
| `Conjugate.remark_hypIII_automatic` | theorem | `Remark_HypIII_Automatic.lean` | **PROVED** (sealed a25a4fd) | PASS (2026-10-28) | approved | AU-1 PASS (2026-10-28) |

## Phase 3 work

Lane A = Sonnet writers (sequential); Lane B = Fable (Brouwer). Two agents in total.
Briefs are in `briefs/`. A graph node is PROVED only after writer evidence, orchestrator
checks, and a fresh Sonnet audit.

| Brief | Lane | Target | Graph nodes | State |
|-------|------|--------|-------------|-------|
| W-B1 | B (Fable) | `Conjugate.Infrastructure.brouwer_simplex` | `ext:brouwer` (now proved in-project) | written, orchestrator-checked (2ed2e19); audit pending |
| W-A1 | A (Sonnet) | `stepKernel` / `pathLaw` characterization, (1.2), `M^n` | `claim:branching-property` (Markov part), `eqn-gen-func-n`, `claim:mean-matrix-powers` | **audited** (AU-1 PASS) |
| W-A2 | A (Sonnet) | branching (convolution), absorption, extinction formulas, subcritical extinction, `M^n → 0`, Neumann vector | `claim:branching-property` (independence), `claim:subcritical-extinction` | **audited** (AU-1 PASS) |
| W-A3 | A (Sonnet) | analytic basics of `f`, `g`; provider for `remark_hypIII_automatic` | `eqn-convex-func-n`, `eqn-fixed-pt-equiv`, `lem-basin-open#g-iter-continuous`, `lem-mono` (part 1), `rem:hyp-iii-automatic` | **audited** (AU-1 PASS); anchor PROVED |
| W-A4 | A (Sonnet) | Lemmas 2.3, 2.4, 2.9 (strict), (2.8), 2.18 | `lem-fixed-pos`, `lem-gf-pos`, `lem-mono#*`, `eqn-infty-subset*`, `lem-basin-closed` | written, orchestrator-checked (6c5f35d); audit pending |
| W-A5 | A (Sonnet) | Lemmas 2.5, 2.10, 2.11, 2.13 | `lem-gf-bded`, `prop-unstable`, `lem-unstable-scaled`, `lem-unstable-ssl` | running |
| W-A6 | A (Sonnet) | Lemmas 2.12, 2.14-2.17 | `lem-monotone-lim`, `lem-attractive-*`, `lem-basin-open`, `lem-ray-intersect` | brief ready |
| W-A8 | B (Sonnet) | Prop 1.6 fixed-point provider + seal | `prop-single-type.fixed-point` and steps | running |
| W-A7 | A | Thm 2.7 (simplex route) + Thm 1.4 fixed-point providers | `thm-fixed`, `thm-fixed-gf.fixed-point` | brief ready (after W-A6) |

Known limits (from AU-1): the branching property is proved at the level of generation laws
(cylinder formula, convolution, Chapman–Kolmogorov), not yet as a path-level statement; briefs
for Props 2.1/2.2 must add the path-level Markov property. Theorem-anchor `definition_closure`
lists omit the transitively reached `Defs/StepKernel.lean` (sealed separately; revisit at closure).

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
| 2026-10-28 | writer W-A5 | Sonnet | Lemmas 2.5, 2.10, 2.11, 2.13 | running |
| 2026-10-28 | writer W-A8 | Sonnet | Prop 1.6 fixed-point provider | running |
