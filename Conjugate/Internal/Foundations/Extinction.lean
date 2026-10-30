/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.ExtinctionEvent
public import Conjugate.Frozen.Defs.IsSubcritical
public import Conjugate.Internal.Foundations.Branching
public import Conjugate.Internal.Foundations.Generations
public import Conjugate.Internal.Foundations.MeanDecay

/-!
# Absorption at `0` and the extinction probability

* `ae_eval_eq_zero_of_le`: the population `0` is absorbing: almost surely, `X(n) = 0` implies
  `X(m) = 0` for `n ≤ m`;
* `pathLaw_extinctionEvent_eq_iSup`: the probability of extinction is
  `⨆ n, ℙ_x[X(n) = 0]`;
* `pathLaw_extinctionEvent_eq_prod`: `ℙ_x[E] = ∏_k (ℙ_k[E])^{x_k}`, which follows from the
  branching property;
* `pathLaw_extinctionEvent_eq_one_of_single`: if extinction is certain from every single
  individual, then it is certain from every population;
* `pathLaw_extinctionEvent_eq_one`: subcritical processes die out from every population.
-/

public section

open MeasureTheory ProbabilityTheory Filter Topology

open scoped ENNReal

namespace Conjugate

section Countable

variable {ι : Type*} [Countable ι]

section Absorption

/-- Absorption at `0`, one step: from `0`, the next generation is `0`. -/
lemma pathLaw_eval_eq_zero_succ_ne (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) (n : ℕ) :
    pathLaw μ x {ω | ω n = 0 ∧ ω (n + 1) ≠ 0} = 0 := by
  have hset : {ω : ℕ → ι →₀ ℕ | ω n = 0 ∧ ω (n + 1) ≠ 0} =
      (fun ω : ℕ → ι →₀ ℕ => (ω n, ω (n + 1))) ⁻¹' ({0} ×ˢ {z | z ≠ 0}) := by
    ext ω
    simp
  have hm : MeasurableSet ({0} ×ˢ {z | z ≠ 0} : Set ((ι →₀ ℕ) × (ι →₀ ℕ))) :=
    MeasurableSet.of_discrete
  rw [hset, ← Measure.map_apply ((measurable_pi_apply n).prodMk (measurable_pi_apply (n + 1))) hm,
    pathLaw_map_eval_succ, Measure.compProd_apply_prod (measurableSet_singleton _)
      MeasurableSet.of_discrete, lintegral_singleton, stepKernel_zero,
    Measure.dirac_apply' _ MeasurableSet.of_discrete]
  simp

/-- **Absorption at `0`**: almost surely, once the population is `0` it stays `0`. -/
theorem ae_eval_eq_zero_of_le (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) {n m : ℕ} (h : n ≤ m) :
    ∀ᵐ ω ∂pathLaw μ x, ω n = 0 → ω m = 0 := by
  induction h with
  | refl => exact Eventually.of_forall fun ω h => h
  | @step m _ ih =>
    have h1 : ∀ᵐ ω ∂pathLaw μ x, ω m = 0 → ω (m + 1) = 0 := by
      rw [ae_iff]
      have := pathLaw_eval_eq_zero_succ_ne μ x m
      convert this using 2
      ext ω
      simp
    filter_upwards [ih, h1] with ω h2 h3 h4 using h3 (h2 h4)

end Absorption

section Extinction

/-- The set of trajectories that are `0` from time `N` on. -/
private def tailZero (ι : Type*) (N : ℕ) : Set (ℕ → ι →₀ ℕ) := {ω | ∀ m, N ≤ m → ω m = 0}

omit [Countable ι] in
private lemma extinctionEvent_eq_iUnion :
    extinctionEvent ι = ⋃ N, tailZero ι N := by
  ext ω
  simp [extinctionEvent, tailZero, eventually_atTop]

omit [Countable ι] in
private lemma tailZero_mono : Monotone (tailZero ι) :=
  fun _ _ h _ hω m hm => hω m (h.trans hm)

/-- The event that the population is `0` from time `N` on has the same probability as
`{X(N) = 0}`, by absorption. -/
private lemma pathLaw_tailZero (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) (N : ℕ) :
    pathLaw μ x (tailZero ι N) = pathLaw μ x {ω | ω N = 0} := by
  refine measure_congr ?_
  have hall : ∀ᵐ ω ∂pathLaw μ x, ∀ m, N ≤ m → ω N = 0 → ω m = 0 := by
    rw [ae_all_iff]
    intro m
    by_cases h : N ≤ m
    · filter_upwards [ae_eval_eq_zero_of_le μ x h] with ω hω _ using hω
    · exact Eventually.of_forall fun ω hh => absurd hh h
  filter_upwards [hall] with ω hω
  refine propext ⟨fun h => h N le_rfl, fun h m hm => hω m hm h⟩

/-- **Extinction probability as a supremum**: the extinction event is, up to a null set, the
increasing union of the events `{X(n) = 0}`. -/
theorem pathLaw_extinctionEvent_eq_iSup (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) :
    pathLaw μ x (extinctionEvent ι) = ⨆ n, pathLaw μ x {ω | ω n = 0} := by
  rw [extinctionEvent_eq_iUnion, tailZero_mono.measure_iUnion]
  exact iSup_congr fun N => pathLaw_tailZero μ x N

/-- The probability of `{X(n) = 0}` is nondecreasing in `n`. -/
lemma pathLaw_eval_eq_zero_mono (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) :
    Monotone fun n => pathLaw μ x {ω | ω n = 0} := by
  intro n m h
  refine measure_mono_ae ?_
  filter_upwards [ae_eval_eq_zero_of_le μ x h] with ω hω h' using hω h'

/-- The probability of `{X(n) = 0}` is multiplicative in the starting population. -/
lemma pathLaw_eval_eq_zero_add (μ : ι → PMF (ι →₀ ℕ)) (x y : ι →₀ ℕ) (n : ℕ) :
    pathLaw μ (x + y) {ω | ω n = 0} =
      pathLaw μ x {ω | ω n = 0} * pathLaw μ y {ω | ω n = 0} := by
  have h : ∀ z : ι →₀ ℕ, pathLaw μ z {ω | ω n = 0} =
      ((pathLaw μ z).map fun ω => ω n) {0} := fun z =>
    (Measure.map_apply (measurable_pi_apply n) (measurableSet_singleton _)).symm
  rw [h, h, h, pathLaw_map_eval_add, Measure.conv,
    Measure.map_apply (by fun_prop) (measurableSet_singleton _)]
  have hset : (fun p : (ι →₀ ℕ) × (ι →₀ ℕ) => p.1 + p.2) ⁻¹' {0} = {0} ×ˢ {0} := by
    ext p
    simp [Prod.ext_iff]
  rw [hset, Measure.prod_prod]

omit [Countable ι] in
/-- A supremum of a product of monotone sequences is the product of the suprema. -/
private lemma iSup_mul_iSup_of_monotone {a b : ℕ → ℝ≥0∞} (ha : Monotone a) (hb : Monotone b) :
    ⨆ n, a n * b n = (⨆ n, a n) * ⨆ n, b n := by
  refine le_antisymm (iSup_le fun n => mul_le_mul' (le_iSup a n) (le_iSup b n)) ?_
  rw [ENNReal.iSup_mul]
  refine iSup_le fun i => ?_
  rw [ENNReal.mul_iSup]
  refine iSup_le fun j => ?_
  exact le_iSup_of_le (max i j) (mul_le_mul' (ha (le_max_left i j)) (hb (le_max_right i j)))

/-- **Multiplicativity of the extinction probability**: the branching property for the
extinction event. -/
lemma pathLaw_extinctionEvent_add (μ : ι → PMF (ι →₀ ℕ)) (x y : ι →₀ ℕ) :
    pathLaw μ (x + y) (extinctionEvent ι) =
      pathLaw μ x (extinctionEvent ι) * pathLaw μ y (extinctionEvent ι) := by
  simp_rw [pathLaw_extinctionEvent_eq_iSup, pathLaw_eval_eq_zero_add]
  exact iSup_mul_iSup_of_monotone (pathLaw_eval_eq_zero_mono μ x) (pathLaw_eval_eq_zero_mono μ y)

/-- Extinction is certain from the empty population. -/
lemma pathLaw_extinctionEvent_zero (μ : ι → PMF (ι →₀ ℕ)) :
    pathLaw μ 0 (extinctionEvent ι) = 1 := by
  refine le_antisymm prob_le_one ?_
  rw [pathLaw_extinctionEvent_eq_iSup]
  refine le_iSup_of_le 0 ?_
  have : pathLaw μ 0 {ω | ω 0 = 0} = ((pathLaw μ 0).map fun ω => ω 0) {0} :=
    (Measure.map_apply (measurable_pi_apply 0) (measurableSet_singleton _)).symm
  rw [this, pathLaw_map_eval_zero]
  simp

/-- **Extinction probability from a general population** (a consequence of the branching
property): `ℙ_x[E] = ∏_k (ℙ_k[E])^{x_k}`. -/
theorem pathLaw_extinctionEvent_eq_prod (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) :
    pathLaw μ x (extinctionEvent ι) =
      x.prod fun k n => pathLaw μ (Finsupp.single k 1) (extinctionEvent ι) ^ n := by
  induction x using Finsupp.induction_linear with
  | zero => rw [Finsupp.prod_zero_index]; exact pathLaw_extinctionEvent_zero μ
  | add f g hf hg =>
    rw [pathLaw_extinctionEvent_add, hf, hg, Finsupp.prod_add_index' (fun _ => pow_zero _)
      (fun _ _ _ => pow_add _ _ _)]
  | single a b =>
    rw [Finsupp.prod_single_index (by simp)]
    induction b with
    | zero => rw [Finsupp.single_zero, pow_zero]; exact pathLaw_extinctionEvent_zero μ
    | succ b ih =>
      rw [Finsupp.single_add, pathLaw_extinctionEvent_add, ih, pow_succ]

/-- **Certain extinction from a single individual of each type implies certain extinction from
every population.** -/
theorem pathLaw_extinctionEvent_eq_one_of_single (μ : ι → PMF (ι →₀ ℕ))
    (h : ∀ k, pathLaw μ (Finsupp.single k 1) (extinctionEvent ι) = 1) (x : ι →₀ ℕ) :
    pathLaw μ x (extinctionEvent ι) = 1 := by
  rw [pathLaw_extinctionEvent_eq_prod]
  simp [h]

end Extinction

end Countable

section Subcritical

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- Markov's inequality for the nonextinction event: `ℙ_k[X(n) ≠ 0] ≤ ∑_j (Mⁿ)_{kj}`. -/
lemma pathLaw_eval_ne_zero_le (μ : ι → PMF (ι →₀ ℕ)) (k : ι) (n : ℕ) :
    pathLaw μ (Finsupp.single k 1) {ω | ω n ≠ 0} ≤ ∑ j, (meanMatrix μ ^ n) k j := by
  set P := pathLaw μ (Finsupp.single k 1) with hP
  let g : (ι →₀ ℕ) → ℝ≥0∞ := fun c => ∑ j, (c j : ℝ≥0∞)
  have hgm : Measurable fun ω : ℕ → ι →₀ ℕ => g (ω n) :=
    (Measurable.of_discrete (f := g)).comp (measurable_pi_apply n)
  calc P {ω | ω n ≠ 0} ≤ P {ω | 1 ≤ g (ω n)} := by
        refine measure_mono fun ω hω => ?_
        obtain ⟨j, hj⟩ := Finsupp.ne_iff.1 hω
        have hj' : 1 ≤ (ω n j : ℝ≥0∞) := by exact_mod_cast Nat.one_le_iff_ne_zero.2 hj
        exact hj'.trans (Finset.single_le_sum (f := fun j => (ω n j : ℝ≥0∞))
          (fun _ _ => zero_le) (Finset.mem_univ j))
    _ ≤ ∫⁻ ω, g (ω n) ∂P := by
        simpa using mul_meas_ge_le_lintegral₀ hgm.aemeasurable 1
    _ = ∑ j, ∫⁻ ω, (ω n j : ℝ≥0∞) ∂P := by
        refine lintegral_finsetSum (f := fun (j : ι) (ω : ℕ → ι →₀ ℕ) => (ω n j : ℝ≥0∞)) _
          (fun j _ => (Measurable.of_discrete (f := fun c : ι →₀ ℕ => (c j : ℝ≥0∞))).comp
            (measurable_pi_apply n))
    _ = ∑ j, (meanMatrix μ ^ n) k j :=
        Finset.sum_congr rfl fun j _ => lintegral_pathLaw_apply μ k j n

/-- **Certain extinction for subcritical processes** (paper.tex:238): a subcritical branching
process dies out almost surely from every initial population. -/
theorem pathLaw_extinctionEvent_eq_one (μ : ι → PMF (ι →₀ ℕ)) (hμ : IsSubcritical μ)
    (x : ι →₀ ℕ) : pathLaw μ x (extinctionEvent ι) = 1 := by
  refine pathLaw_extinctionEvent_eq_one_of_single μ (fun k => ?_) x
  refine le_antisymm prob_le_one ?_
  rw [pathLaw_extinctionEvent_eq_iSup]
  have hbound : ∀ n, 1 - ∑ j, (meanMatrix μ ^ n) k j ≤
      pathLaw μ (Finsupp.single k 1) {ω | ω n = 0} := by
    intro n
    have hcompl : {ω : ℕ → ι →₀ ℕ | ω n = 0} = {ω | ω n ≠ 0}ᶜ := by
      ext ω
      simp
    have hmeas : MeasurableSet {ω : ℕ → ι →₀ ℕ | ω n ≠ 0} :=
      (measurableSet_singleton (0 : ι →₀ ℕ)).compl.preimage (measurable_pi_apply n)
    rw [hcompl, prob_compl_eq_one_sub hmeas]
    exact tsub_le_tsub_left (pathLaw_eval_ne_zero_le μ k n) 1
  have hs : Tendsto (fun n => ∑ j, (meanMatrix μ ^ n) k j) atTop (𝓝 0) := by
    simpa using tendsto_finsetSum Finset.univ fun j _ => tendsto_meanMatrix_pow μ hμ k j
  have hlim : Tendsto (fun n => 1 - ∑ j, (meanMatrix μ ^ n) k j) atTop (𝓝 1) := by
    simpa using ENNReal.Tendsto.sub (tendsto_const_nhds (x := (1 : ℝ≥0∞))) hs
      (Or.inl ENNReal.one_ne_top)
  exact le_of_tendsto' hlim fun n => (hbound n).trans (le_iSup (fun n => pathLaw μ
    (Finsupp.single k 1) {ω | ω n = 0}) n)

end Subcritical

end Conjugate

end
