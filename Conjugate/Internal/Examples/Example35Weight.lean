/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.PopulationMeasurableSpace
public import Mathlib.Algebra.BigOperators.Finsupp.Basic
public import Mathlib.Algebra.Order.Group.Finset
public import Mathlib.Analysis.SpecialFunctions.Pow.Real
public import Mathlib.Data.Finsupp.Order
import Mathlib.MeasureTheory.Integral.Lebesgue.Basic

/-!
# Example 3.5: the additive weight `W(c) = ∑_j (j+1) c_j`

Lean indexes types from `0`, so the paper's weight `φ(j) = j` is `j + 1`, and the weight of an
offspring vector `c` is `wt c = ∑_j (j + 1) c_j`. It is additive over populations
(`wt` is an `AddMonoidHom`), which is what makes `u ^ wt` multiplicative over independent
individuals.

* `wt_eq`, `wt_real`, `wt_rpow`: the three forms of the weight used in the anchor
  (`ℕ`-valued, `ℝ`-valued, and as the exponent of a real power);
* `wt_eq_zero_iff`, `one_le_wt`: `wt c ≥ 1` unless `c = 0`;
* `sum_mul_le_wt`, `apply_le_wt`: the weight dominates `∑_{j ∈ S} (j + 1) c_j`;
* `wt_mono`: the weight is monotone for the componentwise order;
* `prod_ofReal_pow`: the monomial at `q_j = u^{j+1}` is `u ^ wt c`;
* `genFun_le_lintegral`: a bound on `f_k(q)` by `𝔼_k[u ^ W]` when `q_j ≤ u^{j+1}`.
-/

@[expose] public section

open MeasureTheory

open scoped ENNReal

namespace Conjugate.Internal.Example35

/-- The weight `wt c = ∑_j (j + 1) c_j` of an offspring vector (the paper's `∑_j j X_j`). -/
noncomputable def wt : (ℕ →₀ ℕ) →+ ℕ :=
  Finsupp.liftAddHom fun j : ℕ => AddMonoidHom.mulLeft (j + 1)

lemma wt_eq (c : ℕ →₀ ℕ) : wt c = c.sum fun j n => (j + 1) * n := by
  simp [wt, Finsupp.liftAddHom_apply]

/-- The real-valued form of the weight, as it appears in the anchor. -/
lemma wt_real (c : ℕ →₀ ℕ) : (c.sum fun j n => ((j : ℝ) + 1) * n) = (wt c : ℝ) := by
  rw [wt_eq, Finsupp.sum, Finsupp.sum]
  push_cast
  rfl

/-- The weight as the exponent of a real power. -/
lemma wt_rpow (u : ℝ) (c : ℕ →₀ ℕ) : u ^ (c.sum fun j n => ((j : ℝ) + 1) * n) = u ^ wt c := by
  rw [wt_real, Real.rpow_natCast]

lemma wt_single (k : ℕ) : wt (Finsupp.single k 1) = k + 1 := by
  simp [wt_eq]

lemma wt_eq_zero_iff (c : ℕ →₀ ℕ) : wt c = 0 ↔ c = 0 := by
  constructor
  · intro h
    rw [wt_eq, Finsupp.sum, Finset.sum_eq_zero_iff] at h
    ext j
    by_cases hj : j ∈ c.support
    · have := h j hj
      simpa using this
    · simpa using hj
  · rintro rfl
    simp

lemma one_le_wt {c : ℕ →₀ ℕ} (hc : c ≠ 0) : 1 ≤ wt c :=
  Nat.one_le_iff_ne_zero.2 fun h => hc ((wt_eq_zero_iff c).1 h)

/-- The weight dominates every partial sum `∑_{j ∈ S} (j + 1) c_j`. -/
lemma sum_mul_le_wt (c : ℕ →₀ ℕ) (S : Finset ℕ) : ∑ j ∈ S, (j + 1) * c j ≤ wt c := by
  rw [wt_eq, Finsupp.sum_of_support_subset c (Finset.subset_union_right (s₁ := S))
    (fun j n => (j + 1) * n) (fun j _ => by simp)]
  exact Finset.sum_le_sum_of_subset (Finset.subset_union_left)

lemma apply_le_wt (c : ℕ →₀ ℕ) (j : ℕ) : c j ≤ wt c := by
  have h := sum_mul_le_wt c {j}
  rw [Finset.sum_singleton] at h
  exact le_trans (Nat.le_mul_of_pos_left _ (Nat.succ_pos j)) h

/-- The sum of the first `d` coordinates is at most the weight. -/
lemma sum_fin_le_wt (c : ℕ →₀ ℕ) (d : ℕ) : ∑ j : Fin d, c j ≤ wt c := by
  have h := sum_mul_le_wt c (Finset.range d)
  rw [← Fin.sum_univ_eq_sum_range (fun j => (j + 1) * c j)] at h
  exact le_trans (Finset.sum_le_sum fun j _ => Nat.le_mul_of_pos_left _ (Nat.succ_pos j)) h

lemma wt_mono : Monotone wt := by
  intro c c' h
  obtain ⟨d, rfl⟩ := le_iff_exists_add.1 h
  rw [map_add]
  exact Nat.le_add_right _ _

/-- The monomial at `q_j = u^{j+1}` is the power `u ^ wt c`. -/
lemma prod_ofReal_pow {u : ℝ} (hu : 0 ≤ u) (c : ℕ →₀ ℕ) :
    (c.prod fun j n => ENNReal.ofReal (u ^ (j + 1)) ^ n) = ENNReal.ofReal (u ^ wt c) := by
  induction c using Finsupp.induction_linear with
  | zero => simp
  | add f g hf hg =>
    rw [Finsupp.prod_add_index' (fun _ => pow_zero _) (fun _ _ _ => pow_add _ _ _), hf, hg,
      map_add, pow_add, ENNReal.ofReal_mul (pow_nonneg hu _)]
  | single a b =>
    rw [Finsupp.prod_single_index (by simp), wt_eq, Finsupp.sum_single_index (by simp),
      ← ENNReal.ofReal_pow (pow_nonneg hu _), ← pow_mul, mul_comm]

/-- The same, with the real power `t ^ ((j : ℝ) + 1)` that appears in the anchor. -/
lemma prod_ofReal_rpow {u : ℝ} (hu : 0 ≤ u) (c : ℕ →₀ ℕ) :
    (c.prod fun j n => ENNReal.ofReal (1 * u ^ ((j : ℝ) + 1)) ^ n) =
      ENNReal.ofReal (u ^ wt c) := by
  rw [← prod_ofReal_pow hu]
  refine Finsupp.prod_congr fun j _ => ?_
  rw [one_mul, show ((j : ℝ) + 1) = ((j + 1 : ℕ) : ℝ) by push_cast; ring, Real.rpow_natCast]

variable {μ : ℕ → PMF (ℕ →₀ ℕ)}

/-- A bound on the generating function by an exponential moment of the weight. -/
lemma genFun_le_lintegral {q : ℕ → ℝ≥0∞} {u : ℝ} (hu : 0 ≤ u)
    (hq : ∀ j, q j ≤ ENNReal.ofReal (u ^ (j + 1))) (k : ℕ) :
    genFun μ q k ≤ ∫⁻ c, ENNReal.ofReal (u ^ wt c) ∂(μ k).toMeasure := by
  refine lintegral_mono fun c => ?_
  rw [← prod_ofReal_pow hu]
  exact Finset.prod_le_prod fun j _ => pow_le_pow_left' (hq j) _

end Conjugate.Internal.Example35

end
