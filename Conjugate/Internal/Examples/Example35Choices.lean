/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Internal.Examples.Example35Weight
public import Conjugate.Internal.SingleType.GeomQuotient
import Conjugate.Internal.Section3.SingleTypeRestriction

/-!
# Example 3.5: the constants `s` of Hypothesis III and `t` of Hypothesis IV

* `exists_pow_wt_le`: `𝔼_0[s^W] ≤ s` for some `s > 1`. This is `SingleType.exists_pgf_lt`
  applied to `X = W` under `μ_0`, with `𝔼_0[W] < 1` and `𝔼_0[2^W] < ∞`;
* `exists_lt_genFun`: `f_0(t, 1, 1, …) > t` for some `t > 1`. By non-singularity,
  `f_0(t,1,…) = 𝔼_0[t^{c_0}] ≥ t² ℙ_0[c_0 ≥ 2] = 2 t` for `t = 2 / ℙ_0[c_0 ≥ 2]`.
-/

public section

open MeasureTheory

open scoped ENNReal

namespace Conjugate.Internal.Example35

variable {μ : ℕ → PMF (ℕ →₀ ℕ)}

/-- The probability generating function of the weight, at the point `ofReal u`. -/
lemma pgf_wt_ofReal (ν : Measure (ℕ →₀ ℕ)) {u : ℝ} (hu : 0 ≤ u) :
    SingleType.pgf ν (fun c => wt c) (ENNReal.ofReal u) =
      ∫⁻ c, ENNReal.ofReal (u ^ wt c) ∂ν := by
  unfold SingleType.pgf
  simp_rw [ENNReal.ofReal_pow hu]

/-- **Hypothesis III** (`#choose-s`): there is `s > 1` with `𝔼_0[s^W] ≤ s`. -/
theorem exists_pow_wt_le
    (h3 : ∀ k, ∀ u : ℝ, 1 < u → ∫⁻ c, ENNReal.ofReal (u ^ wt c) ∂(μ k).toMeasure < ∞)
    (h4 : ∀ k, ∫⁻ c, (wt c : ℝ≥0∞) ∂(μ k).toMeasure < 1) :
    ∃ s : ℝ, 1 < s ∧ ∫⁻ c, ENNReal.ofReal (s ^ wt c) ∂(μ 0).toMeasure ≤ ENNReal.ofReal s := by
  have hX : Measurable (fun c : ℕ →₀ ℕ => wt c) := Measurable.of_discrete
  have hfin : SingleType.pgf (μ 0).toMeasure (fun c => wt c) (1 + 1) ≠ ⊤ := by
    rw [show (1 + 1 : ℝ≥0∞) = ENNReal.ofReal 2 by
      rw [one_add_one_eq_two, ENNReal.ofReal_ofNat], pgf_wt_ofReal _ (u := 2) (by norm_num)]
    exact (h3 0 2 (by norm_num)).ne
  obtain ⟨se, hse1, hsetop, hlt⟩ := SingleType.exists_pgf_lt hX (h4 0) (ε₀ := 1) one_pos hfin
  have hse : ENNReal.ofReal se.toReal = se := ENNReal.ofReal_toReal hsetop.ne
  refine ⟨se.toReal, ?_, ?_⟩
  · have := (ENNReal.toReal_lt_toReal ENNReal.one_ne_top hsetop.ne).2 hse1
    simpa using this
  · rw [← pgf_wt_ofReal _ ENNReal.toReal_nonneg, hse]
    exact hlt.le

/-- **Hypothesis IV, first part** (`#choose-t`): there is `t > 1` with `f_0(t, 1, 1, …) > t`. -/
theorem exists_lt_genFun (h2 : 0 < (μ 0).toMeasure {c | 2 ≤ c 0}) :
    ∃ t : ℝ, 1 < t ∧
      ENNReal.ofReal t < genFun μ (fun j => if j = 0 then ENNReal.ofReal t else 1) 0 := by
  set p : ℝ≥0∞ := (μ 0).toMeasure {c | 2 ≤ c 0} with hp
  have hp1 : p ≤ 1 := prob_le_one
  have hptop : p ≠ ⊤ := ne_top_of_le_ne_top ENNReal.one_ne_top hp1
  have hpr0 : 0 < p.toReal := ENNReal.toReal_pos h2.ne' hptop
  have hpr1 : p.toReal ≤ 1 := by
    simpa using ENNReal.toReal_mono ENNReal.one_ne_top hp1
  set t : ℝ := 2 / p.toReal with ht
  have ht2 : 2 ≤ t := by
    rw [ht, le_div_iff₀ hpr0]
    nlinarith
  refine ⟨t, by linarith, ?_⟩
  have hfun : (fun j : ℕ => if j = 0 then ENNReal.ofReal t else (1 : ℝ≥0∞)) =
      Function.update (1 : ℕ → ℝ≥0∞) 0 (ENNReal.ofReal t) := by
    funext j
    by_cases hj : j = 0 <;> simp [hj]
  have hgf : genFun μ (fun j => if j = 0 then ENNReal.ofReal t else 1) 0 =
      ∫⁻ c, ENNReal.ofReal t ^ c 0 ∂(μ 0).toMeasure := by
    rw [hfun]
    unfold genFun
    simp_rw [prod_update_one]
  have hone : 1 ≤ ENNReal.ofReal t := ENNReal.one_le_ofReal.2 (by linarith)
  have hlow : ENNReal.ofReal t ^ 2 * p ≤ ∫⁻ c, ENNReal.ofReal t ^ c 0 ∂(μ 0).toMeasure := by
    calc ENNReal.ofReal t ^ 2 * p
        = ∫⁻ c, {c : ℕ →₀ ℕ | 2 ≤ c 0}.indicator (fun _ => ENNReal.ofReal t ^ 2) c
            ∂(μ 0).toMeasure :=
          (lintegral_indicator_const MeasurableSet.of_discrete _).symm
      _ ≤ _ := by
        refine lintegral_mono fun c => ?_
        by_cases hc : 2 ≤ c 0
        · rw [Set.indicator_of_mem (show c ∈ {c : ℕ →₀ ℕ | 2 ≤ c 0} from hc)]
          exact pow_le_pow_right₀ hone hc
        · rw [Set.indicator_of_notMem (show c ∉ {c : ℕ →₀ ℕ | 2 ≤ c 0} from hc)]
          exact zero_le
  have hmul : ENNReal.ofReal t * p = 2 := by
    conv_lhs => rw [← ENNReal.ofReal_toReal hptop]
    rw [← ENNReal.ofReal_mul (by linarith), ht, div_mul_cancel₀ _ hpr0.ne', ENNReal.ofReal_ofNat]
  have h0 : ENNReal.ofReal t ≠ 0 := (zero_lt_one.trans_le hone).ne'
  have htop : ENNReal.ofReal t ≠ ⊤ := ENNReal.ofReal_ne_top
  rw [hgf]
  calc ENNReal.ofReal t = ENNReal.ofReal t * 1 := (mul_one _).symm
    _ < ENNReal.ofReal t * 2 := (ENNReal.mul_lt_mul_iff_right h0 htop).2 ENNReal.one_lt_two
    _ = ENNReal.ofReal t ^ 2 * p := by rw [← hmul]; ring
    _ ≤ _ := hlow

/-- **Hypothesis IV, second part**: `f_k((t^{j+1})_j) = 𝔼_k[t^W] < ∞`. -/
theorem genFun_ofReal_rpow_lt_top
    (h3 : ∀ k, ∀ u : ℝ, 1 < u → ∫⁻ c, ENNReal.ofReal (u ^ wt c) ∂(μ k).toMeasure < ∞)
    {t : ℝ} (ht : 1 < t) (k : ℕ) :
    genFun μ (fun j => ENNReal.ofReal (1 * t ^ ((j : ℝ) + 1))) k < ∞ := by
  unfold genFun
  simp_rw [prod_ofReal_rpow (zero_le_one.trans ht.le)]
  exact h3 k t ht

end Conjugate.Internal.Example35

end
