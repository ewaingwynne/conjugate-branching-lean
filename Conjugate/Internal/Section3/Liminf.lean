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
import Conjugate.Internal.Analytic.GenFun
import Conjugate.Internal.Analytic.LogGenFun
import Conjugate.Internal.Foundations.Extinction
import Conjugate.Internal.Section2.MonotoneLimit
import Conjugate.Internal.Section2.Unstable
import Conjugate.Internal.Section3.SingleTypeFixedPoint
import Conjugate.Internal.Section3.Truncation

/-!
# Lemma 3.3: a coordinate of every fixed point of a truncation is bounded below

Lean indexes types from `0`: paper type `k` is Lean type `k - 1`, and the paper's `f_1` is
`genFun μ · 0`. Throughout, `g = logGenFun μ`, `g^d = logGenFun (truncate μ d)`, `δ = log s` with
`s` from Hypothesis III of Theorem 3.1.

`exists_liminf_fixedPoint_truncate` (`lem-fixed-liminf`, paper.tex:1031-1097): there are `K ≥ 1`
and `c > 0` such that every nonzero fixed point `x ∈ [0,∞)^d` of `g^d` has a coordinate `k < K`
with `x_k ≥ c`. The proof follows paper.tex:1037-1097.

* **Step 1** (paper.tex:1041-1074). Hypothesis III says `g_k(δ φ) ≤ δ φ(k)` (`logGenFun_mul_le`,
  since `s^{∑_j φ_j c_j} = ∏_j (e^{δ φ_j})^{c_j}`), so `g^d(δ φ|_d) ≤ δ φ|_d` by (3.2) and
  monotonicity (`logGenFun_truncate_mul_le`). If `x_k < δ φ(k)` for every `k`, then
  Proposition 2.10 (i) (`tendsto_zero_of_lt`, `m = 1`) for the truncation gives
  `g^{d,(n)}(x) → 0`; but `x` is a nonzero fixed point. So some `x_k ≥ δ φ(k)`
  (`exists_mul_le_of_fixed`).
* **Step 2** (paper.tex:1076-1097). Hypothesis II at `e^{(x, 0, 0, …)}` gives
  `x_k ≤ log ψ(k) + φ(k) x_0` (`fixedPoint_truncate_le_of_hII`). With `K` such that
  `log ψ(k) ≤ (δ/2) φ(k)` for `k ≥ K`, either `k < K` and `x_k ≥ δ φ(k) ≥ δ`, or `x_0 ≥ δ/2`.
  Hence `c = δ/2`.
-/

public section

open MeasureTheory ProbabilityTheory Filter Topology

open scoped ENNReal

namespace Conjugate

/-- The monomial at the vector `e^{δ φ}`, `δ = log s`: `∏_j (e^{δ φ_j})^{c_j} = s^{∑_j φ_j c_j}`. -/
lemma prod_exp_mul_eq_rpow (φ : ℕ → ℝ) {s : ℝ} (hs : 0 < s) (c : ℕ →₀ ℕ) :
    c.prod (fun j n => EReal.exp ((Real.log s * φ j : ℝ) : EReal) ^ n) =
      ENNReal.ofReal (s ^ (c.sum fun j n => φ j * n)) := by
  unfold Finsupp.prod Finsupp.sum
  rw [Real.rpow_sum_of_pos hs,
    ENNReal.ofReal_prod_of_nonneg (fun j _ => Real.rpow_nonneg hs.le _)]
  refine Finset.prod_congr rfl fun j _ => ?_
  dsimp only
  rw [EReal.exp_coe, ← Real.rpow_def_of_pos hs, Real.rpow_mul_natCast hs.le,
    ENNReal.ofReal_pow (Real.rpow_nonneg hs.le _)]

/-- **Hypothesis III in log coordinates** (paper.tex:1041-1047): `g_k(δ φ) ≤ δ φ(k)`,
`δ = log s`. -/
lemma logGenFun_mul_le (μ : ℕ → PMF (ℕ →₀ ℕ)) (φ : ℕ → ℝ) {s : ℝ} (hs : 1 < s)
    (hIII : ∀ k, ∫⁻ c, ENNReal.ofReal (s ^ (c.sum fun j n => φ j * n)) ∂(μ k).toMeasure ≤
      ENNReal.ofReal (s ^ φ k)) (k : ℕ) :
    logGenFun μ (fun j => ((Real.log s * φ j : ℝ) : EReal)) k ≤
      ((Real.log s * φ k : ℝ) : EReal) := by
  have hs0 : 0 < s := zero_lt_one.trans hs
  unfold logGenFun genFun
  simp_rw [prod_exp_mul_eq_rpow φ hs0]
  calc ENNReal.log (∫⁻ c, ENNReal.ofReal (s ^ (c.sum fun j n => φ j * n)) ∂(μ k).toMeasure)
      ≤ ENNReal.log (ENNReal.ofReal (s ^ φ k)) := ENNReal.log_le_log (hIII k)
    _ = _ := by
      have hpos : ¬ s ^ φ k ≤ 0 := not_le.2 (Real.rpow_pos_of_pos hs0 _)
      simp only [ENNReal.log_ofReal, hpos, ite_false, Real.log_rpow hs0, mul_comm]

/-- `g^d(δ φ|_d) ≤ δ φ|_d` (paper.tex:1048-1056), by (3.2) and monotonicity. -/
lemma logGenFun_truncate_mul_le (μ : ℕ → PMF (ℕ →₀ ℕ)) (φ : ℕ → ℝ) (hφ : ∀ k, 0 ≤ φ k)
    {s : ℝ} (hs : 1 < s)
    (hIII : ∀ k, ∫⁻ c, ENNReal.ofReal (s ^ (c.sum fun j n => φ j * n)) ∂(μ k).toMeasure ≤
      ENNReal.ofReal (s ^ φ k)) (d : ℕ) :
    logGenFun (truncate μ d) (fun j : Fin d => ((Real.log s * φ j : ℝ) : EReal)) ≤
      fun j : Fin d => ((Real.log s * φ j : ℝ) : EReal) := by
  intro k
  rw [logGenFun_truncate]
  refine le_trans (logGenFun_mono μ (fun j => ?_) k) (logGenFun_mul_le μ φ hs hIII k)
  dsimp only
  by_cases h : j < d
  · simp [h]
  · simp only [h, dite_false]
    exact_mod_cast mul_nonneg (Real.log_nonneg hs.le) (hφ j)

/-- **Lemma 3.3, Step 1** (paper.tex:1041-1074): a nonzero fixed point `x ∈ [0,∞)^d` of `g^d`
has a coordinate `x_k ≥ δ φ(k)`. Otherwise Proposition 2.10 (i) for the truncation, applied to
`x ≤ δ φ|_d`, `x ≠ δ φ|_d`, would give `g^{d,(n)}(x) → 0`, while `g^{d,(n)}(x) = x ≠ 0`. -/
lemma exists_mul_le_of_fixed (μ : ℕ → PMF (ℕ →₀ ℕ))
    (hI : ∀ d, 1 ≤ d →
      IsSubcritical (truncate μ d) ∧
        (IsPositiveRegular (truncate μ d) ∧ IsNonsingular (truncate μ d)) ∧
        ∀ k, ContinuousOn (fun q => genFun (truncate μ d) q k) {q | ∀ j, 0 < q j})
    (φ : ℕ → ℝ) (hφ : ∀ k, 1 ≤ φ k) {s : ℝ} (hs : 1 < s)
    (hIII : ∀ k, ∫⁻ c, ENNReal.ofReal (s ^ (c.sum fun j n => φ j * n)) ∂(μ k).toMeasure ≤
      ENNReal.ofReal (s ^ φ k))
    {d : ℕ} (x : Fin d → EReal) (hx : ∀ j, 0 ≤ x j ∧ x j < ⊤) (hx0 : x ≠ 0)
    (hfix : logGenFun (truncate μ d) x = x) :
    ∃ k : Fin d, ((Real.log s * φ k : ℝ) : EReal) ≤ x k := by
  by_contra hcon'
  have hcon : ∀ k : Fin d, x k < ((Real.log s * φ k : ℝ) : EReal) := fun k =>
    not_le.1 fun h => hcon' ⟨k, h⟩
  have hd : 1 ≤ d := by
    rcases Nat.eq_zero_or_pos d with h | h
    · subst h
      exact absurd (Subsingleton.elim x 0) hx0
    · exact h
  obtain ⟨hsub, ⟨hpr, -⟩, -⟩ := hI d hd
  set X : Fin d → EReal := fun j => ((Real.log s * φ j : ℝ) : EReal) with hX
  have hX0 : ∀ j, 0 ≤ X j ∧ X j < ⊤ := fun j =>
    ⟨EReal.coe_nonneg.2 (mul_nonneg (Real.log_nonneg hs.le) (zero_le_one.trans (hφ j))),
      EReal.coe_lt_top _⟩
  have hle : (logGenFun (truncate μ d))^[1] X ≤ X := by
    rw [Function.iterate_one]
    exact logGenFun_truncate_mul_le μ φ (fun k => zero_le_one.trans (hφ k)) hs hIII d
  have hbd := limsup_lt_top_of_iterate_le (truncate μ d) hX0 hle
  have hext : ∀ k, pathLaw (truncate μ d) (Finsupp.single k 1) (extinctionEvent (Fin d)) = 1 :=
    fun k => pathLaw_extinctionEvent_eq_one (truncate μ d) hsub _
  have hyx : x ≤ X := fun j => (hcon j).le
  have hne : x ≠ X := fun h => (hcon ⟨0, hd⟩).ne (congrFun h ⟨0, hd⟩)
  have h0 := tendsto_zero_of_lt (truncate μ d) hext hpr (m := 1) le_rfl hX0 hbd
    (fun j => (hx j).1) hyx hne
  have hconst : (fun r : ℕ => ⨆ j, ((logGenFun (truncate μ d))^[r * 1] x j).abs) =
      fun _ => ⨆ j, (x j).abs := by
    funext r
    rw [Function.iterate_fixed hfix]
  rw [hconst] at h0
  have hzero : (⨆ j, (x j).abs) = 0 := tendsto_nhds_unique tendsto_const_nhds h0
  apply hx0
  funext j
  exact EReal.abs_eq_zero_iff.1 (ENNReal.iSup_eq_zero.1 hzero j)

/-- **Hypothesis II at a fixed point** (paper.tex:1079-1082): `x_k ≤ log ψ(k) + φ(k) x_0`. -/
lemma fixedPoint_truncate_le_of_hII (μ : ℕ → PMF (ℕ →₀ ℕ)) (φ ψ : ℕ → ℝ)
    (hψ : ∀ k, 1 ≤ ψ k)
    (hII : ∀ k (q : ℕ → ℝ≥0∞), (∀ j, 1 ≤ q j ∧ q j < ∞) →
      genFun μ q k ≤ ENNReal.ofReal (ψ k) * genFun μ q 0 ^ φ k)
    {d k : ℕ} (hd : k < d) (x : Fin d → EReal) (hx : ∀ j, 0 ≤ x j ∧ x j < ⊤)
    (hfix : logGenFun (truncate μ d) x = x) :
    (x ⟨k, hd⟩).toReal ≤ Real.log (ψ k) + φ k * (x ⟨0, Nat.zero_lt_of_lt hd⟩).toReal := by
  have hd0 : 0 < d := Nat.zero_lt_of_lt hd
  set qe : ℕ → ℝ≥0∞ := fun i => if h : i < d then EReal.exp (x ⟨i, h⟩) else 1 with hqe
  have hqe1 : ∀ j, 1 ≤ qe j ∧ qe j < ∞ := fun j => by
    by_cases h : j < d
    · simp only [hqe, h, dite_true]
      exact ⟨EReal.one_le_exp_iff.2 (hx _).1, EReal.exp_lt_top_iff.2 (hx _).2⟩
    · simp only [hqe, h, dite_false]
      exact ⟨le_rfl, ENNReal.one_lt_top⟩
  have h1 := hII k qe hqe1
  rw [genFun_extend_exp_of_fixed μ x hfix k hd, genFun_extend_exp_of_fixed μ x hfix 0 hd0] at h1
  have hreal : ∀ j, x j = ((x j).toReal : EReal) := fun j =>
    (EReal.coe_toReal (hx j).2.ne (EReal.bot_lt_zero.trans_le (hx j).1).ne').symm
  set a : ℝ := (x ⟨k, hd⟩).toReal with ha
  set b : ℝ := (x ⟨0, hd0⟩).toReal with hb
  rw [hreal ⟨k, hd⟩, hreal ⟨0, hd0⟩, EReal.exp_coe, EReal.exp_coe,
    ENNReal.ofReal_rpow_of_pos (Real.exp_pos _), ← ENNReal.ofReal_mul
    (zero_le_one.trans (hψ k)), ← Real.exp_mul] at h1
  have hψk : 0 < ψ k := zero_lt_one.trans_le (hψ k)
  have h2 : Real.exp a ≤ ψ k * Real.exp (b * φ k) :=
    (ENNReal.ofReal_le_ofReal_iff (mul_nonneg hψk.le (Real.exp_pos _).le)).1 h1
  have h3 := Real.log_le_log (Real.exp_pos a) h2
  rw [Real.log_exp, Real.log_mul hψk.ne' (Real.exp_pos _).ne', Real.log_exp] at h3
  linarith

/-- **Lemma 3.3** (`lem-fixed-liminf`, paper.tex:1031-1097), in a form uniform in the fixed
point: there are `K ≥ 1` and `c > 0` such that every nonzero fixed point `x ∈ [0,∞)^d` of `g^d`
has a coordinate `k < K` with `x_k ≥ c`. -/
theorem exists_liminf_fixedPoint_truncate (μ : ℕ → PMF (ℕ →₀ ℕ))
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
        ENNReal.ofReal (s ^ φ k)) :
    ∃ K : ℕ, 1 ≤ K ∧ ∃ c : ℝ, 0 < c ∧ ∀ d (x : Fin d → EReal), (∀ j, 0 ≤ x j ∧ x j < ⊤) →
      x ≠ 0 → logGenFun (truncate μ d) x = x →
        ∃ k, ∃ hk : k < d, k < K ∧ (c : EReal) ≤ x ⟨k, hk⟩ := by
  obtain ⟨s, hs, hIII⟩ := hIII
  set δ : ℝ := Real.log s with hδ
  have hδ0 : 0 < δ := Real.log_pos hs
  -- the threshold `K`: `log ψ(k) ≤ (δ/2) φ(k)` for `k ≥ K`
  have hev : ∀ᶠ k in atTop, Real.log (ψ k) ≤ δ / 2 * φ k := by
    filter_upwards [hψφ_lim.eventually (gt_mem_nhds (half_pos hδ0))] with k hk
    have hφk : 0 < φ k := zero_lt_one.trans_le (hφ k)
    exact ((div_lt_iff₀ hφk).1 hk).le
  obtain ⟨K₀, hK₀⟩ := eventually_atTop.1 hev
  refine ⟨max K₀ 1, le_max_right _ _, δ / 2, half_pos hδ0, fun d x hx hx0 hfix => ?_⟩
  obtain ⟨k, hk⟩ := exists_mul_le_of_fixed μ hI φ hφ hs hIII x hx hx0 hfix
  have hφk : 0 < φ k := zero_lt_one.trans_le (hφ k)
  have hreal : ∀ j, x j = ((x j).toReal : EReal) := fun j =>
    (EReal.coe_toReal (hx j).2.ne (EReal.bot_lt_zero.trans_le (hx j).1).ne').symm
  have hk' : δ * φ k ≤ (x k).toReal := by
    rw [hreal k] at hk
    exact_mod_cast hk
  by_cases hkK : (k : ℕ) < max K₀ 1
  · refine ⟨k, k.2, hkK, ?_⟩
    rw [hreal k]
    have : δ / 2 ≤ (x k).toReal := by nlinarith [hφ k]
    exact_mod_cast this
  · have hd0 : 0 < d := Nat.zero_lt_of_lt k.2
    refine ⟨0, hd0, by omega, ?_⟩
    have h1 := fixedPoint_truncate_le_of_hII μ φ ψ hψ hII k.2 x hx hfix
    have h2 : Real.log (ψ k) ≤ δ / 2 * φ k := hK₀ k (le_of_max_le_left (not_lt.1 hkK))
    have h3 : δ / 2 * φ k ≤ (x ⟨0, hd0⟩).toReal * φ k := by linarith
    have h4 : δ / 2 ≤ (x ⟨0, hd0⟩).toReal := le_of_mul_le_mul_right h3 hφk
    rw [hreal ⟨0, hd0⟩]
    exact_mod_cast h4

end Conjugate

end
