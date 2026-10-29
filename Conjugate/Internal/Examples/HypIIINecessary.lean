/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.IsConjugate
public import Conjugate.Frozen.Defs.IsSubcritical
public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.GenFun
import Conjugate.Infrastructure.Population
import Conjugate.Internal.Analytic.Subcritical
import Conjugate.Internal.Conjugacy.ConjugateToFixedPoint
import Conjugate.Internal.Conjugacy.SingleType
import Mathlib.Analysis.SpecificLimits.Normed
import Mathlib.MeasureTheory.Integral.Lebesgue.Countable
import Mathlib.NumberTheory.ZetaValues
import Mathlib.Probability.ProbabilityMassFunction.Constructions

/-!
# The example showing that hypothesis III of Theorem 1.4 cannot be removed

paper.tex:252 (graph node `rem:hyp-iii-necessary`): the single-type branching process with
`ℙ[X(1) = m] = a m⁻³` for `m ≥ 1` and `ℙ[X(1) = 0] = b`.

We take `a = coeff = 1/4` and `b = mass0 = 1 - a ζ(3)`. Writing `w m = m⁻³` (and `w 0 = 0`):

* `ζ(3) ≤ ζ(2) = π²/6 < 4` (`hasSum_zeta_two`, `Real.pi_le_four`), so `a ζ(3) < 1` and `b > 0`;
  the weights are a PMF `pmfNat` on `ℕ`, and `law` is its push-forward under `m ↦ single 0 m`;
* the mean `a ζ(2) < 1`, so the process is subcritical (`isSubcritical_fin_one_iff`);
* `ℙ[X(1) ≥ 2] ≥ a/8 > 0`, so the process is positive regular and non-singular
  (`Conjugate.Conjugacy.isPositiveRegular_of_fin_one`);
* for `1 < q < ∞`, the terms `a q^m m⁻³` of `f(q)` are eventually `≥ a`, because `m³/q^m → 0`,
  so they do not tend to `0` and `f(q) = ∞`;
* a conjugate would give (`exists_fixedPoint_of_isConjugate`) some `q ∈ (1,∞)` with
  `f(q) = q < ∞`, a contradiction.
-/

public section

open MeasureTheory Filter Topology

open scoped ENNReal

namespace Conjugate.Internal.Examples.HypIII

/-- The weights `m⁻³`, and `0` for `m = 0`. -/
noncomputable def w (m : ℕ) : ℝ≥0∞ := ENNReal.ofReal (1 / (m : ℝ) ^ 3)

lemma ofReal_one_div_pow {m : ℕ} (hm : 1 ≤ m) (k : ℕ) :
    ENNReal.ofReal (1 / (m : ℝ) ^ k) = ((m : ℝ≥0∞) ^ k)⁻¹ := by
  have hm' : (0 : ℝ) < m := by exact_mod_cast hm
  rw [one_div, ENNReal.ofReal_inv_of_pos (by positivity), ENNReal.ofReal_pow hm'.le,
    ENNReal.ofReal_natCast]

lemma w_of_pos {m : ℕ} (hm : 1 ≤ m) : w m = ((m : ℝ≥0∞) ^ 3)⁻¹ := ofReal_one_div_pow hm 3

lemma w_zero : w 0 = 0 := by simp [w]

lemma natCast_mul_w (m : ℕ) : (m : ℝ≥0∞) * w m = ENNReal.ofReal (1 / (m : ℝ) ^ 2) := by
  rcases Nat.eq_zero_or_pos m with rfl | hm
  · simp [w]
  · rw [w, ← ENNReal.ofReal_natCast, ← ENNReal.ofReal_mul (Nat.cast_nonneg m)]
    congr 1
    have hm' : (0 : ℝ) < m := by exact_mod_cast hm
    field_simp

lemma w_le_natCast_mul (m : ℕ) : w m ≤ (m : ℝ≥0∞) * w m := by
  rcases Nat.eq_zero_or_pos m with rfl | hm
  · simp [w_zero]
  · exact le_mul_of_one_le_left zero_le (by exact_mod_cast hm)

/-- `∑ m⁻²`, as an extended real. -/
lemma tsum_natCast_mul_w : ∑' m : ℕ, (m : ℝ≥0∞) * w m = ENNReal.ofReal (Real.pi ^ 2 / 6) := by
  simp_rw [natCast_mul_w]
  rw [← ENNReal.ofReal_tsum_of_nonneg (fun n => by positivity) hasSum_zeta_two.summable,
    hasSum_zeta_two.tsum_eq]

lemma tsum_natCast_mul_w_lt : ∑' m : ℕ, (m : ℝ≥0∞) * w m < 4 := by
  rw [tsum_natCast_mul_w]
  have h : Real.pi ^ 2 / 6 < 4 := by
    have h1 := Real.pi_le_four
    have h2 := Real.pi_pos
    nlinarith
  calc ENNReal.ofReal (Real.pi ^ 2 / 6) < ENNReal.ofReal 4 :=
        (ENNReal.ofReal_lt_ofReal_iff (by norm_num)).2 h
    _ = 4 := by simp

lemma tsum_w_lt : ∑' m : ℕ, w m < 4 :=
  lt_of_le_of_lt (tsum_le_tsum w_le_natCast_mul) tsum_natCast_mul_w_lt

/-- The constant `coeff = 1/4`. -/
noncomputable def coeff : ℝ≥0∞ := 4⁻¹

lemma coeff_pos : 0 < coeff := ENNReal.inv_pos.2 (by simp)

lemma coeff_ne_top : coeff ≠ ∞ := ENNReal.inv_ne_top.2 (by simp)

lemma coeff_mul_four : coeff * 4 = 1 := ENNReal.inv_mul_cancel (by simp) (by simp)

/-- The constant `mass0 = 1 - coeff ζ(3)`. -/
noncomputable def mass0 : ℝ≥0∞ := 1 - coeff * ∑' m : ℕ, w m

lemma coeff_mul_tsum_w_lt : coeff * ∑' m : ℕ, w m < 1 := by
  calc coeff * ∑' m : ℕ, w m < coeff * 4 :=
        (ENNReal.mul_lt_mul_iff_right coeff_pos.ne' coeff_ne_top).2 tsum_w_lt
    _ = 1 := coeff_mul_four

lemma mass0_pos : 0 < mass0 := tsub_pos_of_lt coeff_mul_tsum_w_lt

/-- The offspring law on `ℕ`: `ℙ[X = 0] = mass0`, `ℙ[X = m] = coeff m⁻³` for `m ≥ 1`. -/
noncomputable def pmfNat : PMF ℕ :=
  ⟨fun m => (if m = 0 then mass0 else 0) + coeff * w m, by
    have h := (CompleteLattice.summable
      (f := fun m : ℕ => (if m = 0 then mass0 else 0) + coeff * w m)).hasSum
    have h2 : ∑' m : ℕ, ((if m = 0 then mass0 else 0) + coeff * w m) = 1 := by
      rw [tsum_add, tsum_ite_eq, ENNReal.tsum_mul_left]
      exact tsub_add_cancel_of_le coeff_mul_tsum_w_lt.le
    rwa [h2] at h⟩

lemma pmfNat_zero : pmfNat 0 = mass0 := by
  change (if (0 : ℕ) = 0 then mass0 else 0) + coeff * w 0 = mass0
  simp [w_zero]

lemma pmfNat_of_pos {m : ℕ} (hm : 1 ≤ m) : pmfNat m = coeff * ((m : ℝ≥0∞) ^ 3)⁻¹ := by
  change (if m = 0 then mass0 else 0) + coeff * w m = _
  simp [show m ≠ 0 by omega, w_of_pos hm]

/-- The offspring laws, as the push-forward of `pmfNat` under `m ↦ single 0 m`. -/
noncomputable def law : Fin 1 → PMF (Fin 1 →₀ ℕ) :=
  fun _ => pmfNat.map fun m => Finsupp.single 0 m

lemma law_single (m : ℕ) : law 0 (Finsupp.single 0 m) = pmfNat m := by
  simp only [law, PMF.map_apply, (Finsupp.single_injective (0 : Fin 1)).eq_iff]
  rw [tsum_eq_single m (fun m' h => by simp [Ne.symm h])]
  simp

lemma measurable_single : Measurable fun m : ℕ => (Finsupp.single (0 : Fin 1) m) :=
  Measurable.of_discrete

lemma lintegral_law (F : (Fin 1 →₀ ℕ) → ℝ≥0∞) :
    ∫⁻ c, F c ∂(law 0).toMeasure = ∑' m : ℕ, F (Finsupp.single 0 m) * pmfNat m := by
  rw [law, ← PMF.toMeasure_map _ _ measurable_single, lintegral_map Measurable.of_discrete
    measurable_single, lintegral_countable']
  simp_rw [PMF.toMeasure_apply_singleton _ _ (measurableSet_singleton _)]

lemma law_zero : law 0 0 = mass0 := by
  have h := law_single 0
  rwa [Finsupp.single_zero, pmfNat_zero] at h

lemma pmfNat_eq_mul_w {m : ℕ} (hm : 1 ≤ m) : pmfNat m = coeff * w m := by
  rw [pmfNat_of_pos hm, w_of_pos hm]

lemma natCast_mul_pmfNat (m : ℕ) : (m : ℝ≥0∞) * pmfNat m = coeff * ((m : ℝ≥0∞) * w m) := by
  rcases Nat.eq_zero_or_pos m with rfl | hm
  · simp
  · rw [pmfNat_eq_mul_w hm]
    ring

/-- The mean offspring number is `coeff · ∑ m⁻² < 1`. -/
lemma meanMatrix_law_lt_one : meanMatrix law 0 0 < 1 := by
  have h : meanMatrix law 0 0 = ∑' m : ℕ, (m : ℝ≥0∞) * pmfNat m := by
    change ∫⁻ c, ((c 0 : ℕ) : ℝ≥0∞) ∂(law 0).toMeasure = _
    rw [lintegral_law]
    simp
  rw [h]
  simp_rw [natCast_mul_pmfNat]
  rw [ENNReal.tsum_mul_left]
  calc coeff * ∑' m : ℕ, (m : ℝ≥0∞) * w m < coeff * 4 :=
        (ENNReal.mul_lt_mul_iff_right coeff_pos.ne' coeff_ne_top).2 tsum_natCast_mul_w_lt
    _ = 1 := coeff_mul_four

lemma law_isSubcritical : IsSubcritical law :=
  (isSubcritical_fin_one_iff law).2 meanMatrix_law_lt_one

lemma pmfNat_pos {m : ℕ} (hm : 1 ≤ m) : 0 < pmfNat m := by
  rw [pmfNat_of_pos hm]
  exact ENNReal.mul_pos coeff_pos.ne'
    (ENNReal.inv_ne_zero.2 (ENNReal.pow_ne_top (ENNReal.natCast_ne_top m)))

lemma law_two_le_pos : 0 < (law 0).toMeasure {c | 2 ≤ c 0} := by
  have h : 0 < (law 0).toMeasure {Finsupp.single (0 : Fin 1) 2} := by
    rw [PMF.toMeasure_apply_singleton _ _ (measurableSet_singleton _), law_single]
    exact pmfNat_pos (by norm_num)
  refine lt_of_lt_of_le h (measure_mono ?_)
  intro c hc
  rw [Set.mem_singleton_iff] at hc
  subst hc
  simp

lemma genFun_law_eq (q : ℝ≥0∞) : genFun law (fun _ => q) 0 = ∑' m : ℕ, q ^ m * pmfNat m := by
  change ∫⁻ c, c.prod (fun j n => q ^ n) ∂(law 0).toMeasure = _
  rw [lintegral_law]
  refine tsum_congr fun m => ?_
  rw [Finsupp.prod_single_index (by simp)]

/-- For `1 < q < ∞`, `f(q) = ∞`: the terms `coeff q^m m⁻³` do not tend to `0`. -/
lemma genFun_law_eq_top {q : ℝ≥0∞} (hq1 : 1 < q) (hqtop : q < ∞) :
    genFun law (fun _ => q) 0 = ∞ := by
  by_contra hne
  rw [genFun_law_eq] at hne
  have h0 := ENNReal.tendsto_cofinite_zero_of_tsum_ne_top hne
  rw [Nat.cofinite_eq_atTop] at h0
  obtain ⟨r, hr, rfl⟩ : ∃ r : ℝ, 1 < r ∧ q = ENNReal.ofReal r :=
    ⟨q.toReal, by simpa using (ENNReal.toReal_lt_toReal ENNReal.one_ne_top hqtop.ne).2 hq1,
      (ENNReal.ofReal_toReal hqtop.ne).symm⟩
  have hr0 : 0 < r := by linarith
  have hlim := tendsto_pow_const_div_const_pow_of_one_lt 3 hr
  have hev : ∀ᶠ n : ℕ in atTop, coeff ≤ ENNReal.ofReal r ^ n * pmfNat n := by
    filter_upwards [hlim.eventually (gt_mem_nhds zero_lt_one), eventually_ge_atTop 1]
      with n hlt hn
    have hn' : (0 : ℝ) < n := by exact_mod_cast hn
    have hrn : 0 < r ^ n := by positivity
    have h1 : 1 ≤ r ^ n * (1 / (n : ℝ) ^ 3) := by
      rw [div_lt_one hrn] at hlt
      rw [mul_one_div, le_div_iff₀ (by positivity)]
      linarith
    have h2 : ENNReal.ofReal r ^ n * w n = ENNReal.ofReal (r ^ n * (1 / (n : ℝ) ^ 3)) := by
      rw [w, ← ENNReal.ofReal_pow hr0.le, ← ENNReal.ofReal_mul (by positivity)]
    calc coeff = coeff * 1 := (mul_one coeff).symm
      _ ≤ coeff * (ENNReal.ofReal r ^ n * w n) :=
          mul_le_mul_right (h2 ▸ ENNReal.one_le_ofReal.2 h1) coeff
      _ = ENNReal.ofReal r ^ n * pmfNat n := by rw [pmfNat_eq_mul_w hn]; ring
  exact coeff_pos.not_ge (ge_of_tendsto h0 hev)

lemma not_exists_isConjugate : ¬ ∃ μHat, IsConjugate law μHat := by
  rintro ⟨μHat, h⟩
  have hpr := Conjugacy.isPositiveRegular_of_fin_one law law_two_le_pos
  obtain ⟨q, hq, hfix, -⟩ := exists_fixedPoint_of_isConjugate law law_isSubcritical hpr h
  have h0 := congrFun hfix 0
  have hconst : q = fun _ => q 0 := funext fun k => by rw [Subsingleton.elim k 0]
  rw [hconst, genFun_law_eq_top (hq 0).1 (hq 0).2] at h0
  exact (hq 0).2.ne h0.symm

/-- **The example of paper.tex:252.** -/
theorem exists_example :
    ∃ a b : ℝ≥0∞, 0 < a ∧ 0 < b ∧ ∃ μ : Fin 1 → PMF (Fin 1 →₀ ℕ),
      μ 0 0 = b ∧ (∀ m : ℕ, 1 ≤ m → μ 0 (Finsupp.single 0 m) = a * ((m : ℝ≥0∞) ^ 3)⁻¹) ∧
      IsSubcritical μ ∧ (IsPositiveRegular μ ∧ IsNonsingular μ) ∧
      (∀ q : ℝ≥0∞, 1 < q → q < ∞ → genFun μ (fun _ => q) 0 = ∞) ∧
      ¬ ∃ μHat, IsConjugate μ μHat :=
  ⟨coeff, mass0, coeff_pos, mass0_pos, law, law_zero,
    fun m hm => by rw [law_single, pmfNat_of_pos hm], law_isSubcritical,
    ⟨Conjugacy.isPositiveRegular_of_fin_one law law_two_le_pos,
      Conjugacy.isNonsingular_of_fin_one law law_two_le_pos⟩,
    fun q h1 h2 => genFun_law_eq_top h1 h2, not_exists_isConjugate⟩

end Conjugate.Internal.Examples.HypIII

end
