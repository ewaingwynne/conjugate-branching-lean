/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.LogGenFun
public import Mathlib.Data.EReal.Inv
public import Mathlib.Topology.Instances.ENNReal.Lemmas

/-!
# The basin of attraction of `0` (2.9)
-/

@[expose] public section

open Filter Topology

namespace Conjugate

/-- **The basin of attraction of `0`** (2.9), paper.tex:726-729:
`S₀ = {λ ∈ [0,∞]^d : lim_{n→∞} |g^{(n)}(λ)| = 0}`.

`|·|` is taken to be the sup norm `max_j |λ_j|` on `[0,∞]^d` (the paper does not specify the
norm; all norms on `ℝ^d` are equivalent, and a vector with an infinite coordinate has
infinite norm in each of them, so the set does not depend on this choice). -/
def basinZero {ι : Type*} [Fintype ι] (μ : ι → PMF (ι →₀ ℕ)) : Set (ι → EReal) :=
  {x | (∀ j, 0 ≤ x j) ∧
    Tendsto (fun n => ⨆ j, ((logGenFun μ)^[n] x j).abs) atTop (𝓝 0)}

end Conjugate

end
