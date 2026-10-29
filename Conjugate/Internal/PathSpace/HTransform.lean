/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Internal.Foundations.Extinction
public import Conjugate.Internal.PathSpace.Tilt

/-!
# The Doob h-transform on path space

Let `a ∈ (0,∞)^ι` be a fixed point of the generating function and `h(c) = ∏_j a_j ^ {c_j}`.
The path law of the tilted branching process `ν = tilt μ a …` is the Doob h-transform of the path
law of `μ`:

* `pathLaw_tilt_cylinder`: `ℙ̂_x[X(0..n) = y(0..n)] = ℙ_x[X(0..n) = y(0..n)] · h(y n) / h(x)`.
  This telescopes the one-step formula `stepKernel_tilt_singleton`;
* `pathLaw_tilt_eval_singleton`: the same for the law of the generation `n`,
  `ℙ̂_x[X(n) = z] = ℙ_x[X(n) = z] · h(z) / h(x)`, by induction on `n`;
* `pathLaw_tilt_extinctionEvent`: since `h(0) = 1`, the extinction probability of the tilted
  process is `ℙ̂_x[E] = ℙ_x[E] / h(x)` (the probability of `X(n) = 0` increases to the
  probability of extinction).
-/

public section

open MeasureTheory ProbabilityTheory

open scoped ENNReal

namespace Conjugate

variable {ι : Type*} [Countable ι]

namespace PathSpace

omit [Countable ι] in
/-- Telescoping of the h-transform weights, with the ratios `H (i + 1) / H i`. -/
lemma prod_range_div_telescope (s H : ℕ → ℝ≥0∞) (h0 : ∀ i, H i ≠ 0) (htop : ∀ i, H i ≠ ∞)
    (n : ℕ) :
    ∏ i ∈ Finset.range n, (s i * H (i + 1) / H i) = (∏ i ∈ Finset.range n, s i) * H n / H 0 := by
  induction n with
  | zero => simp [ENNReal.div_self (h0 0) (htop 0)]
  | succ n ih =>
    rw [Finset.prod_range_succ, ih, Finset.prod_range_succ]
    have hcancel : H n * (H n)⁻¹ = 1 := ENNReal.mul_inv_cancel (h0 n) (htop n)
    simp only [div_eq_mul_inv]
    calc (∏ i ∈ Finset.range n, s i) * H n * (H 0)⁻¹ * (s n * H (n + 1) * (H n)⁻¹)
        = (∏ i ∈ Finset.range n, s i) * s n * H (n + 1) * (H 0)⁻¹ * (H n * (H n)⁻¹) := by ring
      _ = _ := by rw [hcancel, mul_one]

end PathSpace

open PathSpace

section Tilt

variable (μ : ι → PMF (ι →₀ ℕ)) (a : ι → ℝ≥0∞) (ha : genFun μ a = a)
  (h0 : ∀ k, a k ≠ 0) (htop : ∀ k, a k ≠ ∞)

/-- **The h-transform formula on cylinders.** -/
theorem pathLaw_tilt_cylinder (x : ι →₀ ℕ) (n : ℕ) (y : ℕ → ι →₀ ℕ) :
    pathLaw (tilt μ a ha h0 htop) x {ω | ∀ i ≤ n, ω i = y i} =
      pathLaw μ x {ω | ∀ i ≤ n, ω i = y i} * ((y n).prod fun j m => a j ^ m) /
        (x.prod fun j m => a j ^ m) := by
  rw [pathLaw_cylinder, pathLaw_cylinder]
  simp_rw [stepKernel_tilt_singleton μ a ha h0 htop]
  rw [prod_range_div_telescope (fun i => stepKernel μ (y i) {y (i + 1)})
    (fun i => (y i).prod fun j m => a j ^ m) (fun i => prod_pow_ne_zero h0 _)
    (fun i => prod_pow_ne_top htop _) n]
  by_cases hxy : x = y 0
  · subst hxy
    simp only [Measure.dirac_apply' _ (measurableSet_singleton _), Set.indicator_of_mem,
      Set.mem_singleton_iff, Pi.one_apply, one_mul]
  · have : Measure.dirac x {y 0} = 0 := by simp [Measure.dirac_apply', hxy]
    simp [this]

/-- The law of the generation `n` of the tilted process is the h-transform of that of `μ`. -/
theorem pathLaw_tilt_eval_singleton (x : ι →₀ ℕ) (n : ℕ) (z : ι →₀ ℕ) :
    pathLaw (tilt μ a ha h0 htop) x {ω | ω n = z} =
      pathLaw μ x {ω | ω n = z} * (z.prod fun j m => a j ^ m) / (x.prod fun j m => a j ^ m) := by
  have hmap : ∀ (ν : ι → PMF (ι →₀ ℕ)) (m : ℕ) (w : ι →₀ ℕ),
      pathLaw ν x {ω | ω m = w} = ((pathLaw ν x).map fun ω => ω m) {w} := fun ν m w => by
    rw [Measure.map_apply (measurable_pi_apply m) (measurableSet_singleton w)]
    rfl
  simp_rw [hmap]
  induction n generalizing z with
  | zero =>
    rw [pathLaw_map_eval_zero, pathLaw_map_eval_zero]
    by_cases hz : x = z
    · subst hz
      simp [ENNReal.div_self (prod_pow_ne_zero h0 x) (prod_pow_ne_top htop x)]
    · simp [Measure.dirac_apply', hz]
  | succ n ih =>
    rw [pathLaw_map_eval_succ_bind, pathLaw_map_eval_succ_bind,
      Measure.bind_apply (measurableSet_singleton z) Measurable.of_discrete.aemeasurable,
      Measure.bind_apply (measurableSet_singleton z) Measurable.of_discrete.aemeasurable,
      lintegral_countable', lintegral_countable']
    simp_rw [stepKernel_tilt_singleton μ a ha h0 htop, ih]
    have hterm : ∀ c : ι →₀ ℕ,
        ((stepKernel μ c {z} * (z.prod fun j m => a j ^ m)) / (c.prod fun j m => a j ^ m)) *
          ((((pathLaw μ x).map fun ω => ω n) {c} * (c.prod fun j m => a j ^ m)) /
            (x.prod fun j m => a j ^ m)) =
        (stepKernel μ c {z} * ((pathLaw μ x).map fun ω => ω n) {c}) *
          ((z.prod fun j m => a j ^ m) * (x.prod fun j m => a j ^ m)⁻¹) := by
      intro c
      have hc : (c.prod fun j m => a j ^ m) * (c.prod fun j m => a j ^ m)⁻¹ = 1 :=
        ENNReal.mul_inv_cancel (prod_pow_ne_zero h0 c) (prod_pow_ne_top htop c)
      simp only [div_eq_mul_inv]
      calc _ = (stepKernel μ c {z} * ((pathLaw μ x).map fun ω => ω n) {c}) *
            ((z.prod fun j m => a j ^ m) * (x.prod fun j m => a j ^ m)⁻¹) *
            ((c.prod fun j m => a j ^ m) * (c.prod fun j m => a j ^ m)⁻¹) := by ring
        _ = _ := by rw [hc, mul_one]
    simp_rw [hterm]
    rw [ENNReal.tsum_mul_right]
    simp only [div_eq_mul_inv]
    ring

/-- **Extinction probability of the tilted process**: `ℙ̂_x[E] = ℙ_x[E] / h(x)`. The probability
of `{X(n) = 0}` is multiplied by `h(0) / h(x) = 1 / h(x)`, and `ℙ[E]` is its supremum. -/
theorem pathLaw_tilt_extinctionEvent (x : ι →₀ ℕ) :
    pathLaw (tilt μ a ha h0 htop) x (extinctionEvent ι) =
      pathLaw μ x (extinctionEvent ι) / (x.prod fun j m => a j ^ m) := by
  rw [pathLaw_extinctionEvent_eq_iSup, pathLaw_extinctionEvent_eq_iSup]
  simp_rw [pathLaw_tilt_eval_singleton μ a ha h0 htop x _ 0]
  simp only [Finsupp.prod_zero_index, mul_one, div_eq_mul_inv]
  rw [ENNReal.iSup_mul]

end Tilt

end Conjugate

end
