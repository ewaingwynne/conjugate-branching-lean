/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.ExtinctionEvent
public import Conjugate.Frozen.Defs.PathLaw
public import Mathlib.Probability.ConditionalProbability

/-!
# Conjugate branching processes (Definition 1.1)
-/

@[expose] public section

open MeasureTheory ProbabilityTheory

namespace Conjugate

/-- **Conjugate branching process** (Definition 1.1, paper.tex:184-187; for the type set `ℕ`,
paper.tex:934, with global extinction).

The branching process with offspring laws `μHat` is a conjugate branching process for the
one with offspring laws `μ` if it does not have the same law, and for every type `k`, its law
started from a single individual of type `k`, conditioned on extinction, is `ℙ_k`.

Definition 1.1 is stated in the context "let `X` be subcritical with extinction probability
one"; that context is not part of the predicate and is assumed where the predicate is used. -/
def IsConjugate {ι : Type*} [Countable ι] (μ μHat : ι → PMF (ι →₀ ℕ)) : Prop :=
  (∃ k, pathLaw μHat (Finsupp.single k 1) ≠ pathLaw μ (Finsupp.single k 1)) ∧
    ∀ k, (pathLaw μHat (Finsupp.single k 1))[|extinctionEvent ι] =
      pathLaw μ (Finsupp.single k 1)

end Conjugate

end
