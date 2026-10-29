/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
-- FROZEN_ANCHOR_PREFIX_BEGIN
module

public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.ExtinctionEvent
public import Conjugate.Frozen.Defs.PathLaw
import Conjugate.Internal.Proposition_2_1_CondLaw

/-!
# Proposition 2.1 (conditional law given extinction)
-/

public section

open MeasureTheory ProbabilityTheory

open scoped ENNReal

namespace Conjugate

/-- **Proposition 2.1, conditional law given extinction** (paper.tex:390-403, second paragraph;
parts (a) "only fixed points in `[0,1]^d`" and (c) "this branching process is subcritical" are
not formalized, per ERRATA.md R6).

Let `X` be a positive regular, non-singular `d`-type branching process, let `E` be the event
that it eventually becomes extinct, and let `a_k = ℙ_k[E]`. If `0 < a_k < 1` for every `k`, then
for each `k` the `ℙ_k`-conditional law of `X` given `E` is that of a branching process whose
offspring distribution is given by (2.1):
`𝔼_k[F(X(1)) | E] = a_k⁻¹ 𝔼_k[F(X(1)) ∏_j a_j^{X_j(1)}]`.
Since offspring laws are discrete, (2.1) for all bounded measurable `F` is the same as the
pointwise formula for the offspring law `ν k` used below (take `F` an indicator). -/
theorem proposition_2_1_condLaw {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hpr : IsPositiveRegular μ) (hns : IsNonsingular μ)
    (a : Fin d → ℝ≥0∞)
    (ha : ∀ k, a k = pathLaw μ (Finsupp.single k 1) (extinctionEvent (Fin d)))
    (ha01 : ∀ k, 0 < a k ∧ a k < 1) :
    ∃ ν : Fin d → PMF (Fin d →₀ ℕ),
      (∀ k c, ν k c = (a k)⁻¹ * (μ k c * c.prod fun j n => a j ^ n)) ∧
      ∀ k, (pathLaw μ (Finsupp.single k 1))[|extinctionEvent (Fin d)] =
        pathLaw ν (Finsupp.single k 1) :=
-- FROZEN_ANCHOR_PROOF_BEGIN
  by exact Conjugate.Internal.proposition_2_1_condLaw μ hpr hns a ha ha01
-- FROZEN_ANCHOR_PROOF_END
-- FROZEN_ANCHOR_SUFFIX_BEGIN

end Conjugate

end
-- FROZEN_ANCHOR_SUFFIX_END
