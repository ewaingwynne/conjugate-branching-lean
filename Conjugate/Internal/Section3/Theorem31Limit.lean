/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsSubcritical
public import Conjugate.Frozen.Defs.LogGenFun
public import Conjugate.Frozen.Defs.Truncate
import Conjugate.Frozen.Theorem_2_7
import Conjugate.Infrastructure.Population
import Conjugate.Internal.Analytic.GenFun
import Conjugate.Internal.Analytic.GenFunContinuity
import Conjugate.Internal.Section3.Liminf
import Conjugate.Internal.Section3.SingleTypeFixedPoint
import Conjugate.Internal.Section3.Theorem31Truncation
import Conjugate.Internal.Section3.Truncation
import Mathlib.MeasureTheory.Integral.Lebesgue.DominatedConvergence
import Mathlib.Topology.Sequences

/-!
# Theorem 3.1: the fixed point as a subsequential limit of the fixed points of the truncations

Lean indexes types from `0`: paper type `k` is Lean type `k - 1`, and the paper's `f_1` is
`genFun μ · 0`. Throughout, `g^d = logGenFun (truncate μ d)` and `f^d = genFun (truncate μ d)`.

`exists_fixedPoint_of_truncations` is Theorem 3.1 (`thm-fixed-pt-infty`, paper.tex:957-987,
proof paper.tex:1149-1179), without the unused hypotheses (certain extinction and `φ(k) → ∞`,
ERRATA R7). The proof follows the paper:

* `#choose-lambda-d`: for every `d ≥ 1`, the sealed `Conjugate.theorem_2_7` applied to the
  truncation gives a fixed point `λ^d ∈ (0,∞)^d` of `g^d`; it is extended by `0` to
  `Λ^d : ℕ → ℝ`;
* `#dominated-bound`: `0 ≤ Λ^d_k ≤ B_k := φ(k) log t + log ψ(k)` (Lemma 3.4 (c),
  `fixedPoint_truncate_le_growth`);
* `#diagonal-limit`: the box `∏_k [0, B_k]` is compact in `ℕ → ℝ` (Tychonoff) and first
  countable, so a subsequence `Λ^{D(i)}` converges pointwise to some `Λ`
  (`IsCompact.tendsto_subseq`);
* `#as-convergence`, `#before-dct`, `#interchange`: for `D(i) > k`, display (3.2) gives
  `e^{Λ^{D(i)}_k} = f_k(e^{Λ^{D(i)}})`; the monomials converge pointwise (offspring vectors are
  finitely supported) and are dominated by the monomial at `(ψ(j) t^{φ(j)})_j`, which is
  `μ_k`-integrable by Hypothesis IV, so `e^{Λ_k} = f_k(e^Λ)` (`tendsto_genFun_of_dominated`);
* `#nonzero-limit`: Lemma 3.3 gives `k_i < K` with `Λ^{D(i)}_{k_i} ≥ c`; one `k < K` occurs
  infinitely often (`exists_frequently_eq_of_lt`), so `Λ_k ≥ c > 0`;
* `#positivity`: `one_lt_of_genFun_eq_self_of_truncate`.

Helper: `ofReal_exp_extend_eq`.
-/

public section

open MeasureTheory ProbabilityTheory Filter Topology

open scoped ENNReal

namespace Conjugate

/-- `e^{(x_1, …, x_n, 0, 0, …)} = (e^{x_1}, …, e^{x_n}, 1, 1, …)` for a finite `x ∈ [0,∞)^n`. -/
lemma ofReal_exp_extend_eq {n : ℕ} (x : Fin n → EReal) (hx : ∀ j, 0 ≤ x j ∧ x j < ⊤) (j : ℕ) :
    ENNReal.ofReal (Real.exp (if h : j < n then (x ⟨j, h⟩).toReal else 0)) =
      if h : j < n then EReal.exp (x ⟨j, h⟩) else 1 := by
  by_cases h : j < n
  · simp only [h, dite_true]
    rw [← EReal.exp_coe, EReal.coe_toReal (hx _).2.ne (EReal.bot_lt_zero.trans_le (hx _).1).ne']
  · simp [h]

/-- **Pigeonhole along a sequence**: a sequence with values `< K` takes one value infinitely
often. -/
lemma exists_frequently_eq_of_lt (K : ℕ) (kk : ℕ → ℕ) (h : ∀ i, kk i < K) :
    ∃ k, k < K ∧ ∃ᶠ i in atTop, kk i = k := by
  by_contra hcon
  have hev : ∀ k ∈ Finset.range K, ∀ᶠ i in atTop, kk i ≠ k := fun k hk =>
    not_frequently.1 fun hf => hcon ⟨k, Finset.mem_range.1 hk, hf⟩
  obtain ⟨i, hi⟩ := ((eventually_all_finset (Finset.range K)).2 hev).exists
  exact hi (kk i) (Finset.mem_range.2 (h i)) rfl

/-- **Dominated convergence for `f_k`** (`thm-fixed-pt-infty#interchange`, paper.tex:1165-1175):
if `q^i → q` pointwise with `q > 0`, and `q^i ≤ G` with `f_k(G) < ∞`, then `f_k(q^i) → f_k(q)`.
The monomials converge pointwise because every offspring vector is finitely supported. -/
lemma tendsto_genFun_of_dominated (μ : ℕ → PMF (ℕ →₀ ℕ)) (k : ℕ) {Qi : ℕ → ℕ → ℝ≥0∞}
    {Q G : ℕ → ℝ≥0∞} (hlim : ∀ j, Tendsto (fun i => Qi i j) atTop (𝓝 (Q j)))
    (hQ0 : ∀ j, 0 < Q j) (hle : ∀ i j, Qi i j ≤ G j) (hG : genFun μ G k < ∞) :
    Tendsto (fun i => genFun μ (Qi i) k) atTop (𝓝 (genFun μ Q k)) := by
  unfold genFun at hG ⊢
  refine tendsto_lintegral_of_dominated_convergence (fun c => c.prod fun j n => G j ^ n)
    (fun i => Measurable.of_discrete) (fun i => ae_of_all _ fun c => ?_) hG.ne
    (ae_of_all _ fun c => ?_)
  · exact Finset.prod_le_prod fun j _ => pow_le_pow_left' (hle i j) _
  · exact (tendsto_monomial hQ0 c).comp (tendsto_pi_nhds.2 hlim)

/-- **Theorem 3.1** (`thm-fixed-pt-infty`, paper.tex:957-987), without the unused hypotheses
(ERRATA R7): there is `q ∈ (1,∞)^ℕ` with `f(q) = q`. -/
theorem exists_fixedPoint_of_truncations (μ : ℕ → PMF (ℕ →₀ ℕ))
    (hI : ∀ d, 1 ≤ d →
      IsSubcritical (truncate μ d) ∧
        (IsPositiveRegular (truncate μ d) ∧ IsNonsingular (truncate μ d)) ∧
        ∀ k, ContinuousOn (fun q => genFun (truncate μ d) q k) {q | ∀ j, 0 < q j})
    (φ ψ : ℕ → ℝ) (hφ : ∀ k, 1 ≤ φ k) (hψ : ∀ k, 1 ≤ ψ k)
    (hψφ_lim : Tendsto (fun k => Real.log (ψ k) / φ k) atTop (𝓝 0))
    (hII : ∀ k (q : ℕ → ℝ≥0∞), (∀ j, 1 ≤ q j ∧ q j < ∞) →
      genFun μ q k ≤ ENNReal.ofReal (ψ k) * genFun μ q 0 ^ φ k)
    (hIII : ∃ s : ℝ, 1 < s ∧ ∀ k,
      ∫⁻ c, ENNReal.ofReal (s ^ (c.sum fun j n => φ j * n)) ∂(μ k).toMeasure ≤
        ENNReal.ofReal (s ^ φ k))
    (hIV : ∃ t : ℝ, 1 < t ∧
      ENNReal.ofReal t < genFun μ (fun j => if j = 0 then ENNReal.ofReal t else 1) 0 ∧
      ∀ k, genFun μ (fun j => ENNReal.ofReal (ψ j * t ^ φ j)) k < ∞) :
    ∃ q : ℕ → ℝ≥0∞, (∀ j, 1 < q j ∧ q j < ∞) ∧ genFun μ q = q := by
  obtain ⟨t, ht, htf, htfin⟩ := hIV
  obtain ⟨K, -, c, hc0, hKc⟩ :=
    exists_liminf_fixedPoint_truncate μ hI φ ψ hφ hψ hψφ_lim hII hIII
  -- `#choose-lambda-d`: the fixed points `λ^d` of the truncations
  have hchoice : ∀ d : ℕ, ∃ x : Fin (d + 1) → EReal,
      (∀ j, 0 < x j ∧ x j < ⊤) ∧ logGenFun (truncate μ (d + 1)) x = x := fun d =>
    theorem_2_7 (truncate μ (d + 1)) (hI (d + 1) (Nat.succ_pos d)).1
      (hI (d + 1) (Nat.succ_pos d)).2.1 (hI (d + 1) (Nat.succ_pos d)).2.2
  choose lam hlam hfix using hchoice
  have hlam' : ∀ d j, 0 ≤ lam d j ∧ lam d j < ⊤ := fun d j => ⟨(hlam d j).1.le, (hlam d j).2⟩
  -- the extensions `Λ^d`
  obtain ⟨Λ, hΛ⟩ : ∃ Λ : ℕ → ℕ → ℝ,
      Λ = fun d k => if h : k < d + 1 then (lam d ⟨k, h⟩).toReal else 0 := ⟨_, rfl⟩
  -- `#dominated-bound`: `0 ≤ Λ^d_k ≤ B_k`
  obtain ⟨B, hB⟩ : ∃ B : ℕ → ℝ, B = fun k => φ k * Real.log t + Real.log (ψ k) := ⟨_, rfl⟩
  have ht0 : 0 < t := zero_lt_one.trans ht
  have hψ0 : ∀ k, 0 < ψ k := fun k => zero_lt_one.trans_le (hψ k)
  have hB0 : ∀ k, 0 ≤ B k := fun k => by
    rw [hB]
    exact add_nonneg (mul_nonneg (zero_le_one.trans (hφ k)) (Real.log_pos ht).le)
      (Real.log_nonneg (hψ k))
  have hΛ0 : ∀ d k, 0 ≤ Λ d k := fun d k => by
    rw [hΛ]
    dsimp only
    split_ifs with h
    · exact EReal.toReal_nonneg (hlam' d _).1
    · exact le_rfl
  have hΛB : ∀ d k, Λ d k ≤ B k := fun d k => by
    rw [hΛ]
    dsimp only
    split_ifs with h
    · have h1 := fixedPoint_truncate_le_growth μ hI φ ψ hφ hψ hII ht htf h (lam d) (hlam' d)
        (hfix d)
      have h2 := EReal.toReal_le_toReal h1 (EReal.bot_lt_zero.trans_le (hlam' d _).1).ne'
        (EReal.coe_ne_top _)
      rw [EReal.toReal_coe] at h2
      rw [hB]
      exact h2
    · exact hB0 k
  -- `#diagonal-limit`: a pointwise convergent subsequence `Λ^{D(i)} → Λ`
  have hSc : IsCompact (Set.univ.pi fun k => Set.Icc (0 : ℝ) (B k)) :=
    isCompact_univ_pi fun k => isCompact_Icc
  have hmem : ∀ d, Λ d ∈ Set.univ.pi fun k => Set.Icc (0 : ℝ) (B k) := fun d =>
    Set.mem_univ_pi.2 fun k => ⟨hΛ0 d k, hΛB d k⟩
  obtain ⟨L, hLS, D, hD, hDlim⟩ := hSc.tendsto_subseq hmem
  have hpt : ∀ k, Tendsto (fun i => Λ (D i) k) atTop (𝓝 (L k)) := fun k =>
    tendsto_pi_nhds.1 hDlim k
  have hL0 : ∀ k, 0 ≤ L k := fun k => (Set.mem_univ_pi.1 hLS k).1
  -- `#as-convergence`, `#before-dct`, `#interchange`: `q = e^Λ` is a fixed point of `f`
  obtain ⟨Q, hQ⟩ : ∃ Q : ℕ → ℝ≥0∞, Q = fun j => ENNReal.ofReal (Real.exp (L j)) := ⟨_, rfl⟩
  obtain ⟨Qi, hQi⟩ : ∃ Qi : ℕ → ℕ → ℝ≥0∞,
      Qi = fun i j => ENNReal.ofReal (Real.exp (Λ (D i) j)) := ⟨_, rfl⟩
  have hQlim : ∀ j, Tendsto (fun i => Qi i j) atTop (𝓝 (Q j)) := fun j => by
    rw [hQ, hQi]
    exact (ENNReal.continuous_ofReal.tendsto _).comp
      ((Real.continuous_exp.tendsto _).comp (hpt j))
  have hQ0 : ∀ j, 0 < Q j := fun j => by
    rw [hQ]
    exact ENNReal.ofReal_pos.2 (Real.exp_pos _)
  have hQiG : ∀ i j, Qi i j ≤ ENNReal.ofReal (ψ j * t ^ φ j) := fun i j => by
    rw [hQi]
    refine ENNReal.ofReal_le_ofReal ?_
    calc Real.exp (Λ (D i) j) ≤ Real.exp (B j) := Real.exp_le_exp.2 (hΛB _ _)
      _ = ψ j * t ^ φ j := by
        rw [hB]
        dsimp only
        rw [Real.exp_add, Real.exp_log (hψ0 j), mul_comm (φ j) (Real.log t),
          ← Real.rpow_def_of_pos ht0, mul_comm]
  have hQfixk : ∀ k, genFun μ Q k = Q k := by
    intro k
    have h1 := tendsto_genFun_of_dominated μ k hQlim hQ0 hQiG (htfin k)
    have h2 : Tendsto (fun i => genFun μ (Qi i) k) atTop (𝓝 (Q k)) := by
      refine (hQlim k).congr' ?_
      filter_upwards [eventually_ge_atTop k] with i hi
      have hk : k < D i + 1 := Nat.lt_succ_of_le (hi.trans (hD.id_le i))
      have hQi' : Qi i = fun j => if h : j < D i + 1 then EReal.exp (lam (D i) ⟨j, h⟩) else 1 := by
        rw [hQi, hΛ]
        funext j
        exact ofReal_exp_extend_eq (lam (D i)) (hlam' (D i)) j
      rw [hQi', genFun_extend_exp_of_fixed μ (lam (D i)) (hfix (D i)) k hk]
      simp [hk]
    exact tendsto_nhds_unique h1 h2
  have hQfix : genFun μ Q = Q := funext hQfixk
  -- `#nonzero-limit`: some coordinate `Λ_{k₀} ≥ c > 0`
  have hkk : ∀ i, ∃ k, k < K ∧ c ≤ Λ (D i) k := by
    intro i
    have hne : lam (D i) ≠ 0 := fun h =>
      (hlam (D i) ⟨0, Nat.succ_pos _⟩).1.ne' (congrFun h _)
    obtain ⟨k, hk, hkK, hck⟩ := hKc (D i + 1) (lam (D i)) (hlam' (D i)) hne (hfix (D i))
    refine ⟨k, hkK, ?_⟩
    rw [hΛ]
    dsimp only
    simp only [hk, dite_true]
    have h1 := EReal.toReal_le_toReal hck (EReal.coe_ne_bot c) (hlam' _ _).2.ne
    rwa [EReal.toReal_coe] at h1
  choose kk hkK hkc using hkk
  obtain ⟨k₀, -, hfreq⟩ := exists_frequently_eq_of_lt K kk hkK
  have hLk₀ : c ≤ L k₀ := by
    have hfreq' : ∃ᶠ i in atTop, Λ (D i) k₀ ∈ Set.Ici c := hfreq.mono fun i hi => by
      rw [← hi]
      exact hkc i
    exact isClosed_Ici.mem_of_frequently_of_tendsto hfreq' (hpt k₀)
  -- `#positivity`
  have hQ1 : ∀ j, 1 ≤ Q j := fun j => by
    rw [hQ]
    exact ENNReal.one_le_ofReal.2 (Real.one_le_exp (hL0 j))
  have hQk₀ : 1 < Q k₀ := by
    rw [hQ]
    exact ENNReal.one_lt_ofReal.2 (Real.one_lt_exp_iff.2 (hc0.trans_le hLk₀))
  refine ⟨Q, fun j => ⟨one_lt_of_genFun_eq_self_of_truncate μ (fun d hd => (hI d hd).2.1.1) hQ1
    hQfix hQk₀ j, ?_⟩, hQfix⟩
  rw [hQ]
  exact ENNReal.ofReal_lt_top

end Conjugate

end
