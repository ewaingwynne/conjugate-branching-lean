# Batch 2 — countable-type conjugates (paper.tex:934, 958-959, 1183): proposed anchors

**Status: PROPOSED, awaiting author approval.** Nothing below is frozen yet.

## Scope

The passage at paper.tex:934 asserts, for countable types (global extinction):
1. (2.1) still holds;
2. Proposition 2.2 extends verbatim;
3. conjugates correspond to fixed points `q ∈ (1,∞)^ℕ`.

paper.tex:958-959 and paper.tex:1183 then state that Theorem 3.1 and Example 3.5 ensure a
conjugate exists. In Phase 2 these claims were EXCLUDED (`inv:L934:ctble-conjugate-extension`),
so Example 3.5 was anchored as "gives a fixed point". This batch proposes five new root anchors
for them:

| # | Anchor | Source | Kind |
|---|---|---|---|
| 1 | `Conjugate.proposition_2_1_condLaw_countable` | L934 + Prop 2.1 (L390-403, conditional-law part, R6) | countable (2.1) |
| 2 | `Conjugate.proposition_2_2_countable` | L934 + Prop 2.2 (L420-428) | countable Prop 2.2 |
| 3 | `Conjugate.exists_conjugate_iff_exists_fixedPoint_countable` | L934 + L238 | countable equivalence |
| 4 | `Conjugate.theorem_3_1_conjugate` | L958-959, Thm 3.1 (L985-987) | conjugate form of Thm 3.1 |
| 5 | `Conjugate.example_3_5_conjugate` | L1183 | conjugate form of Ex 3.5 |

## Readings that need your ruling (proposed R8)

- **(a) Carrier.** Types are `ℕ`, with the shift used throughout §3: Lean type `k` is paper
  type `k+1`. Global extinction is the frozen `extinctionEvent ℕ`, i.e. `X(n) = 0` eventually,
  which is the same as `∑_k X_k(n) → 0` for integer populations (paper.tex:930, (1)).
- **(b) #1 and #2 keep the finite-type premises verbatim.** These are positive regular and
  non-singular, in Definition 1.3 with `d` extended to `ℕ` (paper.tex:928, uniform `N`), together
  with extinction one from any state for #2. The paper says "essentially verbatim", so no premise
  is added or dropped. (The expected proofs do not need positive regularity or
  non-singularity.)
- **(c) Hypotheses of #3.** "Global extinction probability one" is read per starting type, as in
  R7 and Definition 1.1. "Just as in the finite-type case" is read as keeping the finite-type
  regularity hypotheses: positive regular and non-singular. Positive regularity is genuinely
  needed. Without it, a conjugate only yields `q ∈ [1,∞)^ℕ ∖ {𝟙}`, not `q ∈ (1,∞)^ℕ`.
- **(d) #4 and #5** have exactly the binders of the frozen `theorem_3_1` / `example_3_5`
  (checked by `diff`), with conclusion "∃ conjugate".
- **(e) Not anchored.** The remark at L934 that "the conjugate process has global extinction
  probability less than 1, but the partial extinction probability may be 1" has no proof in the
  paper.

## Exact proposed files

Each file has the standard frozen layout (prefix / proof / suffix markers). The body is
`by sorry` until it is sealed, and each file imports its provider stub
`Conjugate.Internal.<Name>`. Every file compiled against the current build (without the
not-yet-created stub import).

### `Conjugate/Frozen/Proposition_2_1_CondLaw_Countable.lean`

```lean
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
```

### `Conjugate/Frozen/Proposition_2_2_Countable.lean`

```lean
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
import Conjugate.Internal.Proposition_2_2_Countable

/-!
# Proposition 2.2, countable types
-/

public section

open MeasureTheory ProbabilityTheory

open scoped ENNReal

namespace Conjugate

/-- **Proposition 2.2 for countable types** (paper.tex:934: "Replacing extinction with global
extinction, the statement of Proposition 2.2 extends essentially verbatim to the countable-type
case"; finite-type statement paper.tex:420-428).

Types are indexed by `ℕ`; extinction is global extinction (paper.tex:930, (1)). Let `X` be a
positive regular, non-singular countable-type branching process (paper.tex:928) whose global
extinction probability started from any state is one, and let `A ∈ [1,∞)^ℕ` solve `f(A) = A`.
Then (2.2) defines the offspring distribution of a branching process `X̂`, its global extinction
probability started from one individual of type `k` is `1/A_k`, and its `ℙ̂_k`-conditional law
given global extinction is `ℙ_k`. -/
theorem proposition_2_2_countable (μ : ℕ → PMF (ℕ →₀ ℕ))
    (hpr : IsPositiveRegular μ) (hns : IsNonsingular μ)
    (hext : ∀ x, pathLaw μ x (extinctionEvent ℕ) = 1)
    (A : ℕ → ℝ≥0∞) (hA : ∀ j, 1 ≤ A j ∧ A j < ∞) (hfix : genFun μ A = A) :
    ∃ μHat : ℕ → PMF (ℕ →₀ ℕ),
      (∀ k c, μHat k c = (A k)⁻¹ * (μ k c * c.prod fun j n => A j ^ n)) ∧
      (∀ k, pathLaw μHat (Finsupp.single k 1) (extinctionEvent ℕ) = (A k)⁻¹) ∧
      ∀ k, (pathLaw μHat (Finsupp.single k 1))[|extinctionEvent ℕ] =
        pathLaw μ (Finsupp.single k 1) :=
-- FROZEN_ANCHOR_PROOF_BEGIN
  by sorry
-- FROZEN_ANCHOR_PROOF_END
-- FROZEN_ANCHOR_SUFFIX_BEGIN

end Conjugate

end
-- FROZEN_ANCHOR_SUFFIX_END
```

### `Conjugate/Frozen/ExistsConjugateIffCountable.lean`

```lean
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
public import Conjugate.Frozen.Defs.IsConjugate
import Conjugate.Internal.ExistsConjugateIffCountable

/-!
# Conjugates correspond to fixed points, countable types
-/

public section

open MeasureTheory ProbabilityTheory

open scoped ENNReal

namespace Conjugate

/-- **Conjugates correspond to fixed points in `(1,∞)^ℕ`, countable types** (paper.tex:934:
"If the global extinction probability for `X` is one, we can define a conjugate branching process
for `X` in exactly the same manner as in the finite-type case. Moreover, just as in the
finite-type case, conjugate branching processes correspond to solutions of `f(q) = q` in
`(1,∞)^ℕ`"; finite-type statement paper.tex:238).

Types are indexed by `ℕ`; extinction is global extinction. Let `X` have global extinction
probability one started from one individual of each type (the context of Definition 1.1, read
per starting type as in ERRATA.md R7), and be positive regular and non-singular (the hypotheses
of the finite-type statement, paper.tex:238, with `d` extended to `ℕ`, paper.tex:928). Then a
conjugate branching process for `X` exists if and only if there is `q ∈ (1,∞)^ℕ` with
`f(q) = q`. -/
theorem exists_conjugate_iff_exists_fixedPoint_countable (μ : ℕ → PMF (ℕ →₀ ℕ))
    (hext : ∀ k, pathLaw μ (Finsupp.single k 1) (extinctionEvent ℕ) = 1)
    (hpr : IsPositiveRegular μ) (hns : IsNonsingular μ) :
    (∃ μHat : ℕ → PMF (ℕ →₀ ℕ), IsConjugate μ μHat) ↔
      ∃ q : ℕ → ℝ≥0∞, (∀ j, 1 < q j ∧ q j < ∞) ∧ genFun μ q = q :=
-- FROZEN_ANCHOR_PROOF_BEGIN
  by sorry
-- FROZEN_ANCHOR_PROOF_END
-- FROZEN_ANCHOR_SUFFIX_BEGIN

end Conjugate

end
-- FROZEN_ANCHOR_SUFFIX_END
```

### `Conjugate/Frozen/Theorem_3_1_Conjugate.lean`

```lean
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
generating function `f` in `(1,∞)^ℕ`"; Theorem 3.1, paper.tex:985-987; the equivalence,
paper.tex:934).

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
  by sorry
-- FROZEN_ANCHOR_PROOF_END
-- FROZEN_ANCHOR_SUFFIX_BEGIN

end Conjugate

end
-- FROZEN_ANCHOR_SUFFIX_END
```

### `Conjugate/Frozen/Example_3_5_Conjugate.lean`

```lean
/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
-- FROZEN_ANCHOR_PREFIX_BEGIN
module

public import Conjugate.Frozen.Defs.StepKernel
public import Conjugate.Frozen.Defs.StochDominated
public import Conjugate.Frozen.Defs.IsConjugate
import Conjugate.Internal.Example_3_5_Conjugate

/-!
# Example 3.5, conjugate form
-/

public section

open MeasureTheory

open scoped ENNReal

namespace Conjugate

/-- **Example 3.5, conjugate form** (paper.tex:1183: "We describe a simple class of examples where
Theorem 3.1 implies the existence of a conjugate branching process").

Under exactly the hypotheses of the frozen `Conjugate.example_3_5` (ERRATA.md E8: all four
conditions of (3.23) for every `ℙ_k`, and `ℙ_k` for paper type `k ≥ 2` stochastically dominated by
the sum of `k` i.i.d. samples from `ℙ_1`; Lean indexing explained there), there exists a conjugate
branching process for `X`. -/
theorem example_3_5_conjugate (μ : ℕ → PMF (ℕ →₀ ℕ))
    (h323 : ∀ k,
      (∀ j, 0 < (μ k).toMeasure {c | 1 ≤ c j}) ∧
      0 < (μ k).toMeasure {c | 2 ≤ c 0} ∧
      (∀ u : ℝ, 1 < u →
        ∫⁻ c, ENNReal.ofReal (u ^ (c.sum fun j n => ((j : ℝ) + 1) * n)) ∂(μ k).toMeasure < ∞) ∧
      ∫⁻ c, ((c.sum fun j n => (j + 1) * n : ℕ) : ℝ≥0∞) ∂(μ k).toMeasure < 1)
    (hdom : ∀ k, 1 ≤ k →
      StochDominated (μ k).toMeasure (stepKernel μ (Finsupp.single 0 (k + 1)))) :
    ∃ μHat : ℕ → PMF (ℕ →₀ ℕ), IsConjugate μ μHat :=
-- FROZEN_ANCHOR_PROOF_BEGIN
  by sorry
-- FROZEN_ANCHOR_PROOF_END
-- FROZEN_ANCHOR_SUFFIX_BEGIN

end Conjugate

end
-- FROZEN_ANCHOR_SUFFIX_END
```

