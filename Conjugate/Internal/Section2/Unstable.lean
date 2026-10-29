/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.ExtinctionEvent
public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.LogGenFun
public import Conjugate.Frozen.Defs.PathLaw
import Conjugate.Infrastructure.Population
import Conjugate.Internal.Analytic.GenFun
import Conjugate.Internal.Analytic.LogGenFun
import Conjugate.Internal.Foundations.Extinction
import Conjugate.Internal.Section2.Positivity
import Conjugate.Internal.Section2.Strict
import Mathlib.Analysis.SpecialFunctions.Log.ENNRealLogExp
import Mathlib.MeasureTheory.Integral.MeanInequalities
import Mathlib.Topology.Instances.EReal.Lemmas

/-!
# Instability of the intermediate regime (Lemma 2.11, Proposition 2.10, Lemma 2.13)

Throughout, `g = logGenFun μ`.

* `tendsto_logGenFun_iterate_smul`: **Lemma 2.11** (paper.tex:619-639), along an arbitrary
  sequence of times `φ i → ∞`. The paper uses Vitali's theorem; here, with
  `Z_n = ∏_j e^{r x_j X_j(n)} ≥ 1`, one has `Z_n ≤ 1 + Z_n 1_{X(n) ≠ 0}` and Hölder's inequality
  with exponents `1/r` and `1/(1-r)` gives
  `𝔼 Z_n ≤ 1 + (𝔼 Z_n^{1/r})^r ℙ[X(n) ≠ 0]^{1-r}` (`lintegral_prod_le_add`);
* `tendsto_zero_of_lt`, `limsup_eq_top_of_lt`: **Proposition 2.10** (`m = 1`) and
  **Lemma 2.13** (general `m`), directly along the times `r * m`, without the skeleton process.
-/

public section

open MeasureTheory ProbabilityTheory Filter Topology

open scoped ENNReal

namespace Conjugate

section Holder

variable {ι : Type*} [Countable ι]

/-- **The Hölder estimate behind Lemma 2.11.** For `p > 1`,
`𝔼[∏_j q_j^{X_j(n)}] ≤ 1 + (𝔼[∏_j (q_j^p)^{X_j(n)}])^{1/p} ℙ[X(n) ≠ 0]^{1-1/p}`. -/
lemma lintegral_prod_le_add (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) (n : ℕ)
    {q : ι → ℝ≥0∞} {p : ℝ} (hp : 1 < p) :
    ∫⁻ ω, (ω n).prod (fun j m => q j ^ m) ∂pathLaw μ x ≤
      1 + (∫⁻ ω, (ω n).prod (fun j m => (q j ^ p) ^ m) ∂pathLaw μ x) ^ p⁻¹ *
        pathLaw μ x {ω | ω n ≠ 0} ^ (1 - p⁻¹) := by
  set P := pathLaw μ x with hP
  set A : Set (ℕ → ι →₀ ℕ) := {ω | ω n ≠ 0} with hAdef
  have hA : MeasurableSet A :=
    (MeasurableSet.of_discrete (s := {c : ι →₀ ℕ | c ≠ 0})).preimage (measurable_pi_apply n)
  set Z : (ℕ → ι →₀ ℕ) → ℝ≥0∞ := fun ω => (ω n).prod (fun j m => q j ^ m) with hZ
  have hZm : Measurable Z :=
    (Measurable.of_discrete (f := fun c : ι →₀ ℕ => c.prod (fun j m => q j ^ m))).comp
      (measurable_pi_apply n)
  set I : (ℕ → ι →₀ ℕ) → ℝ≥0∞ := A.indicator 1 with hI
  have hIm : Measurable I := measurable_const.indicator hA
  have hpt : ∀ ω, Z ω ≤ 1 + (Z * I) ω := by
    intro ω
    by_cases hω : ω ∈ A
    · simp [hI, hω]
    · have h0 : ω n = 0 := by simpa [hAdef] using hω
      simp [hZ, hI, hω, h0]
  have hpq : p.HolderConjugate p.conjExponent := Real.HolderConjugate.conjExponent hp
  have hH := ENNReal.lintegral_mul_le_Lp_mul_Lq P hpq hZm.aemeasurable hIm.aemeasurable
  have hg : ∫⁻ ω, (I ω) ^ p.conjExponent ∂P = P A := by
    rw [← lintegral_indicator_one hA]
    refine lintegral_congr fun ω => ?_
    by_cases hω : ω ∈ A
    · simp [hI, hω]
    · simp [hI, hω, ENNReal.zero_rpow_of_pos hpq.symm.pos]
  have hf : ∫⁻ ω, Z ω ^ p ∂P = ∫⁻ ω, (ω n).prod (fun j m => (q j ^ p) ^ m) ∂P := by
    refine lintegral_congr fun ω => ?_
    simp only [hZ, Finsupp.prod]
    rw [← ENNReal.prod_rpow_of_nonneg (by linarith)]
    refine Finset.prod_congr rfl fun j _ => ?_
    rw [← ENNReal.rpow_natCast, ← ENNReal.rpow_mul, mul_comm, ENNReal.rpow_mul,
      ENNReal.rpow_natCast]
  calc ∫⁻ ω, Z ω ∂P ≤ ∫⁻ ω, (1 + (Z * I) ω) ∂P := lintegral_mono hpt
    _ = 1 + ∫⁻ ω, (Z * I) ω ∂P := by
        rw [lintegral_add_left measurable_const]
        simp
    _ ≤ 1 + (∫⁻ ω, Z ω ^ p ∂P) ^ (1 / p) *
          (∫⁻ ω, (I ω) ^ p.conjExponent ∂P) ^ (1 / p.conjExponent) := by gcongr
    _ = _ := by
        rw [hg, hf, one_div, one_div, ← hpq.one_sub_inv]

/-- Certain extinction gives `ℙ_x[X(n) ≠ 0] → 0`. -/
lemma tendsto_pathLaw_ne_zero (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ)
    (hext : pathLaw μ x (extinctionEvent ι) = 1) :
    Tendsto (fun n => pathLaw μ x {ω | ω n ≠ 0}) atTop (𝓝 0) := by
  have h1 : Tendsto (fun n => pathLaw μ x {ω | ω n = 0}) atTop (𝓝 1) := by
    have := tendsto_atTop_iSup (pathLaw_eval_eq_zero_mono μ x)
    rwa [← pathLaw_extinctionEvent_eq_iSup, hext] at this
  have h2 : ∀ n, pathLaw μ x {ω | ω n ≠ 0} = 1 - pathLaw μ x {ω | ω n = 0} := by
    intro n
    have hm : MeasurableSet {ω : ℕ → ι →₀ ℕ | ω n = 0} :=
      (MeasurableSet.of_discrete (s := {c : ι →₀ ℕ | c = 0})).preimage (measurable_pi_apply n)
    rw [← prob_compl_eq_one_sub hm]
    rfl
  simp_rw [h2]
  simpa using (ENNReal.Tendsto.sub tendsto_const_nhds h1 (Or.inl ENNReal.one_ne_top))

/-- **The scaled moments tend to `1`** (the core of Lemma 2.11). If `q ≥ 1`, certain extinction
holds, and the moments `𝔼[∏_j (q_j^p)^{X_j(φ i)}]` are bounded for some `p > 1`, then
`𝔼[∏_j q_j^{X_j(φ i)}] → 1`. -/
lemma tendsto_lintegral_prod_one (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ)
    (hext : pathLaw μ x (extinctionEvent ι) = 1) {φ : ℕ → ℕ} (hφ : Tendsto φ atTop atTop)
    {q : ι → ℝ≥0∞} (hq : ∀ j, 1 ≤ q j) {p : ℝ} (hp : 1 < p) {C : ℝ≥0∞} (hC : C ≠ ∞)
    (hbd : ∀ᶠ i in atTop,
      ∫⁻ ω, (ω (φ i)).prod (fun j m => (q j ^ p) ^ m) ∂pathLaw μ x ≤ C) :
    Tendsto (fun i => ∫⁻ ω, (ω (φ i)).prod (fun j m => q j ^ m) ∂pathLaw μ x) atTop (𝓝 1) := by
  have hlow : ∀ n, 1 ≤ ∫⁻ ω, (ω n).prod (fun j m => q j ^ m) ∂pathLaw μ x := by
    intro n
    calc (1 : ℝ≥0∞) = ∫⁻ _ω, (1 : ℝ≥0∞) ∂pathLaw μ x := by simp
      _ ≤ _ := lintegral_mono fun ω => Finset.one_le_prod fun j _ => one_le_pow_of_one_le' (hq j) _
  have hA := (tendsto_pathLaw_ne_zero μ x hext).comp hφ
  have hp' : 0 < 1 - p⁻¹ := by
    have : p⁻¹ < 1 := inv_lt_one_of_one_lt₀ hp
    linarith
  have hA' : Tendsto (fun i => pathLaw μ x {ω | ω (φ i) ≠ 0} ^ (1 - p⁻¹)) atTop (𝓝 0) := by
    have := (ENNReal.continuous_rpow_const (y := 1 - p⁻¹)).tendsto 0 |>.comp hA
    rwa [ENNReal.zero_rpow_of_pos hp'] at this
  have hup : Tendsto (fun i => 1 + C ^ p⁻¹ * pathLaw μ x {ω | ω (φ i) ≠ 0} ^ (1 - p⁻¹)) atTop
      (𝓝 1) := by
    have h1 := ENNReal.Tendsto.const_mul hA' (Or.inr (ENNReal.rpow_ne_top_of_nonneg
      (inv_nonneg.2 (by linarith)) hC) : (0 : ℝ≥0∞) ≠ 0 ∨ C ^ p⁻¹ ≠ ∞)
    simpa using (tendsto_const_nhds (x := (1 : ℝ≥0∞))).add h1
  refine tendsto_of_tendsto_of_tendsto_of_le_of_le' tendsto_const_nhds hup
    (Eventually.of_forall fun i => hlow _) ?_
  filter_upwards [hbd] with i hi
  refine (lintegral_prod_le_add μ x (φ i) hp).trans ?_
  gcongr

end Holder

section Lemma211

variable {d : ℕ}

/-- For `x ≥ 0` in `[-∞,∞]`, `|x| = x⁺` as an element of `[0,∞]`. -/
lemma abs_eq_toENNReal {x : EReal} (hx : 0 ≤ x) : x.abs = x.toENNReal := by
  induction x using EReal.rec with
  | bot => exact absurd hx (not_le.2 EReal.bot_lt_zero)
  | top => simp
  | coe r =>
    have hr : 0 ≤ r := by exact_mod_cast hx
    rw [EReal.abs_def, abs_of_nonneg hr]
    rfl

/-- `g^{(n)}_k(y) = log 𝔼_k[∏_j e^{y_j X_j(n)}]`, display (2.5). -/
lemma logGenFun_iterate_apply (μ : Fin d → PMF (Fin d →₀ ℕ)) (n : ℕ) (y : Fin d → EReal)
    (k : Fin d) :
    (logGenFun μ)^[n] y k = ENNReal.log (∫⁻ ω, (ω n).prod (fun j m => EReal.exp (y j) ^ m)
      ∂pathLaw μ (Finsupp.single k 1)) := by
  rw [logGenFun_iterate]
  dsimp only
  rw [genFun_iterate_eq]

/-- A finite supremum of sequences tending to `0` tends to `0`. -/
lemma tendsto_iSup_zero {α : Type*} {l : Filter α} {f : α → Fin d → ℝ≥0∞}
    (h : ∀ j, Tendsto (fun a => f a j) l (𝓝 0)) : Tendsto (fun a => ⨆ j, f a j) l (𝓝 0) := by
  have hsum : Tendsto (fun a => ∑ j, f a j) l (𝓝 0) := by
    simpa using tendsto_finsetSum Finset.univ fun j _ => h j
  refine tendsto_of_tendsto_of_tendsto_of_le_of_le tendsto_const_nhds hsum
    (fun _ => zero_le) (fun a => iSup_le fun j => ?_)
  exact Finset.single_le_sum (f := fun j => f a j) (fun _ _ => zero_le) (Finset.mem_univ j)

/-- **Lemma 2.11** (paper.tex:619-639), along an arbitrary sequence of times `φ i → ∞`. -/
theorem tendsto_logGenFun_iterate_smul (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hext : ∀ k, pathLaw μ (Finsupp.single k 1) (extinctionEvent (Fin d)) = 1)
    {φ : ℕ → ℕ} (hφ : Tendsto φ atTop atTop) {x : Fin d → EReal} (hx : ∀ j, 0 ≤ x j)
    (hbd : limsup (fun i => ⨆ j, ((logGenFun μ)^[φ i] x j).abs) atTop < ⊤)
    {r : ℝ} (hr0 : 0 ≤ r) (hr1 : r < 1) :
    Tendsto (fun i => ⨆ j, ((logGenFun μ)^[φ i] (fun j => (r : EReal) * x j) j).abs) atTop
      (𝓝 0) := by
  rcases hr0.eq_or_lt with rfl | hr
  · have h0 : (fun j => (((0 : ℝ) : EReal)) * x j) = 0 := by
      funext j
      simp
    rw [h0]
    simp only [Function.iterate_fixed (logGenFun_zero μ)]
    simp
  have hp : 1 < r⁻¹ := (one_lt_inv₀ hr).2 hr1
  -- a uniform bound for the moments of `x`
  obtain ⟨b, hb1, hb2⟩ := exists_between hbd
  have hev := eventually_lt_of_limsup_lt hb1
  set C : ℝ≥0∞ := EReal.exp (b : EReal) with hC
  have hCtop : C ≠ ⊤ := by
    rw [hC, Ne, EReal.exp_eq_top_iff, EReal.coe_ennreal_eq_top_iff]
    exact hb2.ne
  have hnn : ∀ n j, 0 ≤ (logGenFun μ)^[n] x j := fun n j =>
    (mapsTo_logGenFun μ).iterate n hx j
  have hbound : ∀ᶠ i in atTop, ∀ k, ∫⁻ ω, (ω (φ i)).prod (fun j m => EReal.exp (x j) ^ m)
      ∂pathLaw μ (Finsupp.single k 1) ≤ C := by
    filter_upwards [hev] with i hi k
    have h1 : ((logGenFun μ)^[φ i] x k).abs < b :=
      lt_of_le_of_lt (le_iSup (fun j => ((logGenFun μ)^[φ i] x j).abs) k) hi
    rw [abs_eq_toENNReal (hnn _ k)] at h1
    have h2 : (logGenFun μ)^[φ i] x k < b := by
      rw [← EReal.coe_toENNReal (hnn (φ i) k)]
      exact EReal.coe_ennreal_lt_coe_ennreal_iff.2 h1
    rw [logGenFun_iterate_apply] at h2
    calc _ = EReal.exp (ENNReal.log _) := (ENNReal.exp_log _).symm
      _ ≤ C := EReal.exp_monotone h2.le
  -- the scaled moments tend to `1`
  have hconv : ∀ k, Tendsto (fun i => ∫⁻ ω, (ω (φ i)).prod
      (fun j m => EReal.exp ((r : EReal) * x j) ^ m) ∂pathLaw μ (Finsupp.single k 1)) atTop
      (𝓝 1) := by
    intro k
    have hq : ∀ j, EReal.exp ((r : EReal) * x j) = EReal.exp (x j) ^ r := fun j => by
      rw [EReal.mul_comm, EReal.exp_mul]
    have hq1 : ∀ j, 1 ≤ EReal.exp ((r : EReal) * x j) := fun j =>
      EReal.one_le_exp_iff.2 (EReal.mul_nonneg (by exact_mod_cast hr.le) (hx j))
    refine tendsto_lintegral_prod_one μ _ (pathLaw_extinctionEvent_eq_one_of_single μ hext _)
      hφ hq1 hp hCtop ?_
    filter_upwards [hbound] with i hi
    have h : ∀ j, (EReal.exp ((r : EReal) * x j) ^ r⁻¹) = EReal.exp (x j) := fun j => by
      rw [hq, ENNReal.rpow_rpow_inv hr.ne']
    simp only [h]
    exact hi k
  have hnn' : ∀ n j, 0 ≤ (logGenFun μ)^[n] (fun j => (r : EReal) * x j) j := fun n j =>
    (mapsTo_logGenFun μ).iterate n
      (fun j => EReal.mul_nonneg (by exact_mod_cast hr.le) (hx j)) j
  refine tendsto_iSup_zero fun j => ?_
  have h1 : ∀ i, ((logGenFun μ)^[φ i] (fun j => (r : EReal) * x j) j).abs =
      (ENNReal.log (∫⁻ ω, (ω (φ i)).prod (fun j m => EReal.exp ((r : EReal) * x j) ^ m)
        ∂pathLaw μ (Finsupp.single j 1))).toENNReal := fun i => by
    rw [abs_eq_toENNReal (hnn' _ j), logGenFun_iterate_apply]
  simp_rw [h1]
  have := ((EReal.continuous_toENNReal.comp ENNReal.continuous_log).tendsto 1).comp (hconv j)
  simpa only [Function.comp_def, ENNReal.log_one, EReal.toENNReal_zero] using this

end Lemma211

section Prop210

variable {d : ℕ}

/-- `|·|` is monotone on `[0,∞]`. -/
lemma abs_le_abs_of_nonneg {a b : EReal} (ha : 0 ≤ a) (hab : a ≤ b) : a.abs ≤ b.abs := by
  rw [abs_eq_toENNReal ha, abs_eq_toENNReal (ha.trans hab)]
  exact EReal.toENNReal_le_toENNReal hab

lemma iterate_mul_add {α : Type*} (f : α → α) (m r r₀ : ℕ) (x : α) :
    f^[r * m] (f^[r₀ * m] x) = f^[(r + r₀) * m] x := by
  rw [← Function.iterate_add_apply, Nat.add_mul]

/-- **Finiteness of the iterates** (paper.tex:641-645): if `limsup_r |g^{(r m)}(x)| < ∞`, then
every coordinate of every `g^{(n)}(x)` is finite. Otherwise all coordinates are infinite from
some time on (paper.tex:732). -/
lemma logGenFun_iterate_ne_top (μ : Fin d → PMF (Fin d →₀ ℕ)) (hpr : IsPositiveRegular μ)
    {m : ℕ} (hm : 1 ≤ m) {x : Fin d → EReal} (hx : ∀ j, 0 ≤ x j)
    (hbd : limsup (fun r => ⨆ j, ((logGenFun μ)^[r * m] x j).abs) atTop < ⊤) (n : ℕ)
    (k : Fin d) : (logGenFun μ)^[n] x k ≠ ⊤ := by
  intro hk
  obtain ⟨N₁, hN₁⟩ := exists_logGenFun_iterate_eq_top μ hpr
  have hev := eventually_lt_of_limsup_lt hbd
  have hev2 : ∀ᶠ r in atTop, (⨆ j, ((logGenFun μ)^[r * m] x j).abs) = ⊤ := by
    filter_upwards [eventually_ge_atTop (n + N₁)] with r hr
    have hrm : r ≤ r * m := Nat.le_mul_of_pos_right r hm
    have h1 : (logGenFun μ)^[r * m] x = fun _ => ⊤ := by
      obtain ⟨t, ht⟩ := Nat.exists_eq_add_of_le (show n ≤ r * m by omega)
      rw [ht, Nat.add_comm, Function.iterate_add_apply]
      funext j
      exact hN₁ _ (mapsTo_logGenFun μ |>.iterate n hx) ⟨k, hk⟩ t (by omega) j
    rw [h1]
    exact eq_top_iff.2 (le_iSup_of_le k (by simp))
  obtain ⟨r, hr1, hr2⟩ := (hev.and hev2).exists
  exact absurd hr2 hr1.ne

/-- Finitely many reals `b_k < a_k` with `b_k ≥ 0` are bounded by `s a_k` for some `s ∈ [0,1)`. -/
lemma exists_scale_lt_one {a b : Fin d → ℝ} (h : ∀ k, 0 ≤ b k ∧ b k < a k) :
    ∃ s : ℝ, 0 ≤ s ∧ s < 1 ∧ ∀ k, b k ≤ s * a k := by
  have hev1 : ∀ᶠ s in 𝓝[<] (1 : ℝ), s ∈ Set.Ioo (0 : ℝ) 1 := Ioo_mem_nhdsLT zero_lt_one
  have hev2 : ∀ᶠ s in 𝓝[<] (1 : ℝ), ∀ k, b k / a k < s := by
    refine eventually_all.2 fun k => ?_
    have hak : 0 < a k := lt_of_le_of_lt (h k).1 (h k).2
    have : b k / a k < 1 := (div_lt_one hak).2 (h k).2
    exact (show ∀ᶠ s in 𝓝[<] (1 : ℝ), s ∈ Set.Ioo (b k / a k) 1 from
      Ioo_mem_nhdsLT this).mono fun s hs => hs.1
  obtain ⟨s, hs1, hs2⟩ := (hev1.and hev2).exists
  refine ⟨s, hs1.1.le, hs1.2, fun k => ?_⟩
  have hak : 0 < a k := lt_of_le_of_lt (h k).1 (h k).2
  exact (div_le_iff₀ hak).1 (hs2 k).le

/-- **Proposition 2.10 (i)** for `m = 1`, **Lemma 2.13 (i)** in general (paper.tex:608-650,
653-665), proved directly along the times `r * m`. -/
theorem tendsto_zero_of_lt (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hext : ∀ k, pathLaw μ (Finsupp.single k 1) (extinctionEvent (Fin d)) = 1)
    (hpr : IsPositiveRegular μ) {m : ℕ} (hm : 1 ≤ m) {x y : Fin d → EReal}
    (hx : ∀ j, 0 ≤ x j ∧ x j < ⊤)
    (hbd : limsup (fun r => ⨆ j, ((logGenFun μ)^[r * m] x j).abs) atTop < ⊤)
    (hy : ∀ j, 0 ≤ y j) (hyx : y ≤ x) (hne : y ≠ x) :
    Tendsto (fun r => ⨆ j, ((logGenFun μ)^[r * m] y j).abs) atTop (𝓝 0) := by
  obtain ⟨N, hN⟩ := exists_logGenFun_iterate_strict μ hpr
  -- the strictness time, rounded up to a multiple of `m`
  set r₀ : ℕ := N with hr₀
  have hn₀ : N ≤ r₀ * m := Nat.le_mul_of_pos_right r₀ hm
  set x' : Fin d → EReal := (logGenFun μ)^[r₀ * m] x with hx'
  set y' : Fin d → EReal := (logGenFun μ)^[r₀ * m] y with hy'
  have hx'0 : ∀ j, 0 ≤ x' j := fun j => (mapsTo_logGenFun μ).iterate _ (fun j => (hx j).1) j
  have hy'0 : ∀ j, 0 ≤ y' j := fun j => (mapsTo_logGenFun μ).iterate _ hy j
  have hx'fin : ∀ j, x' j ≠ ⊤ := fun j =>
    logGenFun_iterate_ne_top μ hpr hm (fun j => (hx j).1) hbd _ j
  have hlt : ∀ k, y' k < x' k := fun k =>
    hN _ hn₀ y x hy (fun j => (hx j).2) hyx hne k (lt_top_iff_ne_top.2 (hx'fin k))
  -- a real scaling factor `s < 1` with `y' ≤ s x'`
  obtain ⟨s, hs0, hs1, hs⟩ : ∃ s : ℝ, 0 ≤ s ∧ s < 1 ∧ ∀ k, y' k ≤ (s : EReal) * x' k := by
    have hfin : ∀ k, y' k ≠ ⊤ := fun k => ((hlt k).trans_le le_top).ne
    have hxr : ∀ k, x' k = ((x' k).toReal : EReal) := fun k =>
      (EReal.coe_toReal (hx'fin k) (ne_bot_of_le_ne_bot (by simp) (hx'0 k))).symm
    have hyr : ∀ k, y' k = ((y' k).toReal : EReal) := fun k =>
      (EReal.coe_toReal (hfin k) (ne_bot_of_le_ne_bot (by simp) (hy'0 k))).symm
    obtain ⟨s, hs0, hs1, hs⟩ := exists_scale_lt_one (a := fun k => (x' k).toReal)
      (b := fun k => (y' k).toReal) fun k => by
        refine ⟨?_, ?_⟩
        · exact EReal.toReal_nonneg (hy'0 k)
        · have := hlt k
          rw [hxr k, hyr k] at this
          exact_mod_cast this
    refine ⟨s, hs0, hs1, fun k => ?_⟩
    rw [hxr k, hyr k, ← EReal.coe_mul]
    exact_mod_cast hs k
  -- Lemma 2.11 along the times `r * m`
  have hφ : Tendsto (fun r : ℕ => r * m) atTop atTop :=
    tendsto_atTop_mono (fun r => Nat.le_mul_of_pos_right r hm) tendsto_id
  have hbd' : limsup (fun r => ⨆ j, ((logGenFun μ)^[r * m] x' j).abs) atTop < ⊤ := by
    have : (fun r => ⨆ j, ((logGenFun μ)^[r * m] x' j).abs) =
        fun r => (fun r => ⨆ j, ((logGenFun μ)^[r * m] x j).abs) (r + r₀) := by
      funext r
      simp only [hx', iterate_mul_add]
    rw [this, limsup_nat_add (fun r => ⨆ j, ((logGenFun μ)^[r * m] x j).abs) r₀]
    exact hbd
  have h211 := tendsto_logGenFun_iterate_smul μ hext hφ hx'0 hbd' hs0 hs1
  have hle : ∀ r, (⨆ j, ((logGenFun μ)^[r * m] y' j).abs) ≤
      ⨆ j, ((logGenFun μ)^[r * m] (fun j => (s : EReal) * x' j) j).abs := by
    intro r
    refine iSup_mono fun j => ?_
    have hmono : (logGenFun μ)^[r * m] y' ≤ (logGenFun μ)^[r * m] (fun j => (s : EReal) * x' j) :=
      (logGenFun_mono μ).iterate _ hs
    exact abs_le_abs_of_nonneg ((mapsTo_logGenFun μ).iterate _ hy'0 j) (hmono j)
  have h1 : Tendsto (fun r => ⨆ j, ((logGenFun μ)^[r * m] y' j).abs) atTop (𝓝 0) :=
    tendsto_of_tendsto_of_tendsto_of_le_of_le tendsto_const_nhds h211 (fun _ => zero_le) hle
  have h2 : (fun r => ⨆ j, ((logGenFun μ)^[r * m] y' j).abs) =
      fun r => (fun r => ⨆ j, ((logGenFun μ)^[r * m] y j).abs) (r + r₀) := by
    funext r
    simp only [hy', iterate_mul_add]
  rw [h2] at h1
  exact (tendsto_add_atTop_iff_nat r₀).1 h1

/-- **Proposition 2.10 (ii)** for `m = 1`, **Lemma 2.13 (ii)** in general (paper.tex:650): the
contrapositive of `tendsto_zero_of_lt` with the roles of `x` and `y` exchanged. -/
theorem limsup_eq_top_of_lt (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hext : ∀ k, pathLaw μ (Finsupp.single k 1) (extinctionEvent (Fin d)) = 1)
    (hpr : IsPositiveRegular μ) {m : ℕ} (hm : 1 ≤ m) {x y : Fin d → EReal}
    (hx : ∀ j, 0 ≤ x j)
    (hpos : 0 < limsup (fun r => ⨆ j, ((logGenFun μ)^[r * m] x j).abs) atTop)
    (hy : ∀ j, 0 ≤ y j ∧ y j < ⊤) (hxy : x ≤ y) (hne : x ≠ y) :
    limsup (fun r => ⨆ j, ((logGenFun μ)^[r * m] y j).abs) atTop = ⊤ := by
  by_contra hcon
  have h0 := tendsto_zero_of_lt μ hext hpr hm hy (lt_top_iff_ne_top.2 hcon) hx hxy hne
  exact hpos.ne' h0.limsup_eq

end Prop210

end Conjugate

end
