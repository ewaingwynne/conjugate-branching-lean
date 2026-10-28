/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
-- FROZEN_ANCHOR_PREFIX_BEGIN
module

public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.IsSubcritical
public import Conjugate.Frozen.Defs.GenFun
import Conjugate.Internal.Theorem_1_4_FixedPoint

/-!
# Theorem 1.4 (fixed-point form)
-/

public section

open scoped ENNReal

namespace Conjugate

/-- **Theorem 1.4, fixed-point form** (paper.tex:241-250; split per ERRATA.md R3).

Let `X` be a `d`-type branching process with generating function `f` such that
I. `X` is subcritical;
II. `X` is positive regular and non-singular;
III. for each `k ∈ {1,…,d}` (paper.tex:247 says `k ∈ ℕ`, ERRATA.md E1), `f_k` is continuous
from `(0,∞]^d` to `(0,∞]` (half-open-interval topology).
Then there is `q ∈ (1,∞)^d` with `f(q) = q`.

Hypothesis III is stated as continuity on the subspace `(0,∞]^d` of `[0,∞]^d`; that `f_k` takes
values in `(0,∞]` there holds automatically. -/
theorem theorem_1_4_fixedPoint {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hI : IsSubcritical μ) (hII : IsPositiveRegular μ ∧ IsNonsingular μ)
    (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j}) :
    ∃ q : Fin d → ℝ≥0∞, (∀ j, 1 < q j ∧ q j < ∞) ∧ genFun μ q = q :=
-- FROZEN_ANCHOR_PROOF_BEGIN
  by sorry
-- FROZEN_ANCHOR_PROOF_END
-- FROZEN_ANCHOR_SUFFIX_BEGIN

end Conjugate

end
-- FROZEN_ANCHOR_SUFFIX_END
