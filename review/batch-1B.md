# Batch 1B — root theorems and one definition, for author approval

Each file below is the exact final declaration, byte for byte. Theorems are frozen with the body `by sorry` (state `DRAFT_SORRY`): the **statement** becomes final; the proof comes later and is sealed only after an independent proof audit. Each theorem imports its own (currently empty) provider module `Conjugate.Internal.<File>`.

## Audit summary (two independent Sonnet auditors, fresh context)

All 13 theorems: `DECLARATION_FIDELITY: PASS`, `EXCESS = 0`, `TRUTH: LIKELY_TRUE`, draft body exactly `by sorry`. `StochDominated`: `DEFINITION_VERDICT: PASS`.

| Anchor | Source | Binder bins SOURCE/STANDING/TYPING/RULED/EXCESS |
|---|---|---|
| `Theorem_1_4_FixedPoint` | Thm 1.4 (i), paper.tex:241-250 | 4/1/2/0/0 |
| `Theorem_1_4_Conjugate` | Thm 1.4 (ii), paper.tex:241-250 | 4/1/2/0/0 |
| `ExistsConjugateIff` | Thm 1.4 (iii), paper.tex:238 | 3/1/2/0/0 |
| `Proposition_1_6_FixedPoint` | Prop 1.6, paper.tex:343-356 | 3/0/1/0/0 (+E7) |
| `Proposition_1_6_Conjugate` | Prop 1.6, paper.tex:343-356 | 3/0/1/0/0 |
| `Proposition_2_1_CondLaw` | Prop 2.1 (2.1), paper.tex:390-403 | 4/0/3/0/0 |
| `Proposition_2_2` | Prop 2.2, paper.tex:420-428 | 5/0/3/0/0 |
| `Theorem_2_7` | Thm 2.7, paper.tex:555-557 | 0/5/2/0/0 |
| `Theorem_3_1` | Thm 3.1, paper.tex:957-987 | 13/0/3/0/0 |
| `Example_1_5` | Ex 1.5, paper.tex:255-276 | 1/0/1/0/0 |
| `Example_3_5` | Ex 3.5, paper.tex:1182-1203 | 5/0/1/0/0 (+E8) |
| `Remark_HypIII_Necessary` | paper.tex:252 | 0/0/0/0/0 |
| `Remark_HypIII_Automatic` | paper.tex:252 | 3/0/2/0/0 |

Checks the auditors ran:

- **Example 1.5:** a numerical search finds exactly three fixed points in `(1,∞)²`: `(1.174, 1.826)`, `(1.620, 1.620)`, `(1.826, 1.174)`.
- **Remark (Hyp. III needed):** `a = 1/2`, `b = 1 − ζ(3)/2` works, with mean `ζ(2)/2 ≈ 0.82`.
- **Props 2.1 / 2.2:** the pointwise form of (2.1)/(2.2) used in Lean is equivalent to the paper's "for every bounded measurable `F`" form.
- **Example 3.5:** its conclusion matches Theorem 3.1's hypotheses term for term, and the hypotheses are satisfiable.
- **`StochDominated`:** the order is componentwise, and the direction matches couplings.

## Rulings this batch needs (proposed readings; details in `ERRATA.md`)

| ID | Where | Proposed reading |
|---|---|---|
| E1 | Thm 1.4 Hyp. III "for each `k ∈ ℕ`" | `k ∈ {1,…,d}` |
| E6 | §3.2 "`(1,∞)^{ℕ_0}`" | `(1,∞)^ℕ` |
| **E7** | Prop 1.6 "unique `q > 1`" | unique `q ∈ (1,∞)` — literally false otherwise, since `f(∞) = ∞` |
| **E8** | Ex 3.5 "(3.23) with `𝔼_k` in place of `𝔼_1`" | all four conditions of (3.23) hold for `ℙ_k` — read literally, `ℙ_k = δ₀` (`k ≥ 2`) is allowed and the example fails |
| R5 | Prop 1.6 | two anchors (fixed-point form; conjugate form, unique in law) |
| R6 | Prop 2.1 | anchor only the conditional-law paragraph (2.1); part (a) and "Moreover, … subcritical" are not frozen |

Needed later for the dependency graph (no anchor depends on them): E2 ((1.2) `∏_{j=1}^k` → `∏_{j=1}^d`), **E3** (Lemma 2.16: the statement's `g(λ) > λ` can fail, e.g. `d = 2`, type 1 has only type-2 children, `λ = (L, 0)`, so `g₁(λ) = 0 < L`; the proof gives `g^{(N)}(λ) > λ` and needs `max_j` instead of `min_j`), E4 ((3.13) `1,1,…` → `0,0,…`), E5 (§2.3 "Definition 2.8" → 1.3).

Other choices, kept as is unless you object:

- **Prop 2.2:** "extinction probability started from any state is one" is read literally as every initial population. It is equivalent to "every single type" by the branching property.
- **Example 1.5:** claims only what R4 says (Thm 1.4's hypotheses and ≥ 3 fixed points). It does not add "≥ 3 distinct conjugates", although an auditor notes that follows.
- **Example 3.5:** `s` comes with the `≤` of Assumption III, not the paper's strict recipe `𝔼₁[s^{∑ jX_j}] < s`.

## `Conjugate/Frozen/Theorem_1_4_FixedPoint.lean` — Thm 1.4 (i), paper.tex:241-250

```lean
/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
-- FROZEN_ANCHOR_PREFIX_BEGIN
module

public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.IsSubcritical
public import Conjugate.Frozen.Defs.GenFun
import Conjugate.Internal.Theorem_1_4_FixedPoint

/-!
# Theorem 1.4 (fixed-point form)
-/

public section

open scoped ENNReal

namespace Conjugate

/-- **Theorem 1.4, fixed-point form** (paper.tex:241-250; split per ERRATA.md R3).

Let `X` be a `d`-type branching process with generating function `f` such that
I. `X` is subcritical;
II. `X` is positive regular and non-singular;
III. for each `k ∈ {1,…,d}` (paper.tex:247 says `k ∈ ℕ`, ERRATA.md E1), `f_k` is continuous
from `(0,∞]^d` to `(0,∞]` (half-open-interval topology).
Then there is `q ∈ (1,∞)^d` with `f(q) = q`.

Hypothesis III is stated as continuity on the subspace `(0,∞]^d` of `[0,∞]^d`; that `f_k` takes
values in `(0,∞]` there holds automatically. -/
theorem theorem_1_4_fixedPoint {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hI : IsSubcritical μ) (hII : IsPositiveRegular μ ∧ IsNonsingular μ)
    (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j}) :
    ∃ q : Fin d → ℝ≥0∞, (∀ j, 1 < q j ∧ q j < ∞) ∧ genFun μ q = q :=
-- FROZEN_ANCHOR_PROOF_BEGIN
  by sorry
-- FROZEN_ANCHOR_PROOF_END
-- FROZEN_ANCHOR_SUFFIX_BEGIN

end Conjugate

end
-- FROZEN_ANCHOR_SUFFIX_END
```

## `Conjugate/Frozen/Theorem_1_4_Conjugate.lean` — Thm 1.4 (ii), paper.tex:241-250

```lean
/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
-- FROZEN_ANCHOR_PREFIX_BEGIN
module

public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.IsSubcritical
public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.IsConjugate
import Conjugate.Internal.Theorem_1_4_Conjugate

/-!
# Theorem 1.4 (conjugate form)
-/

public section

namespace Conjugate

/-- **Theorem 1.4, conjugate form** (paper.tex:241-250; split per ERRATA.md R3).

Under hypotheses I–III of Theorem 1.4 (see `theorem_1_4_fixedPoint`), there exists a
conjugate branching process for `X` (Definition 1.1). -/
theorem theorem_1_4_conjugate {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hI : IsSubcritical μ) (hII : IsPositiveRegular μ ∧ IsNonsingular μ)
    (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j}) :
    ∃ μHat : Fin d → PMF (Fin d →₀ ℕ), IsConjugate μ μHat :=
-- FROZEN_ANCHOR_PROOF_BEGIN
  by sorry
-- FROZEN_ANCHOR_PROOF_END
-- FROZEN_ANCHOR_SUFFIX_BEGIN

end Conjugate

end
-- FROZEN_ANCHOR_SUFFIX_END
```

## `Conjugate/Frozen/ExistsConjugateIff.lean` — Thm 1.4 (iii), paper.tex:238

```lean
/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
-- FROZEN_ANCHOR_PREFIX_BEGIN
module

public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.IsSubcritical
public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.IsConjugate
import Conjugate.Internal.ExistsConjugateIff

/-!
# Conjugates and fixed points
-/

public section

open scoped ENNReal

namespace Conjugate

/-- **Conjugates correspond to fixed points in `(1,∞)^d`** (paper.tex:238; the equivalence in
Theorem 1.4, split per ERRATA.md R3).

If `X` is subcritical, positive regular and non-singular, then a conjugate branching process
for `X` exists if and only if there is `q ∈ (1,∞)^d` with `f(q) = q`. -/
theorem exists_conjugate_iff_exists_fixedPoint {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hsub : IsSubcritical μ) (hpr : IsPositiveRegular μ) (hns : IsNonsingular μ) :
    (∃ μHat : Fin d → PMF (Fin d →₀ ℕ), IsConjugate μ μHat) ↔
      ∃ q : Fin d → ℝ≥0∞, (∀ j, 1 < q j ∧ q j < ∞) ∧ genFun μ q = q :=
-- FROZEN_ANCHOR_PROOF_BEGIN
  by sorry
-- FROZEN_ANCHOR_PROOF_END
-- FROZEN_ANCHOR_SUFFIX_BEGIN

end Conjugate

end
-- FROZEN_ANCHOR_SUFFIX_END
```

## `Conjugate/Frozen/Proposition_1_6_FixedPoint.lean` — Prop 1.6, paper.tex:343-356

```lean
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
  by sorry
-- FROZEN_ANCHOR_PROOF_END
-- FROZEN_ANCHOR_SUFFIX_BEGIN

end Conjugate

end
-- FROZEN_ANCHOR_SUFFIX_END
```

## `Conjugate/Frozen/Proposition_1_6_Conjugate.lean` — Prop 1.6, paper.tex:343-356

```lean
/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
-- FROZEN_ANCHOR_PREFIX_BEGIN
module

public import Conjugate.Frozen.Defs.MeanMatrix
public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.IsConjugate
import Conjugate.Internal.Proposition_1_6_Conjugate

/-!
# Proposition 1.6 (conjugate form)
-/

public section

open MeasureTheory

open scoped ENNReal

namespace Conjugate

/-- **Proposition 1.6, conjugate form** (paper.tex:343-356; split per ERRATA.md R5).

Under hypotheses I–III of Proposition 1.6 (see `proposition_1_6_fixedPoint`), there exists a
unique conjugate branching process for `X`: one exists, and any two have the same law
`ℙ̂` started from a single individual. -/
theorem proposition_1_6_conjugate (μ : Fin 1 → PMF (Fin 1 →₀ ℕ))
    (hI : meanMatrix μ 0 0 < 1)
    (hII : 0 < (μ 0).toMeasure {c | 2 ≤ c 0})
    (hIII : ContinuousOn (fun q : ℝ≥0∞ => genFun μ (fun _ => q) 0) (Set.Ioi 0)) :
    (∃ μHat, IsConjugate μ μHat) ∧
      ∀ μ₁ μ₂, IsConjugate μ μ₁ → IsConjugate μ μ₂ →
        pathLaw μ₁ (Finsupp.single 0 1) = pathLaw μ₂ (Finsupp.single 0 1) :=
-- FROZEN_ANCHOR_PROOF_BEGIN
  by sorry
-- FROZEN_ANCHOR_PROOF_END
-- FROZEN_ANCHOR_SUFFIX_BEGIN

end Conjugate

end
-- FROZEN_ANCHOR_SUFFIX_END
```

## `Conjugate/Frozen/Proposition_2_1_CondLaw.lean` — Prop 2.1 (2.1), paper.tex:390-403

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
  by sorry
-- FROZEN_ANCHOR_PROOF_END
-- FROZEN_ANCHOR_SUFFIX_BEGIN

end Conjugate

end
-- FROZEN_ANCHOR_SUFFIX_END
```

## `Conjugate/Frozen/Proposition_2_2.lean` — Prop 2.2, paper.tex:420-428

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
  by sorry
-- FROZEN_ANCHOR_PROOF_END
-- FROZEN_ANCHOR_SUFFIX_BEGIN

end Conjugate

end
-- FROZEN_ANCHOR_SUFFIX_END
```

## `Conjugate/Frozen/Theorem_2_7.lean` — Thm 2.7, paper.tex:555-557

```lean
/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
-- FROZEN_ANCHOR_PREFIX_BEGIN
module

public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.IsSubcritical
public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.LogGenFun
import Conjugate.Internal.Theorem_2_7

/-!
# Theorem 2.7
-/

public section

namespace Conjugate

/-- **Theorem 2.7** (paper.tex:555-557), in the setting of Theorem 1.4 (paper.tex:528):
under hypotheses I–III of Theorem 1.4 there is `λ ∈ (0,∞)^d` with `g(λ) = λ`. -/
theorem theorem_2_7 {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hI : IsSubcritical μ) (hII : IsPositiveRegular μ ∧ IsNonsingular μ)
    (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j}) :
    ∃ x : Fin d → EReal, (∀ j, 0 < x j ∧ x j < ⊤) ∧ logGenFun μ x = x :=
-- FROZEN_ANCHOR_PROOF_BEGIN
  by sorry
-- FROZEN_ANCHOR_PROOF_END
-- FROZEN_ANCHOR_SUFFIX_BEGIN

end Conjugate

end
-- FROZEN_ANCHOR_SUFFIX_END
```

## `Conjugate/Frozen/Theorem_3_1.lean` — Thm 3.1, paper.tex:957-987

```lean
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
```

## `Conjugate/Frozen/Example_1_5.lean` — Ex 1.5, paper.tex:255-276

```lean
/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
-- FROZEN_ANCHOR_PREFIX_BEGIN
module

public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.IsSubcritical
public import Conjugate.Frozen.Defs.GenFun
import Conjugate.Internal.Example_1_5

/-!
# Example 1.5
-/

public section

open scoped ENNReal

namespace Conjugate

/-- **Example 1.5 (non-uniqueness)** (paper.tex:255-276; "at least three" per ERRATA.md R4).

Let `d = 2` with offspring distribution (for both types `k`, `3 - k` being the other type,
Lean `k.rev`) `ℙ_k[X_k(1) = 1, X_{3-k}(1) = 0] = ℙ_k[X_k(1) = 2, X_{3-k}(1) = 0] = 1/4`,
`ℙ_k[X_k(1) = X_{3-k}(1) = 2] = 1/100`, `ℙ_k[X_k(1) = X_{3-k}(1) = 0] = 49/100`. Then the process
satisfies the hypotheses of Theorem 1.4, and `f(q) = q` has at least three solutions in
`(1,∞)²`. (The four masses sum to one, so they determine `μ`.) -/
theorem example_1_5 (μ : Fin 2 → PMF (Fin 2 →₀ ℕ))
    (hμ : ∀ k : Fin 2,
      μ k (Finsupp.single k 1) = 1 / 4 ∧ μ k (Finsupp.single k 2) = 1 / 4 ∧
      μ k (Finsupp.single k 2 + Finsupp.single k.rev 2) = 1 / 100 ∧ μ k 0 = 49 / 100) :
    (IsSubcritical μ ∧ (IsPositiveRegular μ ∧ IsNonsingular μ) ∧
      ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j}) ∧
    3 ≤ {q : Fin 2 → ℝ≥0∞ | (∀ j, 1 < q j ∧ q j < ∞) ∧ genFun μ q = q}.encard :=
-- FROZEN_ANCHOR_PROOF_BEGIN
  by sorry
-- FROZEN_ANCHOR_PROOF_END
-- FROZEN_ANCHOR_SUFFIX_BEGIN

end Conjugate

end
-- FROZEN_ANCHOR_SUFFIX_END
```

## `Conjugate/Frozen/Example_3_5.lean` — Ex 3.5, paper.tex:1182-1203

```lean
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
  by sorry
-- FROZEN_ANCHOR_PROOF_END
-- FROZEN_ANCHOR_SUFFIX_BEGIN

end Conjugate

end
-- FROZEN_ANCHOR_SUFFIX_END
```

## `Conjugate/Frozen/Remark_HypIII_Necessary.lean` — paper.tex:252

```lean
/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
-- FROZEN_ANCHOR_PREFIX_BEGIN
module

public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.IsSubcritical
public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.IsConjugate
import Conjugate.Internal.Remark_HypIII_Necessary

/-!
# Hypothesis III cannot be removed
-/

public section

open scoped ENNReal

namespace Conjugate

/-- **Hypothesis III of Theorem 1.4 cannot be removed** (paper.tex:252).

For appropriate constants `a, b > 0`, the single-type branching process with
`ℙ[X(1) = m] = a m⁻³` for `m ≥ 1` and `ℙ[X(1) = 0] = b` satisfies hypotheses I and II of
Theorem 1.4, but `f(q) = ∞ ≠ q` for every `q ∈ (1,∞)`, and no conjugate branching process
exists. -/
theorem remark_hypIII_necessary :
    ∃ a b : ℝ≥0∞, 0 < a ∧ 0 < b ∧ ∃ μ : Fin 1 → PMF (Fin 1 →₀ ℕ),
      μ 0 0 = b ∧ (∀ m : ℕ, 1 ≤ m → μ 0 (Finsupp.single 0 m) = a * ((m : ℝ≥0∞) ^ 3)⁻¹) ∧
      IsSubcritical μ ∧ (IsPositiveRegular μ ∧ IsNonsingular μ) ∧
      (∀ q : ℝ≥0∞, 1 < q → q < ∞ → genFun μ (fun _ => q) 0 = ∞) ∧
      ¬ ∃ μHat, IsConjugate μ μHat :=
-- FROZEN_ANCHOR_PROOF_BEGIN
  by sorry
-- FROZEN_ANCHOR_PROOF_END
-- FROZEN_ANCHOR_SUFFIX_BEGIN

end Conjugate

end
-- FROZEN_ANCHOR_SUFFIX_END
```

## `Conjugate/Frozen/Remark_HypIII_Automatic.lean` — paper.tex:252

```lean
/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
-- FROZEN_ANCHOR_PREFIX_BEGIN
module

public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.GenFun
import Conjugate.Internal.Remark_HypIII_Automatic

/-!
# Hypothesis III is automatic for finite f
-/

public section

open scoped ENNReal

namespace Conjugate

/-- **Hypothesis III of Theorem 1.4 is automatic when `f` is finite** (paper.tex:252, last sentence).

If `X` is positive regular and non-singular and `f_k(q) < ∞` for all `k` and all
`q ∈ (0,∞)^d`, then each `f_k` is continuous from `(0,∞]^d` to `(0,∞]`. -/
theorem remark_hypIII_automatic {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hpr : IsPositiveRegular μ) (hns : IsNonsingular μ)
    (hfin : ∀ k (q : Fin d → ℝ≥0∞), (∀ j, 0 < q j ∧ q j < ∞) → genFun μ q k < ∞) :
    ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j} :=
-- FROZEN_ANCHOR_PROOF_BEGIN
  by sorry
-- FROZEN_ANCHOR_PROOF_END
-- FROZEN_ANCHOR_SUFFIX_BEGIN

end Conjugate

end
-- FROZEN_ANCHOR_SUFFIX_END
```

## `Conjugate/Frozen/Defs/StochDominated.lean` — definition, Ex 3.5 (paper.tex:1188-1190)

```lean
/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.PopulationMeasurableSpace
public import Mathlib.Data.Finsupp.Order
public import Mathlib.MeasureTheory.Measure.MeasureSpaceDef
public import Mathlib.Order.UpperLower.Basic

/-!
# Stochastic domination of offspring laws
-/

@[expose] public section

open MeasureTheory

namespace Conjugate

/-- **Stochastic domination** (used in Example 3.5, paper.tex:1188-1190): `ν` is stochastically
dominated by `ρ` for the componentwise order on offspring vectors, i.e. `ν(U) ≤ ρ(U)` for
every upper set `U`. (By Strassen's theorem this is equivalent to the existence of a coupling
`(Y, Z)` with `Y ∼ ν`, `Z ∼ ρ` and `Y ≤ Z` componentwise.) -/
def StochDominated {ι : Type*} (ν ρ : Measure (ι →₀ ℕ)) : Prop :=
  ∀ U : Set (ι →₀ ℕ), IsUpperSet U → ν U ≤ ρ U

end Conjugate

end
```

