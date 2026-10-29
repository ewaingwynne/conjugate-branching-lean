/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
-- FROZEN_ANCHOR_PREFIX_BEGIN
module

public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.ExtinctionEvent
public import Conjugate.Frozen.Defs.PathLaw
public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.IsConjugate
import Conjugate.Internal.ExistsConjugateIffCountable

/-!
# Conjugates correspond to fixed points, countable types
-/

public section

open MeasureTheory ProbabilityTheory

open scoped ENNReal

namespace Conjugate

/-- **Conjugates correspond to fixed points in `(1,∞)^ℕ`, countable types** (paper.tex:934:
"If the global extinction probability for `X` is one, we can define a conjugate branching process
for `X` in exactly the same manner as in the finite-type case. Moreover, just as in the
finite-type case, conjugate branching processes correspond to solutions of `f(q) = q` in
`(1,∞)^ℕ`"; finite-type statement paper.tex:238).

Types are indexed by `ℕ`; extinction is global extinction. Let `X` have global extinction
probability one started from one individual of each type (the context of Definition 1.1, read
per starting type as in ERRATA.md R7; it replaces the finite-type subcriticality of paper.tex:238),
and be positive regular and non-singular (Definition 1.3 with `d` extended to `ℕ`,
paper.tex:928). Then a conjugate branching process for `X` exists if and only if there is
`q ∈ (1,∞)^ℕ` with `f(q) = q` (existence form, as in ERRATA.md R3 (iii)).
Positive regularity is necessary (ERRATA.md E10): with a sterile type and types that only
reproduce themselves, a conjugate exists but `f` has no fixed point in `(1,∞)^ℕ`.
Non-singularity is kept for parity with the finite-type statement. -/
theorem exists_conjugate_iff_exists_fixedPoint_countable (μ : ℕ → PMF (ℕ →₀ ℕ))
    (hext : ∀ k, pathLaw μ (Finsupp.single k 1) (extinctionEvent ℕ) = 1)
    (hpr : IsPositiveRegular μ) (hns : IsNonsingular μ) :
    (∃ μHat : ℕ → PMF (ℕ →₀ ℕ), IsConjugate μ μHat) ↔
      ∃ q : ℕ → ℝ≥0∞, (∀ j, 1 < q j ∧ q j < ∞) ∧ genFun μ q = q :=
-- FROZEN_ANCHOR_PROOF_BEGIN
  by exact Conjugate.Internal.exists_conjugate_iff_exists_fixedPoint_countable μ hext hpr hns
-- FROZEN_ANCHOR_PROOF_END
-- FROZEN_ANCHOR_SUFFIX_BEGIN

end Conjugate

end
-- FROZEN_ANCHOR_SUFFIX_END
