/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Internal.Foundations.PathLaw
public import Conjugate.Internal.Foundations.StepKernel
public import Mathlib.MeasureTheory.Group.Convolution

/-!
# The branching property for generation laws

The offspring of a population `x + y` is the offspring of `x` together with the offspring of
`y`, and the two are independent. At the level of laws this says that the one-step kernel is
additive for convolution:

* `stepKernel_add`: `stepKernel μ (x + y) = stepKernel μ x ∗ stepKernel μ y`;
* `pathLaw_map_eval_add`: the same for the law of the generation `n` of the process;
* `pathLaw_map_eval_add_time`: the Chapman–Kolmogorov equation for the one-dimensional
  marginals.

The proof of `stepKernel_add` shows that the law of a sum of independent offspring vectors
depends only on how many individuals of each type there are (`typedSumLaw_eq_of_count`).
-/

public section

open MeasureTheory ProbabilityTheory

open scoped ENNReal

namespace Conjugate

variable {ι : Type*} [Countable ι]

section TypedSum

/-- The law of the sum of independent offspring vectors, one for every element `p` of a finite
type `κ` of individuals, the individual `p` having type `t p`. -/
noncomputable def typedSumLaw (μ : ι → PMF (ι →₀ ℕ)) {κ : Type*} [Fintype κ] (t : κ → ι) :
    Measure (ι →₀ ℕ) :=
  (Measure.pi fun p : κ => (μ (t p)).toMeasure).map fun y => ∑ p, y p

lemma stepKernel_eq_typedSumLaw (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) :
    stepKernel μ x = typedSumLaw μ (fun p : Individuals x => p.1.1) :=
  stepKernel_eq_map μ x

/-- Relabeling the individuals does not change the law of the sum. -/
lemma typedSumLaw_equiv (μ : ι → PMF (ι →₀ ℕ)) {κ κ' : Type*} [Fintype κ] [Fintype κ']
    (e : κ ≃ κ') (t : κ → ι) (t' : κ' → ι) (h : ∀ p, t' (e p) = t p) :
    typedSumLaw μ t = typedSumLaw μ t' := by
  have hpi := Measure.pi_map_piCongrLeft (β := fun _ : κ' => ι →₀ ℕ) e
    (fun p' => (μ (t' p')).toMeasure)
  have hfun : (fun p => (μ (t p)).toMeasure) = fun p => (μ (t' (e p))).toMeasure := by
    funext p
    rw [h]
  unfold typedSumLaw
  rw [← hpi, hfun, Measure.map_map (by fun_prop) (by fun_prop)]
  congr 1
  funext y
  simp only [Function.comp_apply]
  rw [← Equiv.sum_comp e]
  simp [MeasurableEquiv.coe_piCongrLeft, Equiv.piCongrLeft_apply_apply]

/-- The law of the sum over a disjoint union of individuals is the convolution. -/
lemma typedSumLaw_sum (μ : ι → PMF (ι →₀ ℕ)) {κ κ' : Type*} [Fintype κ] [Fintype κ']
    (t : κ → ι) (t' : κ' → ι) :
    typedSumLaw μ (Sum.elim t t') = typedSumLaw μ t ∗ typedSumLaw μ t' := by
  have hmp := measurePreserving_sumPiEquivProdPi (X := fun _ : κ ⊕ κ' => ι →₀ ℕ)
    (fun p => (μ (Sum.elim t t' p)).toMeasure)
  unfold typedSumLaw Measure.conv
  rw [Measure.map_prod_map _ _ (by fun_prop) (by fun_prop), Measure.map_map (by fun_prop)
    (by fun_prop)]
  simp only [Sum.elim_inl, Sum.elim_inr] at hmp
  rw [← hmp.map_eq, Measure.map_map (by fun_prop) (by fun_prop)]
  congr 1
  funext y
  simp [Fintype.sum_sum_type, MeasurableEquiv.sumPiEquivProdPi]

/-- The law of the sum depends only on the number of individuals of each type. -/
lemma typedSumLaw_eq_of_count [DecidableEq ι] (μ : ι → PMF (ι →₀ ℕ)) {κ κ' : Type*}
    [Fintype κ] [Fintype κ'] (t : κ → ι) (t' : κ' → ι)
    (h : ∀ j, (∑ p, if t p = j then 1 else 0) = ∑ p, if t' p = j then 1 else 0) :
    typedSumLaw μ t = typedSumLaw μ t' := by
  have hcard : ∀ j, Nat.card {p // t p = j} = Nat.card {p // t' p = j} := by
    intro j
    rw [Nat.card_eq_fintype_card, Nat.card_eq_fintype_card, Fintype.card_subtype,
      Fintype.card_subtype, Finset.card_filter, Finset.card_filter]
    exact h j
  have hequiv : ∀ j, Nonempty ({p // t p = j} ≃ {p // t' p = j}) :=
    fun j => Finite.card_eq.1 (hcard j)
  let e : κ ≃ κ' :=
    (Equiv.sigmaFiberEquiv t).symm.trans
      ((Equiv.sigmaCongrRight fun j => (hequiv j).some).trans (Equiv.sigmaFiberEquiv t'))
  refine typedSumLaw_equiv μ e t t' fun p => ?_
  simp only [e, Equiv.trans_apply, Equiv.sigmaCongrRight_apply, Equiv.sigmaFiberEquiv_apply]
  exact ((hequiv (t p)).some ((Equiv.sigmaFiberEquiv t).symm p).snd).property

omit [Countable ι] in
/-- There are `x j` individuals of type `j` in the population `x`. -/
lemma sum_individuals_ite [DecidableEq ι] (x : ι →₀ ℕ) (j : ι) :
    (∑ p : Individuals x, if p.1.1 = j then 1 else 0) = x j := by
  simp only [Individuals, Fintype.sum_sigma]
  calc _ = ∑ a : x.support, (if (a : ι) = j then x a else 0) :=
        Finset.sum_congr rfl fun a _ => by split_ifs <;> simp
    _ = ∑ i ∈ x.support, if i = j then x i else 0 :=
        Finset.sum_coe_sort x.support (fun a => if a = j then x a else 0)
    _ = x j := by
        rw [Finset.sum_ite_eq' x.support j x]
        split_ifs with h
        · rfl
        · exact (Finsupp.notMem_support_iff.1 h).symm

/-- **Branching property for one generation**: the offspring of a union of two populations is
the sum of two independent offspring populations. -/
theorem stepKernel_add (μ : ι → PMF (ι →₀ ℕ)) (x y : ι →₀ ℕ) :
    stepKernel μ (x + y) = stepKernel μ x ∗ stepKernel μ y := by
  classical
  rw [stepKernel_eq_typedSumLaw, stepKernel_eq_typedSumLaw, stepKernel_eq_typedSumLaw,
    ← typedSumLaw_sum]
  refine typedSumLaw_eq_of_count μ _ _ fun j => ?_
  rw [Fintype.sum_sum_type, sum_individuals_ite (x + y) j, Finsupp.add_apply,
    ← sum_individuals_ite x j, ← sum_individuals_ite y j]
  rfl

end TypedSum

section Bind

/-- The law of the generation `n + 1` is the law of the generation `n` pushed through the
one-step kernel. -/
lemma pathLaw_map_eval_succ_bind (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) (n : ℕ) :
    (pathLaw μ x).map (fun ω => ω (n + 1)) =
      ((pathLaw μ x).map fun ω => ω n).bind (stepKernel μ) := by
  have h1 : (pathLaw μ x).map (fun ω => ω (n + 1)) =
      ((pathLaw μ x).map (fun ω => (ω n, ω (n + 1)))).snd := by
    rw [Measure.snd, Measure.map_map (by fun_prop) (by fun_prop)]
    rfl
  rw [h1, pathLaw_map_eval_succ, Measure.snd_compProd]

instance isProbabilityMeasure_pathLaw_map_eval (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) (n : ℕ) :
    IsProbabilityMeasure ((pathLaw μ x).map fun ω => ω n) :=
  (Measure.isProbabilityMeasure_map_iff (measurable_pi_apply n).aemeasurable).2 inferInstance

/-- Pushing a convolution through an additive Markov kernel. -/
lemma bind_stepKernel_conv (μ : ι → PMF (ι →₀ ℕ)) (ν₁ ν₂ : Measure (ι →₀ ℕ))
    [IsProbabilityMeasure ν₁] [IsProbabilityMeasure ν₂] :
    (ν₁ ∗ ν₂).bind (stepKernel μ) = ν₁.bind (stepKernel μ) ∗ ν₂.bind (stepKernel μ) := by
  refine Measure.ext_of_lintegral _ fun f hf => ?_
  have hκ : ∀ g : (ι →₀ ℕ) → ℝ≥0∞, Measurable fun a => ∫⁻ z, g z ∂stepKernel μ a :=
    fun g => Measurable.of_discrete
  have hH : ∀ u, Measurable fun b => ∫⁻ v, f (u + v) ∂stepKernel μ b := fun u =>
    Measurable.of_discrete
  have hG : ∀ u, ∫⁻ v, f (u + v) ∂(ν₂.bind (stepKernel μ)) =
      ∫⁻ b, ∫⁻ v, f (u + v) ∂stepKernel μ b ∂ν₂ := fun u =>
    Measure.lintegral_bind Measurable.of_discrete.aemeasurable Measurable.of_discrete.aemeasurable
  rw [Measure.lintegral_bind Measurable.of_discrete.aemeasurable hf.aemeasurable,
    Measure.lintegral_conv (hκ f), Measure.lintegral_conv hf,
    Measure.lintegral_bind Measurable.of_discrete.aemeasurable Measurable.of_discrete.aemeasurable]
  refine lintegral_congr fun a => ?_
  simp_rw [hG, stepKernel_add, Measure.lintegral_conv hf]
  exact lintegral_lintegral_swap Measurable.of_discrete.aemeasurable

/-- **Branching property for the generation laws**: the law of the generation `n` of the process
started from `x + y` is the convolution of the laws of the generation `n` of the processes
started from `x` and from `y`. -/
theorem pathLaw_map_eval_add (μ : ι → PMF (ι →₀ ℕ)) (x y : ι →₀ ℕ) (n : ℕ) :
    (pathLaw μ (x + y)).map (fun ω => ω n) =
      (pathLaw μ x).map (fun ω => ω n) ∗ (pathLaw μ y).map (fun ω => ω n) := by
  induction n with
  | zero => rw [pathLaw_map_eval_zero, pathLaw_map_eval_zero, pathLaw_map_eval_zero,
      Measure.dirac_conv_dirac]
  | succ n ih =>
    rw [pathLaw_map_eval_succ_bind μ (x + y) n, ih, bind_stepKernel_conv,
      ← pathLaw_map_eval_succ_bind μ x n, ← pathLaw_map_eval_succ_bind μ y n]

/-- **Chapman–Kolmogorov** for the one-dimensional marginals: the law of the generation `n + m`
is the law of the generation `n` composed with the law of the generation `m` of the process
restarted from the population at time `n`. -/
theorem pathLaw_map_eval_add_time (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) (n m : ℕ) :
    (pathLaw μ x).map (fun ω => ω (n + m)) =
      ((pathLaw μ x).map fun ω => ω n).bind fun y => (pathLaw μ y).map fun ω => ω m := by
  induction m with
  | zero =>
    simp only [pathLaw_map_eval_zero, Nat.add_zero]
    rw [Measure.bind_dirac]
  | succ m ih =>
    rw [← Nat.add_assoc, pathLaw_map_eval_succ_bind, ih,
      Measure.bind_bind Measurable.of_discrete.aemeasurable Measurable.of_discrete.aemeasurable]
    simp_rw [pathLaw_map_eval_succ_bind]

end Bind

end Conjugate

end
