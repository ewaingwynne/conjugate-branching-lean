/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
-- FROZEN_ANCHOR_PREFIX_BEGIN
module

public import Conjugate.Frozen.Defs.StepKernel
public import Conjugate.Frozen.Defs.StochDominated
public import Conjugate.Frozen.Defs.IsConjugate
import Conjugate.Internal.Example_3_5_Conjugate

/-!
# Example 3.5, conjugate form
-/

public section

open MeasureTheory

open scoped ENNReal

namespace Conjugate

/-- **Example 3.5, conjugate form** (paper.tex:1183: "We describe a simple class of examples where
Theorem 3.1 implies the existence of a conjugate branching process").

Under exactly the hypotheses of the frozen `Conjugate.example_3_5` (ERRATA.md E8: all four
conditions of (3.23) for every `ℙ_k`, and `ℙ_k` for paper type `k ≥ 2` stochastically dominated by
the sum of `k` i.i.d. samples from `ℙ_1`; Lean indexing explained there), there exists a conjugate
branching process for `X`. -/
theorem example_3_5_conjugate (μ : ℕ → PMF (ℕ →₀ ℕ))
    (h323 : ∀ k,
      (∀ j, 0 < (μ k).toMeasure {c | 1 ≤ c j}) ∧
      0 < (μ k).toMeasure {c | 2 ≤ c 0} ∧
      (∀ u : ℝ, 1 < u →
        ∫⁻ c, ENNReal.ofReal (u ^ (c.sum fun j n => ((j : ℝ) + 1) * n)) ∂(μ k).toMeasure < ∞) ∧
      ∫⁻ c, ((c.sum fun j n => (j + 1) * n : ℕ) : ℝ≥0∞) ∂(μ k).toMeasure < 1)
    (hdom : ∀ k, 1 ≤ k →
      StochDominated (μ k).toMeasure (stepKernel μ (Finsupp.single 0 (k + 1)))) :
    ∃ μHat : ℕ → PMF (ℕ →₀ ℕ), IsConjugate μ μHat :=
-- FROZEN_ANCHOR_PROOF_BEGIN
  by exact Conjugate.Internal.example_3_5_conjugate μ h323 hdom
-- FROZEN_ANCHOR_PROOF_END
-- FROZEN_ANCHOR_SUFFIX_BEGIN

end Conjugate

end
-- FROZEN_ANCHOR_SUFFIX_END
