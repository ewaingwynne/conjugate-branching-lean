/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.ExtinctionEvent
public import Conjugate.Frozen.Defs.PathLaw
import Conjugate.Internal.Foundations.Extinction
import Conjugate.Internal.PathSpace.Cylinder
import Conjugate.Internal.PathSpace.ExtinctionFixedPoint
import Conjugate.Internal.PathSpace.HTransform
import Conjugate.Internal.PathSpace.Markov
import Conjugate.Internal.PathSpace.Tilt

/-!
# Provider for `Conjugate.proposition_2_1_condLaw`

Implementation module for the frozen anchor `Conjugate/Frozen/Proposition_2_1_CondLaw.lean`.
The anchor is SEALED (its body is `by exact` of the theorem below).

The proof is the Doob h-transform on cylinder sets (`PLAN.md` §6). The extinction probabilities
`a_k = ℙ_k[E]` are a fixed point of the generating function (`genFun_extinction`), so the tilted
offspring laws `ν_k(c) = a_k⁻¹ μ_k(c) ∏_j a_j^{c_j}` are probability mass functions (`tilt`).
Both `ℙ_k[· | E]` and the path law of `ν` are finite measures on path space, and they agree on
every cylinder: `E` is invariant under the shift, so by the Markov property
`ℙ_k[C ∩ E] = ℙ_k[C] · ℙ_{y_n}[E] = ℙ_k[C] · h(y_n)`, which divided by `ℙ_k[E] = a_k` is
`ℙ̂_k[C]` by `pathLaw_tilt_cylinder`.
-/

public section

open MeasureTheory ProbabilityTheory

open scoped ENNReal

namespace Conjugate.Internal

open Conjugate.PathSpace

theorem proposition_2_1_condLaw {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hpr : IsPositiveRegular μ) (hns : IsNonsingular μ)
    (a : Fin d → ℝ≥0∞)
    (ha : ∀ k, a k = pathLaw μ (Finsupp.single k 1) (extinctionEvent (Fin d)))
    (ha01 : ∀ k, 0 < a k ∧ a k < 1) :
    ∃ ν : Fin d → PMF (Fin d →₀ ℕ),
      (∀ k c, ν k c = (a k)⁻¹ * (μ k c * c.prod fun j n => a j ^ n)) ∧
      ∀ k, (pathLaw μ (Finsupp.single k 1))[|extinctionEvent (Fin d)] =
        pathLaw ν (Finsupp.single k 1) := by
  have hfix : genFun μ a = a := by
    have h := genFun_extinction μ
    rwa [show (fun k => pathLaw μ (Finsupp.single k 1) (extinctionEvent (Fin d))) = a from
      (funext ha).symm] at h
  have h0 : ∀ k, a k ≠ 0 := fun k => (ha01 k).1.ne'
  have htop : ∀ k, a k ≠ ∞ := fun k => ((ha01 k).2.trans ENNReal.one_lt_top).ne
  refine ⟨tilt μ a hfix h0 htop, fun k c => tilt_apply μ a hfix h0 htop k c, fun k => ?_⟩
  have hpos : pathLaw μ (Finsupp.single k 1) (extinctionEvent (Fin d)) ≠ 0 :=
    (ha k) ▸ h0 k
  have : IsProbabilityMeasure ((pathLaw μ (Finsupp.single k 1))[|extinctionEvent (Fin d)]) :=
    cond_isProbabilityMeasure hpos
  refine measure_eq_of_cylinder fun n y => ?_
  have hE : extinctionEvent (Fin d) ∩ {ω | ∀ i ≤ n, ω i = y i} =
      {ω | ∀ i ≤ n, ω i = y i} ∩ (fun (ω : ℕ → Fin d →₀ ℕ) (m : ℕ) => ω (n + m)) ⁻¹'
        extinctionEvent (Fin d) := by
    rw [Set.inter_comm]
    exact congrArg ({ω : ℕ → Fin d →₀ ℕ | ∀ i ≤ n, ω i = y i} ∩ ·)
      (extinctionEvent_eq_preimage_shift n)
  have hprod : pathLaw μ (y n) (extinctionEvent (Fin d)) = (y n).prod fun j m => a j ^ m := by
    rw [pathLaw_extinctionEvent_eq_prod]
    exact Finsupp.prod_congr fun j _ => by rw [ha j]
  rw [cond_apply measurableSet_extinctionEvent, ← ha k, hE,
    pathLaw_cylinder_inter_shift μ _ n y measurableSet_extinctionEvent, hprod,
    pathLaw_tilt_cylinder μ a hfix h0 htop, Finsupp.prod_single_index (by simp), pow_one,
    div_eq_mul_inv, mul_comm]

end Conjugate.Internal

end
