/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.ExtinctionEvent
public import Conjugate.Frozen.Defs.PathLaw
public import Conjugate.Frozen.Defs.GenFun
import Conjugate.Internal.Countable.CondLaw

/-!
# Provider for `Conjugate.proposition_2_2_countable`

Implementation module for the frozen anchor
`Conjugate/Frozen/Proposition_2_2_Countable.lean`. The anchor is SEALED (its body is `by exact` of the theorem below).

The proof is the Doob h-transform on cylinder sets (`PLAN.md` §6) for the fixed point `A` of `f`,
exactly as for finite types (paper.tex:934). The general result for a countable type set is
`Conjugate.Conjugacy.exists_tilt_of_fixedPoint`: the tilted offspring laws `μ̂ = tilt μ A …` are
probability mass functions because `f(A) = A`; their extinction probability is
`ℙ̂_x[E] = ℙ_x[E] / h(x) = 1 / h(x)` (`pathLaw_tilt_extinctionEvent`); and `ℙ̂_x[· | E]` and `ℙ_x`
agree on cylinders by the Markov property for `μ̂`. Positive regularity and non-singularity are
not used.
-/

public section

open MeasureTheory ProbabilityTheory

open scoped ENNReal

namespace Conjugate.Internal

theorem proposition_2_2_countable (μ : ℕ → PMF (ℕ →₀ ℕ))
    (hpr : IsPositiveRegular μ) (hns : IsNonsingular μ)
    (hext : ∀ x, pathLaw μ x (extinctionEvent ℕ) = 1)
    (A : ℕ → ℝ≥0∞) (hA : ∀ j, 1 ≤ A j ∧ A j < ∞) (hfix : genFun μ A = A) :
    ∃ μHat : ℕ → PMF (ℕ →₀ ℕ),
      (∀ k c, μHat k c = (A k)⁻¹ * (μ k c * c.prod fun j n => A j ^ n)) ∧
      (∀ k, pathLaw μHat (Finsupp.single k 1) (extinctionEvent ℕ) = (A k)⁻¹) ∧
      ∀ k, (pathLaw μHat (Finsupp.single k 1))[|extinctionEvent ℕ] =
        pathLaw μ (Finsupp.single k 1) :=
  Conjugacy.exists_tilt_of_fixedPoint μ hext A hA hfix

end Conjugate.Internal

end
