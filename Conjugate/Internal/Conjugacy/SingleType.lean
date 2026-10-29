/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.IsPositiveRegular
import Conjugate.Internal.Foundations.StepKernel
import Conjugate.Internal.Section2.Positivity

/-!
# Single-type processes with `ℙ[X(1) ≥ 2] > 0`

For a single type (`Fin 1`), `ℙ[X(1) ≥ 2] > 0` already gives positive regularity (with `N = 1`:
`ℙ_0[X_0(1) ≥ 1] ≥ ℙ_0[X_0(1) ≥ 2] > 0`, since the law of generation `1` is `μ 0`) and
non-singularity (`X_0(1)` is the total population `∑_j X_j(1)`).

The helpers live in the namespace `Conjugate.Conjugacy`.
-/

public section

open MeasureTheory

namespace Conjugate.Conjugacy

/-- A single-type process with `ℙ[X(1) ≥ 2] > 0` is positive regular, with `N = 1`. -/
lemma isPositiveRegular_of_fin_one (μ : Fin 1 → PMF (Fin 1 →₀ ℕ))
    (hII : 0 < (μ 0).toMeasure {c | 2 ≤ c 0}) : IsPositiveRegular μ := by
  refine ⟨1, le_rfl, fun k j => ?_⟩
  obtain rfl : k = 0 := Subsingleton.elim _ _
  obtain rfl : j = 0 := Subsingleton.elim _ _
  change 0 < pathLaw μ (Finsupp.single 0 1) {ω | ω 1 ∈ {c : Fin 1 →₀ ℕ | 1 ≤ c 0}}
  rw [pathLaw_eval_mem, pathLaw_map_eval_one, stepKernel_single]
  exact lt_of_lt_of_le hII (measure_mono fun c hc => (Nat.le_of_succ_le hc : 1 ≤ c 0))

/-- A single-type process with `ℙ[X(1) ≥ 2] > 0` is non-singular. -/
lemma isNonsingular_of_fin_one (μ : Fin 1 → PMF (Fin 1 →₀ ℕ))
    (hII : 0 < (μ 0).toMeasure {c | 2 ≤ c 0}) : IsNonsingular μ := by
  refine ⟨0, lt_of_lt_of_le hII (measure_mono fun c hc => ?_)⟩
  change 2 ≤ c.sum fun _ n => n
  rw [Finsupp.sum_fintype _ _ (fun _ => rfl), Fin.sum_univ_one]
  exact hc

end Conjugate.Conjugacy

end
