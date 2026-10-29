# Brief W-A4 — positivity layer of §2: Lemmas 2.3, 2.4, 2.9 (strict), (2.8), Lemma 2.18 (Lane A, Sonnet)

**Goal.** Prove the consequences of positive regularity and non-singularity that §2 uses, and
the invariance of the basins. The work splits into a probabilistic positivity part and an
analytic part.
- **Positivity.** There is positive probability of certain populations at generation `n`. The
  fixed point is `≥ 1`, and either all equal to 1 or all `> 1`.
- **Analytic.** Strict monotonicity of `g^{(n)}`, blow-up of infinite coordinates, and
  invariance of `S₀` and `S∞`.

**Graph nodes served** (`DEPGRAPH.md`, read-only for you):
- `lem-fixed-pos` with `#geq-one` and `#pos-reg-strict` (Lemma 2.3, paper.tex:440-467);
- `lem-gf-pos` with its steps (Lemma 2.4, paper.tex:477-497);
- `lem-mono#positivity-all-n` (paper.tex:602) and `lem-mono#strict-ineq` (paper.tex:602-603):
  the second assertion of Lemma 2.9;
- `eqn-infty-subset#blowup` and `eqn-infty-subset` (display (2.8), paper.tex:732-735);
- `lem-basin-closed` (Lemma 2.18, paper.tex:737-742).

**Ownership.** Create only these files:
- `Conjugate/Internal/Section2/Positivity.lean`: Lemmas 2.3 and 2.4, and positivity for all
  `n ≥ N`;
- `Conjugate/Internal/Section2/Strict.lean`: strict monotonicity, blow-up, `S∞ ⊇ ∂`;
- `Conjugate/Internal/Section2/BasinInvariance.lean`: Lemma 2.18.

You may split these further under `Conjugate/Internal/Section2/`. Edit nothing else.

**Allowed inputs.**
- Mathlib.
- `Conjugate/Frozen/Defs/*`.
- `Conjugate/Infrastructure/{Population,StepKernel}.lean`.
- `Conjugate.Internal.Foundations.*` (W-A1, W-A2: Markov property, cylinder formula,
  convolution/branching `pathLaw_map_eval_add`, Chapman–Kolmogorov `pathLaw_map_eval_add_time`,
  extinction formulas).
- `Conjugate.Internal.Analytic.*` (W-A3: `genFun_mono`, `genFun_one`, `genFun_iterate_eq`,
  `logGenFun_iterate`, `logGenFun_mono`, `logGenFun_zero`, `mapsTo_logGenFun`,
  `logGenFun_eq_self_iff`, continuity of iterates).

Read these modules for the exact statements. Never import `Conjugate/Frozen/*` other than
`Defs`, nor any `Conjugate/Internal/<Anchor>.lean` provider.

**Exact public API to prove** (namespace `Conjugate`). Each statement was elaborated against
the current build. Helpers with other names are welcome.

```lean
open MeasureTheory ProbabilityTheory Filter Topology
open scoped ENNReal

-- Positivity.lean
/-- Lemma 2.3, (2.3). Only per-type certain extinction is assumed (stronger than the source). -/
theorem one_le_of_genFun_eq_self {ι : Type*} [Countable ι] (μ : ι → PMF (ι →₀ ℕ))
    (hext : ∀ k, pathLaw μ (Finsupp.single k 1) (extinctionEvent ι) = 1)
    {q : ι → ℝ≥0∞} (hfix : genFun μ q = q) (k : ι) : 1 ≤ q k

/-- Lemma 2.3, second assertion. -/
theorem eq_one_or_one_lt_of_genFun_eq_self {ι : Type*} [Countable ι] (μ : ι → PMF (ι →₀ ℕ))
    (hpr : IsPositiveRegular μ)
    (hext : ∀ k, pathLaw μ (Finsupp.single k 1) (extinctionEvent ι) = 1)
    {q : ι → ℝ≥0∞} (hfix : genFun μ q = q) : (∀ k, q k = 1) ∨ ∀ k, 1 < q k

/-- paper.tex:602: positivity at every generation `n ≥ N`. -/
theorem exists_pos_of_le {ι : Type*} [Countable ι] (μ : ι → PMF (ι →₀ ℕ))
    (hpr : IsPositiveRegular μ) :
    ∃ N, 1 ≤ N ∧ ∀ n, N ≤ n → ∀ k j,
      0 < pathLaw μ (Finsupp.single k 1) {ω | 1 ≤ ω n j}

/-- Lemma 2.4, (2.4): `X(N) ≥ e_k + e_j` covers both cases `k ≠ j` and `k = j`. -/
theorem exists_pos_two_individuals {ι : Type*} [Countable ι] (μ : ι → PMF (ι →₀ ℕ))
    (hpr : IsPositiveRegular μ) (hns : IsNonsingular μ) :
    ∃ N, 1 ≤ N ∧ ∀ k j,
      0 < pathLaw μ (Finsupp.single k 1)
        {ω | Finsupp.single k 1 + Finsupp.single j 1 ≤ ω N}

-- Strict.lean
/-- Lemma 2.9, second assertion (finiteness needed only in coordinate `k`). -/
theorem exists_logGenFun_iterate_strict {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hpr : IsPositiveRegular μ) :
    ∃ N, ∀ n, N ≤ n → ∀ x y : Fin d → EReal, (∀ j, 0 ≤ x j) → (∀ j, y j < ⊤) → x ≤ y →
      x ≠ y → ∀ k, (logGenFun μ)^[n] y k < ⊤ →
        (logGenFun μ)^[n] x k < (logGenFun μ)^[n] y k

/-- paper.tex:732: an infinite coordinate makes every coordinate infinite from generation `N` on. -/
theorem exists_logGenFun_iterate_eq_top {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hpr : IsPositiveRegular μ) :
    ∃ N, ∀ x : Fin d → EReal, (∀ j, 0 ≤ x j) → (∃ j, x j = ⊤) →
      ∀ n, N ≤ n → ∀ k, (logGenFun μ)^[n] x k = ⊤

/-- Display (2.8): `[0,∞]^d ∖ [0,∞)^d ⊆ S∞`. -/
theorem mem_basinInfty_of_exists_eq_top {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hpr : IsPositiveRegular μ) {x : Fin d → EReal} (hx0 : ∀ j, 0 ≤ x j)
    (hx : ∃ j, x j = ⊤) : x ∈ basinInfty μ

-- BasinInvariance.lean
/-- Lemma 2.18 for `S₀`: `g(S₀) ⊆ S₀` and `g⁻¹(S₀) ⊆ S₀` (on `[0,∞]^d`). -/
theorem logGenFun_mem_basinZero_iff {ι : Type*} [Fintype ι] (μ : ι → PMF (ι →₀ ℕ))
    {x : ι → EReal} (hx : ∀ j, 0 ≤ x j) : logGenFun μ x ∈ basinZero μ ↔ x ∈ basinZero μ

/-- Lemma 2.18 for `S∞`. -/
theorem logGenFun_mem_basinInfty_iff {ι : Type*} [Fintype ι] (μ : ι → PMF (ι →₀ ℕ))
    {x : ι → EReal} (hx : ∀ j, 0 ≤ x j) :
    logGenFun μ x ∈ basinInfty μ ↔ x ∈ basinInfty μ
```
Also add and export, in `BasinInvariance.lean`, the iterate versions, for `(logGenFun μ)^[n] x`
in place of `logGenFun μ x`, and the disjointness `basinZero μ ∩ basinInfty μ = ∅`. Choose the
names and report them.

**Mathematics.** Follow the paper.
- **Lemma 2.3.** Use Fatou. `𝔼_k[∏ q_j^{X_j(n)}] = f_k^{(n)}(q) = q_k`, and the integrand → 1
  a.s. because `X(n) = 0` eventually. For the second part, use `f^{(N)}` and the event
  `{X_{j*}(N) ≥ 1}`, with every factor `≥ 1` by the first part.
- **Positivity for all `n ≥ N`.** The process survives to every generation with positive
  probability. More individuals only help (convolution). Use Chapman–Kolmogorov.
- **Lemma 2.4.** Follow the three-stage argument at paper.tex:489-496 with the branching and
  Chapman–Kolmogorov lemmas. A positive-probability population `y` at time `a` and
  positive-probability descendants from each part of `y` give positive probability at time
  `a + b`.
- **Strictness and blow-up.** `g^{(n)}_k(x) = log 𝔼_k[∏ e^{x_j X_j(n)}]` (`logGenFun_iterate`,
  `genFun_iterate_eq`). The integrands are ordered, strictly ordered on an event of positive
  probability, and the larger one has finite integral.

**Checks** (run them and paste the output):
```bash
export PATH="$HOME/.elan/bin:$HOME/.local/bin:$PATH"
lake build Conjugate.Internal.Section2.Positivity Conjugate.Internal.Section2.Strict Conjugate.Internal.Section2.BasinInvariance
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
- a needed foundation lemma is missing.

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

Use the copyright header of the existing files. Put scratch files in `.lake/probes/a4/`.

**Handoff.** Report:
- the files created;
- the approach for each theorem;
- the exact commands and their output;
- axioms;
- the names of the added theorems;
- reusable helpers;
- anything unproved or uncertain.
