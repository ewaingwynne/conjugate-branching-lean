/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.GenFun
public import Mathlib.Analysis.SpecialFunctions.Log.ENNRealLog
public import Mathlib.Analysis.SpecialFunctions.Log.ERealExp

/-!
# The log-coordinate generating function (Definition 2.6)
-/

@[expose] public section

namespace Conjugate

/-- **The function `g`** (Definition 2.6, paper.tex:533-546; for the type set `ℕ`, (3.5)):
`g_k(λ) = log f_k(e^{λ_1}, e^{λ_2}, …)` for `λ ∈ (-∞,∞]^ι`, with `e^∞ = ∞` and `log ∞ = ∞`.
It is defined on all of `[-∞,∞]^ι` by the same formula (`e^{-∞} = 0`, `log 0 = -∞`).
Iterates `g^{(n)}` are `(logGenFun μ)^[n]`. -/
noncomputable def logGenFun {ι : Type*} (μ : ι → PMF (ι →₀ ℕ)) (x : ι → EReal) (k : ι) :
    EReal :=
  ENNReal.log (genFun μ (fun j => EReal.exp (x j)) k)

end Conjugate

end
