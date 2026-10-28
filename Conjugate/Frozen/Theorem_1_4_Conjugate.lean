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
import Conjugate.Internal.Theorem_1_4_Conjugate

/-!
# Theorem 1.4 (conjugate form)
-/

public section

namespace Conjugate

/-- **Theorem 1.4, conjugate form** (paper.tex:241-250; split per ERRATA.md R3).

Under hypotheses I–III of Theorem 1.4 (see `theorem_1_4_fixedPoint`), there exists a
conjugate branching process for `X` (Definition 1.1). -/
theorem theorem_1_4_conjugate {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hI : IsSubcritical μ) (hII : IsPositiveRegular μ ∧ IsNonsingular μ)
    (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j}) :
    ∃ μHat : Fin d → PMF (Fin d →₀ ℕ), IsConjugate μ μHat :=
-- FROZEN_ANCHOR_PROOF_BEGIN
  by sorry
-- FROZEN_ANCHOR_PROOF_END
-- FROZEN_ANCHOR_SUFFIX_BEGIN

end Conjugate

end
-- FROZEN_ANCHOR_SUFFIX_END
