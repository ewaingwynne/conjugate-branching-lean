/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Mathlib.MeasureTheory.Integral.Lebesgue.Basic
public import Mathlib.MeasureTheory.Measure.Typeclasses.Probability
import Mathlib.Algebra.Ring.GeomSum
import Mathlib.MeasureTheory.Integral.Lebesgue.DominatedConvergence
import Mathlib.MeasureTheory.Integral.Lebesgue.Markov
import Mathlib.Topology.Instances.ENNReal.Lemmas

/-!
# Difference quotients of a probability generating function

Let `X : Ω → ℕ` be a measurable `ℕ`-valued random variable on a probability space `(Ω, ν)`, and
write `F(q) = 𝔼[q ^ X]` (`pgf`), for `q ∈ [0,∞]`. The route used in place of the Taylor step
of paper.tex:343-356 (see `PLAN.md` §6, Lemma 2.5) is the following.

Since `(ε + 1) ^ n = 1 + ε · ∑_{k<n} (ε + 1) ^ k`, one has
`F(ε + 1) = 1 + ε · H(ε)` where `H(ε) = 𝔼[∑_{k<X} (ε + 1) ^ k]` (`diffQuot`) is the difference
quotient `(F(ε + 1) - F(1)) / ε`. Everything below is stated in `ℝ≥0∞`, without subtraction:

* `pgf_add_one`: `F(ε + 1) = H(ε) * ε + 1`;
* `diffQuot_zero`: `H(0) = 𝔼[X]`;
* `diffQuot_mono`, `diffQuot_lt_of_lt`: `H` is monotone, and strictly so when `P[X ≥ 2] > 0`
  and `H` is finite (this is the strict convexity of `F`);
* `tendsto_diffQuot_nhdsGT`: `H(ε) → H(0)` as `ε ↓ 0`, if `H` is finite somewhere to the right
  of `0` (monotone/dominated convergence);
* `exists_pgf_lt`: if `𝔼[X] < 1` and `F` is finite somewhere to the right of `1`, then
  `F(s) < s` for some `s > 1` (below the diagonal).
-/

@[expose] public section

open MeasureTheory Filter Topology

open scoped ENNReal

namespace Conjugate.Internal.SingleType

section Defs

variable {Ω : Type*} [MeasurableSpace Ω]

/-- The probability generating function `q ↦ 𝔼[q ^ X]` of a `ℕ`-valued random variable
(values in `[0,∞]`, with `∞ ^ 0 = 1`). -/
noncomputable def pgf (ν : Measure Ω) (X : Ω → ℕ) (q : ℝ≥0∞) : ℝ≥0∞ := ∫⁻ ω, q ^ X ω ∂ν

/-- The partial geometric sum `∑_{k<n} (ε + 1) ^ k`, so that `(ε + 1) ^ n = 1 + ε * geomSum ε n`. -/
noncomputable def geomSum (ε : ℝ≥0∞) (n : ℕ) : ℝ≥0∞ := ∑ k ∈ Finset.range n, (ε + 1) ^ k

/-- The difference quotient `H(ε) = 𝔼[∑_{k<X} (ε + 1) ^ k] = (F(ε + 1) - 1) / ε`. -/
noncomputable def diffQuot (ν : Measure Ω) (X : Ω → ℕ) (ε : ℝ≥0∞) : ℝ≥0∞ :=
  ∫⁻ ω, geomSum ε (X ω) ∂ν

end Defs

section GeomSum

lemma geomSum_mul_add_one (ε : ℝ≥0∞) (n : ℕ) : geomSum ε n * ε + 1 = (ε + 1) ^ n :=
  geom_sum_mul_add ε n

@[simp] lemma geomSum_zero_left (n : ℕ) : geomSum 0 n = n := by simp [geomSum]

lemma geomSum_mono {ε ε' : ℝ≥0∞} (h : ε ≤ ε') (n : ℕ) : geomSum ε n ≤ geomSum ε' n := by
  unfold geomSum
  gcongr

lemma geomSum_lt_of_lt {ε ε' : ℝ≥0∞} (h : ε < ε') {n : ℕ} (hn : 2 ≤ n) :
    geomSum ε n < geomSum ε' n := by
  have h1 : 1 ∈ Finset.range n := Finset.mem_range.2 (by omega)
  unfold geomSum
  rw [← Finset.add_sum_erase _ _ h1, ← Finset.add_sum_erase _ _ h1]
  refine ENNReal.add_lt_add_of_lt_of_le ?_ ?_ ?_
  · exact ENNReal.sum_ne_top.2 fun k _ =>
      ENNReal.pow_ne_top (ENNReal.add_ne_top.2 ⟨h.ne_top, ENNReal.one_ne_top⟩)
  · simpa using ENNReal.add_lt_add_right ENNReal.one_ne_top h
  · gcongr

lemma continuous_geomSum (n : ℕ) : Continuous fun ε : ℝ≥0∞ => geomSum ε n := by
  unfold geomSum
  fun_prop

end GeomSum

section Quotient

variable {Ω : Type*} [MeasurableSpace Ω] {ν : Measure Ω} {X : Ω → ℕ}

lemma measurable_geomSum_comp (hX : Measurable X) (ε : ℝ≥0∞) :
    Measurable fun ω => geomSum ε (X ω) :=
  (Measurable.of_discrete (f := geomSum ε)).comp hX

lemma pgf_one [IsProbabilityMeasure ν] : pgf ν X 1 = 1 := by simp [pgf]

/-- `F(ε + 1) = H(ε) * ε + 1`. -/
lemma pgf_add_one [IsProbabilityMeasure ν] (hX : Measurable X) (ε : ℝ≥0∞) :
    pgf ν X (ε + 1) = diffQuot ν X ε * ε + 1 := by
  unfold pgf diffQuot
  simp_rw [← geomSum_mul_add_one]
  rw [lintegral_add_right _ measurable_const, lintegral_mul_const _ (measurable_geomSum_comp hX ε),
    lintegral_const, measure_univ, mul_one]

lemma diffQuot_zero : diffQuot ν X 0 = ∫⁻ ω, (X ω : ℝ≥0∞) ∂ν := by simp [diffQuot]

lemma diffQuot_mono {ε ε' : ℝ≥0∞} (h : ε ≤ ε') : diffQuot ν X ε ≤ diffQuot ν X ε' :=
  lintegral_mono fun _ => geomSum_mono h _

/-- Strict monotonicity of the difference quotient (strict convexity of `F`), when
`P[X ≥ 2] > 0` and `H` is finite at the larger point. -/
lemma diffQuot_lt_of_lt (hX : Measurable X) {ε ε' : ℝ≥0∞} (h : ε < ε')
    (hpos : 0 < ν {ω | 2 ≤ X ω}) (hfin : diffQuot ν X ε' ≠ ∞) :
    diffQuot ν X ε < diffQuot ν X ε' := by
  have hfin' : diffQuot ν X ε ≠ ∞ := ne_top_of_le_ne_top hfin (diffQuot_mono h.le)
  refine lintegral_strict_mono_of_ae_le_of_ae_lt_on (measurable_geomSum_comp hX ε').aemeasurable
    hfin' (Eventually.of_forall fun ω => geomSum_mono h.le _) hpos.ne' ?_
  exact Eventually.of_forall fun ω hω => geomSum_lt_of_lt h hω

/-- `H(ε) → H(0) = 𝔼[X]` as `ε ↓ 0`, provided `H(ε₀) < ∞` for some `ε₀ > 0`
(dominated convergence, with the dominating function `∑_{k<X} (ε₀ + 1) ^ k`). -/
lemma tendsto_diffQuot_nhdsGT (hX : Measurable X) {ε₀ : ℝ≥0∞} (hε₀ : 0 < ε₀)
    (hfin : diffQuot ν X ε₀ ≠ ∞) :
    Tendsto (diffQuot ν X) (𝓝[>] 0) (𝓝 (diffQuot ν X 0)) := by
  refine tendsto_lintegral_filter_of_dominated_convergence (μ := ν)
    (F := fun ε ω => geomSum ε (X ω)) (fun ω => geomSum ε₀ (X ω))
    (Eventually.of_forall fun ε => measurable_geomSum_comp hX ε) ?_ hfin
    (ae_of_all _ fun ω => ((continuous_geomSum (X ω)).tendsto 0).mono_left nhdsWithin_le_nhds)
  filter_upwards [Ioo_mem_nhdsGT hε₀] with ε hε
  exact ae_of_all _ fun ω => geomSum_mono hε.2.le _

/-- `F(ε + 1) < ∞` implies `H(ε) < ∞`, for `ε > 0`. -/
lemma diffQuot_ne_top_of_pgf_ne_top [IsProbabilityMeasure ν] (hX : Measurable X) {ε : ℝ≥0∞}
    (hε : ε ≠ 0) (h : pgf ν X (ε + 1) ≠ ∞) : diffQuot ν X ε ≠ ∞ := by
  rintro htop
  rw [pgf_add_one hX, htop, ENNReal.top_mul hε, top_add] at h
  exact h rfl

/-- **Below the diagonal.** If `𝔼[X] < 1` and `F` is finite at some `ε₀ + 1 > 1`, then
`F(s) < s` for some `1 < s < ∞`. -/
lemma exists_pgf_lt [IsProbabilityMeasure ν] (hX : Measurable X)
    (hmean : ∫⁻ ω, (X ω : ℝ≥0∞) ∂ν < 1) {ε₀ : ℝ≥0∞} (hε₀ : 0 < ε₀)
    (hfin : pgf ν X (ε₀ + 1) ≠ ∞) : ∃ s : ℝ≥0∞, 1 < s ∧ s < ∞ ∧ pgf ν X s < s := by
  have : (𝓝[>] (0 : ℝ≥0∞)).NeBot := nhdsGT_neBot_of_exists_gt ⟨ε₀, hε₀⟩
  have hlim := tendsto_diffQuot_nhdsGT hX hε₀ (diffQuot_ne_top_of_pgf_ne_top hX hε₀.ne' hfin)
  rw [diffQuot_zero] at hlim
  obtain ⟨ε, hε1, hε2⟩ := (((tendsto_order.1 hlim).2 1 hmean).and (Ioo_mem_nhdsGT hε₀)).exists
  have hε0 : 0 < ε := hε2.1
  have hεtop : ε ≠ ∞ := (hε2.2.trans_le le_top).ne
  refine ⟨ε + 1, by rw [add_comm]; exact ENNReal.lt_add_right ENNReal.one_ne_top hε0.ne', ?_, ?_⟩
  · exact ENNReal.add_lt_top.2 ⟨hεtop.lt_top, ENNReal.one_lt_top⟩
  · rw [pgf_add_one hX]
    refine ENNReal.add_lt_add_right ENNReal.one_ne_top ?_
    calc diffQuot ν X ε * ε < 1 * ε := (ENNReal.mul_lt_mul_iff_left hε0.ne' hεtop).2 hε1
      _ = ε := one_mul ε

/-- At a fixed point `F(ε + 1) = ε + 1` with `0 < ε < ∞`, the difference quotient is `1`. -/
lemma diffQuot_eq_one_of_pgf_eq [IsProbabilityMeasure ν] (hX : Measurable X) {ε : ℝ≥0∞}
    (h0 : ε ≠ 0) (htop : ε ≠ ∞) (h : pgf ν X (ε + 1) = ε + 1) : diffQuot ν X ε = 1 := by
  rw [pgf_add_one hX] at h
  have h' : diffQuot ν X ε * ε = 1 * ε := by
    rw [one_mul]
    exact (ENNReal.add_left_inj ENNReal.one_ne_top).1 h
  exact (ENNReal.mul_left_inj h0 htop).1 h'

end Quotient

end Conjugate.Internal.SingleType

end
