/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.IsConjugate
public import Conjugate.Frozen.Defs.IsSubcritical
public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.GenFun
import Conjugate.Frozen.Proposition_2_2
import Conjugate.Internal.Foundations.Extinction

/-!
# Fixed point ⇒ conjugate

`isConjugate_of_fixedPoint` (graph step `thm-fixed-gf.equivalence#fixed-point-to-conjugate`,
paper.tex:238): if `q ∈ (1,∞)^d` satisfies `f(q) = q`, then the tilt
`μ̂_k(c) = q_k⁻¹ μ_k(c) ∏_j q_j^{c_j}` (Proposition 2.2) is the offspring law of a conjugate
branching process.

The subcritical process dies out from every population (`pathLaw_extinctionEvent_eq_one`),
which is the extra hypothesis of the sealed anchor `Conjugate.proposition_2_2`. It gives
`ℙ̂_k[·| E] = ℙ_k` and `ℙ̂_k[E] = 1/q_k < 1 = ℙ_k[E]`, so the laws differ.
`IsNonsingular` provides a type `k`, hence `d ≥ 1`, at which the two laws differ.
-/

public section

open MeasureTheory ProbabilityTheory

open scoped ENNReal

namespace Conjugate

/-- **Fixed point ⇒ conjugate, with the explicit tilt** (paper.tex:238, ERRATA R3): if
`q ∈ (1,∞)^d` solves `f(q) = q`, the tilt of `μ` by `q` is a conjugate. -/
theorem isConjugate_of_fixedPoint {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hsub : IsSubcritical μ) (hpr : IsPositiveRegular μ) (hns : IsNonsingular μ)
    {q : Fin d → ℝ≥0∞} (hq : ∀ j, 1 < q j ∧ q j < ∞) (hfix : genFun μ q = q) :
    ∃ μHat, IsConjugate μ μHat ∧
      ∀ k c, μHat k c = (q k)⁻¹ * (μ k c * c.prod fun j n => q j ^ n) := by
  obtain ⟨μHat, htilt, hextHat, hcond⟩ := proposition_2_2 μ hpr hns
    (pathLaw_extinctionEvent_eq_one μ hsub) q (fun j => ⟨(hq j).1.le, (hq j).2⟩) hfix
  refine ⟨μHat, ⟨?_, hcond⟩, htilt⟩
  obtain ⟨k, -⟩ := hns
  refine ⟨k, fun heq => ?_⟩
  have h1 := hextHat k
  rw [heq, pathLaw_extinctionEvent_eq_one μ hsub] at h1
  exact absurd h1 (ENNReal.inv_lt_one.2 (hq k).1).ne'

end Conjugate

end
