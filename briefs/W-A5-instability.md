# Brief W-A5 — Lemma 2.5, Lemma 2.11, Proposition 2.10 and Lemma 2.13 (Lane A, Sonnet)

**Goal.** Prove:
- the existence of a point with `f(q⁰) < q⁰` (Lemma 2.5);
- the scaling lemma (Lemma 2.11);
- the instability proposition (Proposition 2.10), together with its subsequence version
  (Lemma 2.13).

**Graph nodes served** (`DEPGRAPH.md`, read-only for you):
- `lem-gf-bded` (Lemma 2.5, paper.tex:500-527);
- `lem-unstable-scaled` (Lemma 2.11, paper.tex:619-639);
- `prop-unstable` (Prop 2.10, paper.tex:608-650);
- `lem-unstable-ssl` (Lemma 2.13, paper.tex:653-665).

**Proof-route deviations (approved in `PLAN.md` §6; follow them).**
- **Lemma 2.5: no Perron–Frobenius.**
  - Use `exists_meanMatrix_superharmonic` (W-A2). It gives a finite `v ≥ 𝟙` with
    `M v + 𝟙 = v`, so `(M v)_k < v_k`.
  - The right derivative of `ε ↦ f_k(𝟙 + ε v)` at `0⁺` is `(M v)_k`. Prove this by monotone
    convergence: the difference quotients of the monomials are monotone in `ε` (convexity of
    `t ↦ ∏_j (1 + t v_j)^{c_j}`).
  - So `f_k(𝟙 + ε v) < 1 + ε v_k` for small `ε > 0`.
  - You need `f` finite on a neighbourhood of `𝟙`. It follows from Hyp. III (continuity at
    `𝟙`) and `f(𝟙) = 𝟙`.
- **Lemma 2.11: no Vitali.**
  - Let `Z_n = ∏ e^{r x_j X_j(n)}`. Then `Z_n ≥ 1`, so
    `𝔼 Z_n = ℙ(Z_n = 1) + 𝔼[Z_n; Z_n > 1]`.
  - Hölder (`ENNReal.lintegral_mul_le_Lp_mul_Lq` or similar) with exponents `1/r` and
    `1/(1-r)` gives `𝔼[Z_n; Z_n > 1] ≤ 𝔼[Z_n^{1/r}]^r ℙ(Z_n > 1)^{1-r}`, and this tends to 0.
  - `ℙ(Z_n > 1) ≤ ℙ(X(n) ≠ 0) → 0` by certain extinction. Also `ℙ(Z_n = 1) → 1`.
  - Treat `r = 0` separately.
- **Lemma 2.13 without the skeleton process.** Prove Lemma 2.11 along an arbitrary sequence of
  times `φ i → ∞`. Then prove Proposition 2.10 directly along the times `r * m`, which gives
  Lemma 2.13. Proposition 2.10 is the case `m = 1`. The strictness time `N` of Lemma 2.9 can be
  rounded up to a multiple of `m`, because strictness holds for all `n ≥ N`.

**Ownership.** Create only these files:
- `Conjugate/Internal/Section2/SubBound.lean` (Lemma 2.5);
- `Conjugate/Internal/Section2/Unstable.lean` (Lemma 2.11, Prop 2.10 and Lemma 2.13).

You may split these further under `Conjugate/Internal/Section2/`. Edit nothing else.

**Allowed inputs.**
- Mathlib.
- `Conjugate/Frozen/Defs/*`.
- `Conjugate/Infrastructure/{Population,StepKernel}.lean`.
- `Conjugate.Internal.Foundations.*`, `Conjugate.Internal.Analytic.*` (W-A3), and
  `Conjugate.Internal.Section2.{Positivity,Strict,BasinInvariance}` (W-A4).

Read them for the exact statements. Useful W-A4 helpers:
- `measurableSet_extinctionEvent` and `ae_eventually_eval_eq_zero` (certain extinction ⇒ a.s.
  `X(n) = 0` eventually);
- `pathLaw_eval_mem`;
- `iterate_logGenFun_mem_basin{Zero,Infty}_iff`;
- `basinZero_inter_basinInfty`.

For monotonicity and orthant invariance of `g^{(n)}`, use `(logGenFun_mono μ).iterate n` and
`(mapsTo_logGenFun μ).iterate n`. Never import non-`Defs` frozen files or
`Conjugate/Internal/<Anchor>.lean` providers.

**Exact public API to prove** (namespace `Conjugate`, `variable {d : ℕ}`). Each statement was
elaborated against the current build. Helpers with other names are welcome.

```lean
open MeasureTheory ProbabilityTheory Filter Topology
open scoped ENNReal

-- SubBound.lean
/-- Lemma 2.5. -/
theorem exists_genFun_lt_self (μ : Fin d → PMF (Fin d →₀ ℕ)) (hI : IsSubcritical μ)
    (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j}) :
    ∃ q : Fin d → ℝ≥0∞, (∀ j, 1 < q j ∧ q j < ∞) ∧ ∀ k, genFun μ q k < q k

/-- Lemma 2.5 in log coordinates (used in Lemma 2.14). -/
theorem exists_logGenFun_lt_self (μ : Fin d → PMF (Fin d →₀ ℕ)) (hI : IsSubcritical μ)
    (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j}) :
    ∃ x : Fin d → EReal, (∀ j, 0 < x j ∧ x j < ⊤) ∧ ∀ k, logGenFun μ x k < x k

-- Unstable.lean
/-- Lemma 2.11, along any sequence of times `φ i → ∞`. -/
theorem tendsto_logGenFun_iterate_smul (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hext : ∀ k, pathLaw μ (Finsupp.single k 1) (extinctionEvent (Fin d)) = 1)
    {φ : ℕ → ℕ} (hφ : Tendsto φ atTop atTop) {x : Fin d → EReal} (hx : ∀ j, 0 ≤ x j)
    (hbd : limsup (fun i => ⨆ j, ((logGenFun μ)^[φ i] x j).abs) atTop < ⊤)
    {r : ℝ} (hr0 : 0 ≤ r) (hr1 : r < 1) :
    Tendsto (fun i => ⨆ j, ((logGenFun μ)^[φ i] (fun j => (r : EReal) * x j) j).abs) atTop
      (𝓝 0)

/-- Proposition 2.10 (i) for `m = 1`, Lemma 2.13 (i) in general. -/
theorem tendsto_zero_of_lt (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hext : ∀ k, pathLaw μ (Finsupp.single k 1) (extinctionEvent (Fin d)) = 1)
    (hpr : IsPositiveRegular μ) {m : ℕ} (hm : 1 ≤ m) {x y : Fin d → EReal}
    (hx : ∀ j, 0 ≤ x j ∧ x j < ⊤)
    (hbd : limsup (fun r => ⨆ j, ((logGenFun μ)^[r * m] x j).abs) atTop < ⊤)
    (hy : ∀ j, 0 ≤ y j) (hyx : y ≤ x) (hne : y ≠ x) :
    Tendsto (fun r => ⨆ j, ((logGenFun μ)^[r * m] y j).abs) atTop (𝓝 0)

/-- Proposition 2.10 (ii) for `m = 1`, Lemma 2.13 (ii) in general. -/
theorem limsup_eq_top_of_lt (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hext : ∀ k, pathLaw μ (Finsupp.single k 1) (extinctionEvent (Fin d)) = 1)
    (hpr : IsPositiveRegular μ) {m : ℕ} (hm : 1 ≤ m) {x y : Fin d → EReal}
    (hx : ∀ j, 0 ≤ x j)
    (hpos : 0 < limsup (fun r => ⨆ j, ((logGenFun μ)^[r * m] x j).abs) atTop)
    (hy : ∀ j, 0 ≤ y j ∧ y j < ⊤) (hxy : x ≤ y) (hne : x ≠ y) :
    limsup (fun r => ⨆ j, ((logGenFun μ)^[r * m] y j).abs) atTop = ⊤
```

The paper's "`λ ≠ 0`" hypotheses are implied: in (i) by `y ≤ x`, `y ≠ x`, `y ≥ 0`; in (ii) by
`hpos`. The paper's standing hypotheses are used only through:
- certain extinction (`hext`). Obtain it from `pathLaw_extinctionEvent_eq_one` when needed;
- positive regularity (`hpr`);
- for Lemma 2.5, `hI` and `hIII`.

**Mathematics of (i)**, paper.tex:641-650:
1. **`g^{(n)}(x)` is finite for every `n`.** Otherwise an infinite coordinate blows up to all
   coordinates infinite for all large times (W-A4 `exists_logGenFun_iterate_eq_top`),
   contradicting `hbd`.
2. **Strictness.** Choose `r₀` with `r₀ m ≥ N`, where `N` is from W-A4
   `exists_logGenFun_iterate_strict`. Put `x' = g^{(r₀ m)}(x)` and `y' = g^{(r₀ m)}(y)`. Then
   `y'_k < x'_k` for every `k`, so `y' ≤ s x'` for some `s < 1`.
3. **Apply Lemma 2.11** along `φ r = r * m` to `x'`, whose `limsup` is the shifted `hbd`.
   Then use monotonicity (W-A3 `logGenFun_mono`) and shift back.

**(ii)** is the contrapositive of (i) with the roles of `x` and `y` swapped (paper.tex:650).

**Checks** (run them and paste the output):
```bash
export PATH="$HOME/.elan/bin:$HOME/.local/bin:$PATH"
lake build Conjugate.Internal.Section2.SubBound Conjugate.Internal.Section2.Unstable
python3 -I tools/check_lean_modules.py --root . --max-lines 1500 --files Conjugate/Internal/Section2/*.lean
python3 -I tools/leanprobe.py axioms <Module> <Decl>   # every public theorem listed above
```
Only `propext`, `Classical.choice` and `Quot.sound` are acceptable.

**Concurrency.** Another agent may be working at the same time on other files.
- Build only your own modules, with explicit targets, or `lake env lean <your file>`.
- Never run `lake build` with no target.

**Stop condition.** You are done when every listed theorem compiles without `sorry` and with
the standard axioms only. Stop early and report if:
- a statement appears false or mis-typed (do not change it);
- a needed earlier lemma is missing.

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

Use the copyright header of the existing files. Put scratch files in `.lake/probes/a5/`.

**Handoff.** Report:
- the files created;
- the approach for each theorem;
- the exact commands and their output;
- axioms;
- reusable helpers;
- anything unproved or uncertain.
