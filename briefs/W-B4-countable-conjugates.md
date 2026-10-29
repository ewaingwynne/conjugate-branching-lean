# Brief W-B4 — batch-2 providers: countable-type conjugates (five anchors)

**Goal.** Prove the providers of the five new frozen anchors. The author approved them in
batch 2 (`review/batch-2.md`; ERRATA R8, E10). They are now `DRAFT_SORRY` in
`Conjugate/Frozen/`:

| Frozen file | Export | Provider (existing stub, keep header/docstring) |
|---|---|---|
| `Proposition_2_1_CondLaw_Countable.lean` | `Conjugate.proposition_2_1_condLaw_countable` | `Conjugate/Internal/Proposition_2_1_CondLaw_Countable.lean` → `Conjugate.Internal.proposition_2_1_condLaw_countable` |
| `Proposition_2_2_Countable.lean` | `Conjugate.proposition_2_2_countable` | `…/Proposition_2_2_Countable.lean` → `Conjugate.Internal.proposition_2_2_countable` |
| `ExistsConjugateIffCountable.lean` | `Conjugate.exists_conjugate_iff_exists_fixedPoint_countable` | `…/ExistsConjugateIffCountable.lean` → `Conjugate.Internal.exists_conjugate_iff_exists_fixedPoint_countable` |
| `Theorem_3_1_Conjugate.lean` | `Conjugate.theorem_3_1_conjugate` | `…/Theorem_3_1_Conjugate.lean` → `Conjugate.Internal.theorem_3_1_conjugate` |
| `Example_3_5_Conjugate.lean` | `Conjugate.example_3_5_conjugate` | `…/Example_3_5_Conjugate.lean` → `Conjugate.Internal.example_3_5_conjugate` |

Each provider must have **exactly** the frozen type, binder names and binder order. Read the
frozen files. The seals will be `by exact Conjugate.Internal.<name> <the anchor's binder names in
order>`.

**Graph nodes served** (`DEPGRAPH.md`, slice E): `prop-cond-on-ext.ctble.cond-law`,
`prop-conjugate.ctble` and its steps, `thm-fixed-gf.equivalence.ctble` and its steps,
`thm-fixed-pt-infty.conjugate`, and `example-ctble.conjugate`.

**Route** (approved, `PLAN.md` §6; the same as the audited finite-type proofs). The path-space
machinery in `Conjugate/Internal/PathSpace/*.lean` is already stated for an arbitrary
`[Countable ι]`:
- `tilt`, `tilt_apply`;
- `measure_eq_of_cylinder`, `pathLaw_cylinder_inter_shift`;
- `stepKernel_tilt_singleton`, `pathLaw_tilt_cylinder`;
- `pathLaw_tilt_eval_singleton`, `pathLaw_tilt_extinctionEvent`;
- `genFun_extinction`.

The Foundations extinction lemmas are general too (`pathLaw_extinctionEvent_eq_prod`,
`pathLaw_extinctionEvent_eq_one_of_single`, …), as is Lemma 2.3
(`eq_one_or_one_lt_of_genFun_eq_self`, `[Countable ι]`).

So:
1. **#1 and #2.** Port the audited finite-type providers `Conjugate/Internal/Proposition_2_1_CondLaw.lean`
   and `Conjugate/Internal/Proposition_2_2.lean` from `Fin d` to `ℕ`. The proofs should go through
   almost verbatim.
2. **Countable conjugacy.** Port `Conjugate/Internal/Conjugacy/{FixedPointToConjugate,ConjugateToFixedPoint,Basic}.lean`
   to `ℕ`. Note:
   - "fixed point ⇒ conjugate" must **not** assume positive regularity or non-singularity. It uses
     only per-type global extinction (`hext`, upgraded to every state by
     `pathLaw_extinctionEvent_eq_one_of_single`). Build it from the `tilt` machinery directly, not
     from the frozen #2, which has `hpr`/`hns` premises.
   - "Laws differ": `ℙ̂_0[E] = 1/q_0 < 1 = ℙ_0[E]` (type `0 : ℕ`).
   - "conjugate ⇒ fixed point" reads the tilt off generation 1 by the time-1 Markov property, as
     in the finite case, then applies Lemma 2.3 with `hpr`.
3. **#3** is the two directions.
4. **#4** is the sealed `Conjugate.theorem_3_1` (module `Conjugate.Frozen.Theorem_3_1`) followed
   by the countable "fixed point ⇒ conjugate". `X` itself is **not** assumed positive regular
   there.
5. **#5** is the sealed `Conjugate.example_3_5` (module `Conjugate.Frozen.Example_3_5`), whose
   conclusion includes global extinction and a fixed point in `(1,∞)^ℕ`, followed by the same step.

**Exact public API to prove** (namespace `Conjugate`; elaborated against the current build):
```lean
theorem isConjugate_of_fixedPoint_nat (μ : ℕ → PMF (ℕ →₀ ℕ))
    (hext : ∀ k, pathLaw μ (Finsupp.single k 1) (extinctionEvent ℕ) = 1)
    {q : ℕ → ℝ≥0∞} (hq : ∀ j, 1 < q j ∧ q j < ∞) (hfix : genFun μ q = q) :
    ∃ μHat, IsConjugate μ μHat ∧
      ∀ k c, μHat k c = (q k)⁻¹ * (μ k c * c.prod fun j n => q j ^ n)

theorem exists_fixedPoint_of_isConjugate_nat (μ : ℕ → PMF (ℕ →₀ ℕ))
    (hext : ∀ k, pathLaw μ (Finsupp.single k 1) (extinctionEvent ℕ) = 1)
    (hpr : IsPositiveRegular μ) {μHat : ℕ → PMF (ℕ →₀ ℕ)} (h : IsConjugate μ μHat) :
    ∃ q : ℕ → ℝ≥0∞, (∀ j, 1 < q j ∧ q j < ∞) ∧ genFun μ q = q ∧
      ∀ k c, μHat k c = (q k)⁻¹ * (μ k c * c.prod fun j n => q j ^ n)
```

**Ownership.**
- The five provider stubs listed above.
- New files under `Conjugate/Internal/Countable/`.
- Edit nothing else. In particular, do not modify the audited `PathSpace`, `Conjugacy` or
  `Foundations` files; import them.

**Allowed inputs.**
- Mathlib.
- `Conjugate/Frozen/Defs/*`.
- `Conjugate.Infrastructure.*`.
- All of `Conjugate.Internal.{Foundations,Analytic,Section2,Section3,PathSpace,Conjugacy,SingleType,Examples}.*`.
- The **sealed** frozen modules `Conjugate.Frozen.Theorem_3_1` and `Conjugate.Frozen.Example_3_5`,
  and any other SEALED frozen module.

**Never** import a `DRAFT_SORRY` anchor (the five batch-2 frozen files are DRAFT; check
`frozen-anchor-manifest.json`) or another anchor's provider. In particular, #3, #4 and #5 must
**not** import the frozen #2. Use your internal lemmas.

**Checks** (run them and paste the output):
```bash
export PATH="$HOME/.elan/bin:$HOME/.local/bin:$PATH"
lake build Conjugate.Internal.Proposition_2_1_CondLaw_Countable Conjugate.Internal.Proposition_2_2_Countable Conjugate.Internal.ExistsConjugateIffCountable Conjugate.Internal.Theorem_3_1_Conjugate Conjugate.Internal.Example_3_5_Conjugate
python3 -I tools/check_lean_modules.py --root . --max-lines 1500 --files <all your files>
python3 -I tools/leanprobe.py axioms <Module> <Decl>   # all five providers and both API theorems
python3 -I tools/check_frozen_anchors.py --root . --manifest frozen-anchor-manifest.json
```
Only `propext`, `Classical.choice` and `Quot.sound` are acceptable. The anchor checker must pass,
which includes draft quarantine.

**Seal probes.** For each of the five anchors:
- put a copy of the frozen file, with `by sorry` replaced by the seal line, in `.lake/probes/b4/`;
- compile it with `lake env lean -DautoImplicit=false -DrelaxedAutoImplicit=false`, after
  dropping the provider import line if needed;
- report the result, then delete it.

**Stop condition.** You are done when all five providers and both API theorems compile without
`sorry`, with the standard axioms only, and all five seal probes pass. Stop and report if a
frozen statement appears false or mis-typed (do not change it).

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

(Rule 4: you author these five providers. Never import their frozen files. Keep unfinished work
in `.lake/probes/b4/`.)

Use the copyright header of the existing files, and the compiled paper numbering in docstrings.

**Handoff.** Report:
- the files created;
- the approach;
- the exact commands and their output;
- axioms;
- the seal-probe results;
- reusable helpers;
- anything unproved or uncertain.
