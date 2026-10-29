/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.ExtinctionEvent
public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.IsConjugate
public import Conjugate.Frozen.Defs.PathLaw
import Conjugate.Internal.Countable.CondLaw
import Conjugate.Internal.Foundations.Extinction

/-!
# Fixed point ⇒ conjugate, countable types

`isConjugate_of_fixedPoint_nat` (graph step `thm-fixed-gf.equivalence.ctble`, paper.tex:934):
for the type set `ℕ`, if extinction is certain from a single individual of each type and
`q ∈ (1,∞)^ℕ` satisfies `f(q) = q`, then the tilt `μ̂_k(c) = q_k⁻¹ μ_k(c) ∏_j q_j^{c_j}` is the
offspring law of a conjugate branching process.

No positive regularity or non-singularity is used. Per-type certain extinction is upgraded to
every population by `pathLaw_extinctionEvent_eq_one_of_single`; the tilt then satisfies
`ℙ̂_k[E] = 1/q_k` and `ℙ̂_k[· | E] = ℙ_k` (`Conjugacy.exists_tilt_of_fixedPoint`, built directly
from the h-transform machinery). The two laws differ at type `0`, since
`ℙ̂_0[E] = 1/q_0 < 1 = ℙ_0[E]`.
-/

public section

open MeasureTheory ProbabilityTheory

open scoped ENNReal

namespace Conjugate

/-- **Fixed point ⇒ conjugate, countable types, with the explicit tilt** (paper.tex:934, ERRATA
R3): if every type certainly goes extinct and `q ∈ (1,∞)^ℕ` solves `f(q) = q`, the tilt of `μ`
by `q` is a conjugate. -/
theorem isConjugate_of_fixedPoint_nat (μ : ℕ → PMF (ℕ →₀ ℕ))
    (hext : ∀ k, pathLaw μ (Finsupp.single k 1) (extinctionEvent ℕ) = 1)
    {q : ℕ → ℝ≥0∞} (hq : ∀ j, 1 < q j ∧ q j < ∞) (hfix : genFun μ q = q) :
    ∃ μHat, IsConjugate μ μHat ∧
      ∀ k c, μHat k c = (q k)⁻¹ * (μ k c * c.prod fun j n => q j ^ n) := by
  obtain ⟨μHat, htilt, hextHat, hcond⟩ := Conjugacy.exists_tilt_of_fixedPoint μ
    (pathLaw_extinctionEvent_eq_one_of_single μ hext) q
    (fun j => ⟨(hq j).1.le, (hq j).2⟩) hfix
  refine ⟨μHat, ⟨⟨0, fun heq => ?_⟩, hcond⟩, htilt⟩
  have h1 := hextHat 0
  rw [heq, hext 0] at h1
  exact absurd h1 (ENNReal.inv_lt_one.2 (hq 0).1).ne'

end Conjugate

end
