/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.ExtinctionEvent
public import Conjugate.Frozen.Defs.PathLaw
public import Conjugate.Infrastructure.Population

/-!
# Cylinder sets of the path space

The path space `ℕ → ι →₀ ℕ` of a branching process carries the product σ-algebra of the discrete
σ-algebras on populations. A *cylinder* is a set `{ω | ∀ i ≤ n, ω i = y i}` fixing an initial
segment of the trajectory. This file proves:

* `measurableSet_cylinder`: cylinders are measurable;
* `measure_eq_of_cylinder`: two finite measures on path space that agree on all cylinders are
  equal. The cylinders form a π-system (a nonempty intersection of two cylinders is the longer
  one) that generates the product σ-algebra (the evaluation maps are measurable with respect to
  the generated σ-algebra, since `ω i = c` is a countable union of cylinders);
* `measurableSet_extinctionEvent` and `extinctionEvent_eq_preimage_shift`: the extinction event is
  measurable and invariant under the shifts `ω ↦ (m ↦ ω (n + m))`.

The helper lemmas live in the namespace `Conjugate.PathSpace`, to avoid clashes with other
modules.
-/

public section

open MeasureTheory Filter

namespace Conjugate

variable {ι : Type*} [Countable ι]

namespace PathSpace

omit [Countable ι] in
/-- Cylinder sets are measurable. -/
lemma measurableSet_cylinder (n : ℕ) (y : ℕ → ι →₀ ℕ) :
    MeasurableSet {ω : ℕ → ι →₀ ℕ | ∀ i ≤ n, ω i = y i} := by
  have h : {ω : ℕ → ι →₀ ℕ | ∀ i ≤ n, ω i = y i} =
      ⋂ i ∈ Finset.range (n + 1), (fun ω : ℕ → ι →₀ ℕ => ω i) ⁻¹' {y i} := by
    ext ω
    simp
  rw [h]
  exact Finset.measurableSet_biInter _ fun i _ =>
    measurable_pi_apply i (measurableSet_singleton _)

/-- The family of all cylinder sets. -/
def cylinders (ι : Type*) : Set (Set (ℕ → ι →₀ ℕ)) :=
  Set.range fun p : ℕ × (ℕ → ι →₀ ℕ) => {ω | ∀ i ≤ p.1, ω i = p.2 i}

omit [Countable ι] in
lemma cylinder_mem_cylinders (n : ℕ) (y : ℕ → ι →₀ ℕ) :
    {ω : ℕ → ι →₀ ℕ | ∀ i ≤ n, ω i = y i} ∈ cylinders ι :=
  ⟨(n, y), rfl⟩

omit [Countable ι] in
/-- The cylinders form a π-system: a nonempty intersection of two cylinders is the longer one. -/
lemma isPiSystem_cylinders : IsPiSystem (cylinders ι) := by
  have key : ∀ (n m : ℕ) (y z : ℕ → ι →₀ ℕ), n ≤ m → ∀ ω₀ : ℕ → ι →₀ ℕ,
      (∀ i ≤ n, ω₀ i = y i) → (∀ i ≤ m, ω₀ i = z i) →
      {ω : ℕ → ι →₀ ℕ | ∀ i ≤ n, ω i = y i} ∩ {ω | ∀ i ≤ m, ω i = z i} ∈ cylinders ι := by
    intro n m y z hnm ω₀ h1 h2
    refine ⟨(m, z), ?_⟩
    ext ω
    simp only [Set.mem_inter_iff, Set.mem_ofPred_eq]
    refine ⟨fun h => ⟨fun i hi => ?_, h⟩, fun h => h.2⟩
    rw [h i (hi.trans hnm), ← h2 i (hi.trans hnm), h1 i hi]
  rintro _ ⟨⟨n, y⟩, rfl⟩ _ ⟨⟨m, z⟩, rfl⟩ ⟨ω₀, h1, h2⟩
  rcases le_total n m with hnm | hmn
  · exact key n m y z hnm ω₀ h1 h2
  · rw [Set.inter_comm]
    exact key m n z y hmn ω₀ h2 h1

/-- The cylinders generate the product σ-algebra. -/
lemma generateFrom_cylinders :
    (MeasurableSpace.pi : MeasurableSpace (ℕ → ι →₀ ℕ)) =
      MeasurableSpace.generateFrom (cylinders ι) := by
  refine le_antisymm ?_ ?_
  · refine iSup_le fun i => MeasurableSpace.comap_le_iff_le_map.2 ?_
    have hmeas : Measurable[MeasurableSpace.generateFrom (cylinders ι)]
        (fun ω : ℕ → ι →₀ ℕ => ω i) := by
      refine @measurable_to_countable' (ι →₀ ℕ) _ _ _ (MeasurableSpace.generateFrom (cylinders ι)) _
        fun c => ?_
      have h : (fun ω : ℕ → ι →₀ ℕ => ω i) ⁻¹' {c} =
          ⋃ z : Fin i → ι →₀ ℕ, {ω : ℕ → ι →₀ ℕ | ∀ j ≤ i, ω j =
            (fun j => if h : j < i then z ⟨j, h⟩ else c) j} := by
        ext ω
        simp only [Set.mem_preimage, Set.mem_singleton_iff, Set.mem_iUnion, Set.mem_ofPred_eq]
        constructor
        · intro hω
          refine ⟨fun j => ω j, fun j hj => ?_⟩
          rcases hj.lt_or_eq with hj | rfl
          · simp [hj]
          · simp [hω]
        · rintro ⟨z, hz⟩
          simpa using hz i le_rfl
      rw [h]
      exact MeasurableSet.iUnion fun z =>
        MeasurableSpace.measurableSet_generateFrom (cylinder_mem_cylinders _ _)
    exact hmeas
  · exact MeasurableSpace.generateFrom_le fun s ⟨⟨n, y⟩, hs⟩ => hs ▸ measurableSet_cylinder n y

end PathSpace

open PathSpace

/-- **Finite measures on path space are determined by cylinder sets.** -/
theorem measure_eq_of_cylinder {P Q : Measure (ℕ → ι →₀ ℕ)} [IsFiniteMeasure P]
    [IsFiniteMeasure Q]
    (h : ∀ n (y : ℕ → ι →₀ ℕ), P {ω | ∀ i ≤ n, ω i = y i} = Q {ω | ∀ i ≤ n, ω i = y i}) :
    P = Q := by
  obtain ⟨e, he⟩ := exists_surjective_nat (ι →₀ ℕ)
  refine Measure.ext_of_generateFrom_of_iUnion (cylinders ι)
    (fun k => {ω | ∀ i ≤ 0, ω i = (fun _ => e k) i}) generateFrom_cylinders
    isPiSystem_cylinders ?_ (fun k => cylinder_mem_cylinders _ _) (fun k => measure_ne_top _ _) ?_
  · ext ω
    obtain ⟨k, hk⟩ := he (ω 0)
    simp only [Set.mem_iUnion, Set.mem_ofPred_eq, Set.mem_univ, iff_true]
    exact ⟨k, fun i hi => by obtain rfl : i = 0 := Nat.le_zero.1 hi; exact hk.symm⟩
  · rintro _ ⟨⟨n, y⟩, rfl⟩
    exact h n y

namespace PathSpace

omit [Countable ι] in
/-- The extinction event is measurable. -/
lemma measurableSet_extinctionEvent : MeasurableSet (extinctionEvent ι) := by
  have h : extinctionEvent ι =
      ⋃ N : ℕ, ⋂ m ∈ {m : ℕ | N ≤ m}, (fun ω : ℕ → ι →₀ ℕ => ω m) ⁻¹' {0} := by
    ext ω
    simp [extinctionEvent, eventually_atTop]
  rw [h]
  exact MeasurableSet.iUnion fun N => MeasurableSet.biInter (Set.to_countable _) fun m _ =>
    measurable_pi_apply m (measurableSet_singleton _)

omit [Countable ι] in
/-- The shift of trajectories is measurable. -/
lemma measurable_shift (n : ℕ) :
    Measurable fun (ω : ℕ → ι →₀ ℕ) (m : ℕ) => ω (n + m) :=
  Measurable.of_eval fun m => measurable_pi_apply (n + m)

omit [Countable ι] in
/-- The extinction event is invariant under the shift of trajectories. -/
lemma extinctionEvent_eq_preimage_shift (n : ℕ) :
    extinctionEvent ι = (fun (ω : ℕ → ι →₀ ℕ) (m : ℕ) => ω (n + m)) ⁻¹' extinctionEvent ι := by
  ext ω
  simp only [extinctionEvent, eventually_atTop, Set.mem_ofPred_eq, Set.mem_preimage]
  constructor
  · rintro ⟨N, hN⟩
    exact ⟨N, fun m hm => hN (n + m) (hm.trans (Nat.le_add_left m n))⟩
  · rintro ⟨N, hN⟩
    exact ⟨n + N, fun m hm => by
      obtain ⟨k, rfl⟩ := Nat.exists_eq_add_of_le (n.le_add_right N |>.trans hm)
      exact hN k (by omega)⟩

end PathSpace

end Conjugate

end
