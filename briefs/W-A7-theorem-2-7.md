# Brief W-A7 — Theorem 2.7 via Brouwer on the simplex, and Theorem 1.4 (fixed-point form)

**Goal.** Prove two providers:
- `Conjugate.Internal.theorem_2_7`, for the frozen `Conjugate.theorem_2_7` (paper.tex:555-557,
  proof at paper.tex:894-905);
- `Conjugate.Internal.theorem_1_4_fixedPoint`, for the frozen `Conjugate.theorem_1_4_fixedPoint`
  (paper.tex:240-252, with the reduction (2.6) at paper.tex:546-552).

The orchestrator seals `theorem_2_7` first. Only then is the second provider written against
the **sealed** frozen export `Conjugate.theorem_2_7`.

**Graph nodes served** (`DEPGRAPH.md`, read-only for you): `thm-fixed` and its steps
`thm-fixed#…`, and `thm-fixed-gf.fixed-point` with `#reduce-to-thm-2-7`.

**Approved route deviation** (`PLAN.md` §6). Do **not** construct the annulus `A`, the
deformation retraction or the homeomorphism with a ball. Lemma 2.19 is proved separately. Use
the simplex instead:
- `Δ = {u : Fin d → ℝ | (∀ j, 0 ≤ u j) ∧ ∑ j, u j = 1}`.
- For `u ∈ Δ`, let `ρ(u) > 0` be the unique `r` with `r u ∈ Λ = [0,∞)^d ∖ (S₀ ∪ S∞)`
  (Lemma 2.17, W-A6 `existsUnique_ray`). Choosing from this `∃!` is legitimate.
- Put `φ(u) = ρ(u) u` and `π(λ) = λ / ∑_j λ_j`.

The steps:
1. **`ρ` is continuous on `Δ`.** For real `t > 0`:
   - `{u ∈ Δ | t < ρ u} = {u ∈ Δ | t u ∈ S₀}`;
   - `{u ∈ Δ | ρ u < t} = {u ∈ Δ | t u ∈ S∞}`.

   Prove both with the W-A6 ray corollaries, `basinZero_inter_basinInfty` and uniqueness. They
   are relatively open by Lemma 2.16 (W-A6 `exists_isOpen_basinZero/Infty`) and continuity of
   `u ↦ t u`. For `t ≤ 0` the first set is all of `Δ`. This avoids the paper's compactness and
   homeomorphism argument.
2. **`g(Λ) ⊆ Λ`** (paper.tex:896), from Lemma 2.18 (W-A4 `logGenFun_mem_basin*_iff`).
   - Every point of `Λ` is finite and nonnegative, and `Λ ∌ 0`, because `0 ∈ S₀`
     (`logGenFun_zero`).
   - So `G(u) := g(φ(u))` is finite, nonnegative and nonzero, with `∑_j G(u)_j > 0` in `ℝ`.
3. **`F(u) := π(toReal ∘ G(u))` is a continuous self-map of `Δ`.**
   - `g` is continuous on `[0,∞]^d` (W-A3 `continuousOn_logGenFun_iterate` with `n = 1`), and
     `φ` is continuous.
   - `EReal.toReal` is continuous at finite points.
   - The denominator is positive.
4. **Brouwer.** `Conjugate.Infrastructure.brouwer_simplex` (module
   `Conjugate.Infrastructure.Brouwer`, which must be finished before you start; check it
   compiles) gives `u*` with `F u* = u*`.
5. **The fixed point.** `G(u*) = s u*` with `s = ∑_j G(u*)_j > 0`. Since `G(u*) ∈ Λ` lies on the
   ray of `u*`, uniqueness gives `s = ρ(u*)`, so `g(φ(u*)) = φ(u*)`.
6. **Positivity** (paper.tex:904). `λ = φ(u*) ∈ Λ` is finite and `≠ 0`. Put `q = exp ∘ λ`.
   - `f(q) = q` by (2.6), W-A3 `logGenFun_eq_self_iff`.
   - `q ≠ 𝟙` since `λ ≠ 0`.
   - Lemma 2.3 (W-A4 `eq_one_or_one_lt_of_genFun_eq_self`) applies, with certain extinction
     from `hI` via `pathLaw_extinctionEvent_eq_one`. It gives `q_k > 1` for all `k`, hence
     `0 < λ_k < ⊤`.

**W-A6 names you will use** (in `Conjugate/Internal/Section2/Ray.lean`, `BasinOpen.lean` and
`Attractive.lean`). Read the files for exact binders.
- `existsUnique_ray`;
- `ray_mem_basinZero_of_not_mem_basinInfty`: if `t u ∉ S∞`, `0 ≤ s < t` and `u ≥ 0`, then
  `s u ∈ S₀`;
- `ray_mem_basinInfty_of_not_mem_basinZero`: if `s u ∉ S₀` and `0 ≤ s < t`, then `t u ∈ S∞`;
- `exists_isOpen_basinZero`, `exists_isOpen_basinInfty`;
- `exists_isOpen_eq_inter_orthant`;
- W-A4: `basinZero_inter_basinInfty`, `logGenFun_mem_basinZero_iff`,
  `logGenFun_mem_basinInfty_iff`.

Note: compile with `lake build <module>`. A bare `lake env lean` ignores the lakefile options,
including `autoImplicit false`.

**Exact frozen types.** Read `Conjugate/Frozen/Theorem_2_7.lean` and
`Conjugate/Frozen/Theorem_1_4_FixedPoint.lean`. Each provider must have exactly the frozen type,
binder names and order:
```lean
namespace Conjugate.Internal
theorem theorem_2_7 {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hI : IsSubcritical μ) (hII : IsPositiveRegular μ ∧ IsNonsingular μ)
    (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j}) :
    ∃ x : Fin d → EReal, (∀ j, 0 < x j ∧ x j < ⊤) ∧ logGenFun μ x = x

theorem theorem_1_4_fixedPoint {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hI : IsSubcritical μ) (hII : IsPositiveRegular μ ∧ IsNonsingular μ)
    (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j}) :
    ∃ q : Fin d → ℝ≥0∞, (∀ j, 1 < q j ∧ q j < ∞) ∧ genFun μ q = q
```
The seals will be `by exact Conjugate.Internal.theorem_2_7 μ hI hII hIII` and
`by exact Conjugate.Internal.theorem_1_4_fixedPoint μ hI hII hIII`.

Handle `d = 0` too: `IsNonsingular` gives a type `k : Fin d`, so `d = 0` is vacuous.

**Ownership.**
- Phase 1 files:
  - `Conjugate/Internal/Theorem_2_7.lean`, the existing stub. Keep its header and docstring.
  - New files under `Conjugate/Internal/Section2/Assembly*.lean`, for the ray parameter, `F`
    and its continuity.
- Phase 2 file: `Conjugate/Internal/Theorem_1_4_FixedPoint.lean`, the existing stub. Write it
  **only after the orchestrator tells you `theorem_2_7` is sealed.** Until then, stop after
  phase 1 and report.

Edit nothing else.

**Allowed inputs.**
- Mathlib.
- `Conjugate/Frozen/Defs/*`.
- `Conjugate.Infrastructure.*`, including `Brouwer`.
- `Conjugate.Internal.Foundations.*`, `Conjugate.Internal.Analytic.*` and
  `Conjugate.Internal.Section2.*`.
- In phase 2 only, the sealed frozen module `Conjugate.Frozen.Theorem_2_7`.

Never import a DRAFT anchor or another anchor's provider.

**Checks** (run them and paste the output):
```bash
export PATH="$HOME/.elan/bin:$HOME/.local/bin:$PATH"
lake build Conjugate.Internal.Theorem_2_7
python3 -I tools/check_lean_modules.py --root . --max-lines 1500 --files Conjugate/Internal/Theorem_2_7.lean Conjugate/Internal/Section2/*.lean
python3 -I tools/leanprobe.py axioms Conjugate.Internal.Theorem_2_7 Conjugate.Internal.theorem_2_7
```
Only `propext`, `Classical.choice` and `Quot.sound` are acceptable.

Run a seal probe for each provider.
- Create `.lake/probes/a7/SealProbe*.lean`, with a copy of the frozen statement and body
  `by exact Conjugate.Internal.<name> μ hI hII hIII`.
- Compile it with `lake env lean` and report the result.
- Delete it.

**Stop condition.** You are done when both providers compile with the standard axioms and the
seal probes pass. Stop after phase 1 if you have not been told the seal happened. Stop early
and report if:
- a W-A6 / W-A4 lemma is insufficient as stated;
- Brouwer is not available.

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

Use the copyright header of the existing files. Put scratch files in `.lake/probes/a7/`.

**Handoff.** Report:
- the files created;
- the approach;
- the exact commands and their output;
- axioms;
- the seal-probe results;
- anything unproved or uncertain.
