# Brief W-A3 — analytic basics of `f` and `g`, and the Hyp. III remark (Lane A, Sonnet)

**Goal.**
1. Prove the elementary analytic properties of the generating function `f = genFun μ` and of
   `g = logGenFun μ`: monotonicity, values at `1` and `0`, the iterate formula (2.5), the
   fixed-point equivalence (2.6), and continuity of the iterates of `g` on `[0,∞]^d`.
2. Prove the provider for the frozen anchor `Conjugate.remark_hypIII_automatic`.

**Graph nodes served** (`DEPGRAPH.md`, read-only for you):
- `eqn-convex-func-n` (paper.tex:540, display (2.5));
- `eqn-fixed-pt-equiv` (paper.tex:546-549, display (2.6));
- `lem-basin-open#g-iter-continuous` (paper.tex:814);
- `lem-mono`, first assertion only (paper.tex:593, `λ ≤ η ⇒ g^{(n)}(λ) ≤ g^{(n)}(η)`);
- the root `rem:hyp-iii-automatic` with its step `rem:hyp-iii-automatic#continuity-from-finiteness`
  (paper.tex:252, last sentence).

**Ownership.** Create or edit only these files:
- `Conjugate/Internal/Analytic/GenFun.lean`: facts about `f`;
- `Conjugate/Internal/Analytic/LogGenFun.lean`: facts about `g`;
- `Conjugate/Internal/Remark_HypIII_Automatic.lean`: the existing empty provider stub. Keep
  its header and docstring; add the proof.

You may add further files under `Conjugate/Internal/Analytic/`. Edit nothing else.

**Allowed inputs.**
- Mathlib.
- `Conjugate/Frozen/Defs/*` (SEALED).
- `Conjugate/Infrastructure/{Population,StepKernel}.lean`.
- The finished foundation modules `Conjugate.Internal.Foundations.*`. For (2.5) you need
  `Conjugate.lintegral_pathLaw_prod` from `Conjugate.Internal.Foundations.Generations`.
- Do **not** import `Conjugate/Frozen/Remark_HypIII_Automatic.lean` or any other non-`Defs`
  frozen file.

**Exact public API to prove** (namespace `Conjugate`, `variable {ι : Type*} [Countable ι]`
unless shown otherwise). Every statement was elaborated against the current build. Helpers
with other names are welcome.

```lean
open MeasureTheory ProbabilityTheory Filter Topology
open scoped ENNReal

-- Analytic/GenFun.lean
theorem genFun_mono (μ : ι → PMF (ι →₀ ℕ)) : Monotone (genFun μ)
theorem genFun_one (μ : ι → PMF (ι →₀ ℕ)) : genFun μ 1 = 1
theorem genFun_iterate_eq (μ : ι → PMF (ι →₀ ℕ)) (n : ℕ) (q : ι → ℝ≥0∞) (k : ι) :
    (genFun μ)^[n] q k = ∫⁻ ω, (ω n).prod (fun j m => q j ^ m) ∂pathLaw μ (Finsupp.single k 1)

-- Analytic/LogGenFun.lean
theorem logGenFun_iterate (μ : ι → PMF (ι →₀ ℕ)) (n : ℕ) (x : ι → EReal) :
    (logGenFun μ)^[n] x = fun k => ENNReal.log ((genFun μ)^[n] (fun j => EReal.exp (x j)) k)
theorem logGenFun_mono (μ : ι → PMF (ι →₀ ℕ)) : Monotone (logGenFun μ)
theorem logGenFun_zero (μ : ι → PMF (ι →₀ ℕ)) : logGenFun μ 0 = 0
theorem mapsTo_logGenFun (μ : ι → PMF (ι →₀ ℕ)) :
    Set.MapsTo (logGenFun μ) {x | ∀ j, 0 ≤ x j} {x | ∀ j, 0 ≤ x j}
theorem logGenFun_eq_self_iff (μ : ι → PMF (ι →₀ ℕ)) (x : ι → EReal) :
    logGenFun μ x = x ↔ genFun μ (fun j => EReal.exp (x j)) = fun j => EReal.exp (x j)
theorem continuousOn_logGenFun_iterate {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j}) (n : ℕ) :
    ContinuousOn (logGenFun μ)^[n] {x | ∀ j, 0 ≤ x j}

-- Remark_HypIII_Automatic.lean: namespace Conjugate.Internal, exact frozen type
theorem remark_hypIII_automatic {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hpr : IsPositiveRegular μ) (hns : IsNonsingular μ)
    (hfin : ∀ k (q : Fin d → ℝ≥0∞), (∀ j, 0 < q j ∧ q j < ∞) → genFun μ q k < ∞) :
    ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j}
```

The last theorem must have **exactly** the type, binder names and binder order of the frozen
`Conjugate.remark_hypIII_automatic` in `Conjugate/Frozen/Remark_HypIII_Automatic.lean`. Read that
file. Its proof body will become `by exact Conjugate.Internal.remark_hypIII_automatic μ hpr hns hfin`.
- `hpr` and `hns` are source context, and the mathematics does not need them. Leave them
  unused, but keep the exact names `hpr hns`. An unused-variable linter warning is acceptable.
- Never strengthen or drop a hypothesis.

**Mathematics of the remark** (paper.tex:252). Fix `k`. Then `f_k(q) = ∑_c μ_k(c) ∏_j q_j^{c_j}`,
a series of monomials with nonnegative coefficients in `[0,∞]`. Let `q* ∈ (0,∞]^d`, and let
`J∞ = {j : q*_j = ∞}`. There are two cases.
- **Case `f_k(q*) = ∞`.** Show `f_k(q) → ∞` as `q → q*` within `(0,∞]^d`. Some coefficient
  satisfies `μ_k(c) > 0`, and either `c_j ≥ 1` for some `j ∈ J∞`, or the finite-coordinate
  sum diverges. In the first case, the single monomial already tends to `∞`, because the other
  factors stay bounded below by positive constants near `q*`. In general, use lower
  semicontinuity of `f_k`, which follows from Fatou or from monotone convergence of partial
  sums of continuous monomials. Lower semicontinuity gives `liminf f_k(q) ≥ f_k(q*) = ∞`.
- **Case `f_k(q*) < ∞`.** Every `c` with `μ_k(c) > 0` has `c_j = 0` for `j ∈ J∞`, so `f_k`
  depends only on the coordinates outside `J∞` near `q*`. On those coordinates, dominate by
  the value at `2q*` (finite by `hfin`, with `∞` coordinates replaced by any finite value; they
  do not matter). Then use dominated convergence for the series (`tsum`), or for `lintegral`
  against `(μ k).toMeasure`, to get continuity.

Lower semicontinuity plus this upper bound may be the cleanest combination. Choose your own
proof. Note that the topology on `Fin d → ℝ≥0∞` is the product topology, and `ℝ≥0∞` is
order-topologized.

**Hints for (2.5)–(2.6).**
- `ENNReal.exp_log`, `EReal.exp_monotone`, `ENNReal.log_monotone`, and the order isomorphism
  / homeomorphism between `EReal` and `ℝ≥0∞` in
  `Mathlib/Analysis/SpecialFunctions/Log/ENNRealLogExp.lean` (`continuous_log`, `continuous_exp`).
- `genFun_iterate_eq` follows from `lintegral_pathLaw_prod` with `x = single k 1`.
- For continuity of iterates: `g` maps `{x | ∀ j, 0 ≤ x j}` to itself (`f(q) ≥ f(1) = 1` for
  `q ≥ 1`). There `exp x ≥ 1 > 0`, so Hyp. III applies. Compose `ContinuousOn` along `MapsTo`.

**Checks** (run them and paste the output):
```bash
export PATH="$HOME/.elan/bin:$HOME/.local/bin:$PATH"
lake build Conjugate.Internal.Analytic.GenFun Conjugate.Internal.Analytic.LogGenFun Conjugate.Internal.Remark_HypIII_Automatic
python3 -I tools/check_lean_modules.py --root . --max-lines 1500 --files Conjugate/Internal/Analytic/*.lean Conjugate/Internal/Remark_HypIII_Automatic.lean
python3 -I tools/leanprobe.py axioms <Module> <Decl>   # every public theorem listed above
```
Only `propext`, `Classical.choice` and `Quot.sound` are acceptable.

Also check that the provider's type is the frozen type. Create `.lake/probes/a3/SealProbe.lean`
containing a copy of the frozen theorem's statement (any name) with body
`by exact Conjugate.Internal.remark_hypIII_automatic μ hpr hns hfin`. It imports only the
provider module and the `Defs` it needs. Compile it with `lake env lean`, report the result,
then delete it.

**Concurrency.** Another agent may be working at the same time on `Conjugate/Infrastructure/Brouwer*`.
- Build only your own modules, with explicit targets, or `lake env lean <your file>`.
- Never run `lake build` with no target. Never build or touch the other agent's files.

**Stop condition.** You are done when every listed theorem compiles without `sorry` and with
the standard axioms only. Stop early and report if:
- a statement appears false or mis-typed. Do not change it; report the problem;
- the frozen remark seems unprovable as stated.

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

(For rule 4: you are the provider author for `Remark_HypIII_Automatic`, so you write that
provider module. You still never import the frozen anchor file itself.)

Use the copyright header of the existing files. Put scratch files in `.lake/probes/a3/`.

**Handoff.** Report:
- the files created;
- the approach for each theorem;
- the exact commands and their output;
- axioms;
- the seal-probe result;
- reusable helpers;
- anything unproved or uncertain.
