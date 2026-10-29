/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
-- FROZEN_ANCHOR_PREFIX_BEGIN
module

public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.IsSubcritical
public import Conjugate.Frozen.Defs.ExtinctionEvent
public import Conjugate.Frozen.Defs.PathLaw
public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.Truncate
public import Conjugate.Frozen.Defs.IsConjugate
import Conjugate.Internal.Theorem_3_1_Conjugate

/-!
# Theorem 3.1, conjugate form
-/

public section

open MeasureTheory Filter Topology

open scoped ENNReal

namespace Conjugate

/-- **Theorem 3.1, conjugate form** (paper.tex:958-959: "Let `X` be a countable type branching
process with global extinction probability one. Let us now state a list of assumptions which
ensure the existence of a conjugate branching process, equivalently, a fixed point for the
generating function `f` in `(1,∞)^ℕ`" (`ℕ_0` read as `ℕ`, ERRATA.md E6); Theorem 3.1,
paper.tex:985-987; the equivalence, paper.tex:934).

Under exactly the hypotheses of the frozen `Conjugate.theorem_3_1` (global extinction per
starting type, ERRATA.md R7; Assumptions I-IV with the Lean indexing explained there), there
exists a conjugate branching process for `X`. -/
theorem theorem_3_1_conjugate (μ : ℕ → PMF (ℕ →₀ ℕ))
    (hext : ∀ k, pathLaw μ (Finsupp.single k 1) (extinctionEvent ℕ) = 1)
    (hI : ∀ d, 1 ≤ d →
      IsSubcritical (truncate μ d) ∧
        (IsPositiveRegular (truncate μ d) ∧ IsNonsingular (truncate μ d)) ∧
        ∀ k, ContinuousOn (fun q => genFun (truncate μ d) q k) {q | ∀ j, 0 < q j})
    (φ ψ : ℕ → ℝ) (hφ : ∀ k, 1 ≤ φ k) (hψ : ∀ k, 1 ≤ ψ k)
    (hφ_lim : Tendsto φ atTop atTop)
    (hψφ_lim : Tendsto (fun k => Real.log (ψ k) / φ k) atTop (𝓝 0))
    (hII : ∀ k (q : ℕ → ℝ≥0∞), (∀ j, 1 ≤ q j ∧ q j < ∞) →
      genFun μ q k ≤ ENNReal.ofReal (ψ k) * genFun μ q 0 ^ φ k)
    (hIII : ∃ s : ℝ, 1 < s ∧ ∀ k,
      ∫⁻ c, ENNReal.ofReal (s ^ (c.sum fun j n => φ j * n)) ∂(μ k).toMeasure ≤
        ENNReal.ofReal (s ^ φ k))
    (hIV : ∃ t : ℝ, 1 < t ∧
      ENNReal.ofReal t < genFun μ (fun j => if j = 0 then ENNReal.ofReal t else 1) 0 ∧
      ∀ k, genFun μ (fun j => ENNReal.ofReal (ψ j * t ^ φ j)) k < ∞) :
    ∃ μHat : ℕ → PMF (ℕ →₀ ℕ), IsConjugate μ μHat :=
-- FROZEN_ANCHOR_PROOF_BEGIN
  by exact Conjugate.Internal.theorem_3_1_conjugate μ hext hI φ ψ hφ hψ hφ_lim hψφ_lim hII hIII hIV
-- FROZEN_ANCHOR_PROOF_END
-- FROZEN_ANCHOR_SUFFIX_BEGIN

end Conjugate

end
-- FROZEN_ANCHOR_SUFFIX_END
