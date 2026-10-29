/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.ExtinctionEvent
public import Conjugate.Frozen.Defs.PathLaw
public import Conjugate.Frozen.Defs.GenFun
import Conjugate.Internal.Foundations.Extinction
import Conjugate.Internal.PathSpace.Cylinder
import Conjugate.Internal.PathSpace.HTransform
import Conjugate.Internal.PathSpace.Markov
import Conjugate.Internal.PathSpace.Tilt

/-!
# Provider for `Conjugate.proposition_2_2`

Implementation module for the frozen anchor `Conjugate/Frozen/Proposition_2_2.lean`.
The anchor is SEALED (its body is `by exact` of the theorem below).

The proof is the Doob h-transform on cylinder sets (`PLAN.md` §6) for the fixed point `A` of
`f`, with `h(c) = ∏_j A_j^{c_j}`. The tilted offspring laws `μ̂ = tilt μ A …` are probability
mass functions because `f(A) = A`. Their extinction probability is
`ℙ̂_x[X(n) = 0] = ℙ_x[X(n) = 0] / h(x) → 1 / h(x)`, since `h(0) = 1` and `ℙ_x[E] = 1`
(`pathLaw_tilt_extinctionEvent`). Finally `ℙ̂_x[· | E]` and `ℙ_x` agree on cylinders: by the
Markov property for `μ̂`, `ℙ̂_x[C ∩ E] = ℙ̂_x[C] · ℙ̂_{y_n}[E] = ℙ_x[C] h(y_n)/h(x) · h(y_n)⁻¹`,
and dividing by `ℙ̂_x[E] = h(x)⁻¹` gives `ℙ_x[C]`.
-/

public section

open MeasureTheory ProbabilityTheory

open scoped ENNReal

namespace Conjugate.Internal

open Conjugate.PathSpace

theorem proposition_2_2 {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hpr : IsPositiveRegular μ) (hns : IsNonsingular μ)
    (hext : ∀ x, pathLaw μ x (extinctionEvent (Fin d)) = 1)
    (A : Fin d → ℝ≥0∞) (hA : ∀ j, 1 ≤ A j ∧ A j < ∞) (hfix : genFun μ A = A) :
    ∃ μHat : Fin d → PMF (Fin d →₀ ℕ),
      (∀ k c, μHat k c = (A k)⁻¹ * (μ k c * c.prod fun j n => A j ^ n)) ∧
      (∀ k, pathLaw μHat (Finsupp.single k 1) (extinctionEvent (Fin d)) = (A k)⁻¹) ∧
      ∀ k, (pathLaw μHat (Finsupp.single k 1))[|extinctionEvent (Fin d)] =
        pathLaw μ (Finsupp.single k 1) := by
  have h0 : ∀ k, A k ≠ 0 := fun k => (zero_lt_one.trans_le (hA k).1).ne'
  have htop : ∀ k, A k ≠ ∞ := fun k => (hA k).2.ne
  -- the extinction probability of the tilted process from any population
  have hextHat : ∀ x : Fin d →₀ ℕ,
      pathLaw (tilt μ A hfix h0 htop) x (extinctionEvent (Fin d)) =
        (x.prod fun j m => A j ^ m)⁻¹ := by
    intro x
    rw [pathLaw_tilt_extinctionEvent, hext, div_eq_mul_inv, one_mul]
  refine ⟨tilt μ A hfix h0 htop, fun k c => tilt_apply μ A hfix h0 htop k c, fun k => ?_,
    fun k => ?_⟩
  · rw [hextHat, Finsupp.prod_single_index (by simp), pow_one]
  · have hk : (Finsupp.single k 1 : Fin d →₀ ℕ).prod (fun j m => A j ^ m) = A k := by
      rw [Finsupp.prod_single_index (by simp), pow_one]
    have hpos : pathLaw (tilt μ A hfix h0 htop) (Finsupp.single k 1)
        (extinctionEvent (Fin d)) ≠ 0 := by
      rw [hextHat, hk]
      exact ENNReal.inv_ne_zero.2 (htop k)
    have : IsProbabilityMeasure
        ((pathLaw (tilt μ A hfix h0 htop) (Finsupp.single k 1))[|extinctionEvent (Fin d)]) :=
      cond_isProbabilityMeasure hpos
    refine measure_eq_of_cylinder fun n y => ?_
    have hE : extinctionEvent (Fin d) ∩ {ω | ∀ i ≤ n, ω i = y i} =
        {ω | ∀ i ≤ n, ω i = y i} ∩ (fun (ω : ℕ → Fin d →₀ ℕ) (m : ℕ) => ω (n + m)) ⁻¹'
          extinctionEvent (Fin d) := by
      rw [Set.inter_comm]
      exact congrArg ({ω : ℕ → Fin d →₀ ℕ | ∀ i ≤ n, ω i = y i} ∩ ·)
        (extinctionEvent_eq_preimage_shift n)
    have hyn : (y n).prod (fun j m => A j ^ m) ≠ 0 := prod_pow_ne_zero h0 _
    have hynt : (y n).prod (fun j m => A j ^ m) ≠ ∞ := prod_pow_ne_top htop _
    have hAk : A k * (A k)⁻¹ = 1 := ENNReal.mul_inv_cancel (h0 k) (htop k)
    have hH : (y n).prod (fun j m => A j ^ m) * ((y n).prod fun j m => A j ^ m)⁻¹ = 1 :=
      ENNReal.mul_inv_cancel hyn hynt
    rw [cond_apply measurableSet_extinctionEvent, hE,
      pathLaw_cylinder_inter_shift (tilt μ A hfix h0 htop) _ n y measurableSet_extinctionEvent,
      hextHat, hextHat, hk, pathLaw_tilt_cylinder μ A hfix h0 htop, hk, inv_inv]
    simp only [div_eq_mul_inv]
    calc A k * (pathLaw μ (Finsupp.single k 1) {ω | ∀ i ≤ n, ω i = y i} *
          ((y n).prod fun j m => A j ^ m) * (A k)⁻¹ * ((y n).prod fun j m => A j ^ m)⁻¹)
        = pathLaw μ (Finsupp.single k 1) {ω | ∀ i ≤ n, ω i = y i} * (A k * (A k)⁻¹) *
          (((y n).prod fun j m => A j ^ m) * ((y n).prod fun j m => A j ^ m)⁻¹) := by ring
      _ = _ := by rw [hAk, hH]; ring

end Conjugate.Internal

end
