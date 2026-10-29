/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.ExtinctionEvent
public import Conjugate.Frozen.Defs.PathLaw
public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.IsConjugate
import Conjugate.Internal.Countable.ConjugateToFixedPoint
import Conjugate.Internal.Countable.FixedPointToConjugate

/-!
# Provider for `Conjugate.exists_conjugate_iff_exists_fixedPoint_countable`

Implementation module for the frozen anchor
`Conjugate/Frozen/ExistsConjugateIffCountable.lean`.
The anchor is SEALED (its body is `by exact` of the theorem below); audited in AU-7.

The two directions are `Conjugate.exists_fixedPoint_of_isConjugate_nat` (a conjugate is the tilt
of a fixed point `q ∈ (1,∞)^ℕ`, read off generation `1`; this is where positive regularity is
used, through Lemma 2.3) and `Conjugate.isConjugate_of_fixedPoint_nat` (the tilt of a fixed
point is a conjugate; this uses neither positive regularity nor non-singularity, and is built
from the h-transform machinery directly, not from the frozen Proposition 2.2).
-/

public section

open MeasureTheory ProbabilityTheory

open scoped ENNReal

namespace Conjugate.Internal

theorem exists_conjugate_iff_exists_fixedPoint_countable (μ : ℕ → PMF (ℕ →₀ ℕ))
    (hext : ∀ k, pathLaw μ (Finsupp.single k 1) (extinctionEvent ℕ) = 1)
    (hpr : IsPositiveRegular μ) (hns : IsNonsingular μ) :
    (∃ μHat : ℕ → PMF (ℕ →₀ ℕ), IsConjugate μ μHat) ↔
      ∃ q : ℕ → ℝ≥0∞, (∀ j, 1 < q j ∧ q j < ∞) ∧ genFun μ q = q := by
  constructor
  · rintro ⟨μHat, h⟩
    obtain ⟨q, hq, hfix, -⟩ := exists_fixedPoint_of_isConjugate_nat μ hext hpr h
    exact ⟨q, hq, hfix⟩
  · rintro ⟨q, hq, hfix⟩
    obtain ⟨μHat, h, -⟩ := isConjugate_of_fixedPoint_nat μ hext hq hfix
    exact ⟨μHat, h⟩

end Conjugate.Internal

end
