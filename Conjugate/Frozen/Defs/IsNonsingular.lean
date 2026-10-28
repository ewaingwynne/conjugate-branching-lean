/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.PopulationMeasurableSpace
public import Mathlib.Algebra.BigOperators.Finsupp.Basic
public import Mathlib.Probability.ProbabilityMassFunction.Basic

/-!
# Non-singularity (Definition 1.3)
-/

@[expose] public section

open MeasureTheory

namespace Conjugate

/-- **Non-singular** (Definition 1.3, paper.tex:230-233): there is a type `k` with
`ℙ_k[∑_j X_j(1) ≥ 2] > 0`, where `X(1)` has the offspring law `μ k`. -/
def IsNonsingular {ι : Type*} (μ : ι → PMF (ι →₀ ℕ)) : Prop :=
  ∃ k, 0 < (μ k).toMeasure {c | 2 ≤ c.sum fun _ n => n}

end Conjugate

end
