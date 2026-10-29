# Brief W-A9 — Example 1.5 (provider + seal), and a reusable subcriticality criterion

**Goal.** Prove the provider for the frozen anchor `Conjugate.example_1_5` (paper.tex:255-262,
anchored per ERRATA R4 as "the hypotheses of Theorem 1.4 hold and there are at least three
distinct fixed points in `(1,∞)²`"). Also prove a reusable lemma: row sums of the mean matrix
`< 1` imply subcriticality.

**Graph nodes served** (`DEPGRAPH.md`, read-only for you): the root `counterexample` and its
steps `counterexample#hyp-I-subcritical`, `#hyp-II-regular`, `#hyp-III-continuous` and
`#three-fixed-points`.

**Exact frozen type.** Read `Conjugate/Frozen/Example_1_5.lean`. The provider
`Conjugate.Internal.example_1_5`, in the existing stub `Conjugate/Internal/Example_1_5.lean`,
must have exactly this type and binder names:
```lean
theorem example_1_5 (μ : Fin 2 → PMF (Fin 2 →₀ ℕ))
    (hμ : ∀ k : Fin 2,
      μ k (Finsupp.single k 1) = 1 / 4 ∧ μ k (Finsupp.single k 2) = 1 / 4 ∧
      μ k (Finsupp.single k 2 + Finsupp.single k.rev 2) = 1 / 100 ∧ μ k 0 = 49 / 100) :
    (IsSubcritical μ ∧ (IsPositiveRegular μ ∧ IsNonsingular μ) ∧
      ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j}) ∧
    3 ≤ {q : Fin 2 → ℝ≥0∞ | (∀ j, 1 < q j ∧ q j < ∞) ∧ genFun μ q = q}.encard
```
The seal will be `by exact Conjugate.Internal.example_1_5 μ hμ`.

**Ownership.**
- Edit the stub `Conjugate/Internal/Example_1_5.lean` (keep its header and docstring).
- Create `Conjugate/Internal/Analytic/Subcritical.lean` for the criterion.
- Create files under `Conjugate/Internal/Examples/` for the rest.
- Edit nothing else.

**Allowed inputs.**
- Mathlib.
- `Conjugate/Frozen/Defs/*`.
- `Conjugate.Infrastructure.{Population,StepKernel}`.
- `Conjugate.Internal.Foundations.*`, `Conjugate.Internal.Analytic.*` and
  `Conjugate.Internal.Section2.Positivity` (for example `pathLaw_map_eval_one`: the generation-1
  law is `stepKernel μ x`).
- The **sealed and PROVED** frozen module `Conjugate.Frozen.Remark_HypIII_Automatic`, with export
  `Conjugate.remark_hypIII_automatic` (finite `f` ⇒ Hyp. III). Using it is encouraged.

Never import a DRAFT anchor or another anchor's provider.

**Reusable criterion** (put it in `Analytic/Subcritical.lean`, namespace `Conjugate`; the
statement has been elaborated):
```lean
theorem isSubcritical_of_sum_lt_one {ι : Type*} [Fintype ι] [DecidableEq ι]
    (μ : ι → PMF (ι →₀ ℕ)) (h : ∀ k, ∑ j, meanMatrix μ k j < 1) : IsSubcritical μ
```
Use `spectrum.spectralRadius_le_nnnorm` (or the current name) with the `L^∞` operator-norm
normed algebra on `Matrix ι ι ℂ`, opened with `open scoped Matrix.Norms.Operator` (see
`Conjugate/Internal/Foundations/MeanDecay.lean`, which uses it). That norm is the maximal row
sum of absolute values. The entries are finite because each row sum is `< 1`.

**Mathematics of the example.**

*Support and generating function.*
- The four given masses sum to `1`, and the four points are distinct (`k.rev ≠ k`). So `μ k`
  vanishes elsewhere (`PMF.tsum_coe`, `ENNReal.tsum_eq_add_tsum_ite` or similar).
- Hence `f_k(q) = 49/100 + q_k/4 + q_k²/4 + q_k² q_{k'}²/100`, where `k' = k.rev`.

*Hypotheses of Theorem 1.4.*
- **I.** `M_{kk} = 1/4 + 2/4 + 2/100` and `M_{kk'} = 2/100`, so each row sum is `79/100 < 1`.
- **II.** `ℙ_k[X_j(1) ≥ 1] > 0` for both `j`, so `N = 1` works. Non-singular: `ℙ_k[|X(1)| ≥ 2] ≥ 1/4`.
- **III.** `f` is finite on `(0,∞)²` (a polynomial), so `remark_hypIII_automatic` applies.

*Three fixed points in `(1,∞)²`.* Work in `ℝ`, then map with `ENNReal.ofReal`. The fixed-point
equations are `q_k = 0.49 + q_k/4 + q_k²/4 + q_k² q_{k'}²/100` for `k = 0, 1`.
1. **Symmetric point.** `h(t) = 49/100 + t/4 + t²/4 + t⁴/100 − t` has `h(3/2) < 0 < h(2)`.
   The intermediate value theorem gives `t* ∈ (3/2, 2)`, and `(t*, t*)` is a fixed point.
2. **Asymmetric points.** Let `P(s) = 3s/4 − 49/100 − s²/4`, which is positive on `[1.1, 1.2]`,
   and `ψ(s) = √(100 P(s)) / s`. Then the equation for `k = 0` at `(s, ψ(s))` holds
   identically. The equation for `k = 1` at `(s, ψ(s))` becomes
   `G(s) := 49/100 − 3ψ(s)/4 + ψ(s)²/4 + P(s) = 0`, using `ψ(s)² s² = 100 P(s)`.
   - Numerically `G(1.1) ≈ −0.035 < 0 < 0.0105 ≈ G(1.2)`. Prove the signs by comparing
     squares: `ψ > (49/100 + ψ²/4 + P)/(3/4)` iff the square inequality holds. Everything except
     `ψ` itself is rational in `s`.
   - The intermediate value theorem gives `a* ∈ (1.1, 1.2)` with `G(a*) = 0`. Put `b* = ψ(a*)`.
     Then `b*² = 100 P(a*)/a*² ∈ [3.25/1.44, 5/1.21]`, so `b* > 1.2 > a*`.
   - Both `(a*, b*)` and `(b*, a*)` are fixed points, by the symmetry `k ↔ k'`.
3. **Distinctness.** The three points are pairwise distinct (`a* < b*`, and `t*` has equal
   coordinates), and all their coordinates lie in `(1,∞)`. So `encard ≥ 3`: exhibit a 3-element
   subset (`Set.encard_le_card`, `Set.encard_insert_of_not_mem`, …).

`norm_num`/`nlinarith`/`positivity` with explicit rational bounds should handle the numerics.
Never use `native_decide`.

**Checks** (run them and paste the output):
```bash
export PATH="$HOME/.elan/bin:$HOME/.local/bin:$PATH"
lake build Conjugate.Internal.Example_1_5 Conjugate.Internal.Analytic.Subcritical
python3 -I tools/check_lean_modules.py --root . --max-lines 1500 --files Conjugate/Internal/Example_1_5.lean Conjugate/Internal/Analytic/Subcritical.lean Conjugate/Internal/Examples/*.lean
python3 -I tools/leanprobe.py axioms Conjugate.Internal.Example_1_5 Conjugate.Internal.example_1_5
python3 -I tools/leanprobe.py axioms Conjugate.Internal.Analytic.Subcritical Conjugate.isSubcritical_of_sum_lt_one
```
Only `propext`, `Classical.choice` and `Quot.sound` are acceptable.

**Seal probe.**
- Create `.lake/probes/a9/SealProbe.lean`, with a copy of the frozen statement and body
  `by exact Conjugate.Internal.example_1_5 μ hμ`.
- Import only the provider module and `Defs`.
- Compile it, report the result, then delete it.

**Concurrency.** Other agents work at the same time on other files.
- Build only your own modules, with explicit targets, or `lake env lean <your file>`.
- Never run `lake build` with no target.

**Stop condition.** You are done when the provider and the criterion compile without `sorry`,
with the standard axioms only, and the seal probe passes. Stop early and report if the frozen
statement appears false or mis-typed (do not change it).

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

(Rule 4: you author this provider. You never import its frozen anchor file. Keep unfinished
work in `.lake/probes/a9/`, never in `Conjugate/`.)

Use the copyright header of the existing files. Put scratch files in `.lake/probes/a9/`.

**Handoff.** Report:
- the files created;
- the approach;
- the exact commands and their output;
- axioms;
- the seal-probe result;
- reusable helpers;
- anything unproved or uncertain.
