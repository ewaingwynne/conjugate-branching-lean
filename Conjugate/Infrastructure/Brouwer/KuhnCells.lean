/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Infrastructure.Brouwer.Labels
public import Mathlib.Data.Fin.Tuple.Basic
public import Mathlib.Data.Fintype.Pi
public import Mathlib.GroupTheory.Perm.Fin
public import Mathlib.Logic.Equiv.Fin.Rotate

/-!
# Kuhn's triangulation of the cube

A *cell* of Kuhn's triangulation of the grid `{0, …, m}^n` is a pair `(b, τ)` of a base point
`b : Fin n → ℕ` and a permutation `τ` of `Fin n`. Its `n + 1` vertices are
`vert (b, τ) k = b + 𝟙_{k ≤ τ}` for `k : Fin (n + 1)`, so that `vert (b, τ) 0 = b + 1` and
`vert (b, τ) (Fin.last n) = b`: the coordinate `j` drops from `b j + 1` to `b j` between the
vertices `τ j` and `τ j + 1`. The cells of mesh `m` (`cells n m`) are those with
`b ∈ {0, …, m - 1}^n`.

The facet of a cell opposite one of its vertices is shared with exactly one other cell, unless it
lies on the boundary of the cube. We record this through the explicit map `nb`, which sends a pair
(cell, index of the opposite vertex) to the pair describing the same facet seen from the other
side, or `none` for a boundary facet, and we prove that `nb` is a fixed-point-free partial
involution (`nb_nb`, `nb_ne_self`) preserving the vertices of the facet (`nb_vert`).

Finally `lift`/`lower` identify the cells of mesh `m` in dimension `n` with the cells in
dimension `n + 1` whose facet opposite the vertex `0` lies in the face `x 0 = 0`.
-/

@[expose] public section

namespace Conjugate.Infrastructure.Sperner

open Finset Equiv

/-- A cell of Kuhn's triangulation: a base point and a permutation recording, for each
coordinate `j`, the position `τ j` after which the coordinate drops. -/
abbrev Cell (n : ℕ) := (Fin n → ℕ) × Perm (Fin n)

variable {n m : ℕ}

/-- The vertices of a cell, from `vert c 0 = b + 1` down to `vert c (Fin.last n) = b`. -/
def vert (c : Cell n) (k : Fin (n + 1)) : Fin n → ℕ :=
  fun j => c.1 j + if (k : ℕ) ≤ (c.2 j : ℕ) then 1 else 0

/-- The cells of mesh `m`: base points in `{0, …, m - 1}^n`. -/
def cells (n m : ℕ) : Finset (Cell n) :=
  (Fintype.piFinset fun _ => Finset.range m) ×ˢ Finset.univ

/-- The labels of the vertices of a cell under a labelling `ℓ` of the grid points. -/
def labels (ℓ : (Fin n → ℕ) → Option (Fin n)) (c : Cell n) (k : Fin (n + 1)) : Option (Fin n) :=
  ℓ (vert c k)

theorem mem_cells {c : Cell n} : c ∈ cells n m ↔ ∀ j, c.1 j < m := by
  simp [cells, Fintype.mem_piFinset]

theorem vert_le {c : Cell n} (hc : c ∈ cells n m) (k : Fin (n + 1)) (j : Fin n) :
    vert c k j ≤ m := by
  have := mem_cells.mp hc j
  unfold vert
  split_ifs <;> omega

theorem vert_zero (c : Cell n) (j : Fin n) : vert c 0 j = c.1 j + 1 := by
  simp [vert]

theorem vert_last (c : Cell n) (j : Fin n) : vert c (Fin.last n) j = c.1 j := by
  simp [vert, (c.2 j).isLt.not_ge]

theorem vert_le_vert_zero (c : Cell n) (k : Fin (n + 1)) (j : Fin n) :
    vert c k j ≤ vert c 0 j := by
  rw [vert_zero]; unfold vert
  split_ifs <;> omega

theorem vert_zero_le_vert_add_one (c : Cell n) (k : Fin (n + 1)) (j : Fin n) :
    vert c 0 j ≤ vert c k j + 1 := by
  rw [vert_zero]; unfold vert
  split_ifs <;> omega

/-- On the facet opposite the vertex `0`, the coordinate dropping first is constant. -/
theorem vert_symm_zero {c : Cell (n + 1)} {i : Fin (n + 2)} (hi : i ≠ 0) :
    vert c i (c.2.symm 0) = c.1 (c.2.symm 0) := by
  have h : (i : ℕ) ≠ 0 := fun h => hi (Fin.ext h)
  simp only [vert, apply_symm_apply, Fin.val_zero]
  rw [ite_eq_right (by omega), add_zero]

/-- On the facet opposite the last vertex, the coordinate dropping last is constant. -/
theorem vert_symm_last {c : Cell (n + 1)} {i : Fin (n + 2)} (hi : i ≠ Fin.last (n + 1)) :
    vert c i (c.2.symm (Fin.last n)) = c.1 (c.2.symm (Fin.last n)) + 1 := by
  have h : (i : ℕ) < n + 1 := Fin.val_lt_last hi
  simp only [vert, apply_symm_apply, Fin.val_last]
  rw [ite_eq_left (by omega)]

/-! ### The three neighbours of a cell across a facet -/

/-- The cell across the facet opposite the vertex `0`: the coordinate dropping first is
decremented and the positions are rotated down. -/
def rotDown (c : Cell (n + 1)) : Cell (n + 1) :=
  (Function.update c.1 (c.2.symm 0) (c.1 (c.2.symm 0) - 1), (finRotate (n + 1)).symm * c.2)

/-- The cell across the facet opposite the last vertex: the coordinate dropping last is
incremented and the positions are rotated up. -/
def rotUp (c : Cell (n + 1)) : Cell (n + 1) :=
  (Function.update c.1 (c.2.symm (Fin.last n)) (c.1 (c.2.symm (Fin.last n)) + 1),
    finRotate (n + 1) * c.2)

/-- The cell across the facet opposite an interior vertex `k`: the positions `k - 1` and `k`
are exchanged. -/
def swapCell (c : Cell (n + 1)) (k : Fin (n + 2)) (h0 : k ≠ 0) (hl : k ≠ Fin.last (n + 1)) :
    Cell (n + 1) :=
  (c.1, swap (k.pred h0) (k.castPred hl) * c.2)

theorem finRotate_symm_zero : (finRotate (n + 1)).symm 0 = Fin.last n := by
  rw [symm_apply_eq, finRotate_last]

theorem coe_finRotate_symm_of_ne_zero' {i : Fin (n + 1)} (hi : i ≠ 0) :
    ((finRotate (n + 1)).symm i : ℕ) = i - 1 := by
  have h1 : (finRotate (n + 1)).symm i ≠ Fin.last n := by
    rw [Ne, symm_apply_eq, finRotate_last]; exact hi
  have h2 := coe_finRotate_of_ne_last h1
  rw [apply_symm_apply] at h2
  omega

theorem rotDown_symm_last (c : Cell (n + 1)) :
    (rotDown c).2.symm (Fin.last n) = c.2.symm 0 := by
  simp only [rotDown, symm_apply_eq, Perm.mul_apply, apply_symm_apply, finRotate_symm_zero]

theorem rotUp_symm_zero (c : Cell (n + 1)) :
    (rotUp c).2.symm 0 = c.2.symm (Fin.last n) := by
  simp only [rotUp, symm_apply_eq, Perm.mul_apply, apply_symm_apply, finRotate_last]

theorem rotUp_rotDown {c : Cell (n + 1)} (h : 1 ≤ c.1 (c.2.symm 0)) : rotUp (rotDown c) = c := by
  rw [rotUp, rotDown_symm_last]
  refine Prod.ext ?_ ?_
  · simp only [rotDown, Function.update_self, Function.update_idem]
    rw [Nat.sub_add_cancel h, Function.update_eq_self]
  · simp only [rotDown]
    rw [← Perm.inv_def, mul_inv_cancel_left]

theorem rotDown_rotUp (c : Cell (n + 1)) : rotDown (rotUp c) = c := by
  rw [rotDown, rotUp_symm_zero]
  refine Prod.ext ?_ ?_
  · simp only [rotUp, Function.update_self, Function.update_idem]
    rw [Nat.add_sub_cancel, Function.update_eq_self]
  · simp only [rotUp]
    rw [← Perm.inv_def, inv_mul_cancel_left]

theorem swapCell_swapCell (c : Cell (n + 1)) (k : Fin (n + 2)) (h0 : k ≠ 0)
    (hl : k ≠ Fin.last (n + 1)) : swapCell (swapCell c k h0 hl) k h0 hl = c := by
  simp only [swapCell, swap_mul_self_mul]

theorem swapCell_ne (c : Cell (n + 1)) (k : Fin (n + 2)) (h0 : k ≠ 0)
    (hl : k ≠ Fin.last (n + 1)) : swapCell c k h0 hl ≠ c := by
  intro h
  have h2 := congrArg (fun c' : Cell (n + 1) => c'.2 (c.2.symm (k.pred h0))) h
  simp only [swapCell, Perm.mul_apply, apply_symm_apply, swap_apply_left] at h2
  have := congrArg Fin.val h2
  rw [Fin.coe_castPred, Fin.val_pred] at this
  exact h0 (Fin.ext (by rw [Fin.val_zero]; omega))

/-! ### Vertices of the neighbouring cells -/

theorem vert_rotDown {c : Cell (n + 1)} (h : 1 ≤ c.1 (c.2.symm 0)) (i : Fin (n + 1)) :
    vert (rotDown c) i.castSucc = vert c i.succ := by
  funext j
  by_cases hj : j = c.2.symm 0
  · subst hj
    simp only [vert, rotDown, Perm.mul_apply, Fin.val_castSucc, Fin.val_succ, Function.update_self,
      apply_symm_apply, finRotate_symm_zero, Fin.val_last, Fin.val_zero]
    split_ifs <;> omega
  · have hτ : c.2 j ≠ 0 := fun h' => hj (by rw [← h', symm_apply_apply])
    have hval : (c.2 j : ℕ) ≠ 0 := fun h' => hτ (Fin.ext h')
    simp only [vert, rotDown, Perm.mul_apply, Fin.val_castSucc, Fin.val_succ,
      Function.update_of_ne hj, coe_finRotate_symm_of_ne_zero' hτ]
    split_ifs <;> omega

theorem vert_rotUp (c : Cell (n + 1)) (i : Fin (n + 1)) :
    vert (rotUp c) i.succ = vert c i.castSucc := by
  funext j
  by_cases hj : j = c.2.symm (Fin.last n)
  · subst hj
    simp only [vert, rotUp, Perm.mul_apply, Fin.val_castSucc, Fin.val_succ, Function.update_self,
      apply_symm_apply, finRotate_last, Fin.val_last, Fin.val_zero]
    split_ifs <;> omega
  · have hτ : c.2 j ≠ Fin.last n := fun h' => hj (by rw [← h', symm_apply_apply])
    simp only [vert, rotUp, Perm.mul_apply, Fin.val_castSucc, Fin.val_succ,
      Function.update_of_ne hj, coe_finRotate_of_ne_last hτ]
    split_ifs <;> omega

theorem vert_swapCell (c : Cell (n + 1)) {k : Fin (n + 2)} (h0 : k ≠ 0)
    (hl : k ≠ Fin.last (n + 1)) {i : Fin (n + 2)} (hi : i ≠ k) :
    vert (swapCell c k h0 hl) i = vert c i := by
  funext j
  have hik : (i : ℕ) ≠ (k : ℕ) := fun h => hi (Fin.ext h)
  have hk0 : (k : ℕ) ≠ 0 := fun h => h0 (Fin.ext h)
  by_cases h1 : c.2 j = k.pred h0
  · simp only [vert, swapCell, Perm.mul_apply, h1, swap_apply_left, Fin.coe_castPred, Fin.val_pred]
    split_ifs <;> omega
  · by_cases h2 : c.2 j = k.castPred hl
    · simp only [vert, swapCell, Perm.mul_apply, h2, swap_apply_right, Fin.coe_castPred,
        Fin.val_pred]
      split_ifs <;> omega
    · simp only [vert, swapCell, Perm.mul_apply, swap_apply_of_ne_of_ne h1 h2]

/-! ### Membership of the neighbouring cells -/

theorem rotDown_mem_cells {c : Cell (n + 1)} (hc : c ∈ cells (n + 1) m) :
    rotDown c ∈ cells (n + 1) m := by
  rw [mem_cells] at hc ⊢
  intro j
  simp only [rotDown]
  by_cases hj : j = c.2.symm 0
  · subst hj; rw [Function.update_self]; have := hc (c.2.symm 0); omega
  · rw [Function.update_of_ne hj]; exact hc j

theorem rotUp_mem_cells {c : Cell (n + 1)} (hc : c ∈ cells (n + 1) m)
    (h : c.1 (c.2.symm (Fin.last n)) + 1 < m) : rotUp c ∈ cells (n + 1) m := by
  rw [mem_cells] at hc ⊢
  intro j
  simp only [rotUp]
  by_cases hj : j = c.2.symm (Fin.last n)
  · subst hj; rw [Function.update_self]; exact h
  · rw [Function.update_of_ne hj]; exact hc j

theorem swapCell_mem_cells {c : Cell (n + 1)} (hc : c ∈ cells (n + 1) m) (k : Fin (n + 2))
    (h0 : k ≠ 0) (hl : k ≠ Fin.last (n + 1)) : swapCell c k h0 hl ∈ cells (n + 1) m := by
  rw [mem_cells] at hc ⊢
  exact hc

/-! ### The neighbour map -/

/-- The facet of the cell `f.1` opposite its vertex `f.2`, seen from the other side: the
neighbouring cell together with the index of its vertex opposite the common facet, or `none`
when the facet lies on the boundary of the cube `[0, m]^(n+1)`. -/
def nb (m : ℕ) (f : Cell (n + 1) × Fin (n + 2)) : Option (Cell (n + 1) × Fin (n + 2)) :=
  if h0 : f.2 = 0 then
    if 1 ≤ f.1.1 (f.1.2.symm 0) then some (rotDown f.1, Fin.last (n + 1)) else none
  else if hl : f.2 = Fin.last (n + 1) then
    if f.1.1 (f.1.2.symm (Fin.last n)) + 1 < m then some (rotUp f.1, 0) else none
  else some (swapCell f.1 f.2 h0 hl, f.2)

theorem nb_zero (c : Cell (n + 1)) :
    nb m (c, 0) =
      if 1 ≤ c.1 (c.2.symm 0) then some (rotDown c, Fin.last (n + 1)) else none := by
  rw [nb, dite_eq_left rfl]

theorem nb_last (c : Cell (n + 1)) :
    nb m (c, Fin.last (n + 1)) =
      if c.1 (c.2.symm (Fin.last n)) + 1 < m then some (rotUp c, 0) else none := by
  rw [nb, dite_eq_right Fin.last_pos.ne', dite_eq_left rfl]

theorem nb_mid (c : Cell (n + 1)) {k : Fin (n + 2)} (h0 : k ≠ 0) (hl : k ≠ Fin.last (n + 1)) :
    nb m (c, k) = some (swapCell c k h0 hl, k) := by
  rw [nb, dite_eq_right h0, dite_eq_right hl]

theorem nb_eq_some_cases {f f' : Cell (n + 1) × Fin (n + 2)} (h : nb m f = some f') :
    (f.2 = 0 ∧ 1 ≤ f.1.1 (f.1.2.symm 0) ∧ f' = (rotDown f.1, Fin.last (n + 1))) ∨
    (f.2 = Fin.last (n + 1) ∧ f.1.1 (f.1.2.symm (Fin.last n)) + 1 < m ∧
      f' = (rotUp f.1, 0)) ∨
    (∃ (h0 : f.2 ≠ 0) (hl : f.2 ≠ Fin.last (n + 1)), f' = (swapCell f.1 f.2 h0 hl, f.2)) := by
  obtain ⟨c, k⟩ := f
  dsimp only
  by_cases h0 : k = 0
  · subst h0
    rw [nb_zero] at h
    by_cases h1 : 1 ≤ c.1 (c.2.symm 0)
    · rw [ite_eq_left h1] at h
      exact Or.inl ⟨rfl, h1, (Option.some.inj h).symm⟩
    · rw [ite_eq_right h1] at h
      exact absurd h (Option.some_ne_none _).symm
  · by_cases hl : k = Fin.last (n + 1)
    · subst hl
      rw [nb_last] at h
      by_cases h1 : c.1 (c.2.symm (Fin.last n)) + 1 < m
      · rw [ite_eq_left h1] at h
        exact Or.inr (Or.inl ⟨rfl, h1, (Option.some.inj h).symm⟩)
      · rw [ite_eq_right h1] at h
        exact absurd h (Option.some_ne_none _).symm
    · rw [nb_mid c h0 hl] at h
      exact Or.inr (Or.inr ⟨h0, hl, (Option.some.inj h).symm⟩)

theorem nb_mem {f f' : Cell (n + 1) × Fin (n + 2)} (hf : f.1 ∈ cells (n + 1) m)
    (h : nb m f = some f') : f'.1 ∈ cells (n + 1) m := by
  rcases nb_eq_some_cases h with ⟨-, -, rfl⟩ | ⟨-, hlt, rfl⟩ | ⟨h0, hl, rfl⟩
  · exact rotDown_mem_cells hf
  · exact rotUp_mem_cells hf hlt
  · exact swapCell_mem_cells hf _ h0 hl

/-- `nb` is a partial involution. -/
theorem nb_nb {f f' : Cell (n + 1) × Fin (n + 2)} (hf : f.1 ∈ cells (n + 1) m)
    (h : nb m f = some f') : nb m f' = some f := by
  obtain ⟨c, k⟩ := f
  rcases nb_eq_some_cases h with ⟨hk, h1, rfl⟩ | ⟨hk, hlt, rfl⟩ | ⟨h0, hl, rfl⟩
  · dsimp only at hk h1 hf
    subst hk
    have hcond : (rotDown c).1 (c.2.symm 0) + 1 < m := by
      simp only [rotDown, Function.update_self]
      have := mem_cells.mp hf (c.2.symm 0)
      omega
    rw [nb_last, rotDown_symm_last, ite_eq_left hcond, rotUp_rotDown h1]
  · dsimp only at hk hlt hf
    subst hk
    have hcond : 1 ≤ (rotUp c).1 (c.2.symm (Fin.last n)) := by
      simp only [rotUp, Function.update_self]
      omega
    rw [nb_zero, rotUp_symm_zero, ite_eq_left hcond, rotDown_rotUp]
  · dsimp only at h0 hl
    rw [nb_mid _ h0 hl, swapCell_swapCell]

/-- `nb` has no fixed points. -/
theorem nb_ne_self {f f' : Cell (n + 1) × Fin (n + 2)} (h : nb m f = some f') : f' ≠ f := by
  obtain ⟨c, k⟩ := f
  rcases nb_eq_some_cases h with ⟨hk, -, rfl⟩ | ⟨hk, -, rfl⟩ | ⟨h0, hl, rfl⟩
  · dsimp only at hk
    subst hk
    intro h'
    exact Fin.last_pos.ne' (congrArg Prod.snd h')
  · dsimp only at hk
    subst hk
    intro h'
    exact Fin.last_pos.ne (congrArg Prod.snd h')
  · intro h'
    exact swapCell_ne c k h0 hl (congrArg Prod.fst h')

theorem finRotate_castSucc' (i : Fin n) : finRotate (n + 1) i.castSucc = i.succ := by
  apply Fin.ext
  rw [coe_finRotate_of_ne_last (Fin.castSucc_lt_last i).ne, Fin.val_castSucc, Fin.val_succ]

theorem finRotate_symm_succ' (i : Fin n) : (finRotate (n + 1)).symm i.succ = i.castSucc := by
  rw [symm_apply_eq, finRotate_castSucc']

/-- The labels of a facet are the same from both sides: goodness is preserved by `nb`. -/
theorem goodFacet_nb {ℓ : (Fin (n + 1) → ℕ) → Option (Fin (n + 1))}
    {f f' : Cell (n + 1) × Fin (n + 2)} (h : nb m f = some f')
    (hg : GoodFacet (labels ℓ f.1) f.2) : GoodFacet (labels ℓ f'.1) f'.2 := by
  obtain ⟨c, k⟩ := f
  rcases nb_eq_some_cases h with ⟨hk, h1, rfl⟩ | ⟨hk, -, rfl⟩ | ⟨h0, hl, rfl⟩
  · dsimp only at hk h1 hg ⊢
    subst hk
    refine hg.of_equiv (finRotate (n + 2)).symm finRotate_symm_zero fun i hi => ?_
    obtain ⟨i, rfl⟩ := Fin.exists_succ_eq.mpr hi
    simp only [labels, finRotate_symm_succ', vert_rotDown h1]
  · dsimp only at hk hg ⊢
    subst hk
    refine hg.of_equiv (finRotate (n + 2)) finRotate_last fun i hi => ?_
    obtain ⟨i, rfl⟩ := Fin.exists_castSucc_eq.mpr hi
    simp only [labels, finRotate_castSucc', vert_rotUp]
  · dsimp only at h0 hl hg ⊢
    refine hg.of_equiv (Equiv.refl _) rfl fun i hi => ?_
    simp only [labels, refl_apply, vert_swapCell c h0 hl hi]

/-- The boundary facets. -/
theorem nb_eq_none_iff (f : Cell (n + 1) × Fin (n + 2)) :
    nb m f = none ↔ (f.2 = 0 ∧ f.1.1 (f.1.2.symm 0) = 0) ∨
      (f.2 = Fin.last (n + 1) ∧ m ≤ f.1.1 (f.1.2.symm (Fin.last n)) + 1) := by
  obtain ⟨c, k⟩ := f
  dsimp only
  by_cases h0 : k = 0
  · subst h0
    rw [nb_zero]
    by_cases h1 : 1 ≤ c.1 (c.2.symm 0)
    · rw [ite_eq_left h1]
      simp only [reduceCtorEq, false_iff, not_or, not_and]
      exact ⟨fun _ => by omega, fun h => absurd h Fin.last_pos.ne⟩
    · rw [ite_eq_right h1]
      exact ⟨fun _ => Or.inl ⟨rfl, by omega⟩, fun _ => rfl⟩
  · by_cases hl : k = Fin.last (n + 1)
    · subst hl
      rw [nb_last]
      by_cases h1 : c.1 (c.2.symm (Fin.last n)) + 1 < m
      · rw [ite_eq_left h1]
        simp only [reduceCtorEq, false_iff, not_or, not_and]
        exact ⟨fun h => absurd h Fin.last_pos.ne', fun _ => by omega⟩
      · rw [ite_eq_right h1]
        exact ⟨fun _ => Or.inr ⟨rfl, by omega⟩, fun _ => rfl⟩
    · rw [nb_mid c h0 hl]
      simp only [reduceCtorEq, false_iff, not_or, not_and]
      exact ⟨fun h => absurd h h0, fun h => absurd h hl⟩

/-! ### The face `x 0 = 0` and the cells one dimension lower -/

/-- The cell one dimension lower obtained by forgetting the coordinate `0`. -/
def lower (c : Cell (n + 1)) : Cell n := (fun j => c.1 j.succ, (Perm.decomposeFin c.2).2)

/-- The cell one dimension higher whose facet opposite the vertex `0` lies in the face
`x 0 = 0`. -/
def lift (c : Cell n) : Cell (n + 1) := (Fin.cons 0 c.1, Perm.decomposeFin.symm (0, c.2))

theorem decomposeFin_fst (τ : Perm (Fin (n + 1))) : (Perm.decomposeFin τ).1 = τ 0 := by
  have h := Perm.decomposeFin_symm_apply_zero (Perm.decomposeFin τ).1 (Perm.decomposeFin τ).2
  rw [Prod.mk.eta, Perm.decomposeFin.symm_apply_apply] at h
  exact h.symm

theorem lift_lower {c : Cell (n + 1)} (hτ : c.2 0 = 0) (hb : c.1 0 = 0) : lift (lower c) = c := by
  obtain ⟨b, τ⟩ := c
  dsimp only at hτ hb
  refine Prod.ext ?_ ?_
  · have h := Fin.cons_self_tail b
    rw [hb] at h
    exact h
  · have h : ((0 : Fin (n + 1)), (Perm.decomposeFin τ).2) = Perm.decomposeFin τ :=
      Prod.ext (by rw [decomposeFin_fst, hτ]) rfl
    change Perm.decomposeFin.symm (0, (Perm.decomposeFin τ).2) = τ
    rw [h, Perm.decomposeFin.symm_apply_apply]

theorem lower_lift (c : Cell n) : lower (lift c) = c := by
  obtain ⟨b, e⟩ := c
  refine Prod.ext ?_ ?_
  · funext j
    simp only [lower, lift, Fin.cons_succ]
  · simp only [lower, lift, Perm.decomposeFin.apply_symm_apply]

theorem lift_snd_zero (c : Cell n) : (lift c).2 0 = 0 :=
  Perm.decomposeFin_symm_apply_zero _ _

theorem lift_fst_zero (c : Cell n) : (lift c).1 0 = 0 := by
  simp only [lift, Fin.cons_zero]

theorem lift_fst_succ (c : Cell n) (j : Fin n) : (lift c).1 j.succ = c.1 j := by
  simp only [lift, Fin.cons_succ]

theorem lift_snd_succ (c : Cell n) (j : Fin n) : (lift c).2 j.succ = (c.2 j).succ := by
  simp only [lift, Perm.decomposeFin_symm_apply_succ, swap_self, refl_apply]

theorem vert_lift (c : Cell n) (q : Fin (n + 1)) :
    vert (lift c) q.succ = Fin.cons 0 (vert c q) := by
  funext j
  refine Fin.cases ?_ (fun j => ?_) j
  · simp only [vert, lift_fst_zero, lift_snd_zero, Fin.cons_zero, Fin.val_succ, Fin.val_zero]
    rw [ite_eq_right (by omega)]
  · simp only [vert, lift_fst_succ, lift_snd_succ, Fin.cons_succ, Fin.val_succ,
      Nat.add_le_add_iff_right]

theorem lift_mem_cells (hm : 1 ≤ m) {c : Cell n} (hc : c ∈ cells n m) :
    lift c ∈ cells (n + 1) m := by
  rw [mem_cells] at hc ⊢
  intro j
  refine Fin.cases ?_ (fun j => ?_) j
  · rw [lift_fst_zero]; exact hm
  · rw [lift_fst_succ]; exact hc j

theorem lower_mem_cells {c : Cell (n + 1)} (hc : c ∈ cells (n + 1) m) : lower c ∈ cells n m := by
  rw [mem_cells] at hc ⊢
  exact fun j => hc j.succ

end Conjugate.Infrastructure.Sperner

end
