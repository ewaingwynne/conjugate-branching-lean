/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.IsConjugate
public import Conjugate.Frozen.Defs.IsSubcritical
public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.GenFun
import Conjugate.Internal.Conjugacy.Basic
import Conjugate.Internal.Foundations.Extinction
import Conjugate.Internal.PathSpace.Cylinder
import Conjugate.Internal.PathSpace.Markov
import Conjugate.Internal.PathSpace.Tilt
import Conjugate.Internal.Section2.Positivity

/-!
# Conjugate ⇒ fixed point

`exists_fixedPoint_of_isConjugate` (graph steps `thm-fixed-gf.equivalence#conjugate-to-fixed-point`
and `#conjugate-is-tilt`, paper.tex:238). Approved route deviation: the paper applies
Proposition 2.1 to the conjugate process `X̂`, which would need `X̂` positive regular,
non-singular and `0 < ℙ̂_k[E] < 1`. Here the tilt is read off generation `1` directly.

Let `a_j = ℙ̂_j[E]`.

* `a_k > 0` for every `k`: otherwise `ℙ̂_k[·| E]` is the zero measure, not `ℙ_k`.
* `offspring_eq_of_isConjugate`: the Markov property at time `1` (`pathLaw_cylinder_inter_shift`)
  for `μ̂`, the cylinder formula `pathLaw_cylinder_one` and the extinction product formula
  `pathLaw_extinctionEvent_eq_prod` give `μ_k(c) = a_k⁻¹ μ̂_k(c) ∏_j a_j^{c_j}`.
* With `q = 1/a` this is `μ̂_k(c) = q_k⁻¹ μ_k(c) ∏_j q_j^{c_j}`. Summing over `c` gives
  `f(q) = q`, with `q` finite and `q ≥ 1`.
* If `q = 𝟙`, then `μ̂ = μ`, contradicting the first clause of `IsConjugate`. So Lemma 2.3
  (`eq_one_or_one_lt_of_genFun_eq_self`, with certain extinction) gives `q ∈ (1,∞)^d`.
-/

public section

open MeasureTheory ProbabilityTheory

open scoped ENNReal

namespace Conjugate.Conjugacy

variable {ι : Type*} [Countable ι]

/-- **The first generation of a conjugate, read off the Markov property.** If `μHat` is conjugate
to `μ`, then `μ_k(c) = a_k⁻¹ μ̂_k(c) ∏_j a_j^{c_j}` where `a_j = ℙ̂_j[E]`. -/
lemma offspring_eq_of_isConjugate {μ μHat : ι → PMF (ι →₀ ℕ)} (h : IsConjugate μ μHat)
    (k : ι) (c : ι →₀ ℕ) :
    μ k c = (pathLaw μHat (Finsupp.single k 1) (extinctionEvent ι))⁻¹ *
      (μHat k c * c.prod fun j n => pathLaw μHat (Finsupp.single j 1) (extinctionEvent ι) ^ n) := by
  set y : ℕ → ι →₀ ℕ := fun i => if i = 0 then Finsupp.single k 1 else c with hy
  have hy1 : y 1 = c := by simp [hy]
  have hcyl := congrArg (fun P : Measure (ℕ → ι →₀ ℕ) => P {ω | ∀ i ≤ 1, ω i = y i}) (h.2 k)
  rw [cond_apply PathSpace.measurableSet_extinctionEvent] at hcyl
  have hE : extinctionEvent ι ∩ {ω | ∀ i ≤ 1, ω i = y i} =
      {ω | ∀ i ≤ 1, ω i = y i} ∩ (fun (ω : ℕ → ι →₀ ℕ) (m : ℕ) => ω (1 + m)) ⁻¹'
        extinctionEvent ι := by
    rw [Set.inter_comm]
    exact congrArg ({ω : ℕ → ι →₀ ℕ | ∀ i ≤ 1, ω i = y i} ∩ ·)
      (PathSpace.extinctionEvent_eq_preimage_shift 1)
  rw [hE, pathLaw_cylinder_inter_shift μHat _ 1 y PathSpace.measurableSet_extinctionEvent,
    pathLaw_cylinder_one μHat k c, hy1, pathLaw_extinctionEvent_eq_prod μHat c] at hcyl
  rw [← pathLaw_cylinder_one μ k c]
  exact hcyl.symm

end Conjugate.Conjugacy

namespace Conjugate

open Conjugacy

/-- **Conjugate ⇒ fixed point, with the explicit tilt** (paper.tex:238, ERRATA R3).

If `μHat` is conjugate to the subcritical, positive regular `μ`, then `q_k = 1/ℙ̂_k[E]` is a fixed
point of `f` in `(1,∞)^d`, and `μHat` is the tilt of `μ` by `q`. No non-singularity is needed:
the tilt is read off generation `1` (see the module docstring for the route). -/
theorem exists_fixedPoint_of_isConjugate {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hsub : IsSubcritical μ) (hpr : IsPositiveRegular μ) {μHat : Fin d → PMF (Fin d →₀ ℕ)}
    (h : IsConjugate μ μHat) :
    ∃ q : Fin d → ℝ≥0∞, (∀ j, 1 < q j ∧ q j < ∞) ∧ genFun μ q = q ∧
      ∀ k c, μHat k c = (q k)⁻¹ * (μ k c * c.prod fun j n => q j ^ n) := by
  obtain ⟨a, ha⟩ : ∃ a : Fin d → ℝ≥0∞, ∀ k,
      a k = pathLaw μHat (Finsupp.single k 1) (extinctionEvent (Fin d)) := ⟨_, fun _ => rfl⟩
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
  obtain ⟨q, hq⟩ : ∃ q : Fin d → ℝ≥0∞, ∀ k, q k = (a k)⁻¹ := ⟨_, fun _ => rfl⟩
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
  have hext : ∀ k, pathLaw μ (Finsupp.single k 1) (extinctionEvent (Fin d)) = 1 :=
    fun k => pathLaw_extinctionEvent_eq_one μ hsub _
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

end Conjugate

end
