# AU-1 — audit report (fresh Sonnet auditor, 2026-10-28)

Brief: `briefs/AU-1-foundations-and-first-seal.md`. Commit audited: a25a4fd.

## Part A — seal audit of `Conjugate.remark_hypIII_automatic` (`thm.remark_hypIII_automatic.v1`): PASS

1. **Bytes: PASS.**
   - The anchor checker passes (`FROZEN-ANCHOR GUARD OK`).
   - Since 0a46d78 the only change to the frozen file is the proof-body line.
   - The auditor recomputed the prefix and suffix sha256 and they match the manifest.
   - In the manifest, only `state` changed (`DRAFT_SORRY` → `SEALED`).
2. **ABI: PASS.** `verify-abi` gives `ABI OK (28 anchors)`, and the graph's `FROZEN_ABI_SHA256` matches.
3. **Fidelity: PASS.**
   - Binders: SOURCE 3 (`hpr`, `hns`, `hfin`), TYPING 2 (`d`, `μ`), EXCESS 0. The conclusion ranges over `k ∈ Fin d` (E1).
   - The topology is the product of the `ℝ≥0∞` order topologies, so the domain is `(0,∞]^d`.
4. **No smuggled steps: PASS.** The provider and frozen headers are identical, the elaborated
   types are structurally equal, and `@frozen = @provider := rfl` compiles. `hpr` and `hns` are
   unused (they are source context).
5. **Content: PASS.**
   - `continuousAt_genFun` proves `ContinuousAt` at every point of `(0,∞]^d`, including points
     with infinite coordinates: lower semicontinuity where `f_k = ∞`, dominated convergence
     where `f_k < ∞`.
   - Non-vacuity test: a one-type law (0 w.p. 3/4, 2 w.p. 1/4) with every hypothesis proved; the
     provider applies, and the extinction probability is 1.
6. **Axioms: PASS.** `propext`, `Classical.choice`, `Quot.sound`.

## Part B — node audit of W-A1, W-A2 and W-A3: PASS on every named theorem

- Every brief signature, restated verbatim, unifies with the project theorem.
- The axioms are standard on all 33 public declarations probed.
- The helper definitions (`Individuals`, `offspringPi`, `pathKernel`, `typedSumLaw`, `tailZero`)
  and the Prop-valued instances are faithful, and none can create a diamond.
- The import discipline is respected.

## Notes (non-blocking) and orchestrator disposition

1. **The branching property is proved only at the marginal level.** Lean has the cylinder
   formula, convolution of the generation-`n` laws, and Chapman–Kolmogorov. It does not yet have
   the full path-level independent-sum statement. Disposition: record it in STATUS. Later briefs
   needing the path-level Markov property (Props 2.1 and 2.2) must prove it.
2. **Theorem-anchor `definition_closure` lists omit `Defs/StepKernel.lean`**, which is reached
   transitively. That file is its own SEALED whole-file entry, so drift in it is still caught.
   Disposition: known metadata gap, left as is. Fixing it would rewrite manifest entries; revisit
   at closure.
3. **The provider docstring still says "quarantined while DRAFT_SORRY".** Disposition: fixed.
4. **A docstring line in the frozen file is over 100 characters** (pre-existing; frozen bytes
   cannot change). Disposition: none.
5. **Generic public names** (`tendsto_monomial`, …) in namespace `Conjugate`. Disposition:
   accepted. A clash would be a compile error, not a silent issue.
6. **No named `Monotone.iterate`/`MapsTo.iterate` lemmas for `g^{(n)}`.** Disposition: pointed
   out in later briefs.
