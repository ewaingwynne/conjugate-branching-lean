# Brief W-B2 — path-space layer: Markov property, uniqueness, h-transform; Props 2.1(b) and 2.2

**Goal.**
1. Prove the path-level Markov property of `pathLaw`, and that finite measures on path space
   are determined by their values on cylinder sets.
2. Prove the Doob h-transform for the offspring "tilt" `c ↦ a_k⁻¹ μ_k(c) ∏_j a_j^{c_j}`.
3. Use these to prove the providers of two frozen anchors:
   - `Conjugate.proposition_2_1_condLaw` (paper.tex:390-403, (2.1); ERRATA R6);
   - `Conjugate.proposition_2_2` (paper.tex:420-432).

**Graph nodes served** (`DEPGRAPH.md`, read-only for you):
- the roots `prop-cond-on-ext.cond-law` and `prop-conjugate`, with the steps `prop-conjugate#…`;
- the path-level part of `claim:branching-property`.

**Approved route** (`PLAN.md` §6, "Prop 2.2 / Thm 1.4 equivalence as a Doob h-transform on
cylinder sets"). The paper cites Jagers–Lagerås [JL08, Thm 1] for (2.1), and Athreya–Ney
[AN72, V.3 Thm 2] for the extinction probabilities. **Do not formalize those citations.** Prove
everything directly:
- **Extinction probabilities.** `a = (ℙ_k[E])_k` satisfies `f(a) = a`: condition on
  generation 1 and use the extinction product formula.
- **Tilted kernel.** For `h(y) = ∏_j a_j^{y_j}`, the tilted step kernel is
  `stepKernel μ z {w} · h(w) / h(z)`. It equals the step kernel of the tilted offspring laws.
- **Cylinders.** Cylinder probabilities of the tilted process telescope to
  `ℙ_x(cyl) · h(y_n)/h(x)`.
- **Extinction event.** `E` is shift-invariant, so by the Markov property
  `ℙ_x(cyl ∩ E) = ℙ_x(cyl) · ℙ_{y_n}(E)`.
- **Conclusion.** Both conditional laws are determined by cylinders.
- **Prop 2.2's extinction probability.** `ℙ̂_x(X(n) = 0) = ℙ_x(X(n) = 0) / h(x) → 1/h(x)`,
  since `h(0) = 1`. Use `hext` and `pathLaw_extinctionEvent_eq_iSup`.

**Ownership.** Create or edit only these files:
- new files under `Conjugate/Internal/PathSpace/`, for example `Markov.lean`, `Cylinder.lean`
  and `Tilt.lean`;
- the existing stubs `Conjugate/Internal/Proposition_2_1_CondLaw.lean` and
  `Conjugate/Internal/Proposition_2_2.lean` (keep header and docstring).

Edit nothing else.

**Allowed inputs.**
- Mathlib.
- `Conjugate/Frozen/Defs/*`.
- `Conjugate.Infrastructure.{Population,StepKernel}`.
- `Conjugate.Internal.Foundations.*`. In particular use:
  - `pathLaw_cylinder`, `pathLaw_map_eval_succ`, `stepKernel_eq_map`, `lintegral_stepKernel`,
    `Individuals`, `offspringPi`, `typedSumLaw`;
  - `pathLaw_extinctionEvent_eq_iSup`, `pathLaw_extinctionEvent_eq_prod`;
  - `pathLaw_map_eval_succ_bind`.
- `Conjugate.Internal.Analytic.*`.

Never import a non-`Defs` frozen file or another anchor's provider.

**Exact public API to prove** (namespace `Conjugate`, `variable {ι : Type*} [Countable ι]`).
Every statement was elaborated against the current build. The **definition** `tilt` is yours to
write. It must satisfy `tilt_apply`, and it must be a genuine `PMF`: build it from the `HasSum`
given by `ha`, never with a junk default. Helpers with other names are welcome.

```lean
open MeasureTheory ProbabilityTheory Filter Topology
open scoped ENNReal

noncomputable def tilt (μ : ι → PMF (ι →₀ ℕ)) (a : ι → ℝ≥0∞) (ha : genFun μ a = a)
    (h0 : ∀ k, a k ≠ 0) (htop : ∀ k, a k ≠ ∞) : ι → PMF (ι →₀ ℕ)

theorem tilt_apply (μ : ι → PMF (ι →₀ ℕ)) (a : ι → ℝ≥0∞) (ha : genFun μ a = a)
    (h0 : ∀ k, a k ≠ 0) (htop : ∀ k, a k ≠ ∞) (k : ι) (c : ι →₀ ℕ) :
    tilt μ a ha h0 htop k c = (a k)⁻¹ * (μ k c * c.prod fun j n => a j ^ n)

/-- Markov property at time `n`, path level. -/
theorem pathLaw_cylinder_inter_shift (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) (n : ℕ)
    (y : ℕ → ι →₀ ℕ) {A : Set (ℕ → ι →₀ ℕ)} (hA : MeasurableSet A) :
    pathLaw μ x ({ω | ∀ i ≤ n, ω i = y i} ∩ (fun ω m => ω (n + m)) ⁻¹' A) =
      pathLaw μ x {ω | ∀ i ≤ n, ω i = y i} * pathLaw μ (y n) A

/-- Finite measures on path space are determined by cylinder sets. -/
theorem measure_eq_of_cylinder {P Q : Measure (ℕ → ι →₀ ℕ)} [IsFiniteMeasure P]
    [IsFiniteMeasure Q]
    (h : ∀ n (y : ℕ → ι →₀ ℕ), P {ω | ∀ i ≤ n, ω i = y i} = Q {ω | ∀ i ≤ n, ω i = y i}) :
    P = Q

theorem stepKernel_tilt_singleton (μ : ι → PMF (ι →₀ ℕ)) (a : ι → ℝ≥0∞)
    (ha : genFun μ a = a) (h0 : ∀ k, a k ≠ 0) (htop : ∀ k, a k ≠ ∞) (z w : ι →₀ ℕ) :
    stepKernel (tilt μ a ha h0 htop) z {w} =
      stepKernel μ z {w} * (w.prod fun j m => a j ^ m) / (z.prod fun j m => a j ^ m)

theorem pathLaw_tilt_cylinder (μ : ι → PMF (ι →₀ ℕ)) (a : ι → ℝ≥0∞) (ha : genFun μ a = a)
    (h0 : ∀ k, a k ≠ 0) (htop : ∀ k, a k ≠ ∞) (x : ι →₀ ℕ) (n : ℕ) (y : ℕ → ι →₀ ℕ) :
    pathLaw (tilt μ a ha h0 htop) x {ω | ∀ i ≤ n, ω i = y i} =
      pathLaw μ x {ω | ∀ i ≤ n, ω i = y i} * ((y n).prod fun j m => a j ^ m) /
        (x.prod fun j m => a j ^ m)

/-- The extinction probabilities are a fixed point of `f` (any countable type set). -/
theorem genFun_extinction (μ : ι → PMF (ι →₀ ℕ)) :
    genFun μ (fun k => pathLaw μ (Finsupp.single k 1) (extinctionEvent ι)) =
      fun k => pathLaw μ (Finsupp.single k 1) (extinctionEvent ι)
```

**Providers.** Each must have exactly the frozen type, with the same binder names and order.
Read the frozen files.
```lean
namespace Conjugate.Internal
theorem proposition_2_1_condLaw {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hpr : IsPositiveRegular μ) (hns : IsNonsingular μ)
    (a : Fin d → ℝ≥0∞)
    (ha : ∀ k, a k = pathLaw μ (Finsupp.single k 1) (extinctionEvent (Fin d)))
    (ha01 : ∀ k, 0 < a k ∧ a k < 1) :
    ∃ ν : Fin d → PMF (Fin d →₀ ℕ),
      (∀ k c, ν k c = (a k)⁻¹ * (μ k c * c.prod fun j n => a j ^ n)) ∧
      ∀ k, (pathLaw μ (Finsupp.single k 1))[|extinctionEvent (Fin d)] =
        pathLaw ν (Finsupp.single k 1)

theorem proposition_2_2 {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hpr : IsPositiveRegular μ) (hns : IsNonsingular μ)
    (hext : ∀ x, pathLaw μ x (extinctionEvent (Fin d)) = 1)
    (A : Fin d → ℝ≥0∞) (hA : ∀ j, 1 ≤ A j ∧ A j < ∞) (hfix : genFun μ A = A) :
    ∃ μHat : Fin d → PMF (Fin d →₀ ℕ),
      (∀ k c, μHat k c = (A k)⁻¹ * (μ k c * c.prod fun j n => A j ^ n)) ∧
      (∀ k, pathLaw μHat (Finsupp.single k 1) (extinctionEvent (Fin d)) = (A k)⁻¹) ∧
      ∀ k, (pathLaw μHat (Finsupp.single k 1))[|extinctionEvent (Fin d)] =
        pathLaw μ (Finsupp.single k 1)
```
The seals will be `by exact Conjugate.Internal.proposition_2_1_condLaw μ hpr hns a ha ha01`
and `by exact Conjugate.Internal.proposition_2_2 μ hpr hns hext A hA hfix`. `hpr` and `hns`
may turn out unused. Keep their names; an unused-variable warning is acceptable.

**Hints.**
- **`pathLaw_cylinder_inter_shift`.** Fix the cylinder and compare the two sides as finite
  measures in `A`. They agree on cylinders `A = {ω | ∀ i ≤ m, ω i = z i}`, by `pathLaw_cylinder`
  applied twice: the intersection is a length-`n+m` cylinder when `z 0 = y n`, and empty
  otherwise. So they agree everywhere by `measure_eq_of_cylinder`. Prove
  `measure_eq_of_cylinder` first:
  - the cylinders, together with `∅`, form a π-system generating the product σ-algebra
    (`MeasurableSpace.pi`, `measurable_pi_iff`, `generateFrom_pi`-style lemmas);
  - the total masses agree by countable additivity over `y 0`;
  - then apply `ext_of_generate_finite`.
- **`ProbabilityTheory.cond`.** `P[|s] = (P s)⁻¹ • P.restrict s`
  (`ProbabilityTheory.cond_apply`).
- **`stepKernel_tilt_singleton`.** Use the product-measure description of `stepKernel`
  (`stepKernel_eq_map`, `offspringPi`). The tilt is multiplicative over individuals, and
  `∏_p a_{type p} = h(z)`. Since the space is discrete, singleton masses of the push-forward
  are sums over preimages.

**Checks** (run them and paste the output):
```bash
export PATH="$HOME/.elan/bin:$HOME/.local/bin:$PATH"
lake build Conjugate.Internal.Proposition_2_1_CondLaw Conjugate.Internal.Proposition_2_2
python3 -I tools/check_lean_modules.py --root . --max-lines 1500 --files Conjugate/Internal/PathSpace/*.lean Conjugate/Internal/Proposition_2_1_CondLaw.lean Conjugate/Internal/Proposition_2_2.lean
python3 -I tools/leanprobe.py axioms <Module> <Decl>   # every public theorem above and both providers
```
Only `propext`, `Classical.choice` and `Quot.sound` are acceptable.

**Seal probes.** For each provider, create `.lake/probes/b2/SealProbe*.lean`.
- Copy the frozen statement into it, with the `by exact … ` body shown above.
- Import only the provider module and `Defs`.
- Compile it, report the result, then delete it.

**Concurrency.** Another agent works at the same time on other files.
- Build only your own modules, with explicit targets, or `lake env lean <your file>`.
- Never run `lake build` with no target.

**Stop condition.** You are done when every listed theorem and both providers compile without
`sorry` and with the standard axioms only, and both seal probes pass. Stop early and report if:
- a listed statement or frozen statement appears false or mis-typed (do not change it);
- you are stuck after a serious attempt. Finish what you can and report the precise gap.

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

(Rule 4: you author these two providers. You never import their frozen anchor files.)

Use the copyright header of the existing files. Put scratch files in `.lake/probes/b2/`.

**Handoff.** Report:
- the files created;
- the approach for each theorem;
- the exact commands and their output;
- axioms;
- the seal-probe results;
- reusable helpers;
- anything unproved or uncertain.
