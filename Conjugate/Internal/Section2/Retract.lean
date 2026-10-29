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
public import Conjugate.Internal.Section2.AssemblyRay
public import Mathlib.Analysis.Normed.Module.Basic
public import Mathlib.Analysis.Normed.Group.Constructions
import Conjugate.Internal.Section2.Attractive

/-!
# The annulus `A` deformation retracts onto `Λ` (Lemma 2.19)

Paper.tex:851-891. Write `Λ = [0,∞)^d ∖ (S₀ ∪ S∞)` (as a set of real vectors) and, for `r, R > 0`,
`A = {u ∈ [0,∞)^d : r ≤ ‖u‖ ≤ R}`. The norm `‖·‖` is the sup norm, as in the ruling on (2.9).

* `retract_bounds`: by Lemma 2.15 (`exists_mem_basinZero_of_le`), `[0,ε]^d ⊆ S₀`, and by
  Lemma 2.16 (`exists_attractive_infty`) together with display (2.10), a vector with a coordinate
  `> C` lies in `S∞`. Hence there are `R > r > 0` with `Λ ⊆ A`;
* `retractHomotopy μ (t, u) = (1 - t) u + t φ(π u)`, where `π u = u / ∑ⱼ uⱼ` is the radial
  projection onto the standard simplex `Δ` and `φ v = ρ(v) v`, with `ρ = rayParam μ` the ray
  parameter of Lemma 2.18 (`existsUnique_ray`). This is (2.13) with the simplex in place of the
  unit sphere; `φ` is continuous because `ρ` is (`continuousOn_rayParam`), so no compactness
  argument is needed;
* `exists_deformationRetract`: **Lemma 2.19**, the homotopy is a strong deformation retraction of
  `A` onto `Λ`. Points of `A` and their images under `φ ∘ π` lie on the same ray, and the sup norm
  is positively homogeneous, so `‖H(t, u)‖ = (1 - t) ‖u‖ + t ‖φ(π u)‖ ∈ [r, R]`.
-/

public section

open Topology

namespace Conjugate

variable {d : ℕ}

section Helpers

/-- On the nonnegative orthant the sup norm is at most the sum of the coordinates. -/
lemma norm_le_sum_of_nonneg {u : Fin d → ℝ} (hu : ∀ j, 0 ≤ u j) : ‖u‖ ≤ ∑ j, u j := by
  refine (pi_norm_le_iff_of_nonneg (Finset.sum_nonneg fun j _ => hu j)).2 fun j => ?_
  rw [Real.norm_of_nonneg (hu j)]
  exact Finset.single_le_sum (f := u) (fun i _ => hu i) (Finset.mem_univ j)

/-- On the nonnegative orthant, each coordinate is at most the sup norm. -/
lemma le_norm_of_nonneg {u : Fin d → ℝ} (hu : ∀ j, 0 ≤ u j) (j : Fin d) : u j ≤ ‖u‖ := by
  have := norm_le_pi_norm u j
  rwa [Real.norm_of_nonneg (hu j)] at this

/-- The radial projection `π u = u / ∑ⱼ uⱼ` onto the standard simplex. -/
noncomputable def simplexProj (u : Fin d → ℝ) : Fin d → ℝ := (∑ j, u j)⁻¹ • u

/-- The radial projection of a nonnegative vector with positive coordinate sum lies in the
standard simplex. -/
lemma simplexProj_mem {u : Fin d → ℝ} (hu0 : ∀ j, 0 ≤ u j) (hs : 0 < ∑ j, u j) :
    (∀ j, 0 ≤ simplexProj u j) ∧ ∑ j, simplexProj u j = 1 := by
  refine ⟨fun j => ?_, ?_⟩
  · simp only [simplexProj, Pi.smul_apply, smul_eq_mul]
    exact mul_nonneg (inv_nonneg.2 hs.le) (hu0 j)
  · simp only [simplexProj, Pi.smul_apply, smul_eq_mul, ← Finset.mul_sum]
    exact inv_mul_cancel₀ hs.ne'

/-- **Choice of `r` and `R`** (paper.tex:858-860): every `u ∈ [0,∞)^d ∖ (S₀ ∪ S∞)` has
`r ≤ ‖u‖ ≤ R`, for suitable `R > r > 0`. By Lemma 2.15, `[0,ε]^d ⊆ S₀`; by Lemma 2.16 and (2.10), a
vector with a coordinate `> C` lies in `S∞`. Take `r = ε`, `R = max C (2 ε)`. -/
theorem retract_bounds (μ : Fin d → PMF (Fin d →₀ ℕ)) (hI : IsSubcritical μ)
    (hII : IsPositiveRegular μ ∧ IsNonsingular μ)
    (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j}) :
    ∃ r R : ℝ, 0 < r ∧ r < R ∧ ∀ u : Fin d → ℝ, (∀ j, 0 ≤ u j) →
      (fun j => (u j : EReal)) ∉ basinZero μ ∪ basinInfty μ → r ≤ ‖u‖ ∧ ‖u‖ ≤ R := by
  obtain ⟨ε, hε0, hε⟩ := exists_mem_basinZero_of_le μ hI hII hIII
  obtain ⟨C, hC0, N, hN1, hC⟩ := exists_attractive_infty μ hI hII hIII
  refine ⟨ε, max C (2 * ε), hε0, lt_max_of_lt_right (by linarith), fun u hu0 hu => ⟨?_, ?_⟩⟩
  · by_contra hlt
    push Not at hlt
    refine hu (Or.inl (hε _ fun j => ⟨?_, ?_⟩))
    · exact_mod_cast hu0 j
    · exact_mod_cast (le_norm_of_nonneg hu0 j).trans hlt.le
  · refine le_trans ?_ (le_max_left _ _)
    by_contra hlt
    push Not at hlt
    obtain ⟨j, hj⟩ : ∃ j, C < u j := by
      by_contra hno
      push Not at hno
      refine absurd ((pi_norm_le_iff_of_nonneg hC0.le).2 fun j => ?_) (not_le.2 hlt)
      rw [Real.norm_of_nonneg (hu0 j)]
      exact hno j
    refine hu (Or.inr ⟨fun j => by beta_reduce; exact_mod_cast hu0 j, ?_⟩)
    exact (hC _ (fun j => ⟨by exact_mod_cast hu0 j, EReal.coe_lt_top _⟩)
      ⟨j, by exact_mod_cast hj⟩).2.limsup_eq

end Helpers

/-- **The homotopy** (2.13), with the radial projection `π` onto the simplex:
`H(t, u) = (1 - t) u + t φ(π u)`, where `φ v = ρ(v) v` and `ρ = rayParam μ`. -/
noncomputable def retractHomotopy (μ : Fin d → PMF (Fin d →₀ ℕ)) (p : ℝ × (Fin d → ℝ)) :
    Fin d → ℝ :=
  (1 - p.1) • p.2 + p.1 • (rayParam μ (simplexProj p.2) • simplexProj p.2)

/-- On the ray through `u`, the point `φ(π u)` is `c • u` for the positive constant
`c = ρ(π u) / ∑ⱼ uⱼ`. -/
lemma retractHomotopy_eq (μ : Fin d → PMF (Fin d →₀ ℕ)) {u : Fin d → ℝ} (t : ℝ) :
    retractHomotopy μ (t, u) =
      ((1 - t) + t * (rayParam μ (simplexProj u) * (∑ j, u j)⁻¹)) • u := by
  simp only [retractHomotopy, simplexProj, smul_smul, add_smul]

section Spec

variable (μ : Fin d → PMF (Fin d →₀ ℕ)) (hI : IsSubcritical μ)
  (hII : IsPositiveRegular μ ∧ IsNonsingular μ)
  (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j})
include hI hII hIII

/-- `φ(w) = ρ(w) w ∈ Λ` for `w` in the simplex. -/
lemma rayParam_smul_mem {w : Fin d → ℝ} (hw : (∀ j, 0 ≤ w j) ∧ ∑ j, w j = 1) :
    (∀ j, 0 ≤ (rayParam μ w • w) j) ∧
      (fun j => ((rayParam μ w • w) j : EReal)) ∉ basinZero μ ∪ basinInfty μ := by
  obtain ⟨hρ, hmem⟩ := rayParam_spec μ hI hII hIII hw.1 (simplex_ne_zero hw)
  exact ⟨fun j => mul_nonneg hρ.le (hw.1 j), hmem⟩

end Spec

/-- **Lemma 2.19** (paper.tex:851-891). There are `R > r > 0` such that the annulus
`A = {u ∈ [0,∞)^d : r ≤ ‖u‖ ≤ R}` strongly deformation retracts onto
`Λ = [0,∞)^d ∖ (S₀ ∪ S∞)`. The norm is the sup norm (ruling on (2.9)). The homotopy is
`H(t, u) = (1 - t) u + t φ(π u)` with `π` the radial projection onto the simplex and `φ` the ray
map `v ↦ ρ(v) v` (Lemma 2.18), see `retractHomotopy`. -/
theorem exists_deformationRetract {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hI : IsSubcritical μ) (hII : IsPositiveRegular μ ∧ IsNonsingular μ)
    (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j}) :
    ∃ r R : ℝ, 0 < r ∧ r < R ∧
      let A : Set (Fin d → ℝ) := {u | (∀ j, 0 ≤ u j) ∧ r ≤ ‖u‖ ∧ ‖u‖ ≤ R}
      let Λ : Set (Fin d → ℝ) :=
        {u | (∀ j, 0 ≤ u j) ∧ (fun j => (u j : EReal)) ∉ basinZero μ ∪ basinInfty μ}
      Λ ⊆ A ∧ ∃ H : ℝ × (Fin d → ℝ) → (Fin d → ℝ),
        ContinuousOn H (Set.Icc 0 1 ×ˢ A) ∧
        (∀ t ∈ Set.Icc (0 : ℝ) 1, ∀ u ∈ A, H (t, u) ∈ A) ∧
        (∀ u ∈ A, H (0, u) = u) ∧ (∀ u ∈ A, H (1, u) ∈ Λ) ∧
        (∀ t ∈ Set.Icc (0 : ℝ) 1, ∀ u ∈ Λ, H (t, u) = u) := by
  obtain ⟨r, R, hr0, hrR, hbd⟩ := retract_bounds μ hI hII hIII
  refine ⟨r, R, hr0, hrR, ?_⟩
  intro A Λ
  have hΛA : Λ ⊆ A := fun u hu => ⟨hu.1, hbd u hu.1 hu.2⟩
  -- the coordinate sum is positive on `A`
  have hsum : ∀ u ∈ A, 0 < ∑ j, u j := fun u hu =>
    lt_of_lt_of_le hr0 (hu.2.1.trans (norm_le_sum_of_nonneg hu.1))
  -- `φ(π u) ∈ Λ` for `u ∈ A`
  have hφΛ : ∀ u ∈ A, rayParam μ (simplexProj u) • simplexProj u ∈ Λ := fun u hu =>
    rayParam_smul_mem μ hI hII hIII (simplexProj_mem hu.1 (hsum u hu))
  refine ⟨hΛA, retractHomotopy μ, ?_, ?_, ?_, ?_, ?_⟩
  · -- continuity
    have hπ : ContinuousOn (simplexProj : (Fin d → ℝ) → Fin d → ℝ) A := by
      refine ContinuousOn.smul (ContinuousOn.inv₀ ?_ fun u hu => (hsum u hu).ne') continuousOn_id
      exact continuousOn_finsetSum _ fun j _ => (continuous_apply j).continuousOn
    have hπ' : ContinuousOn (fun p : ℝ × (Fin d → ℝ) => simplexProj p.2)
        (Set.Icc 0 1 ×ˢ A) := hπ.comp continuousOn_snd fun p hp => hp.2
    have hρπ : ContinuousOn (fun p : ℝ × (Fin d → ℝ) => rayParam μ (simplexProj p.2))
        (Set.Icc 0 1 ×ˢ A) :=
      (continuousOn_rayParam μ hI hII hIII).comp hπ' fun p hp =>
        simplexProj_mem hp.2.1 (hsum p.2 hp.2)
    exact ((continuousOn_const.sub continuousOn_fst).smul continuousOn_snd).add
      (continuousOn_fst.smul (hρπ.smul hπ'))
  · -- `H` maps `A` to itself
    intro t ht u hu
    have hs := hsum u hu
    have hw := simplexProj_mem hu.1 hs
    have hρ := rayParam_pos μ hI hII hIII hw
    set c : ℝ := rayParam μ (simplexProj u) * (∑ j, u j)⁻¹ with hc
    have hc0 : 0 ≤ c := mul_nonneg hρ.le (inv_nonneg.2 hs.le)
    have hk0 : 0 ≤ (1 - t) + t * c := add_nonneg (sub_nonneg.2 ht.2) (mul_nonneg ht.1 hc0)
    have hφ : rayParam μ (simplexProj u) • simplexProj u = c • u := by
      simp only [hc, simplexProj, smul_smul]
    have hφA : c • u ∈ A := hφ ▸ hΛA (hφΛ u hu)
    have hφn : r ≤ c * ‖u‖ ∧ c * ‖u‖ ≤ R := by
      have := hφA.2
      rwa [norm_smul_of_nonneg hc0] at this
    rw [retractHomotopy_eq μ t]
    refine ⟨fun j => ?_, ?_⟩
    · simp only [Pi.smul_apply, smul_eq_mul]
      exact mul_nonneg hk0 (hu.1 j)
    · rw [norm_smul_of_nonneg hk0]
      have h1 : r ≤ ‖u‖ := hu.2.1
      have h2 : ‖u‖ ≤ R := hu.2.2
      have e : ((1 - t) + t * c) * ‖u‖ = (1 - t) * ‖u‖ + t * (c * ‖u‖) := by ring
      rw [e]
      have ht1 : 0 ≤ 1 - t := sub_nonneg.2 ht.2
      constructor
      · nlinarith [mul_le_mul_of_nonneg_left h1 ht1, mul_le_mul_of_nonneg_left hφn.1 ht.1]
      · nlinarith [mul_le_mul_of_nonneg_left h2 ht1, mul_le_mul_of_nonneg_left hφn.2 ht.1]
  · -- `H(0, u) = u`
    intro u _
    simp [retractHomotopy]
  · -- `H(1, u) = φ(π u) ∈ Λ`
    intro u hu
    have : retractHomotopy μ (1, u) = rayParam μ (simplexProj u) • simplexProj u := by
      simp [retractHomotopy]
    rw [this]
    exact hφΛ u hu
  · -- `H(t, u) = u` for `u ∈ Λ`
    intro t _ u hu
    have huA : u ∈ A := hΛA hu
    have hs := hsum u huA
    have hw := simplexProj_mem hu.1 hs
    have hu' : (fun j => (((∑ j, u j) • simplexProj u) j : EReal)) ∉
        basinZero μ ∪ basinInfty μ := by
      have : (∑ j, u j) • simplexProj u = u := by
        simp only [simplexProj, smul_smul, mul_inv_cancel₀ hs.ne', one_smul]
      rw [this]
      exact hu.2
    have hρ : ∑ j, u j = rayParam μ (simplexProj u) :=
      eq_rayParam μ hI hII hIII hw.1 (simplex_ne_zero hw) hs hu'
    have hφ : rayParam μ (simplexProj u) • simplexProj u = u := by
      rw [← hρ]
      simp only [simplexProj, smul_smul, mul_inv_cancel₀ hs.ne', one_smul]
    simp only [retractHomotopy, hφ]
    rw [← add_smul]
    simp

end Conjugate

end
