/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
-- FROZEN_ANCHOR_PREFIX_BEGIN
module

public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.ExtinctionEvent
public import Conjugate.Frozen.Defs.PathLaw
import Conjugate.Internal.Proposition_2_1_CondLaw_Countable

/-!
# Proposition 2.1 (conditional law given extinction), countable types
-/

public section

open MeasureTheory ProbabilityTheory

open scoped ENNReal

namespace Conjugate

/-- **Proposition 2.1, conditional law given extinction, for countable types** (paper.tex:934:
"since the result of [JL08] applies also in the countable-type case, (2.1) in Proposition 2.1
still holds"; finite-type statement paper.tex:390-403, conditional-law paragraph only, as in
ERRATA.md R6).

Types are indexed by `ℕ` (Lean type `k` is the paper's type `k + 1`); extinction is global
extinction, `X(n) = 0` eventually (paper.tex:930, (1)). Let `X` be positive regular and
non-singular (Definition 1.3 with `d` extended to `ℕ`, paper.tex:928), let `a_k = ℙ_k[E]`, and
assume `0 < a_k < 1` for every `k`. Then for each `k` the `ℙ_k`-conditional law of `X` given `E`
is that of the branching process whose offspring law is given by (2.1) (pointwise form). -/
theorem proposition_2_1_condLaw_countable (μ : ℕ → PMF (ℕ →₀ ℕ))
    (hpr : IsPositiveRegular μ) (hns : IsNonsingular μ)
    (a : ℕ → ℝ≥0∞)
    (ha : ∀ k, a k = pathLaw μ (Finsupp.single k 1) (extinctionEvent ℕ))
    (ha01 : ∀ k, 0 < a k ∧ a k < 1) :
    ∃ ν : ℕ → PMF (ℕ →₀ ℕ),
      (∀ k c, ν k c = (a k)⁻¹ * (μ k c * c.prod fun j n => a j ^ n)) ∧
      ∀ k, (pathLaw μ (Finsupp.single k 1))[|extinctionEvent ℕ] =
        pathLaw ν (Finsupp.single k 1) :=
-- FROZEN_ANCHOR_PROOF_BEGIN
  by sorry
-- FROZEN_ANCHOR_PROOF_END
-- FROZEN_ANCHOR_SUFFIX_BEGIN

end Conjugate

end
-- FROZEN_ANCHOR_SUFFIX_END
