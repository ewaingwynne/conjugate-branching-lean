/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
-- FROZEN_ANCHOR_PREFIX_BEGIN
module

public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.GenFun
import Conjugate.Internal.Remark_HypIII_Automatic

/-!
# Hypothesis III is automatic for finite f
-/

public section

open scoped ENNReal

namespace Conjugate

/-- **Hypothesis III of Theorem 1.4 is automatic when `f` is finite** (paper.tex:252, last sentence).

If `X` is positive regular and non-singular and `f_k(q) < ∞` for all `k` and all
`q ∈ (0,∞)^d`, then each `f_k` is continuous from `(0,∞]^d` to `(0,∞]`. -/
theorem remark_hypIII_automatic {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hpr : IsPositiveRegular μ) (hns : IsNonsingular μ)
    (hfin : ∀ k (q : Fin d → ℝ≥0∞), (∀ j, 0 < q j ∧ q j < ∞) → genFun μ q k < ∞) :
    ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j} :=
-- FROZEN_ANCHOR_PROOF_BEGIN
  by exact Conjugate.Internal.remark_hypIII_automatic μ hpr hns hfin
-- FROZEN_ANCHOR_PROOF_END
-- FROZEN_ANCHOR_SUFFIX_BEGIN

end Conjugate

end
-- FROZEN_ANCHOR_SUFFIX_END
