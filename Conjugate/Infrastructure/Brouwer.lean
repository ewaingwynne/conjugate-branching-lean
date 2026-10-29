/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Infrastructure.Brouwer.Cube
public import Mathlib.Algebra.BigOperators.Field

/-!
# Brouwer's fixed point theorem on the standard simplex

Source-independent infrastructure. `brouwer_simplex` is Brouwer's fixed point theorem for a
continuous self-map of the standard simplex `{x : ι → ℝ | (∀ i, 0 ≤ x i) ∧ ∑ i, x i = 1}`, for
any nonempty finite type `ι`.

The proof is combinatorial. `Conjugate.Infrastructure.Brouwer.Sperner` proves Sperner's lemma
for Kuhn's triangulation of the cube `{0, …, m}^n` (parity argument by induction on the
dimension), `Conjugate.Infrastructure.Brouwer.Cube` deduces Brouwer's theorem for the cube
`[0, 1]^n ⊆ Fin n → ℝ` by compactness, and this file transfers it to `[0, 1]^ι` by reindexing
(`brouwer_cube`) and to the simplex through the continuous retraction `simplexRetract` of the
cube onto the simplex, `r x i = x i / max (∑ x) 1 + max (1 - ∑ x) 0 / card ι`.
-/

@[expose] public section

namespace Conjugate.Infrastructure

open Finset

/-- **Brouwer's fixed point theorem** for the cube `[0, 1]^ι ⊆ ι → ℝ`, `ι` a finite type. -/
theorem brouwer_cube {ι : Type*} [Finite ι] {f : (ι → ℝ) → ι → ℝ}
    (hf : ContinuousOn f (Set.Icc 0 1)) (hmaps : Set.MapsTo f (Set.Icc 0 1) (Set.Icc 0 1)) :
    ∃ x ∈ Set.Icc (0 : ι → ℝ) 1, f x = x := by
  cases nonempty_fintype ι
  let e := Fintype.equivFin ι
  let T : (Fin (Fintype.card ι) → ℝ) → ι → ℝ := fun y => y ∘ e
  let T' : (ι → ℝ) → Fin (Fintype.card ι) → ℝ := fun x => x ∘ e.symm
  have hT : Continuous T := continuous_pi fun _ => continuous_apply _
  have hT' : Continuous T' := continuous_pi fun _ => continuous_apply _
  have hmem1 : Set.MapsTo T (Set.Icc 0 1) (Set.Icc 0 1) := fun y hy =>
    ⟨fun i => hy.1 (e i), fun i => hy.2 (e i)⟩
  have hmem2 : Set.MapsTo T' (Set.Icc 0 1) (Set.Icc 0 1) := fun x hx =>
    ⟨fun i => hx.1 (e.symm i), fun i => hx.2 (e.symm i)⟩
  have hg : ContinuousOn (T' ∘ f ∘ T) (Set.Icc 0 1) :=
    hT'.comp_continuousOn (hf.comp hT.continuousOn hmem1)
  have hgmaps : Set.MapsTo (T' ∘ f ∘ T) (Set.Icc 0 1) (Set.Icc 0 1) :=
    fun y hy => hmem2 (hmaps (hmem1 hy))
  obtain ⟨y, hy, hgy⟩ := brouwer_cube_fin hg hgmaps
  refine ⟨T y, hmem1 hy, funext fun i => ?_⟩
  have h := congrFun hgy (e i)
  simpa [T, T'] using h

/-- A continuous retraction of the cube `[0, 1]^ι` onto the standard simplex. -/
noncomputable def simplexRetract {ι : Type*} [Fintype ι] (x : ι → ℝ) : ι → ℝ :=
  fun i => x i / max (∑ j, x j) 1 + max (1 - ∑ j, x j) 0 / Fintype.card ι

theorem continuous_simplexRetract {ι : Type*} [Fintype ι] :
    Continuous (simplexRetract (ι := ι)) := by
  have hs : Continuous fun x : ι → ℝ => ∑ j, x j := by fun_prop
  refine continuous_pi fun i => Continuous.add ?_ ?_
  · refine (continuous_apply i).div (hs.max continuous_const) fun x => ?_
    exact (lt_of_lt_of_le one_pos (le_max_right _ _)).ne'
  · exact ((continuous_const.sub hs).max continuous_const).div_const _

theorem simplexRetract_mem {ι : Type*} [Fintype ι] [Nonempty ι] {x : ι → ℝ}
    (hx : x ∈ Set.Icc (0 : ι → ℝ) 1) :
    simplexRetract x ∈ {x : ι → ℝ | (∀ i, 0 ≤ x i) ∧ ∑ i, x i = 1} := by
  have hN : (Fintype.card ι : ℝ) ≠ 0 := Nat.cast_ne_zero.mpr Fintype.card_ne_zero
  refine ⟨fun i => add_nonneg (div_nonneg (hx.1 i) (le_trans zero_le_one (le_max_right _ _)))
    (div_nonneg (le_max_right _ _) (Nat.cast_nonneg _)), ?_⟩
  simp only [simplexRetract]
  rw [sum_add_distrib, ← sum_div, sum_const, card_univ, nsmul_eq_mul, mul_div_cancel₀ _ hN]
  rcases le_or_gt 1 (∑ j, x j) with h | h
  · rw [max_eq_left h, max_eq_right (by linarith), add_zero,
      div_self (lt_of_lt_of_le one_pos h).ne']
  · rw [max_eq_right h.le, max_eq_left (by linarith), div_one]
    ring

theorem simplexRetract_of_mem {ι : Type*} [Fintype ι] {x : ι → ℝ}
    (hx : x ∈ {x : ι → ℝ | (∀ i, 0 ≤ x i) ∧ ∑ i, x i = 1}) : simplexRetract x = x := by
  funext i
  simp only [simplexRetract, hx.2, sub_self, max_self, zero_div, add_zero, div_one]

theorem simplex_subset_Icc {ι : Type*} [Fintype ι] :
    {x : ι → ℝ | (∀ i, 0 ≤ x i) ∧ ∑ i, x i = 1} ⊆ Set.Icc 0 1 := fun x hx =>
  ⟨fun i => hx.1 i, fun i => by
    have h := single_le_sum (fun j _ => hx.1 j) (mem_univ i)
    rw [hx.2] at h
    exact h⟩

/-- **Brouwer's fixed point theorem** for the standard simplex
`{x : ι → ℝ | (∀ i, 0 ≤ x i) ∧ ∑ i, x i = 1}`. -/
theorem brouwer_simplex {ι : Type*} [Fintype ι] [Nonempty ι] {f : (ι → ℝ) → ι → ℝ}
    (hf : ContinuousOn f {x | (∀ i, 0 ≤ x i) ∧ ∑ i, x i = 1})
    (hmaps : Set.MapsTo f {x | (∀ i, 0 ≤ x i) ∧ ∑ i, x i = 1}
      {x | (∀ i, 0 ≤ x i) ∧ ∑ i, x i = 1}) :
    ∃ x, ((∀ i, 0 ≤ x i) ∧ ∑ i, x i = 1) ∧ f x = x := by
  have hg : ContinuousOn (f ∘ simplexRetract) (Set.Icc 0 1) :=
    hf.comp continuous_simplexRetract.continuousOn fun x hx => simplexRetract_mem hx
  have hgmaps : Set.MapsTo (f ∘ simplexRetract) (Set.Icc 0 1) (Set.Icc 0 1) :=
    fun x hx => simplex_subset_Icc (hmaps (simplexRetract_mem hx))
  obtain ⟨x, hx, hfx⟩ := brouwer_cube hg hgmaps
  have hxS : x ∈ {x : ι → ℝ | (∀ i, 0 ≤ x i) ∧ ∑ i, x i = 1} :=
    hfx ▸ hmaps (simplexRetract_mem hx)
  refine ⟨x, hxS, ?_⟩
  rw [Function.comp_apply, simplexRetract_of_mem hxS] at hfx
  exact hfx

end Conjugate.Infrastructure

end
