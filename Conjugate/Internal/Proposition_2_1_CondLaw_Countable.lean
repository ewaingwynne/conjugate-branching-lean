/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.ExtinctionEvent
public import Conjugate.Frozen.Defs.PathLaw
import Conjugate.Internal.Countable.CondLaw

/-!
# Provider for `Conjugate.proposition_2_1_condLaw_countable`

Implementation module for the frozen anchor
`Conjugate/Frozen/Proposition_2_1_CondLaw_Countable.lean`.
The anchor is SEALED (its body is `by exact` of the theorem below); audited in AU-7.

The proof is the Doob h-transform on cylinder sets (`PLAN.md` §6), exactly as for finite types
(paper.tex:934). The path-space machinery is stated for an arbitrary countable type set, and the
general result is `Conjugate.Conjugacy.exists_tilt_condLaw`: the extinction probabilities
`a_k = ℙ_k[E]` are a fixed point of the generating function, so the tilted offspring laws
`ν_k(c) = a_k⁻¹ μ_k(c) ∏_j a_j^{c_j}` are probability mass functions, and `ℙ_k[· | E]` and the
path law of `ν` agree on every cylinder by the Markov property. Positive regularity and
non-singularity are not used.
-/

public section

open MeasureTheory ProbabilityTheory

open scoped ENNReal

namespace Conjugate.Internal

theorem proposition_2_1_condLaw_countable (μ : ℕ → PMF (ℕ →₀ ℕ))
    (hpr : IsPositiveRegular μ) (hns : IsNonsingular μ)
    (a : ℕ → ℝ≥0∞)
    (ha : ∀ k, a k = pathLaw μ (Finsupp.single k 1) (extinctionEvent ℕ))
    (ha01 : ∀ k, 0 < a k ∧ a k < 1) :
    ∃ ν : ℕ → PMF (ℕ →₀ ℕ),
      (∀ k c, ν k c = (a k)⁻¹ * (μ k c * c.prod fun j n => a j ^ n)) ∧
      ∀ k, (pathLaw μ (Finsupp.single k 1))[|extinctionEvent ℕ] =
        pathLaw ν (Finsupp.single k 1) :=
  Conjugacy.exists_tilt_condLaw μ a ha ha01

end Conjugate.Internal

end
