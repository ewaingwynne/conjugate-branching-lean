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
public import Conjugate.Internal.Section3.SingleTypeRestriction
public import Conjugate.Internal.Section3.Truncation
import Conjugate.Frozen.Proposition_1_6_FixedPoint
import Conjugate.Internal.Analytic.GenFun
import Conjugate.Internal.Analytic.LogGenFun

/-!
# Lemma 3.4: the single-type restriction `X̃^k` and the growth bound

Lean indexes types from `0`: paper type `k` is Lean type `k - 1`, and the paper's `f_1` is
`genFun μ · 0`. Throughout `f̃_k(y) = f_k(1, …, y, …, 1) = genFun μ (Function.update 1 k y) k`
(`genFun_restrictType`), and `q = e^η` (the statements are in `q`-coordinates).

* `existsUnique_fixedPoint_restrictType`: Lemma 3.4 (a) (paper.tex:1118-1126). The sealed
  `Conjugate.proposition_1_6_fixedPoint` is applied to `restrictType μ k`: its mean is
  `M^{(k+1)}_{kk} < 1` (subcriticality of the truncation `truncate μ (k+1)`), hypothesis II is
  the assumption, and continuity on `(0,∞]` is Hypothesis III of `truncate μ (k+1)` composed with
  `x ↦ (1, …, x, …, 1)`.
* `exp_fixedPoint_truncate_le`: Lemma 3.4 (b) (paper.tex:1127-1134, ERRATA E9: for every `d > k`
  in Lean indexing). `e^{x_k} = f^d_k(e^x) ≥ f̃_k(e^{x_k})` by (3.2) and monotonicity, and by
  strict convexity `f̃_k(y) > y` for `y > q`; hence `e^{x_k} ≤ q`.
* `fixedPoint_truncate_le_growth`: Lemma 3.4 (c), the growth bound (3.17)
  (paper.tex:1136-1144). `q₀ ≤ t` from `f̃_0(t) > t`, then `x_k = g_k(x, 0, 0, …) ≤
  log ψ(k) + φ(k) x_0` by Hypothesis II of Theorem 3.1, and `x_0 ≤ log q₀ ≤ log t` by (b).

Helper: `genFun_extend_exp_of_fixed`.
-/

public section

open MeasureTheory Filter Topology

open scoped ENNReal

namespace Conjugate

/-- A fixed point `x` of `g^d` gives `f_j(e^{x_1}, …, e^{x_d}, 1, 1, …) = e^{x_j}` for `j < d`. -/
lemma genFun_extend_exp_of_fixed (μ : ℕ → PMF (ℕ →₀ ℕ)) {d : ℕ} (x : Fin d → EReal)
    (hfix : logGenFun (truncate μ d) x = x) (j : ℕ) (hj : j < d) :
    genFun μ (fun i => if h : i < d then EReal.exp (x ⟨i, h⟩) else 1) j =
      EReal.exp (x ⟨j, hj⟩) := by
  have hf := congrFun ((logGenFun_eq_self_iff (truncate μ d) x).1 hfix) ⟨j, hj⟩
  rw [genFun_truncate] at hf
  exact hf

/-- **Lemma 3.4 (a)** (paper.tex:1118-1126), in `q = e^η` coordinates: `f̃_k(y) = y` has a unique
solution in `(1,∞)`. -/
theorem existsUnique_fixedPoint_restrictType (μ : ℕ → PMF (ℕ →₀ ℕ))
    (hI : ∀ d, 1 ≤ d →
      IsSubcritical (truncate μ d) ∧
        (IsPositiveRegular (truncate μ d) ∧ IsNonsingular (truncate μ d)) ∧
        ∀ k, ContinuousOn (fun q => genFun (truncate μ d) q k) {q | ∀ j, 0 < q j})
    {k : ℕ} (hk : 0 < (μ k).toMeasure {c | 2 ≤ c k}) :
    ∃! q : ℝ≥0∞, 1 < q ∧ q < ∞ ∧ genFun μ (Function.update 1 k q) k = q := by
  set κ : Fin (k + 1) := ⟨k, Nat.lt_succ_self k⟩ with hκ
  have hI' := hI (k + 1) (Nat.succ_pos k)
  -- hypothesis I: the mean of `X̃^k` is `< 1`
  have hmean : meanMatrix (restrictType μ k) 0 0 < 1 := by
    rw [meanMatrix_restrictType]
    exact lintegral_lt_one_of_isSubcritical_truncate μ k hI'.1
  -- hypothesis II
  have hII : 0 < (restrictType μ k 0).toMeasure {c | 2 ≤ c 0} := by
    unfold restrictType
    rw [← PMF.toMeasure_map _ _ (Measurable.of_discrete),
      Measure.map_apply (Measurable.of_discrete) (MeasurableSet.of_discrete)]
    simpa using hk
  -- hypothesis III
  have hfun : (fun q : ℝ≥0∞ => genFun (restrictType μ k) (fun _ => q) 0) =
      fun q => genFun (truncate μ (k + 1)) (Function.update 1 κ q) κ := by
    funext q
    rw [genFun_restrictType, genFun_truncate, extend_update_one (k + 1) k (Nat.lt_succ_self k)]
  have hIII : ContinuousOn (fun q : ℝ≥0∞ => genFun (restrictType μ k) (fun _ => q) 0)
      (Set.Ioi 0) := by
    rw [hfun]
    have hcont : Continuous fun q : ℝ≥0∞ => Function.update (1 : Fin (k + 1) → ℝ≥0∞) κ q :=
      continuous_const.update κ continuous_id
    refine (hI'.2.2 κ).comp hcont.continuousOn fun q hq j => ?_
    by_cases h : j = κ
    · subst h
      simpa using hq
    · simp [Function.update_of_ne h]
  have := proposition_1_6_fixedPoint (restrictType μ k) hmean hII hIII
  simpa only [genFun_restrictType] using this

/-- **Lemma 3.4 (b)** (paper.tex:1127-1134; ERRATA E9: for every `d > k` in Lean indexing). -/
theorem exp_fixedPoint_truncate_le (μ : ℕ → PMF (ℕ →₀ ℕ))
    {k : ℕ} {q : ℝ≥0∞} (hq1 : 1 < q) (hqt : q < ∞)
    (hqfix : genFun μ (Function.update 1 k q) k = q)
    (hk : 0 < (μ k).toMeasure {c | 2 ≤ c k})
    {d : ℕ} (hd : k < d) (x : Fin d → EReal) (hx : ∀ j, 0 ≤ x j ∧ x j < ⊤)
    (hfix : logGenFun (truncate μ d) x = x) :
    EReal.exp (x ⟨k, hd⟩) ≤ q := by
  by_contra hlt
  have hlt' : q < EReal.exp (x ⟨k, hd⟩) := not_le.1 hlt
  have hyt : EReal.exp (x ⟨k, hd⟩) < ∞ := EReal.exp_lt_top_iff.2 (hx _).2
  have h1 := lt_genFun_of_fixed_lt μ hq1 hqt hqfix hk hlt' hyt
  have h2 : genFun μ (Function.update 1 k (EReal.exp (x ⟨k, hd⟩))) k ≤
      EReal.exp (x ⟨k, hd⟩) := by
    refine le_trans (genFun_mono μ (fun j => ?_) k)
      (genFun_extend_exp_of_fixed μ x hfix k hd).le
    by_cases hjk : j = k
    · subst hjk
      simp [hd]
    · rw [Function.update_of_ne hjk, Pi.one_apply]
      by_cases hj : j < d
      · simpa [hj] using EReal.one_le_exp_iff.2 (hx ⟨j, hj⟩).1
      · simp [hj]
  exact lt_irrefl _ (h1.trans_le h2)

/-- **Lemma 3.4 (c)**, the growth bound (3.17) (paper.tex:1136-1144). -/
theorem fixedPoint_truncate_le_growth (μ : ℕ → PMF (ℕ →₀ ℕ))
    (hI : ∀ d, 1 ≤ d →
      IsSubcritical (truncate μ d) ∧
        (IsPositiveRegular (truncate μ d) ∧ IsNonsingular (truncate μ d)) ∧
        ∀ k, ContinuousOn (fun q => genFun (truncate μ d) q k) {q | ∀ j, 0 < q j})
    (φ ψ : ℕ → ℝ) (hφ : ∀ k, 1 ≤ φ k) (hψ : ∀ k, 1 ≤ ψ k)
    (hII : ∀ k (q : ℕ → ℝ≥0∞), (∀ j, 1 ≤ q j ∧ q j < ∞) →
      genFun μ q k ≤ ENNReal.ofReal (ψ k) * genFun μ q 0 ^ φ k)
    {t : ℝ} (ht : 1 < t)
    (htf : ENNReal.ofReal t < genFun μ (fun j => if j = 0 then ENNReal.ofReal t else 1) 0)
    {d k : ℕ} (hd : k < d) (x : Fin d → EReal) (hx : ∀ j, 0 ≤ x j ∧ x j < ⊤)
    (hfix : logGenFun (truncate μ d) x = x) :
    x ⟨k, hd⟩ ≤ ((φ k * Real.log t + Real.log (ψ k) : ℝ) : EReal) := by
  have hd0 : 0 < d := Nat.zero_lt_of_lt hd
  -- `ℙ_0[c_0 ≥ 2] > 0`, and the fixed point `q₀` of `f̃_0`
  have hk0 := pos_of_isNonsingular_truncate_one μ (hI 1 le_rfl).2.1.2
  obtain ⟨q₀, ⟨hq1, hqt, hqfix⟩, -⟩ := existsUnique_fixedPoint_restrictType μ hI hk0
  -- `q₀ ≤ t`
  have ht1 : 1 < ENNReal.ofReal t := ENNReal.one_lt_ofReal.2 ht
  have hupd : (fun j : ℕ => if j = 0 then ENNReal.ofReal t else 1) =
      Function.update (1 : ℕ → ℝ≥0∞) 0 (ENNReal.ofReal t) := by
    funext j
    by_cases hj : j = 0
    · subst hj
      simp
    · simp [hj]
  have hq₀t : q₀ ≤ ENNReal.ofReal t := by
    by_contra hlt
    have h := genFun_lt_of_lt_fixed μ hq1 hqt hqfix hk0 ht1 (not_le.1 hlt)
    rw [hupd] at htf
    exact lt_irrefl _ (htf.trans h)
  -- `e^{x_0} ≤ t`
  have hx0 : EReal.exp (x ⟨0, hd0⟩) ≤ ENNReal.ofReal t :=
    (exp_fixedPoint_truncate_le μ hq1 hqt hqfix hk0 hd0 x hx hfix).trans hq₀t
  -- Hypothesis II of Theorem 3.1 at the extended vector
  set qe : ℕ → ℝ≥0∞ := fun i => if h : i < d then EReal.exp (x ⟨i, h⟩) else 1 with hqe
  have hqe1 : ∀ j, 1 ≤ qe j ∧ qe j < ∞ := fun j => by
    by_cases h : j < d
    · simp only [hqe, h, dite_true]
      exact ⟨EReal.one_le_exp_iff.2 (hx _).1, EReal.exp_lt_top_iff.2 (hx _).2⟩
    · simp only [hqe, h, dite_false]
      exact ⟨le_rfl, ENNReal.one_lt_top⟩
  have h1 := hII k qe hqe1
  rw [genFun_extend_exp_of_fixed μ x hfix k hd, genFun_extend_exp_of_fixed μ x hfix 0 hd0] at h1
  have hφk : 0 < φ k := lt_of_lt_of_le one_pos (hφ k)
  have ht0 : 0 < t := lt_trans one_pos ht
  have hψk : 0 < ψ k := lt_of_lt_of_le one_pos (hψ k)
  have h2 : EReal.exp (x ⟨k, hd⟩) ≤ ENNReal.ofReal (ψ k * t ^ φ k) := by
    calc EReal.exp (x ⟨k, hd⟩)
        ≤ ENNReal.ofReal (ψ k) * EReal.exp (x ⟨0, hd0⟩) ^ φ k := h1
      _ ≤ ENNReal.ofReal (ψ k) * ENNReal.ofReal t ^ φ k := by
          gcongr
      _ = ENNReal.ofReal (ψ k * t ^ φ k) := by
          rw [ENNReal.ofReal_rpow_of_pos ht0, ENNReal.ofReal_mul hψk.le]
  calc x ⟨k, hd⟩ = ENNReal.log (EReal.exp (x ⟨k, hd⟩)) := (EReal.log_exp _).symm
    _ ≤ ENNReal.log (ENNReal.ofReal (ψ k * t ^ φ k)) := ENNReal.log_le_log h2
    _ = ((Real.log (ψ k * t ^ φ k) : ℝ) : EReal) := by
        have hpos : 0 < ψ k * t ^ φ k := mul_pos hψk (Real.rpow_pos_of_pos ht0 _)
        rw [ENNReal.log_ofReal]
        simp [not_le.2 hpos]
    _ = _ := by
        rw [Real.log_mul hψk.ne' (Real.rpow_pos_of_pos ht0 _).ne', Real.log_rpow ht0, add_comm]

end Conjugate

end
