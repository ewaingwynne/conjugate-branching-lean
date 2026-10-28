/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.PopulationMeasurableSpace
public import Mathlib.Algebra.BigOperators.Finsupp.Basic
public import Mathlib.MeasureTheory.Integral.Lebesgue.Basic
public import Mathlib.Probability.ProbabilityMassFunction.Basic

/-!
# The generating function (1.1)
-/

@[expose] public section

open MeasureTheory

open scoped ENNReal

namespace Conjugate

/-- **The generating function** (1.1), paper.tex:203-208; for the type set `ℕ`,
paper.tex:919-924:
`f_k(q) = 𝔼_k[∏_j q_j^{X_j(1)}]`, where `X(1)` has the offspring law `μ k`.

Values lie in `[0,∞]`, with `∞⁰ = 1` and `∞^n = ∞` for `n > 0` as in paper.tex:208. The paper
introduces `f` on `(0,∞]^d`; the same formula is used here on `[0,∞]^ι`, as the paper itself
does when it evaluates `f` on `[0,1]^d` (paper.tex:394). Iterates `f^{(n)}` are
`(genFun μ)^[n]`. -/
noncomputable def genFun {ι : Type*} (μ : ι → PMF (ι →₀ ℕ)) (q : ι → ℝ≥0∞) (k : ι) : ℝ≥0∞ :=
  ∫⁻ c, c.prod (fun j n => q j ^ n) ∂(μ k).toMeasure

end Conjugate

end
