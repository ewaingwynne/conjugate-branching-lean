# Brief W-B3 — Thm 1.4 equivalence, Prop 1.6 conjugate form, Remark "Hyp. III necessary"

**Goal.** Prove the providers of four frozen anchors:
- `Conjugate.exists_conjugate_iff_exists_fixedPoint` (paper.tex:238; ERRATA R3);
- `Conjugate.proposition_1_6_conjugate` (paper.tex:343-356; ERRATA R5): a conjugate exists, and
  it is unique in law;
- `Conjugate.remark_hypIII_necessary` (paper.tex:252): the `a m⁻³` example;
- `Conjugate.theorem_1_4_conjugate` (paper.tex:241-250; ERRATA R3). It is the sealed
  `Conjugate.theorem_1_4_fixedPoint` (module `Conjugate.Frozen.Theorem_1_4_FixedPoint`) followed by
  `isConjugate_of_fixedPoint`.

Along the way, prove two reusable subcriticality criteria and the two directions of the
equivalence with an **explicit tilt formula**.

**Graph nodes served** (`DEPGRAPH.md`, read-only for you):
- `thm-fixed-gf.equivalence` with its steps `#fixed-point-to-conjugate`, `#hat-differs-from-X`,
  `#conjugate-to-fixed-point` and `#conjugate-is-tilt`;
- `prop-single-type.conjugate` with its steps;
- `rem:hyp-iii-necessary` with its steps.

**Approved route deviation for "conjugate ⇒ fixed point"** (record it in your report). The paper
applies Prop 2.1 to `X̂`, which needs `X̂` positive regular, non-singular and `0 < ℙ̂_k[E] < 1`:
the leaf `thm-fixed-gf.equivalence#conjugate-regularity`. **Do not do that.** Read the tilt off
generation 1 directly:
- Let `a_j = ℙ̂_j[E]`.
- `a_k > 0` for every `k`: otherwise `ℙ̂_k[·|E] = 0 ≠ ℙ_k`. Note that `ProbabilityTheory.cond`
  gives the zero measure on a null set.
- The Markov property at time 1 (W-B2 `pathLaw_cylinder_inter_shift` with `n = 1`), together with
  `pathLaw_cylinder`, `stepKernel_single` and the extinction product formula
  `pathLaw_extinctionEvent_eq_prod` for `μHat`, gives
  `ℙ_k[X(1) = c] = μ_k(c) = μ̂_k(c) ∏_j a_j^{c_j} / a_k`.
- With `q = 1/a` this is `μ̂_k(c) = q_k⁻¹ μ_k(c) ∏ q_j^{c_j}`.
- Summing over `c` gives `f(q) = q`, with `q` finite and `q ≥ 1`.
- If `q = 𝟙`, then `μ̂ = μ`, which contradicts the first clause of `IsConjugate`.
- Lemma 2.3 (W-A4 `eq_one_or_one_lt_of_genFun_eq_self`, with certain extinction from
  `pathLaw_extinctionEvent_eq_one`) then gives `q ∈ (1,∞)^d`.

**"Fixed point ⇒ conjugate"** uses the **sealed** frozen anchor `Conjugate.proposition_2_2`
(module `Conjugate.Frozen.Proposition_2_2`). Its tilt `μHat` has `ℙ̂_k[E] = 1/q_k < 1 = ℙ_k[E]`,
so the laws differ.

**Ownership.**
- New files:
  - `Conjugate/Internal/Analytic/Subcritical.lean`, for the criteria;
  - `Conjugate/Internal/Conjugacy/*.lean`, for the equivalence directions;
  - `Conjugate/Internal/Examples/HypIIINecessary*.lean`, for the remark's example.
- The existing stubs `Conjugate/Internal/ExistsConjugateIff.lean`,
  `Conjugate/Internal/Proposition_1_6_Conjugate.lean`,
  `Conjugate/Internal/Remark_HypIII_Necessary.lean` and
  `Conjugate/Internal/Theorem_1_4_Conjugate.lean`. Keep header and docstring.
- Edit nothing else.

**Allowed inputs.**
- Mathlib.
- `Conjugate/Frozen/Defs/*`.
- `Conjugate.Infrastructure.{Population,StepKernel}`.
- `Conjugate.Internal.{Foundations,Analytic,Section2,PathSpace,SingleType}.*`.
- The **sealed** frozen modules `Conjugate.Frozen.Proposition_2_2`,
  `Conjugate.Frozen.Proposition_1_6_FixedPoint`, `Conjugate.Frozen.Proposition_2_1_CondLaw`,
  `Conjugate.Frozen.Remark_HypIII_Automatic`, `Conjugate.Frozen.Theorem_2_7` and
  `Conjugate.Frozen.Theorem_1_4_FixedPoint`.

Never import a DRAFT anchor (check `frozen-anchor-manifest.json` states) or a provider of
another anchor.

**Exact public API** (namespace `Conjugate`; all elaborated against the current build):
```lean
open MeasureTheory ProbabilityTheory Filter Topology
open scoped ENNReal

-- Analytic/Subcritical.lean
theorem isSubcritical_of_sum_lt_one {ι : Type*} [Fintype ι] [DecidableEq ι]
    (μ : ι → PMF (ι →₀ ℕ)) (h : ∀ k, ∑ j, meanMatrix μ k j < 1) : IsSubcritical μ

theorem isSubcritical_fin_one_iff (μ : Fin 1 → PMF (Fin 1 →₀ ℕ)) :
    IsSubcritical μ ↔ meanMatrix μ 0 0 < 1

-- Conjugacy/*.lean
theorem isConjugate_of_fixedPoint {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hsub : IsSubcritical μ) (hpr : IsPositiveRegular μ) (hns : IsNonsingular μ)
    {q : Fin d → ℝ≥0∞} (hq : ∀ j, 1 < q j ∧ q j < ∞) (hfix : genFun μ q = q) :
    ∃ μHat, IsConjugate μ μHat ∧
      ∀ k c, μHat k c = (q k)⁻¹ * (μ k c * c.prod fun j n => q j ^ n)

theorem exists_fixedPoint_of_isConjugate {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hsub : IsSubcritical μ) (hpr : IsPositiveRegular μ) {μHat : Fin d → PMF (Fin d →₀ ℕ)}
    (h : IsConjugate μ μHat) :
    ∃ q : Fin d → ℝ≥0∞, (∀ j, 1 < q j ∧ q j < ∞) ∧ genFun μ q = q ∧
      ∀ k c, μHat k c = (q k)⁻¹ * (μ k c * c.prod fun j n => q j ^ n)
```
**Hints for the criteria.**
- For `isSubcritical_of_sum_lt_one`, use `spectrum.spectralRadius_le_nnnorm` (check the current
  name) for the `L^∞` operator-norm normed algebra on `Matrix ι ι ℂ`
  (`open scoped Matrix.Norms.Operator`; see `Conjugate/Internal/Foundations/MeanDecay.lean`).
  Its norm is the maximal absolute row sum. Each row sum `< 1` also makes the entries finite.
- For the `Fin 1` iff:
  - `⇐` is the criterion;
  - `⇒`: a `1×1` complex matrix `[z]` has spectrum `{z}`, via `Matrix (Fin 1) (Fin 1) ℂ ≃ₐ[ℂ] ℂ`
    and `AlgEquiv.spectrum_eq`, or directly. So the spectral radius is `‖z‖₊ = M₀₀ < 1`.

**Providers** (exact frozen types and binder names; read the frozen files):
```lean
namespace Conjugate.Internal
theorem exists_conjugate_iff_exists_fixedPoint {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hsub : IsSubcritical μ) (hpr : IsPositiveRegular μ) (hns : IsNonsingular μ) :
    (∃ μHat : Fin d → PMF (Fin d →₀ ℕ), IsConjugate μ μHat) ↔
      ∃ q : Fin d → ℝ≥0∞, (∀ j, 1 < q j ∧ q j < ∞) ∧ genFun μ q = q

theorem proposition_1_6_conjugate (μ : Fin 1 → PMF (Fin 1 →₀ ℕ))
    (hI : meanMatrix μ 0 0 < 1)
    (hII : 0 < (μ 0).toMeasure {c | 2 ≤ c 0})
    (hIII : ContinuousOn (fun q : ℝ≥0∞ => genFun μ (fun _ => q) 0) (Set.Ioi 0)) :
    (∃ μHat, IsConjugate μ μHat) ∧
      ∀ μ₁ μ₂, IsConjugate μ μ₁ → IsConjugate μ μ₂ →
        pathLaw μ₁ (Finsupp.single 0 1) = pathLaw μ₂ (Finsupp.single 0 1)

theorem remark_hypIII_necessary :
    ∃ a b : ℝ≥0∞, 0 < a ∧ 0 < b ∧ ∃ μ : Fin 1 → PMF (Fin 1 →₀ ℕ),
      μ 0 0 = b ∧ (∀ m : ℕ, 1 ≤ m → μ 0 (Finsupp.single 0 m) = a * ((m : ℝ≥0∞) ^ 3)⁻¹) ∧
      IsSubcritical μ ∧ (IsPositiveRegular μ ∧ IsNonsingular μ) ∧
      (∀ q : ℝ≥0∞, 1 < q → q < ∞ → genFun μ (fun _ => q) 0 = ∞) ∧
      ¬ ∃ μHat, IsConjugate μ μHat

theorem theorem_1_4_conjugate {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hI : IsSubcritical μ) (hII : IsPositiveRegular μ ∧ IsNonsingular μ)
    (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j}) :
    ∃ μHat : Fin d → PMF (Fin d →₀ ℕ), IsConjugate μ μHat
```
The seals will be:
- `by exact Conjugate.Internal.exists_conjugate_iff_exists_fixedPoint μ hsub hpr hns`;
- `by exact Conjugate.Internal.proposition_1_6_conjugate μ hI hII hIII`;
- `by exact Conjugate.Internal.remark_hypIII_necessary`;
- `by exact Conjugate.Internal.theorem_1_4_conjugate μ hI hII hIII`.

**Prop 1.6 (conjugate).**
- *Existence.* Use the sealed `Conjugate.proposition_1_6_fixedPoint`, which gives a unique fixed
  point in `(1,∞)`, together with:
  - `isSubcritical_fin_one_iff`;
  - positive regularity with `N = 1`, since `ℙ_0[X(1) ≥ 1] ≥ ℙ_0[X(1) ≥ 2] > 0` (W-A4
    `pathLaw_map_eval_one` and `stepKernel_single` identify the generation-1 law with `μ 0`);
  - non-singularity from `hII`;
  - `isConjugate_of_fixedPoint`.
- *Uniqueness in law.* `exists_fixedPoint_of_isConjugate` gives `μ₁` and `μ₂` as tilts by fixed
  points `q₁, q₂ ∈ (1,∞)`. Uniqueness of the fixed point gives `q₁ = q₂` (for `Fin 1`, functions
  are determined by their value at `0`). So `μ₁ = μ₂` pointwise (`PMF.ext`), and the laws agree.

**The remark's example** (choose your constants).
- One convenient choice is `a = 1/4`, `b = 1 − a·ζ(3)` with `ζ(3) = ∑_{m≥1} m⁻³`.
  - `ζ(3) ≤ ζ(2) = π²/6 < 4` (Mathlib: `hasSum_zeta_two`), so `b > 0`.
  - The mean is `a·ζ(2) = π²/24 < 1`, which gives subcriticality via `isSubcritical_fin_one_iff`
    or the criterion.
- Build the law as the push-forward of a PMF on `ℕ` along `m ↦ Finsupp.single 0 m`.
  `Fin 1 →₀ ℕ ≃ ℕ`, and every `c` equals `single 0 (c 0)`.
- **Positive regular** with `N = 1`. **Non-singular**: `ℙ[X(1) ≥ 2] ≥ a/8 > 0`.
- **`f(q) = ∞` for `q ∈ (1,∞)`.** The terms `a q^m/m³` do not tend to 0, because
  `m³/q^m → 0` (`tendsto_pow_const_div_const_pow_of_one_lt` or similar). An `ℝ≥0∞` series with a
  finite sum has terms tending to 0 (`ENNReal.tendsto_cofinite_zero_of_tsum_ne_top`).
- **No conjugate.** `exists_fixedPoint_of_isConjugate` would give `q ∈ (1,∞)` with
  `f(q) = q < ∞`, a contradiction.

**Checks** (run them and paste the output):
```bash
export PATH="$HOME/.elan/bin:$HOME/.local/bin:$PATH"
lake build Conjugate.Internal.ExistsConjugateIff Conjugate.Internal.Proposition_1_6_Conjugate Conjugate.Internal.Remark_HypIII_Necessary Conjugate.Internal.Theorem_1_4_Conjugate Conjugate.Internal.Analytic.Subcritical
python3 -I tools/check_lean_modules.py --root . --max-lines 1500 --files <all your files>
python3 -I tools/leanprobe.py axioms <Module> <Decl>   # every public theorem above and all four providers
```
Only `propext`, `Classical.choice` and `Quot.sound` are acceptable.

**Seal probes.**
- For each provider, take a copy of the frozen file with `by sorry` replaced by the seal body
  above, and put it in `.lake/probes/b3/`.
- Compile it with lakefile options (prefer a module target; a bare `lake env lean` ignores
  `autoImplicit false`).
- Report the result, then delete it.

**Concurrency.** Other agents work at the same time on other files.
- Build only your own modules, with explicit targets.
- Never run `lake build` with no target.

**Stop condition.** You are done when everything listed compiles without `sorry`, with the
standard axioms only, and the four seal probes pass. Stop early and report if:
- a statement appears false or mis-typed (do not change it);
- a sealed anchor you need is not sealed.

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

(Rule 4: you author these four providers. Never import their frozen files. Keep unfinished work
in `.lake/probes/b3/`, never in `Conjugate/`.)

Use the copyright header of the existing files.

**Handoff.** Report:
- the files created;
- the approach;
- the route deviation note;
- the exact commands and their output;
- axioms;
- the seal-probe results;
- reusable helpers;
- anything unproved or uncertain.
