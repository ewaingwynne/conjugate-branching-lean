/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.StepKernel
public import Conjugate.Frozen.Defs.StochDominated
public import Conjugate.Internal.Examples.Example35Weight
import Conjugate.Internal.Foundations.StepKernel
import Mathlib.MeasureTheory.Integral.Layercake

/-!
# Example 3.5: stochastic domination gives Hypotheses II and III

For a type `k ≥ 1`, `hdom` says that `μ k` is stochastically dominated by
`stepKernel μ (single 0 (k+1))`, the law of the sum of `k + 1` independent type-`0` offspring
vectors (the paper's "sum of `k` i.i.d. copies of `ℙ_1`", with the type shift of the Lean
indexing).

* `lintegral_le_of_stochDominated`: for a finite monotone function `g` of the offspring vector,
  `∫ g dν ≤ ∫ g dρ` if `ν` is stochastically dominated by `ρ`. By the layer-cake formula, since
  the superlevel sets `{g > t}` are upper sets;
* `genFun_le_pow_of_dom`: Hypothesis II (with `ψ = 1`, `φ k = k + 1`): for `q ∈ [1,∞)^ℕ`,
  `f_k(q) ≤ f_0(q)^{k+1}`, by `lintegral_stepKernel_prod`;
* `lintegral_pow_wt_le_of_dom`: `𝔼_k[s^W] ≤ (𝔼_0[s^W])^{k+1}` for `s ≥ 1`.
-/

public section

open MeasureTheory

open scoped ENNReal

namespace Conjugate.Internal.Example35

/-- **Stochastic domination and monotone functions**: if `ν` is stochastically dominated by `ρ`
and `g` is monotone and finite, then `∫ g dν ≤ ∫ g dρ` (layer-cake formula). -/
lemma lintegral_le_of_stochDominated {ν ρ : Measure (ℕ →₀ ℕ)} (h : StochDominated ν ρ)
    {g : (ℕ →₀ ℕ) → ℝ≥0∞} (hg : Monotone g) (hfin : ∀ c, g c ≠ ⊤) :
    ∫⁻ c, g c ∂ν ≤ ∫⁻ c, g c ∂ρ := by
  set G : (ℕ →₀ ℕ) → ℝ := fun c => (g c).toReal with hG
  have hGg : ∀ c, ENNReal.ofReal (G c) = g c := fun c => ENNReal.ofReal_toReal (hfin c)
  have hGmono : Monotone G := fun c c' hcc' => ENNReal.toReal_mono (hfin c') (hg hcc')
  have hG0 : ∀ c, 0 ≤ G c := fun c => ENNReal.toReal_nonneg
  simp_rw [← hGg]
  rw [lintegral_eq_lintegral_meas_lt ν (Filter.Eventually.of_forall hG0)
      Measurable.of_discrete.aemeasurable,
    lintegral_eq_lintegral_meas_lt ρ (Filter.Eventually.of_forall hG0)
      Measurable.of_discrete.aemeasurable]
  refine lintegral_mono fun t => h _ ?_
  intro a b hab ha
  exact lt_of_lt_of_le ha (hGmono hab)

/-- The monomial `c ↦ ∏_j q_j^{c_j}` is monotone for `q ≥ 1`. -/
lemma prod_pow_mono {q : ℕ → ℝ≥0∞} (hq : ∀ j, 1 ≤ q j) :
    Monotone fun c : ℕ →₀ ℕ => c.prod fun j n => q j ^ n := by
  intro c c' h
  obtain ⟨d, rfl⟩ := le_iff_exists_add.1 h
  dsimp only
  rw [Finsupp.prod_add_index' (fun _ => pow_zero _) (fun _ _ _ => pow_add _ _ _)]
  refine le_mul_of_one_le_right' ?_
  exact Finset.one_le_prod fun j _ => one_le_pow₀ (hq j)

/-- The monomial at a finite vector is finite. -/
lemma prod_pow_ne_top {q : ℕ → ℝ≥0∞} (hq : ∀ j, q j < ⊤) (c : ℕ →₀ ℕ) :
    (c.prod fun j n => q j ^ n) ≠ ⊤ :=
  (ENNReal.prod_lt_top fun j _ => ENNReal.pow_lt_top (hq j)).ne

variable {μ : ℕ → PMF (ℕ →₀ ℕ)}

/-- **Hypothesis II with `ψ = 1`, `φ k = k + 1`** (`#assume-II`): `f_k(q) ≤ f_0(q)^{k+1}` for
`q ∈ [1,∞)^ℕ`. -/
theorem genFun_le_pow_of_dom
    (hdom : ∀ k, 1 ≤ k →
      StochDominated (μ k).toMeasure (stepKernel μ (Finsupp.single 0 (k + 1))))
    {q : ℕ → ℝ≥0∞} (hq : ∀ j, 1 ≤ q j ∧ q j < ⊤) (k : ℕ) :
    genFun μ q k ≤ genFun μ q 0 ^ (k + 1) := by
  rcases Nat.eq_zero_or_pos k with rfl | hk
  · simp
  · have h := lintegral_le_of_stochDominated (hdom k hk) (prod_pow_mono fun j => (hq j).1)
      (prod_pow_ne_top fun j => (hq j).2)
    calc genFun μ q k
        ≤ ∫⁻ c, (c.prod fun j n => q j ^ n) ∂(stepKernel μ (Finsupp.single 0 (k + 1))) := h
      _ = genFun μ q 0 ^ (k + 1) := by
        rw [lintegral_stepKernel_prod, Finsupp.prod_single_index (by simp)]

/-- **The exponential moment of the weight under domination**: `𝔼_k[s^W] ≤ (𝔼_0[s^W])^{k+1}`
for `s ≥ 1`. -/
theorem lintegral_pow_wt_le_of_dom
    (hdom : ∀ k, 1 ≤ k →
      StochDominated (μ k).toMeasure (stepKernel μ (Finsupp.single 0 (k + 1))))
    {s : ℝ} (hs : 1 ≤ s) (k : ℕ) :
    ∫⁻ c, ENNReal.ofReal (s ^ wt c) ∂(μ k).toMeasure ≤
      (∫⁻ c, ENNReal.ofReal (s ^ wt c) ∂(μ 0).toMeasure) ^ (k + 1) := by
  have hs0 : 0 ≤ s := zero_le_one.trans hs
  rcases Nat.eq_zero_or_pos k with rfl | hk
  · simp
  · have hmono : Monotone fun c : ℕ →₀ ℕ => ENNReal.ofReal (s ^ wt c) := fun c c' h =>
      ENNReal.ofReal_le_ofReal (pow_le_pow_right₀ hs (wt_mono h))
    have h := lintegral_le_of_stochDominated (hdom k hk) hmono fun c => ENNReal.ofReal_ne_top
    set q : ℕ → ℝ≥0∞ := fun j => ENNReal.ofReal (s ^ (j + 1)) with hq
    have hprod : ∀ c : ℕ →₀ ℕ, (c.prod fun j n => q j ^ n) = ENNReal.ofReal (s ^ wt c) :=
      fun c => prod_ofReal_pow hs0 c
    calc ∫⁻ c, ENNReal.ofReal (s ^ wt c) ∂(μ k).toMeasure
        ≤ ∫⁻ c, ENNReal.ofReal (s ^ wt c) ∂(stepKernel μ (Finsupp.single 0 (k + 1))) := h
      _ = ∫⁻ c, (c.prod fun j n => q j ^ n) ∂(stepKernel μ (Finsupp.single 0 (k + 1))) := by
        simp_rw [hprod]
      _ = genFun μ q 0 ^ (k + 1) := by
        rw [lintegral_stepKernel_prod, Finsupp.prod_single_index (by simp)]
      _ = _ := by
        unfold genFun
        simp_rw [hprod]

end Conjugate.Internal.Example35

end
