# Brief W-A13 — Lemma 2.19 (deformation retraction of the annulus `A` onto `Λ`)

**Goal.** Prove Lemma 2.19 (paper.tex:851-891) as an audited graph node. The approved route for
Theorem 2.7 does not need it (`PLAN.md` §6), but it is a result of the paper and is proved as
stated.

**Graph nodes served** (`DEPGRAPH.md`): `lem-retract` with its steps `#choose-r-R`,
`#Lambda-compact`, `#radial-bijection`, `#phi-homeomorphism`, `#H-continuous`, `#H-fixes-Lambda`
and `#H-preserves-A`, and the display `eqn-retract-def`.

**Norm.** The paper's `|·|` is unspecified. Use the sup norm, as in ruling R1 for (2.9). It is
Mathlib's norm on `Fin d → ℝ`.

**Exact public API** (namespace `Conjugate`; elaborated against the current build). It goes in
`Conjugate/Internal/Section2/Retract.lean` (new file; edit nothing else):
```lean
theorem exists_deformationRetract {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hI : IsSubcritical μ) (hII : IsPositiveRegular μ ∧ IsNonsingular μ)
    (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j}) :
    ∃ r R : ℝ, 0 < r ∧ r < R ∧
      let A : Set (Fin d → ℝ) := {u | (∀ j, 0 ≤ u j) ∧ r ≤ ‖u‖ ∧ ‖u‖ ≤ R}
      let Λ : Set (Fin d → ℝ) :=
        {u | (∀ j, 0 ≤ u j) ∧ (fun j => (u j : EReal)) ∉ basinZero μ ∪ basinInfty μ}
      Λ ⊆ A ∧ ∃ H : ℝ × (Fin d → ℝ) → (Fin d → ℝ),
        ContinuousOn H (Set.Icc 0 1 ×ˢ A) ∧
        (∀ t ∈ Set.Icc (0 : ℝ) 1, ∀ u ∈ A, H (t, u) ∈ A) ∧
        (∀ u ∈ A, H (0, u) = u) ∧ (∀ u ∈ A, H (1, u) ∈ Λ) ∧
        (∀ t ∈ Set.Icc (0 : ℝ) 1, ∀ u ∈ Λ, H (t, u) = u)
```

**Mathematics** (shorter than the paper, reusing the Theorem 2.7 assembly).
- **Choice of `r` and `R`.**
  - Lemma 2.15 (`exists_mem_basinZero_of_le`) gives `ε`: `[0,ε]^d ⊆ S₀`. So `Λ` avoids the box,
    and `‖u‖ > ε` on `Λ`. Take `r = ε`, or `ε/2`.
  - Lemma 2.16 (`exists_attractive_infty`) and (2.10) give `C`: `[0,∞)^d ∖ [0,C]^d ⊆ S∞`. So
    `‖u‖ ≤ C` on `Λ`. Take `R = max C (2r)`, which also gives `r < R`.
- **The homotopy.** For `u ∈ A` let `π(u) = u / ∑_j u_j`, a point of the simplex. Put
  `φ(v) = ρ(v) v`, where `ρ = rayParam μ` is the ray parameter from
  `Conjugate/Internal/Section2/AssemblyRay.lean` (Lemma 2.18 via `existsUnique_ray`).
  `ρ` is continuous on the simplex (`continuousOn_rayParam`). Define
  `H(t, u) = (1 − t) u + t φ(π u)`, which is (2.13) with the radial projection taken onto the
  simplex instead of the unit sphere. Then:
  - **Continuous on `[0,1] × A`.** `∑_j u_j ≥ ‖u‖ ≥ r > 0` on `A`.
  - **`H(t, u) ∈ A`.** `u` and `φ(π u)` lie on the same ray. The sup norm is positively
    homogeneous, so `‖H(t,u)‖ = (1−t)‖u‖ + t‖φ(π u)‖ ∈ [r, R]`, using `Λ ⊆ A`.
  - **`H(0, u) = u`** and **`H(1, u) = φ(π u) ∈ Λ`** (`rayParam_spec`).
  - **`H(t, u) = u` for `u ∈ Λ`.** Uniqueness of the ray intersection gives `φ(π u) = u`.

**Allowed inputs.**
- Mathlib.
- `Conjugate/Frozen/Defs/*`.
- `Conjugate.Infrastructure.*`.
- `Conjugate.Internal.{Foundations,Analytic,Section2}.*`, including `Assembly{Ray,Map}`. Read
  them; do not edit them.

Never import a non-`Defs` frozen file or a provider.

**Checks** (run them and paste the output):
```bash
export PATH="$HOME/.elan/bin:$HOME/.local/bin:$PATH"
lake build Conjugate.Internal.Section2.Retract
python3 -I tools/check_lean_modules.py --root . --max-lines 1500 --files Conjugate/Internal/Section2/Retract.lean
python3 -I tools/leanprobe.py axioms Conjugate.Internal.Section2.Retract Conjugate.exists_deformationRetract
```
Only `propext`, `Classical.choice` and `Quot.sound` are acceptable.

**Concurrency.** Other agents work at the same time on other files.
- Build only your module, with an explicit target.
- Never run `lake build` with no target.

**Stop condition.** You are done when the theorem compiles without `sorry` and with the standard
axioms only. Stop early and report if the statement appears false or mis-typed (do not change
it).

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

Use the copyright header of the existing files. Put scratch files in `.lake/probes/a13/`.

**Handoff.** Report:
- the file created;
- the approach;
- the exact commands and their output;
- axioms;
- anything unproved or uncertain.
