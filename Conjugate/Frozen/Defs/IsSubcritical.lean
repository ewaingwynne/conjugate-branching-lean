/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.MeanMatrix
public import Mathlib.Analysis.Complex.Basic
public import Mathlib.Analysis.Normed.Algebra.Spectrum
public import Mathlib.Data.Matrix.Basic

/-!
# Subcriticality
-/

@[expose] public section

open scoped ENNReal

namespace Conjugate

/-- **Subcritical** (paper.tex:219-220): every entry of the mean matrix `M` is finite, and the
largest eigenvalue `ρ` of `M` is less than one.

For the entrywise non-negative real matrix `M`, the largest eigenvalue is its spectral radius
`max {|λ| : λ ∈ ℂ an eigenvalue}` (Perron–Frobenius), which is what is used here. -/
def IsSubcritical {ι : Type*} [Fintype ι] [DecidableEq ι] (μ : ι → PMF (ι →₀ ℕ)) : Prop :=
  (∀ k j, meanMatrix μ k j ≠ ∞) ∧
    spectralRadius ℂ ((meanMatrix μ).map fun x => ((x.toReal : ℝ) : ℂ)) < 1

end Conjugate

end
