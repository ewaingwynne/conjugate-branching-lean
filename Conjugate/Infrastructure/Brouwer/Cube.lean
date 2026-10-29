/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Infrastructure.Brouwer.Sperner
public import Mathlib.Analysis.SpecificLimits.Basic
public import Mathlib.Topology.MetricSpace.Pseudo.Pi
public import Mathlib.Topology.Sequences

/-!
# Brouwer's fixed point theorem on the cube `[0, 1]^n`

Given a continuous self-map `f` of the cube `[0, 1]^n ⊆ Fin n → ℝ`, we label the grid point
`p / m` by a coordinate `i` with `x i = 1`, if there is one, else by a coordinate `i` with
`f x i < x i`, if there is one, and by `none` otherwise (`cubeLabel`). This labelling is
admissible in the sense of `Sperner.Admissible`, so Sperner's lemma gives a fully labelled cell
of mesh `1 / m` for every `m`. Its vertices `y` satisfy `f y i ≤ y i` for the vertex labelled
`i`, and `y ≤ f y` for the vertex labelled `none`. Letting `m → ∞` along a convergent
subsequence of cells (`IsCompact.tendsto_subseq`) and using the continuity of `f` yields a
fixed point (`brouwer_cube_fin`).
-/

@[expose] public section

namespace Conjugate.Infrastructure

open Filter Topology Sperner

variable {n : ℕ} (f : (Fin n → ℝ) → Fin n → ℝ)

/-- The grid point `p / m` of the cube. -/
noncomputable def gridPt (m : ℕ) (p : Fin n → ℕ) : Fin n → ℝ := fun j => (p j : ℝ) / m

open Classical in
/-- The Sperner labelling attached to `f` at mesh `1 / m`. -/
noncomputable def cubeLabel (m : ℕ) (p : Fin n → ℕ) : Option (Fin n) :=
  if h : ∃ j, p j = m then some h.choose
  else if h' : ∃ i, f (gridPt m p) i < gridPt m p i then some h'.choose
  else none

theorem gridPt_mem {m : ℕ} (hm : 0 < m) {p : Fin n → ℕ} (hp : ∀ j, p j ≤ m) :
    gridPt m p ∈ Set.Icc (0 : Fin n → ℝ) 1 := by
  have hm' : (0 : ℝ) < m := Nat.cast_pos.mpr hm
  refine ⟨fun j => div_nonneg (Nat.cast_nonneg _) hm'.le, fun j => ?_⟩
  exact (div_le_one hm').mpr (Nat.cast_le.mpr (hp j))

theorem cubeLabel_some {m : ℕ} (hm : 0 < m) {p : Fin n → ℕ} (hp : ∀ j, p j ≤ m)
    (hmaps : Set.MapsTo f (Set.Icc 0 1) (Set.Icc 0 1)) {i : Fin n}
    (h : cubeLabel f m p = some i) : f (gridPt m p) i ≤ gridPt m p i ∧ 0 < p i := by
  have hmem := hmaps (gridPt_mem hm hp)
  have hm' : (m : ℝ) ≠ 0 := (Nat.cast_pos.mpr hm).ne'
  unfold cubeLabel at h
  by_cases h1 : ∃ j, p j = m
  · rw [dite_eq_left h1] at h
    obtain rfl := Option.some.inj h
    have hpi := h1.choose_spec
    refine ⟨?_, by omega⟩
    have : gridPt m p h1.choose = 1 := by
      simp only [gridPt, hpi, div_self hm']
    rw [this]
    exact hmem.2 _
  · rw [dite_eq_right h1] at h
    by_cases h2 : ∃ i, f (gridPt m p) i < gridPt m p i
    · rw [dite_eq_left h2] at h
      obtain rfl := Option.some.inj h
      have hlt := h2.choose_spec
      generalize h2.choose = i at hlt ⊢
      refine ⟨hlt.le, ?_⟩
      by_contra hp0
      have h0 : p i = 0 := by omega
      have : gridPt m p i = 0 := by simp [gridPt, h0]
      rw [this] at hlt
      exact absurd (hmem.1 i) (not_le.mpr hlt)
    · rw [dite_eq_right h2] at h
      exact absurd h (Option.some_ne_none _).symm

theorem cubeLabel_none {m : ℕ} {p : Fin n → ℕ} (h : cubeLabel f m p = none) :
    (∀ j, p j ≠ m) ∧ ∀ i, gridPt m p i ≤ f (gridPt m p) i := by
  unfold cubeLabel at h
  by_cases h1 : ∃ j, p j = m
  · rw [dite_eq_left h1] at h
    exact absurd h (Option.some_ne_none _)
  · rw [dite_eq_right h1] at h
    by_cases h2 : ∃ i, f (gridPt m p) i < gridPt m p i
    · rw [dite_eq_left h2] at h
      exact absurd h (Option.some_ne_none _)
    · exact ⟨fun j hj => h1 ⟨j, hj⟩, fun i => not_lt.mp fun hi => h2 ⟨i, hi⟩⟩

theorem admissible_cubeLabel {m : ℕ} (hm : 0 < m)
    (hmaps : Set.MapsTo f (Set.Icc 0 1) (Set.Icc 0 1)) : Admissible m (cubeLabel f m) :=
  ⟨fun _ hp _ h => (cubeLabel_some f hm hp hmaps h).2,
    fun _ hp h j => lt_of_le_of_ne (hp j) ((cubeLabel_none f h).1 j)⟩

/-- The vertices of a cell of mesh `1 / (m + 1)` are within `1 / (m + 1)` of its vertex `0`. -/
theorem dist_gridPt_vert_le (m : ℕ) (c : Cell n) (k : Fin (n + 1)) :
    dist (gridPt (m + 1) (vert c k)) (gridPt (m + 1) (vert c 0)) ≤ 1 / ((m : ℝ) + 1) := by
  have hm : (0 : ℝ) < (m : ℝ) + 1 := by positivity
  rw [dist_pi_le_iff (by positivity)]
  intro j
  have h1 : ((vert c k j : ℕ) : ℝ) ≤ vert c 0 j := Nat.cast_le.mpr (vert_le_vert_zero c k j)
  have h2 : ((vert c 0 j : ℕ) : ℝ) ≤ vert c k j + 1 := by
    exact_mod_cast vert_zero_le_vert_add_one c k j
  simp only [gridPt, Real.dist_eq, Nat.cast_add_one]
  rw [← sub_div, abs_div, abs_of_pos hm, div_le_div_iff_of_pos_right hm, abs_le]
  constructor <;> linarith

/-- **Brouwer's fixed point theorem** for the cube `[0, 1]^n ⊆ Fin n → ℝ`. -/
theorem brouwer_cube_fin {f : (Fin n → ℝ) → Fin n → ℝ}
    (hf : ContinuousOn f (Set.Icc 0 1)) (hmaps : Set.MapsTo f (Set.Icc 0 1) (Set.Icc 0 1)) :
    ∃ x ∈ Set.Icc (0 : Fin n → ℝ) 1, f x = x := by
  -- a fully labelled cell at every mesh `1 / (m + 1)`
  have hcell : ∀ m : ℕ, ∃ c ∈ cells n (m + 1),
      Function.Injective (labels (cubeLabel f (m + 1)) c) :=
    fun m => sperner_cube (Nat.succ_pos m) (admissible_cubeLabel f (Nat.succ_pos m) hmaps)
  choose c hc hinj using hcell
  have hsurj : ∀ m, Function.Surjective (labels (cubeLabel f (m + 1)) (c m)) := fun m =>
    (Finite.injective_iff_surjective_of_equiv (finSuccEquiv n)).mp (hinj m)
  choose idx hidx using hsurj
  -- the vertex `0` of the cells, and the vertices carrying a given label
  set x : ℕ → Fin n → ℝ := fun m => gridPt (m + 1) (vert (c m) 0) with hx
  set y : Option (Fin n) → ℕ → Fin n → ℝ :=
    fun v m => gridPt (m + 1) (vert (c m) (idx m v)) with hy
  have hxmem : ∀ m, x m ∈ Set.Icc (0 : Fin n → ℝ) 1 := fun m =>
    gridPt_mem (Nat.succ_pos m) (vert_le (hc m) 0)
  have hymem : ∀ v m, y v m ∈ Set.Icc (0 : Fin n → ℝ) 1 := fun v m =>
    gridPt_mem (Nat.succ_pos m) (vert_le (hc m) _)
  have hdist : ∀ v m, dist (y v m) (x m) ≤ 1 / ((m : ℝ) + 1) := fun v m =>
    dist_gridPt_vert_le m (c m) (idx m v)
  -- a convergent subsequence
  obtain ⟨z, hz, φ, hφ, hlim⟩ :=
    (isCompact_Icc (a := (0 : Fin n → ℝ)) (b := 1)).tendsto_subseq hxmem
  have hε : Tendsto (fun m => 1 / ((φ m : ℝ) + 1)) atTop (𝓝 0) :=
    tendsto_one_div_add_atTop_nhds_zero_nat.comp hφ.tendsto_atTop
  have hylim : ∀ v, Tendsto (fun m => y v (φ m)) atTop (𝓝 z) := by
    intro v
    refine hlim.congr_dist (squeeze_zero (fun m => dist_nonneg) (fun m => ?_) hε)
    rw [dist_comm]
    exact hdist v (φ m)
  have hfylim : ∀ v, Tendsto (fun m => f (y v (φ m))) atTop (𝓝 (f z)) := fun v =>
    (hf z hz).tendsto.comp
      (tendsto_nhdsWithin_iff.mpr ⟨hylim v, Eventually.of_forall fun m => hymem v (φ m)⟩)
  refine ⟨z, hz, funext fun i => le_antisymm ?_ ?_⟩
  · -- `f z i ≤ z i`, from the vertices labelled `some i`
    refine le_of_tendsto_of_tendsto' (tendsto_pi_nhds.mp (hfylim (some i)) i)
      (tendsto_pi_nhds.mp (hylim (some i)) i) fun m => ?_
    exact (cubeLabel_some f (Nat.succ_pos _) (vert_le (hc _) _) hmaps (hidx _ (some i))).1
  · -- `z i ≤ f z i`, from the vertices labelled `none`
    refine le_of_tendsto_of_tendsto' (tendsto_pi_nhds.mp (hylim none) i)
      (tendsto_pi_nhds.mp (hfylim none) i) fun m => ?_
    exact (cubeLabel_none f (hidx _ none)).2 i

end Conjugate.Infrastructure

end
