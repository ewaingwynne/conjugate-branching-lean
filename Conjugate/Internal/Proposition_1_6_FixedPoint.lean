/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.MeanMatrix
import Conjugate.Internal.SingleType.FixedPoint
import Conjugate.Internal.SingleType.GeomQuotient

/-!
# Provider for `Conjugate.proposition_1_6_fixedPoint`

Implementation module for the frozen anchor `Conjugate/Frozen/Proposition_1_6_FixedPoint.lean`.
The anchor is SEALED (its body is `by exact` of the theorem below).

For `d = 1` the generating function is `f(q) = 𝔼[q ^ X(1)] = ∑ₙ pₙ qⁿ`, where `X(1) = c 0`
under the offspring law `μ 0` (`genFun_eq_pgf`). The statement is then the abstract fixed-point
theorem `Conjugate.Internal.SingleType.existsUnique_pgf_eq`, proved in
`Conjugate/Internal/SingleType/` (graph nodes `prop-single-type#finite-near-one`,
`#mean-eq-derivative`, `#f-below-diagonal`, `#f-above-diagonal`, `#fixed-point-exists`,
`#strict-convexity`, `#at-most-two-fixed-points`):

* `F(1) = 1`, and `F` is finite just to the right of `1` by continuity (hypothesis III);
* the difference quotients `(F(1 + ε) - 1) / ε = 𝔼[∑_{k<X} (1 + ε)^k]` decrease to
  `𝔼[X] < 1` as `ε ↓ 0` (hypothesis I), so `F(s) < s` for some `s > 1`;
* `F(t) ≥ P[X ≥ 2] t² > t` for large finite `t` (hypothesis II);
* the intermediate value theorem on `[s,t]` (hypothesis III) gives a fixed point in `(1,∞)`;
* the difference quotient is strictly increasing (hypothesis II), which excludes a second one.
-/

public section

open MeasureTheory

open scoped ENNReal

namespace Conjugate.Internal

/-- For a single type, `f(q) = 𝔼[q ^ X(1)]`. -/
private lemma genFun_eq_pgf (μ : Fin 1 → PMF (Fin 1 →₀ ℕ)) (q : ℝ≥0∞) :
    genFun μ (fun _ => q) 0 = SingleType.pgf (μ 0).toMeasure (fun c => c 0) q := by
  refine lintegral_congr fun c => ?_
  rw [Finsupp.prod_fintype _ _ (by simp)]
  simp

/-- **Proposition 1.6, fixed-point form** (paper.tex:343-356), single-type case: under
hypotheses I-III there is a unique `q ∈ (1,∞)` with `f(q) = q`. -/
theorem proposition_1_6_fixedPoint (μ : Fin 1 → PMF (Fin 1 →₀ ℕ))
    (hI : meanMatrix μ 0 0 < 1)
    (hII : 0 < (μ 0).toMeasure {c | 2 ≤ c 0})
    (hIII : ContinuousOn (fun q : ℝ≥0∞ => genFun μ (fun _ => q) 0) (Set.Ioi 0)) :
    ∃! q : ℝ≥0∞, 1 < q ∧ q < ∞ ∧ genFun μ (fun _ => q) 0 = q := by
  simp only [genFun_eq_pgf] at hIII ⊢
  exact SingleType.existsUnique_pgf_eq (measurable_from_top (f := fun c : Fin 1 →₀ ℕ => c 0))
    hIII hI hII

end Conjugate.Internal

end
