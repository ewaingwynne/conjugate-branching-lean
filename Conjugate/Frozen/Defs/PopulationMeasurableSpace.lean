/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Mathlib.MeasureTheory.MeasurableSpace.Defs
public import Mathlib.Data.Finsupp.Defs

/-!
# The σ-algebra on populations

A population is a finitely supported vector `x : ι →₀ ℕ`, where `x j` is the number of
individuals of type `j`.
-/

@[expose] public section

namespace Conjugate

/-- **Populations carry the discrete σ-algebra.**

A population of a branching process with type set `ι` is a finitely supported vector
`x : ι →₀ ℕ`, `x j` being the number of individuals of type `j` (paper.tex:176 for the types
`{1,…,d}`; paper.tex:915-918 for the types `ℕ`, where (3.1) says that every individual has
finitely many offspring). The paper integrates arbitrary bounded functions `F : ℕ₀^d → ℝ`
against offspring laws (paper.tex:402, 427), i.e. it uses the discrete σ-algebra. For
countable `ι` this is the only σ-algebra on `ι →₀ ℕ` in which single populations are
measurable. -/
@[reducible, instance]
def populationMeasurableSpace (ι : Type*) : MeasurableSpace (ι →₀ ℕ) := ⊤

end Conjugate

end
