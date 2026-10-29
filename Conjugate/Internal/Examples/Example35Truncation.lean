/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsSubcritical
public import Conjugate.Frozen.Defs.Truncate
public import Conjugate.Internal.Examples.Example35Weight
import Conjugate.Frozen.Remark_HypIII_Automatic
import Conjugate.Internal.Analytic.Subcritical
import Conjugate.Internal.Foundations.Generations
import Conjugate.Internal.Foundations.PathLaw
import Conjugate.Internal.Foundations.StepKernel
import Conjugate.Internal.Section3.SingleTypeRestriction
import Conjugate.Internal.Section3.Truncation

/-!
# Example 3.5: the truncations satisfy the hypotheses of Theorem 1.4

Let `μ` satisfy (3.23) for every type (ERRATA E8). For every `d ≥ 1` the truncation
`truncate μ d` (Lean types `Fin d`, paper types `1, …, d`) has

* `isSubcritical_truncate`: row sums `∑_{j<d} 𝔼_k[c_j] ≤ 𝔼_k[W] < 1`
  (`isSubcritical_of_sum_lt_one`);
* `isPositiveRegular_truncate`: `N = 1`, since `ℙ_k[X_j(1) ≥ 1] = μ_k{c_j ≥ 1} > 0`
  (`pathLaw_eval_one`: the law of `X(1)` is `stepKernel μ x`);
* `isNonsingular_truncate`: `μ_0{∑_{j<d} c_j ≥ 2} ≥ μ_0{c_0 ≥ 2} > 0`;
* `genFun_truncate_lt_top`: `f^d_k(q) = f_k(q_1, …, q_d, 1, …) ≤ 𝔼_k[u ^ W] < ∞` with
  `u = 2 + ∑_j q_j`;
* `hypI`: the conjunction, with continuity of `f^d` from the sealed `remark_hypIII_automatic`.
-/

public section

open MeasureTheory

open scoped ENNReal

namespace Conjugate.Internal.Example35

variable {μ : ℕ → PMF (ℕ →₀ ℕ)}

/-- The law of `X(1)` under `pathLaw ν x` is `stepKernel ν x`. -/
lemma pathLaw_eval_one {ι : Type*} [Countable ι] (ν : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ)
    (A : Set (ι →₀ ℕ)) : pathLaw ν x {ω | ω 1 ∈ A} = stepKernel ν x A := by
  have hset : {ω : ℕ → ι →₀ ℕ | ω 1 ∈ A} =
      (fun ω => (ω 0, ω (0 + 1))) ⁻¹' (Set.univ ×ˢ A) := by
    ext ω
    simp
  rw [hset, ← Measure.map_apply ((measurable_pi_apply 0).prodMk (measurable_pi_apply (0 + 1)))
    (MeasurableSet.univ.prod MeasurableSet.of_discrete), pathLaw_map_eval_succ,
    pathLaw_map_eval_zero, Measure.compProd_apply_prod MeasurableSet.univ MeasurableSet.of_discrete,
    Measure.restrict_univ, lintegral_dirac' _ Measurable.of_discrete]

/-- The law of the truncated offspring vector is the image of `μ k`. -/
lemma toMeasure_truncate_apply (μ : ℕ → PMF (ℕ →₀ ℕ)) (d : ℕ) (k : Fin d)
    (A : Set (Fin d →₀ ℕ)) :
    (truncate μ d k).toMeasure A =
      (μ k).toMeasure
        ((fun c : ℕ →₀ ℕ => c.comapDomain Fin.val Fin.val_injective.injOn) ⁻¹' A) := by
  unfold truncate
  exact PMF.toMeasure_map_apply _ _ _ Measurable.of_discrete MeasurableSet.of_discrete

/-- **Subcriticality of the truncations**: `∑_{j<d} 𝔼_k[c_j] ≤ 𝔼_k[W] < 1`. -/
theorem isSubcritical_truncate (h4 : ∀ k, ∫⁻ c, (wt c : ℝ≥0∞) ∂(μ k).toMeasure < 1) (d : ℕ) :
    IsSubcritical (truncate μ d) := by
  refine isSubcritical_of_sum_lt_one _ fun k => ?_
  simp_rw [meanMatrix_truncate]
  calc ∑ j : Fin d, ∫⁻ c, (c j : ℝ≥0∞) ∂(μ k).toMeasure
      = ∫⁻ c, ∑ j : Fin d, (c j : ℝ≥0∞) ∂(μ k).toMeasure :=
        (lintegral_finsetSum _ fun j _ => Measurable.of_discrete).symm
    _ ≤ ∫⁻ c, (wt c : ℝ≥0∞) ∂(μ k).toMeasure := by
        refine lintegral_mono fun c => ?_
        exact_mod_cast sum_fin_le_wt c d
    _ < 1 := h4 k

/-- **Positive regularity of the truncations** (with `N = 1`). -/
theorem isPositiveRegular_truncate (h1 : ∀ k j, 0 < (μ k).toMeasure {c | 1 ≤ c j}) (d : ℕ) :
    IsPositiveRegular (truncate μ d) := by
  refine ⟨1, le_rfl, fun k j => ?_⟩
  have h := pathLaw_eval_one (truncate μ d) (Finsupp.single k 1) {c | 1 ≤ c j}
  rw [show {ω : ℕ → Fin d →₀ ℕ | 1 ≤ ω 1 j} = {ω | ω 1 ∈ {c : Fin d →₀ ℕ | 1 ≤ c j}} from rfl, h,
    stepKernel_single, toMeasure_truncate_apply]
  have hpre : ((fun c : ℕ →₀ ℕ => c.comapDomain Fin.val Fin.val_injective.injOn) ⁻¹'
      {c : Fin d →₀ ℕ | 1 ≤ c j}) = {c | 1 ≤ c j.val} := by
    ext c
    simp [Finsupp.comapDomain_apply]
  rw [hpre]
  exact h1 k j

/-- **Non-singularity of the truncations** (`d ≥ 1`): `μ_0{∑_{j<d} c_j ≥ 2} ≥ μ_0{c_0 ≥ 2}`. -/
theorem isNonsingular_truncate (h2 : 0 < (μ 0).toMeasure {c | 2 ≤ c 0}) {d : ℕ} (hd : 1 ≤ d) :
    IsNonsingular (truncate μ d) := by
  refine ⟨⟨0, hd⟩, ?_⟩
  rw [toMeasure_truncate_apply]
  refine lt_of_lt_of_le h2 (measure_mono fun c hc => ?_)
  change 2 ≤ (c.comapDomain Fin.val Fin.val_injective.injOn).sum fun _ n => n
  rw [Finsupp.sum_fintype _ _ (fun _ => rfl)]
  refine le_trans hc ?_
  have := Finset.single_le_sum
    (f := fun j : Fin d => c.comapDomain Fin.val Fin.val_injective.injOn j)
    (fun _ _ => Nat.zero_le _) (Finset.mem_univ (⟨0, hd⟩ : Fin d))
  simpa [Finsupp.comapDomain_apply] using this

/-- **Finiteness of `f^d`** on `(0,∞)^d`, from the third condition of (3.23). -/
theorem genFun_truncate_lt_top
    (h3 : ∀ k, ∀ u : ℝ, 1 < u → ∫⁻ c, ENNReal.ofReal (u ^ wt c) ∂(μ k).toMeasure < ∞) (d : ℕ)
    (q : Fin d → ℝ≥0∞) (hq : ∀ j, 0 < q j ∧ q j < ∞) (k : Fin d) :
    genFun (truncate μ d) q k < ∞ := by
  rw [genFun_truncate]
  set u : ℝ := 2 + ∑ j : Fin d, (q j).toReal with hu
  have hsum : 0 ≤ ∑ j : Fin d, (q j).toReal := Finset.sum_nonneg fun _ _ => ENNReal.toReal_nonneg
  have hu2 : (2 : ℝ) ≤ u := by linarith
  have hu1 : 1 ≤ u := by linarith
  refine lt_of_le_of_lt (genFun_le_lintegral (by linarith) (fun j => ?_) _)
    (h3 _ u (by linarith))
  by_cases hj : j < d
  · simp only [hj, dite_true]
    have h1 : (q ⟨j, hj⟩).toReal ≤ u := by
      have := Finset.single_le_sum (f := fun i : Fin d => (q i).toReal)
        (fun _ _ => ENNReal.toReal_nonneg) (Finset.mem_univ (⟨j, hj⟩ : Fin d))
      linarith
    calc q ⟨j, hj⟩ = ENNReal.ofReal (q ⟨j, hj⟩).toReal := (ENNReal.ofReal_toReal (hq _).2.ne).symm
      _ ≤ ENNReal.ofReal u := ENNReal.ofReal_le_ofReal h1
      _ ≤ ENNReal.ofReal (u ^ (j + 1)) := by
        refine ENNReal.ofReal_le_ofReal ?_
        calc u = u ^ 1 := (pow_one u).symm
          _ ≤ u ^ (j + 1) := pow_le_pow_right₀ hu1 (by omega)
  · simp only [hj, dite_false]
    calc (1 : ℝ≥0∞) = ENNReal.ofReal 1 := ENNReal.ofReal_one.symm
      _ ≤ ENNReal.ofReal (u ^ (j + 1)) := ENNReal.ofReal_le_ofReal (one_le_pow₀ hu1)

/-- **Hypothesis I of Theorem 3.1** (`#assume-I`): every truncation `X^d`, `d ≥ 1`, satisfies the
hypotheses of Theorem 1.4. -/
theorem hypI (h1 : ∀ k j, 0 < (μ k).toMeasure {c | 1 ≤ c j})
    (h2 : 0 < (μ 0).toMeasure {c | 2 ≤ c 0})
    (h3 : ∀ k, ∀ u : ℝ, 1 < u → ∫⁻ c, ENNReal.ofReal (u ^ wt c) ∂(μ k).toMeasure < ∞)
    (h4 : ∀ k, ∫⁻ c, (wt c : ℝ≥0∞) ∂(μ k).toMeasure < 1) (d : ℕ) (hd : 1 ≤ d) :
    IsSubcritical (truncate μ d) ∧
      (IsPositiveRegular (truncate μ d) ∧ IsNonsingular (truncate μ d)) ∧
        ∀ k, ContinuousOn (fun q => genFun (truncate μ d) q k) {q | ∀ j, 0 < q j} := by
  have hpr := isPositiveRegular_truncate h1 d
  have hns := isNonsingular_truncate h2 hd
  exact ⟨isSubcritical_truncate h4 d, ⟨hpr, hns⟩,
    remark_hypIII_automatic (truncate μ d) hpr hns fun k q hq => genFun_truncate_lt_top h3 d q hq k⟩

end Conjugate.Internal.Example35

end
