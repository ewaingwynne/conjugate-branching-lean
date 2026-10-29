/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.MeanMatrix
public import Conjugate.Infrastructure.StepKernel
import Mathlib.Probability.Independence.Integration

/-!
# One-step facts for `stepKernel`

The kernel `stepKernel μ x` is the law of the sum of independent offspring vectors, one for
every individual of the population `x`. This file proves its basic characterizations:

* `stepKernel_zero`: the empty population has no offspring;
* `stepKernel_single`: one individual of type `k` has offspring law `μ k`;
* `lintegral_stepKernel_prod`: the one-step generating function formula, which is the
  multiplicativity of the generating function over independent individuals (display (1.2) for
  `n = 1`, paper.tex:209-213);
* `lintegral_stepKernel_apply`: the one-step mean formula, which is additivity of the means
  (paper.tex:215-220).
-/

public section

open MeasureTheory ProbabilityTheory

open scoped ENNReal

namespace Conjugate

variable {ι : Type*} [Countable ι]

/-- The finite set of individuals of a population: the pairs `(j, i)` with `j` in the support of
`x` and `i < x j`. -/
abbrev Individuals (x : ι →₀ ℕ) : Type _ := Σ j : x.support, Fin (x j)

/-- The product measure of the offspring laws of the individuals of `x`. -/
noncomputable abbrev offspringPi (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) :
    Measure (Individuals x → ι →₀ ℕ) :=
  Measure.pi fun p : Individuals x => (μ p.1).toMeasure

lemma stepKernel_eq_map (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) :
    stepKernel μ x = (offspringPi μ x).map fun y => ∑ p, y p := rfl

/-- Integration against `stepKernel μ x` is integration of the sum of the offspring vectors
against the product of the offspring laws. -/
lemma lintegral_stepKernel (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) (f : (ι →₀ ℕ) → ℝ≥0∞) :
    ∫⁻ y, f y ∂(stepKernel μ x) = ∫⁻ z, f (∑ p, z p) ∂(offspringPi μ x) := by
  rw [stepKernel_eq_map]
  exact lintegral_map (Measurable.of_discrete) (measurable_of_countable _)

/-- A product formula for the product measure of a finite family of probability measures. -/
lemma lintegral_pi_prod {κ : Type*} [Fintype κ] {E : κ → Type*} [∀ i, MeasurableSpace (E i)]
    (ν : ∀ i, Measure (E i)) [∀ i, IsProbabilityMeasure (ν i)] (f : ∀ i, E i → ℝ≥0∞)
    (hf : ∀ i, Measurable (f i)) :
    ∫⁻ z, ∏ i, f i (z i) ∂(Measure.pi ν) = ∏ i, ∫⁻ a, f i a ∂(ν i) := by
  have h := lintegral_prod_eq_prod_lintegral_of_indepFun (μ := Measure.pi ν) Finset.univ
    (fun i z => f i (z i)) (iIndepFun_pi fun i => (hf i).aemeasurable)
    (fun i => (hf i).comp (measurable_pi_apply i))
  rw [h]
  refine Finset.prod_congr rfl fun i _ => ?_
  exact (measurePreserving_eval ν i).lintegral_comp (hf i)

/-- The empty population has no offspring. -/
theorem stepKernel_zero (μ : ι → PMF (ι →₀ ℕ)) : stepKernel μ 0 = Measure.dirac 0 := by
  have : IsEmpty (Individuals (0 : ι →₀ ℕ)) :=
    ⟨fun p => (Finsupp.mem_support_iff.1 p.1.2) rfl⟩
  rw [stepKernel_eq_map, offspringPi, Measure.pi_of_empty]
  refine (Measure.map_dirac' (measurable_of_countable _) _).trans ?_
  simp

/-- One individual of type `k` has offspring law `μ k`. -/
theorem stepKernel_single (μ : ι → PMF (ι →₀ ℕ)) (k : ι) :
    stepKernel μ (Finsupp.single k 1) = (μ k).toMeasure := by
  classical
  have hcard : Fintype.card (Individuals (Finsupp.single k 1 : ι →₀ ℕ)) = 1 := by
    simp only [Individuals, Fintype.card_sigma, Fintype.card_fin]
    rw [Finset.sum_coe_sort (Finsupp.single k 1 : ι →₀ ℕ).support
      (fun j => (Finsupp.single k 1 : ι →₀ ℕ) j)]
    simp
  obtain ⟨hu⟩ := Fintype.card_eq_one_iff_nonempty_unique.1 hcard
  have hmp := measurePreserving_piUnique
    (fun p : Individuals (Finsupp.single k 1 : ι →₀ ℕ) => (μ p.1).toMeasure)
  have hdef : (default : Individuals (Finsupp.single k 1 : ι →₀ ℕ)).1.1 = k := by
    have h := (default : Individuals (Finsupp.single k 1 : ι →₀ ℕ)).1.2
    simpa using h
  rw [stepKernel_eq_map, offspringPi]
  have hfun : (fun y : Individuals (Finsupp.single k 1 : ι →₀ ℕ) → ι →₀ ℕ => ∑ p, y p) =
      MeasurableEquiv.piUnique (fun _ => ι →₀ ℕ) := by
    funext y
    simp [MeasurableEquiv.piUnique]
  rw [hfun, hmp.map_eq]
  simp only [hdef]

omit [Countable ι] in
/-- The generating-function integrand is multiplicative over a finite sum of populations. -/
lemma prod_finset_sum_pow {κ : Type*} (s : Finset κ) (z : κ → ι →₀ ℕ) (q : ι → ℝ≥0∞) :
    (∑ p ∈ s, z p).prod (fun j n => q j ^ n) = ∏ p ∈ s, (z p).prod (fun j n => q j ^ n) :=
  (Finsupp.prod_finsetSum_index (fun _ => pow_zero _) (fun _ _ _ => pow_add _ _ _)).symm

/-- The one-step generating function: `𝔼_x[∏_j q_j^{X_j(1)}] = ∏_k (f_k(q))^{x_k}`. -/
theorem lintegral_stepKernel_prod (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) (q : ι → ℝ≥0∞) :
    ∫⁻ y, y.prod (fun j n => q j ^ n) ∂(stepKernel μ x) =
      x.prod fun k n => genFun μ q k ^ n := by
  rw [lintegral_stepKernel]
  simp_rw [prod_finset_sum_pow]
  rw [offspringPi, lintegral_pi_prod (fun p : Individuals x => (μ p.1).toMeasure)
    (fun _ c => c.prod fun j n => q j ^ n) (fun _ => Measurable.of_discrete)]
  simp only [Individuals, Fintype.prod_sigma, Finset.prod_const, Finset.card_univ,
    Fintype.card_fin]
  rw [Finsupp.prod]
  exact Finset.prod_coe_sort x.support (fun k => genFun μ q k ^ x k)

/-- The one-step mean: `𝔼_x[X_j(1)] = ∑_k x_k M_{k,j}`. -/
theorem lintegral_stepKernel_apply (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) (j : ι) :
    ∫⁻ y, (y j : ℝ≥0∞) ∂(stepKernel μ x) =
      x.sum fun k n => (n : ℝ≥0∞) * meanMatrix μ k j := by
  rw [lintegral_stepKernel]
  have hsum : ∀ z : Individuals x → ι →₀ ℕ,
      (((∑ p, z p) j : ℕ) : ℝ≥0∞) = ∑ p, ((z p j : ℕ) : ℝ≥0∞) := by
    intro z
    simp [Finsupp.finsetSum_apply]
  simp_rw [hsum]
  rw [lintegral_finsetSum (f := fun (p : Individuals x) (z : Individuals x → ι →₀ ℕ) =>
    ((z p j : ℕ) : ℝ≥0∞)) _ (fun p _ =>
      (Measurable.of_discrete (f := fun c : ι →₀ ℕ => ((c j : ℕ) : ℝ≥0∞))).comp
        (measurable_pi_apply p))]
  have hterm : ∀ p : Individuals x,
      ∫⁻ z, ((z p j : ℕ) : ℝ≥0∞) ∂(offspringPi μ x) = meanMatrix μ p.1 j := by
    intro p
    exact (measurePreserving_eval (fun p : Individuals x => (μ p.1).toMeasure) p).lintegral_comp
      (f := fun c : ι →₀ ℕ => ((c j : ℕ) : ℝ≥0∞)) Measurable.of_discrete
  simp only [hterm, Individuals, Fintype.sum_sigma, Finset.sum_const, Finset.card_univ,
    Fintype.card_fin, nsmul_eq_mul]
  rw [Finsupp.sum]
  exact Finset.sum_coe_sort x.support (fun k => (x k : ℝ≥0∞) * meanMatrix μ k j)

end Conjugate

end
