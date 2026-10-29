/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Internal.SingleType.GeomQuotient
import Mathlib.Topology.Order.IntermediateValue
import Mathlib.Topology.Instances.ENNReal.Lemmas

/-!
# The fixed point of a probability generating function

For a `ℕ`-valued random variable `X` on a probability space `(Ω, ν)`, with
`F = pgf ν X` (`F(q) = 𝔼[q ^ X]`), assume that `𝔼[X] < 1`, that `P[X ≥ 2] > 0`, and that `F`
is continuous on `(0,∞]` as a map into `[0,∞]`. Then `F` has a unique fixed point in `(1,∞)`
(Proposition 1.6, fixed-point form, paper.tex:343-356, in the single-type case). The proof does
not use the Taylor expansion of paper.tex:343-356:

* `exists_pgf_lt` (in `GeomQuotient`): `F(s) < s` for some `s > 1`, since the difference
  quotients `(F(1 + ε) - 1) / ε` decrease to `𝔼[X] < 1`;
* `exists_le_pgf`: `F(t) ≥ t` for large finite `t`, since `F(t) ≥ P[X ≥ 2] t²`;
* `exists_pgf_eq`: a fixed point in `[s,t]` by the intermediate value theorem;
* `pgf_eq_unique`: two fixed points `1 < q₁ < q₂ < ∞` would give two equal values of the
  strictly increasing difference quotient.
-/

public section

open MeasureTheory Filter Topology

open scoped ENNReal

namespace Conjugate.Internal.SingleType

variable {Ω : Type*} [MeasurableSpace Ω] {ν : Measure Ω} {X : Ω → ℕ}

/-- `F` is finite at some point to the right of `1`, from continuity at `1` and `F(1) = 1`. -/
lemma exists_pgf_ne_top [IsProbabilityMeasure ν] (h : ContinuousAt (pgf ν X) 1) :
    ∃ ε₀ : ℝ≥0∞, 0 < ε₀ ∧ pgf ν X (ε₀ + 1) ≠ ∞ := by
  have h1 : pgf ν X 1 < 2 := by simp [pgf_one]
  have hlt : ∀ᶠ q in 𝓝[>] (1 : ℝ≥0∞), pgf ν X q < 2 :=
    nhdsWithin_le_nhds (h.eventually (eventually_lt_nhds h1))
  have : (𝓝[>] (1 : ℝ≥0∞)).NeBot := nhdsGT_neBot_of_exists_gt ⟨2, by norm_num⟩
  obtain ⟨q, hq, hq1⟩ := (hlt.and self_mem_nhdsWithin).exists
  have hq1' : 1 < q := hq1
  refine ⟨q - 1, tsub_pos_of_lt hq1', ?_⟩
  rw [tsub_add_cancel_of_le hq1'.le]
  exact (hq.trans ENNReal.ofNat_lt_top).ne

/-- **Above the diagonal.** If `P[X ≥ 2] > 0`, then `F(t) ≥ t` for some finite `t ≥ s`. -/
lemma exists_le_pgf (hX : Measurable X) [IsProbabilityMeasure ν]
    (hpos : 0 < ν {ω | 2 ≤ X ω}) {s : ℝ≥0∞} (hs1 : 1 ≤ s) (hs : s < ∞) :
    ∃ t : ℝ≥0∞, s ≤ t ∧ t < ∞ ∧ t ≤ pgf ν X t := by
  set p : ℝ≥0∞ := ν {ω | 2 ≤ X ω} with hp
  have hp0 : p ≠ 0 := hpos.ne'
  have hp1 : p ≠ ∞ := ne_top_of_le_ne_top ENNReal.one_ne_top prob_le_one
  set t : ℝ≥0∞ := max s p⁻¹ with ht
  have ht1 : 1 ≤ t := hs1.trans (le_max_left _ _)
  have htop : t < ∞ := max_lt hs (ENNReal.inv_lt_top.2 hpos)
  refine ⟨t, le_max_left _ _, htop, ?_⟩
  have hmeas : MeasurableSet {ω | 2 ≤ X ω} := measurableSet_le measurable_const hX
  have h1 : t ^ 2 * p ≤ pgf ν X t := by
    calc t ^ 2 * p = ∫⁻ ω, {ω | 2 ≤ X ω}.indicator (fun _ => t ^ 2) ω ∂ν := by
          rw [lintegral_indicator_const hmeas]
      _ ≤ pgf ν X t := by
          refine lintegral_mono fun ω => ?_
          by_cases hω : 2 ≤ X ω
          · rw [Set.indicator_of_mem (show ω ∈ {ω | 2 ≤ X ω} from hω)]
            exact pow_le_pow_right₀ ht1 hω
          · rw [Set.indicator_of_notMem (show ω ∉ {ω | 2 ≤ X ω} from hω)]
            exact zero_le
  refine le_trans ?_ h1
  have h2 : 1 ≤ t * p := by
    calc 1 = p⁻¹ * p := (ENNReal.inv_mul_cancel hp0 hp1).symm
      _ ≤ t * p := mul_le_mul_left (le_max_right _ _) p
  calc t = t * 1 := (mul_one t).symm
    _ ≤ t * (t * p) := mul_le_mul_right h2 t
    _ = t ^ 2 * p := by ring

/-- **Existence of a fixed point** in `(1,∞)`. -/
theorem exists_pgf_eq [IsProbabilityMeasure ν] (hX : Measurable X)
    (hcont : ContinuousOn (pgf ν X) (Set.Ioi 0)) (hmean : ∫⁻ ω, (X ω : ℝ≥0∞) ∂ν < 1)
    (hpos : 0 < ν {ω | 2 ≤ X ω}) : ∃ q : ℝ≥0∞, 1 < q ∧ q < ∞ ∧ pgf ν X q = q := by
  obtain ⟨ε₀, hε₀, hfin⟩ :=
    exists_pgf_ne_top (hcont.continuousAt (Ioi_mem_nhds zero_lt_one))
  obtain ⟨s, hs1, hs, hsF⟩ := exists_pgf_lt hX hmean hε₀ hfin
  obtain ⟨t, hst, ht, htF⟩ := exists_le_pgf hX hpos hs1.le hs
  have hsub : Set.Icc s t ⊆ Set.Ioi 0 := fun x hx =>
    lt_of_lt_of_le (zero_lt_one.trans hs1) hx.1
  obtain ⟨x, hx, hxF⟩ := isPreconnected_Icc.intermediate_value₂ (a := s) (b := t)
    ⟨le_rfl, hst⟩ ⟨hst, le_rfl⟩ (hcont.mono hsub) continuousOn_id hsF.le htF
  exact ⟨x, hs1.trans_le hx.1, hx.2.trans_lt ht, hxF⟩

/-- **Uniqueness of the fixed point** in `(1,∞)`: there are no fixed points `1 < q₁ < q₂ < ∞`. -/
theorem pgf_eq_unique [IsProbabilityMeasure ν] (hX : Measurable X)
    (hpos : 0 < ν {ω | 2 ≤ X ω}) {q₁ q₂ : ℝ≥0∞} (h1 : 1 < q₁) (h12 : q₁ < q₂) (h2 : q₂ < ∞)
    (hF₁ : pgf ν X q₁ = q₁) (hF₂ : pgf ν X q₂ = q₂) : False := by
  have key : ∀ q : ℝ≥0∞, 1 < q → q < ∞ → pgf ν X q = q → diffQuot ν X (q - 1) = 1 := by
    intro q hq1 hqtop hqF
    have hq : q - 1 + 1 = q := tsub_add_cancel_of_le hq1.le
    refine diffQuot_eq_one_of_pgf_eq hX (tsub_pos_of_lt hq1).ne' ?_ ?_
    · exact (tsub_le_self.trans_lt hqtop).ne
    · rwa [hq]
  have hlt : diffQuot ν X (q₁ - 1) < diffQuot ν X (q₂ - 1) := by
    refine diffQuot_lt_of_lt hX ?_ hpos ?_
    swap
    · rw [key q₂ (h1.trans h12) h2 hF₂]
      exact ENNReal.one_ne_top
    by_contra hge
    have hle := add_le_add_left (not_lt.1 hge) 1
    rw [tsub_add_cancel_of_le h1.le, tsub_add_cancel_of_le (h1.trans h12).le] at hle
    exact absurd h12 (not_lt.2 hle)
  rw [key q₁ h1 (h12.trans h2) hF₁, key q₂ (h1.trans h12) h2 hF₂] at hlt
  exact lt_irrefl _ hlt

/-- **Fixed-point theorem, abstract form.** -/
theorem existsUnique_pgf_eq [IsProbabilityMeasure ν] (hX : Measurable X)
    (hcont : ContinuousOn (pgf ν X) (Set.Ioi 0)) (hmean : ∫⁻ ω, (X ω : ℝ≥0∞) ∂ν < 1)
    (hpos : 0 < ν {ω | 2 ≤ X ω}) :
    ∃! q : ℝ≥0∞, 1 < q ∧ q < ∞ ∧ pgf ν X q = q := by
  obtain ⟨q, hq1, hqt, hqF⟩ := exists_pgf_eq hX hcont hmean hpos
  refine ⟨q, ⟨hq1, hqt, hqF⟩, fun y ⟨hy1, hyt, hyF⟩ => ?_⟩
  rcases lt_trichotomy y q with h | h | h
  · exact (pgf_eq_unique hX hpos hy1 h hqt hyF hqF).elim
  · exact h
  · exact (pgf_eq_unique hX hpos hq1 h hyt hqF hyF).elim

end Conjugate.Internal.SingleType

end
