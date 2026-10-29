/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.IsSubcritical
public import Conjugate.Frozen.Defs.GenFun
import Conjugate.Frozen.Theorem_2_7
import Conjugate.Internal.Analytic.LogGenFun

/-!
# Provider for `Conjugate.theorem_1_4_fixedPoint`

Implementation module for the frozen anchor `Conjugate/Frozen/Theorem_1_4_FixedPoint.lean`.

Theorem 1.4 (fixed-point form) is the sealed frozen `Conjugate.theorem_2_7` transported through
the equivalence (2.6), paper.tex:546-552: a fixed point `λ ∈ (0,∞)^d` of `g = logGenFun μ`
gives the fixed point `q = exp λ ∈ (1,∞)^d` of `f = genFun μ` (`logGenFun_eq_self_iff`).
-/

public section

open scoped ENNReal

namespace Conjugate.Internal

/-- **Theorem 1.4, fixed-point form** (paper.tex:240-252), from Theorem 2.7 and (2.6). -/
theorem theorem_1_4_fixedPoint {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hI : IsSubcritical μ) (hII : IsPositiveRegular μ ∧ IsNonsingular μ)
    (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j}) :
    ∃ q : Fin d → ℝ≥0∞, (∀ j, 1 < q j ∧ q j < ∞) ∧ genFun μ q = q := by
  obtain ⟨x, hx, hfix⟩ := Conjugate.theorem_2_7 μ hI hII hIII
  exact ⟨fun j => EReal.exp (x j),
    fun j => ⟨EReal.one_lt_exp_iff.2 (hx j).1, EReal.exp_lt_top_iff.2 (hx j).2⟩,
    (logGenFun_eq_self_iff μ x).1 hfix⟩

end Conjugate.Internal

end
