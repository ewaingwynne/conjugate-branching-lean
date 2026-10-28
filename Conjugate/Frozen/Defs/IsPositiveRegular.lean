/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.PathLaw

/-!
# Positive regularity (Definition 1.3)
-/

@[expose] public section

open MeasureTheory

namespace Conjugate

/-- **Positive regular** (Definition 1.3, paper.tex:225-229): there is `N ∈ ℕ = {1, 2, …}` with
`ℙ_k[X_j(N) ≥ 1] > 0` for all types `k, j`. For the type set `ℕ` the same definition is used
(paper.tex:928). -/
def IsPositiveRegular {ι : Type*} [Countable ι] (μ : ι → PMF (ι →₀ ℕ)) : Prop :=
  ∃ N : ℕ, 1 ≤ N ∧ ∀ k j : ι, 0 < pathLaw μ (Finsupp.single k 1) {ω | 1 ≤ ω N j}

end Conjugate

end
