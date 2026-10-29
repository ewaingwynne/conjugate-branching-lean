/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.GenFun
import Conjugate.Internal.Analytic.GenFunContinuity

/-!
# Provider for `Conjugate.remark_hypIII_automatic`

Implementation module for the frozen anchor `Conjugate/Frozen/Remark_HypIII_Automatic.lean`.
The anchor is SEALED (its body is `by exact` of the theorem below); audited in AU-1.

The proof is `Conjugate.continuousAt_genFun` (lower semicontinuity of `f_k` where `f_k = ∞`,
dominated convergence where `f_k < ∞`); positive regularity and non-singularity are not needed.
-/

public section

open scoped ENNReal

namespace Conjugate.Internal

/-- **Hypothesis III of Theorem 1.4 is automatic when `f` is finite** (paper.tex:252, last
sentence): the provider of `Conjugate.remark_hypIII_automatic`, with exactly its type. -/
theorem remark_hypIII_automatic {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hpr : IsPositiveRegular μ) (hns : IsNonsingular μ)
    (hfin : ∀ k (q : Fin d → ℝ≥0∞), (∀ j, 0 < q j ∧ q j < ∞) → genFun μ q k < ∞) :
    ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j} :=
  fun k _ hq => (continuousAt_genFun μ k (hfin k) hq).continuousWithinAt

end Conjugate.Internal

end
