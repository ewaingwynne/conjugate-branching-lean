/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
-- FROZEN_ANCHOR_PREFIX_BEGIN
module

public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.IsSubcritical
public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.LogGenFun
import Conjugate.Internal.Theorem_2_7

/-!
# Theorem 2.7
-/

public section

namespace Conjugate

/-- **Theorem 2.7** (paper.tex:555-557), in the setting of Theorem 1.4 (paper.tex:528):
under hypotheses I–III of Theorem 1.4 there is `λ ∈ (0,∞)^d` with `g(λ) = λ`. -/
theorem theorem_2_7 {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hI : IsSubcritical μ) (hII : IsPositiveRegular μ ∧ IsNonsingular μ)
    (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j}) :
    ∃ x : Fin d → EReal, (∀ j, 0 < x j ∧ x j < ⊤) ∧ logGenFun μ x = x :=
-- FROZEN_ANCHOR_PROOF_BEGIN
  by sorry
-- FROZEN_ANCHOR_PROOF_END
-- FROZEN_ANCHOR_SUFFIX_BEGIN

end Conjugate

end
-- FROZEN_ANCHOR_SUFFIX_END
