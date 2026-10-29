/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.MeanMatrix
public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.IsConjugate
import Conjugate.Frozen.Proposition_1_6_FixedPoint
import Conjugate.Internal.Analytic.Subcritical
import Conjugate.Internal.Conjugacy.ConjugateToFixedPoint
import Conjugate.Internal.Conjugacy.FixedPointToConjugate
import Conjugate.Internal.Conjugacy.SingleType

/-!
# Provider for `Conjugate.proposition_1_6_conjugate`

Implementation module for the frozen anchor `Conjugate/Frozen/Proposition_1_6_Conjugate.lean`.
The anchor is SEALED (its body is `by exact` of the theorem below).

Under hypotheses I-III, the sealed `Conjugate.proposition_1_6_fixedPoint` gives a unique
`q ∈ (1,∞)` with `f(q) = q`. Hypothesis I is subcriticality (`isSubcritical_fin_one_iff`), and
hypothesis II gives positive regularity and non-singularity for a single type
(`Conjugate.Conjugacy.isPositiveRegular_of_fin_one`, `isNonsingular_of_fin_one`).

* *Existence*: `isConjugate_of_fixedPoint` applied to `q`.
* *Uniqueness in law*: by `exists_fixedPoint_of_isConjugate`, every conjugate `μ̂` is the tilt of
  a fixed point in `(1,∞)`; by uniqueness of the fixed point, any two conjugates have the same
  offspring laws, hence the same law.
-/

public section

open scoped ENNReal

namespace Conjugate.Internal

theorem proposition_1_6_conjugate (μ : Fin 1 → PMF (Fin 1 →₀ ℕ))
    (hI : meanMatrix μ 0 0 < 1)
    (hII : 0 < (μ 0).toMeasure {c | 2 ≤ c 0})
    (hIII : ContinuousOn (fun q : ℝ≥0∞ => genFun μ (fun _ => q) 0) (Set.Ioi 0)) :
    (∃ μHat, IsConjugate μ μHat) ∧
      ∀ μ₁ μ₂, IsConjugate μ μ₁ → IsConjugate μ μ₂ →
        pathLaw μ₁ (Finsupp.single 0 1) = pathLaw μ₂ (Finsupp.single 0 1) := by
  have hsub : IsSubcritical μ := (isSubcritical_fin_one_iff μ).2 hI
  have hpr := Conjugacy.isPositiveRegular_of_fin_one μ hII
  have hns := Conjugacy.isNonsingular_of_fin_one μ hII
  obtain ⟨q₀, ⟨hq1, hqtop, hfix⟩, huniq⟩ := proposition_1_6_fixedPoint μ hI hII hIII
  -- for a single type, a vector is the constant vector at its value at `0`
  have hfun : ∀ q : Fin 1 → ℝ≥0∞, q = fun _ => q 0 := fun q =>
    funext fun k => by rw [Subsingleton.elim k 0]
  -- a fixed point of `f` in `(1,∞)^1` has its value at `0` equal to `q₀`
  have hval : ∀ q : Fin 1 → ℝ≥0∞, (∀ j, 1 < q j ∧ q j < ∞) → genFun μ q = q → q 0 = q₀ := by
    intro q hq hf
    refine huniq (q 0) ⟨(hq 0).1, (hq 0).2, ?_⟩
    have h0 := congrFun hf 0
    rwa [hfun q] at h0
  refine ⟨?_, fun μ₁ μ₂ h₁ h₂ => ?_⟩
  · obtain ⟨μHat, h, -⟩ := isConjugate_of_fixedPoint μ hsub hpr hns (q := fun _ => q₀)
      (fun _ => ⟨hq1, hqtop⟩) (funext fun k => by rw [Subsingleton.elim k 0]; exact hfix)
    exact ⟨μHat, h⟩
  · obtain ⟨q₁, hq₁, hf₁, hμ₁⟩ := exists_fixedPoint_of_isConjugate μ hsub hpr h₁
    obtain ⟨q₂, hq₂, hf₂, hμ₂⟩ := exists_fixedPoint_of_isConjugate μ hsub hpr h₂
    have hq12 : q₁ = q₂ := funext fun k => by
      rw [Subsingleton.elim k 0, hval q₁ hq₁ hf₁, hval q₂ hq₂ hf₂]
    have hμ12 : μ₁ = μ₂ := funext fun k => PMF.ext fun c => by
      rw [hμ₁ k c, hμ₂ k c, hq12]
    rw [hμ12]

end Conjugate.Internal

end
