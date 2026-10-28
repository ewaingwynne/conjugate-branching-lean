# Campaign status

Single writer: orchestrator. Proof status is never inferred from compilation alone.

## Phase

- Phase 0 (setup): done
- Phase 1 (anchors): batch 1A (14 definitions) **frozen** (R1); batch 1B (roots) being finalized per R2–R4

## Mandatory report fields

```text
DRAFT_ANCHORS: 0
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

## Agent log

| Date | Agent | Model | Task | Result |
|------|-------|-------|------|--------|
| 2026-10-28 | statement auditor (fresh) | Sonnet | lean-statement-audit of batch 1A definitions | 14/14 PASS; 17 semantic probes proved; 3 author questions |
