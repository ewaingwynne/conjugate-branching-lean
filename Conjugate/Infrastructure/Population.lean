/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.PopulationMeasurableSpace

/-!
# Basic instances for populations

The discrete σ-algebra `Conjugate.populationMeasurableSpace` makes every set of
populations measurable.
-/

public section

namespace Conjugate

instance instDiscreteMeasurableSpacePopulation (ι : Type*) :
    DiscreteMeasurableSpace (ι →₀ ℕ) :=
  ⟨fun _ => trivial⟩

end Conjugate

end
