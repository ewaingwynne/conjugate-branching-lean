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
import Conjugate.Internal.Theorem_3_1

/-!
# Theorem 3.1
-/

public section

open MeasureTheory Filter Topology

open scoped ENNReal

namespace Conjugate

/-- **Theorem 3.1** (paper.tex:957-987).

Let `X` be a branching process with types `ℕ` and global extinction probability one. Lean
indexes types from `0`: paper type `k` is Lean type `k - 1`, so the paper's `f_1` is
`genFun μ · 0`, and the paper's `φ(k)`, `ψ(k)` are Lean `φ (k-1)`, `ψ (k-1)`. Assume:
I. for each `d ∈ ℕ = {1,2,…}`, the truncation `X^d` satisfies the hypotheses of Theorem 1.4;
II. there are `φ, ψ : ℕ → [1,∞)` with `φ(k) → ∞` and `log ψ(k) / φ(k) → 0` such that
`f_k(q) ≤ ψ(k) f_1(q)^{φ(k)}` for all `k` and all `q ∈ [1,∞)^ℕ`;
III. there is `s > 1` with `𝔼_k[s^{∑_j φ(j) X_j(1)}] ≤ s^{φ(k)}` for all `k`;
IV. there is `t > 1` with `f_1(t,1,1,…) > t` and `f_k({ψ(j) t^{φ(j)}}_j) < ∞` for all `k`.
Then there is `q ∈ (1,∞)^ℕ` with `f(q) = q` (paper.tex:986; `ℕ_0` at paper.tex:959 is read as
`ℕ`, ERRATA.md E6). -/
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
    ∃ q : ℕ → ℝ≥0∞, (∀ j, 1 < q j ∧ q j < ∞) ∧ genFun μ q = q :=
-- FROZEN_ANCHOR_PROOF_BEGIN
  by sorry
-- FROZEN_ANCHOR_PROOF_END
-- FROZEN_ANCHOR_SUFFIX_BEGIN

end Conjugate

end
-- FROZEN_ANCHOR_SUFFIX_END
