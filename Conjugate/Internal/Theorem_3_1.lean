/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.IsSubcritical
public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.Truncate
public import Conjugate.Frozen.Defs.ExtinctionEvent
public import Conjugate.Frozen.Defs.PathLaw
import Conjugate.Internal.Section3.Theorem31Limit

/-!
# Provider for `Conjugate.theorem_3_1`

Implementation module for the frozen anchor `Conjugate/Frozen/Theorem_3_1.lean`.
The anchor is SEALED (its body is `by exact` of the theorem below).

The proof is `Conjugate.exists_fixedPoint_of_truncations`
(`Conjugate/Internal/Section3/Theorem31Limit.lean`, paper.tex:1149-1179): the fixed points of the
truncations given by the sealed `Conjugate.theorem_2_7` are bounded by Lemma 3.4 (c), a
subsequence converges pointwise by compactness, the limit is a fixed point by dominated
convergence, it is nonzero by Lemma 3.3 (`Conjugate/Internal/Section3/Liminf.lean`), and all its
coordinates are `> 1` by positive regularity of the truncations
(`Conjugate/Internal/Section3/Theorem31Truncation.lean`). As noted in ERRATA R7, no step uses
the certain-extinction hypothesis `hext` or `φ(k) → ∞`.
-/

public section

open MeasureTheory Filter Topology

open scoped ENNReal

namespace Conjugate.Internal

theorem theorem_3_1 (μ : ℕ → PMF (ℕ →₀ ℕ))
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
    ∃ q : ℕ → ℝ≥0∞, (∀ j, 1 < q j ∧ q j < ∞) ∧ genFun μ q = q := by
  have _ := hext
  have _ := hφ_lim
  exact exists_fixedPoint_of_truncations μ hI φ ψ hφ hψ hψφ_lim hII hIII hIV

end Conjugate.Internal

end
