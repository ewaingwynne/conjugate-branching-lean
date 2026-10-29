/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.ExtinctionEvent
public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.PathLaw
public import Conjugate.Internal.PathSpace.Tilt
import Conjugate.Internal.Foundations.Extinction
import Conjugate.Internal.PathSpace.Cylinder
import Conjugate.Internal.PathSpace.ExtinctionFixedPoint
import Conjugate.Internal.PathSpace.HTransform
import Conjugate.Internal.PathSpace.Markov

/-!
# Conditional laws given extinction and the Doob h-transform, countable type sets

The Doob h-transform argument of `PLAN.md` §6, stated for an arbitrary countable type set `ι`
(paper.tex:934: the finite-type proofs carry over to countable types with global extinction).
Neither lemma assumes positive regularity or non-singularity.

* `exists_tilt_condLaw` (Proposition 2.1, conditional-law paragraph): if `a_k = ℙ_k[E]` and
  `0 < a_k < 1`, the tilted offspring laws `ν_k(c) = a_k⁻¹ μ_k(c) ∏_j a_j^{c_j}` form a branching
  process with `ℙ_k[· | E] = ℙ̂_k`. The extinction probabilities are a fixed point of `f`
  (`genFun_extinction`), so the tilt is defined; the two sides agree on every cylinder by the
  Markov property and `pathLaw_tilt_cylinder`.
* `exists_tilt_of_fixedPoint` (Proposition 2.2): if extinction is certain from every population
  and `A ∈ [1,∞)^ι` solves `f(A) = A`, the tilt `μ̂` has `ℙ̂_k[E] = 1/A_k` and `ℙ̂_k[· | E] = ℙ_k`
  (`pathLaw_tilt_extinctionEvent`).
* `extinctionEvent_inter_cylinder`: the extinction event is shift invariant, in the form used to
  apply the Markov property.

The lemmas live in the namespace `Conjugate.Conjugacy`.
-/

public section

open MeasureTheory ProbabilityTheory

open scoped ENNReal

namespace Conjugate.Conjugacy

open Conjugate.PathSpace

variable {ι : Type*} [Countable ι]

omit [Countable ι] in
/-- The extinction event intersected with a cylinder is the cylinder intersected with the
preimage of the extinction event under the shift: `E` does not depend on the first generations. -/
lemma extinctionEvent_inter_cylinder (n : ℕ) (y : ℕ → ι →₀ ℕ) :
    extinctionEvent ι ∩ {ω | ∀ i ≤ n, ω i = y i} =
      {ω | ∀ i ≤ n, ω i = y i} ∩ (fun (ω : ℕ → ι →₀ ℕ) (m : ℕ) => ω (n + m)) ⁻¹'
        extinctionEvent ι := by
  rw [Set.inter_comm]
  exact congrArg ({ω : ℕ → ι →₀ ℕ | ∀ i ≤ n, ω i = y i} ∩ ·)
    (extinctionEvent_eq_preimage_shift n)

/-- **Proposition 2.1, conditional-law paragraph, for a countable type set.** If `a_k = ℙ_k[E]`
and `0 < a_k < 1` for every `k`, then the tilted offspring laws
`ν_k(c) = a_k⁻¹ μ_k(c) ∏_j a_j^{c_j}` are probability mass functions, and the `ℙ_k`-conditional
law of `X` given `E` is the path law of the branching process with offspring laws `ν`. -/
theorem exists_tilt_condLaw (μ : ι → PMF (ι →₀ ℕ)) (a : ι → ℝ≥0∞)
    (ha : ∀ k, a k = pathLaw μ (Finsupp.single k 1) (extinctionEvent ι))
    (ha01 : ∀ k, 0 < a k ∧ a k < 1) :
    ∃ ν : ι → PMF (ι →₀ ℕ),
      (∀ k c, ν k c = (a k)⁻¹ * (μ k c * c.prod fun j n => a j ^ n)) ∧
      ∀ k, (pathLaw μ (Finsupp.single k 1))[|extinctionEvent ι] =
        pathLaw ν (Finsupp.single k 1) := by
  have hfix : genFun μ a = a := by
    have h := genFun_extinction μ
    rwa [show (fun k => pathLaw μ (Finsupp.single k 1) (extinctionEvent ι)) = a from
      (funext ha).symm] at h
  have h0 : ∀ k, a k ≠ 0 := fun k => (ha01 k).1.ne'
  have htop : ∀ k, a k ≠ ∞ := fun k => ((ha01 k).2.trans ENNReal.one_lt_top).ne
  refine ⟨tilt μ a hfix h0 htop, fun k c => tilt_apply μ a hfix h0 htop k c, fun k => ?_⟩
  have hpos : pathLaw μ (Finsupp.single k 1) (extinctionEvent ι) ≠ 0 :=
    (ha k) ▸ h0 k
  have : IsProbabilityMeasure ((pathLaw μ (Finsupp.single k 1))[|extinctionEvent ι]) :=
    cond_isProbabilityMeasure hpos
  refine measure_eq_of_cylinder fun n y => ?_
  have hprod : pathLaw μ (y n) (extinctionEvent ι) = (y n).prod fun j m => a j ^ m := by
    rw [pathLaw_extinctionEvent_eq_prod]
    exact Finsupp.prod_congr fun j _ => by rw [ha j]
  rw [cond_apply measurableSet_extinctionEvent, ← ha k, extinctionEvent_inter_cylinder,
    pathLaw_cylinder_inter_shift μ _ n y measurableSet_extinctionEvent, hprod,
    pathLaw_tilt_cylinder μ a hfix h0 htop, Finsupp.prod_single_index (by simp), pow_one,
    div_eq_mul_inv, mul_comm]

/-- **Proposition 2.2 for a countable type set** (without positive regularity or
non-singularity). If extinction is certain from every population and `A ∈ [1,∞)^ι` solves
`f(A) = A`, then the tilt `μ̂_k(c) = A_k⁻¹ μ_k(c) ∏_j A_j^{c_j}` is a branching process with
`ℙ̂_k[E] = 1/A_k` and `ℙ̂_k[· | E] = ℙ_k`. -/
theorem exists_tilt_of_fixedPoint (μ : ι → PMF (ι →₀ ℕ))
    (hext : ∀ x, pathLaw μ x (extinctionEvent ι) = 1)
    (A : ι → ℝ≥0∞) (hA : ∀ j, 1 ≤ A j ∧ A j < ∞) (hfix : genFun μ A = A) :
    ∃ μHat : ι → PMF (ι →₀ ℕ),
      (∀ k c, μHat k c = (A k)⁻¹ * (μ k c * c.prod fun j n => A j ^ n)) ∧
      (∀ k, pathLaw μHat (Finsupp.single k 1) (extinctionEvent ι) = (A k)⁻¹) ∧
      ∀ k, (pathLaw μHat (Finsupp.single k 1))[|extinctionEvent ι] =
        pathLaw μ (Finsupp.single k 1) := by
  have h0 : ∀ k, A k ≠ 0 := fun k => (zero_lt_one.trans_le (hA k).1).ne'
  have htop : ∀ k, A k ≠ ∞ := fun k => (hA k).2.ne
  -- the extinction probability of the tilted process from any population
  have hextHat : ∀ x : ι →₀ ℕ,
      pathLaw (tilt μ A hfix h0 htop) x (extinctionEvent ι) =
        (x.prod fun j m => A j ^ m)⁻¹ := by
    intro x
    rw [pathLaw_tilt_extinctionEvent, hext, div_eq_mul_inv, one_mul]
  refine ⟨tilt μ A hfix h0 htop, fun k c => tilt_apply μ A hfix h0 htop k c, fun k => ?_,
    fun k => ?_⟩
  · rw [hextHat, Finsupp.prod_single_index (by simp), pow_one]
  · have hk : (Finsupp.single k 1 : ι →₀ ℕ).prod (fun j m => A j ^ m) = A k := by
      rw [Finsupp.prod_single_index (by simp), pow_one]
    have hpos : pathLaw (tilt μ A hfix h0 htop) (Finsupp.single k 1)
        (extinctionEvent ι) ≠ 0 := by
      rw [hextHat, hk]
      exact ENNReal.inv_ne_zero.2 (htop k)
    have : IsProbabilityMeasure
        ((pathLaw (tilt μ A hfix h0 htop) (Finsupp.single k 1))[|extinctionEvent ι]) :=
      cond_isProbabilityMeasure hpos
    refine measure_eq_of_cylinder fun n y => ?_
    have hyn : (y n).prod (fun j m => A j ^ m) ≠ 0 := prod_pow_ne_zero h0 _
    have hynt : (y n).prod (fun j m => A j ^ m) ≠ ∞ := prod_pow_ne_top htop _
    have hAk : A k * (A k)⁻¹ = 1 := ENNReal.mul_inv_cancel (h0 k) (htop k)
    have hH : (y n).prod (fun j m => A j ^ m) * ((y n).prod fun j m => A j ^ m)⁻¹ = 1 :=
      ENNReal.mul_inv_cancel hyn hynt
    rw [cond_apply measurableSet_extinctionEvent, extinctionEvent_inter_cylinder,
      pathLaw_cylinder_inter_shift (tilt μ A hfix h0 htop) _ n y measurableSet_extinctionEvent,
      hextHat, hextHat, hk, pathLaw_tilt_cylinder μ A hfix h0 htop, hk, inv_inv]
    simp only [div_eq_mul_inv]
    calc A k * (pathLaw μ (Finsupp.single k 1) {ω | ∀ i ≤ n, ω i = y i} *
          ((y n).prod fun j m => A j ^ m) * (A k)⁻¹ * ((y n).prod fun j m => A j ^ m)⁻¹)
        = pathLaw μ (Finsupp.single k 1) {ω | ∀ i ≤ n, ω i = y i} * (A k * (A k)⁻¹) *
          (((y n).prod fun j m => A j ^ m) * ((y n).prod fun j m => A j ^ m)⁻¹) := by ring
      _ = _ := by rw [hAk, hH]; ring

end Conjugate.Conjugacy

end
