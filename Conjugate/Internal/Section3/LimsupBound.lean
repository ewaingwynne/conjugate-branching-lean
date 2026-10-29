/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.LogGenFun
public import Conjugate.Frozen.Defs.Truncate
public import Conjugate.Internal.Section3.Truncation
import Conjugate.Internal.Analytic.GenFun
import Conjugate.Internal.Analytic.LogGenFun
import Conjugate.Internal.Foundations.PathLaw
import Conjugate.Internal.Section2.Attractive
import Conjugate.Internal.Section2.Positivity

/-!
# Lemma 3.2: bounded `k`-th coordinates of the fixed points of the truncations

`exists_bound_fixedPoint_truncate` (`lem-fixed-limsup`, paper.tex:1004-1025; Lean indexing, paper
type `k` is Lean type `k - 1`): for every `k` there is `B` such that every fixed point
`x ∈ [0,∞)^d` of `g^d = logGenFun (truncate μ d)`, `d > k`, has `x_k ≤ B`.

The proof follows paper.tex:1007-1025. Lemma 2.4 for `truncate μ (k+1)` gives `N` with
`p := ℙ_k[X^{k+1}(N) ≥ 2 e_k] > 0`. Since `e^x` is a fixed point of `f^d`,
`e^{x_k} = (f^d)^{(N)}_k(e^x)`; monotonicity bounds this below by `(f^d)^{(N)}_k` at the vector
`y = e^{x_k}` in coordinate `k` and `1` elsewhere, which by truncation monotonicity is at least
`(f^{k+1})^{(N)}_k(y e_k) = 𝔼_k[y^{X_k^{k+1}(N)}] ≥ y² p`. Hence `y p ≤ 1`, `x_k ≤ log (1/p)`.
-/

public section

open MeasureTheory ProbabilityTheory

open scoped ENNReal

namespace Conjugate

/-- `e^{(x_k at κ, 0 elsewhere)}` is `y` at `κ` and `1` elsewhere. -/
lemma exp_update_zero {n : ℕ} (κ : Fin n) (a : EReal) (i : Fin n) :
    EReal.exp (Function.update (0 : Fin n → EReal) κ a i) =
      Function.update (1 : Fin n → ℝ≥0∞) κ (EReal.exp a) i := by
  by_cases h : i = κ
  · subst h
    simp
  · simp [Function.update_of_ne h]

/-- **Lemma 3.2** (`lem-fixed-limsup`, paper.tex:1004-1025). -/
theorem exists_bound_fixedPoint_truncate (μ : ℕ → PMF (ℕ →₀ ℕ))
    (hII : ∀ d, 1 ≤ d → IsPositiveRegular (truncate μ d) ∧ IsNonsingular (truncate μ d))
    (k : ℕ) :
    ∃ B : ℝ, ∀ d (hd : k < d) (x : Fin d → EReal), (∀ j, 0 ≤ x j ∧ x j < ⊤) →
      logGenFun (truncate μ d) x = x → x ⟨k, hd⟩ ≤ B := by
  obtain ⟨N, hN1, hN⟩ := exists_pos_two_individuals (truncate μ (k + 1))
    (hII (k + 1) (by omega)).1 (hII (k + 1) (by omega)).2
  set κ : Fin (k + 1) := Fin.last k with hκ
  set p : ℝ≥0∞ := pathLaw (truncate μ (k + 1)) (Finsupp.single κ 1)
    {ω | Finsupp.single κ 1 + Finsupp.single κ 1 ≤ ω N} with hp
  have hp0 : 0 < p := hN κ κ
  have hp1 : p ≠ ⊤ := ne_top_of_le_ne_top ENNReal.one_ne_top prob_le_one
  have hpinv0 : p⁻¹ ≠ 0 := ENNReal.inv_ne_zero.2 hp1
  have hpinvtop : p⁻¹ ≠ ⊤ := ENNReal.inv_ne_top.2 hp0.ne'
  refine ⟨Real.log p⁻¹.toReal, fun d hd x hx hfix => ?_⟩
  have hdd : k + 1 ≤ d := hd
  set y : ℝ≥0∞ := EReal.exp (x ⟨k, hd⟩) with hy
  have hy1 : 1 ≤ y := EReal.one_le_exp_iff.2 (hx _).1
  have hytop : y ≠ ⊤ := (EReal.exp_lt_top_iff.2 (hx _).2).ne
  -- `e^x` is fixed by the iterate
  have hfixf := (logGenFun_eq_self_iff (truncate μ d) x).1 hfix
  have hiter : (genFun (truncate μ d))^[N] (fun j => EReal.exp (x j)) =
      fun j => EReal.exp (x j) := Function.iterate_fixed hfixf N
  -- the comparison vector
  set r : Fin d → ℝ≥0∞ := Function.update 1 ⟨k, hd⟩ y with hr
  have hr1 : ∀ j, 1 ≤ r j := fun j => by
    by_cases h : j = ⟨k, hd⟩
    · subst h
      simpa [hr] using hy1
    · simp [hr, Function.update_of_ne h]
  have hrle : r ≤ fun j => EReal.exp (x j) := fun j => by
    by_cases h : j = ⟨k, hd⟩
    · subst h
      simp [hr, hy]
    · simpa [hr, Function.update_of_ne h] using EReal.one_le_exp_iff.2 (hx j).1
  have h3 : (genFun (truncate μ d))^[N] r ⟨k, hd⟩ ≤ y := by
    have := (genFun_mono (truncate μ d)).iterate N hrle ⟨k, hd⟩
    rwa [hiter] at this
  -- truncation monotonicity
  have h2 := genFun_truncate_iterate_le μ hdd N r hr1 κ
  have hcast : Fin.castLE hdd κ = ⟨k, hd⟩ := Fin.ext rfl
  have hcomp : (fun j => r (Fin.castLE hdd j)) = Function.update (1 : Fin (k + 1) → ℝ≥0∞) κ y := by
    have := Function.update_comp_eq_of_injective (1 : Fin d → ℝ≥0∞) (Fin.castLE_injective hdd) κ y
    rw [hcast] at this
    exact this
  rw [hcomp, hcast] at h2
  -- the lower bound `y² p`
  have h1 : y * y * p ≤ (genFun (truncate μ (k + 1)))^[N] (Function.update 1 κ y) κ := by
    rw [genFun_iterate_eq]
    have hx' : ∀ i, 0 ≤ Function.update (0 : Fin (k + 1) → EReal) κ (x ⟨k, hd⟩) i := fun i => by
      by_cases h : i = κ
      · subst h
        simpa using (hx _).1
      · simp [Function.update_of_ne h]
    have := mul_measure_le_lintegral (truncate μ (k + 1)) N κ κ hx'
    simp only [exp_update_zero] at this
    simpa [hy, hp] using this
  have h4 : y * (y * p) ≤ y * 1 := by
    rw [mul_one, ← mul_assoc]
    exact h1.trans (h2.trans h3)
  have h5 : y * p ≤ 1 := (ENNReal.mul_le_mul_iff_right (zero_lt_one.trans_le hy1).ne' hytop).1 h4
  have h6 : y ≤ p⁻¹ := ENNReal.le_inv_iff_mul_le.2 h5
  calc x ⟨k, hd⟩ = ENNReal.log y := (EReal.log_exp _).symm
    _ ≤ ENNReal.log p⁻¹ := ENNReal.log_le_log h6
    _ = (Real.log p⁻¹.toReal : EReal) := ENNReal.log_pos_real hpinv0 hpinvtop

end Conjugate

end
