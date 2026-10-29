/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.BasinInfty
public import Conjugate.Frozen.Defs.BasinZero
public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsSubcritical
public import Conjugate.Frozen.Defs.LogGenFun
public import Conjugate.Frozen.Defs.PathLaw
import Conjugate.Internal.Analytic.GenFun
import Conjugate.Internal.Analytic.LogGenFun
import Conjugate.Internal.Section2.MonotoneLimit
import Conjugate.Internal.Section2.Positivity
import Conjugate.Internal.Section2.Strict
import Conjugate.Internal.Section2.SubBound
import Conjugate.Internal.Section2.Unstable

/-!
# `0` and `∞` are attractive (Lemmas 2.14 and 2.15)

Throughout, `g = logGenFun μ`.

* `exists_mem_basinZero_of_le`: **Lemma 2.14** (paper.tex:767-776): there is `ε > 0` with
  `[0,ε]^d ⊆ S₀`. By Lemma 2.5 (`exists_logGenFun_lt_self`) there is `λ⁰ ∈ (0,∞)^d` with
  `g(λ⁰) < λ⁰`; Lemma 2.12 puts `λ⁰` in `S₀`, and monotonicity of `g^{(n)}` does the rest.
* `exists_attractive_infty`: **Lemma 2.15** (paper.tex:781-800), read as in ERRATA E3: there are
  `C > 0` and `N ≥ 1` such that every `λ ∈ [0,∞)^d` with some coordinate `> C` satisfies
  `g^{(N)}(λ) > λ` in *every* coordinate, and `|g^{(n)}(λ)| → ∞` (Lemma 2.12, second part).
  The estimate is `e^{g^{(N)}_k(λ)} ≥ e^{λ_k + λ_j} ℙ_k[X(N) ≥ e_k + e_j]` for every `j`
  (`mul_measure_le_lintegral`, from Lemma 2.4), so only `max_j λ_j` matters (not `min_j λ_j`).

Helpers: `exists_pos_real_le_all`, `exists_pos_real_one_lt_mul_exp`,
`mul_le_prod_pow_of_single_add_le`, `mul_measure_le_lintegral`.
-/

public section

open MeasureTheory ProbabilityTheory Filter Topology
open scoped ENNReal

namespace Conjugate

variable {d : ℕ}

section Helpers

/-- Finitely many positive extended reals dominate a common positive real. -/
lemma exists_pos_real_le_all {y : Fin d → EReal} (hy : ∀ j, 0 < y j) :
    ∃ ε : ℝ, 0 < ε ∧ ∀ j, (ε : EReal) ≤ y j := by
  have h1 : ∀ j, ∀ᶠ ε : ℝ in 𝓝[>] (0 : ℝ), (ε : EReal) < y j := by
    intro j
    obtain ⟨c, hc0, hc⟩ := EReal.lt_iff_exists_real_btwn.1 (hy j)
    have hc0' : (0 : ℝ) < c := by exact_mod_cast hc0
    filter_upwards [Ioo_mem_nhdsGT hc0'] with ε hε
    exact lt_trans (by exact_mod_cast hε.2) hc
  obtain ⟨ε, h2, h3⟩ := ((eventually_all.2 h1).and (self_mem_nhdsWithin : {ε : ℝ | 0 < ε} ∈
    𝓝[>] (0 : ℝ))).exists
  exact ⟨ε, h3, fun j => (h2 j).le⟩

/-- For `m > 0` there is a real `C > 0` with `m e^C > 1`. -/
lemma exists_pos_real_one_lt_mul_exp {m : ℝ≥0∞} (hm : 0 < m) :
    ∃ C : ℝ, 0 < C ∧ 1 < m * EReal.exp C := by
  by_cases hmt : m = ⊤
  · refine ⟨1, one_pos, ?_⟩
    rw [hmt, ENNReal.top_mul (EReal.exp_eq_zero_iff.not.2 (EReal.coe_ne_bot 1))]
    exact ENNReal.one_lt_top
  · set b : ℝ := (m⁻¹).toReal + 1 with hb
    have hb0 : 0 < b := by positivity
    refine ⟨b, hb0, ?_⟩
    have hinv : m⁻¹ < EReal.exp b := by
      have : (m⁻¹).toReal < Real.exp b := by
        have := Real.add_one_lt_exp hb0.ne'
        linarith
      rw [EReal.exp_coe]
      calc m⁻¹ = ENNReal.ofReal (m⁻¹).toReal := (ENNReal.ofReal_toReal (by simpa using hm.ne')).symm
        _ < _ := (ENNReal.ofReal_lt_ofReal_iff (by positivity)).2 this
    calc (1 : ℝ≥0∞) = m * m⁻¹ := (ENNReal.mul_inv_cancel hm.ne' hmt).symm
      _ < m * EReal.exp b := ENNReal.mul_lt_mul_right hm.ne' hmt hinv

/-- A monomial `∏_i q_i^{c_i}` with all `q_i ≥ 1` dominates `q_k q_j` when `c ≥ e_k + e_j`. -/
lemma mul_le_prod_pow_of_single_add_le {q : Fin d → ℝ≥0∞} (hq : ∀ i, 1 ≤ q i)
    {c : Fin d →₀ ℕ} {k j : Fin d} (h : Finsupp.single k 1 + Finsupp.single j 1 ≤ c) :
    q k * q j ≤ c.prod (fun i n => q i ^ n) := by
  obtain ⟨z, hz⟩ := le_iff_exists_add.1 h
  have e : ∀ a : Fin d, (Finsupp.single a 1).prod (fun i n => q i ^ n) = q a := fun a => by
    rw [Finsupp.prod_single_index (h := fun i n => q i ^ n) (pow_zero (q a)), pow_one]
  rw [hz, Finsupp.prod_add_index' (fun _ => pow_zero _) (fun _ _ _ => pow_add _ _ _),
    Finsupp.prod_add_index' (fun _ => pow_zero _) (fun _ _ _ => pow_add _ _ _), e, e]
  calc q k * q j = q k * q j * 1 := (mul_one _).symm
    _ ≤ q k * q j * z.prod (fun i n => q i ^ n) := by
        gcongr
        exact Finset.one_le_prod fun i _ => one_le_pow_of_one_le' (hq i) _

/-- **The display of Lemma 2.15** (paper.tex:791-797, with `max` as in ERRATA E3): if the
population at time `N` contains `e_k + e_j` with probability `p`, then
`𝔼_k[∏_i e^{x_i X_i(N)}] ≥ p e^{x_k + x_j}` for `x ∈ [0,∞]^d`. -/
lemma mul_measure_le_lintegral (μ : Fin d → PMF (Fin d →₀ ℕ)) (N : ℕ) (k j : Fin d)
    {x : Fin d → EReal} (hx : ∀ i, 0 ≤ x i) :
    EReal.exp (x k) * EReal.exp (x j) *
        pathLaw μ (Finsupp.single k 1) {ω | Finsupp.single k 1 + Finsupp.single j 1 ≤ ω N} ≤
      ∫⁻ ω, (ω N).prod (fun i n => EReal.exp (x i) ^ n) ∂pathLaw μ (Finsupp.single k 1) := by
  set P := pathLaw μ (Finsupp.single k 1) with hP
  set A : Set (ℕ → Fin d →₀ ℕ) := {ω | Finsupp.single k 1 + Finsupp.single j 1 ≤ ω N} with hA
  have hAm : MeasurableSet A :=
    (MeasurableSet.of_discrete
      (s := {c : Fin d →₀ ℕ | Finsupp.single k 1 + Finsupp.single j 1 ≤ c})).preimage
      (measurable_pi_apply N)
  have hq : ∀ i, 1 ≤ EReal.exp (x i) := fun i => EReal.one_le_exp_iff.2 (hx i)
  calc EReal.exp (x k) * EReal.exp (x j) * P A
      = ∫⁻ ω, A.indicator (fun _ => EReal.exp (x k) * EReal.exp (x j)) ω ∂P :=
        (lintegral_indicator_const hAm _).symm
    _ ≤ _ := by
        refine lintegral_mono fun ω => ?_
        by_cases hω : ω ∈ A
        · rw [Set.indicator_of_mem hω]
          exact mul_le_prod_pow_of_single_add_le hq hω
        · rw [Set.indicator_of_notMem hω]
          exact zero_le

end Helpers

section Lemma214

/-- **Lemma 2.14** (paper.tex:767-776): `0` is attractive. -/
theorem exists_mem_basinZero_of_le (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hI : IsSubcritical μ) (hII : IsPositiveRegular μ ∧ IsNonsingular μ)
    (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j}) :
    ∃ ε : ℝ, 0 < ε ∧ ∀ x : Fin d → EReal, (∀ j, 0 ≤ x j ∧ x j ≤ ε) → x ∈ basinZero μ := by
  rcases isEmpty_or_nonempty (Fin d) with hd | hd
  · refine ⟨1, one_pos, fun x _ => ⟨fun j => isEmptyElim j, ?_⟩⟩
    simp
  obtain ⟨k₀⟩ := hd
  obtain ⟨y, hy, hlt⟩ := exists_logGenFun_lt_self μ hI hIII
  have hy0 : y ∈ basinZero μ := by
    refine mem_basinZero_of_iterate_lt μ hI hII hIII (x := y) (m := 1)
      (fun j => ⟨(hy j).1.le, (hy j).2⟩) le_rfl ?_ ?_
    · rw [Function.iterate_one]
      exact fun k => (hlt k).le
    · rw [Function.iterate_one]
      intro h
      exact (hlt k₀).ne (congrFun h k₀)
  obtain ⟨ε, hε0, hε⟩ := exists_pos_real_le_all (fun j => (hy j).1)
  refine ⟨ε, hε0, fun x hx => ⟨fun j => (hx j).1, ?_⟩⟩
  have hxy : x ≤ y := fun j => (hx j).2.trans (hε j)
  exact tendsto_of_tendsto_of_tendsto_of_le_of_le tendsto_const_nhds hy0.2
    (fun n => zero_le) (fun n => supAbs_mono
      (fun j => (mapsTo_logGenFun μ).iterate n (fun j => (hx j).1) j)
      ((logGenFun_mono μ).iterate n hxy))

end Lemma214

section Lemma215

/-- **Lemma 2.15** (paper.tex:781-800, read as ERRATA E3): `∞` is attractive. -/
theorem exists_attractive_infty (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hI : IsSubcritical μ) (hII : IsPositiveRegular μ ∧ IsNonsingular μ)
    (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j}) :
    ∃ C : ℝ, 0 < C ∧ ∃ N, 1 ≤ N ∧ ∀ x : Fin d → EReal, (∀ j, 0 ≤ x j ∧ x j < ⊤) →
      (∃ j, (C : EReal) < x j) →
        (∀ k, x k < (logGenFun μ)^[N] x k) ∧
          Tendsto (fun n => ⨆ j, ((logGenFun μ)^[n] x j).abs) atTop (𝓝 ⊤) := by
  obtain ⟨N, hN1, hN⟩ := exists_pos_two_individuals μ hII.1 hII.2
  set p : Fin d × Fin d → ℝ≥0∞ := fun kj => pathLaw μ (Finsupp.single kj.1 1)
    {ω | Finsupp.single kj.1 1 + Finsupp.single kj.2 1 ≤ ω N} with hp
  obtain ⟨m, hm0, hm⟩ : ∃ m : ℝ≥0∞, 0 < m ∧ ∀ kj, m ≤ p kj :=
    ⟨Finset.univ.inf p, (Finset.lt_inf_iff ENNReal.zero_lt_top).2 fun kj _ => hN kj.1 kj.2,
      fun kj => Finset.inf_le (Finset.mem_univ kj)⟩
  obtain ⟨C, hC0, hC⟩ := exists_pos_real_one_lt_mul_exp hm0
  refine ⟨C, hC0, N, hN1, fun x hx ⟨j, hj⟩ => ?_⟩
  have hx0 : ∀ i, 0 ≤ x i := fun i => (hx i).1
  have hstrict : ∀ k, x k < (logGenFun μ)^[N] x k := by
    intro k
    rw [logGenFun_iterate_apply]
    calc x k = ENNReal.log (EReal.exp (x k)) := (EReal.log_exp _).symm
      _ < _ := ENNReal.log_lt_log ?_
    have h1 := mul_measure_le_lintegral μ N k j hx0
    have h2 : 1 < m * EReal.exp (x j) :=
      lt_of_lt_of_le hC (by gcongr)
    calc EReal.exp (x k) = 1 * EReal.exp (x k) := (one_mul _).symm
      _ < (m * EReal.exp (x j)) * EReal.exp (x k) :=
        ENNReal.mul_lt_mul_left (exp_ne_zero_of_nonneg (hx0 k))
          (exp_ne_top_of_lt_top (hx k).2) h2
      _ = EReal.exp (x k) * EReal.exp (x j) * m := by ring
      _ ≤ EReal.exp (x k) * EReal.exp (x j) * p (k, j) := by gcongr; exact hm (k, j)
      _ ≤ _ := h1
  refine ⟨hstrict, ?_⟩
  exact tendsto_top_of_lt_iterate μ hI hII hIII hx hN1 (fun k => (hstrict k).le)
    (fun h => (hstrict j).ne (congrFun h j))

end Lemma215

end Conjugate

end
