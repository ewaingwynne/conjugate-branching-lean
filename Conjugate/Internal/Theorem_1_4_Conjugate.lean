/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.IsSubcritical
public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.IsConjugate
import Conjugate.Frozen.Theorem_1_4_FixedPoint
import Conjugate.Internal.Conjugacy.FixedPointToConjugate

/-!
# Provider for `Conjugate.theorem_1_4_conjugate`

Implementation module for the frozen anchor `Conjugate/Frozen/Theorem_1_4_Conjugate.lean`.
The anchor is SEALED (its body is `by exact` of the theorem below).

The proof is the sealed fixed-point form `Conjugate.theorem_1_4_fixedPoint` (there is
`q ∈ (1,∞)^d` with `f(q) = q`), followed by `Conjugate.isConjugate_of_fixedPoint`.
-/

public section

namespace Conjugate.Internal

theorem theorem_1_4_conjugate {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hI : IsSubcritical μ) (hII : IsPositiveRegular μ ∧ IsNonsingular μ)
    (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j}) :
    ∃ μHat : Fin d → PMF (Fin d →₀ ℕ), IsConjugate μ μHat := by
  obtain ⟨q, hq, hfix⟩ := theorem_1_4_fixedPoint μ hI hII hIII
  obtain ⟨μHat, h, -⟩ := isConjugate_of_fixedPoint μ hI hII.1 hII.2 hq hfix
  exact ⟨μHat, h⟩

end Conjugate.Internal

end
