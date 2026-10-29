/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Mathlib.Algebra.BigOperators.Group.Finset.Basic
public import Mathlib.Data.Finset.Card
public import Mathlib.Data.Fintype.Card
public import Mathlib.Data.Fintype.Option
public import Mathlib.Data.ZMod.Defs
public import Mathlib.Logic.Equiv.Fin.Basic

/-!
# Labelled simplices: parity of the number of good facets

Fix a labelling `L : Fin (n + 2) → Option (Fin (n + 1))` of the `n + 2` vertices of an
`(n + 1)`-simplex by `n + 2` possible labels. The facet opposite the vertex `k` is *good*
(`GoodFacet L k`) when the labels of its vertices are pairwise distinct and avoid the
distinguished label `some 0`; the simplex is *full* when `L` is injective.

The main result, `sum_goodFacet`, is the counting step of Sperner's lemma: in `ZMod 2`, the
number of good facets is `1` when the simplex is full and `0` otherwise.
-/

@[expose] public section

namespace Conjugate.Infrastructure.Sperner

open Finset

variable {n : ℕ}

/-- The facet opposite the vertex `k` is good: the labels of its vertices are pairwise distinct
and none of them is the distinguished label `some 0`. -/
def GoodFacet (L : Fin (n + 2) → Option (Fin (n + 1))) (k : Fin (n + 2)) : Prop :=
  (∀ i j, i ≠ k → j ≠ k → L i = L j → i = j) ∧ ∀ i, i ≠ k → L i ≠ some 0

instance (L : Fin (n + 2) → Option (Fin (n + 1))) (k : Fin (n + 2)) :
    Decidable (GoodFacet L k) :=
  inferInstanceAs (Decidable ((∀ i j, i ≠ k → j ≠ k → L i = L j → i = j) ∧
    ∀ i, i ≠ k → L i ≠ some 0))

variable {L : Fin (n + 2) → Option (Fin (n + 1))}

theorem GoodFacet.injective_of_eq {k : Fin (n + 2)} (hk : GoodFacet L k) (h0 : L k = some 0) :
    Function.Injective L := by
  intro i j hij
  by_cases hi : i = k
  · by_cases hj : j = k
    · rw [hi, hj]
    · subst hi
      exact absurd (hij.symm.trans h0) (hk.2 j hj)
  · by_cases hj : j = k
    · subst hj
      exact absurd (hij.trans h0) (hk.2 i hi)
    · exact hk.1 i j hi hj hij

theorem surjective_of_injective (hL : Function.Injective L) : Function.Surjective L :=
  (Finite.injective_iff_surjective_of_equiv (finSuccEquiv (n + 1)).symm.symm).mp hL

theorem goodFacet_iff_of_injective (hL : Function.Injective L) (k : Fin (n + 2)) :
    GoodFacet L k ↔ L k = some 0 := by
  constructor
  · intro hk
    obtain ⟨i, hi⟩ := surjective_of_injective hL (some 0)
    by_contra h
    exact hk.2 i (fun hik => h (hik ▸ hi)) hi
  · intro h0
    exact ⟨fun i j _ _ hij => hL hij, fun i hi hi0 => hi (hL (hi0.trans h0.symm))⟩

/-- On a good facet, every label other than `some 0` is attained. -/
theorem GoodFacet.exists_eq {k : Fin (n + 2)} (hk : GoodFacet L k) {x : Option (Fin (n + 1))}
    (hx : x ≠ some 0) : ∃ i, i ≠ k ∧ L i = x := by
  classical
  have hsub : (univ.erase k).image L ⊆ univ.erase (some (0 : Fin (n + 1))) := by
    intro y hy
    obtain ⟨i, hi, rfl⟩ := mem_image.mp hy
    exact mem_erase.mpr ⟨hk.2 i (mem_erase.mp hi).1, mem_univ _⟩
  have hcard : (univ.erase (some (0 : Fin (n + 1)))).card ≤ ((univ.erase k).image L).card := by
    rw [card_image_of_injOn (fun i hi j hj hij =>
      hk.1 i j (mem_erase.mp hi).1 (mem_erase.mp hj).1 hij)]
    simp
  have heq := eq_of_subset_of_card_le hsub hcard
  have hx' : x ∈ (univ.erase k).image L := heq ▸ mem_erase.mpr ⟨hx, mem_univ _⟩
  obtain ⟨i, hi, hix⟩ := mem_image.mp hx'
  exact ⟨i, (mem_erase.mp hi).1, hix⟩

/-- For a good facet whose opposite vertex does not carry the distinguished label, the other
vertex carrying the same label as the opposite vertex. -/
noncomputable def GoodFacet.other {k : Fin (n + 2)} (hk : GoodFacet L k) (h0 : L k ≠ some 0) :
    Fin (n + 2) :=
  (hk.exists_eq h0).choose

theorem GoodFacet.other_ne {k : Fin (n + 2)} (hk : GoodFacet L k) (h0 : L k ≠ some 0) :
    hk.other h0 ≠ k :=
  (hk.exists_eq h0).choose_spec.1

theorem GoodFacet.apply_other {k : Fin (n + 2)} (hk : GoodFacet L k) (h0 : L k ≠ some 0) :
    L (hk.other h0) = L k :=
  (hk.exists_eq h0).choose_spec.2

theorem GoodFacet.apply_other_ne {k : Fin (n + 2)} (hk : GoodFacet L k) (h0 : L k ≠ some 0) :
    L (hk.other h0) ≠ some 0 := by
  rw [hk.apply_other h0]; exact h0

theorem GoodFacet.goodFacet_other {k : Fin (n + 2)} (hk : GoodFacet L k) (h0 : L k ≠ some 0) :
    GoodFacet L (hk.other h0) := by
  have hne := hk.other_ne h0
  have heq := hk.apply_other h0
  refine ⟨fun i j hi hj hij => ?_, fun i hi => ?_⟩
  · by_cases hik : i = k
    · by_cases hjk : j = k
      · rw [hik, hjk]
      · subst hik
        exact absurd (hk.1 _ _ hne hjk (heq.trans hij)).symm hj
    · by_cases hjk : j = k
      · subst hjk
        exact absurd (hk.1 _ _ hne hik (heq.trans hij.symm)).symm hi
      · exact hk.1 i j hik hjk hij
  · by_cases hik : i = k
    · exact hik ▸ h0
    · exact hk.2 i hik

theorem GoodFacet.other_other {k : Fin (n + 2)} (hk : GoodFacet L k) (h0 : L k ≠ some 0) :
    (hk.goodFacet_other h0).other (hk.apply_other_ne h0) = k := by
  have hk' := hk.goodFacet_other h0
  apply hk'.1 _ _ (hk'.other_ne (hk.apply_other_ne h0)) (hk.other_ne h0).symm
  rw [hk'.apply_other (hk.apply_other_ne h0), hk.apply_other h0]

/-- Goodness of a facet only depends on the labels of its vertices: it is transported along a
bijection `φ` of the vertex indices that matches the opposite vertices and the labels of the
remaining vertices. -/
theorem GoodFacet.of_equiv {L' : Fin (n + 2) → Option (Fin (n + 1))} {k k' : Fin (n + 2)}
    (φ : Fin (n + 2) ≃ Fin (n + 2)) (hφ : φ k = k') (hL : ∀ i, i ≠ k → L' (φ i) = L i)
    (hk : GoodFacet L k) : GoodFacet L' k' := by
  have hne : ∀ i', i' ≠ k' → φ.symm i' ≠ k := fun i' hi' h =>
    hi' (by rw [← hφ, ← h, φ.apply_symm_apply])
  refine ⟨fun i' j' hi' hj' h => ?_, fun i' hi' => ?_⟩
  · have hi := hne i' hi'
    have hj := hne j' hj'
    rw [← φ.apply_symm_apply i', ← φ.apply_symm_apply j', hL _ hi, hL _ hj] at h
    exact φ.symm.injective (hk.1 _ _ hi hj h)
  · have hi := hne i' hi'
    rw [← φ.apply_symm_apply i', hL _ hi]
    exact hk.2 _ hi

/-- The counting step of Sperner's lemma: in `ZMod 2`, the number of good facets of a labelled
simplex is `1` if the simplex is fully labelled and `0` otherwise. -/
theorem sum_goodFacet (L : Fin (n + 2) → Option (Fin (n + 1))) :
    (∑ k, if GoodFacet L k then (1 : ZMod 2) else 0) =
      if Function.Injective L then 1 else 0 := by
  classical
  have hsplit : ∀ k, (if GoodFacet L k then (1 : ZMod 2) else 0) =
      (if GoodFacet L k ∧ L k = some 0 then 1 else 0) +
        (if GoodFacet L k ∧ L k ≠ some 0 then 1 else 0) := by
    intro k
    by_cases hk : GoodFacet L k <;> by_cases h0 : L k = some 0 <;> simp [hk, h0]
  rw [Finset.sum_congr rfl fun k _ => hsplit k, Finset.sum_add_distrib]
  -- the pairs `(k, other k)` cancel
  have hpair : (∑ k, if GoodFacet L k ∧ L k ≠ some 0 then (1 : ZMod 2) else 0) = 0 := by
    rw [← Finset.sum_filter]
    refine Finset.sum_involution (fun k hk => ?_) ?_ ?_ ?_ ?_
    · exact (Finset.mem_filter.mp hk).2.1.other (Finset.mem_filter.mp hk).2.2
    · intro k hk
      decide
    · intro k hk _
      exact (Finset.mem_filter.mp hk).2.1.other_ne (Finset.mem_filter.mp hk).2.2
    · intro k hk
      obtain ⟨-, hg, h0⟩ := Finset.mem_filter.mp hk
      exact Finset.mem_filter.mpr ⟨Finset.mem_univ _, hg.goodFacet_other h0,
        hg.apply_other_ne h0⟩
    · intro k hk
      obtain ⟨-, hg, h0⟩ := Finset.mem_filter.mp hk
      exact hg.other_other h0
  rw [hpair, add_zero]
  by_cases hL : Function.Injective L
  · rw [ite_eq_left hL]
    obtain ⟨k₀, hk₀⟩ := surjective_of_injective hL (some 0)
    rw [Finset.sum_eq_single k₀]
    · rw [ite_eq_left ⟨(goodFacet_iff_of_injective hL k₀).mpr hk₀, hk₀⟩]
    · intro k _ hk
      rw [ite_eq_right]
      rintro ⟨-, h⟩
      exact hk (hL (h.trans hk₀.symm))
    · intro h
      exact absurd (Finset.mem_univ _) h
  · rw [ite_eq_right hL]
    refine Finset.sum_eq_zero fun k _ => ?_
    rw [ite_eq_right]
    rintro ⟨hg, h0⟩
    exact hL (hg.injective_of_eq h0)

end Conjugate.Infrastructure.Sperner

end
