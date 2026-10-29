/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsSubcritical
import Conjugate.Internal.Analytic.Subcritical
import Conjugate.Internal.Foundations.StepKernel
import Conjugate.Internal.Section2.Positivity

/-!
# Example 1.5: the offspring law and the hypotheses of Theorem 1.4

The offspring law of type `k` (with `k' = k.rev` the other type) has the four masses
`1/4` at `e_k`, `1/4` at `2 e_k`, `1/100` at `2 e_k + 2 e_{k'}` and `49/100` at `0`. They sum to
`1`, so `μ k` vanishes elsewhere, and the integral against `μ k` is the four-term sum
`lintegral_eq`. Consequences:

* `genFun_eq`: `f_k(q) = 49/100 + q_k/4 + q_k²/4 + q_k² q_{k'}²/100`;
* `genFun_ofReal`, `genFun_ofReal_eq_self`: the same formula on `ENNReal.ofReal p`, with the real
  polynomial `fReal`, so real fixed points of `fReal` are fixed points of `genFun`;
* `genFun_lt_top`: `f` is finite on finite arguments;
* `isSubcritical` (row sums `79/100`), `isPositiveRegular` (`N = 1`), `isNonsingular`.
-/

@[expose] public section

open MeasureTheory

open scoped ENNReal

namespace Conjugate.Internal.Example15

/-- The prescribed offspring masses of Example 1.5 (the hypothesis `hμ` of the anchor). -/
def Spec (μ : Fin 2 → PMF (Fin 2 →₀ ℕ)) : Prop :=
  ∀ k : Fin 2,
    μ k (Finsupp.single k 1) = 1 / 4 ∧ μ k (Finsupp.single k 2) = 1 / 4 ∧
    μ k (Finsupp.single k 2 + Finsupp.single k.rev 2) = 1 / 100 ∧ μ k 0 = 49 / 100

/-- The real generating polynomial `f_k(p) = 49/100 + p_k/4 + p_k²/4 + p_k² p_{k'}²/100`. -/
noncomputable def fReal (k : Fin 2) (p : Fin 2 → ℝ) : ℝ :=
  49 / 100 + 1 / 4 * p k + 1 / 4 * p k ^ 2 + 1 / 100 * (p k ^ 2 * p k.rev ^ 2)

variable {μ : Fin 2 → PMF (Fin 2 →₀ ℕ)}

lemma ofReal_49_100 : ENNReal.ofReal (49 / 100) = 49 / 100 := by
  rw [ENNReal.ofReal_div_of_pos (by norm_num)]; simp

lemma ofReal_1_4 : ENNReal.ofReal (1 / 4) = 1 / 4 := by
  rw [ENNReal.ofReal_div_of_pos (by norm_num)]; simp

lemma ofReal_1_100 : ENNReal.ofReal (1 / 100) = 1 / 100 := by
  rw [ENNReal.ofReal_div_of_pos (by norm_num)]; simp

/-- The four masses sum to `1`. -/
lemma sum_masses : (49 / 100 : ℝ≥0∞) + (1 / 4 + (1 / 4 + 1 / 100)) = 1 := by
  have : ENNReal.ofReal (49 / 100 + (1 / 4 + (1 / 4 + 1 / 100))) = 1 := by
    rw [show (49 / 100 + (1 / 4 + (1 / 4 + 1 / 100)) : ℝ) = 1 by norm_num]; simp
  rwa [ENNReal.ofReal_add (by norm_num) (by norm_num),
    ENNReal.ofReal_add (by norm_num) (by norm_num),
    ENNReal.ofReal_add (by norm_num) (by norm_num), ofReal_49_100, ofReal_1_4, ofReal_1_100] at this

lemma rev_ne (k : Fin 2) : k.rev ≠ k := by fin_cases k <;> decide

lemma eq_or_eq_rev (k j : Fin 2) : j = k ∨ j = k.rev := by
  fin_cases k <;> fin_cases j <;> simp

lemma single_one_ne_single_two (k : Fin 2) :
    (Finsupp.single k 1 : Fin 2 →₀ ℕ) ≠ Finsupp.single k 2 := by
  intro h
  simpa using DFunLike.congr_fun h k

lemma single_one_ne_two_add (k : Fin 2) :
    (Finsupp.single k 1 : Fin 2 →₀ ℕ) ≠ Finsupp.single k 2 + Finsupp.single k.rev 2 := by
  intro h
  have := DFunLike.congr_fun h k
  simp [(rev_ne k).symm] at this

lemma single_two_ne_two_add (k : Fin 2) :
    (Finsupp.single k 2 : Fin 2 →₀ ℕ) ≠ Finsupp.single k 2 + Finsupp.single k.rev 2 := by
  intro h
  have := DFunLike.congr_fun h k.rev
  simp [rev_ne k] at this

lemma zero_ne_single (k : Fin 2) (n : ℕ) (hn : n ≠ 0) :
    (0 : Fin 2 →₀ ℕ) ≠ Finsupp.single k n := by
  intro h
  have := DFunLike.congr_fun h k
  simp at this
  exact hn this.symm

lemma zero_ne_two_add (k : Fin 2) :
    (0 : Fin 2 →₀ ℕ) ≠ Finsupp.single k 2 + Finsupp.single k.rev 2 := by
  intro h
  have := DFunLike.congr_fun h k
  simp [(rev_ne k).symm] at this

/-- **The integral against the offspring law** is the four-term sum over the four atoms. -/
theorem lintegral_eq (hμ : Spec μ) (k : Fin 2) (F : (Fin 2 →₀ ℕ) → ℝ≥0∞) :
    ∫⁻ c, F c ∂(μ k).toMeasure =
      49 / 100 * F 0 + 1 / 4 * F (Finsupp.single k 1) + 1 / 4 * F (Finsupp.single k 2) +
        1 / 100 * F (Finsupp.single k 2 + Finsupp.single k.rev 2) := by
  classical
  obtain ⟨h1, h2, h3, h0⟩ := hμ k
  set S : Finset (Fin 2 →₀ ℕ) :=
    {0, Finsupp.single k 1, Finsupp.single k 2, Finsupp.single k 2 + Finsupp.single k.rev 2}
    with hS
  have hn01 := zero_ne_single k 1 one_ne_zero
  have hn02 := zero_ne_single k 2 two_ne_zero
  have hn03 := zero_ne_two_add k
  have hn12 := single_one_ne_single_two k
  have hn13 := single_one_ne_two_add k
  have hn23 := single_two_ne_two_add k
  have hsum : ∑ c ∈ S, μ k c = 1 := by
    rw [hS, Finset.sum_insert (by simp [hn01, hn02, hn03]),
      Finset.sum_insert (by simp [hn12, hn13]), Finset.sum_insert (by simp [hn23]),
      Finset.sum_singleton, h0, h1, h2, h3]
    exact sum_masses
  have hzero : ∀ c ∉ S, μ k c = 0 := by
    intro c hc
    have hle := sum_le_tsum (f := fun c => μ k c) (insert c S)
    rw [Finset.sum_insert hc, hsum, (μ k).tsum_coe] at hle
    have : μ k c + 1 ≤ 0 + 1 := by simpa using hle
    exact le_antisymm ((ENNReal.add_le_add_iff_right ENNReal.one_ne_top).1 this) bot_le
  rw [lintegral_countable']
  simp_rw [PMF.toMeasure_apply_singleton _ _ (measurableSet_singleton _)]
  rw [tsum_eq_sum (s := S) (fun c hc => by rw [hzero c hc, mul_zero])]
  rw [hS, Finset.sum_insert (by simp [hn01, hn02, hn03]),
      Finset.sum_insert (by simp [hn12, hn13]), Finset.sum_insert (by simp [hn23]),
      Finset.sum_singleton, h0, h1, h2, h3]
  ring

/-- **The generating function of Example 1.5** (paper.tex:255-262):
`f_k(q) = 49/100 + q_k/4 + q_k²/4 + q_k² q_{k'}²/100`. -/
theorem genFun_eq (hμ : Spec μ) (q : Fin 2 → ℝ≥0∞) (k : Fin 2) :
    genFun μ q k =
      49 / 100 + 1 / 4 * q k + 1 / 4 * q k ^ 2 + 1 / 100 * (q k ^ 2 * q k.rev ^ 2) := by
  unfold genFun
  rw [lintegral_eq hμ k]
  have e3 : (Finsupp.single k 2 + Finsupp.single k.rev 2).prod (fun j n => q j ^ n) =
      q k ^ 2 * q k.rev ^ 2 := by
    rw [Finsupp.prod_add_index' (fun _ => pow_zero _) (fun _ _ _ => pow_add _ _ _)]
    simp [Finsupp.prod_single_index]
  simp [Finsupp.prod_single_index, e3]

/-- `f` is finite at finite arguments. -/
theorem genFun_lt_top (hμ : Spec μ) (q : Fin 2 → ℝ≥0∞) (hq : ∀ j, q j < ∞) (k : Fin 2) :
    genFun μ q k < ∞ := by
  have h1 := (hq k).ne
  have h2 := (hq k.rev).ne
  rw [genFun_eq hμ]
  finiteness

/-- On `ENNReal.ofReal p` with `p ≥ 0`, `genFun` is the real polynomial `fReal`. -/
theorem genFun_ofReal (hμ : Spec μ) (p : Fin 2 → ℝ) (hp : ∀ j, 0 ≤ p j) (k : Fin 2) :
    genFun μ (fun j => ENNReal.ofReal (p j)) k = ENNReal.ofReal (fReal k p) := by
  have h1 := hp k
  have h2 := hp k.rev
  rw [genFun_eq hμ, fReal, ENNReal.ofReal_add (by positivity) (by positivity),
    ENNReal.ofReal_add (by positivity) (by positivity),
    ENNReal.ofReal_add (by positivity) (by positivity),
    ENNReal.ofReal_mul (by norm_num), ENNReal.ofReal_mul (by norm_num),
    ENNReal.ofReal_mul (by norm_num), ENNReal.ofReal_mul (by positivity),
    ENNReal.ofReal_pow h1, ENNReal.ofReal_pow h2,
    ofReal_49_100, ofReal_1_4, ofReal_1_100]

/-- A nonnegative real fixed point of `fReal` is a fixed point of `genFun`. -/
theorem genFun_ofReal_eq_self (hμ : Spec μ) (p : Fin 2 → ℝ) (hp : ∀ j, 0 ≤ p j)
    (hfix : ∀ k, fReal k p = p k) :
    genFun μ (fun j => ENNReal.ofReal (p j)) = fun j => ENNReal.ofReal (p j) := by
  funext k
  rw [genFun_ofReal hμ p hp, hfix]

/-- **Hypothesis I**: every row sum of the mean matrix is `79/100 < 1`. -/
theorem isSubcritical (hμ : Spec μ) : IsSubcritical μ := by
  refine isSubcritical_of_sum_lt_one μ fun k => ?_
  simp only [meanMatrix, Matrix.of_apply]
  rw [← lintegral_finsetSum _ (fun j _ => Measurable.of_discrete),
    lintegral_eq hμ k (fun c => ∑ j, (c j : ℝ≥0∞))]
  have e1 : ∀ (a : Fin 2) (n : ℕ), ∑ j, ((Finsupp.single a n j : ℕ) : ℝ≥0∞) = n := by
    intro a n
    simp [Finsupp.single_apply]
  have e3 : ∑ j, (((Finsupp.single k 2 + Finsupp.single k.rev 2 : Fin 2 →₀ ℕ) j : ℕ) : ℝ≥0∞) =
      4 := by
    simp only [Finsupp.coe_add, Pi.add_apply, Nat.cast_add, Finset.sum_add_distrib, e1]
    norm_num
  simp only [Finsupp.coe_zero, Pi.zero_apply, Nat.cast_zero, Finset.sum_const_zero, e1, e3]
  have e : (49 / 100 : ℝ≥0∞) * 0 + 1 / 4 * ((1 : ℕ) : ℝ≥0∞) + 1 / 4 * ((2 : ℕ) : ℝ≥0∞) +
      1 / 100 * 4 = ENNReal.ofReal (79 / 100) := by
    have : (79 / 100 : ℝ) = 1 / 4 * 1 + 1 / 4 * 2 + 1 / 100 * 4 := by norm_num
    rw [this, ENNReal.ofReal_add (by norm_num) (by norm_num),
      ENNReal.ofReal_add (by norm_num) (by norm_num), ENNReal.ofReal_mul (by norm_num),
      ENNReal.ofReal_mul (by norm_num), ENNReal.ofReal_mul (by norm_num), ofReal_1_4,
      ofReal_1_100]
    simp
  rw [e, ENNReal.ofReal_lt_one]
  norm_num

/-- A set containing an atom of `μ k` of positive mass has positive `μ k`-measure. -/
lemma toMeasure_pos {k : Fin 2} {B : Set (Fin 2 →₀ ℕ)} {c : Fin 2 →₀ ℕ} (hc : c ∈ B)
    (hpos : 0 < μ k c) : 0 < (μ k).toMeasure B := by
  rw [← PMF.toMeasure_apply_singleton _ _ (measurableSet_singleton c)] at hpos
  exact lt_of_lt_of_le hpos (measure_mono (Set.singleton_subset_iff.2 hc))

/-- **Hypothesis II, positive regularity**, with `N = 1`: each type has offspring of each type with
positive probability (`e_k` for `j = k`, `2 e_k + 2 e_{k'}` for `j = k'`). -/
theorem isPositiveRegular (hμ : Spec μ) : IsPositiveRegular μ := by
  refine ⟨1, le_rfl, fun k j => ?_⟩
  change 0 < pathLaw μ (Finsupp.single k 1) {ω | ω 1 ∈ {c : Fin 2 →₀ ℕ | 1 ≤ c j}}
  rw [pathLaw_eval_mem, pathLaw_map_eval_one, stepKernel_single]
  obtain ⟨h1, -, h3, -⟩ := hμ k
  rcases eq_or_eq_rev k j with rfl | rfl
  · refine toMeasure_pos (c := Finsupp.single j 1) (by simp) ?_
    rw [h1]; norm_num
  · refine toMeasure_pos (c := Finsupp.single k 2 + Finsupp.single k.rev 2) ?_ ?_
    · simp
    · rw [h3]; norm_num

/-- **Hypothesis II, non-singularity**: `ℙ_0[|X(1)| ≥ 2] ≥ 1/4`. -/
theorem isNonsingular (hμ : Spec μ) : IsNonsingular μ := by
  refine ⟨0, toMeasure_pos (c := Finsupp.single 0 2) ?_ ?_⟩
  · change 2 ≤ (Finsupp.single (0 : Fin 2) 2).sum fun _ n => n
    rw [Finsupp.sum_single_index rfl]
  · rw [(hμ 0).2.1]; norm_num

end Conjugate.Internal.Example15

end
