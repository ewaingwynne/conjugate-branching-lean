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
import Conjugate.Internal.Section2.BasinInvariance
import Conjugate.Internal.Section2.BasinOpen
import Conjugate.Internal.Section2.Ray

/-!
# The ray parameter on the simplex (assembly of Theorem 2.7)

Paper.tex:894-905. Let `Δ = {u : Fin d → ℝ | (∀ j, 0 ≤ u j) ∧ ∑ j, u j = 1}` be the standard
simplex. By Lemma 2.18 (`existsUnique_ray`) every `u ∈ Δ` has a unique `ρ(u) > 0` with
`ρ(u) u ∉ S₀ ∪ S∞`.

* `toE v` and `rayPt r u = toE (r u)` embed real vectors into `[0,∞)^d ⊆ (Fin d → EReal)`;
* `rayParam μ u` is the chosen `ρ(u)`, with `rayParam_spec` and the uniqueness
  `eq_rayParam`;
* `lt_rayParam_iff` and `rayParam_lt_iff`: for `t > 0` and `u ∈ Δ`,
  `t < ρ(u) ↔ t u ∈ S₀` and `ρ(u) < t ↔ t u ∈ S∞` (from the ray ordering corollaries of
  Lemma 2.11 and the disjointness of the basins);
* `continuousOn_rayParam`: `ρ` is continuous on `Δ`. The sets `{u ∈ Δ | t < ρ u}` and
  `{u ∈ Δ | ρ u < t}` are relatively open by Lemma 2.17 and continuity of `u ↦ t u`.
-/

@[expose] public section

open Filter Topology

namespace Conjugate

variable {d : ℕ}

/-- The embedding of a real vector into `(Fin d → EReal)`. -/
def toE (v : Fin d → ℝ) : Fin d → EReal := fun j => ((v j : ℝ) : EReal)

/-- The point `r u` of the ray through `u`, as a vector in `[0,∞)^d ⊆ (Fin d → EReal)`. -/
def rayPt (r : ℝ) (u : Fin d → ℝ) : Fin d → EReal := toE fun j => r * u j

lemma continuous_toE : Continuous (toE : (Fin d → ℝ) → Fin d → EReal) :=
  continuous_pi fun j => continuous_coe_real_ereal.comp (continuous_apply j)

lemma continuous_rayPt (t : ℝ) : Continuous (rayPt t : (Fin d → ℝ) → Fin d → EReal) :=
  continuous_toE.comp (continuous_pi fun j => continuous_const.mul (continuous_apply j))

lemma toE_nonneg {v : Fin d → ℝ} (hv : ∀ j, 0 ≤ v j) (j : Fin d) : 0 ≤ toE v j := by
  simp only [toE]
  exact_mod_cast hv j

lemma toE_ne_top (v : Fin d → ℝ) (j : Fin d) : toE v j ≠ ⊤ :=
  EReal.coe_ne_top _

lemma rayPt_nonneg {r : ℝ} (hr : 0 ≤ r) {u : Fin d → ℝ} (hu : ∀ j, 0 ≤ u j) (j : Fin d) :
    0 ≤ rayPt r u j :=
  toE_nonneg (fun j => mul_nonneg hr (hu j)) j

lemma rayPt_ne_top (r : ℝ) (u : Fin d → ℝ) (j : Fin d) : rayPt r u j ≠ ⊤ :=
  EReal.coe_ne_top _

/-- A point of the simplex has nonnegative coordinates. -/
lemma simplex_nonneg {u : Fin d → ℝ} (hu : (∀ j, 0 ≤ u j) ∧ ∑ j, u j = 1) (j : Fin d) :
    0 ≤ u j := hu.1 j

/-- A point of the simplex is nonzero. -/
lemma simplex_ne_zero {u : Fin d → ℝ} (hu : (∀ j, 0 ≤ u j) ∧ ∑ j, u j = 1) : u ≠ 0 := by
  rintro rfl
  simp at hu

/-- **The ray parameter** `ρ(u)`: a chosen `r > 0` with `r u ∉ S₀ ∪ S∞`
(unique for `u ≥ 0`, `u ≠ 0` by Lemma 2.18). -/
noncomputable def rayParam (μ : Fin d → PMF (Fin d →₀ ℕ)) (u : Fin d → ℝ) : ℝ :=
  Classical.epsilon fun r : ℝ => 0 < r ∧ rayPt r u ∉ basinZero μ ∪ basinInfty μ

section Spec

variable (μ : Fin d → PMF (Fin d →₀ ℕ)) (hI : IsSubcritical μ)
  (hII : IsPositiveRegular μ ∧ IsNonsingular μ)
  (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j})
include hI hII hIII

/-- The defining property of `ρ(u)` (Lemma 2.18, existence). -/
theorem rayParam_spec {u : Fin d → ℝ} (hu0 : ∀ j, 0 ≤ u j) (hu : u ≠ 0) :
    0 < rayParam μ u ∧ rayPt (rayParam μ u) u ∉ basinZero μ ∪ basinInfty μ :=
  Classical.epsilon_spec (existsUnique_ray μ hI hII hIII hu0 hu).exists

/-- `ρ(u)` is the only `r > 0` with `r u ∉ S₀ ∪ S∞` (Lemma 2.18, uniqueness). -/
theorem eq_rayParam {u : Fin d → ℝ} (hu0 : ∀ j, 0 ≤ u j) (hu : u ≠ 0) {r : ℝ} (hr : 0 < r)
    (h : rayPt r u ∉ basinZero μ ∪ basinInfty μ) : r = rayParam μ u :=
  (existsUnique_ray μ hI hII hIII hu0 hu).unique ⟨hr, h⟩ (rayParam_spec μ hI hII hIII hu0 hu)

/-- `ρ(u) > 0` on the simplex. -/
theorem rayParam_pos {u : Fin d → ℝ} (hu : (∀ j, 0 ≤ u j) ∧ ∑ j, u j = 1) :
    0 < rayParam μ u :=
  (rayParam_spec μ hI hII hIII hu.1 (simplex_ne_zero hu)).1

/-- For `t > 0`: `t < ρ(u) ↔ t u ∈ S₀`. -/
theorem lt_rayParam_iff {u : Fin d → ℝ} (hu0 : ∀ j, 0 ≤ u j) (hu : u ≠ 0) {t : ℝ} (ht : 0 < t) :
    t < rayParam μ u ↔ rayPt t u ∈ basinZero μ := by
  obtain ⟨hρ, hmem⟩ := rayParam_spec μ hI hII hIII hu0 hu
  have hmem0 : rayPt (rayParam μ u) u ∉ basinZero μ := fun h => hmem (Or.inl h)
  have hmemI : rayPt (rayParam μ u) u ∉ basinInfty μ := fun h => hmem (Or.inr h)
  constructor
  · intro h
    exact ray_mem_basinZero_of_not_mem_basinInfty μ hI hII hIII hu0 ht.le h hmemI
  · intro h
    rcases lt_trichotomy t (rayParam μ u) with h' | h' | h'
    · exact h'
    · exact absurd (h' ▸ h) hmem0
    · have h1 := ray_mem_basinInfty_of_not_mem_basinZero μ hI hII hIII hu0 hρ.le h' hmem0
      exact absurd ⟨h, h1⟩ (Set.eq_empty_iff_forall_notMem.1 (basinZero_inter_basinInfty μ) _)

/-- For `t > 0`: `ρ(u) < t ↔ t u ∈ S∞`. -/
theorem rayParam_lt_iff {u : Fin d → ℝ} (hu0 : ∀ j, 0 ≤ u j) (hu : u ≠ 0) {t : ℝ} (ht : 0 < t) :
    rayParam μ u < t ↔ rayPt t u ∈ basinInfty μ := by
  obtain ⟨hρ, hmem⟩ := rayParam_spec μ hI hII hIII hu0 hu
  have hmem0 : rayPt (rayParam μ u) u ∉ basinZero μ := fun h => hmem (Or.inl h)
  have hmemI : rayPt (rayParam μ u) u ∉ basinInfty μ := fun h => hmem (Or.inr h)
  constructor
  · intro h
    exact ray_mem_basinInfty_of_not_mem_basinZero μ hI hII hIII hu0 hρ.le h hmem0
  · intro h
    rcases lt_trichotomy t (rayParam μ u) with h' | h' | h'
    · have h1 := ray_mem_basinZero_of_not_mem_basinInfty μ hI hII hIII hu0 ht.le h' hmemI
      exact absurd ⟨h1, h⟩ (Set.eq_empty_iff_forall_notMem.1 (basinZero_inter_basinInfty μ) _)
    · exact absurd (h' ▸ h) hmemI
    · exact h'

/-- **The ray parameter is continuous on the simplex** (paper.tex:894-896, replacing the
compactness-and-homeomorphism argument): the sets `{u ∈ Δ | t < ρ u}` and `{u ∈ Δ | ρ u < t}`
are relatively open by Lemma 2.17, for every `t > 0`. -/
theorem continuousOn_rayParam :
    ContinuousOn (rayParam μ) {u : Fin d → ℝ | (∀ j, 0 ≤ u j) ∧ ∑ j, u j = 1} := by
  obtain ⟨U₀, hU₀, hS₀⟩ := exists_isOpen_basinZero μ hI hII hIII
  obtain ⟨U₁, hU₁, hS₁⟩ := exists_isOpen_basinInfty μ hI hII hIII
  intro u₀ hu₀
  have hΔ : ∀ᶠ u in 𝓝[{u : Fin d → ℝ | (∀ j, 0 ≤ u j) ∧ ∑ j, u j = 1}] u₀,
      (∀ j, 0 ≤ u j) ∧ ∑ j, u j = 1 := self_mem_nhdsWithin
  rw [ContinuousWithinAt, tendsto_order]
  constructor
  · intro a ha
    by_cases ha0 : a ≤ 0
    · filter_upwards [hΔ] with u hu
      exact lt_of_le_of_lt ha0 (rayParam_pos μ hI hII hIII hu)
    · push Not at ha0
      have hmem : rayPt a u₀ ∈ basinZero μ :=
        (lt_rayParam_iff μ hI hII hIII hu₀.1 (simplex_ne_zero hu₀) ha0).1 ha
      rw [hS₀] at hmem
      have hV : rayPt a ⁻¹' U₀ ∈ 𝓝 u₀ := (hU₀.preimage (continuous_rayPt a)).mem_nhds hmem.1
      filter_upwards [nhdsWithin_le_nhds hV, hΔ] with u hu hΔu
      refine (lt_rayParam_iff μ hI hII hIII hΔu.1 (simplex_ne_zero hΔu) ha0).2 ?_
      rw [hS₀]
      exact ⟨hu, rayPt_nonneg ha0.le hΔu.1⟩
  · intro a ha
    have ha0 : 0 < a := lt_trans (rayParam_pos μ hI hII hIII hu₀) ha
    have hmem : rayPt a u₀ ∈ basinInfty μ :=
      (rayParam_lt_iff μ hI hII hIII hu₀.1 (simplex_ne_zero hu₀) ha0).1 ha
    rw [hS₁] at hmem
    have hV : rayPt a ⁻¹' U₁ ∈ 𝓝 u₀ := (hU₁.preimage (continuous_rayPt a)).mem_nhds hmem.1
    filter_upwards [nhdsWithin_le_nhds hV, hΔ] with u hu hΔu
    refine (rayParam_lt_iff μ hI hII hIII hΔu.1 (simplex_ne_zero hΔu) ha0).2 ?_
    rw [hS₁]
    exact ⟨hu, rayPt_nonneg ha0.le hΔu.1⟩

end Spec

end Conjugate

end
