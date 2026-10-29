/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.StepKernel
public import Conjugate.Infrastructure.Population
public import Conjugate.Internal.Foundations.StepKernel
public import Mathlib.MeasureTheory.Measure.WithDensity

/-!
# The tilt of the offspring laws and the tilted step kernel

Let `a ∈ (0,∞)^ι` be a fixed point of the generating function, `f(a) = a`, and write
`h(c) = ∏_j a_j ^ {c_j}` for a population `c`. The *tilted offspring laws* are
`ν_k(c) = a_k⁻¹ μ_k(c) h(c)`. They are probability mass functions precisely because
`∑_c μ_k(c) h(c) = f_k(a) = a_k`; `tilt` is built from this `HasSum` (the equation (2.1) / (2.2)
of the paper).

* `tilt_apply`: the formula for the tilted offspring laws;
* `stepKernel_tilt_singleton`: the Doob h-transform at the level of one generation, namely
  the step kernel of the tilted offspring laws is
  `stepKernel μ z {w} * h(w) / h(z)`. This is because the tilt is multiplicative over the
  individuals of `z` and `∏_p a_{type p} = h(z)`; and `h` of a sum of offspring is the product
  of the `h`'s.
-/

public section

open MeasureTheory ProbabilityTheory

open scoped ENNReal

namespace Conjugate

variable {ι : Type*} [Countable ι]

namespace PathSpace

omit [Countable ι] in
/-- `h(c) = ∏_j a_j ^ {c_j}` is positive when all the `a_j` are. -/
lemma prod_pow_ne_zero {a : ι → ℝ≥0∞} (h0 : ∀ k, a k ≠ 0) (c : ι →₀ ℕ) :
    (c.prod fun j n => a j ^ n) ≠ 0 :=
  Finset.prod_ne_zero_iff.2 fun j _ => pow_ne_zero _ (h0 j)

omit [Countable ι] in
/-- `h(c) = ∏_j a_j ^ {c_j}` is finite when all the `a_j` are. -/
lemma prod_pow_ne_top {a : ι → ℝ≥0∞} (htop : ∀ k, a k ≠ ∞) (c : ι →₀ ℕ) :
    (c.prod fun j n => a j ^ n) ≠ ∞ :=
  ENNReal.prod_ne_top fun j _ => ENNReal.pow_ne_top (htop j)

/-- The tilted offspring weights sum to one. -/
lemma tilt_hasSum (μ : ι → PMF (ι →₀ ℕ)) (a : ι → ℝ≥0∞) (ha : genFun μ a = a)
    (h0 : ∀ k, a k ≠ 0) (htop : ∀ k, a k ≠ ∞) (k : ι) :
    HasSum (fun c : ι →₀ ℕ => (a k)⁻¹ * (μ k c * c.prod fun j n => a j ^ n)) 1 := by
  have h1 : ∑' c : ι →₀ ℕ, μ k c * c.prod (fun j n => a j ^ n) = a k := by
    have h := congrFun ha k
    rw [genFun, lintegral_countable'] at h
    simp_rw [PMF.toMeasure_apply_singleton _ _ (measurableSet_singleton _)] at h
    simpa [mul_comm] using h
  have hs := (CompleteLattice.summable (f := fun c : ι →₀ ℕ =>
    (a k)⁻¹ * (μ k c * c.prod fun j n => a j ^ n))).hasSum
  rw [ENNReal.tsum_mul_left, h1, ENNReal.inv_mul_cancel (h0 k) (htop k)] at hs
  exact hs

end PathSpace

open PathSpace

/-- **The tilted offspring laws** `ν_k(c) = a_k⁻¹ μ_k(c) ∏_j a_j ^ {c_j}`, for a fixed point
`a` of the generating function (display (2.1) / (2.2) of the paper). They are genuine
probability mass functions, by `tilt_hasSum`. -/
@[expose] noncomputable def tilt (μ : ι → PMF (ι →₀ ℕ)) (a : ι → ℝ≥0∞) (ha : genFun μ a = a)
    (h0 : ∀ k, a k ≠ 0) (htop : ∀ k, a k ≠ ∞) : ι → PMF (ι →₀ ℕ) := fun k =>
  ⟨fun c => (a k)⁻¹ * (μ k c * c.prod fun j n => a j ^ n), tilt_hasSum μ a ha h0 htop k⟩

theorem tilt_apply (μ : ι → PMF (ι →₀ ℕ)) (a : ι → ℝ≥0∞) (ha : genFun μ a = a)
    (h0 : ∀ k, a k ≠ 0) (htop : ∀ k, a k ≠ ∞) (k : ι) (c : ι →₀ ℕ) :
    tilt μ a ha h0 htop k c = (a k)⁻¹ * (μ k c * c.prod fun j n => a j ^ n) :=
  rfl

namespace PathSpace

omit [Countable ι] in
/-- A product over the individuals of a population depends on the types only. -/
lemma prod_individuals (F : ι → ℝ≥0∞) (z : ι →₀ ℕ) :
    ∏ p : Individuals z, F p.1.1 = z.prod fun k n => F k ^ n := by
  simp only [Individuals, Fintype.prod_sigma, Finset.prod_const, Finset.card_univ,
    Fintype.card_fin]
  rw [Finsupp.prod]
  exact Finset.prod_coe_sort z.support (fun k => F k ^ z k)

omit [Countable ι] in
/-- The inverse of `h(z)` is the product of the inverses over the individuals of `z`. -/
lemma prod_individuals_inv {a : ι → ℝ≥0∞} (htop : ∀ k, a k ≠ ∞) (z : ι →₀ ℕ) :
    ∏ p : Individuals z, (a p.1.1)⁻¹ = (z.prod fun j n => a j ^ n)⁻¹ := by
  rw [prod_individuals (fun k => (a k)⁻¹) z, Finsupp.prod, Finsupp.prod,
    ENNReal.prod_inv_distrib (fun i _ j _ _ => Or.inr (ENNReal.pow_ne_top (htop j)))]
  exact Finset.prod_congr rfl fun k _ => (ENNReal.inv_pow).symm

end PathSpace

section Density

variable (μ : ι → PMF (ι →₀ ℕ)) (a : ι → ℝ≥0∞) (ha : genFun μ a = a)
  (h0 : ∀ k, a k ≠ 0) (htop : ∀ k, a k ≠ ∞)

/-- The product of the tilted offspring laws of the individuals of `z` has a density with
respect to the product of the original laws. -/
lemma offspringPi_tilt (z : ι →₀ ℕ) :
    offspringPi (tilt μ a ha h0 htop) z =
      (offspringPi μ z).withDensity fun y =>
        ∏ p : Individuals z, ((a p.1.1)⁻¹ * (y p).prod fun j n => a j ^ n) := by
  refine Measure.ext_of_singleton fun y => ?_
  rw [withDensity_apply _ (measurableSet_singleton y), lintegral_singleton, offspringPi,
    offspringPi, Measure.pi_singleton, Measure.pi_singleton, ← Finset.prod_mul_distrib]
  refine Finset.prod_congr rfl fun p _ => ?_
  rw [PMF.toMeasure_apply_singleton _ _ (measurableSet_singleton _),
    PMF.toMeasure_apply_singleton _ _ (measurableSet_singleton _), tilt_apply]
  ring

/-- **The h-transform of one generation.** The step kernel of the tilted offspring laws is
the step kernel of `μ` tilted by `h(w)/h(z)`. -/
theorem stepKernel_tilt_singleton (z w : ι →₀ ℕ) :
    stepKernel (tilt μ a ha h0 htop) z {w} =
      stepKernel μ z {w} * (w.prod fun j m => a j ^ m) / (z.prod fun j m => a j ^ m) := by
  have hS : MeasurableSet ((fun y : Individuals z → ι →₀ ℕ => ∑ p, y p) ⁻¹' {w}) :=
    (measurable_of_countable _) (measurableSet_singleton w)
  have hcongr : ∀ y ∈ (fun y : Individuals z → ι →₀ ℕ => ∑ p, y p) ⁻¹' {w},
      (∏ p : Individuals z, ((a p.1.1)⁻¹ * (y p).prod fun j n => a j ^ n)) =
        (z.prod fun j n => a j ^ n)⁻¹ * (w.prod fun j m => a j ^ m) := by
    intro y hy
    rw [Finset.prod_mul_distrib, prod_individuals_inv htop, ← prod_finset_sum_pow]
    have hy' : ∑ p, y p = w := hy
    rw [hy']
  rw [stepKernel_eq_map, Measure.map_apply (measurable_of_countable _) (measurableSet_singleton w),
    offspringPi_tilt, withDensity_apply _ hS, setLIntegral_congr_fun hS hcongr, setLIntegral_const,
    stepKernel_eq_map, Measure.map_apply (measurable_of_countable _) (measurableSet_singleton w),
    div_eq_mul_inv]
  ring

end Density

end Conjugate

end
