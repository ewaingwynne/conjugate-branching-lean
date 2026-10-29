/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
-- FROZEN_ANCHOR_PREFIX_BEGIN
module

public import Conjugate.Frozen.Defs.MeanMatrix
public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.IsConjugate
import Conjugate.Internal.Proposition_1_6_Conjugate

/-!
# Proposition 1.6 (conjugate form)
-/

public section

open MeasureTheory

open scoped ENNReal

namespace Conjugate

/-- **Proposition 1.6, conjugate form** (paper.tex:343-356; split per ERRATA.md R5).

Under hypotheses I–III of Proposition 1.6 (see `proposition_1_6_fixedPoint`), there exists a
unique conjugate branching process for `X`: one exists, and any two have the same law
`ℙ̂` started from a single individual. -/
theorem proposition_1_6_conjugate (μ : Fin 1 → PMF (Fin 1 →₀ ℕ))
    (hI : meanMatrix μ 0 0 < 1)
    (hII : 0 < (μ 0).toMeasure {c | 2 ≤ c 0})
    (hIII : ContinuousOn (fun q : ℝ≥0∞ => genFun μ (fun _ => q) 0) (Set.Ioi 0)) :
    (∃ μHat, IsConjugate μ μHat) ∧
      ∀ μ₁ μ₂, IsConjugate μ μ₁ → IsConjugate μ μ₂ →
        pathLaw μ₁ (Finsupp.single 0 1) = pathLaw μ₂ (Finsupp.single 0 1) :=
-- FROZEN_ANCHOR_PROOF_BEGIN
  by exact Conjugate.Internal.proposition_1_6_conjugate μ hI hII hIII
-- FROZEN_ANCHOR_PROOF_END
-- FROZEN_ANCHOR_SUFFIX_BEGIN

end Conjugate

end
-- FROZEN_ANCHOR_SUFFIX_END
