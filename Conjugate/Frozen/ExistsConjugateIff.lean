/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
-- FROZEN_ANCHOR_PREFIX_BEGIN
module

public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.IsSubcritical
public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.IsConjugate
import Conjugate.Internal.ExistsConjugateIff

/-!
# Conjugates and fixed points
-/

public section

open scoped ENNReal

namespace Conjugate

/-- **Conjugates correspond to fixed points in `(1,∞)^d`** (paper.tex:238; the equivalence in
Theorem 1.4, split per ERRATA.md R3).

If `X` is subcritical, positive regular and non-singular, then a conjugate branching process
for `X` exists if and only if there is `q ∈ (1,∞)^d` with `f(q) = q`. -/
theorem exists_conjugate_iff_exists_fixedPoint {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hsub : IsSubcritical μ) (hpr : IsPositiveRegular μ) (hns : IsNonsingular μ) :
    (∃ μHat : Fin d → PMF (Fin d →₀ ℕ), IsConjugate μ μHat) ↔
      ∃ q : Fin d → ℝ≥0∞, (∀ j, 1 < q j ∧ q j < ∞) ∧ genFun μ q = q :=
-- FROZEN_ANCHOR_PROOF_BEGIN
  by exact Conjugate.Internal.exists_conjugate_iff_exists_fixedPoint μ hsub hpr hns
-- FROZEN_ANCHOR_PROOF_END
-- FROZEN_ANCHOR_SUFFIX_BEGIN

end Conjugate

end
-- FROZEN_ANCHOR_SUFFIX_END
