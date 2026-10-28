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
import Conjugate.Internal.Remark_HypIII_Necessary

/-!
# Hypothesis III cannot be removed
-/

public section

open scoped ENNReal

namespace Conjugate

/-- **Hypothesis III of Theorem 1.4 cannot be removed** (paper.tex:252).

For appropriate constants `a, b > 0`, the single-type branching process with
`ℙ[X(1) = m] = a m⁻³` for `m ≥ 1` and `ℙ[X(1) = 0] = b` satisfies hypotheses I and II of
Theorem 1.4, but `f(q) = ∞ ≠ q` for every `q ∈ (1,∞)`, and no conjugate branching process
exists. -/
theorem remark_hypIII_necessary :
    ∃ a b : ℝ≥0∞, 0 < a ∧ 0 < b ∧ ∃ μ : Fin 1 → PMF (Fin 1 →₀ ℕ),
      μ 0 0 = b ∧ (∀ m : ℕ, 1 ≤ m → μ 0 (Finsupp.single 0 m) = a * ((m : ℝ≥0∞) ^ 3)⁻¹) ∧
      IsSubcritical μ ∧ (IsPositiveRegular μ ∧ IsNonsingular μ) ∧
      (∀ q : ℝ≥0∞, 1 < q → q < ∞ → genFun μ (fun _ => q) 0 = ∞) ∧
      ¬ ∃ μHat, IsConjugate μ μHat :=
-- FROZEN_ANCHOR_PROOF_BEGIN
  by sorry
-- FROZEN_ANCHOR_PROOF_END
-- FROZEN_ANCHOR_SUFFIX_BEGIN

end Conjugate

end
-- FROZEN_ANCHOR_SUFFIX_END
