/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.BasinInfty
public import Conjugate.Frozen.Defs.BasinZero
public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsSubcritical
public import Conjugate.Frozen.Defs.LogGenFun
import Conjugate.Internal.Analytic.LogGenFun
import Conjugate.Internal.Foundations.Extinction
import Conjugate.Internal.Section2.Attractive
import Conjugate.Internal.Section2.BasinInvariance
import Conjugate.Internal.Section2.BasinOpen
import Conjugate.Internal.Section2.MonotoneLimit
import Conjugate.Internal.Section2.Unstable

/-!
# Every ray meets `Λ` exactly once (Lemma 2.18) and ray ordering

Paper.tex:828-836. Here `Λ = [0,∞)^d ∖ (S₀ ∪ S∞)` and the ray through `u ∈ [0,∞)^d ∖ {0}` is
`r ↦ r u = (fun j => ((r * u j : ℝ) : EReal))`. The statement is norm-free: `u` is any nonzero
vector with nonnegative coordinates, not only `|u| = 1`.

* `ray_mem_basinZero_of_not_mem_basinInfty` and `ray_mem_basinInfty_of_not_mem_basinZero`: the two
  ray-ordering corollaries of Lemma 2.11 (with `φ = id` and scale `s / t`). For `u ≥ 0` and reals
  `0 ≤ s < t`: if `t u ∉ S∞` then `s u ∈ S₀`, and (contrapositive) if `s u ∉ S₀` then
  `t u ∈ S∞`. They give the uniqueness in Lemma 2.18, and will show that the ray parameter
  `u ↦ r(u)` is continuous in Theorem 2.7;
* `existsUnique_ray`: **Lemma 2.18**. Existence: by Lemmas 2.15 and 2.16 the open sets
  `{r > 0 | r u ∈ S₀}` and `{r > 0 | r u ∈ S∞}` (Lemma 2.17) are nonempty, disjoint, and
  cannot cover the connected set `(0,∞)`. Uniqueness: the first corollary.
-/

public section

open Filter Topology

open scoped ENNReal

namespace Conjugate

variable {d : ℕ}

section Corollaries

/-- **Ray ordering, first half** (Lemma 2.11 with `φ = id` and scale `s / t`): for `u ≥ 0` and
reals `0 ≤ s < t`, if `t u ∉ S∞` then `s u ∈ S₀`. -/
theorem ray_mem_basinZero_of_not_mem_basinInfty (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hI : IsSubcritical μ) (hII : IsPositiveRegular μ ∧ IsNonsingular μ)
    (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j})
    {u : Fin d → ℝ} (hu0 : ∀ j, 0 ≤ u j) {s t : ℝ} (hs : 0 ≤ s) (hst : s < t)
    (ht : (fun j => ((t * u j : ℝ) : EReal)) ∉ basinInfty μ) :
    (fun j => ((s * u j : ℝ) : EReal)) ∈ basinZero μ := by
  have _ := hII
  have _ := hIII
  have hext : ∀ k, pathLaw μ (Finsupp.single k 1) (extinctionEvent (Fin d)) = 1 := fun k =>
    pathLaw_extinctionEvent_eq_one μ hI _
  have htpos : 0 < t := lt_of_le_of_lt hs hst
  set x : Fin d → EReal := fun j => ((t * u j : ℝ) : EReal) with hx
  have hx0 : ∀ j, 0 ≤ x j := fun j => by
    simp only [hx]
    exact_mod_cast mul_nonneg htpos.le (hu0 j)
  have hbd : limsup (fun i => ⨆ j, ((logGenFun μ)^[id i] x j).abs) atTop < ⊤ :=
    lt_top_iff_ne_top.2 fun h => ht ⟨hx0, h⟩
  have hr0 : 0 ≤ s / t := div_nonneg hs htpos.le
  have hr1 : s / t < 1 := (div_lt_one htpos).2 hst
  have h := tendsto_logGenFun_iterate_smul μ hext tendsto_id hx0 hbd hr0 hr1
  have hfun : (fun j => ((s / t : ℝ) : EReal) * x j) = fun j => ((s * u j : ℝ) : EReal) := by
    funext j
    simp only [hx]
    rw [← EReal.coe_mul]
    congr 1
    field_simp
  rw [hfun] at h
  exact ⟨fun j => by beta_reduce; exact_mod_cast mul_nonneg hs (hu0 j), h⟩

/-- **Ray ordering, second half** (contrapositive of the first): for `u ≥ 0` and reals
`0 ≤ s < t`, if `s u ∉ S₀` then `t u ∈ S∞`. -/
theorem ray_mem_basinInfty_of_not_mem_basinZero (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hI : IsSubcritical μ) (hII : IsPositiveRegular μ ∧ IsNonsingular μ)
    (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j})
    {u : Fin d → ℝ} (hu0 : ∀ j, 0 ≤ u j) {s t : ℝ} (hs : 0 ≤ s) (hst : s < t)
    (hs0 : (fun j => ((s * u j : ℝ) : EReal)) ∉ basinZero μ) :
    (fun j => ((t * u j : ℝ) : EReal)) ∈ basinInfty μ := by
  by_contra h
  exact hs0 (ray_mem_basinZero_of_not_mem_basinInfty μ hI hII hIII hu0 hs hst h)

end Corollaries

section Lemma217

/-- **Lemma 2.18** (paper.tex:828-836), norm-free: every nonzero `u ≥ 0` has exactly one `r > 0`
with `r u ∉ S₀ ∪ S∞`. -/
theorem existsUnique_ray (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hI : IsSubcritical μ) (hII : IsPositiveRegular μ ∧ IsNonsingular μ)
    (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j})
    {u : Fin d → ℝ} (hu0 : ∀ j, 0 ≤ u j) (hu : u ≠ 0) :
    ∃! r : ℝ, 0 < r ∧
      (fun j => ((r * u j : ℝ) : EReal)) ∉ basinZero μ ∪ basinInfty μ := by
  obtain ⟨U₀, hU₀, hS₀⟩ := exists_isOpen_basinZero μ hI hII hIII
  obtain ⟨U₁, hU₁, hS₁⟩ := exists_isOpen_basinInfty μ hI hII hIII
  set ray : ℝ → Fin d → EReal := fun r j => ((r * u j : ℝ) : EReal) with hray
  have hrayc : Continuous ray :=
    continuous_pi fun j => continuous_coe_real_ereal.comp (continuous_id.mul continuous_const)
  have hray0 : ∀ r : ℝ, 0 ≤ r → ∀ j, 0 ≤ ray r j := fun r hr j => by
    simp only [hray]
    exact_mod_cast mul_nonneg hr (hu0 j)
  -- small rays lie in `S₀`
  have hsmall : ∃ r : ℝ, 0 < r ∧ ray r ∈ basinZero μ := by
    obtain ⟨ε, hε0, hε⟩ := exists_mem_basinZero_of_le μ hI hII hIII
    set M : ℝ := ∑ j, u j + 1 with hM
    have hM0 : 0 < M := by
      have : 0 ≤ ∑ j, u j := Finset.sum_nonneg fun j _ => hu0 j
      linarith
    have huM : ∀ j, u j ≤ M := fun j => by
      have := Finset.single_le_sum (f := u) (fun j _ => hu0 j) (Finset.mem_univ j)
      linarith
    refine ⟨ε / M, div_pos hε0 hM0, hε _ fun j => ⟨hray0 _ (div_pos hε0 hM0).le j, ?_⟩⟩
    simp only [hray]
    exact_mod_cast (calc ε / M * u j ≤ ε / M * M :=
        mul_le_mul_of_nonneg_left (huM j) (div_pos hε0 hM0).le
      _ = ε := by field_simp)
  -- large rays lie in `S∞`
  have hlarge : ∃ r : ℝ, 0 < r ∧ ray r ∈ basinInfty μ := by
    obtain ⟨C, hC0, N, hN1, hC⟩ := exists_attractive_infty μ hI hII hIII
    obtain ⟨j₀, hj₀⟩ := Function.ne_iff.1 hu
    have hj₀pos : 0 < u j₀ := lt_of_le_of_ne (hu0 j₀) (Ne.symm hj₀)
    have hr1 : 0 < C / u j₀ + 1 := by positivity
    refine ⟨C / u j₀ + 1, hr1, hray0 _ hr1.le, ?_⟩
    refine ((hC (ray (C / u j₀ + 1)) (fun j => ⟨hray0 _ hr1.le j, ?_⟩) ⟨j₀, ?_⟩).2).limsup_eq
    · simp only [hray]
      exact EReal.coe_lt_top _
    · simp only [hray]
      refine EReal.coe_lt_coe_iff.2 ?_
      have : (C / u j₀ + 1) * u j₀ = C + u j₀ := by field_simp
      rw [this]
      linarith
  -- existence
  have hex : ∃ r : ℝ, 0 < r ∧ ray r ∉ basinZero μ ∪ basinInfty μ := by
    by_contra hcon
    have hcov : ∀ r : ℝ, 0 < r → ray r ∈ basinZero μ ∪ basinInfty μ := fun r hr => by
      by_contra h
      exact hcon ⟨r, hr, h⟩
    set A₀ : Set ℝ := ray ⁻¹' U₀ ∩ Set.Ioi 0 with hA₀
    set A₁ : Set ℝ := ray ⁻¹' U₁ ∩ Set.Ioi 0 with hA₁
    have hm₀ : ∀ r : ℝ, 0 < r → (r ∈ A₀ ↔ ray r ∈ basinZero μ) := fun r hr => by
      rw [hS₀]
      exact ⟨fun h => ⟨h.1, hray0 r hr.le⟩, fun h => ⟨h.1, hr⟩⟩
    have hm₁ : ∀ r : ℝ, 0 < r → (r ∈ A₁ ↔ ray r ∈ basinInfty μ) := fun r hr => by
      rw [hS₁]
      exact ⟨fun h => ⟨h.1, hray0 r hr.le⟩, fun h => ⟨h.1, hr⟩⟩
    have hdisj : Disjoint A₀ A₁ := by
      refine Set.disjoint_left.2 fun r h0 h1 => ?_
      have hr : 0 < r := h0.2
      exact Set.eq_empty_iff_forall_notMem.1 (basinZero_inter_basinInfty μ) (ray r)
        ⟨(hm₀ r hr).1 h0, (hm₁ r hr).1 h1⟩
    have hsub : Set.Ioi (0 : ℝ) ⊆ A₀ ∪ A₁ := fun r hr => by
      rcases hcov r hr with h | h
      · exact Or.inl ((hm₀ r hr).2 h)
      · exact Or.inr ((hm₁ r hr).2 h)
    rcases isPreconnected_Ioi.subset_or_subset ((hU₀.preimage hrayc).inter isOpen_Ioi)
      ((hU₁.preimage hrayc).inter isOpen_Ioi) hdisj hsub with h | h
    · obtain ⟨r, hr, hr1⟩ := hlarge
      exact Set.eq_empty_iff_forall_notMem.1 (basinZero_inter_basinInfty μ) (ray r)
        ⟨(hm₀ r hr).1 (h hr), hr1⟩
    · obtain ⟨r, hr, hr0⟩ := hsmall
      exact Set.eq_empty_iff_forall_notMem.1 (basinZero_inter_basinInfty μ) (ray r)
        ⟨hr0, (hm₁ r hr).1 (h hr)⟩
  obtain ⟨r, hr, hrmem⟩ := hex
  refine ⟨r, ⟨hr, hrmem⟩, fun r' ⟨hr', hr'mem⟩ => ?_⟩
  -- uniqueness
  rcases lt_trichotomy r' r with h | h | h
  · exfalso
    exact hr'mem (Or.inl (ray_mem_basinZero_of_not_mem_basinInfty μ hI hII hIII hu0 hr'.le h
      fun h1 => hrmem (Or.inr h1)))
  · exact h
  · exfalso
    exact hrmem (Or.inl (ray_mem_basinZero_of_not_mem_basinInfty μ hI hII hIII hu0 hr.le h
      fun h1 => hr'mem (Or.inr h1)))

end Lemma217

end Conjugate

end
