/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.StepKernel

/-!
# `stepKernel` is a Markov kernel
-/

public section

open MeasureTheory ProbabilityTheory

namespace Conjugate

instance isMarkovKernel_stepKernel {ι : Type*} [Countable ι] (μ : ι → PMF (ι →₀ ℕ)) :
    IsMarkovKernel (stepKernel μ) := by
  refine ⟨fun x => ?_⟩
  simp only [stepKernel, Kernel.ofFunOfCountable, Kernel.coe_mk]
  exact (Measure.isProbabilityMeasure_map_iff (measurable_of_countable _).aemeasurable).2
    inferInstance

end Conjugate

end
