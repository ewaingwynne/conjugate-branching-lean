/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Mathlib.Analysis.SpecialFunctions.Sqrt
public import Mathlib.Topology.Order.IntermediateValue

/-!
# Example 1.5: the three real fixed points

The fixed-point equations of Example 1.5 are, for `k = 0, 1` and `k' = 1 - k`,
`q_k = 49/100 + q_k/4 + q_k²/4 + q_k² q_{k'}²/100` (paper.tex:255-262). Solved with the
intermediate value theorem (no numerical evaluation beyond explicit rational bounds):

* `exists_symmetric_root`: a root `t ∈ (3/2, 2)` of
  `h(t) = 49/100 + t/4 + t²/4 + t⁴/100 - t` (`h(3/2) < 0 < h(2)`), the point `(t, t)`;
* `exists_asymmetric_root`: roots `(a, b)` with `11/10 < a < b`. With
  `P(s) = 3s/4 - 49/100 - s²/4` (positive on `[11/10, 6/5]`) and `ψ(s) = √(100 P(s)) / s`, the
  equation for `k = 0` at `(s, ψ(s))` holds identically (`ψ² s² = 100 P`), and the equation for
  `k = 1` becomes `G(s) = 49/100 - 3ψ/4 + ψ²/4 + P = 0`, where `G(11/10) < 0 < G(6/5)`.
  The root `a` of `G` and `b = ψ(a)` satisfy `b² ≥ 325/144 > (6/5)²`, hence `b > 6/5 > a`.
-/

public section

namespace Conjugate.Internal.Example15

/-- **The symmetric fixed point**: a root `t ∈ (3/2, 2)` of `f(t, t) = t`. -/
theorem exists_symmetric_root :
    ∃ t : ℝ, 3 / 2 < t ∧ t < 2 ∧ 49 / 100 + t / 4 + t ^ 2 / 4 + t ^ 2 * t ^ 2 / 100 = t := by
  have hc : ContinuousOn (fun t : ℝ => 49 / 100 + t / 4 + t ^ 2 / 4 + t ^ 2 * t ^ 2 / 100 - t)
      (Set.Icc (3 / 2) 2) := by fun_prop
  have h := intermediate_value_Ioo (show (3 / 2 : ℝ) ≤ 2 by norm_num) hc
  have h0 : (0 : ℝ) ∈ Set.Ioo
      ((fun t : ℝ => 49 / 100 + t / 4 + t ^ 2 / 4 + t ^ 2 * t ^ 2 / 100 - t) (3 / 2))
      ((fun t : ℝ => 49 / 100 + t / 4 + t ^ 2 / 4 + t ^ 2 * t ^ 2 / 100 - t) 2) := by
    constructor <;> norm_num
  obtain ⟨t, ⟨ht1, ht2⟩, ht⟩ := h h0
  exact ⟨t, ht1, ht2, by simp only at ht; linarith⟩

/-- `P s = 3s/4 - 49/100 - s²/4`: the value of `q_0² q_1² / 100` forced by the `k = 0` equation. -/
noncomputable def P (s : ℝ) : ℝ := 3 * s / 4 - 49 / 100 - s ^ 2 / 4

/-- `ψ s = √(100 P s) / s`. -/
noncomputable def psi (s : ℝ) : ℝ := Real.sqrt (100 * P s) / s

lemma P_ge {s : ℝ} (h1 : 11 / 10 ≤ s) (h2 : s ≤ 6 / 5) : 13 / 400 ≤ P s := by
  unfold P
  nlinarith [mul_nonneg (sub_nonneg.2 h1) (show (0:ℝ) ≤ 19 / 10 - s by linarith)]

lemma psi_nonneg {s : ℝ} (h : 0 < s) : 0 ≤ psi s := by
  unfold psi; positivity

lemma psi_sq_mul {s : ℝ} (h1 : 11 / 10 ≤ s) (h2 : s ≤ 6 / 5) : psi s ^ 2 * s ^ 2 = 100 * P s := by
  have hs : s ≠ 0 := by intro h; rw [h] at h1; norm_num at h1
  have hP := P_ge h1 h2
  unfold psi
  rw [div_pow, div_mul_cancel₀ _ (pow_ne_zero 2 hs), Real.sq_sqrt (by linarith)]

/-- `G s = 49/100 - 3ψ/4 + ψ²/4 + P`. -/
noncomputable def G (s : ℝ) : ℝ := 49 / 100 - 3 * psi s / 4 + psi s ^ 2 / 4 + P s

lemma continuousOn_G : ContinuousOn G (Set.Icc (11 / 10) (6 / 5)) := by
  have hP : Continuous P := by unfold P; fun_prop
  have hpsi : ContinuousOn psi (Set.Icc (11 / 10) (6 / 5)) := by
    unfold psi
    refine ContinuousOn.div ?_ continuousOn_id fun s hs => ?_
    · exact (Real.continuous_sqrt.comp (continuous_const.mul hP)).continuousOn
    · have := hs.1; intro h; rw [h] at this; norm_num at this
  unfold G
  have := hpsi
  fun_prop

lemma G_low : G (11 / 10) < 0 := by
  have h := psi_sq_mul (s := 11 / 10) le_rfl (by norm_num)
  have hP : P (11 / 10) = 13 / 400 := by unfold P; norm_num
  have hn := psi_nonneg (s := 11 / 10) (by norm_num)
  rw [hP] at h
  unfold G
  rw [hP]
  generalize psi (11 / 10) = b at *
  have : b ^ 2 = 325 / 121 := by nlinarith
  nlinarith

lemma G_high : 0 < G (6 / 5) := by
  have h := psi_sq_mul (s := 6 / 5) (by norm_num) le_rfl
  have hP : P (6 / 5) = 1 / 20 := by unfold P; norm_num
  have hn := psi_nonneg (s := 6 / 5) (by norm_num)
  rw [hP] at h
  unfold G
  rw [hP]
  generalize psi (6 / 5) = b at *
  have : b ^ 2 = 125 / 36 := by nlinarith
  nlinarith

/-- The asymmetric fixed point `(a, b)` with `a < b`. -/
theorem exists_asymmetric_root :
    ∃ a b : ℝ, 11 / 10 < a ∧ a < b ∧
      49 / 100 + a / 4 + a ^ 2 / 4 + a ^ 2 * b ^ 2 / 100 = a ∧
      49 / 100 + b / 4 + b ^ 2 / 4 + b ^ 2 * a ^ 2 / 100 = b := by
  have h := intermediate_value_Ioo (show (11 / 10 : ℝ) ≤ 6 / 5 by norm_num) continuousOn_G
  obtain ⟨a, ⟨ha1, ha2⟩, ha⟩ := h ⟨G_low, G_high⟩
  have hsq := psi_sq_mul ha1.le ha2.le
  have hP := P_ge ha1.le ha2.le
  have hn := psi_nonneg (s := a) (by linarith)
  have hPa : P a = 3 * a / 4 - 49 / 100 - a ^ 2 / 4 := rfl
  refine ⟨a, psi a, ha1, ?_, ?_, ?_⟩
  · generalize psi a = b at *
    have : (6 / 5 : ℝ) < b := by
      by_contra hb
      rw [not_lt] at hb
      nlinarith
    linarith
  · generalize psi a = b at *
    nlinarith
  · unfold G at ha
    generalize psi a = b at *
    nlinarith

end Conjugate.Internal.Example15
