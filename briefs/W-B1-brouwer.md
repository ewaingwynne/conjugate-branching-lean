# Brief W-B1 — Brouwer fixed point theorem on the simplex (Lane B, Fable)

**Goal.** Prove Brouwer's fixed point theorem for the standard simplex in `ι → ℝ`, as
source-independent infrastructure. It is the graph's external input `ext:brouwer`. It will be
consumed by Theorem 2.7 through the simplex route of `PLAN.md` §6: apply Brouwer to
`π ∘ g ∘ φ` on `{λ ≥ 0, ∑ λ = 1}`.

**Ownership.** Create only these files:
- `Conjugate/Infrastructure/Brouwer.lean`: the entry module, which states and proves the target;
- any files under `Conjugate/Infrastructure/Brouwer/`: the supporting development.

Edit nothing else.

**Exact target.** State it exactly like this, as a public theorem in
`Conjugate/Infrastructure/Brouwer.lean`. It has been elaborated against the current build.
```lean
namespace Conjugate.Infrastructure

theorem brouwer_simplex {ι : Type*} [Fintype ι] [Nonempty ι] {f : (ι → ℝ) → ι → ℝ}
    (hf : ContinuousOn f {x | (∀ i, 0 ≤ x i) ∧ ∑ i, x i = 1})
    (hmaps : Set.MapsTo f {x | (∀ i, 0 ≤ x i) ∧ ∑ i, x i = 1}
      {x | (∀ i, 0 ≤ x i) ∧ ∑ i, x i = 1}) :
    ∃ x, ((∀ i, 0 ≤ x i) ∧ ∑ i, x i = 1) ∧ f x = x
```
Mathlib's `stdSimplex` is deprecated at this pin, in favour of `Convexity.StdSimplex`. That is
why the target uses the explicit set. You may use either internally, but avoid deprecation
warnings in the final files. Any other public results you prove, such as a cube version or
Sperner's lemma, are welcome under other names in `Conjugate.Infrastructure`.

**Allowed inputs.** Mathlib only (pinned; never modify it). At this pin Mathlib has no
Brouwer, Sperner, KKM or homological no-retraction theorem. Verify this yourself with
`grep`/`rg` over `.lake/packages/mathlib/Mathlib` rather than trusting it. If you find one, use it
and tell me.

**Route: your choice.** Report the route you used. A combinatorial route is recommended. One
outline:
1. **Triangulation.** Pick a finite triangulation with mesh → 0. Options:
   - Kuhn's triangulation of the grid `{0,…,m}^n ⊂ [0,1]^n`. Its cells are a base grid point
     plus a permutation, `v_{i+1} = v_i + e_{σ(i)}/m`.
   - The Freudenthal subdivision of the simplex itself (the same combinatorics in "staircase"
     coordinates).
2. **Sperner's lemma.** For a labelling satisfying the boundary condition, the number of fully
   labelled cells is odd, hence nonzero. The usual proofs are induction on dimension with
   door counting and parity, or path following. Keep the counting as `Finset` card / parity
   arguments.
3. **Labelling.** On the simplex: a label `i` with `x i > 0` and `f x i ≤ x i`, which exists
   because both sum to 1. On the cube: a label from the sign pattern of `f x - x`.
4. **Compactness.** For each mesh `1/m`, pick a fully labelled cell. Extract a convergent
   subsequence (`IsCompact.tendsto_subseq`). By continuity the limit satisfies `f x i ≤ x i`
   for all `i`, hence `f x = x`.
5. **Transfer, if you prove the cube version first.** Use a continuous retraction of a cube
   onto the simplex. One candidate is the Euclidean projection, `r(x)_i = max(x_i − τ(x), 0)`
   with `τ(x)` the root of `∑ max(x_i − τ, 0) = 1`. Then apply the cube theorem to `f ∘ r`.

Proving Sperner directly on the simplex avoids step 5. Choose whatever you judge shortest and
most robust in Lean.

**Advice.**
- Build incrementally: `lake build Conjugate.Infrastructure.Brouwer.<File>`.
- Keep each file under 1500 lines.
- Prefer general statements over `Fin n` arithmetic where it simplifies the counting.
- Never use `decide` on large instances.

**Checks** (run them and paste the output):
```bash
export PATH="$HOME/.elan/bin:$HOME/.local/bin:$PATH"
lake build Conjugate.Infrastructure.Brouwer
python3 -I tools/check_lean_modules.py --root . --max-lines 1500 --files Conjugate/Infrastructure/Brouwer.lean Conjugate/Infrastructure/Brouwer/*.lean
python3 -I tools/leanprobe.py axioms Conjugate.Infrastructure.Brouwer Conjugate.Infrastructure.brouwer_simplex
```
Only `propext`, `Classical.choice` and `Quot.sound` are acceptable axioms.

**Concurrency.** Another agent is working at the same time on `Conjugate/Internal/Foundations/`.
- Build only your own modules, with explicit targets, or `lake env lean <your file>`.
- Never run `lake build` with no target. Never build or touch the other agent's files.

**Stop condition.** You are done when `brouwer_simplex` compiles with the standard axioms only.
If you hit a genuine obstruction, or the development is clearly not converging, stop and report:
- what is proved (sorry-free, compiling files);
- the precise remaining gap, as Lean statements;
- your estimate of the remaining effort.

Never leave `sorry` in `Conjugate/`. Unfinished files go to `.lake/probes/brouwer/`.

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
Project context: `CLAUDE.md`. The module system is in use (Lean `v4.36.0-rc2`, Mathlib
`9d581dff`). See `Conjugate/Infrastructure/StepKernel.lean` for the file shape.

**Handoff.** Report:
- the files created and their line counts;
- the route;
- the main public lemmas;
- the exact commands and their output;
- axioms;
- anything unproved or uncertain.
