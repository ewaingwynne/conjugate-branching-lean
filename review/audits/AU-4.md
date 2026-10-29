# AU-4 — audit report (fresh Sonnet auditor, 2026-10-28)

Brief: `briefs/AU-4-conjugates-example15.md`. Audited at HEAD b80e68a. The sealed files are the
ones sealed in b7bb629 and 3ea9ad2.

## Part A — seal audits: PASS for all five (checks 1-6 each)

| Anchor | ABI | Binders (SOURCE/TYPING/EXCESS) | Content highlights |
|---|---|---|---|
| `exists_conjugate_iff_exists_fixedPoint` | `8b5e83de…` | 3 / 2 / 0 | Both directions run on 3/4 δ₀ + 1/4 δ₂ (`q = 3`). The `IsConjugate` semantics are checked: a null `E` gives `cond = 0`. |
| `theorem_1_4_conjugate` | `ae044187…` | 3 / 2 / 0 (E1, R3) | Fed by the Example 1.5 hypotheses. Yields a conjugate. |
| `proposition_1_6_conjugate` | `eb22dc06…` | 3 / 1 / 0 (R5) | The unique conjugate of 3/4 δ₀ + 1/4 δ₂ is 1/4 δ₀ + 3/4 δ₂, the classical answer. |
| `remark_hypIII_necessary` | `040e7973…` | no binders | `a = 1/4`, `b = 1 − ζ(3)/4 ≈ 0.6995`, with a genuine PMF (total mass 1 proved). Mean `π²/24`. `f = ∞` on `(1,∞)`. No conjugate exists. |
| `example_1_5` | `b00c67e0…` | 1 / 1 / 0 (R4) | Explicit PMF. Independent numerics give fixed points `(1.62011, 1.62011)`, `(1.17418, 1.82582)` and `(1.82582, 1.17418)`. `G(1.1) = −0.0352` and `G(1.2) = 0.0105`. Three distinct conjugates built. |

For every anchor: the bytes are a one-line diff with the prefix and suffix hashes recomputed;
`verify-abi` is OK; `@frozen = @provider := rfl`; an independent restatement is derived from the
anchor; and the axioms are standard.

## Part B — node audit: PASS

**Signatures.** All nine brief signatures are `Expr ==` to the project theorems.

**Subcriticality.**
- `isSubcritical_of_sum_lt_one` uses the operator norm only as a scoped instance on its own
  declaration. No instance leaks: `#synth NormedRing (Matrix …)` fails downstream.
- `IsSubcritical` keeps its algebraic spectral radius, and its ABI is unchanged.
- Both directions of `isSubcritical_fin_one_iff` are correct.

**Hygiene.**
- All 91 declarations probed use standard axioms only.
- No DRAFT module appears in any import closure.
- No warnings.

## Route deviation: SOUND, APPROVED

"Conjugate ⇒ fixed point" reads the tilt off generation 1 by the time-1 Markov property, plus the
extinction product formula for `μ̂`. The `> 1` dichotomy then comes from Lemma 2.3 applied to the
original process.

None of the premises of the graph leaf `thm-fixed-gf.equivalence#conjugate-regularity` is used.
That leaf is a SOURCE_GAP premise node, not an obligation. No non-singularity is needed, which is
consistent: a singular subcritical process has only the fixed point `1`, so the implication holds
vacuously.

## Non-blocking notes and disposition

1. `definition_closure` omits `Defs/StepKernel.lean`. This is the known AU-1 gap; revisit at closure.
2. `exists_fixedPoint_of_isConjugate` needs only `hsub` and `hpr`. It is stronger than the paper's
   route.
3. The constants in `remark_hypIII_necessary` are existential, matching "appropriate constants".
4. Example 1.5 is "at least three" per R4. The numerics are consistent with exactly three.
5. The W-A12 files were present but out of scope.
6. Generic helper names; cosmetic.
7. The `HypIII` internal definitions sit in a plain `public section`. Harmless.
