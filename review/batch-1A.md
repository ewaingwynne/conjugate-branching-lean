# Batch 1A — definitions for author approval

Source: `source/arxiv-2411.06301v2/fixed-pt-finite-type.tex` (sha256 `b0fb466b…`). Toolchain Lean v4.36.0-rc2, Mathlib `9d581dff`.

**What approval means.** Each file below is the exact final declaration (whole file, byte for byte). On approval it is frozen: its whole-file hash and elaborated-term hash go into `frozen-anchor-manifest.json`, and it can only change through a versioned successor with your ruling.

## Audit summary (independent Sonnet auditor, fresh context)

All 14: `DEFINITION_VERDICT: PASS` (BODY_MATCH OK, PUBLIC_CARRIER OK, literal definitions). Axioms: only `propext`, `Classical.choice`, `Quot.sound`.

Semantic checks the auditor proved in throwaway Lean files (deleted afterwards):

- `stepKernel μ 0 = dirac 0`; `stepKernel μ (single k 1) = μ k`.
- Branching property: `∫ q^{X(1)} dstepKernel μ x = ∏_j f_j(q)^{x_j}`.
- `pathLaw` starts at `x`, every step uses `stepKernel`, and the law of `X(1)` under `ℙ_k` is `μ k`.
- (1.2) `f^{(n)}_k(q) = 𝔼_k[∏ q_j^{X_j(n)}]` on all of `[0,∞]^d`; `g^{(n)} = log ∘ f^{(n)} ∘ exp`.
- (3.2) for `truncate`; `0 ∈ S₀`; `extinctionEvent` is measurable.
- `¬ IsConjugate μ μ`; a conjugate has `ℙ̂_k(E) ≠ 0`.
- `spectralRadius` is the max modulus of the eigenvalues.
- A sanity example (each individual has exactly `m` children) behaves correctly for all four predicates.

## Conventions you are approving

1. A branching process is given by its offspring laws `μ : ι → PMF (ι →₀ ℕ)`; `ι = Fin d` for `d` types, `ι = ℕ` for countably many. **Lean indexes types from 0**: paper type `k` is Lean type `k-1`.
2. `ℙ_k` is `pathLaw μ (Finsupp.single k 1)`, the Markov chain law on trajectories `ℕ → (ι →₀ ℕ)`.
3. One-generation quantities (`f`, `M`, non-singularity) are written with `μ k`, which is the law of `X(1)` under `ℙ_k`.
4. `f` is defined on `[0,∞]^ι` and `g` on `[-∞,∞]^ι` by the paper's formulas. They agree with the paper on its domains. The only extra points are mixed ones (some `q_i = 0` and some `q_j = ∞`), where ENNReal's `0·∞ = 0` applies; no theorem will use them.
5. `IsSubcritical` contains the paper's standing assumption that every `M_{k,j}` is finite (paper.tex:219) together with `ρ < 1`, where `ρ` is the complex spectral radius (= largest eigenvalue, by Perron–Frobenius).
6. `|·|` in (2.9) is the sup norm (the paper doesn't fix one; the sets don't depend on the choice).
7. Positive regularity requires `N ≥ 1` (the paper's `ℕ = {1,2,…}`; `N = 0` would make it trivial for `d = 1`).
8. `IsConjugate` does not contain Definition 1.1's context ("X subcritical with extinction probability one"); theorems that use it carry those hypotheses.

The two `Conjugate/Infrastructure/` modules contain only two `Prop`-valued instances (`DiscreteMeasurableSpace`, `IsMarkovKernel`) needed to elaborate `stepKernel` and `pathLaw`. They are not frozen, but the elaborated-term hash of every frozen definition will be re-checked by `tools/check.sh`, so any change in how a frozen file elaborates fails the gate.

## `Conjugate/Frozen/Defs/PopulationMeasurableSpace.lean` — paper.tex:176, 402, 427, 915-918

```lean
/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Mathlib.MeasureTheory.MeasurableSpace.Defs
public import Mathlib.Data.Finsupp.Defs

/-!
# The σ-algebra on populations

A population is a finitely supported vector `x : ι →₀ ℕ`, where `x j` is the number of
individuals of type `j`.
-/

@[expose] public section

namespace Conjugate

/-- **Populations carry the discrete σ-algebra.**

A population of a branching process with type set `ι` is a finitely supported vector
`x : ι →₀ ℕ`, `x j` being the number of individuals of type `j` (paper.tex:176 for the types
`{1,…,d}`; paper.tex:915-918 for the types `ℕ`, where (3.1) says that every individual has
finitely many offspring). The paper integrates arbitrary bounded functions `F : ℕ₀^d → ℝ`
against offspring laws (paper.tex:402, 427), i.e. it uses the discrete σ-algebra. For
countable `ι` this is the only σ-algebra on `ι →₀ ℕ` in which single populations are
measurable. -/
@[reducible, instance]
def populationMeasurableSpace (ι : Type*) : MeasurableSpace (ι →₀ ℕ) := ⊤

end Conjugate

end
```

## `Conjugate/Frozen/Defs/StepKernel.lean` — paper.tex:176-177

```lean
/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Infrastructure.Population
public import Mathlib.Data.Finsupp.Encodable
public import Mathlib.MeasureTheory.Constructions.Pi
public import Mathlib.Probability.Kernel.Basic
public import Mathlib.Probability.ProbabilityMassFunction.Basic

/-!
# One generation of a branching process
-/

@[expose] public section

open MeasureTheory ProbabilityTheory

namespace Conjugate

/-- **One generation of a multi-type branching process** (paper.tex:176-177).

A branching process with type set `ι` is given by its offspring laws `μ`: `μ j` is the law of
the offspring vector `(X_1(1), X_2(1), …)` of a single individual of type `j`. From a
population `x`, every individual reproduces independently, and the next generation is the
sum of all offspring vectors. The individuals of `x` are indexed by the pairs `(j, i)` with
`j` in the support of `x` and `i < x j`; individual `(j, i)` has type `j`. So
`stepKernel μ x` is the law of `∑_{(j,i)} Y_{j,i}` for independent `Y_{j,i} ∼ μ j`. -/
noncomputable def stepKernel {ι : Type*} [Countable ι] (μ : ι → PMF (ι →₀ ℕ)) :
    Kernel (ι →₀ ℕ) (ι →₀ ℕ) :=
  Kernel.ofFunOfCountable fun x =>
    (Measure.pi fun p : (Σ j : x.support, Fin (x j)) => (μ p.1).toMeasure).map
      fun y => ∑ p, y p

end Conjugate

end
```

## `Conjugate/Frozen/Defs/PathLaw.lean` — paper.tex:176-177

```lean
/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Infrastructure.StepKernel
public import Mathlib.Probability.Kernel.IonescuTulcea.Traj

/-!
# The law of a branching process
-/

@[expose] public section

open MeasureTheory ProbabilityTheory

namespace Conjugate

/-- **The law of a branching process started from a population** (paper.tex:176-177).

`pathLaw μ x` is the law on trajectories `ω : ℕ → (ι →₀ ℕ)` of the generation process
`X = (X(n))_{n ∈ ℕ₀}`, `X(n) = ω n`, of the branching process with offspring laws `μ`,
started from `X(0) = x`: the Markov chain whose transition from `X(n)` to `X(n+1)` is
`stepKernel μ`. The paper's `ℙ_k` (start from a single individual of type `k`) is
`pathLaw μ (Finsupp.single k 1)`, and `𝔼_k` is integration against it. -/
noncomputable def pathLaw {ι : Type*} [Countable ι] (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) :
    Measure (ℕ → ι →₀ ℕ) :=
  Kernel.trajMeasure (X := fun _ => ι →₀ ℕ) (Measure.dirac x) fun n =>
    (stepKernel μ).comap
      (fun ω : (Π _ : Finset.Iic n, ι →₀ ℕ) => ω ⟨n, Finset.mem_Iic.2 le_rfl⟩)
      (measurable_pi_apply _)

end Conjugate

end
```

## `Conjugate/Frozen/Defs/ExtinctionEvent.lean` — paper.tex:179, 930

```lean
/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Mathlib.Data.Finsupp.Defs
public import Mathlib.Order.Filter.AtTopBot.Basic

/-!
# The extinction event
-/

@[expose] public section

open Filter

namespace Conjugate

/-- **Extinction** (paper.tex:179): the event `E` that `X(n) = 0` for all sufficiently large
`n`. For the type set `ℕ` this is global extinction, `∑_k X_k(n) → 0` (paper.tex:930),
since a sequence of natural numbers tends to `0` exactly when it is eventually `0`. -/
def extinctionEvent (ι : Type*) : Set (ℕ → ι →₀ ℕ) :=
  {ω | ∀ᶠ n in atTop, ω n = 0}

end Conjugate

end
```

## `Conjugate/Frozen/Defs/IsConjugate.lean` — Def 1.1, paper.tex:184-187, 934

```lean
/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.ExtinctionEvent
public import Conjugate.Frozen.Defs.PathLaw
public import Mathlib.Probability.ConditionalProbability

/-!
# Conjugate branching processes (Definition 1.1)
-/

@[expose] public section

open MeasureTheory ProbabilityTheory

namespace Conjugate

/-- **Conjugate branching process** (Definition 1.1, paper.tex:184-187; for the type set `ℕ`,
paper.tex:934, with global extinction).

The branching process with offspring laws `μHat` is a conjugate branching process for the
one with offspring laws `μ` if it does not have the same law, and for every type `k`, its law
started from a single individual of type `k`, conditioned on extinction, is `ℙ_k`.

Definition 1.1 is stated in the context "let `X` be subcritical with extinction probability
one"; that context is not part of the predicate and is assumed where the predicate is used. -/
def IsConjugate {ι : Type*} [Countable ι] (μ μHat : ι → PMF (ι →₀ ℕ)) : Prop :=
  (∃ k, pathLaw μHat (Finsupp.single k 1) ≠ pathLaw μ (Finsupp.single k 1)) ∧
    ∀ k, (pathLaw μHat (Finsupp.single k 1))[|extinctionEvent ι] =
      pathLaw μ (Finsupp.single k 1)

end Conjugate

end
```

## `Conjugate/Frozen/Defs/GenFun.lean` — (1.1), paper.tex:203-208, 919-925

```lean
/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.PopulationMeasurableSpace
public import Mathlib.Algebra.BigOperators.Finsupp.Basic
public import Mathlib.MeasureTheory.Integral.Lebesgue.Basic
public import Mathlib.Probability.ProbabilityMassFunction.Basic

/-!
# The generating function (1.1)
-/

@[expose] public section

open MeasureTheory

open scoped ENNReal

namespace Conjugate

/-- **The generating function** (1.1), paper.tex:203-208; for the type set `ℕ`,
paper.tex:919-924:
`f_k(q) = 𝔼_k[∏_j q_j^{X_j(1)}]`, where `X(1)` has the offspring law `μ k`.

Values lie in `[0,∞]`, with `∞⁰ = 1` and `∞^n = ∞` for `n > 0` as in paper.tex:208. The paper
introduces `f` on `(0,∞]^d`; the same formula is used here on `[0,∞]^ι`, as the paper itself
does when it evaluates `f` on `[0,1]^d` (paper.tex:394). Iterates `f^{(n)}` are
`(genFun μ)^[n]`. -/
noncomputable def genFun {ι : Type*} (μ : ι → PMF (ι →₀ ℕ)) (q : ι → ℝ≥0∞) (k : ι) : ℝ≥0∞ :=
  ∫⁻ c, c.prod (fun j n => q j ^ n) ∂(μ k).toMeasure

end Conjugate

end
```

## `Conjugate/Frozen/Defs/MeanMatrix.lean` — (1.3), paper.tex:215-218

```lean
/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.PopulationMeasurableSpace
public import Mathlib.LinearAlgebra.Matrix.Defs
public import Mathlib.MeasureTheory.Integral.Lebesgue.Basic
public import Mathlib.Probability.ProbabilityMassFunction.Basic

/-!
# The mean matrix (1.3)
-/

@[expose] public section

open MeasureTheory

open scoped ENNReal

namespace Conjugate

/-- **The mean matrix** (1.3), paper.tex:215-218: `M_{k,j} = 𝔼_k[X_j(1)]`, the expected number
of type-`j` children of one type-`k` individual, as an element of `[0,∞]`. The paper's standing
assumption that every entry is finite (paper.tex:219) is part of `IsSubcritical`. -/
noncomputable def meanMatrix {ι : Type*} (μ : ι → PMF (ι →₀ ℕ)) : Matrix ι ι ℝ≥0∞ :=
  Matrix.of fun k j => ∫⁻ c, (c j : ℝ≥0∞) ∂(μ k).toMeasure

end Conjugate

end
```

## `Conjugate/Frozen/Defs/IsSubcritical.lean` — paper.tex:219-220

```lean
/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.MeanMatrix
public import Mathlib.Analysis.Complex.Basic
public import Mathlib.Analysis.Normed.Algebra.Spectrum
public import Mathlib.Data.Matrix.Basic

/-!
# Subcriticality
-/

@[expose] public section

open scoped ENNReal

namespace Conjugate

/-- **Subcritical** (paper.tex:219-220): every entry of the mean matrix `M` is finite, and the
largest eigenvalue `ρ` of `M` is less than one.

For the entrywise non-negative real matrix `M`, the largest eigenvalue is its spectral radius
`max {|λ| : λ ∈ ℂ an eigenvalue}` (Perron–Frobenius), which is what is used here. -/
def IsSubcritical {ι : Type*} [Fintype ι] [DecidableEq ι] (μ : ι → PMF (ι →₀ ℕ)) : Prop :=
  (∀ k j, meanMatrix μ k j ≠ ∞) ∧
    spectralRadius ℂ ((meanMatrix μ).map fun x => ((x.toReal : ℝ) : ℂ)) < 1

end Conjugate

end
```

## `Conjugate/Frozen/Defs/IsPositiveRegular.lean` — Def 1.3, paper.tex:225-229

```lean
/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.PathLaw

/-!
# Positive regularity (Definition 1.3)
-/

@[expose] public section

open MeasureTheory

namespace Conjugate

/-- **Positive regular** (Definition 1.3, paper.tex:225-229): there is `N ∈ ℕ = {1, 2, …}` with
`ℙ_k[X_j(N) ≥ 1] > 0` for all types `k, j`. For the type set `ℕ` the same definition is used
(paper.tex:928). -/
def IsPositiveRegular {ι : Type*} [Countable ι] (μ : ι → PMF (ι →₀ ℕ)) : Prop :=
  ∃ N : ℕ, 1 ≤ N ∧ ∀ k j : ι, 0 < pathLaw μ (Finsupp.single k 1) {ω | 1 ≤ ω N j}

end Conjugate

end
```

## `Conjugate/Frozen/Defs/IsNonsingular.lean` — Def 1.3, paper.tex:230-233

```lean
/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.PopulationMeasurableSpace
public import Mathlib.Algebra.BigOperators.Finsupp.Basic
public import Mathlib.Probability.ProbabilityMassFunction.Basic

/-!
# Non-singularity (Definition 1.3)
-/

@[expose] public section

open MeasureTheory

namespace Conjugate

/-- **Non-singular** (Definition 1.3, paper.tex:230-233): there is a type `k` with
`ℙ_k[∑_j X_j(1) ≥ 2] > 0`, where `X(1)` has the offspring law `μ k`. -/
def IsNonsingular {ι : Type*} (μ : ι → PMF (ι →₀ ℕ)) : Prop :=
  ∃ k, 0 < (μ k).toMeasure {c | 2 ≤ c.sum fun _ n => n}

end Conjugate

end
```

## `Conjugate/Frozen/Defs/LogGenFun.lean` — Def 2.6, paper.tex:533-546; (3.5)

```lean
/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.GenFun
public import Mathlib.Analysis.SpecialFunctions.Log.ENNRealLog
public import Mathlib.Analysis.SpecialFunctions.Log.ERealExp

/-!
# The log-coordinate generating function (Definition 2.6)
-/

@[expose] public section

namespace Conjugate

/-- **The function `g`** (Definition 2.6, paper.tex:533-546; for the type set `ℕ`, (3.5)):
`g_k(λ) = log f_k(e^{λ_1}, e^{λ_2}, …)` for `λ ∈ (-∞,∞]^ι`, with `e^∞ = ∞` and `log ∞ = ∞`.
It is defined on all of `[-∞,∞]^ι` by the same formula (`e^{-∞} = 0`, `log 0 = -∞`).
Iterates `g^{(n)}` are `(logGenFun μ)^[n]`. -/
noncomputable def logGenFun {ι : Type*} (μ : ι → PMF (ι →₀ ℕ)) (x : ι → EReal) (k : ι) :
    EReal :=
  ENNReal.log (genFun μ (fun j => EReal.exp (x j)) k)

end Conjugate

end
```

## `Conjugate/Frozen/Defs/BasinZero.lean` — (2.9), paper.tex:726-729

```lean
/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.LogGenFun
public import Mathlib.Data.EReal.Inv
public import Mathlib.Topology.Instances.ENNReal.Lemmas

/-!
# The basin of attraction of `0` (2.9)
-/

@[expose] public section

open Filter Topology

namespace Conjugate

/-- **The basin of attraction of `0`** (2.9), paper.tex:726-729:
`S₀ = {λ ∈ [0,∞]^d : lim_{n→∞} |g^{(n)}(λ)| = 0}`.

`|·|` is taken to be the sup norm `max_j |λ_j|` on `[0,∞]^d` (the paper does not specify the
norm; all norms on `ℝ^d` are equivalent, and a vector with an infinite coordinate has
infinite norm in each of them, so the set does not depend on this choice). -/
def basinZero {ι : Type*} [Fintype ι] (μ : ι → PMF (ι →₀ ℕ)) : Set (ι → EReal) :=
  {x | (∀ j, 0 ≤ x j) ∧
    Tendsto (fun n => ⨆ j, ((logGenFun μ)^[n] x j).abs) atTop (𝓝 0)}

end Conjugate

end
```

## `Conjugate/Frozen/Defs/BasinInfty.lean` — (2.9), paper.tex:726-729

```lean
/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.LogGenFun
public import Mathlib.Data.EReal.Inv
public import Mathlib.Order.LiminfLimsup

/-!
# The basin of attraction of `∞` (2.9)
-/

@[expose] public section

open Filter

open scoped ENNReal

namespace Conjugate

/-- **The basin of attraction of `∞`** (2.9), paper.tex:726-729:
`S_∞ = {λ ∈ [0,∞]^d : limsup_{n→∞} |g^{(n)}(λ)| = ∞}`.

`|·|` is taken to be the sup norm `max_j |λ_j|` on `[0,∞]^d` (the paper does not specify the
norm; all norms on `ℝ^d` are equivalent, and a vector with an infinite coordinate has
infinite norm in each of them, so the set does not depend on this choice). -/
def basinInfty {ι : Type*} [Fintype ι] (μ : ι → PMF (ι →₀ ℕ)) : Set (ι → EReal) :=
  {x | (∀ j, 0 ≤ x j) ∧
    limsup (fun n => ⨆ j, ((logGenFun μ)^[n] x j).abs) atTop = ∞}

end Conjugate

end
```

## `Conjugate/Frozen/Defs/Truncate.lean` — §3.1, paper.tex:937-948

```lean
/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.PopulationMeasurableSpace
public import Mathlib.Data.Finsupp.Basic
public import Mathlib.Probability.ProbabilityMassFunction.Constructions

/-!
# The branching process truncated at level `d` (§3.1)
-/

@[expose] public section

namespace Conjugate

/-- **The branching process truncated at level `d`** (paper.tex:937-948).

Lean indexes types from `0`: the paper's type `k ∈ {1, 2, …}` is the Lean type `k - 1 : ℕ`,
and its types `{1,…,d}` are `Fin d`. `X^d` is obtained from `X` by immediately killing every
individual of (paper) type `≥ d + 1`; so a type-`k` individual with `k ≤ d` has offspring
vector `(X_1(1), …, X_d(1))`, the restriction of its offspring vector in `X`, and
`truncate μ d k` is the image of `μ k` under this restriction. -/
noncomputable def truncate (μ : ℕ → PMF (ℕ →₀ ℕ)) (d : ℕ) : Fin d → PMF (Fin d →₀ ℕ) :=
  fun k => (μ k).map fun c => c.comapDomain Fin.val Fin.val_injective.injOn

end Conjugate

end
```

## (supporting, not frozen) `Conjugate/Infrastructure/Population.lean`

```lean
/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.PopulationMeasurableSpace

/-!
# Basic instances for populations

The discrete σ-algebra `Conjugate.populationMeasurableSpace` makes every set of
populations measurable.
-/

public section

namespace Conjugate

instance instDiscreteMeasurableSpacePopulation (ι : Type*) :
    DiscreteMeasurableSpace (ι →₀ ℕ) :=
  ⟨fun _ => trivial⟩

end Conjugate

end
```

## (supporting, not frozen) `Conjugate/Infrastructure/StepKernel.lean`

```lean
/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.StepKernel

/-!
# `stepKernel` is a Markov kernel
-/

public section

open MeasureTheory ProbabilityTheory

namespace Conjugate

instance isMarkovKernel_stepKernel {ι : Type*} [Countable ι] (μ : ι → PMF (ι →₀ ℕ)) :
    IsMarkovKernel (stepKernel μ) := by
  refine ⟨fun x => ?_⟩
  simp only [stepKernel, Kernel.ofFunOfCountable, Kernel.coe_mk]
  exact (Measure.isProbabilityMeasure_map_iff (measurable_of_countable _).aemeasurable).2
    inferInstance

end Conjugate

end
```

