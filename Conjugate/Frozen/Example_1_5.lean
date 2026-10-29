/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
-- FROZEN_ANCHOR_PREFIX_BEGIN
module

public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.IsSubcritical
public import Conjugate.Frozen.Defs.GenFun
import Conjugate.Internal.Example_1_5

/-!
# Example 1.5
-/

public section

open scoped ENNReal

namespace Conjugate

/-- **Example 1.5 (non-uniqueness)** (paper.tex:255-276; "at least three" per ERRATA.md R4).

Let `d = 2` with offspring distribution (for both types `k`, `3 - k` being the other type,
Lean `k.rev`) `ℙ_k[X_k(1) = 1, X_{3-k}(1) = 0] = ℙ_k[X_k(1) = 2, X_{3-k}(1) = 0] = 1/4`,
`ℙ_k[X_k(1) = X_{3-k}(1) = 2] = 1/100`, `ℙ_k[X_k(1) = X_{3-k}(1) = 0] = 49/100`. Then the process
satisfies the hypotheses of Theorem 1.4, and `f(q) = q` has at least three solutions in
`(1,∞)²`. (The four masses sum to one, so they determine `μ`.) -/
theorem example_1_5 (μ : Fin 2 → PMF (Fin 2 →₀ ℕ))
    (hμ : ∀ k : Fin 2,
      μ k (Finsupp.single k 1) = 1 / 4 ∧ μ k (Finsupp.single k 2) = 1 / 4 ∧
      μ k (Finsupp.single k 2 + Finsupp.single k.rev 2) = 1 / 100 ∧ μ k 0 = 49 / 100) :
    (IsSubcritical μ ∧ (IsPositiveRegular μ ∧ IsNonsingular μ) ∧
      ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j}) ∧
    3 ≤ {q : Fin 2 → ℝ≥0∞ | (∀ j, 1 < q j ∧ q j < ∞) ∧ genFun μ q = q}.encard :=
-- FROZEN_ANCHOR_PROOF_BEGIN
  by exact Conjugate.Internal.example_1_5 μ hμ
-- FROZEN_ANCHOR_PROOF_END
-- FROZEN_ANCHOR_SUFFIX_BEGIN

end Conjugate

end
-- FROZEN_ANCHOR_SUFFIX_END
