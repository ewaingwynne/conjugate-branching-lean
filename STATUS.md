# Campaign status

Single writer: orchestrator. Proof status is never inferred from compilation alone.

## Phase

- Phase 0 (setup): done
- Phase 1 (anchors): **done** — 15 definitions sealed, 13 root theorems frozen as DRAFT_SORRY (author-approved 2026-10-28)
- Phase 2 (dependency graph): **done** — 199 nodes, 400 edges, 13 roots, 12 external inputs, 56 SOURCE_GAP nodes; every node and coverage item independently REVIEWED; global review PASS after corrections; linter gate (`--require-reviewed … --check`) passes
- Phase 3 (proofs): not started

## Mandatory report fields

```text
DRAFT_ANCHORS: 13 (Conjugate/Frozen/*.lean theorem anchors, all FROZEN_UNPROVED)
UNREGISTERED_SORRIES: 0
DRAFT_IMPORT_VIOLATIONS: 0
SEALED_THIS_TURN: 0
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
| `Conjugate.remark_hypIII_automatic` | theorem | `Remark_HypIII_Automatic.lean` | DRAFT_SORRY (FROZEN_UNPROVED) | PASS (2026-10-28) | approved | — |

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
