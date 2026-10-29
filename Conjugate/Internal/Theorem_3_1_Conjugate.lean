/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.IsSubcritical
public import Conjugate.Frozen.Defs.ExtinctionEvent
public import Conjugate.Frozen.Defs.PathLaw
public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.Truncate
public import Conjugate.Frozen.Defs.IsConjugate
import Conjugate.Frozen.Theorem_3_1
import Conjugate.Internal.Countable.FixedPointToConjugate

/-!
# Provider for `Conjugate.theorem_3_1_conjugate`

Implementation module for the frozen anchor
`Conjugate/Frozen/Theorem_3_1_Conjugate.lean`.
The anchor is SEALED (its body is `by exact` of the theorem below); audited in AU-7.

The sealed `Conjugate.theorem_3_1` gives `q ∈ (1,∞)^ℕ` with `f(q) = q` under the same
hypotheses. The tilt of `μ` by `q` is then a conjugate (paper.tex:934), by
`Conjugate.isConjugate_of_fixedPoint_nat`, which needs only per-type global extinction (`hext`).
`X` itself is not assumed positive regular.
-/

public section

open MeasureTheory Filter Topology

open scoped ENNReal

namespace Conjugate.Internal

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
    ∃ μHat : ℕ → PMF (ℕ →₀ ℕ), IsConjugate μ μHat := by
  obtain ⟨q, hq, hfix⟩ := Conjugate.theorem_3_1 μ hext hI φ ψ hφ hψ hφ_lim hψφ_lim hII hIII hIV
  obtain ⟨μHat, h, -⟩ := isConjugate_of_fixedPoint_nat μ hext hq hfix
  exact ⟨μHat, h⟩

end Conjugate.Internal

end
