# Brief W-A8 — Proposition 1.6, fixed-point form (provider + seal), single-type case

**Goal.** Prove the provider for the frozen anchor `Conjugate.proposition_1_6_fixedPoint`. This
is Proposition 1.6, paper.tex:343-356, fixed-point form, split per ERRATA R5, with uniqueness
read under ERRATA E7: unique `q ∈ (1,∞)`. The provider is
`Conjugate.Internal.proposition_1_6_fixedPoint` in the existing stub
`Conjugate/Internal/Proposition_1_6_FixedPoint.lean`. Keep the stub's header and docstring and
add the proof.

**Graph nodes served** (`DEPGRAPH.md`, read-only for you):
- the root `prop-single-type.fixed-point`;
- its steps `prop-single-type#finite-near-one`, `#mean-eq-derivative`, `#f-below-diagonal`,
  `#f-above-diagonal`, `#fixed-point-exists`, `#strict-convexity` and
  `#at-most-two-fixed-points`.

**Exact frozen type.** Read `Conjugate/Frozen/Proposition_1_6_FixedPoint.lean`. The provider must
have exactly this type, with the same binder names and order:
```lean
namespace Conjugate.Internal
theorem proposition_1_6_fixedPoint (μ : Fin 1 → PMF (Fin 1 →₀ ℕ))
    (hI : meanMatrix μ 0 0 < 1)
    (hII : 0 < (μ 0).toMeasure {c | 2 ≤ c 0})
    (hIII : ContinuousOn (fun q : ℝ≥0∞ => genFun μ (fun _ => q) 0) (Set.Ioi 0)) :
    ∃! q : ℝ≥0∞, 1 < q ∧ q < ∞ ∧ genFun μ (fun _ => q) 0 = q
```
The orchestrator will seal it with
`by exact Conjugate.Internal.proposition_1_6_fixedPoint μ hI hII hIII`.

**Ownership.**
- Edit `Conjugate/Internal/Proposition_1_6_FixedPoint.lean`.
- Create files under `Conjugate/Internal/SingleType/` for the supporting development.
- Edit nothing else.

**Allowed inputs.**
- Mathlib.
- `Conjugate/Frozen/Defs/*`.
- `Conjugate.Internal.Analytic.*`: `genFun_mono`, `genFun_one`, and lower semicontinuity
  (`genFun_eventually_lt`) in `GenFunContinuity`.
- Never import any non-`Defs` frozen file, nor another anchor's provider.

**Mathematics.** Write `F(q) = genFun μ (fun _ => q) 0 = ∑_n p_n q^n` with `p_n = μ_0(n·e₀)`.
Then:
- **Finite near 1.** `F(1) = 1` (`genFun_one`). Continuity at `1` (`hIII`) gives `δ > 0` with
  `F < ∞` on `[1, 1+δ]`.
- **Below the diagonal** (route deviation from the paper's Taylor step, like Lemma 2.5 in
  `PLAN.md` §6). The quotients `(F(1+ε) − 1)/ε = 𝔼[((1+ε)^{X} − 1)/ε]` decrease as `ε ↓ 0`, by
  convexity of `ε ↦ (1+ε)^n`. They converge to `𝔼[X] = meanMatrix μ 0 0 < 1`, by monotone
  convergence from a finite starting value. So `F(s) < s` for some `s ∈ (1, 1+δ]`.
- **Above the diagonal.** `hII` gives `p_n > 0` for some `n ≥ 2`. Then `F(t) ≥ p_n t^n > t` for
  large `t` (or `F(t) = ∞`).
- **Existence.** Use the intermediate-value / connectedness argument on `[s,t]`.
  - `{q : F q < q}` and `{q : q < F q}` are relatively open in `[s,t]` and disjoint, by
    continuity of `F` (`hIII`) and of `id` into `ℝ≥0∞`.
  - `s` lies in the first set and `t` in the second, and `[s,t]` is connected.
  - So some `q̄ ∈ [s,t]` has `F q̄ = q̄`. It satisfies `1 < q̄ < ∞`.
- **Uniqueness.** Suppose `1 < q₁ < q₂ < ∞` are both fixed. `F` is finite on `[0, q₂]` by
  monotonicity, and strictly convex there, since the coefficient `p_n > 0` with `n ≥ 2` makes
  `t ↦ t^n` strictly convex. Writing `q₁` as a convex combination of `1` and `q₂` gives
  `F(q₁) < q₁`, a contradiction. Handle the order of two arbitrary solutions with
  `lt_trichotomy`.

  Work with real-valued versions on intervals where `F` is finite (`ENNReal.toReal`), or with
  `ℝ≥0∞` convexity directly. Choose whichever is shorter.

**Checks** (run them and paste the output):
```bash
export PATH="$HOME/.elan/bin:$HOME/.local/bin:$PATH"
lake build Conjugate.Internal.Proposition_1_6_FixedPoint
python3 -I tools/check_lean_modules.py --root . --max-lines 1500 --files Conjugate/Internal/Proposition_1_6_FixedPoint.lean Conjugate/Internal/SingleType/*.lean
python3 -I tools/leanprobe.py axioms Conjugate.Internal.Proposition_1_6_FixedPoint Conjugate.Internal.proposition_1_6_fixedPoint
```
Only `propext`, `Classical.choice` and `Quot.sound` are acceptable.

**Seal probe.** Create `.lake/probes/a8/SealProbe.lean`.
- Copy the frozen theorem's statement into it, under any name, with body
  `by exact Conjugate.Internal.proposition_1_6_fixedPoint μ hI hII hIII`.
- Import only the provider module and the `Defs` it needs.
- Compile it with `lake env lean`, report the result, then delete it.

**Concurrency.** Another agent may be working at the same time on other files.
- Build only your own modules, with explicit targets, or `lake env lean <your file>`.
- Never run `lake build` with no target.

**Stop condition.** You are done when the provider compiles without `sorry`, with the standard
axioms only, and the seal probe passes. Stop early and report if the frozen statement appears
false or mis-typed. Do not change it.

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

(Rule 4: you are the author of this provider, so you write that module. You never import the
frozen anchor file.)

Use the copyright header of the existing files. Put scratch files in `.lake/probes/a8/`.

**Handoff.** Report:
- the files created;
- the approach;
- the exact commands and their output;
- axioms;
- the seal-probe result;
- reusable helpers;
- anything unproved or uncertain.
