# Brief W-A1 — path-space foundations (Lane A, Sonnet)

**Goal.** Prove the basic characterization theorems of the frozen definitions `stepKernel` and
`pathLaw`:
- the one-step offspring generating function and mean;
- the finite-dimensional distributions of the generation process;
- the generation-`n` generating function (display (1.2)) and mean (`M^n`).

**Graph nodes served** (`DEPGRAPH.md`):
- `claim:branching-property` (its Markov part: finite-dimensional distributions);
- `eqn-gen-func-n` (paper.tex:209-213, with ERRATA E2: product over `j ≤ d`);
- `claim:mean-matrix-powers` (paper.tex:219-220).

These nodes are read-only context for you. Do not edit the graph.

**Ownership.** Create only these files:
- `Conjugate/Internal/Foundations/StepKernel.lean`: the one-step facts.
- `Conjugate/Internal/Foundations/PathLaw.lean`: finite-dimensional distributions and marginals.
- `Conjugate/Internal/Foundations/Generations.lean`: the generation-`n` formulas.

You may split these further under `Conjugate/Internal/Foundations/` if a file would exceed
1500 lines. Edit nothing else.

**Frozen definitions you consume (read-only, all SEALED).** They live in
`Conjugate/Frozen/Defs/`: `StepKernel.lean`, `PathLaw.lean`, `GenFun.lean`, `MeanMatrix.lean`
and `PopulationMeasurableSpace.lean`. Also use `Conjugate/Infrastructure/StepKernel.lean`
(`IsMarkovKernel` instance) and `Conjugate/Infrastructure/Population.lean`
(`DiscreteMeasurableSpace` instance).

Read the definitions carefully before you start:
- `stepKernel μ x` is `Kernel.ofFunOfCountable` of the push-forward, under `y ↦ ∑ p, y p`, of
  `Measure.pi` over the individuals `p : Σ j : x.support, Fin (x j)` of `(μ p.1).toMeasure`.
- `pathLaw μ x` is `Kernel.trajMeasure (Measure.dirac x)` with the time-`n` kernel
  `(stepKernel μ).comap (ω ↦ ω n)`.
- `genFun μ q k = ∫⁻ c, c.prod (fun j n => q j ^ n) ∂(μ k).toMeasure`.
- `meanMatrix μ k j = ∫⁻ c, (c j : ℝ≥0∞) ∂(μ k).toMeasure`.

**Allowed inputs.** Mathlib and the files above. Do not import anything under `Conjugate/Frozen/`
other than `Conjugate/Frozen/Defs/*`. Do not import `Conjugate/Internal/*` other than your own files.

**Exact public API to prove.** Use exactly these names and types, in namespace `Conjugate`,
with `variable {ι : Type*} [Countable ι]` unless shown otherwise. Each statement has been
elaborated against the current build. You may add further helper lemmas (public or private) with
other names.

```lean
open MeasureTheory ProbabilityTheory
open scoped ENNReal

-- StepKernel.lean
theorem stepKernel_zero (μ : ι → PMF (ι →₀ ℕ)) : stepKernel μ 0 = Measure.dirac 0

theorem stepKernel_single (μ : ι → PMF (ι →₀ ℕ)) (k : ι) :
    stepKernel μ (Finsupp.single k 1) = (μ k).toMeasure

theorem lintegral_stepKernel_prod (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) (q : ι → ℝ≥0∞) :
    ∫⁻ y, y.prod (fun j n => q j ^ n) ∂(stepKernel μ x) = x.prod fun k n => genFun μ q k ^ n

theorem lintegral_stepKernel_apply (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) (j : ι) :
    ∫⁻ y, (y j : ℝ≥0∞) ∂(stepKernel μ x) = x.sum fun k n => (n : ℝ≥0∞) * meanMatrix μ k j

-- PathLaw.lean
theorem pathLaw_cylinder (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) (n : ℕ) (y : ℕ → ι →₀ ℕ) :
    pathLaw μ x {ω | ∀ i ≤ n, ω i = y i} =
      Measure.dirac x {y 0} * ∏ i ∈ Finset.range n, stepKernel μ (y i) {y (i + 1)}

theorem pathLaw_map_eval_zero (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) :
    (pathLaw μ x).map (fun ω => ω 0) = Measure.dirac x

theorem pathLaw_map_eval_succ (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) (n : ℕ) :
    (pathLaw μ x).map (fun ω => (ω n, ω (n + 1))) =
      ((pathLaw μ x).map fun ω => ω n) ⊗ₘ stepKernel μ

-- Generations.lean
theorem lintegral_pathLaw_prod (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) (n : ℕ) (q : ι → ℝ≥0∞) :
    ∫⁻ ω, (ω n).prod (fun j m => q j ^ m) ∂(pathLaw μ x) =
      x.prod fun k m => (genFun μ)^[n] q k ^ m

theorem lintegral_pathLaw_apply {ι : Type*} [Fintype ι] [DecidableEq ι]
    (μ : ι → PMF (ι →₀ ℕ)) (k j : ι) (n : ℕ) :
    ∫⁻ ω, (ω n j : ℝ≥0∞) ∂(pathLaw μ (Finsupp.single k 1)) = (meanMatrix μ ^ n) k j
```

Also prove, in `Generations.lean`, the general-start version of the mean formula. This is the
row vector `x` times `M^n`. Choose its exact form, in namespace `Conjugate`, and report it.

**Hints (not requirements).**
- Mathlib's `Mathlib/Probability/Kernel/IonescuTulcea/Traj.lean` has
  `Kernel.map_frestrictLe_trajMeasure_compProd_eq_map_trajMeasure`. It gives the joint law of
  `(ω|_{Iic a}, ω (a+1))` as the law of `ω|_{Iic a}` composed with `κ a`. It is the natural
  induction step for `pathLaw_cylinder` and `pathLaw_map_eval_succ`. Also see `traj_map_frestrictLe`
  and the `partialTraj` API.
- All measurable spaces here are discrete and countable. Singletons are measurable, and
  measures of sets are `tsum`s over points (`Measure.count`/`PMF` API, `lintegral_countable'`,
  `MeasureTheory.lintegral_fintype`, `Measure.pi` on a `Fintype` index of countable discrete
  spaces).
- For `lintegral_stepKernel_prod`, the integrand composed with the sum map is
  `∏ p, (y p).prod (q^·)`, a product over the individuals. Mathlib has
  `MeasureTheory.integral_fintype_prod_eq_prod` (Bochner) in `Mathlib/MeasureTheory/Integral/Pi.lean`.
  For `lintegral` you may need to prove the `Measure.pi` product formula yourself. For a finite
  index it is an induction using `Measure.pi` and `lintegral_prod_mul`, or a direct `tsum`
  computation on the discrete space. Then regroup the product over individuals by type.
- For the generation-`n` formulas, induct on `n`, generalizing `q` (respectively `x`). Use
  `pathLaw_map_eval_succ` to write `𝔼_x[F(X(n+1))] = 𝔼_x[∫ F d stepKernel μ (X n)]`, then
  apply the one-step formula.

**Checks** (run them and paste the output):
```bash
export PATH="$HOME/.elan/bin:$HOME/.local/bin:$PATH"
lake build Conjugate.Internal.Foundations.StepKernel Conjugate.Internal.Foundations.PathLaw Conjugate.Internal.Foundations.Generations
python3 -I tools/check_lean_modules.py --root . --max-lines 1500 --files Conjugate/Internal/Foundations/*.lean
python3 -I tools/leanprobe.py axioms Conjugate.Internal.Foundations.Generations Conjugate.lintegral_pathLaw_prod
```
Run the axioms probe for **every** public theorem listed above, from the module that declares
it. Only `propext`, `Classical.choice` and `Quot.sound` are acceptable.

**Concurrency.** Another agent is working at the same time on `Conjugate/Infrastructure/Brouwer*`.
- Build only your own modules, with explicit targets as above, or `lake env lean <your file>`.
- Never run `lake build` with no target. Never build or touch the other agent's files.

**Stop condition.** You are done when every listed theorem compiles without `sorry` and with
the standard axioms only. Stop early and report if:
- a listed statement appears false or mis-typed. Do not change it; report the counterexample
  or the typing problem;
- a frozen definition behaves unexpectedly;
- you are stuck on one theorem after a serious attempt. Finish the others and report the
  precise remaining gap.

**Hard rules (verbatim from CLAUDE.md).**

1. Never edit a file under `Conjugate/Frozen/`, `frozen-anchor-manifest.json`,
   `DEPGRAPH*.md`, `STATUS.md`, `ERRATA.md`, `lakefile.toml`, `lean-toolchain`
   or `lake-manifest.json`. If a frozen declaration looks wrong, stop and report.
2. No `sorry`, `admit`, `axiom`, `opaque` placeholders, `native_decide`,
   `implemented_by`, `@[extern]`, `unsafe`, or `set_option maxHeartbeats`
   (or any other heartbeat / recursion / debug override) anywhere in tracked files.
   Unfinished work stays out of `Conjugate/` or is reported as unfinished.
3. Never add a hypothesis to a source-facing statement to make a proof go through.
   A needed intermediate result is proved, not assumed.
4. Never import a frozen anchor that is in state `DRAFT_SORRY`, nor its provider
   module (see the manifest). Consume only sealed anchors and your own files.
5. Every Lean file is a `module`: copyright comment, `module`, imports
   (`public import` for anything statements need), module docstring,
   `public section` (`@[expose] public section` for source-facing definitions).
6. At most 1500 lines per file. Split larger files.
7. Do not run `lake clean`, delete anything under `.lake/`, or modify Mathlib.
8. Do not commit; the orchestrator commits. Do not touch files you were not given.
9. Scratch and probe files go outside `Conjugate/` (e.g. `.lake/probes/`) and are
   deleted after use.
10. Report exactly: files changed, approach, the exact commands run and their output,
    `#print axioms` for every new public theorem, and anything unproved or uncertain.

Use the copyright header of the existing files:
```
/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
```
Put your scratch files in `.lake/probes/a1/`.

**Handoff.** Report:
- the files created;
- the approach for each theorem;
- the exact commands and their output;
- axioms for every public theorem;
- the general-start mean statement you chose;
- any helper lemma that later work might reuse;
- anything unproved or uncertain.
