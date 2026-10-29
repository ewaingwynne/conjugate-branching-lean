/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.ExtinctionEvent
public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.IsConjugate
public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.PathLaw
import Conjugate.Internal.Conjugacy.Basic
import Conjugate.Internal.Conjugacy.ConjugateToFixedPoint
import Conjugate.Internal.Foundations.Extinction
import Conjugate.Internal.Foundations.PathLaw
import Conjugate.Internal.PathSpace.Cylinder
import Conjugate.Internal.PathSpace.Markov
import Conjugate.Internal.PathSpace.Tilt
import Conjugate.Internal.Section2.Positivity

/-!
# Conjugate ⇒ fixed point, countable types

`exists_fixedPoint_of_isConjugate_nat` (graph steps `thm-fixed-gf.equivalence.ctble` for the
direction "conjugate ⇒ fixed point", paper.tex:934): for the type set `ℕ`, if `μHat` is
conjugate to a positive regular `μ` with certain extinction from each type, then
`q_k = 1/ℙ̂_k[E]` is a fixed point of `f` in `(1,∞)^ℕ` and `μHat` is the tilt of `μ` by `q`.

The proof is that of the finite-type `Conjugate.exists_fixedPoint_of_isConjugate`, with the
countable-type facts supplied by the general lemmas. The tilt is read off generation `1` by the
time-1 Markov property (`Conjugacy.offspring_eq_of_isConjugate`, valid for any countable type
set). Summing the tilt formula over `c` gives `f(q) = q`. If `q = 𝟙` then `μ̂ = μ`, which the
first clause of `IsConjugate` excludes, so Lemma 2.3 (`eq_one_or_one_lt_of_genFun_eq_self`,
which needs `hpr`) gives `q ∈ (1,∞)^ℕ`. No non-singularity is needed.

The statement is proved for an arbitrary countable type set
(`exists_fixedPoint_of_isConjugate_countable`) and specialized to `ℕ`.
-/

public section

open MeasureTheory ProbabilityTheory

open scoped ENNReal

namespace Conjugate

open Conjugacy

/-- **Conjugate ⇒ fixed point, countable type set, with the explicit tilt** (paper.tex:934,
ERRATA R3). -/
theorem exists_fixedPoint_of_isConjugate_countable {ι : Type*} [Countable ι]
    (μ : ι → PMF (ι →₀ ℕ))
    (hext : ∀ k, pathLaw μ (Finsupp.single k 1) (extinctionEvent ι) = 1)
    (hpr : IsPositiveRegular μ) {μHat : ι → PMF (ι →₀ ℕ)} (h : IsConjugate μ μHat) :
    ∃ q : ι → ℝ≥0∞, (∀ j, 1 < q j ∧ q j < ∞) ∧ genFun μ q = q ∧
      ∀ k c, μHat k c = (q k)⁻¹ * (μ k c * c.prod fun j n => q j ^ n) := by
  obtain ⟨a, ha⟩ : ∃ a : ι → ℝ≥0∞, ∀ k,
      a k = pathLaw μHat (Finsupp.single k 1) (extinctionEvent ι) := ⟨_, fun _ => rfl⟩
  -- `a_k > 0`, otherwise the conditional law would be the zero measure
  have ha0 : ∀ k, a k ≠ 0 := by
    intro k hk
    have h2 := h.2 k
    rw [cond_eq_zero_of_meas_eq_zero (by rw [← ha k]; exact hk)] at h2
    exact (IsProbabilityMeasure.ne_zero (pathLaw μ (Finsupp.single k 1))) h2.symm
  have ha1 : ∀ k, a k ≤ 1 := fun k => by rw [ha k]; exact prob_le_one
  have hatop : ∀ k, a k ≠ ∞ := fun k => ne_top_of_le_ne_top ENNReal.one_ne_top (ha1 k)
  have hμ : ∀ k c, μ k c = (a k)⁻¹ * (μHat k c * c.prod fun j n => a j ^ n) := by
    intro k c
    simp_rw [ha]
    exact offspring_eq_of_isConjugate h k c
  obtain ⟨q, hq⟩ : ∃ q : ι → ℝ≥0∞, ∀ k, q k = (a k)⁻¹ := ⟨_, fun _ => rfl⟩
  have hqtop : ∀ k, q k ≠ ∞ := fun k => by rw [hq]; exact ENNReal.inv_ne_top.2 (ha0 k)
  have hq0 : ∀ k, q k ≠ 0 := fun k => by rw [hq]; exact ENNReal.inv_ne_zero.2 (hatop k)
  -- the tilt formula
  have hform : ∀ k c, μHat k c = (q k)⁻¹ * (μ k c * c.prod fun j n => q j ^ n) := by
    intro k c
    have hqprod : (c.prod fun j n => q j ^ n) = (c.prod fun j n => a j ^ n)⁻¹ := by
      rw [inv_prod_pow hatop]
      simp_rw [hq]
    rw [hq, inv_inv, hqprod, hμ k c]
    have h1 : a k * (a k)⁻¹ = 1 := ENNReal.mul_inv_cancel (ha0 k) (hatop k)
    have hp : (c.prod fun j n => a j ^ n) * (c.prod fun j n => a j ^ n)⁻¹ = 1 :=
      ENNReal.mul_inv_cancel (PathSpace.prod_pow_ne_zero ha0 c) (PathSpace.prod_pow_ne_top hatop c)
    calc μHat k c = (a k * (a k)⁻¹) * μHat k c *
          ((c.prod fun j n => a j ^ n) * (c.prod fun j n => a j ^ n)⁻¹) := by rw [h1, hp]; ring
      _ = _ := by ring
  -- summing the tilt formula over `c` gives `f(q) = q`
  have hfix : genFun μ q = q := by
    funext k
    have hsum : ∑' c, μHat k c = 1 := (μHat k).tsum_coe
    simp_rw [hform k] at hsum
    rw [ENNReal.tsum_mul_left, ← genFun_eq_tsum] at hsum
    calc genFun μ q k = q k * ((q k)⁻¹ * genFun μ q k) := by
          rw [← mul_assoc, ENNReal.mul_inv_cancel (hq0 k) (hqtop k), one_mul]
      _ = q k := by rw [hsum, mul_one]
  -- `q ≠ 𝟙`, since otherwise `μHat = μ`; so Lemma 2.3 gives `q > 1`
  have hq_gt : ∀ k, 1 < q k := by
    rcases eq_one_or_one_lt_of_genFun_eq_self μ hpr hext hfix with hall | hall
    · exfalso
      have hμeq : μHat = μ := by
        funext k
        refine PMF.ext fun c => ?_
        rw [hform k c]
        simp [hall]
      obtain ⟨k, hk⟩ := h.1
      exact hk (by rw [hμeq])
    · exact hall
  exact ⟨q, fun j => ⟨hq_gt j, (hqtop j).lt_top⟩, hfix, hform⟩

/-- **Conjugate ⇒ fixed point, countable types** (paper.tex:934, ERRATA R3).

If `μHat` is conjugate to the positive regular `μ`, whose global extinction probability is one
from a single individual of each type, then `q_k = 1/ℙ̂_k[E]` is a fixed point of `f` in
`(1,∞)^ℕ`, and `μHat` is the tilt of `μ` by `q`. -/
theorem exists_fixedPoint_of_isConjugate_nat (μ : ℕ → PMF (ℕ →₀ ℕ))
    (hext : ∀ k, pathLaw μ (Finsupp.single k 1) (extinctionEvent ℕ) = 1)
    (hpr : IsPositiveRegular μ) {μHat : ℕ → PMF (ℕ →₀ ℕ)} (h : IsConjugate μ μHat) :
    ∃ q : ℕ → ℝ≥0∞, (∀ j, 1 < q j ∧ q j < ∞) ∧ genFun μ q = q ∧
      ∀ k c, μHat k c = (q k)⁻¹ * (μ k c * c.prod fun j n => q j ^ n) :=
  exists_fixedPoint_of_isConjugate_countable μ hext hpr h

end Conjugate

end
