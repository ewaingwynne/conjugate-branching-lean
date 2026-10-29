/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.IsSubcritical
public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.IsConjugate
import Conjugate.Internal.Conjugacy.ConjugateToFixedPoint
import Conjugate.Internal.Conjugacy.FixedPointToConjugate

/-!
# Provider for `Conjugate.exists_conjugate_iff_exists_fixedPoint`

Implementation module for the frozen anchor `Conjugate/Frozen/ExistsConjugateIff.lean`.
The anchor is SEALED (its body is `by exact` of the theorem below).

The two directions are `Conjugate.isConjugate_of_fixedPoint` (the tilt of a fixed point
`q ∈ (1,∞)^d` is a conjugate, by the sealed Proposition 2.2) and
`Conjugate.exists_fixedPoint_of_isConjugate` (a conjugate is the tilt of a fixed point
`q ∈ (1,∞)^d`, read off generation `1`).
-/

public section

open scoped ENNReal

namespace Conjugate.Internal

theorem exists_conjugate_iff_exists_fixedPoint {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hsub : IsSubcritical μ) (hpr : IsPositiveRegular μ) (hns : IsNonsingular μ) :
    (∃ μHat : Fin d → PMF (Fin d →₀ ℕ), IsConjugate μ μHat) ↔
      ∃ q : Fin d → ℝ≥0∞, (∀ j, 1 < q j ∧ q j < ∞) ∧ genFun μ q = q := by
  constructor
  · rintro ⟨μHat, h⟩
    obtain ⟨q, hq, hfix, -⟩ := exists_fixedPoint_of_isConjugate μ hsub hpr h
    exact ⟨q, hq, hfix⟩
  · rintro ⟨q, hq, hfix⟩
    obtain ⟨μHat, h, -⟩ := isConjugate_of_fixedPoint μ hsub hpr hns hq hfix
    exact ⟨μHat, h⟩

end Conjugate.Internal

end
