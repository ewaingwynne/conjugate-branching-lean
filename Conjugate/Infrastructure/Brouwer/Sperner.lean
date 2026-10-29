/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Infrastructure.Brouwer.KuhnCells
public import Mathlib.Data.Fintype.BigOperators
public import Mathlib.Data.Fintype.Perm
public import Mathlib.Data.Nat.Factorial.Basic

/-!
# Sperner's lemma for Kuhn's triangulation of the cube

A labelling `ℓ : (Fin n → ℕ) → Option (Fin n)` of the grid `{0, …, m}^n` is *admissible*
(`Admissible m ℓ`) when a coordinate label `some i` is only used at points with `0 < x i`, and
the label `none` only at points with all coordinates `< m`. Sperner's lemma (`sperner_cube`)
states that an admissible labelling has a fully labelled cell: a cell whose `n + 1` vertices
carry the `n + 1` distinct labels. We prove the parity version `sum_full` (the number of fully
labelled cells is odd) by induction on `n`. In the induction step the good facets (those
carrying all the labels other than `some 0`) are paired by the neighbour map `nb`, except for
the ones lying on the face `x 0 = 0`, which correspond to the fully labelled cells one dimension
lower for the induced labelling `lowerLabelling ℓ`.
-/

@[expose] public section

namespace Conjugate.Infrastructure.Sperner

open Finset Equiv

variable {n m : ℕ}

/-- Admissibility of a labelling of the grid `{0, …, m}^n`: a coordinate label `some i` requires
`0 < p i`, and the label `none` requires `p j < m` for all `j`. -/
def Admissible (m : ℕ) (ℓ : (Fin n → ℕ) → Option (Fin n)) : Prop :=
  (∀ p : Fin n → ℕ, (∀ j, p j ≤ m) → ∀ i, ℓ p = some i → 0 < p i) ∧
    (∀ p : Fin n → ℕ, (∀ j, p j ≤ m) → ℓ p = none → ∀ j, p j < m)

/-- Forgetting the distinguished label `some 0`: `none ↦ none`, `some 0 ↦ none`,
`some j.succ ↦ some j`. -/
def lowerLabel : Option (Fin (n + 1)) → Option (Fin n) :=
  fun x => x.bind (Fin.cases none some)

/-- The labelling induced on the face `x 0 = 0`. -/
def lowerLabelling (ℓ : (Fin (n + 1) → ℕ) → Option (Fin (n + 1))) :
    (Fin n → ℕ) → Option (Fin n) :=
  fun y => lowerLabel (ℓ (Fin.cons 0 y))

theorem lowerLabel_none : lowerLabel (none : Option (Fin (n + 1))) = none := rfl

theorem lowerLabel_some_zero : lowerLabel (some (0 : Fin (n + 1))) = none := by
  simp [lowerLabel]

theorem lowerLabel_some_succ (j : Fin n) : lowerLabel (some j.succ) = some j := by
  simp [lowerLabel]

theorem lowerLabel_eq_some {x : Option (Fin (n + 1))} {i : Fin n} :
    lowerLabel x = some i ↔ x = some i.succ := by
  rcases x with _ | j
  · simp [lowerLabel_none]
  · refine Fin.cases ?_ (fun j => ?_) j
    · simp [lowerLabel_some_zero, (Fin.succ_ne_zero i).symm]
    · simp [lowerLabel_some_succ]

theorem lowerLabel_eq_none {x : Option (Fin (n + 1))} :
    lowerLabel x = none ↔ x = none ∨ x = some 0 := by
  rcases x with _ | j
  · simp [lowerLabel_none]
  · refine Fin.cases ?_ (fun j => ?_) j
    · simp [lowerLabel_some_zero]
    · simp [lowerLabel_some_succ, Fin.succ_ne_zero]

theorem lowerLabel_injOn {x y : Option (Fin (n + 1))} (hx : x ≠ some 0) (hy : y ≠ some 0)
    (h : lowerLabel x = lowerLabel y) : x = y := by
  rcases hxy : lowerLabel x with _ | i
  · rw [hxy] at h
    rcases lowerLabel_eq_none.mp hxy with rfl | rfl
    · rcases lowerLabel_eq_none.mp h.symm with rfl | rfl
      · rfl
      · exact absurd rfl hy
    · exact absurd rfl hx
  · rw [hxy] at h
    rw [lowerLabel_eq_some.mp hxy, lowerLabel_eq_some.mp h.symm]

theorem cons_zero_le {y : Fin n → ℕ} (hy : ∀ j, y j ≤ m) (j : Fin (n + 1)) :
    (Fin.cons 0 y : Fin (n + 1) → ℕ) j ≤ m := by
  refine Fin.cases ?_ (fun j => ?_) j
  · rw [Fin.cons_zero]; exact Nat.zero_le _
  · rw [Fin.cons_succ]; exact hy j

theorem Admissible.lower {ℓ : (Fin (n + 1) → ℕ) → Option (Fin (n + 1))} (hℓ : Admissible m ℓ) :
    Admissible m (lowerLabelling ℓ) := by
  refine ⟨fun y hy i h => ?_, fun y hy h j => ?_⟩
  · have h' := lowerLabel_eq_some.mp h
    have := hℓ.1 _ (cons_zero_le hy) _ h'
    rwa [Fin.cons_succ] at this
  · rcases lowerLabel_eq_none.mp h with h' | h'
    · have := hℓ.2 _ (cons_zero_le hy) h' j.succ
      rwa [Fin.cons_succ] at this
    · have := hℓ.1 _ (cons_zero_le hy) _ h'
      rw [Fin.cons_zero] at this
      exact absurd this (lt_irrefl 0)

/-- A good boundary facet of an admissible labelling lies in the face `x 0 = 0`, opposite the
vertex `0` of a cell whose coordinate `0` drops first. -/
theorem eq_of_goodFacet_of_nb_eq_none {ℓ : (Fin (n + 1) → ℕ) → Option (Fin (n + 1))}
    (hℓ : Admissible m ℓ) {f : Cell (n + 1) × Fin (n + 2)} (hf : f.1 ∈ cells (n + 1) m)
    (hg : GoodFacet (labels ℓ f.1) f.2) (hn : nb m f = none) :
    f.2 = 0 ∧ f.1.2 0 = 0 ∧ f.1.1 0 = 0 := by
  obtain ⟨c, k⟩ := f
  dsimp only at hf hg ⊢
  rcases (nb_eq_none_iff (m := m) (c, k)).mp hn with ⟨hk, hb⟩ | ⟨hk, hb⟩
  · dsimp only at hk hb
    subst hk
    by_cases hj : c.2.symm 0 = 0
    · refine ⟨rfl, ?_, ?_⟩
      · have := c.2.apply_symm_apply 0
        rwa [hj] at this
      · rw [← hj]; exact hb
    · exfalso
      obtain ⟨i, hi, hli⟩ := hg.exists_eq (x := some (c.2.symm 0))
        (fun h => hj (Option.some.inj h))
      have hpos := hℓ.1 _ (vert_le hf i) _ hli
      rw [vert_symm_zero hi, hb] at hpos
      exact lt_irrefl 0 hpos
  · exfalso
    dsimp only at hk hb
    subst hk
    obtain ⟨i, hi, hli⟩ := hg.exists_eq (x := none) (Option.some_ne_none _).symm
    have hlt := hℓ.2 _ (vert_le hf i) hli (c.2.symm (Fin.last n))
    rw [vert_symm_last hi] at hlt
    omega

/-- The facet opposite the vertex `0` of a lifted cell is good iff the lower cell is fully
labelled for the induced labelling. -/
theorem goodFacet_lift_iff {ℓ : (Fin (n + 1) → ℕ) → Option (Fin (n + 1))} (hℓ : Admissible m ℓ)
    (hm : 1 ≤ m) {c : Cell n} (hc : c ∈ cells n m) :
    GoodFacet (labels ℓ (lift c)) 0 ↔ Function.Injective (labels (lowerLabelling ℓ) c) := by
  have hlab : ∀ q : Fin (n + 1),
      labels (lowerLabelling ℓ) c q = lowerLabel (labels ℓ (lift c) q.succ) := by
    intro q
    simp only [labels, lowerLabelling, vert_lift]
  have hne : ∀ q : Fin (n + 1), labels ℓ (lift c) q.succ ≠ some 0 := by
    intro q h
    have := hℓ.1 _ (vert_le (lift_mem_cells hm hc) q.succ) _ h
    rw [labels] at h
    rw [vert_lift, Fin.cons_zero] at this
    exact lt_irrefl 0 this
  constructor
  · intro hg q q' h
    rw [hlab, hlab] at h
    have := hg.1 _ _ (Fin.succ_ne_zero q) (Fin.succ_ne_zero q')
      (lowerLabel_injOn (hne q) (hne q') h)
    exact Fin.succ_injective _ this
  · intro hinj
    refine ⟨fun i i' hi hi' h => ?_, fun i hi => ?_⟩
    · obtain ⟨q, rfl⟩ := Fin.exists_succ_eq.mpr hi
      obtain ⟨q', rfl⟩ := Fin.exists_succ_eq.mpr hi'
      have : labels (lowerLabelling ℓ) c q = labels (lowerLabelling ℓ) c q' := by
        rw [hlab, hlab, h]
      rw [hinj this]
    · obtain ⟨q, rfl⟩ := Fin.exists_succ_eq.mpr hi
      exact hne q

theorem card_cells_zero (m : ℕ) : (cells 0 m).card = 1 := by
  rw [cells, Finset.card_product, Fintype.card_piFinset, Finset.card_univ, Fintype.card_perm,
    Fintype.card_fin, Nat.factorial_zero]
  simp

/-- Parity form of Sperner's lemma: for an admissible labelling of `{0, …, m}^n`, the number of
fully labelled cells is odd. -/
theorem sum_full (n : ℕ) (hm : 1 ≤ m) :
    ∀ ℓ : (Fin n → ℕ) → Option (Fin n), Admissible m ℓ →
      (∑ c ∈ cells n m, if Function.Injective (labels ℓ c) then (1 : ZMod 2) else 0) = 1 := by
  induction n with
  | zero =>
    intro ℓ _
    have : Subsingleton (Fin (0 + 1)) := inferInstanceAs (Subsingleton (Fin 1))
    have hinj : ∀ c : Cell 0, Function.Injective (labels ℓ c) := fun c =>
      Function.injective_of_subsingleton _
    rw [Finset.sum_congr rfl fun c _ => ite_eq_left (hinj c), Finset.sum_const,
      card_cells_zero, one_nsmul]
  | succ n ih =>
    intro ℓ hℓ
    classical
    -- per cell, the number of good facets has the parity of the cell being full
    have h1 : (∑ c ∈ cells (n + 1) m,
          if Function.Injective (labels ℓ c) then (1 : ZMod 2) else 0) =
        ∑ f ∈ cells (n + 1) m ×ˢ (univ : Finset (Fin (n + 2))),
          if GoodFacet (labels ℓ f.1) f.2 then (1 : ZMod 2) else 0 := by
      rw [Finset.sum_product]
      exact Finset.sum_congr rfl fun c _ => (sum_goodFacet (labels ℓ c)).symm
    set S := (cells (n + 1) m ×ˢ (univ : Finset (Fin (n + 2)))).filter
      (fun f => GoodFacet (labels ℓ f.1) f.2) with hS
    have h2 : (∑ f ∈ cells (n + 1) m ×ˢ (univ : Finset (Fin (n + 2))),
          if GoodFacet (labels ℓ f.1) f.2 then (1 : ZMod 2) else 0) =
        ∑ _f ∈ S, (1 : ZMod 2) := by
      rw [hS, Finset.sum_filter]
    have h3 : (∑ _f ∈ S, (1 : ZMod 2)) =
        (∑ _f ∈ S.filter (fun f => nb m f = none), (1 : ZMod 2)) +
          ∑ _f ∈ S.filter (fun f => ¬ nb m f = none), (1 : ZMod 2) :=
      (Finset.sum_filter_add_sum_filter_not S _ _).symm
    -- interior good facets come in pairs
    have h4 : (∑ _f ∈ S.filter (fun f => ¬ nb m f = none), (1 : ZMod 2)) = 0 := by
      refine Finset.sum_involution (fun f _ => (nb m f).getD f) ?_ ?_ ?_ ?_
      · intro f _
        decide
      · intro f hf _
        obtain ⟨-, hn⟩ := Finset.mem_filter.mp hf
        obtain ⟨f', hf'⟩ := Option.ne_none_iff_exists'.mp hn
        rw [hf', Option.getD_some]
        exact nb_ne_self hf'
      · intro f hf
        obtain ⟨hfS, hn⟩ := Finset.mem_filter.mp hf
        obtain ⟨hfc, hg⟩ := Finset.mem_filter.mp hfS
        have hcell : f.1 ∈ cells (n + 1) m := (Finset.mem_product.mp hfc).1
        obtain ⟨f', hf'⟩ := Option.ne_none_iff_exists'.mp hn
        rw [hf', Option.getD_some]
        refine Finset.mem_filter.mpr ⟨Finset.mem_filter.mpr
          ⟨Finset.mem_product.mpr ⟨nb_mem hcell hf', Finset.mem_univ _⟩, goodFacet_nb hf' hg⟩, ?_⟩
        rw [nb_nb hcell hf']
        exact Option.some_ne_none _
      · intro f hf
        obtain ⟨hfS, hn⟩ := Finset.mem_filter.mp hf
        obtain ⟨hfc, -⟩ := Finset.mem_filter.mp hfS
        have hcell : f.1 ∈ cells (n + 1) m := (Finset.mem_product.mp hfc).1
        obtain ⟨f', hf'⟩ := Option.ne_none_iff_exists'.mp hn
        simp only [hf', Option.getD_some, nb_nb hcell hf']
    -- good boundary facets correspond to full cells one dimension lower
    have h5 : (∑ _f ∈ S.filter (fun f => nb m f = none), (1 : ZMod 2)) =
        ∑ _c ∈ (cells n m).filter
          (fun c => Function.Injective (labels (lowerLabelling ℓ) c)), (1 : ZMod 2) := by
      refine Finset.sum_nbij' (fun f => lower f.1) (fun c => (lift c, 0)) ?_ ?_ ?_ ?_ ?_
      · intro f hf
        obtain ⟨hfS, hn⟩ := Finset.mem_filter.mp hf
        obtain ⟨hfc, hg⟩ := Finset.mem_filter.mp hfS
        have hcell : f.1 ∈ cells (n + 1) m := (Finset.mem_product.mp hfc).1
        obtain ⟨hk, hτ, hb⟩ := eq_of_goodFacet_of_nb_eq_none hℓ hcell hg hn
        refine Finset.mem_filter.mpr ⟨lower_mem_cells hcell, ?_⟩
        rw [← goodFacet_lift_iff hℓ hm (lower_mem_cells hcell), lift_lower hτ hb, ← hk]
        exact hg
      · intro c hc
        obtain ⟨hc, hinj⟩ := Finset.mem_filter.mp hc
        refine Finset.mem_filter.mpr ⟨Finset.mem_filter.mpr
          ⟨Finset.mem_product.mpr ⟨lift_mem_cells hm hc, Finset.mem_univ _⟩, ?_⟩, ?_⟩
        · exact (goodFacet_lift_iff hℓ hm hc).mpr hinj
        · rw [nb_eq_none_iff]
          refine Or.inl ⟨rfl, ?_⟩
          have hs : (lift c).2.symm 0 = 0 := (symm_apply_eq _).mpr (lift_snd_zero c).symm
          change (lift c).1 ((lift c).2.symm 0) = 0
          rw [hs, lift_fst_zero]
      · intro f hf
        obtain ⟨hfS, hn⟩ := Finset.mem_filter.mp hf
        obtain ⟨hfc, hg⟩ := Finset.mem_filter.mp hfS
        have hcell : f.1 ∈ cells (n + 1) m := (Finset.mem_product.mp hfc).1
        obtain ⟨hk, hτ, hb⟩ := eq_of_goodFacet_of_nb_eq_none hℓ hcell hg hn
        change (lift (lower f.1), (0 : Fin (n + 2))) = f
        rw [lift_lower hτ hb, ← hk]
      · intro c _
        exact lower_lift c
      · intro f _
        rfl
    have h6 : (∑ _c ∈ (cells n m).filter
        (fun c => Function.Injective (labels (lowerLabelling ℓ) c)), (1 : ZMod 2)) = 1 := by
      rw [Finset.sum_filter]
      exact ih _ hℓ.lower
    rw [h1, h2, h3, h4, add_zero, h5, h6]

/-- **Sperner's lemma** for Kuhn's triangulation of the cube: an admissible labelling of the
grid `{0, …, m}^n` has a fully labelled cell. -/
theorem sperner_cube (hm : 1 ≤ m) {ℓ : (Fin n → ℕ) → Option (Fin n)} (hℓ : Admissible m ℓ) :
    ∃ c ∈ cells n m, Function.Injective (labels ℓ c) := by
  by_contra h
  have h' : ∀ c ∈ cells n m, ¬ Function.Injective (labels ℓ c) :=
    fun c hc hinj => h ⟨c, hc, hinj⟩
  have := sum_full n hm ℓ hℓ
  rw [Finset.sum_eq_zero (fun c hc => ite_eq_right (h' c hc))] at this
  exact zero_ne_one this

end Conjugate.Infrastructure.Sperner

end
