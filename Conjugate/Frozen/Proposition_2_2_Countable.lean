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
import Conjugate.Internal.Proposition_2_2_Countable

/-!
# Proposition 2.2, countable types
-/

public section

open MeasureTheory ProbabilityTheory

open scoped ENNReal

namespace Conjugate

/-- **Proposition 2.2 for countable types** (paper.tex:934: "Replacing extinction with global
extinction, the statement of Proposition 2.2 extends essentially verbatim to the countable-type
case"; finite-type statement paper.tex:420-428).

Types are indexed by `ℕ`; extinction is global extinction (paper.tex:930, (1)). Let `X` be a
positive regular, non-singular countable-type branching process (paper.tex:928) whose global
extinction probability started from any state is one, and let `A ∈ [1,∞)^ℕ` solve `f(A) = A`.
Then (2.2) defines the offspring distribution of a branching process `X̂`, its global extinction
probability started from one individual of type `k` is `1/A_k`, and its `ℙ̂_k`-conditional law
given global extinction is `ℙ_k`. -/
theorem proposition_2_2_countable (μ : ℕ → PMF (ℕ →₀ ℕ))
    (hpr : IsPositiveRegular μ) (hns : IsNonsingular μ)
    (hext : ∀ x, pathLaw μ x (extinctionEvent ℕ) = 1)
    (A : ℕ → ℝ≥0∞) (hA : ∀ j, 1 ≤ A j ∧ A j < ∞) (hfix : genFun μ A = A) :
    ∃ μHat : ℕ → PMF (ℕ →₀ ℕ),
      (∀ k c, μHat k c = (A k)⁻¹ * (μ k c * c.prod fun j n => A j ^ n)) ∧
      (∀ k, pathLaw μHat (Finsupp.single k 1) (extinctionEvent ℕ) = (A k)⁻¹) ∧
      ∀ k, (pathLaw μHat (Finsupp.single k 1))[|extinctionEvent ℕ] =
        pathLaw μ (Finsupp.single k 1) :=
-- FROZEN_ANCHOR_PROOF_BEGIN
  by exact Conjugate.Internal.proposition_2_2_countable μ hpr hns hext A hA hfix
-- FROZEN_ANCHOR_PROOF_END
-- FROZEN_ANCHOR_SUFFIX_BEGIN

end Conjugate

end
-- FROZEN_ANCHOR_SUFFIX_END
