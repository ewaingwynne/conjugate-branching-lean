/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.PopulationMeasurableSpace
public import Mathlib.Data.Finsupp.Order
public import Mathlib.MeasureTheory.Measure.MeasureSpaceDef
public import Mathlib.Order.UpperLower.Basic

/-!
# Stochastic domination of offspring laws
-/

@[expose] public section

open MeasureTheory

namespace Conjugate

/-- **Stochastic domination** (used in Example 3.5, paper.tex:1188-1190): `ν` is stochastically
dominated by `ρ` for the componentwise order on offspring vectors, i.e. `ν(U) ≤ ρ(U)` for
every upper set `U`. (By Strassen's theorem this is equivalent to the existence of a coupling
`(Y, Z)` with `Y ∼ ν`, `Z ∼ ρ` and `Y ≤ Z` componentwise.) -/
def StochDominated {ι : Type*} (ν ρ : Measure (ι →₀ ℕ)) : Prop :=
  ∀ U : Set (ι →₀ ℕ), IsUpperSet U → ν U ≤ ρ U

end Conjugate

end
