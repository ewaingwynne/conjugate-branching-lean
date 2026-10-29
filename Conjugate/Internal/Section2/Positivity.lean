/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.ExtinctionEvent
public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.PathLaw
import Conjugate.Internal.Analytic.GenFun
import Conjugate.Internal.Foundations.Branching
import Conjugate.Internal.Foundations.Extinction
import Conjugate.Internal.Foundations.StepKernel

/-!
# Positivity consequences of positive regularity (Lemmas 2.3 and 2.4)

* `one_le_of_genFun_eq_self`, `eq_one_or_one_lt_of_genFun_eq_self`: Lemma 2.3
  (paper.tex:440-467), the fixed points of `f` are `≥ 1`, and all equal to `1` or all `> 1`;
* `exists_pos_of_le`: paper.tex:602, under positive regularity, the process has a type-`j`
  individual at *every* generation `n ≥ N` with positive probability;
* `exists_pos_two_individuals`: Lemma 2.4 (paper.tex:477-497), the population `X(N)` contains
  `e_k + e_j` with positive probability.

Reusable helpers: `measurableSet_extinctionEvent`, `pathLaw_map_eval_one`,
`pathLaw_mul_le_add` (branching property for events), `pathLaw_le_add_right` (more individuals
only help), `pathLaw_pos_add_time` (Chapman–Kolmogorov for positivity),
`pathLaw_pos_of_ne_zero`.
-/

public section

open MeasureTheory ProbabilityTheory Filter Topology

open scoped ENNReal

namespace Conjugate

variable {ι : Type*} [Countable ι]

section Helpers

/-- The extinction event is measurable. -/
lemma measurableSet_extinctionEvent : MeasurableSet (extinctionEvent ι) := by
  have : extinctionEvent ι = ⋃ N : ℕ, ⋂ m : ℕ, ⋂ (_ : N ≤ m),
      (fun ω : ℕ → ι →₀ ℕ => ω m) ⁻¹' {0} := by
    ext ω
    simp [extinctionEvent, eventually_atTop]
  rw [this]
  exact MeasurableSet.iUnion fun N => MeasurableSet.iInter fun m => MeasurableSet.iInter fun _ =>
    measurable_pi_apply m (measurableSet_singleton _)

/-- Certain extinction gives that, almost surely, `X(n) = 0` eventually. -/
lemma ae_eventually_eval_eq_zero (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ)
    (hext : pathLaw μ x (extinctionEvent ι) = 1) :
    ∀ᵐ ω ∂pathLaw μ x, ∀ᶠ n in atTop, ω n = 0 := by
  have h : pathLaw μ x (extinctionEvent ι)ᶜ = 0 := by
    rw [prob_compl_eq_zero_iff measurableSet_extinctionEvent]
    exact hext
  exact h

/-- The law of the generation `1` of the process started from `x` is `stepKernel μ x`. -/
lemma pathLaw_map_eval_one (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) :
    (pathLaw μ x).map (fun ω => ω 1) = stepKernel μ x := by
  have h := pathLaw_map_eval_succ_bind μ x 0
  rw [pathLaw_map_eval_zero, Measure.dirac_bind Measurable.of_discrete] at h
  simpa using h

/-- Probabilities of events about generation `n`, as the law of generation `n`. -/
lemma pathLaw_eval_mem (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) (n : ℕ) (S : Set (ι →₀ ℕ)) :
    pathLaw μ x {ω | ω n ∈ S} = ((pathLaw μ x).map fun ω => ω n) S :=
  (Measure.map_apply (measurable_pi_apply n) MeasurableSet.of_discrete).symm

/-- **Branching property for events**: if `a + b ∈ B` whenever `a ∈ B₁` and `b ∈ B₂`, then
`ℙ_x[X(n) ∈ B₁] ℙ_y[X(n) ∈ B₂] ≤ ℙ_{x+y}[X(n) ∈ B]`. -/
lemma pathLaw_mul_le_add (μ : ι → PMF (ι →₀ ℕ)) (x y : ι →₀ ℕ) (n : ℕ)
    {B₁ B₂ B : Set (ι →₀ ℕ)} (h : ∀ a ∈ B₁, ∀ b ∈ B₂, a + b ∈ B) :
    pathLaw μ x {ω | ω n ∈ B₁} * pathLaw μ y {ω | ω n ∈ B₂} ≤
      pathLaw μ (x + y) {ω | ω n ∈ B} := by
  rw [pathLaw_eval_mem μ x n B₁, pathLaw_eval_mem μ y n B₂, pathLaw_eval_mem μ (x + y) n B,
    pathLaw_map_eval_add, Measure.conv,
    Measure.map_apply (f := fun p : (ι →₀ ℕ) × (ι →₀ ℕ) => p.1 + p.2) (by fun_prop)
      MeasurableSet.of_discrete, ← Measure.prod_prod]
  refine measure_mono ?_
  intro p hp
  exact h p.1 (Set.mem_prod.1 hp).1 p.2 (Set.mem_prod.1 hp).2

/-- **More individuals only help**: for an event `B` closed under adding individuals,
`ℙ_x[X(n) ∈ B] ≤ ℙ_{x+z}[X(n) ∈ B]`. -/
lemma pathLaw_le_add_right (μ : ι → PMF (ι →₀ ℕ)) (x z : ι →₀ ℕ) (n : ℕ) {B : Set (ι →₀ ℕ)}
    (hB : ∀ a ∈ B, ∀ b, a + b ∈ B) :
    pathLaw μ x {ω | ω n ∈ B} ≤ pathLaw μ (x + z) {ω | ω n ∈ B} := by
  have h := pathLaw_mul_le_add μ x z n (B₁ := B) (B₂ := Set.univ) (B := B)
    fun a ha b _ => hB a ha b
  simpa using h

/-- **Chapman–Kolmogorov for positivity**: if `A` has positive probability at time `n`, and from
every population in `A` the event `B` has positive probability after `m` more generations, then
`B` has positive probability at time `n + m`. -/
lemma pathLaw_pos_add_time (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) (n m : ℕ)
    {A B : Set (ι →₀ ℕ)} (hA : 0 < pathLaw μ x {ω | ω n ∈ A})
    (hB : ∀ y ∈ A, 0 < pathLaw μ y {ω | ω m ∈ B}) :
    0 < pathLaw μ x {ω | ω (n + m) ∈ B} := by
  rw [pathLaw_eval_mem, pathLaw_map_eval_add_time,
    Measure.bind_apply MeasurableSet.of_discrete Measurable.of_discrete.aemeasurable,
    lintegral_pos_iff_support Measurable.of_discrete]
  refine lt_of_lt_of_le ?_ (measure_mono (s := A) fun y hy => ?_)
  · rwa [← pathLaw_eval_mem]
  · rw [Function.mem_support, ← pathLaw_eval_mem]
    exact (hB y hy).ne'

omit [Countable ι] in
/-- A nonzero population contains an individual. -/
lemma exists_single_add_of_ne_zero {y : ι →₀ ℕ} (hy : y ≠ 0) :
    ∃ i z, y = Finsupp.single i 1 + z := by
  obtain ⟨i, hi⟩ := Finsupp.ne_iff.1 hy
  have hle : Finsupp.single i 1 ≤ y := Finsupp.single_le_iff.2 (Nat.one_le_iff_ne_zero.2 hi)
  exact ⟨i, _, (add_tsub_cancel_of_le hle).symm⟩

omit [Countable ι] in
/-- A population of size at least `2` contains two individuals. -/
lemma exists_two_single_le {z : ι →₀ ℕ} (hz : 2 ≤ z.sum fun _ n => n) :
    ∃ a b, Finsupp.single a 1 + Finsupp.single b 1 ≤ z := by
  have hz0 : z ≠ 0 := by
    rintro rfl
    simp at hz
  obtain ⟨a, z', hz'⟩ := exists_single_add_of_ne_zero hz0
  have hsum : (z.sum fun _ n => n) = 1 + z'.sum fun _ n => n := by
    rw [hz', Finsupp.sum_add_index' (by simp) (by simp), Finsupp.sum_single_index (by simp)]
  have hz'0 : z' ≠ 0 := by
    rintro rfl
    simp [hsum] at hz
  obtain ⟨b, z'', hz''⟩ := exists_single_add_of_ne_zero hz'0
  exact ⟨a, b, by rw [hz', hz'']; exact add_le_add_right (le_add_right le_rfl) _⟩

/-- If `B` is closed under adding individuals and has positive probability at time `n` from every
single individual, then it has positive probability from every nonzero population. -/
lemma pathLaw_pos_of_ne_zero (μ : ι → PMF (ι →₀ ℕ)) {B : Set (ι →₀ ℕ)}
    (hB : ∀ a ∈ B, ∀ b, a + b ∈ B) {n : ℕ}
    (h : ∀ i, 0 < pathLaw μ (Finsupp.single i 1) {ω | ω n ∈ B}) {y : ι →₀ ℕ} (hy : y ≠ 0) :
    0 < pathLaw μ y {ω | ω n ∈ B} := by
  obtain ⟨i, z, rfl⟩ := exists_single_add_of_ne_zero hy
  exact lt_of_lt_of_le (h i) (pathLaw_le_add_right μ _ z n hB)

end Helpers

section Lemma23

/-- **Lemma 2.3, (2.3)** (paper.tex:440-467). Only per-type certain extinction is assumed
(stronger than the source). -/
theorem one_le_of_genFun_eq_self (μ : ι → PMF (ι →₀ ℕ))
    (hext : ∀ k, pathLaw μ (Finsupp.single k 1) (extinctionEvent ι) = 1)
    {q : ι → ℝ≥0∞} (hfix : genFun μ q = q) (k : ι) : 1 ≤ q k := by
  set P := pathLaw μ (Finsupp.single k 1) with hP
  have hF : ∀ n, ∫⁻ ω, (ω n).prod (fun j m => q j ^ m) ∂P = q k := fun n => by
    rw [← genFun_iterate_eq, Function.iterate_fixed hfix]
  have hmeas : ∀ n, Measurable fun ω : ℕ → ι →₀ ℕ => (ω n).prod (fun j m => q j ^ m) := fun n =>
    (Measurable.of_discrete (f := fun c : ι →₀ ℕ => c.prod (fun j m => q j ^ m))).comp
      (measurable_pi_apply n)
  have hfat := lintegral_liminf_le (μ := P) (u := atTop) hmeas
  simp_rw [hF] at hfat
  have h1 : ∫⁻ ω, liminf (fun n => (ω n).prod (fun j m => q j ^ m)) atTop ∂P = 1 := by
    have hae : ∀ᵐ ω ∂P, liminf (fun n => (ω n).prod (fun j m => q j ^ m)) atTop = 1 := by
      filter_upwards [ae_eventually_eval_eq_zero μ _ (hext k)] with ω hω
      have h' : liminf (fun n => (ω n).prod (fun j m => q j ^ m)) atTop =
          liminf (fun _ => (1 : ℝ≥0∞)) atTop := liminf_congr (hω.mono fun n hn => by simp [hn])
      rw [h']
      simp
    rw [lintegral_congr_ae hae]
    simp
  rw [h1] at hfat
  simpa using hfat

/-- **Lemma 2.3, second assertion.** -/
theorem eq_one_or_one_lt_of_genFun_eq_self (μ : ι → PMF (ι →₀ ℕ)) (hpr : IsPositiveRegular μ)
    (hext : ∀ k, pathLaw μ (Finsupp.single k 1) (extinctionEvent ι) = 1)
    {q : ι → ℝ≥0∞} (hfix : genFun μ q = q) : (∀ k, q k = 1) ∨ ∀ k, 1 < q k := by
  have h1 := one_le_of_genFun_eq_self μ hext hfix
  by_cases hall : ∀ k, q k = 1
  · exact Or.inl hall
  · right
    obtain ⟨j, hj⟩ := not_forall.1 hall
    have hj1 : 1 < q j := lt_of_le_of_ne (h1 j) (Ne.symm hj)
    obtain ⟨N, -, hN⟩ := hpr
    intro k
    set P := pathLaw μ (Finsupp.single k 1) with hP
    have hqk : q k = ∫⁻ ω, (ω N).prod (fun i m => q i ^ m) ∂P := by
      rw [← genFun_iterate_eq, Function.iterate_fixed hfix]
    have hA : MeasurableSet {ω : ℕ → ι →₀ ℕ | 1 ≤ ω N j} := by
      have hs : MeasurableSet {c : ι →₀ ℕ | 1 ≤ c j} := MeasurableSet.of_discrete
      exact hs.preimage (measurable_pi_apply N)
    set A : Set (ℕ → ι →₀ ℕ) := {ω | 1 ≤ ω N j} with hAdef
    have hpt : ∀ ω, 1 + A.indicator (fun _ => q j - 1) ω ≤ (ω N).prod (fun i m => q i ^ m) := by
      intro ω
      have hone : 1 ≤ (ω N).prod (fun i m => q i ^ m) :=
        Finset.one_le_prod fun i _ => one_le_pow_of_one_le' (h1 i) _
      by_cases hω : ω ∈ A
      · rw [Set.indicator_of_mem hω, add_tsub_cancel_of_le (h1 j)]
        have hmem : j ∈ (ω N).support := Finsupp.mem_support_iff.2 (by
          have : 1 ≤ ω N j := hω
          omega)
        refine le_trans ?_ (Finset.single_le_prod (f := fun i => q i ^ ω N i)
          (fun i _ => one_le_pow_of_one_le' (h1 i) _) hmem)
        exact le_self_pow (h1 j) (by
          have : 1 ≤ ω N j := hω
          omega)
      · rw [Set.indicator_of_notMem hω, add_zero]
        exact hone
    calc 1 < 1 + (q j - 1) * P A := by
          refine ENNReal.lt_add_right ENNReal.one_ne_top ?_
          refine (ENNReal.mul_pos (tsub_pos_iff_lt.2 hj1).ne' (hN k j).ne').ne'
      _ = ∫⁻ ω, 1 + A.indicator (fun _ => q j - 1) ω ∂P := by
          rw [lintegral_add_left measurable_const, lintegral_indicator_const hA]
          simp
      _ ≤ q k := by
          rw [hqk]
          exact lintegral_mono hpt

end Lemma23

section Lemma24

/-- **paper.tex:602**: positivity at every generation `n ≥ N`. -/
theorem exists_pos_of_le (μ : ι → PMF (ι →₀ ℕ)) (hpr : IsPositiveRegular μ) :
    ∃ N, 1 ≤ N ∧ ∀ n, N ≤ n → ∀ k j,
      0 < pathLaw μ (Finsupp.single k 1) {ω | 1 ≤ ω n j} := by
  obtain ⟨N, hN1, hN⟩ := hpr
  refine ⟨N, hN1, fun n hn k j => ?_⟩
  set S : Set (ι →₀ ℕ) := {c | c ≠ 0} with hS
  have hSup : ∀ a ∈ S, ∀ b, a + b ∈ S := fun a ha b hab => ha (by
    exact (add_eq_zero.1 hab).1)
  -- survival at the times `N * t`
  have hsurv : ∀ t k, 0 < pathLaw μ (Finsupp.single k 1) {ω | ω (N * t) ∈ S} := by
    intro t
    induction t with
    | zero =>
      intro k
      rw [Nat.mul_zero, pathLaw_eval_mem, pathLaw_map_eval_zero]
      simp [S]
    | succ t ih =>
      intro k
      rw [Nat.mul_succ]
      refine pathLaw_pos_add_time μ _ _ _ (ih k) fun y hy => ?_
      refine pathLaw_pos_of_ne_zero μ hSup (fun i => ?_) hy
      refine lt_of_lt_of_le (hN i i) (measure_mono fun ω hω => ?_)
      have : 1 ≤ ω N i := hω
      change ω N ≠ 0
      intro h0
      simp [h0] at this
  have hsurv' : ∀ m k, 0 < pathLaw μ (Finsupp.single k 1) {ω | ω m ∈ S} := by
    intro m k
    refine lt_of_lt_of_le (hsurv m k) (measure_mono_ae ?_)
    have hle : m ≤ N * m := Nat.le_mul_of_pos_left m hN1
    filter_upwards [ae_eval_eq_zero_of_le μ (Finsupp.single k 1) hle] with ω hω h
    exact fun h0 => h (hω h0)
  obtain ⟨m, rfl⟩ := Nat.exists_eq_add_of_le hn
  rw [Nat.add_comm]
  refine pathLaw_pos_add_time μ _ m N (A := S) (B := {c | 1 ≤ c j}) (hsurv' m k) fun y hy => ?_
  refine pathLaw_pos_of_ne_zero μ (B := {c | 1 ≤ c j}) (fun a ha b => ?_) (fun i => hN i j) hy
  change 1 ≤ (a + b) j
  have : 1 ≤ a j := ha
  simp only [Finsupp.add_apply]
  omega

/-- **Lemma 2.4, (2.4)** (paper.tex:477-497): `X(N) ≥ e_k + e_j` has positive probability, which
covers both cases `k ≠ j` and `k = j`. -/
theorem exists_pos_two_individuals (μ : ι → PMF (ι →₀ ℕ)) (hpr : IsPositiveRegular μ)
    (hns : IsNonsingular μ) :
    ∃ N, 1 ≤ N ∧ ∀ k j,
      0 < pathLaw μ (Finsupp.single k 1)
        {ω | Finsupp.single k 1 + Finsupp.single j 1 ≤ ω N} := by
  obtain ⟨N₀, hN₀1, hN₀⟩ := hpr
  obtain ⟨k₀, hk₀⟩ := hns
  refine ⟨N₀ + 1 + N₀, by omega, fun k j => ?_⟩
  set A₁ : Set (ι →₀ ℕ) := {c | 1 ≤ c k₀} with hA₁
  set A₂ : Set (ι →₀ ℕ) := {c | 2 ≤ c.sum fun _ n => n} with hA₂
  set B₃ : Set (ι →₀ ℕ) := {c | Finsupp.single k 1 + Finsupp.single j 1 ≤ c} with hB₃
  -- stage 1: an individual of type `k₀` at time `N₀`
  have h1 : 0 < pathLaw μ (Finsupp.single k 1) {ω | ω N₀ ∈ A₁} := hN₀ k k₀
  -- stage 2: two individuals at time `N₀ + 1`
  have hA₂up : ∀ a ∈ A₂, ∀ b, a + b ∈ A₂ := by
    intro a ha b
    change 2 ≤ (a + b).sum fun _ n => n
    rw [Finsupp.sum_add_index' (by simp) (by simp)]
    exact le_trans ha (Nat.le_add_right _ _)
  have h2 : 0 < pathLaw μ (Finsupp.single k 1) {ω | ω (N₀ + 1) ∈ A₂} := by
    refine pathLaw_pos_add_time μ _ N₀ 1 h1 fun y hy => ?_
    obtain ⟨z, hz⟩ := le_iff_exists_add.1 (Finsupp.single_le_iff.2 (show 1 ≤ y k₀ from hy))
    rw [hz]
    refine lt_of_lt_of_le ?_ (pathLaw_le_add_right μ _ z 1 hA₂up)
    rw [pathLaw_eval_mem, pathLaw_map_eval_one, stepKernel_single]
    exact hk₀
  -- stage 3: one individual of type `k` and one of type `j` at time `2 N₀ + 1`
  have hB₃up : ∀ a ∈ B₃, ∀ b, a + b ∈ B₃ := fun a (ha : _ ≤ a) b =>
    show _ ≤ a + b from le_trans ha (le_add_right le_rfl)
  refine pathLaw_pos_add_time μ _ (N₀ + 1) N₀ (A := A₂) (B := B₃) h2 fun z hz => ?_
  obtain ⟨a, b, hab⟩ := exists_two_single_le hz
  obtain ⟨z', hz'⟩ := le_iff_exists_add.1 hab
  rw [hz']
  refine lt_of_lt_of_le ?_ (pathLaw_le_add_right μ _ z' N₀ hB₃up)
  refine lt_of_lt_of_le ?_ (pathLaw_mul_le_add μ (Finsupp.single a 1) (Finsupp.single b 1) N₀
    (B₁ := {c | 1 ≤ c k}) (B₂ := {c | 1 ≤ c j}) ?_)
  · exact ENNReal.mul_pos (hN₀ a k).ne' (hN₀ b j).ne'
  · intro c₁ hc₁ c₂ hc₂
    have e₁ : Finsupp.single k 1 ≤ c₁ := Finsupp.single_le_iff.2 hc₁
    have e₂ : Finsupp.single j 1 ≤ c₂ := Finsupp.single_le_iff.2 hc₂
    exact add_le_add e₁ e₂

end Lemma24

end Conjugate

end
