/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.StepKernel
public import Conjugate.Frozen.Defs.StochDominated
public import Conjugate.Frozen.Defs.IsConjugate
import Conjugate.Frozen.Example_3_5
import Conjugate.Internal.Countable.FixedPointToConjugate

/-!
# Provider for `Conjugate.example_3_5_conjugate`

Implementation module for the frozen anchor
`Conjugate/Frozen/Example_3_5_Conjugate.lean`. The anchor is SEALED (its body is `by exact` of the theorem below).

The sealed `Conjugate.example_3_5` gives, under the same hypotheses, global extinction from each
single individual (its first conjunct) and a fixed point `q ∈ (1,∞)^ℕ` of `f` (its last
conjunct). The tilt of `μ` by `q` is then a conjugate (paper.tex:1183), by
`Conjugate.isConjugate_of_fixedPoint_nat`.
-/

public section

open MeasureTheory

open scoped ENNReal

namespace Conjugate.Internal

theorem example_3_5_conjugate (μ : ℕ → PMF (ℕ →₀ ℕ))
    (h323 : ∀ k,
      (∀ j, 0 < (μ k).toMeasure {c | 1 ≤ c j}) ∧
      0 < (μ k).toMeasure {c | 2 ≤ c 0} ∧
      (∀ u : ℝ, 1 < u →
        ∫⁻ c, ENNReal.ofReal (u ^ (c.sum fun j n => ((j : ℝ) + 1) * n)) ∂(μ k).toMeasure < ∞) ∧
      ∫⁻ c, ((c.sum fun j n => (j + 1) * n : ℕ) : ℝ≥0∞) ∂(μ k).toMeasure < 1)
    (hdom : ∀ k, 1 ≤ k →
      StochDominated (μ k).toMeasure (stepKernel μ (Finsupp.single 0 (k + 1)))) :
    ∃ μHat : ℕ → PMF (ℕ →₀ ℕ), IsConjugate μ μHat := by
  obtain ⟨hext, -, -, -, -, q, hq, hfix⟩ := Conjugate.example_3_5 μ h323 hdom
  obtain ⟨μHat, h, -⟩ := isConjugate_of_fixedPoint_nat μ hext hq hfix
  exact ⟨μHat, h⟩

end Conjugate.Internal

end
