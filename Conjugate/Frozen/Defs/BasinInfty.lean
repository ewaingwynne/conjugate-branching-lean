/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.LogGenFun
public import Mathlib.Data.EReal.Inv
public import Mathlib.Order.LiminfLimsup

/-!
# The basin of attraction of `∞` (2.9)
-/

@[expose] public section

open Filter

open scoped ENNReal

namespace Conjugate

/-- **The basin of attraction of `∞`** (2.9), paper.tex:726-729:
`S_∞ = {λ ∈ [0,∞]^d : limsup_{n→∞} |g^{(n)}(λ)| = ∞}`.

`|·|` is taken to be the sup norm `max_j |λ_j|` on `[0,∞]^d` (the paper does not specify the
norm; all norms on `ℝ^d` are equivalent, and a vector with an infinite coordinate has
infinite norm in each of them, so the set does not depend on this choice). -/
def basinInfty {ι : Type*} [Fintype ι] (μ : ι → PMF (ι →₀ ℕ)) : Set (ι → EReal) :=
  {x | (∀ j, 0 ≤ x j) ∧
    limsup (fun n => ⨆ j, ((logGenFun μ)^[n] x j).abs) atTop = ∞}

end Conjugate

end
