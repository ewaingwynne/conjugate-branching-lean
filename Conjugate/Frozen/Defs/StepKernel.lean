/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Infrastructure.Population
public import Mathlib.Data.Finsupp.Encodable
public import Mathlib.MeasureTheory.Constructions.Pi
public import Mathlib.Probability.Kernel.Basic
public import Mathlib.Probability.ProbabilityMassFunction.Basic

/-!
# One generation of a branching process
-/

@[expose] public section

open MeasureTheory ProbabilityTheory

namespace Conjugate

/-- **One generation of a multi-type branching process** (paper.tex:176-177).

A branching process with type set `ι` is given by its offspring laws `μ`: `μ j` is the law of
the offspring vector `(X_1(1), X_2(1), …)` of a single individual of type `j`. From a
population `x`, every individual reproduces independently, and the next generation is the
sum of all offspring vectors. The individuals of `x` are indexed by the pairs `(j, i)` with
`j` in the support of `x` and `i < x j`; individual `(j, i)` has type `j`. So
`stepKernel μ x` is the law of `∑_{(j,i)} Y_{j,i}` for independent `Y_{j,i} ∼ μ j`. -/
noncomputable def stepKernel {ι : Type*} [Countable ι] (μ : ι → PMF (ι →₀ ℕ)) :
    Kernel (ι →₀ ℕ) (ι →₀ ℕ) :=
  Kernel.ofFunOfCountable fun x =>
    (Measure.pi fun p : (Σ j : x.support, Fin (x j)) => (μ p.1).toMeasure).map
      fun y => ∑ p, y p

end Conjugate

end
