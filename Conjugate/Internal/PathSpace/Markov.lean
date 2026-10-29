/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.PathLaw
public import Conjugate.Internal.Foundations.PathLaw
public import Conjugate.Internal.PathSpace.Cylinder

/-!
# The Markov property of the path law

`pathLaw_cylinder_inter_shift`: for every event `A` of the path space, the probability of
"the first `n + 1` generations are `y 0, …, y n`, and the trajectory restarted at time `n`
lies in `A`" is the probability of the cylinder times the probability of `A` for the process
restarted from `y n`.

The proof compares the two sides as finite measures in `A`. On cylinders `A` both sides are
computed by the finite-dimensional formula `pathLaw_cylinder`, and finite measures on path space
are determined by their values on cylinders (`measure_eq_of_cylinder`).
-/

public section

open MeasureTheory ProbabilityTheory

open scoped ENNReal

namespace Conjugate

open PathSpace

variable {ι : Type*} [Countable ι]

omit [Countable ι] in
/-- The glued trajectory prescription: follow `y` up to time `n` and `z` afterwards. -/
private lemma cylinder_inter_shift_cylinder_eq (n m : ℕ) (y z : ℕ → ι →₀ ℕ) (hz : z 0 = y n) :
    {ω : ℕ → ι →₀ ℕ | ∀ i ≤ n, ω i = y i} ∩
        (fun (ω : ℕ → ι →₀ ℕ) (m : ℕ) => ω (n + m)) ⁻¹' {ω | ∀ j ≤ m, ω j = z j} =
      {ω | ∀ i ≤ n + m, ω i = (fun i => if i ≤ n then y i else z (i - n)) i} := by
  ext ω
  simp only [Set.mem_inter_iff, Set.mem_ofPred_eq, Set.mem_preimage]
  constructor
  · rintro ⟨h1, h2⟩ i hi
    by_cases hin : i ≤ n
    · simp [hin, h1 i hin]
    · obtain ⟨j, rfl⟩ := Nat.exists_eq_add_of_le (not_le.1 hin).le
      simp only [hin, ite_false, Nat.add_sub_cancel_left]
      exact h2 j (by omega)
  · intro h
    refine ⟨fun i hi => by simpa [hi] using h i (hi.trans (Nat.le_add_right n m)), fun j hj => ?_⟩
    have := h (n + j) (by omega)
    rcases Nat.eq_zero_or_pos j with rfl | hj0
    · simpa [hz] using this
    · simpa [Nat.not_le.2 (Nat.lt_add_of_pos_right hj0)] using this

/-- The Markov property on a cylinder of the restarted trajectory. -/
private lemma pathLaw_cylinder_inter_shift_cylinder (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) (n m : ℕ)
    (y z : ℕ → ι →₀ ℕ) :
    pathLaw μ x ({ω | ∀ i ≤ n, ω i = y i} ∩
        (fun (ω : ℕ → ι →₀ ℕ) (m : ℕ) => ω (n + m)) ⁻¹' {ω | ∀ j ≤ m, ω j = z j}) =
      pathLaw μ x {ω | ∀ i ≤ n, ω i = y i} * pathLaw μ (y n) {ω | ∀ j ≤ m, ω j = z j} := by
  by_cases hz : z 0 = y n
  · rw [cylinder_inter_shift_cylinder_eq n m y z hz, pathLaw_cylinder, pathLaw_cylinder,
      pathLaw_cylinder, Finset.prod_range_add]
    have hw0 : (if (0 : ℕ) ≤ n then y 0 else z (0 - n)) = y 0 := by simp
    have hdirac : Measure.dirac (y n) {z 0} = 1 := by simp [hz]
    have hw : ∀ j, (if n + j ≤ n then y (n + j) else z (n + j - n)) = z j := by
      intro j
      rcases Nat.eq_zero_or_pos j with rfl | hj0
      · simp [hz]
      · simp [Nat.not_le.2 (Nat.lt_add_of_pos_right hj0)]
    have h1 : ∏ i ∈ Finset.range n, stepKernel μ (if i ≤ n then y i else z (i - n))
        {if i + 1 ≤ n then y (i + 1) else z (i + 1 - n)} =
        ∏ i ∈ Finset.range n, stepKernel μ (y i) {y (i + 1)} := by
      refine Finset.prod_congr rfl fun i hi => ?_
      have hi' := Finset.mem_range.1 hi
      simp [hi'.le, Nat.succ_le_of_lt hi']
    have h2 : ∏ j ∈ Finset.range m, stepKernel μ (if n + j ≤ n then y (n + j) else z (n + j - n))
        {if n + j + 1 ≤ n then y (n + j + 1) else z (n + j + 1 - n)} =
        ∏ j ∈ Finset.range m, stepKernel μ (z j) {z (j + 1)} := by
      refine Finset.prod_congr rfl fun j _ => ?_
      rw [hw j, Nat.add_assoc, hw (j + 1)]
    rw [hw0, hdirac, h1, h2]
    ring
  · have hempty : ({ω : ℕ → ι →₀ ℕ | ∀ i ≤ n, ω i = y i} ∩
        (fun (ω : ℕ → ι →₀ ℕ) (m : ℕ) => ω (n + m)) ⁻¹' {ω | ∀ j ≤ m, ω j = z j}) = ∅ := by
      ext ω
      simp only [Set.mem_inter_iff, Set.mem_ofPred_eq, Set.mem_preimage, Set.mem_empty_iff_false,
        iff_false, not_and]
      intro h1 h2
      have e1 : ω n = z 0 := h2 0 (Nat.zero_le m)
      exact hz (e1.symm.trans (h1 n le_rfl))
    have hdirac : Measure.dirac (y n) {z 0} = 0 := by simp [Measure.dirac_apply', Ne.symm hz]
    rw [hempty, measure_empty, pathLaw_cylinder μ (y n), hdirac]
    simp

/-- **Markov property at time `n`, path level.** -/
theorem pathLaw_cylinder_inter_shift (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) (n : ℕ)
    (y : ℕ → ι →₀ ℕ) {A : Set (ℕ → ι →₀ ℕ)} (hA : MeasurableSet A) :
    pathLaw μ x ({ω | ∀ i ≤ n, ω i = y i} ∩ (fun ω m => ω (n + m)) ⁻¹' A) =
      pathLaw μ x {ω | ∀ i ≤ n, ω i = y i} * pathLaw μ (y n) A := by
  set c := pathLaw μ x {ω | ∀ i ≤ n, ω i = y i} with hc
  have : IsFiniteMeasure (c • pathLaw μ (y n)) :=
    ⟨by rw [Measure.smul_apply, smul_eq_mul]
        exact ENNReal.mul_lt_top (measure_lt_top _ _) (measure_lt_top _ _)⟩
  have h : ((pathLaw μ x).restrict {ω | ∀ i ≤ n, ω i = y i}).map
      (fun (ω : ℕ → ι →₀ ℕ) (m : ℕ) => ω (n + m)) = c • pathLaw μ (y n) := by
    refine measure_eq_of_cylinder fun m z => ?_
    rw [Measure.map_apply (measurable_shift n) (measurableSet_cylinder m z),
      Measure.restrict_apply ((measurable_shift n) (measurableSet_cylinder m z)),
      Measure.smul_apply, smul_eq_mul, Set.inter_comm, pathLaw_cylinder_inter_shift_cylinder]
  have h2 := congrArg (fun P : Measure (ℕ → ι →₀ ℕ) => P A) h
  simp only [Measure.map_apply (measurable_shift n) hA,
    Measure.restrict_apply ((measurable_shift n) hA), Measure.smul_apply, smul_eq_mul] at h2
  rw [Set.inter_comm]
  exact h2

end Conjugate

end
