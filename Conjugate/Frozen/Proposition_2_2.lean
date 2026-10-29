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
import Conjugate.Internal.Proposition_2_2

/-!
# Proposition 2.2
-/

public section

open MeasureTheory ProbabilityTheory

open scoped ENNReal

namespace Conjugate

/-- **Proposition 2.2** (paper.tex:420-428).

Let `X` be a positive regular, non-singular `d`-type branching process with generating function
`f`, whose extinction probability started from any state is one. Let `A ∈ [1,∞)^d` solve
`f(A) = A`. Then (2.2) defines the offspring distribution of a branching process `X̂`:
`𝔼̂_k[F(X(1))] = A_k⁻¹ 𝔼_k[F(X(1)) ∏_j A_j^{X_j(1)}]` (pointwise form, as for (2.1)).
Its extinction probability started from one individual of type `k` is `1/A_k`, and its
`ℙ̂_k`-conditional law given extinction is `ℙ_k`. -/
theorem proposition_2_2 {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hpr : IsPositiveRegular μ) (hns : IsNonsingular μ)
    (hext : ∀ x, pathLaw μ x (extinctionEvent (Fin d)) = 1)
    (A : Fin d → ℝ≥0∞) (hA : ∀ j, 1 ≤ A j ∧ A j < ∞) (hfix : genFun μ A = A) :
    ∃ μHat : Fin d → PMF (Fin d →₀ ℕ),
      (∀ k c, μHat k c = (A k)⁻¹ * (μ k c * c.prod fun j n => A j ^ n)) ∧
      (∀ k, pathLaw μHat (Finsupp.single k 1) (extinctionEvent (Fin d)) = (A k)⁻¹) ∧
      ∀ k, (pathLaw μHat (Finsupp.single k 1))[|extinctionEvent (Fin d)] =
        pathLaw μ (Finsupp.single k 1) :=
-- FROZEN_ANCHOR_PROOF_BEGIN
  by exact Conjugate.Internal.proposition_2_2 μ hpr hns hext A hA hfix
-- FROZEN_ANCHOR_PROOF_END
-- FROZEN_ANCHOR_SUFFIX_BEGIN

end Conjugate

end
-- FROZEN_ANCHOR_SUFFIX_END
