/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
-- FROZEN_ANCHOR_PREFIX_BEGIN
module

public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.IsSubcritical
public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.Truncate
public import Conjugate.Frozen.Defs.ExtinctionEvent
public import Conjugate.Frozen.Defs.PathLaw
public import Conjugate.Frozen.Defs.StepKernel
public import Conjugate.Frozen.Defs.StochDominated
import Conjugate.Internal.Example_3_5

/-!
# Example 3.5
-/

public section

open MeasureTheory

open scoped ENNReal

namespace Conjugate

/-- **Example 3.5** (paper.tex:1182-1203).

Types are `ℕ`, indexed from `0` (paper type `j` is Lean type `j - 1`, so the paper's weight
`φ(j) = j` is Lean `j + 1`). Let `ℙ_1` (Lean `μ 0`) be a law on offspring vectors with
`ℙ_1[X_j(1) ≥ 1] > 0` for all `j`, `ℙ_1[X_1(1) ≥ 2] > 0`, `𝔼_1[u^{∑_j j X_j(1)}] < ∞` for all
`u > 1`, and `𝔼_1[∑_j j X_j(1)] < 1` — (3.23) — and for each `k ≥ 2` let `ℙ_k` satisfy (3.23)
with `𝔼_k` in place of `𝔼_1` (read as: all four conditions of (3.23) hold for `ℙ_k`,
ERRATA.md E8) and be stochastically dominated by the componentwise sum of `k`
i.i.d. samples from `ℙ_1` (the law of the children of `k` type-1 individuals,
`stepKernel μ (single 0 k)`). Then the assumptions of Theorem 3.1 hold with `φ(k) = k`,
`ψ(k) = 1` (global extinction probability one, and I–IV), so Theorem 3.1 gives
`q ∈ (1,∞)^ℕ` with `f(q) = q`. -/
theorem example_3_5 (μ : ℕ → PMF (ℕ →₀ ℕ))
    (h323 : ∀ k,
      (∀ j, 0 < (μ k).toMeasure {c | 1 ≤ c j}) ∧
      0 < (μ k).toMeasure {c | 2 ≤ c 0} ∧
      (∀ u : ℝ, 1 < u →
        ∫⁻ c, ENNReal.ofReal (u ^ (c.sum fun j n => ((j : ℝ) + 1) * n)) ∂(μ k).toMeasure < ∞) ∧
      ∫⁻ c, ((c.sum fun j n => (j + 1) * n : ℕ) : ℝ≥0∞) ∂(μ k).toMeasure < 1)
    (hdom : ∀ k, 1 ≤ k →
      StochDominated (μ k).toMeasure (stepKernel μ (Finsupp.single 0 (k + 1)))) :
    (∀ k, pathLaw μ (Finsupp.single k 1) (extinctionEvent ℕ) = 1) ∧
    (∀ d, 1 ≤ d →
      IsSubcritical (truncate μ d) ∧
        (IsPositiveRegular (truncate μ d) ∧ IsNonsingular (truncate μ d)) ∧
        ∀ k, ContinuousOn (fun q => genFun (truncate μ d) q k) {q | ∀ j, 0 < q j}) ∧
    (∀ k (q : ℕ → ℝ≥0∞), (∀ j, 1 ≤ q j ∧ q j < ∞) →
      genFun μ q k ≤ ENNReal.ofReal 1 * genFun μ q 0 ^ ((k : ℝ) + 1)) ∧
    (∃ s : ℝ, 1 < s ∧ ∀ k,
      ∫⁻ c, ENNReal.ofReal (s ^ (c.sum fun j n => ((j : ℝ) + 1) * n)) ∂(μ k).toMeasure ≤
        ENNReal.ofReal (s ^ ((k : ℝ) + 1))) ∧
    (∃ t : ℝ, 1 < t ∧
      ENNReal.ofReal t < genFun μ (fun j => if j = 0 then ENNReal.ofReal t else 1) 0 ∧
      ∀ k, genFun μ (fun j => ENNReal.ofReal (1 * t ^ ((j : ℝ) + 1))) k < ∞) ∧
    ∃ q : ℕ → ℝ≥0∞, (∀ j, 1 < q j ∧ q j < ∞) ∧ genFun μ q = q :=
-- FROZEN_ANCHOR_PROOF_BEGIN
  by exact Conjugate.Internal.example_3_5 μ h323 hdom
-- FROZEN_ANCHOR_PROOF_END
-- FROZEN_ANCHOR_SUFFIX_BEGIN

end Conjugate

end
-- FROZEN_ANCHOR_SUFFIX_END
