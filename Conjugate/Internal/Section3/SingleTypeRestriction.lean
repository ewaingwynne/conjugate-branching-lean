/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.MeanMatrix
public import Conjugate.Frozen.Defs.Truncate
public import Conjugate.Frozen.Defs.IsSubcritical
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Internal.Section3.Truncation
public import Conjugate.Internal.SingleType.GeomQuotient
import Conjugate.Internal.Foundations.MeanDecay

/-!
# The single-type restriction `X̃^k` (Lemma 3.4, paper.tex:1101-1145)

Lean indexes types from `0`: paper type `k` is Lean type `k - 1`.

* `restrictType μ k` is the single-type process `X̃^k` of paper.tex:1120, in which only the
  individuals all of whose ancestors have type `k` are kept: the offspring law of an individual is
  the law of the number `c k` of type-`k` children.
* `genFun_restrictType`: its generating function is `x ↦ f_k(1, …, x, …, 1)`;
* `meanMatrix_restrictType`, `meanMatrix_truncate`: its mean is `M^{(d)}_{kk}` for `d > k`;
* `lintegral_lt_one_of_isSubcritical_truncate`: this mean is `< 1` as soon as the truncation
  `truncate μ (k+1)` is subcritical, since `(M_{kk})^n ≤ (M^n)_{kk} → 0`;
* `pos_of_isNonsingular_truncate_one`: non-singularity of `truncate μ 1` gives
  `ℙ_0[c_0 ≥ 2] > 0`;
* `lt_genFun_of_fixed_lt`, `genFun_lt_of_lt_fixed`: strict convexity of
  `f̃_k(y) = f_k(1, …, y, …, 1)`, seen from a fixed point `q ∈ (1,∞)`: `f̃_k(y) > y` for `y > q`
  and `f̃_k(y) < y` for `1 < y < q` (via `SingleType.diffQuot_lt_of_lt`).
-/

@[expose] public section

open MeasureTheory Filter Topology

open scoped ENNReal

namespace Conjugate

/-- The single-type restriction `X̃^k` (paper.tex:1120): only individuals all of whose
ancestors have type `k` are kept. -/
noncomputable def restrictType (μ : ℕ → PMF (ℕ →₀ ℕ)) (k : ℕ) : Fin 1 → PMF (Fin 1 →₀ ℕ) :=
  fun _ => (μ k).map fun c => Finsupp.single 0 (c k)

/-- The monomial `∏_j q_j^{c_j}` at the vector `(1, …, x, …, 1)` (with `x` at `k`) is `x^{c_k}`. -/
lemma prod_update_one (c : ℕ →₀ ℕ) (k : ℕ) (x : ℝ≥0∞) :
    c.prod (fun j n => (Function.update (1 : ℕ → ℝ≥0∞) k x j) ^ n) = x ^ c k := by
  unfold Finsupp.prod
  rw [Finset.prod_eq_single k]
  · simp
  · intro j _ hj
    simp [Function.update_of_ne hj]
  · intro hk
    simp [Finsupp.notMem_support_iff.1 hk]

theorem genFun_restrictType (μ : ℕ → PMF (ℕ →₀ ℕ)) (k : ℕ) (x : ℝ≥0∞) :
    genFun (restrictType μ k) (fun _ => x) 0 = genFun μ (Function.update 1 k x) k := by
  unfold genFun restrictType
  rw [← PMF.toMeasure_map _ _ (Measurable.of_discrete), lintegral_map (Measurable.of_discrete)
    (Measurable.of_discrete)]
  simp_rw [prod_update_one]
  refine lintegral_congr fun c => ?_
  rw [Finsupp.prod_single_index (by simp)]

/-- The mean matrix of a truncation: `M^{(d)}_{kj} = 𝔼_k[c_j]`. -/
lemma meanMatrix_truncate (μ : ℕ → PMF (ℕ →₀ ℕ)) (d : ℕ) (k j : Fin d) :
    meanMatrix (truncate μ d) k j = ∫⁻ c, (c j : ℝ≥0∞) ∂(μ k).toMeasure := by
  unfold meanMatrix truncate
  rw [Matrix.of_apply, ← PMF.toMeasure_map _ _ (Measurable.of_discrete),
    lintegral_map (Measurable.of_discrete) (Measurable.of_discrete)]
  simp [Finsupp.comapDomain_apply]

/-- The mean offspring number of `X̃^k` is `𝔼_k[c_k]`. -/
lemma meanMatrix_restrictType (μ : ℕ → PMF (ℕ →₀ ℕ)) (k : ℕ) :
    meanMatrix (restrictType μ k) 0 0 = ∫⁻ c, (c k : ℝ≥0∞) ∂(μ k).toMeasure := by
  unfold meanMatrix restrictType
  rw [Matrix.of_apply, ← PMF.toMeasure_map _ _ (Measurable.of_discrete),
    lintegral_map (Measurable.of_discrete) (Measurable.of_discrete)]
  simp

/-- `(M_{kk})^n ≤ (M^n)_{kk}` for a matrix with nonnegative entries. -/
lemma pow_diag_le_pow_apply {ι : Type*} [Fintype ι] [DecidableEq ι] (M : Matrix ι ι ℝ≥0∞)
    (κ : ι) (n : ℕ) : M κ κ ^ n ≤ (M ^ n) κ κ := by
  induction n with
  | zero => simp
  | succ n ih =>
    rw [pow_succ', pow_succ', Matrix.mul_apply]
    exact le_trans (mul_le_mul_right ih _)
      (Finset.single_le_sum (f := fun j => M κ j * (M ^ n) j κ) (fun _ _ => zero_le)
        (Finset.mem_univ κ))

/-- Subcriticality of `truncate μ (k+1)` gives `𝔼_k[c_k] < 1`: `(M_{kk})^n ≤ (M^n)_{kk} → 0`. -/
lemma lintegral_lt_one_of_isSubcritical_truncate (μ : ℕ → PMF (ℕ →₀ ℕ)) (k : ℕ)
    (h : IsSubcritical (truncate μ (k + 1))) :
    ∫⁻ c, (c k : ℝ≥0∞) ∂(μ k).toMeasure < 1 := by
  set κ : Fin (k + 1) := ⟨k, Nat.lt_succ_self k⟩ with hκ
  have hm : meanMatrix (truncate μ (k + 1)) κ κ = ∫⁻ c, (c k : ℝ≥0∞) ∂(μ k).toMeasure :=
    meanMatrix_truncate μ (k + 1) κ κ
  rw [← hm]
  have hlim : Tendsto (fun n => meanMatrix (truncate μ (k + 1)) κ κ ^ n) atTop (𝓝 0) :=
    tendsto_of_tendsto_of_tendsto_of_le_of_le tendsto_const_nhds
      (tendsto_meanMatrix_pow (truncate μ (k + 1)) h κ κ) (fun n => zero_le)
      (fun n => pow_diag_le_pow_apply _ κ n)
  by_contra hge
  have h1 : 1 ≤ meanMatrix (truncate μ (k + 1)) κ κ := not_lt.1 hge
  have h2 : (1 : ℝ≥0∞) ≤ 0 :=
    ge_of_tendsto hlim (Eventually.of_forall fun n => one_le_pow_of_one_le' h1 n)
  exact absurd h2 (by simp)

/-- Non-singularity of `truncate μ 1` gives `ℙ_0[c_0 ≥ 2] > 0`. -/
lemma pos_of_isNonsingular_truncate_one (μ : ℕ → PMF (ℕ →₀ ℕ))
    (h : IsNonsingular (truncate μ 1)) : 0 < (μ 0).toMeasure {c | 2 ≤ c 0} := by
  obtain ⟨κ, hκ⟩ := h
  have hκ0 : κ = 0 := Subsingleton.elim _ _
  subst hκ0
  unfold truncate at hκ
  rw [← PMF.toMeasure_map _ _ (Measurable.of_discrete),
    Measure.map_apply (Measurable.of_discrete) (MeasurableSet.of_discrete)] at hκ
  have hset : ((fun c : ℕ →₀ ℕ => Finsupp.comapDomain Fin.val c Fin.val_injective.injOn) ⁻¹'
      {c : Fin 1 →₀ ℕ | 2 ≤ c.sum fun _ n => n}) = {c | 2 ≤ c 0} := by
    ext c
    change (2 ≤ (Finsupp.comapDomain Fin.val c Fin.val_injective.injOn).sum fun _ n => n) ↔ 2 ≤ c 0
    rw [Finsupp.sum_fintype _ _ (fun _ => rfl), Fin.sum_univ_one, Finsupp.comapDomain_apply]
    rfl
  rw [hset] at hκ
  exact hκ

/-- Extending the vector `(1, …, y, …, 1) ∈ [0,∞]^d` by `1` is the vector `(1, …, y, …, 1)`
indexed by `ℕ`. -/
lemma extend_update_one (d k : ℕ) (hd : k < d) (y : ℝ≥0∞) :
    (fun j => if h : j < d then (Function.update (1 : Fin d → ℝ≥0∞) ⟨k, hd⟩ y) ⟨j, h⟩ else 1) =
      Function.update (1 : ℕ → ℝ≥0∞) k y := by
  funext j
  by_cases hjk : j = k
  · subst hjk
    simp [hd]
  · by_cases hj : j < d
    · have : (⟨j, hj⟩ : Fin d) ≠ ⟨k, hd⟩ := fun h => hjk (Fin.mk.inj h)
      simp [hj, Function.update_of_ne hjk, Function.update_of_ne this]
    · simp [hj, Function.update_of_ne hjk]

open Conjugate.Internal.SingleType in
/-- `f̃_k(y) = f_k(1, …, y, …, 1)` is the probability generating function of the number of
type-`k` children. -/
lemma genFun_update_eq_pgf (μ : ℕ → PMF (ℕ →₀ ℕ)) (k : ℕ) (y : ℝ≥0∞) :
    genFun μ (Function.update 1 k y) k = pgf (μ k).toMeasure (fun c : ℕ →₀ ℕ => c k) y := by
  unfold genFun pgf
  simp_rw [prod_update_one]

open Conjugate.Internal.SingleType in
/-- **Strict convexity, beyond the fixed point**: if `q ∈ (1,∞)` is a fixed point of
`f̃_k(y) = f_k(1, …, y, …, 1)` and `q < y < ∞`, then `f̃_k(y) > y`. -/
lemma lt_genFun_of_fixed_lt (μ : ℕ → PMF (ℕ →₀ ℕ)) {k : ℕ} {q y : ℝ≥0∞} (hq1 : 1 < q)
    (hqt : q < ∞) (hqfix : genFun μ (Function.update 1 k q) k = q)
    (hk : 0 < (μ k).toMeasure {c | 2 ≤ c k}) (hqy : q < y) (hyt : y < ∞) :
    y < genFun μ (Function.update 1 k y) k := by
  have hX : Measurable (fun c : ℕ →₀ ℕ => c k) := Measurable.of_discrete
  rw [genFun_update_eq_pgf] at hqfix ⊢
  have hy1 : 1 < y := hq1.trans hqy
  have hεq : q - 1 + 1 = q := tsub_add_cancel_of_le hq1.le
  have hεy : y - 1 + 1 = y := tsub_add_cancel_of_le hy1.le
  have hεq0 : q - 1 ≠ 0 := (tsub_pos_of_lt hq1).ne'
  have hεqt : q - 1 ≠ ⊤ := (tsub_le_self.trans_lt hqt).ne
  have hεy0 : y - 1 ≠ 0 := (tsub_pos_of_lt hy1).ne'
  have hεyt : y - 1 ≠ ⊤ := (tsub_le_self.trans_lt hyt).ne
  have hlt : q - 1 < y - 1 := by
    by_contra hge
    have := add_le_add (not_lt.1 hge) (le_refl (1 : ℝ≥0∞))
    rw [hεy, hεq] at this
    exact absurd hqy (not_lt.2 this)
  have hHq : diffQuot (μ k).toMeasure (fun c : ℕ →₀ ℕ => c k) (q - 1) = 1 :=
    diffQuot_eq_one_of_pgf_eq hX hεq0 hεqt (by rw [hεq]; exact hqfix)
  calc y = y - 1 + 1 := hεy.symm
    _ < diffQuot (μ k).toMeasure (fun c : ℕ →₀ ℕ => c k) (y - 1) * (y - 1) + 1 := by
        by_cases hH : diffQuot (μ k).toMeasure (fun c : ℕ →₀ ℕ => c k) (y - 1) = ⊤
        · rw [hH, ENNReal.top_mul hεy0, top_add]
          exact ENNReal.add_lt_top.2 ⟨hεyt.lt_top, ENNReal.one_lt_top⟩
        · have h1 := diffQuot_lt_of_lt hX hlt hk hH
          rw [hHq] at h1
          refine ENNReal.add_lt_add_right ENNReal.one_ne_top ?_
          calc y - 1 = 1 * (y - 1) := (one_mul _).symm
            _ < _ := (ENNReal.mul_lt_mul_iff_left hεy0 hεyt).2 h1
    _ = pgf (μ k).toMeasure (fun c : ℕ →₀ ℕ => c k) (y - 1 + 1) := (pgf_add_one hX _).symm
    _ = _ := by rw [hεy]

open Conjugate.Internal.SingleType in
/-- **Strict convexity, below the fixed point**: if `q ∈ (1,∞)` is a fixed point of
`f̃_k(y) = f_k(1, …, y, …, 1)` and `1 < y < q`, then `f̃_k(y) < y`. -/
lemma genFun_lt_of_lt_fixed (μ : ℕ → PMF (ℕ →₀ ℕ)) {k : ℕ} {q y : ℝ≥0∞} (hq1 : 1 < q)
    (hqt : q < ∞) (hqfix : genFun μ (Function.update 1 k q) k = q)
    (hk : 0 < (μ k).toMeasure {c | 2 ≤ c k}) (hy1 : 1 < y) (hyq : y < q) :
    genFun μ (Function.update 1 k y) k < y := by
  have hX : Measurable (fun c : ℕ →₀ ℕ => c k) := Measurable.of_discrete
  rw [genFun_update_eq_pgf] at hqfix ⊢
  have hεq : q - 1 + 1 = q := tsub_add_cancel_of_le hq1.le
  have hεy : y - 1 + 1 = y := tsub_add_cancel_of_le hy1.le
  have hεq0 : q - 1 ≠ 0 := (tsub_pos_of_lt hq1).ne'
  have hεqt : q - 1 ≠ ⊤ := (tsub_le_self.trans_lt hqt).ne
  have hεy0 : y - 1 ≠ 0 := (tsub_pos_of_lt hy1).ne'
  have hεyt : y - 1 ≠ ⊤ := (tsub_le_self.trans_lt (hyq.trans hqt)).ne
  have hlt : y - 1 < q - 1 := by
    by_contra hge
    have := add_le_add (not_lt.1 hge) (le_refl (1 : ℝ≥0∞))
    rw [hεy, hεq] at this
    exact absurd hyq (not_lt.2 this)
  have hHq : diffQuot (μ k).toMeasure (fun c : ℕ →₀ ℕ => c k) (q - 1) = 1 :=
    diffQuot_eq_one_of_pgf_eq hX hεq0 hεqt (by rw [hεq]; exact hqfix)
  have h1 := diffQuot_lt_of_lt hX hlt hk (by rw [hHq]; exact ENNReal.one_ne_top)
  rw [hHq] at h1
  calc pgf (μ k).toMeasure (fun c : ℕ →₀ ℕ => c k) y
      = pgf (μ k).toMeasure (fun c : ℕ →₀ ℕ => c k) (y - 1 + 1) := by rw [hεy]
    _ = diffQuot (μ k).toMeasure (fun c : ℕ →₀ ℕ => c k) (y - 1) * (y - 1) + 1 :=
        pgf_add_one hX _
    _ < y - 1 + 1 := by
        refine ENNReal.add_lt_add_right ENNReal.one_ne_top ?_
        calc _ < 1 * (y - 1) := (ENNReal.mul_lt_mul_iff_left hεy0 hεyt).2 h1
          _ = y - 1 := one_mul _
    _ = y := hεy

end Conjugate

end
