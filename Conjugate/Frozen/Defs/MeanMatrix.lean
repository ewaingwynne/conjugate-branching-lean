/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.PopulationMeasurableSpace
public import Mathlib.LinearAlgebra.Matrix.Defs
public import Mathlib.MeasureTheory.Integral.Lebesgue.Basic
public import Mathlib.Probability.ProbabilityMassFunction.Basic

/-!
# The mean matrix (1.3)
-/

@[expose] public section

open MeasureTheory

open scoped ENNReal

namespace Conjugate

/-- **The mean matrix** (1.3), paper.tex:215-218: `M_{k,j} = 𝔼_k[X_j(1)]`, the expected number
of type-`j` children of one type-`k` individual, as an element of `[0,∞]`. The paper's standing
assumption that every entry is finite (paper.tex:219) is part of `IsSubcritical`. -/
noncomputable def meanMatrix {ι : Type*} (μ : ι → PMF (ι →₀ ℕ)) : Matrix ι ι ℝ≥0∞ :=
  Matrix.of fun k j => ∫⁻ c, (c j : ℝ≥0∞) ∂(μ k).toMeasure

end Conjugate

end
