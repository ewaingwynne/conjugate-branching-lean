/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.BasinInfty
public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.LogGenFun
import Conjugate.Internal.Analytic.GenFun
import Conjugate.Internal.Analytic.LogGenFun
import Conjugate.Internal.Section2.Positivity

/-!
# Strict monotonicity of `g^{(n)}` and blow-up of infinite coordinates

* `exists_logGenFun_iterate_strict`: the second assertion of Lemma 2.9 (paper.tex:602-603),
  under positive regularity, `g^{(n)}_k` is strictly monotone for `n ≥ N`, as long as the
  larger argument has a finite image in coordinate `k`;
* `exists_logGenFun_iterate_eq_top`: paper.tex:732, if some coordinate of `x ∈ [0,∞]^d` is
  infinite then `g^{(n)}(x) = (∞, …, ∞)` for all `n ≥ N`;
* `mem_basinInfty_of_exists_eq_top`: display (2.8), `[0,∞]^d ∖ [0,∞)^d ⊆ S∞`.

The proofs write `g^{(n)}_k(x) = log 𝔼_k[∏_j e^{x_j X_j(n)}]` and compare the integrands, using
positivity of `ℙ_k[X_j(n) ≥ 1]` for every `n ≥ N` (`exists_pos_of_le`).
-/

public section

open MeasureTheory ProbabilityTheory Filter Topology

open scoped ENNReal

namespace Conjugate

section Helpers

/-- Strict monotonicity of the monomial `q ↦ ∏_j q_j^{c_j}` in a coordinate where `c_j ≥ 1`,
for finite positive arguments. -/
lemma prod_pow_lt_prod_pow {ι : Type*} (c : ι →₀ ℕ) {q r : ι → ℝ≥0∞} (hqr : ∀ j, q j ≤ r j)
    (hq : ∀ j, q j ≠ 0) (hr : ∀ j, r j ≠ ⊤) {j₀ : ι} (hj₀ : j₀ ∈ c.support)
    (hlt : q j₀ < r j₀) :
    c.prod (fun j m => q j ^ m) < c.prod (fun j m => r j ^ m) := by
  classical
  simp only [Finsupp.prod]
  rw [← Finset.mul_prod_erase _ (fun j => q j ^ c j) hj₀,
    ← Finset.mul_prod_erase _ (fun j => r j ^ c j) hj₀]
  have hr0 : ∀ j, r j ≠ 0 := fun j => (lt_of_lt_of_le (pos_iff_ne_zero.2 (hq j)) (hqr j)).ne'
  have hv0 : ∏ j ∈ c.support.erase j₀, r j ^ c j ≠ 0 :=
    Finset.prod_ne_zero_iff.2 fun j _ => pow_ne_zero _ (hr0 j)
  have hv1 : ∏ j ∈ c.support.erase j₀, r j ^ c j ≠ ⊤ :=
    ENNReal.prod_ne_top fun j _ => ENNReal.pow_ne_top (hr j)
  have hle : ∏ j ∈ c.support.erase j₀, q j ^ c j ≤ ∏ j ∈ c.support.erase j₀, r j ^ c j :=
    Finset.prod_le_prod fun j _ => pow_le_pow_left' (hqr j) _
  have hpow : q j₀ ^ c j₀ < r j₀ ^ c j₀ :=
    ENNReal.pow_lt_pow_left (Finsupp.mem_support_iff.1 hj₀) hlt
  calc q j₀ ^ c j₀ * ∏ j ∈ c.support.erase j₀, q j ^ c j
      ≤ q j₀ ^ c j₀ * ∏ j ∈ c.support.erase j₀, r j ^ c j := mul_le_mul_right hle _
    _ < r j₀ ^ c j₀ * ∏ j ∈ c.support.erase j₀, r j ^ c j :=
      ENNReal.mul_lt_mul_left hv0 hv1 hpow

/-- For `x ∈ [0,∞]^ι`, the exponentials `e^{x_j}` are `≥ 1`, in particular nonzero. -/
lemma exp_ne_zero_of_nonneg {x : EReal} (hx : 0 ≤ x) : EReal.exp x ≠ 0 :=
  (lt_of_lt_of_le one_pos (EReal.one_le_exp_iff.2 hx)).ne'

/-- `e^x` is finite for `x < ∞`. -/
lemma exp_ne_top_of_lt_top {x : EReal} (hx : x < ⊤) : EReal.exp x ≠ ⊤ :=
  fun h => hx.ne (EReal.exp_eq_top_iff.1 h)

end Helpers

section Strict

/-- **Lemma 2.9, second assertion** (paper.tex:602-603; finiteness is needed only in coordinate
`k`): under positive regularity there is `N` such that for `n ≥ N`, `x ≤ y`, `x ≠ y`,
`x ∈ [0,∞]^d`, `y ∈ [0,∞)^d` and `g^{(n)}_k(y) < ∞`, we have `g^{(n)}_k(x) < g^{(n)}_k(y)`. -/
theorem exists_logGenFun_iterate_strict {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hpr : IsPositiveRegular μ) :
    ∃ N, ∀ n, N ≤ n → ∀ x y : Fin d → EReal, (∀ j, 0 ≤ x j) → (∀ j, y j < ⊤) → x ≤ y →
      x ≠ y → ∀ k, (logGenFun μ)^[n] y k < ⊤ →
        (logGenFun μ)^[n] x k < (logGenFun μ)^[n] y k := by
  obtain ⟨N, -, hN⟩ := exists_pos_of_le μ hpr
  refine ⟨N, fun n hn x y hx hy hxy hne k hk => ?_⟩
  rw [logGenFun_iterate] at hk ⊢
  rw [logGenFun_iterate]
  simp only at hk ⊢
  have hk' : (genFun μ)^[n] (fun j => EReal.exp (y j)) k < ⊤ := ENNReal.log_lt_top_iff.1 hk
  refine ENNReal.log_strictMono ?_
  rw [genFun_iterate_eq] at hk'
  rw [genFun_iterate_eq, genFun_iterate_eq]
  obtain ⟨j₀, hj₀⟩ := Function.ne_iff.1 hne
  have hlt : x j₀ < y j₀ := lt_of_le_of_ne (hxy j₀) hj₀
  set P := pathLaw μ (Finsupp.single k 1) with hP
  have hq : ∀ j, EReal.exp (x j) ≠ 0 := fun j => exp_ne_zero_of_nonneg (hx j)
  have hr : ∀ j, EReal.exp (y j) ≠ ⊤ := fun j => exp_ne_top_of_lt_top (hy j)
  have hqr : ∀ j, EReal.exp (x j) ≤ EReal.exp (y j) := fun j => EReal.exp_monotone (hxy j)
  have hmeasy : Measurable fun ω : ℕ → Fin d →₀ ℕ => (ω n).prod (fun j m => EReal.exp (y j) ^ m) :=
    (Measurable.of_discrete (f := fun c : Fin d →₀ ℕ => c.prod
      (fun j m => EReal.exp (y j) ^ m))).comp (measurable_pi_apply n)
  have hle : ∀ ω : ℕ → Fin d →₀ ℕ, (ω n).prod (fun j m => EReal.exp (x j) ^ m) ≤
      (ω n).prod (fun j m => EReal.exp (y j) ^ m) := fun ω =>
    Finset.prod_le_prod fun j _ => pow_le_pow_left' (hqr j) _
  refine lintegral_strict_mono_of_ae_le_of_frequently_ae_lt hmeasy.aemeasurable
    (ne_of_lt (lt_of_le_of_lt (lintegral_mono hle) hk')) (Eventually.of_forall hle) ?_
  rw [frequently_ae_iff]
  refine ne_of_gt (lt_of_lt_of_le (hN n hn k j₀) (measure_mono fun ω hω => ?_))
  have h1 : 1 ≤ ω n j₀ := hω
  have hmem : j₀ ∈ (ω n).support := Finsupp.mem_support_iff.2 (by omega)
  exact (prod_pow_lt_prod_pow (ω n) hqr hq hr hmem (EReal.exp_strictMono hlt)).ne

end Strict

section BlowUp

/-- **paper.tex:732**: under positive regularity there is `N` such that an infinite coordinate of
`x ∈ [0,∞]^d` makes every coordinate of `g^{(n)}(x)` infinite, for all `n ≥ N`. -/
theorem exists_logGenFun_iterate_eq_top {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hpr : IsPositiveRegular μ) :
    ∃ N, ∀ x : Fin d → EReal, (∀ j, 0 ≤ x j) → (∃ j, x j = ⊤) →
      ∀ n, N ≤ n → ∀ k, (logGenFun μ)^[n] x k = ⊤ := by
  obtain ⟨N, -, hN⟩ := exists_pos_of_le μ hpr
  refine ⟨N, fun x hx ⟨j, hj⟩ n hn k => ?_⟩
  rw [logGenFun_iterate]
  simp only
  rw [ENNReal.log_eq_top_iff, genFun_iterate_eq]
  set P := pathLaw μ (Finsupp.single k 1) with hP
  set A : Set (ℕ → Fin d →₀ ℕ) := {ω | 1 ≤ ω n j} with hA
  have hAm : MeasurableSet A := by
    have hs : MeasurableSet {c : Fin d →₀ ℕ | 1 ≤ c j} := MeasurableSet.of_discrete
    exact hs.preimage (measurable_pi_apply n)
  have hpt : ∀ ω, A.indicator (fun _ => (⊤ : ℝ≥0∞)) ω ≤
      (ω n).prod (fun i m => EReal.exp (x i) ^ m) := by
    intro ω
    by_cases hω : ω ∈ A
    · rw [Set.indicator_of_mem hω]
      have h1 : 1 ≤ ω n j := hω
      have hmem : j ∈ (ω n).support := Finsupp.mem_support_iff.2 (by omega)
      refine le_trans ?_ (Finset.single_le_prod (f := fun i => EReal.exp (x i) ^ ω n i)
        (fun i _ => one_le_pow_of_one_le' (EReal.one_le_exp_iff.2 (hx i)) _) hmem)
      rw [hj, show EReal.exp ⊤ = ⊤ from EReal.exp_eq_top_iff.2 rfl,
        ENNReal.top_pow (by omega)]
    · rw [Set.indicator_of_notMem hω]
      exact zero_le
  refine eq_top_iff.2 ?_
  calc (⊤ : ℝ≥0∞) = ∫⁻ ω, A.indicator (fun _ => (⊤ : ℝ≥0∞)) ω ∂P := by
        rw [lintegral_indicator_const hAm, ENNReal.top_mul (hN n hn k j).ne']
    _ ≤ _ := lintegral_mono hpt

/-- **Display (2.8)** (paper.tex:732-735): `[0,∞]^d ∖ [0,∞)^d ⊆ S∞`. -/
theorem mem_basinInfty_of_exists_eq_top {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hpr : IsPositiveRegular μ) {x : Fin d → EReal} (hx0 : ∀ j, 0 ≤ x j)
    (hx : ∃ j, x j = ⊤) : x ∈ basinInfty μ := by
  obtain ⟨N, hN⟩ := exists_logGenFun_iterate_eq_top μ hpr
  refine ⟨hx0, ?_⟩
  obtain ⟨j, hj⟩ := hx
  have hev : ∀ n, N ≤ n → (⨆ i, ((logGenFun μ)^[n] x i).abs) = ⊤ := by
    intro n hn
    refine eq_top_iff.2 (le_iSup_of_le j ?_)
    rw [hN x hx0 ⟨j, hj⟩ n hn j, EReal.abs_top]
  rw [limsup_congr (v := fun _ => (⊤ : ℝ≥0∞)) (eventually_atTop.2 ⟨N, hev⟩), limsup_const]

end BlowUp

end Conjugate

end
