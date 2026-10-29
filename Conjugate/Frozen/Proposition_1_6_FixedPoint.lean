/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
-- FROZEN_ANCHOR_PREFIX_BEGIN
module

public import Conjugate.Frozen.Defs.MeanMatrix
public import Conjugate.Frozen.Defs.GenFun
import Conjugate.Internal.Proposition_1_6_FixedPoint

/-!
# Proposition 1.6 (fixed-point form)
-/

public section

open MeasureTheory

open scoped ENNReal

namespace Conjugate

/-- **Proposition 1.6, fixed-point form** (paper.tex:343-356; split per ERRATA.md R5).

Let `X` be a single-type branching process (`d = 1`, the type being `0 : Fin 1`) with
generating function `f` such that
I. `X` is subcritical, i.e. `𝔼[X(1)] < 1`;
II. `ℙ[X(1) ≥ 2] > 0`;
III. `f` is continuous from `(0,∞]` to `(0,∞]`.
Then there is a unique `q > 1` with `f(q) = q`, where `q > 1` is read as `q ∈ (1,∞)`
(ERRATA.md E7: `q = ∞` is always a second solution in `(1,∞]`). -/
theorem proposition_1_6_fixedPoint (μ : Fin 1 → PMF (Fin 1 →₀ ℕ))
    (hI : meanMatrix μ 0 0 < 1)
    (hII : 0 < (μ 0).toMeasure {c | 2 ≤ c 0})
    (hIII : ContinuousOn (fun q : ℝ≥0∞ => genFun μ (fun _ => q) 0) (Set.Ioi 0)) :
    ∃! q : ℝ≥0∞, 1 < q ∧ q < ∞ ∧ genFun μ (fun _ => q) 0 = q :=
-- FROZEN_ANCHOR_PROOF_BEGIN
  by exact Conjugate.Internal.proposition_1_6_fixedPoint μ hI hII hIII
-- FROZEN_ANCHOR_PROOF_END
-- FROZEN_ANCHOR_SUFFIX_BEGIN

end Conjugate

end
-- FROZEN_ANCHOR_SUFFIX_END
