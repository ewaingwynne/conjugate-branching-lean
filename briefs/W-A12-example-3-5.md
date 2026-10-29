# Brief W-A12 — Example 3.5 (provider + seal)

**Goal.** Prove the provider for the frozen anchor `Conjugate.example_3_5` (paper.tex:1182-1201,
read as ERRATA E8: **all** of (3.23) holds for each `ℙ_k`, with `ℙ_k` dominated by the sum of
`k` i.i.d. copies of `ℙ_1`). The anchor says that the class of examples satisfies:
- global extinction;
- hypotheses I–IV of Theorem 3.1, with `φ(k) = k`, `ψ ≡ 1`;
- and, through Theorem 3.1, has a fixed point `q ∈ (1,∞)^ℕ`.

**Indexing.** Paper type `k` is Lean type `k - 1`. So the paper's `φ(k) = k` is Lean
`φ k = k + 1`, and "dominated by the sum of `k` i.i.d. copies of `ℙ_1`" is Lean `hdom`:
`StochDominated (μ k).toMeasure (stepKernel μ (Finsupp.single 0 (k + 1)))` for `k ≥ 1`.
`stepKernel μ (single 0 (k+1))` is the law of the sum of `k+1` independent type-0 offspring
vectors.

**Graph nodes served** (`DEPGRAPH.md`): the root `example-ctble` and its steps
`#finite-offspring`, `#global-extinction`, `#assume-I` to `#assume-IV`, `#choose-s`, `#choose-t`
and `#apply-thm-3-1`.

**Exact frozen type.** Read `Conjugate/Frozen/Example_3_5.lean`. The provider
`Conjugate.Internal.example_3_5`, in the existing stub `Conjugate/Internal/Example_3_5.lean`,
must have exactly its type and binder names (`μ h323 hdom`). The seal will be
`by exact Conjugate.Internal.example_3_5 μ h323 hdom`.

**Ownership.**
- Edit the stub `Conjugate/Internal/Example_3_5.lean` (keep header and docstring).
- Create new files under `Conjugate/Internal/Examples/` whose names start with `Example35`.
- Edit nothing else.

**Allowed inputs.**
- Mathlib.
- `Conjugate/Frozen/Defs/*`.
- `Conjugate.Infrastructure.*`.
- `Conjugate.Internal.{Foundations,Analytic,Section2,SingleType,Section3,PathSpace}.*`. Read
  them. In particular:
  - `lintegral_stepKernel`, `lintegral_stepKernel_prod`, `lintegral_pathLaw_succ`,
    `pathLaw_extinctionEvent_eq_iSup`, `pathLaw_extinctionEvent_eq_one_of_single`;
  - `isSubcritical_of_sum_lt_one`;
  - `genFun_truncate`;
  - `SingleType.exists_pgf_lt` and friends.
- The **sealed** frozen modules `Conjugate.Frozen.Theorem_3_1` (export `Conjugate.theorem_3_1`)
  and `Conjugate.Frozen.Remark_HypIII_Automatic` (export `Conjugate.remark_hypIII_automatic`).

Never import a DRAFT anchor (check `frozen-anchor-manifest.json`) or another anchor's provider.

**Mathematics.** Let `W(c) = ∑_j (j+1) c_j`, an additive weight, and `e_k = 𝔼_k[W(X(1))] < 1`,
the fourth condition of `h323`.
1. **Global extinction.**
   - `𝔼_x[W(X(1))] = ∑_k x_k e_k`, by additivity over individuals (`lintegral_stepKernel`).
   - Set `θ = max(e_0, 1/2) < 1`. For `k ≥ 1`, `e_k < 1 ≤ (k+1)/2`, so `∑_k x_k e_k ≤ θ W(x)`.
   - By the Markov property, `𝔼_x[W(X(n))] ≤ θ^n W(x) → 0`.
   - `ℙ_x[X(n) ≠ 0] ≤ 𝔼_x[W(X(n))]`, since `W ≥ 1` off `0`. So `ℙ_k[E] = 1`, by
     `pathLaw_extinctionEvent_eq_iSup`.
2. **Truncations satisfy the hypotheses of Theorem 1.4**, for every `d ≥ 1`:
   - row sums `∑_{j<d} 𝔼_k[c_j] ≤ e_k < 1`, then `isSubcritical_of_sum_lt_one`;
   - positive regular with `N = 1`, from `ℙ_k[c_j ≥ 1] > 0`. Use `genFun_truncate`, or the
     truncated generation-1 law;
   - non-singular, from `ℙ_0[c_0 ≥ 2] > 0`;
   - Hyp. III by the sealed `remark_hypIII_automatic`: `f^d` is finite on `(0,∞)^d`, because
     `f^d_k(q) ≤ 𝔼_k[u^{W}] < ∞` with `u = max(2, max_j q_j)`, by the third condition.
3. **Hypothesis II with `ψ = 1`, `φ k = k+1`.** For `q ≥ 1`, `c ↦ ∏ q_j^{c_j}` is monotone, and
   its superlevel sets are upper sets.
   - So `hdom` gives `f_k(q) ≤ ∫ ∏ q^{c} d(stepKernel μ (single 0 (k+1))) = f_0(q)^{k+1}`, by
     `lintegral_stepKernel_prod`.
   - Integrals of monotone functions under `StochDominated` come from the layer-cake formula,
     or directly from the discrete sums.
   - `k = 0` is trivial. Convert the anchor's `rpow` `((k:ℝ)+1)` to `npow`.
4. **Hypothesis III.** `SingleType.exists_pgf_lt` (or the equivalent) applied to `X = W` under
   `μ_0` gives `s > 1` with `𝔼_0[s^W] ≤ s`. This uses `𝔼_0[W] < 1` and finiteness of
   `𝔼_0[u^W]`. Then for `k ≥ 1`: `𝔼_k[s^W] ≤ (𝔼_0[s^W])^{k+1} ≤ s^{k+1}`, by `hdom` and
   multiplicativity of `s^W`. Match the anchor's real-valued form.
5. **Hypothesis IV.** `ℙ_0[c_0 ≥ 2] > 0` gives `t > 1` with `f_0(t, 1, 1, …) > t`. Also
   `f_k((t^{j+1})_j) = 𝔼_k[t^{W}] < ∞`, by the third condition.
6. **Conclusion.** Apply the sealed `Conjugate.theorem_3_1` with `φ k = k + 1` and `ψ ≡ 1`.
   `φ → ∞`, and `log 1 / φ = 0`.

**Checks** (run them and paste the output):
```bash
export PATH="$HOME/.elan/bin:$HOME/.local/bin:$PATH"
lake build Conjugate.Internal.Example_3_5
python3 -I tools/check_lean_modules.py --root . --max-lines 1500 --files Conjugate/Internal/Example_3_5.lean Conjugate/Internal/Examples/Example35*.lean
python3 -I tools/leanprobe.py axioms Conjugate.Internal.Example_3_5 Conjugate.Internal.example_3_5
```
Only `propext`, `Classical.choice` and `Quot.sound` are acceptable.

**Seal probe.**
- Put a copy of the frozen file, with the body replaced by the seal line, in `.lake/probes/a12/`.
- Compile it with the lakefile options.
- Report the result, then delete it.

**Concurrency.** Other agents work at the same time on other files.
- Build only your own modules, with explicit targets.
- Never run `lake build` with no target.

**Stop condition.** You are done when the provider compiles without `sorry`, with the standard
axioms only, and the seal probe passes. Stop and report if:
- the frozen statement appears false or mis-typed (do not change it);
- `Conjugate.theorem_3_1` is not SEALED.

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

(Rule 4: you author this provider. Never import its frozen file. Keep unfinished work in
`.lake/probes/a12/`, never in `Conjugate/`.)

Use the copyright header of the existing files.

**Handoff.** Report:
- the files created;
- the approach;
- the exact commands and their output;
- axioms;
- the seal-probe result;
- reusable helpers;
- anything unproved or uncertain.
