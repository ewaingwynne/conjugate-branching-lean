/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.PopulationMeasurableSpace
public import Mathlib.Data.Finsupp.Basic
public import Mathlib.Probability.ProbabilityMassFunction.Constructions

/-!
# The branching process truncated at level `d` (§3.1)
-/

@[expose] public section

namespace Conjugate

/-- **The branching process truncated at level `d`** (paper.tex:937-948).

Lean indexes types from `0`: the paper's type `k ∈ {1, 2, …}` is the Lean type `k - 1 : ℕ`,
and its types `{1,…,d}` are `Fin d`. `X^d` is obtained from `X` by immediately killing every
individual of (paper) type `≥ d + 1`; so a type-`k` individual with `k ≤ d` has offspring
vector `(X_1(1), …, X_d(1))`, the restriction of its offspring vector in `X`, and
`truncate μ d k` is the image of `μ k` under this restriction. -/
noncomputable def truncate (μ : ℕ → PMF (ℕ →₀ ℕ)) (d : ℕ) : Fin d → PMF (Fin d →₀ ℕ) :=
  fun k => (μ k).map fun c => c.comapDomain Fin.val Fin.val_injective.injOn

end Conjugate

end
