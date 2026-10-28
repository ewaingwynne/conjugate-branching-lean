/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Mathlib.Data.Finsupp.Defs
public import Mathlib.Order.Filter.AtTopBot.Basic

/-!
# The extinction event
-/

@[expose] public section

open Filter

namespace Conjugate

/-- **Extinction** (paper.tex:179): the event `E` that `X(n) = 0` for all sufficiently large
`n`. For the type set `ℕ` this is global extinction, `∑_k X_k(n) → 0` (paper.tex:930),
since a sequence of natural numbers tends to `0` exactly when it is eventually `0`. -/
def extinctionEvent (ι : Type*) : Set (ℕ → ι →₀ ℕ) :=
  {ω | ∀ᶠ n in atTop, ω n = 0}

end Conjugate

end
