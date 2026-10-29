# Brief W-A6 — Lemmas 2.12, 2.14, 2.15, 2.16, 2.17: limits, attractive points, open basins, rays (Lane A, Sonnet)

**Goal.** Prove the basin lemmas of §2.2–§2.3:
- monotone orbits converge to `0` or to infinity (Lemma 2.12);
- `0` is attractive (Lemma 2.14) and `∞` is attractive (Lemma 2.15, as read under
  ERRATA E3);
- `S₀` and `S∞` are relatively open (Lemma 2.16);
- every ray meets `Λ = [0,∞)^d ∖ (S₀ ∪ S∞)` exactly once (Lemma 2.17);
- the ray-ordering corollaries that Theorem 2.7 will need.

**Graph nodes served** (`DEPGRAPH.md`, read-only for you):
- `lem-monotone-lim` (Lemma 2.12, paper.tex:669-697);
- `lem-attractive-zero` (Lemma 2.14, paper.tex:767-776);
- `lem-attractive-infty` (Lemma 2.15, paper.tex:781-800, read as ERRATA E3);
- `lem-basin-open` (Lemma 2.16, paper.tex:804-821);
- `lem-ray-intersect` (Lemma 2.17, paper.tex:828-836).

**ERRATA E3** (author ruling, `ERRATA.md`). Lemma 2.15 is read as follows: there are `C > 0`
and `N` such that for `λ ∈ [0,∞)^d ∖ [0,C]^d`, `g^{(N)}(λ) > λ` and `|g^{(n)}(λ)| → ∞`. The
proof's display must use `max_j λ_j`, not `min_j λ_j`. Then `e^{g_k^{(N)}(λ)} ≥ e^{λ_k + λ_j} p_{k,j}(N)`
for every `j` gives `g_k^{(N)}(λ) ≥ λ_k + max_j λ_j + log m > λ_k` once `max_j λ_j > log m⁻¹`.
The inequality is strict in **every** coordinate. Take `C` large enough to be positive.

**Ownership.** Create only these files:
- `Conjugate/Internal/Section2/MonotoneLimit.lean` (Lemma 2.12);
- `Conjugate/Internal/Section2/Attractive.lean` (Lemmas 2.14 and 2.15);
- `Conjugate/Internal/Section2/BasinOpen.lean` (Lemma 2.16);
- `Conjugate/Internal/Section2/Ray.lean` (Lemma 2.17 and the ray corollaries).

You may split these further under `Conjugate/Internal/Section2/`. Edit nothing else.

**Allowed inputs.**
- Mathlib.
- `Conjugate/Frozen/Defs/*`.
- `Conjugate/Infrastructure/{Population,StepKernel}.lean`.
- `Conjugate.Internal.Foundations.*` and `Conjugate.Internal.Analytic.*`.
- `Conjugate.Internal.Section2.*`, the W-A4 and W-A5 files (Lemmas 2.3, 2.4, 2.5, 2.9, 2.10,
  2.11, 2.13, 2.18, display (2.8)).

Read them for the exact statements. Useful helpers:
- W-A4: `iterate_logGenFun_mem_basin{Zero,Infty}_iff`, `logGenFun_mapsTo_basin{Zero,Infty}`,
  `basinZero_inter_basinInfty`.
- W-A5 (`Unstable.lean`): `abs_eq_toENNReal`, `abs_le_abs_of_nonneg`,
  `logGenFun_iterate_apply`, `logGenFun_iterate_ne_top`, `tendsto_iSup_zero`,
  `iterate_mul_add`, `exists_scale_lt_one`.

Several earlier helper names are generic (`HasSlope`, `tendsto_monomial`, …). Pick distinctive
names for your own helpers so they do not clash.

For monotonicity and orthant invariance of `g^{(n)}`, use `(logGenFun_mono μ).iterate n` and
`(mapsTo_logGenFun μ).iterate n`. Never import non-`Defs` frozen files or
`Conjugate/Internal/<Anchor>.lean` providers.

**Exact public API to prove** (namespace `Conjugate`, `variable {d : ℕ}`). Each statement was
elaborated against the current build. Helpers with other names are welcome. Every theorem
assumes the hypotheses of Theorem 1.4, as the paper does from paper.tex:528. The binders are
spelled out as follows:
```lean
(μ : Fin d → PMF (Fin d →₀ ℕ)) (hI : IsSubcritical μ) (hII : IsPositiveRegular μ ∧ IsNonsingular μ)
(hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j})
```

```lean
open MeasureTheory ProbabilityTheory Filter Topology
open scoped ENNReal

-- MonotoneLimit.lean (Lemma 2.12)
theorem mem_basinZero_of_iterate_lt (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hI : IsSubcritical μ) (hII : IsPositiveRegular μ ∧ IsNonsingular μ)
    (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j})
    {x : Fin d → EReal} (hx : ∀ j, 0 ≤ x j ∧ x j < ⊤) {m : ℕ} (hm : 1 ≤ m)
    (hle : (logGenFun μ)^[m] x ≤ x) (hne : (logGenFun μ)^[m] x ≠ x) :
    x ∈ basinZero μ

theorem tendsto_top_of_lt_iterate (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hI : IsSubcritical μ) (hII : IsPositiveRegular μ ∧ IsNonsingular μ)
    (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j})
    {x : Fin d → EReal} (hx : ∀ j, 0 ≤ x j ∧ x j < ⊤) {m : ℕ} (hm : 1 ≤ m)
    (hle : x ≤ (logGenFun μ)^[m] x) (hne : x ≠ (logGenFun μ)^[m] x) :
    Tendsto (fun n => ⨆ j, ((logGenFun μ)^[n] x j).abs) atTop (𝓝 ⊤)

-- Attractive.lean
/-- Lemma 2.14. -/
theorem exists_mem_basinZero_of_le (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hI : IsSubcritical μ) (hII : IsPositiveRegular μ ∧ IsNonsingular μ)
    (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j}) :
    ∃ ε : ℝ, 0 < ε ∧ ∀ x : Fin d → EReal, (∀ j, 0 ≤ x j ∧ x j ≤ ε) → x ∈ basinZero μ

/-- Lemma 2.15 (ERRATA E3). -/
theorem exists_attractive_infty (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hI : IsSubcritical μ) (hII : IsPositiveRegular μ ∧ IsNonsingular μ)
    (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j}) :
    ∃ C : ℝ, 0 < C ∧ ∃ N, 1 ≤ N ∧ ∀ x : Fin d → EReal, (∀ j, 0 ≤ x j ∧ x j < ⊤) →
      (∃ j, (C : EReal) < x j) →
        (∀ k, x k < (logGenFun μ)^[N] x k) ∧
          Tendsto (fun n => ⨆ j, ((logGenFun μ)^[n] x j).abs) atTop (𝓝 ⊤)

-- BasinOpen.lean (Lemma 2.16: relatively open in [0,∞]^d)
theorem exists_isOpen_basinZero (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hI : IsSubcritical μ) (hII : IsPositiveRegular μ ∧ IsNonsingular μ)
    (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j}) :
    ∃ U : Set (Fin d → EReal), IsOpen U ∧ basinZero μ = U ∩ {x | ∀ j, 0 ≤ x j}

theorem exists_isOpen_basinInfty (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hI : IsSubcritical μ) (hII : IsPositiveRegular μ ∧ IsNonsingular μ)
    (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j}) :
    ∃ U : Set (Fin d → EReal), IsOpen U ∧ basinInfty μ = U ∩ {x | ∀ j, 0 ≤ x j}

-- Ray.lean (Lemma 2.17, norm-free: every nonzero u ≥ 0, not only |u| = 1)
theorem existsUnique_ray (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hI : IsSubcritical μ) (hII : IsPositiveRegular μ ∧ IsNonsingular μ)
    (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j})
    {u : Fin d → ℝ} (hu0 : ∀ j, 0 ≤ u j) (hu : u ≠ 0) :
    ∃! r : ℝ, 0 < r ∧
      (fun j => ((r * u j : ℝ) : EReal)) ∉ basinZero μ ∪ basinInfty μ
```

**Also prove in `Ray.lean`** two ray-ordering corollaries of Lemma 2.11. Choose their exact
names, keep these hypotheses, and report the statements. For `u ≥ 0`, real `0 ≤ s < t`, and
the ray points `s u`, `t u` written as above:
- if `t u ∉ basinInfty μ`, then `s u ∈ basinZero μ`;
- if `s u ∉ basinZero μ` and `s < t`, then `t u ∈ basinInfty μ`.

Theorem 2.7 will use them to show that the ray parameter `u ↦ r(u)` is continuous.

**Mathematics.** Follow the paper.
- **Lemma 2.12** (paper.tex:675-697, second part at paper.tex:698-714 inside a comment, "proven
  similarly"). Use continuity of iterates (W-A3) to see that the residue-class limits
  `λ̄^s = lim_r g^{(rm+s)}(λ)` are fixed by `g^{(m)}`. Strictness (W-A4) and Lemma 2.13 (W-A5)
  then give the contradiction. The `g^{(s)}(λ)` are finite: an infinite coordinate would blow
  up to `⊤` everywhere, against the monotone bound.
- **Lemma 2.14.** Lemma 2.5 (`exists_logGenFun_lt_self`), then Lemma 2.12, then monotonicity.
- **Lemma 2.15.** Lemma 2.4 (`exists_pos_two_individuals`) with the corrected display above,
  then Lemma 2.12 (second part).
- **Lemma 2.16** (paper.tex:807-821). For `S∞`, use display (2.8): W-A4
  `mem_basinInfty_of_exists_eq_top`.
- **Lemma 2.17.** For existence, use connectedness of `(0,∞)`. For uniqueness, use Lemma 2.11
  with `φ = id` and scale `r/R`.

**Checks** (run them and paste the output):
```bash
export PATH="$HOME/.elan/bin:$HOME/.local/bin:$PATH"
lake build Conjugate.Internal.Section2.MonotoneLimit Conjugate.Internal.Section2.Attractive Conjugate.Internal.Section2.BasinOpen Conjugate.Internal.Section2.Ray
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

Use the copyright header of the existing files. Put scratch files in `.lake/probes/a6/`.

**Handoff.** Report:
- the files created;
- the approach for each theorem;
- the exact commands and their output;
- axioms;
- the corollary statements;
- reusable helpers;
- anything unproved or uncertain.
