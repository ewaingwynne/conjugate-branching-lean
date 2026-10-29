# AU-6 — Phase 4 closure audit (fresh Sonnet auditor, 2026-10-28)

Brief: `briefs/AU-6-closure.md`. Audited at HEAD 2a5d6ea, with a clean tree.

**Closure verdict: CLOSED.** There are no blocking findings.

| Check | Verdict | Evidence |
|---|---|---|
| 1. Build and gate | PASS | `tools/check.sh`: 6930 jobs, 96 modules, guard OK, ABI OK (28). All 96 files independently recompiled from source. 7 warnings: 6 are the accepted unused source hypotheses (`hpr`, `hns`); 1 is a long line in a frozen docstring. |
| 2. Frozen surface | PASS | All 28 entries are SEALED. Each of the 13 theorem files has a one-line body diff against 0a46d78. The 15 definition files are byte-identical to their freeze commits. Only `state` changed in the manifest. Pins are unchanged. |
| 3. Axioms | PASS | The 13 frozen exports and 12 internal lemmas use the standard axioms only. The union of axioms over all 725 project constants is `{propext, Classical.choice, Quot.sound}`. |
| 4. Placeholders | PASS | 0 hits for every forbidden construct. Every file is a `module` of at most 449 lines. |
| 5. Lemma 2.19 | PASS | The statement is `Expr ==` to the brief. It is a genuine strong deformation retraction in the sup norm. Non-vacuity: instantiated on the Example 1.5 law. |
| 6. `RESULTS.md` | PASS | All 62 names exist in the named modules. Fidelity was checked row by row for Lemmas 2.3-2.5, 2.9-2.18, 3.2-3.4 and (1.2), (1.3). None is weaker than the paper. |
| 7. Coverage | NOTE | Every theorem-like unit of §1-§3 is mapped. The "not formalized" list was shorter than the coverage file's exclusions (now completed). |
| 8. Route deviations | PASS | All are approved or confirmed in AU-2 to AU-5. Lemma 2.19's route was not listed (now added). No statement is changed. |
| 9. Docstring numbering | PASS | All docstrings match the compiled PDF numbering. The briefs keep the old numbers by design. |
| 10. Rulings | PASS | Every cited ruling (R1-R7, E1-E4, E6-E9) is in `ERRATA.md`. None is open, and none was rewritten. |

## Non-blocking notes and disposition

1. **`definition_closure` metadata.** In 11 of the 13 theorem entries it omits `Defs/StepKernel.lean`.
   That file is its own SEALED entry and is covered by `verify-abi`. A fix needs an author ruling;
   it is reported to the author.
2. **Long-line style warning** in the frozen `Remark_HypIII_Automatic.lean` docstring. Frozen bytes
   need an author ruling to change. Reported.
3. **`RESULTS.md` housekeeping.** Done: exclusions completed, and the Lemma 2.19 and 2.18 notes added.
4. **Stale status text** in `PLAN.md` and `STATUS.md`. Done.
5. **Paper indexing in the frozen Example 3.5 docstring.** Known (AU-5). No action.
6. **Generic helper names.** Cosmetic.
