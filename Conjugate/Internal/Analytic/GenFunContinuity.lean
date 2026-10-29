/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.GenFun
import Conjugate.Infrastructure.Population
import Mathlib.Data.Finsupp.Encodable
import Mathlib.MeasureTheory.Integral.Lebesgue.Countable
import Mathlib.MeasureTheory.Integral.Lebesgue.DominatedConvergence
import Mathlib.MeasureTheory.Integral.Lebesgue.Markov
import Mathlib.Topology.Instances.ENNReal.Lemmas

/-!
# Continuity of the generating function on `(0,∞]^ι`

For a finite type set `ι` and a fixed type `k`, the function `q ↦ f_k(q)` is a series
`∑_c μ_k(c) ∏_j q_j^{c_j}` of monomials with coefficients in `[0,1]`. This file proves the
mathematical content of the remark paper.tex:252 (last sentence), in two cases at a point `q₀`
of `(0,∞]^ι`:

* `genFun_eventually_lt`: `f_k` is lower semicontinuous at every `q₀ ∈ (0,∞]^ι` (every
  partial sum of the series is continuous there, because no factor is `0`);
* `continuousAt_genFun_of_lt_top`: if `f_k(q₀) < ∞`, and `f_k` is finite on `(0,∞)^ι`, then
  `f_k` is continuous at `q₀`, by dominated convergence against the finite value of `f_k` at
  `q₀ + 1` (with `1` in place of the infinite coordinates of `q₀`, which are not used by the
  monomials in the support of `μ_k`);
* `continuousAt_genFun`: the combination, `f_k` is continuous at every `q₀ ∈ (0,∞]^ι` if `f`
  is finite on `(0,∞)^ι`.
-/

public section

open MeasureTheory Filter Topology

open scoped ENNReal

namespace Conjugate

variable {ι : Type*}

/-- A finite product of convergent sequences with nonzero limits converges to the product of
the limits, in `ℝ≥0∞`. (The product is not jointly continuous at `(0, ∞)`, which is excluded
by the hypothesis on the limits.) -/
lemma tendsto_finset_prod_of_ne_zero {α : Type*} {l : Filter α} {f : ι → α → ℝ≥0∞}
    {a : ι → ℝ≥0∞} (s : Finset ι) (h : ∀ i ∈ s, Tendsto (f i) l (𝓝 (a i)))
    (h0 : ∀ i ∈ s, a i ≠ 0) :
    Tendsto (fun b => ∏ i ∈ s, f i b) l (𝓝 (∏ i ∈ s, a i)) := by
  classical
  induction s using Finset.induction with
  | empty => simp [tendsto_const_nhds]
  | insert i s his ih =>
    simp only [Finset.prod_insert his]
    refine ENNReal.Tendsto.mul (h i (by simp)) (Or.inl (h0 i (by simp)))
      (ih (fun j hj => h j (by simp [hj])) (fun j hj => h0 j (by simp [hj]))) (Or.inl ?_)
    exact Finset.prod_ne_zero_iff.2 fun j hj => h0 j (by simp [hj])

/-- Every monomial `q ↦ ∏_j q_j^{c_j}` is continuous at a point with all coordinates positive
(possibly infinite). -/
lemma tendsto_monomial {q₀ : ι → ℝ≥0∞} (hq₀ : ∀ j, 0 < q₀ j) (c : ι →₀ ℕ) :
    Tendsto (fun q : ι → ℝ≥0∞ => c.prod fun j n => q j ^ n) (𝓝 q₀)
      (𝓝 (c.prod fun j n => q₀ j ^ n)) := by
  refine tendsto_finset_prod_of_ne_zero c.support (fun j _ => ?_) fun j _ => ?_
  · exact ((ENNReal.continuous_pow (c j)).tendsto (q₀ j)).comp
      ((continuous_apply j).tendsto q₀)
  · exact pow_ne_zero _ (hq₀ j).ne'

/-- A monomial is infinite at a point `q` with positive coordinates as soon as it involves an
infinite coordinate of `q`. -/
lemma monomial_eq_top {q : ι → ℝ≥0∞} (hq : ∀ j, 0 < q j) {c : ι →₀ ℕ} {j : ι}
    (hj : j ∈ c.support) (hqj : q j = ∞) : (c.prod fun j n => q j ^ n) = ∞ := by
  classical
  rw [Finsupp.prod, ← Finset.mul_prod_erase _ _ hj, hqj,
    ENNReal.top_pow (Finsupp.mem_support_iff.1 hj), ENNReal.top_mul]
  exact Finset.prod_ne_zero_iff.2 fun i _ => pow_ne_zero _ (hq i).ne'

variable [Countable ι]

/-- **Lower semicontinuity of `f_k`** on `(0,∞]^ι`: every partial sum of the series is
continuous, and `f_k` is the supremum of the partial sums. -/
theorem genFun_eventually_lt (μ : ι → PMF (ι →₀ ℕ)) (k : ι) {q₀ : ι → ℝ≥0∞}
    (hq₀ : ∀ j, 0 < q₀ j) {b : ℝ≥0∞} (hb : b < genFun μ q₀ k) :
    ∀ᶠ q in 𝓝 q₀, b < genFun μ q k := by
  simp only [genFun] at hb ⊢
  rw [lintegral_countable', tsum_eq_iSup_sum] at hb
  simp_rw [lintegral_countable']
  obtain ⟨s, hs⟩ := lt_iSup_iff.1 hb
  have ht : Tendsto
      (fun q : ι → ℝ≥0∞ => ∑ c ∈ s, (c.prod fun j n => q j ^ n) * (μ k).toMeasure {c}) (𝓝 q₀)
      (𝓝 (∑ c ∈ s, (c.prod fun j n => q₀ j ^ n) * (μ k).toMeasure {c})) :=
    tendsto_finsetSum _ fun c _ =>
      ENNReal.Tendsto.mul_const (tendsto_monomial hq₀ c) (Or.inr (measure_ne_top _ _))
  filter_upwards [ht.eventually (lt_mem_nhds hs)] with q hq
  exact lt_of_lt_of_le hq (sum_le_tsum s)

omit [Countable ι] in
/-- If `f_k(q₀) < ∞`, then `μ_k`-almost every monomial involves no infinite coordinate of `q₀`. -/
lemma ae_forall_ne_top_of_genFun_lt_top (μ : ι → PMF (ι →₀ ℕ)) (k : ι) {q₀ : ι → ℝ≥0∞}
    (hq₀ : ∀ j, 0 < q₀ j) (hlt : genFun μ q₀ k < ∞) :
    ∀ᵐ c ∂(μ k).toMeasure, ∀ j ∈ c.support, q₀ j ≠ ∞ := by
  have h := ae_lt_top (μ := (μ k).toMeasure)
    (f := fun c : ι →₀ ℕ => c.prod fun j n => q₀ j ^ n) Measurable.of_discrete hlt.ne
  filter_upwards [h] with c hc j hj hqj
  exact (monomial_eq_top hq₀ hj hqj ▸ hc).ne rfl

section Finite

variable [Finite ι]

/-- **Continuity at a point where `f_k` is finite**, given that `f_k` is finite on `(0,∞)^ι`
(paper.tex:252, last sentence, finite case). Dominated convergence, with dominating function
the monomial at `r`, where `r_j = q₀_j + 1` for finite `q₀_j` and `r_j = 1` otherwise. -/
theorem continuousAt_genFun_of_lt_top (μ : ι → PMF (ι →₀ ℕ)) (k : ι)
    (hfin : ∀ q : ι → ℝ≥0∞, (∀ j, 0 < q j ∧ q j < ∞) → genFun μ q k < ∞)
    {q₀ : ι → ℝ≥0∞} (hq₀ : ∀ j, 0 < q₀ j) (hlt : genFun μ q₀ k < ∞) :
    ContinuousAt (fun q => genFun μ q k) q₀ := by
  classical
  set r : ι → ℝ≥0∞ := fun j => if q₀ j = ∞ then 1 else q₀ j + 1 with hr_def
  have hr_top : ∀ j, q₀ j = ∞ → r j = 1 := fun j h => by simp [hr_def, h]
  have hr_fin : ∀ j, q₀ j ≠ ∞ → r j = q₀ j + 1 := fun j h => by simp [hr_def, h]
  have hr : ∀ j, 0 < r j ∧ r j < ∞ := by
    intro j
    by_cases h : q₀ j = ∞
    · simp [hr_top j h]
    · rw [hr_fin j h]
      exact ⟨pos_of_ne_zero (by simp), ENNReal.add_lt_top.2 ⟨lt_top_iff_ne_top.2 h,
        ENNReal.one_lt_top⟩⟩
  have hnb : ∀ᶠ q in 𝓝 q₀, ∀ j, q₀ j ≠ ∞ → q j < q₀ j + 1 := by
    refine eventually_all.2 fun j => ?_
    by_cases h : q₀ j = ∞
    · exact Eventually.of_forall fun q hj => (hj h).elim
    · have hlt' : q₀ j < q₀ j + 1 := ENNReal.lt_add_right h one_ne_zero
      exact (((continuous_apply j).tendsto q₀).eventually (eventually_lt_nhds hlt')).mono
        fun q hq _ => hq
  have hae := ae_forall_ne_top_of_genFun_lt_top μ k hq₀ hlt
  exact tendsto_lintegral_filter_of_dominated_convergence (μ := (μ k).toMeasure)
    (F := fun (q : ι → ℝ≥0∞) (c : ι →₀ ℕ) => c.prod fun j n => q j ^ n)
    (fun c => c.prod fun j n => r j ^ n)
    (Eventually.of_forall fun q => Measurable.of_discrete)
    (by
      filter_upwards [hnb] with q hq
      filter_upwards [hae] with c hc
      refine Finset.prod_le_prod fun j hj => ?_
      have hj' := hc j hj
      change q j ^ c j ≤ r j ^ c j
      rw [hr_fin j hj']
      exact pow_le_pow_left' (hq j hj').le _)
    (hfin r hr).ne
    (ae_of_all _ fun c => tendsto_monomial hq₀ c)

/-- **`f_k` is continuous on `(0,∞]^ι` if it is finite on `(0,∞)^ι`** (paper.tex:252, last
sentence): at a point where `f_k` is finite this is `continuousAt_genFun_of_lt_top`, and at a
point where `f_k = ∞` it follows from lower semicontinuity. -/
theorem continuousAt_genFun (μ : ι → PMF (ι →₀ ℕ)) (k : ι)
    (hfin : ∀ q : ι → ℝ≥0∞, (∀ j, 0 < q j ∧ q j < ∞) → genFun μ q k < ∞)
    {q₀ : ι → ℝ≥0∞} (hq₀ : ∀ j, 0 < q₀ j) :
    ContinuousAt (fun q => genFun μ q k) q₀ := by
  by_cases h : genFun μ q₀ k = ∞
  · rw [ContinuousAt, h]
    exact tendsto_order.2 ⟨fun b hb => genFun_eventually_lt μ k hq₀ (h ▸ hb),
      fun b hb => (not_top_lt hb).elim⟩
  · exact continuousAt_genFun_of_lt_top μ k hfin hq₀ (lt_top_iff_ne_top.2 h)

end Finite

end Conjugate

end
