# Brief W-A2 — branching property, extinction, subcritical means (Lane A, Sonnet)

**Goal.** Prove these properties of the generation process:
- the branching (independence) property at the level of generation laws;
- absorption at `0`;
- the extinction-probability formulas;
- that subcritical processes die out from every initial population;
- decay of `M^n` and the Neumann-series vector for a subcritical mean matrix.

**Graph nodes served** (`DEPGRAPH.md`, read-only for you):
- `claim:branching-property` (the independence part);
- `claim:subcritical-extinction` (paper.tex:238, including the bridge from per-type
  extinction to extinction from every population);
- the decay of `M^n` used in `lem-gf-bded` (Lemma 2.5). The project proves Lemma 2.5 via the
  Neumann series instead of Perron–Frobenius (`PLAN.md` §6).

**Ownership.** Create only these files:
- `Conjugate/Internal/Foundations/Branching.lean`;
- `Conjugate/Internal/Foundations/Extinction.lean`;
- `Conjugate/Internal/Foundations/MeanDecay.lean`.

You may split these further under `Conjugate/Internal/Foundations/`. Edit nothing else. In
particular, do not edit the W-A1 files `StepKernel.lean`, `PathLaw.lean` and
`Generations.lean` in that directory. Import them instead.

**Allowed inputs.**
- Mathlib.
- `Conjugate/Frozen/Defs/*` (all SEALED definitions).
- `Conjugate/Infrastructure/{Population,StepKernel}.lean`.
- The W-A1 modules `Conjugate.Internal.Foundations.{StepKernel,PathLaw,Generations}`. Their
  public API includes `stepKernel_zero`, `stepKernel_single`, `lintegral_stepKernel_prod`,
  `lintegral_stepKernel_apply`, `pathLaw_cylinder`, `pathLaw_map_eval_zero`,
  `pathLaw_map_eval_succ`, `lintegral_pathLaw_prod` and `lintegral_pathLaw_apply`; read those
  files for the exact statements.
- Nothing else under `Conjugate/Internal/` or `Conjugate/Frozen/` (other than `Defs`).

**Exact public API to prove** (namespace `Conjugate`, `variable {ι : Type*} [Countable ι]`).
All statements have been elaborated against the current build. Additional helpers with other
names are welcome.

```lean
open MeasureTheory ProbabilityTheory Filter Topology
open scoped ENNReal

-- Branching.lean
theorem stepKernel_add (μ : ι → PMF (ι →₀ ℕ)) (x y : ι →₀ ℕ) :
    stepKernel μ (x + y) = stepKernel μ x ∗ stepKernel μ y

theorem pathLaw_map_eval_add (μ : ι → PMF (ι →₀ ℕ)) (x y : ι →₀ ℕ) (n : ℕ) :
    (pathLaw μ (x + y)).map (fun ω => ω n) =
      (pathLaw μ x).map (fun ω => ω n) ∗ (pathLaw μ y).map (fun ω => ω n)

theorem pathLaw_map_eval_add_time (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) (n m : ℕ) :
    (pathLaw μ x).map (fun ω => ω (n + m)) =
      ((pathLaw μ x).map fun ω => ω n).bind fun y => (pathLaw μ y).map fun ω => ω m

-- Extinction.lean
theorem ae_eval_eq_zero_of_le (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) {n m : ℕ} (h : n ≤ m) :
    ∀ᵐ ω ∂pathLaw μ x, ω n = 0 → ω m = 0

theorem pathLaw_extinctionEvent_eq_iSup (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) :
    pathLaw μ x (extinctionEvent ι) = ⨆ n, pathLaw μ x {ω | ω n = 0}

theorem pathLaw_extinctionEvent_eq_prod (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) :
    pathLaw μ x (extinctionEvent ι) =
      x.prod fun k n => pathLaw μ (Finsupp.single k 1) (extinctionEvent ι) ^ n

theorem pathLaw_extinctionEvent_eq_one {ι : Type*} [Fintype ι] [DecidableEq ι]
    (μ : ι → PMF (ι →₀ ℕ)) (hμ : IsSubcritical μ) (x : ι →₀ ℕ) :
    pathLaw μ x (extinctionEvent ι) = 1

-- MeanDecay.lean
theorem tendsto_meanMatrix_pow {ι : Type*} [Fintype ι] [DecidableEq ι]
    (μ : ι → PMF (ι →₀ ℕ)) (hμ : IsSubcritical μ) (k j : ι) :
    Tendsto (fun n => (meanMatrix μ ^ n) k j) atTop (𝓝 0)

theorem exists_meanMatrix_superharmonic {ι : Type*} [Fintype ι] [DecidableEq ι]
    (μ : ι → PMF (ι →₀ ℕ)) (hμ : IsSubcritical μ) :
    ∃ v : ι → ℝ≥0∞, (∀ k, 1 ≤ v k ∧ v k < ∞) ∧ ∀ k, (∑ j, meanMatrix μ k j * v j) + 1 = v k
```

`∗` is `MeasureTheory.Measure.conv` (`Mathlib.MeasureTheory.Group.Convolution`, additive
version of `mconv`). Also prove and export a corollary of
`pathLaw_extinctionEvent_eq_prod`: if `pathLaw μ (single k 1) (extinctionEvent ι) = 1` for
every `k`, then `pathLaw μ x (extinctionEvent ι) = 1` for every `x`. Name and state it, and
report it.

**Notes from W-A1** (already available to you):
- `isProbabilityMeasure_pathLaw` is an instance.
- `lintegral_pathLaw_succ` is the integral form of the Markov property:
  `∫⁻ F(ω(n+1)) dℙ_x = ∫⁻ (∫⁻ F d stepKernel μ (ω n)) dℙ_x`.
- `lintegral_pathLaw_zero`, `lintegral_pathLaw_apply_sum` and `lintegral_pathLaw_apply_vecMul`
  give means from a general start. `lintegral_pi_prod` is the product formula over
  `Measure.pi`. `Individuals x` and `offspringPi μ x` give the product-measure description of
  `stepKernel μ x` (`stepKernel_eq_map`, `lintegral_stepKernel`).
- Pitfall: `meanMatrix μ k j` is not type-correct at `implicit` transparency (`Matrix` is a
  plain `def`), so `rw`/`simp_rw` under integrands containing it can fail. W-A1 worked around
  this by proving lemmas for a generic `A : ι → ℝ≥0∞` and instantiating them.

**Hints (not requirements).**
- `stepKernel_add`. The individuals of `x + y` split as the individuals of `x` plus those of
  `y`. A cleaner route on this discrete countable space is to compare point masses: show both
  sides give the same mass to every `{z}`. Both are measures on a countable discrete space
  (`Measure.ext_of_singleton`-style arguments, or `Measure.ext` with
  `MeasurableSet.of_discrete`). Another route is to compare generating functions, but that
  needs a uniqueness theorem; avoid it unless it is easy.
- `pathLaw_map_eval_add`: induction on `n` with `pathLaw_map_eval_succ`, `stepKernel_add`,
  and the fact that convolution commutes with `bind` of a kernel that is additive in this sense.
- `pathLaw_map_eval_add_time` is Chapman–Kolmogorov for the one-dimensional marginals:
  induction on `m`.
- Absorption: `stepKernel μ 0 = dirac 0` and `pathLaw_map_eval_succ` give
  `P_x(ω n = 0, ω (n+1) ≠ 0) = 0`.
- Extinction: `extinctionEvent ι = {ω | ∀ᶠ n in atTop, ω n = 0}`, and a.s. it equals
  `⋃ n, {ω n = 0}`. Use continuity from below for the increasing (a.s.) family.
- Product formula: `P_{x+y}(X n = 0) = P_x(X n = 0) · P_y(X n = 0)` from
  `pathLaw_map_eval_add`, since `a + b = 0 ↔ a = 0 ∧ b = 0` in `ι →₀ ℕ`. Then take `iSup`
  (monotone limits of products). Induct on `x` (`Finsupp.induction`).
- Subcritical extinction:
  `P_x(X n ≠ 0) ≤ 𝔼_x[∑_j X_j(n)] = ∑_{k,j} x_k (M^n)_{kj} → 0`. Use Markov's inequality, the
  mean formula from W-A1 and `tendsto_meanMatrix_pow`.
- `tendsto_meanMatrix_pow`: `IsSubcritical` gives finite entries and
  `spectralRadius ℂ (M_ℂ) < 1`, where `M_ℂ` is the entrywise image in `ℂ`. Equip
  `Matrix ι ι ℂ` with a normed algebra structure as a **local instance**: e.g.
  `Matrix.linftyOpNormedAlgebra` or `Matrix.frobeniusNormedAlgebra` (check the names at this
  pin). Then Gelfand's formula
  (`spectrum.pow_nnnorm_pow_one_div_tendsto_nhds_spectralRadius`, or the `limsup` version)
  gives `‖M_ℂ^n‖ ≤ C θ^n` with `θ < 1`. Entries are bounded by the norm, and
  `(M^n)_{kj}` in `ℝ≥0∞` corresponds to `(M_ℂ^n)_{kj}` via `toReal` because the entries are
  finite.
- `exists_meanMatrix_superharmonic`: take `v k = ∑' n, ∑ j, (M^n) k j`. It is finite by
  geometric decay, `≥ 1` from the `n = 0` term, and `M v + 1 = v` by reindexing the series.

**Checks** (run them and paste the output):
```bash
export PATH="$HOME/.elan/bin:$HOME/.local/bin:$PATH"
lake build Conjugate.Internal.Foundations.Branching Conjugate.Internal.Foundations.Extinction Conjugate.Internal.Foundations.MeanDecay
python3 -I tools/check_lean_modules.py --root . --max-lines 1500 --files Conjugate/Internal/Foundations/*.lean
python3 -I tools/leanprobe.py axioms <Module> <Decl>   # for every public theorem listed above
```
Only `propext`, `Classical.choice` and `Quot.sound` are acceptable.

**Concurrency.** Another agent may be working at the same time on `Conjugate/Infrastructure/Brouwer*`.
- Build only your own modules, with explicit targets as above, or `lake env lean <your file>`.
- Never run `lake build` with no target. Never build or touch the other agent's files.

**Stop condition.** You are done when every listed theorem compiles without `sorry` and with
the standard axioms only. Stop early and report if:
- a listed statement appears false or mis-typed. Do not change it; report the problem;
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

Use the copyright header of the existing files. Put scratch files in `.lake/probes/a2/`.

**Handoff.** Report:
- the files created;
- the approach for each theorem;
- the exact commands and their output;
- axioms;
- the corollary you added;
- reusable helpers;
- anything unproved or uncertain.
