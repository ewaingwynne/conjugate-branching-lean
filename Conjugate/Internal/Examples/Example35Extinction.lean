/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.ExtinctionEvent
public import Conjugate.Frozen.Defs.PathLaw
public import Conjugate.Internal.Examples.Example35Weight
import Conjugate.Internal.Foundations.Extinction
import Conjugate.Internal.Foundations.Generations
import Conjugate.Internal.Foundations.StepKernel

/-!
# Example 3.5: global extinction

Let `e_k = 𝔼_k[W(X(1))] < 1` (the fourth condition of (3.23)), `W c = ∑_j (j+1) c_j`.

* `lintegral_stepKernel_wt`: `W` is additive, so `𝔼_y[W(X(1))] = ∑_k y_k e_k`;
* `theta` is `max (e_0, 1/2) < 1`, and for `k ≥ 1` we have `e_k < 1 ≤ (k+1)/2 ≤ θ (k+1)`, so
  `𝔼_y[W(X(1))] ≤ θ W(y)` (`lintegral_stepKernel_wt_le`);
* `lintegral_wt_pathLaw_le`: by the Markov property `𝔼_x[W(X(n))] ≤ θⁿ W(x)`;
* `pathLaw_ne_zero_le`: `ℙ_x[X(n) ≠ 0] ≤ 𝔼_x[W(X(n))]`, since `W ≥ 1` off `0`;
* `pathLaw_extinctionEvent_eq_one_of_wt`: extinction is certain from every single individual.
-/

public section

open MeasureTheory Filter Topology

open scoped ENNReal

namespace Conjugate.Internal.Example35

variable (μ : ℕ → PMF (ℕ →₀ ℕ))

/-- **Additivity of the mean weight**: `𝔼_y[W(X(1))] = ∑_k y_k 𝔼_k[W(X(1))]`. -/
lemma lintegral_stepKernel_wt (y : ℕ →₀ ℕ) :
    ∫⁻ z, (wt z : ℝ≥0∞) ∂(stepKernel μ y) =
      y.sum fun k n => (n : ℝ≥0∞) * ∫⁻ c, (wt c : ℝ≥0∞) ∂(μ k).toMeasure := by
  rw [lintegral_stepKernel]
  have hsum : ∀ z : Individuals y → ℕ →₀ ℕ,
      ((wt (∑ p, z p) : ℕ) : ℝ≥0∞) = ∑ p, ((wt (z p) : ℕ) : ℝ≥0∞) := by
    intro z
    rw [map_sum, Nat.cast_sum]
  simp_rw [hsum]
  rw [lintegral_finsetSum (f := fun (p : Individuals y) (z : Individuals y → ℕ →₀ ℕ) =>
    ((wt (z p) : ℕ) : ℝ≥0∞)) _ (fun p _ =>
      (Measurable.of_discrete (f := fun c : ℕ →₀ ℕ => ((wt c : ℕ) : ℝ≥0∞))).comp
        (measurable_pi_apply p))]
  have hterm : ∀ p : Individuals y,
      ∫⁻ z, ((wt (z p) : ℕ) : ℝ≥0∞) ∂(offspringPi μ y) =
        ∫⁻ c, (wt c : ℝ≥0∞) ∂(μ p.1).toMeasure := by
    intro p
    exact (measurePreserving_eval (fun p : Individuals y => (μ p.1).toMeasure) p).lintegral_comp
      (f := fun c : ℕ →₀ ℕ => ((wt c : ℕ) : ℝ≥0∞)) Measurable.of_discrete
  simp only [hterm, Individuals, Fintype.sum_sigma, Finset.sum_const, Finset.card_univ,
    Fintype.card_fin, nsmul_eq_mul]
  rw [Finsupp.sum]
  exact Finset.sum_coe_sort y.support
    (fun k => (y k : ℝ≥0∞) * ∫⁻ c, (wt c : ℝ≥0∞) ∂(μ k).toMeasure)

/-- The contraction factor `θ = max (e_0, 1/2)`. -/
noncomputable def theta : ℝ≥0∞ := max (∫⁻ c, (wt c : ℝ≥0∞) ∂(μ 0).toMeasure) 2⁻¹

variable {μ}

lemma theta_lt_one (he : ∀ k, ∫⁻ c, (wt c : ℝ≥0∞) ∂(μ k).toMeasure < 1) : theta μ < 1 :=
  max_lt (he 0) (ENNReal.inv_lt_one.2 ENNReal.one_lt_two)

/-- For every type `k`, `e_k ≤ θ (k + 1)`. -/
lemma lintegral_wt_le_theta_mul (he : ∀ k, ∫⁻ c, (wt c : ℝ≥0∞) ∂(μ k).toMeasure < 1) (k : ℕ) :
    ∫⁻ c, (wt c : ℝ≥0∞) ∂(μ k).toMeasure ≤ theta μ * ((k : ℝ≥0∞) + 1) := by
  rcases Nat.eq_zero_or_pos k with rfl | hk
  · simp [theta]
  · have h2 : (2 : ℝ≥0∞) ≤ (k : ℝ≥0∞) + 1 := by
      have : (1 : ℝ≥0∞) ≤ k := by exact_mod_cast hk
      calc (2 : ℝ≥0∞) = 1 + 1 := one_add_one_eq_two.symm
        _ ≤ (k : ℝ≥0∞) + 1 := add_le_add this le_rfl
    calc ∫⁻ c, (wt c : ℝ≥0∞) ∂(μ k).toMeasure ≤ 1 := (he k).le
      _ = 2⁻¹ * 2 := (ENNReal.inv_mul_cancel two_ne_zero ENNReal.ofNat_ne_top).symm
      _ ≤ theta μ * ((k : ℝ≥0∞) + 1) := by
        gcongr
        exact le_max_right _ _

/-- **One step**: `𝔼_y[W(X(1))] ≤ θ W(y)`. -/
lemma lintegral_stepKernel_wt_le (he : ∀ k, ∫⁻ c, (wt c : ℝ≥0∞) ∂(μ k).toMeasure < 1)
    (y : ℕ →₀ ℕ) :
    ∫⁻ z, (wt z : ℝ≥0∞) ∂(stepKernel μ y) ≤ theta μ * (wt y : ℝ≥0∞) := by
  rw [lintegral_stepKernel_wt, wt_eq y, Finsupp.sum, Finsupp.sum, Nat.cast_sum, Finset.mul_sum]
  refine Finset.sum_le_sum fun k _ => ?_
  push_cast
  calc (y k : ℝ≥0∞) * ∫⁻ c, (wt c : ℝ≥0∞) ∂(μ k).toMeasure
      ≤ y k * (theta μ * ((k : ℝ≥0∞) + 1)) := by
        gcongr
        exact lintegral_wt_le_theta_mul he k
    _ = theta μ * (((k : ℝ≥0∞) + 1) * y k) := by ring

/-- **Geometric decay of the mean weight**: `𝔼_x[W(X(n))] ≤ θⁿ W(x)`. -/
lemma lintegral_wt_pathLaw_le (he : ∀ k, ∫⁻ c, (wt c : ℝ≥0∞) ∂(μ k).toMeasure < 1)
    (x : ℕ →₀ ℕ) (n : ℕ) :
    ∫⁻ ω, (wt (ω n) : ℝ≥0∞) ∂(pathLaw μ x) ≤ theta μ ^ n * (wt x : ℝ≥0∞) := by
  induction n with
  | zero =>
    rw [lintegral_pathLaw_zero μ x (fun a => (wt a : ℝ≥0∞))]
    simp
  | succ n ih =>
    rw [lintegral_pathLaw_succ μ x n (fun y => (wt y : ℝ≥0∞))]
    calc ∫⁻ ω, ∫⁻ y, (wt y : ℝ≥0∞) ∂stepKernel μ (ω n) ∂pathLaw μ x
        ≤ ∫⁻ ω, theta μ * (wt (ω n) : ℝ≥0∞) ∂pathLaw μ x :=
          lintegral_mono fun ω => lintegral_stepKernel_wt_le he (ω n)
      _ = theta μ * ∫⁻ ω, (wt (ω n) : ℝ≥0∞) ∂pathLaw μ x :=
          lintegral_const_mul _ ((Measurable.of_discrete
            (f := fun c : ℕ →₀ ℕ => (wt c : ℝ≥0∞))).comp (measurable_pi_apply n))
      _ ≤ theta μ * (theta μ ^ n * (wt x : ℝ≥0∞)) := by gcongr
      _ = theta μ ^ (n + 1) * (wt x : ℝ≥0∞) := by ring

/-- **Markov's inequality** for the weight: `ℙ_x[X(n) ≠ 0] ≤ 𝔼_x[W(X(n))]`. -/
lemma pathLaw_ne_zero_le (x : ℕ →₀ ℕ) (n : ℕ) :
    pathLaw μ x {ω | ω n ≠ 0} ≤ ∫⁻ ω, (wt (ω n) : ℝ≥0∞) ∂(pathLaw μ x) := by
  have hgm : Measurable fun ω : ℕ → ℕ →₀ ℕ => (wt (ω n) : ℝ≥0∞) :=
    (Measurable.of_discrete (f := fun c : ℕ →₀ ℕ => (wt c : ℝ≥0∞))).comp (measurable_pi_apply n)
  calc pathLaw μ x {ω | ω n ≠ 0} ≤ pathLaw μ x {ω | 1 ≤ (wt (ω n) : ℝ≥0∞)} := by
        refine measure_mono fun ω hω => ?_
        have : 1 ≤ wt (ω n) := one_le_wt hω
        exact_mod_cast this
    _ ≤ ∫⁻ ω, (wt (ω n) : ℝ≥0∞) ∂(pathLaw μ x) := by
        simpa using mul_meas_ge_le_lintegral₀ hgm.aemeasurable 1

/-- **Global extinction** (Example 3.5, `#global-extinction`): if `𝔼_k[W(X(1))] < 1` for every
type `k`, then extinction is certain from a single individual of every type. -/
theorem pathLaw_extinctionEvent_eq_one_of_wt
    (he : ∀ k, ∫⁻ c, (wt c : ℝ≥0∞) ∂(μ k).toMeasure < 1) (k : ℕ) :
    pathLaw μ (Finsupp.single k 1) (extinctionEvent ℕ) = 1 := by
  refine le_antisymm prob_le_one ?_
  rw [pathLaw_extinctionEvent_eq_iSup]
  have hbound : ∀ n, 1 - theta μ ^ n * ((k : ℝ≥0∞) + 1) ≤
      pathLaw μ (Finsupp.single k 1) {ω | ω n = 0} := by
    intro n
    have hcompl : {ω : ℕ → ℕ →₀ ℕ | ω n = 0} = {ω | ω n ≠ 0}ᶜ := by
      ext ω
      simp
    have hmeas : MeasurableSet {ω : ℕ → ℕ →₀ ℕ | ω n ≠ 0} :=
      (measurableSet_singleton (0 : ℕ →₀ ℕ)).compl.preimage (measurable_pi_apply n)
    rw [hcompl, prob_compl_eq_one_sub hmeas]
    refine tsub_le_tsub_left ?_ 1
    calc pathLaw μ (Finsupp.single k 1) {ω | ω n ≠ 0}
        ≤ ∫⁻ ω, (wt (ω n) : ℝ≥0∞) ∂(pathLaw μ (Finsupp.single k 1)) := pathLaw_ne_zero_le _ n
      _ ≤ theta μ ^ n * (wt (Finsupp.single k 1) : ℝ≥0∞) := lintegral_wt_pathLaw_le he _ n
      _ = theta μ ^ n * ((k : ℝ≥0∞) + 1) := by rw [wt_single]; push_cast; rfl
  have hs : Tendsto (fun n => theta μ ^ n * ((k : ℝ≥0∞) + 1)) atTop (𝓝 0) := by
    have := ENNReal.Tendsto.mul_const
      (ENNReal.tendsto_pow_atTop_nhds_zero_iff.2 (theta_lt_one he))
      (Or.inr (by simp : ((k : ℝ≥0∞) + 1) ≠ ⊤))
    simpa using this
  have hlim : Tendsto (fun n => 1 - theta μ ^ n * ((k : ℝ≥0∞) + 1)) atTop (𝓝 1) := by
    simpa using ENNReal.Tendsto.sub (tendsto_const_nhds (x := (1 : ℝ≥0∞))) hs
      (Or.inl ENNReal.one_ne_top)
  exact le_of_tendsto' hlim fun n => (hbound n).trans
    (le_iSup (fun n => pathLaw μ (Finsupp.single k 1) {ω | ω n = 0}) n)

end Conjugate.Internal.Example35

end
