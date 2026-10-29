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
import Conjugate.Infrastructure.Brouwer
import Conjugate.Internal.Analytic.LogGenFun
import Conjugate.Internal.Section2.BasinInvariance
import Conjugate.Internal.Section2.Strict

/-!
# The self-map of the simplex (assembly of Theorem 2.7)

Paper.tex:894-899. With `ρ = rayParam μ` from `Conjugate.Internal.Section2.AssemblyRay` and
`g = logGenFun μ`, for `u` in the standard simplex `Δ` put `φ(u) = ρ(u) u` (the point `rayPt
(ρ u) u`), `G(u) = toReal ∘ g(φ(u))` and `F(u) = G(u) / ∑_j G(u)_j`.

* `logGenFun_rayPt_eq_toE`: `g(φ(u))` is a finite nonnegative vector, and `G(u) ≠ 0`
  (`g(Λ) ⊆ Λ`, from Lemma 2.18, display (2.8), and `0 ∈ S₀`);
* `simplexMap_mem`, `continuousOn_simplexMap`: `F` is a continuous self-map of `Δ`;
* `exists_logGenFun_rayPt_eq`: Brouwer's theorem on the simplex gives `u*` with `F(u*) = u*`,
  and then uniqueness in Lemma 2.17 gives `g(φ(u*)) = φ(u*)`.
-/

@[expose] public section

open Filter Topology

namespace Conjugate

variable {d : ℕ}

/-- The map `G(u) = toReal ∘ g(ρ(u) u)`. -/
noncomputable def gMap (μ : Fin d → PMF (Fin d →₀ ℕ)) (u : Fin d → ℝ) : Fin d → ℝ :=
  fun j => (logGenFun μ (rayPt (rayParam μ u) u) j).toReal

/-- The map `F(u) = G(u) / ∑_j G(u)_j` of the simplex to itself. -/
noncomputable def simplexMap (μ : Fin d → PMF (Fin d →₀ ℕ)) (u : Fin d → ℝ) : Fin d → ℝ :=
  fun j => gMap μ u j / ∑ i, gMap μ u i

/-- `0 ∈ S₀`, since `g(0) = 0`. -/
lemma zero_mem_basinZero (μ : Fin d → PMF (Fin d →₀ ℕ)) : (0 : Fin d → EReal) ∈ basinZero μ := by
  refine ⟨fun j => le_refl _, ?_⟩
  have h : ∀ n, (logGenFun μ)^[n] (0 : Fin d → EReal) = 0 := fun n =>
    Function.iterate_fixed (logGenFun_zero μ) n
  simp only [h]
  simp

section Spec

variable (μ : Fin d → PMF (Fin d →₀ ℕ)) (hI : IsSubcritical μ)
  (hII : IsPositiveRegular μ ∧ IsNonsingular μ)
  (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j})
include hI hII hIII

/-- `g(Λ) ⊆ Λ` for the ray point `φ(u)`: `g(φ(u))` is nonnegative, finite, and outside
`S₀ ∪ S∞` (paper.tex:896). -/
theorem logGenFun_rayPt_spec {u : Fin d → ℝ} (hu : (∀ j, 0 ≤ u j) ∧ ∑ j, u j = 1) :
    (∀ j, 0 ≤ logGenFun μ (rayPt (rayParam μ u) u) j) ∧
    (∀ j, logGenFun μ (rayPt (rayParam μ u) u) j ≠ ⊤) ∧
    logGenFun μ (rayPt (rayParam μ u) u) ∉ basinZero μ ∪ basinInfty μ := by
  obtain ⟨hρ, hmem⟩ := rayParam_spec μ hI hII hIII hu.1 (simplex_ne_zero hu)
  have hlam0 : ∀ j, 0 ≤ rayPt (rayParam μ u) u j := rayPt_nonneg hρ.le hu.1
  have hg0 : ∀ j, 0 ≤ logGenFun μ (rayPt (rayParam μ u) u) j := mapsTo_logGenFun μ hlam0
  have hgΛ : logGenFun μ (rayPt (rayParam μ u) u) ∉ basinZero μ ∪ basinInfty μ := by
    rintro (h | h)
    · exact hmem (Or.inl ((logGenFun_mem_basinZero_iff μ hlam0).1 h))
    · exact hmem (Or.inr ((logGenFun_mem_basinInfty_iff μ hlam0).1 h))
  refine ⟨hg0, fun j hj => hgΛ (Or.inr ?_), hgΛ⟩
  exact mem_basinInfty_of_exists_eq_top μ hII.1 hg0 ⟨j, hj⟩

/-- `g(φ(u)) = G(u)` as vectors in `(Fin d → EReal)`. -/
theorem logGenFun_rayPt_eq_toE {u : Fin d → ℝ} (hu : (∀ j, 0 ≤ u j) ∧ ∑ j, u j = 1) :
    logGenFun μ (rayPt (rayParam μ u) u) = toE (gMap μ u) := by
  obtain ⟨hg0, hgfin, -⟩ := logGenFun_rayPt_spec μ hI hII hIII hu
  funext j
  simp only [toE, gMap]
  exact (EReal.coe_toReal (hgfin j) (ne_bot_of_le_ne_bot (by simp) (hg0 j))).symm

/-- `G(u) ≥ 0`. -/
theorem gMap_nonneg {u : Fin d → ℝ} (hu : (∀ j, 0 ≤ u j) ∧ ∑ j, u j = 1) (j : Fin d) :
    0 ≤ gMap μ u j :=
  EReal.toReal_nonneg ((logGenFun_rayPt_spec μ hI hII hIII hu).1 j)

/-- `G(u) ≠ 0`, since `g(φ(u)) ∉ S₀` and `0 ∈ S₀`. -/
theorem gMap_ne_zero {u : Fin d → ℝ} (hu : (∀ j, 0 ≤ u j) ∧ ∑ j, u j = 1) : gMap μ u ≠ 0 := by
  intro h
  have h0 : toE (gMap μ u) = 0 := by
    rw [h]
    funext j
    simp [toE]
  have := (logGenFun_rayPt_spec μ hI hII hIII hu).2.2
  rw [logGenFun_rayPt_eq_toE μ hI hII hIII hu, h0] at this
  exact this (Or.inl (zero_mem_basinZero μ))

/-- `∑_j G(u)_j > 0`. -/
theorem sum_gMap_pos {u : Fin d → ℝ} (hu : (∀ j, 0 ≤ u j) ∧ ∑ j, u j = 1) :
    0 < ∑ j, gMap μ u j := by
  refine lt_of_le_of_ne (Finset.sum_nonneg fun j _ => gMap_nonneg μ hI hII hIII hu j) ?_
  intro h
  refine gMap_ne_zero μ hI hII hIII hu (funext fun j => ?_)
  exact (Finset.sum_eq_zero_iff_of_nonneg fun j _ => gMap_nonneg μ hI hII hIII hu j).1
    h.symm j (Finset.mem_univ j)

/-- `F` maps the simplex to itself. -/
theorem simplexMap_mem {u : Fin d → ℝ} (hu : (∀ j, 0 ≤ u j) ∧ ∑ j, u j = 1) :
    (∀ j, 0 ≤ simplexMap μ u j) ∧ ∑ j, simplexMap μ u j = 1 := by
  have hs := sum_gMap_pos μ hI hII hIII hu
  refine ⟨fun j => div_nonneg (gMap_nonneg μ hI hII hIII hu j) hs.le, ?_⟩
  simp only [simplexMap]
  rw [← Finset.sum_div, div_self hs.ne']

/-- **`F` is continuous on the simplex** (paper.tex:896-899): `g` is continuous on `[0,∞]^d`
(Hypothesis III), `φ` is continuous (continuity of `ρ`), `toReal` is continuous at finite
points and the denominator is positive. -/
theorem continuousOn_simplexMap :
    ContinuousOn (simplexMap μ) {u : Fin d → ℝ | (∀ j, 0 ≤ u j) ∧ ∑ j, u j = 1} := by
  set Δ : Set (Fin d → ℝ) := {u | (∀ j, 0 ≤ u j) ∧ ∑ j, u j = 1} with hΔ
  have hρ : ContinuousOn (rayParam μ) Δ := continuousOn_rayParam μ hI hII hIII
  have hφ : ContinuousOn (fun u => rayPt (rayParam μ u) u) Δ := by
    refine continuous_toE.comp_continuousOn (continuousOn_pi.2 fun j => ?_)
    exact hρ.mul (continuous_apply j).continuousOn
  have hg : ContinuousOn (logGenFun μ) {x : Fin d → EReal | ∀ j, 0 ≤ x j} := by
    simpa using continuousOn_logGenFun_iterate μ hIII 1
  have hgφ : ContinuousOn (fun u => logGenFun μ (rayPt (rayParam μ u) u)) Δ :=
    hg.comp hφ fun u hu =>
      fun j => rayPt_nonneg (rayParam_pos μ hI hII hIII hu).le hu.1 j
  have hG : ∀ j, ContinuousOn (fun u => gMap μ u j) Δ := fun j => by
    refine EReal.continuousOn_toReal.comp (continuousOn_pi.1 hgφ j) fun u hu => ?_
    obtain ⟨hg0, hgfin, -⟩ := logGenFun_rayPt_spec μ hI hII hIII hu
    simp only [Set.mem_compl_iff, Set.mem_insert_iff, Set.mem_singleton_iff, not_or]
    exact ⟨ne_bot_of_le_ne_bot (by simp) (hg0 j), hgfin j⟩
  refine continuousOn_pi.2 fun j => ?_
  exact (hG j).div (continuousOn_finsetSum _ fun i _ => hG i) fun u hu =>
    (sum_gMap_pos μ hI hII hIII hu).ne'

/-- Brouwer's fixed point theorem on the simplex gives a fixed point of `F`. -/
theorem exists_simplexMap_eq_self :
    ∃ u : Fin d → ℝ, ((∀ j, 0 ≤ u j) ∧ ∑ j, u j = 1) ∧ simplexMap μ u = u := by
  obtain ⟨k, -⟩ := hII.2
  have : Nonempty (Fin d) := ⟨k⟩
  exact Conjugate.Infrastructure.brouwer_simplex (continuousOn_simplexMap μ hI hII hIII)
    fun u hu => simplexMap_mem μ hI hII hIII hu

/-- **The fixed point of `g`** (paper.tex:896-899): there is a vector `u*` of the simplex such
that `φ(u*) = ρ(u*) u*` satisfies `g(φ(u*)) = φ(u*)`. -/
theorem exists_logGenFun_rayPt_eq :
    ∃ u : Fin d → ℝ, ((∀ j, 0 ≤ u j) ∧ ∑ j, u j = 1) ∧
      logGenFun μ (rayPt (rayParam μ u) u) = rayPt (rayParam μ u) u := by
  obtain ⟨u, hu, hfix⟩ := exists_simplexMap_eq_self μ hI hII hIII
  refine ⟨u, hu, ?_⟩
  set s : ℝ := ∑ i, gMap μ u i with hs
  have hspos : 0 < s := sum_gMap_pos μ hI hII hIII hu
  have hGeq : gMap μ u = fun j => s * u j := by
    funext j
    have h := congrFun hfix j
    simp only [simplexMap] at h
    rw [← hs] at h
    field_simp at h
    linarith
  have hray : logGenFun μ (rayPt (rayParam μ u) u) = rayPt s u := by
    rw [logGenFun_rayPt_eq_toE μ hI hII hIII hu, hGeq]
    rfl
  have hsΛ : rayPt s u ∉ basinZero μ ∪ basinInfty μ := by
    rw [← hray]
    exact (logGenFun_rayPt_spec μ hI hII hIII hu).2.2
  have hseq : s = rayParam μ u :=
    eq_rayParam μ hI hII hIII hu.1 (simplex_ne_zero hu) hspos hsΛ
  rw [hray, hseq]

end Spec

end Conjugate

end
