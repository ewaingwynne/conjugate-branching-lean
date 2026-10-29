# Brief W-A10 — §3 truncation layer: display (3.2), Lemma 3.2, Lemma 3.4

**Goal.** Prove the countable-type facts that Theorem 3.1 needs:
- the truncated generating function (3.2) and its log form (with ERRATA E4);
- monotonicity of iterates under truncation;
- Lemma 3.2: for each `k`, the fixed points `λ^d` of the truncations have bounded `k`-th
  coordinates;
- Lemma 3.4 (with ERRATA E9): the single-type restriction `X̃^k`, its unique fixed point, the
  bound `λ^d_k ≤ η_k`, and the growth bound (3.17).

**Indexing.** Lean indexes types from `0`: paper type `k` is Lean type `k - 1`. The truncation is
`truncate μ d : Fin d → PMF (Fin d →₀ ℕ)` (SEALED definition, `Conjugate/Frozen/Defs/Truncate.lean`),
and the paper's `f_1` is `genFun μ · 0`.

**Graph nodes served** (`DEPGRAPH.md`, read-only for you):
- `eqn-gf-truncated` (paper.tex:945-951);
- `eqn-log-gf-infty` and `eqn-log-gf-truncated` (E4);
- `lem-fixed-limsup` with `#choose-N`, `#truncation-monotone` and `#moment-bound` (Lemma 3.2,
  paper.tex:1004-1025);
- `lem-1d-soln` with its steps (Lemma 3.4, paper.tex:1101-1145; E9 at paper.tex:1127 reads
  "for each `d ≥ k`").

**Ownership.** Create only files under `Conjugate/Internal/Section3/`, for example
`Truncation.lean`, `LimsupBound.lean` and `SingleTypeRestriction.lean`. Edit nothing else.

**Allowed inputs.**
- Mathlib.
- `Conjugate/Frozen/Defs/*`.
- `Conjugate.Infrastructure.*`.
- `Conjugate.Internal.{Foundations,Analytic,Section2,SingleType}.*`. Useful pieces:
  - W-A4 `exists_pos_two_individuals` (Lemma 2.4);
  - W-A2 `tendsto_meanMatrix_pow`;
  - W-A3 `genFun_mono`, `genFun_iterate_eq`, `logGenFun_iterate`;
  - `SingleType.diffQuot_lt_of_lt`, `pgf_add_one` and friends (strict convexity in the
    single-type case).
- The **sealed** frozen modules `Conjugate.Frozen.Proposition_1_6_FixedPoint` (export
  `Conjugate.proposition_1_6_fixedPoint`) and `Conjugate.Frozen.Theorem_2_7`.

Never import a DRAFT anchor (check `frozen-anchor-manifest.json`) or another anchor's provider.

**Exact public API** (namespace `Conjugate`; every statement was elaborated against the current
build). The definition `restrictType` must be exactly this:
```lean
open MeasureTheory ProbabilityTheory Filter Topology
open scoped ENNReal

/-- (3.2). -/
theorem genFun_truncate (μ : ℕ → PMF (ℕ →₀ ℕ)) (d : ℕ) (q : Fin d → ℝ≥0∞) (k : Fin d) :
    genFun (truncate μ d) q k = genFun μ (fun j => if h : j < d then q ⟨j, h⟩ else 1) k

/-- (3.2) in log coordinates, ERRATA E4 (tail coordinates `0`). -/
theorem logGenFun_truncate (μ : ℕ → PMF (ℕ →₀ ℕ)) (d : ℕ) (x : Fin d → EReal) (k : Fin d) :
    logGenFun (truncate μ d) x k =
      logGenFun μ (fun j => if h : j < d then x ⟨j, h⟩ else 0) k

/-- Truncation monotonicity of iterates on `[1,∞]^d` (`lem-fixed-limsup#truncation-monotone`). -/
theorem genFun_truncate_iterate_le (μ : ℕ → PMF (ℕ →₀ ℕ)) {d d' : ℕ} (hdd : d' ≤ d) (n : ℕ)
    (q : Fin d → ℝ≥0∞) (hq : ∀ j, 1 ≤ q j) (k : Fin d') :
    (genFun (truncate μ d'))^[n] (fun j => q (Fin.castLE hdd j)) k ≤
      (genFun (truncate μ d))^[n] q (Fin.castLE hdd k)

/-- Lemma 3.2. -/
theorem exists_bound_fixedPoint_truncate (μ : ℕ → PMF (ℕ →₀ ℕ))
    (hII : ∀ d, 1 ≤ d → IsPositiveRegular (truncate μ d) ∧ IsNonsingular (truncate μ d))
    (k : ℕ) :
    ∃ B : ℝ, ∀ d (hd : k < d) (x : Fin d → EReal), (∀ j, 0 ≤ x j ∧ x j < ⊤) →
      logGenFun (truncate μ d) x = x → x ⟨k, hd⟩ ≤ B

/-- The single-type restriction `X̃^k` (paper.tex:1120): only individuals all of whose
ancestors have type `k` are kept. -/
noncomputable def restrictType (μ : ℕ → PMF (ℕ →₀ ℕ)) (k : ℕ) : Fin 1 → PMF (Fin 1 →₀ ℕ) :=
  fun _ => (μ k).map fun c => Finsupp.single 0 (c k)

theorem genFun_restrictType (μ : ℕ → PMF (ℕ →₀ ℕ)) (k : ℕ) (x : ℝ≥0∞) :
    genFun (restrictType μ k) (fun _ => x) 0 = genFun μ (Function.update 1 k x) k

/-- Lemma 3.4 (a), in `q = e^η` coordinates. -/
theorem existsUnique_fixedPoint_restrictType (μ : ℕ → PMF (ℕ →₀ ℕ))
    (hI : ∀ d, 1 ≤ d →
      IsSubcritical (truncate μ d) ∧
        (IsPositiveRegular (truncate μ d) ∧ IsNonsingular (truncate μ d)) ∧
        ∀ k, ContinuousOn (fun q => genFun (truncate μ d) q k) {q | ∀ j, 0 < q j})
    {k : ℕ} (hk : 0 < (μ k).toMeasure {c | 2 ≤ c k}) :
    ∃! q : ℝ≥0∞, 1 < q ∧ q < ∞ ∧ genFun μ (Function.update 1 k q) k = q

/-- Lemma 3.4 (b) (ERRATA E9: for every `d > k` in Lean indexing). -/
theorem exp_fixedPoint_truncate_le (μ : ℕ → PMF (ℕ →₀ ℕ))
    {k : ℕ} {q : ℝ≥0∞} (hq1 : 1 < q) (hqt : q < ∞)
    (hqfix : genFun μ (Function.update 1 k q) k = q)
    (hk : 0 < (μ k).toMeasure {c | 2 ≤ c k})
    {d : ℕ} (hd : k < d) (x : Fin d → EReal) (hx : ∀ j, 0 ≤ x j ∧ x j < ⊤)
    (hfix : logGenFun (truncate μ d) x = x) :
    EReal.exp (x ⟨k, hd⟩) ≤ q

/-- Lemma 3.4 (c), the growth bound (3.17). -/
theorem fixedPoint_truncate_le_growth (μ : ℕ → PMF (ℕ →₀ ℕ))
    (hI : ∀ d, 1 ≤ d →
      IsSubcritical (truncate μ d) ∧
        (IsPositiveRegular (truncate μ d) ∧ IsNonsingular (truncate μ d)) ∧
        ∀ k, ContinuousOn (fun q => genFun (truncate μ d) q k) {q | ∀ j, 0 < q j})
    (φ ψ : ℕ → ℝ) (hφ : ∀ k, 1 ≤ φ k) (hψ : ∀ k, 1 ≤ ψ k)
    (hII : ∀ k (q : ℕ → ℝ≥0∞), (∀ j, 1 ≤ q j ∧ q j < ∞) →
      genFun μ q k ≤ ENNReal.ofReal (ψ k) * genFun μ q 0 ^ φ k)
    {t : ℝ} (ht : 1 < t)
    (htf : ENNReal.ofReal t < genFun μ (fun j => if j = 0 then ENNReal.ofReal t else 1) 0)
    {d k : ℕ} (hd : k < d) (x : Fin d → EReal) (hx : ∀ j, 0 ≤ x j ∧ x j < ⊤)
    (hfix : logGenFun (truncate μ d) x = x) :
    x ⟨k, hd⟩ ≤ ((φ k * Real.log t + Real.log (ψ k) : ℝ) : EReal)
```
`hII` and `htf` are exactly hypotheses II and IV (first part) of the frozen
`Conjugate.theorem_3_1`; read `Conjugate/Frozen/Theorem_3_1.lean`.

**Mathematics.**
- **(3.2).** `truncate μ d k` is the image of `μ k.val` under restriction of the offspring vector
  to `Fin d`. The restricted monomial `∏_{j<d} q_j^{c_j}` equals the full monomial with
  `q_j = 1` for `j ≥ d`. (3.2) in log coordinates follows from `exp 0 = 1`.
- **Truncation monotonicity.** For `q ≥ 1` (coordinatewise, extended by 1),
  `f^{d'}_k(q|_{d'}) = f_k(q|_{d'}, 1, …) ≤ f_k(q|_d, 1, …) = f^d_k(q)`, by `genFun_mono`.
  Iterate, using `f ≥ 1` on `[1,∞]`.
- **Lemma 3.2** (paper.tex:1007-1025).
  - Apply Lemma 2.4 to `truncate μ (k+1)` to get `N` with
    `p_k := ℙ_k[X^{k+1}(N) ≥ 2 e_k] > 0`.
  - For a fixed point `x` of `g^d`, `d > k`: `e^{x_k} = f^{d,(N)}_k(e^x)`. This is at least
    `f^{d,(N)}_k` at `e^{x_k}` in coordinate `k` and `1` elsewhere (monotonicity, `e^x ≥ 1`),
    which by truncation monotonicity is at least
    `f^{k+1,(N)}_k(…) = 𝔼_k[e^{x_k X^{k+1}_k(N)}] ≥ e^{2x_k} p_k`.
  - Hence `x_k ≤ log(1/p_k)`. `B = log(1/p_k)` (or `max 0 …`) does not depend on `d` or `x`.
- **`restrictType`.** Its generating function is `x ↦ f_k(1, …, x, …, 1)`.
- **Lemma 3.4 (a).** Apply the sealed `Conjugate.proposition_1_6_fixedPoint` to `restrictType μ k`.
  - Mean `< 1`: `E_k[c_k] = M^{(d)}_{kk}` for `d > k`. Subcriticality of `truncate μ (k+1)` gives
    `(M_{kk})^n ≤ (M^n)_{kk} → 0` (`tendsto_meanMatrix_pow`), so `M_{kk} < 1`.
  - Hypothesis II is `hk`.
  - Continuity on `(0,∞]`: Hyp. III of `truncate μ (k+1)` composed with `x ↦` the vector with `x`
    in coordinate `k` and `1` elsewhere.
- **Lemma 3.4 (b)** (paper.tex:1127-1134, E9).
  - `e^{x_k} = f^d_k(e^x) ≥ f̃_k(e^{x_k})`, by (3.2) and monotonicity.
  - Strict convexity of `f̃_k`, with `f̃_k(1) = 1` and `f̃_k(q) = q`, gives `f̃_k(y) > y` for
    `y > q`. Use `SingleType.diffQuot_lt_of_lt`: write `y = 1 + ε`; at the fixed point `H = 1`,
    beyond it `H > 1`.
  - Hence `e^{x_k} ≤ q`.
- **Lemma 3.4 (c)** (paper.tex:1136-1144).
  - `f̃_0(t) > t` (`htf`) and convexity give `q₀ < t`, where `q₀` is from (a) with `k = 0`. The
    hypothesis `hk` for `k = 0` comes from non-singularity of `truncate μ 1`.
  - Then `x_k = g_k(x, 0, 0, …) ≤ log ψ(k) + φ(k) g_0(x, 0, …) = log ψ(k) + φ(k) x_0`, by `hII`
    with `q = exp(x, 0, …)`, which is `≥ 1` and finite.
  - Finally `x_0 ≤ log q₀ < log t`, by (b) with `k = 0`.

**Checks** (run them and paste the output):
```bash
export PATH="$HOME/.elan/bin:$HOME/.local/bin:$PATH"
lake build <each of your modules>
python3 -I tools/check_lean_modules.py --root . --max-lines 1500 --files Conjugate/Internal/Section3/*.lean
python3 -I tools/leanprobe.py axioms <Module> <Decl>   # every public theorem listed above
```
Only `propext`, `Classical.choice` and `Quot.sound` are acceptable. A bare `lake env lean` ignores
the lakefile's `autoImplicit false`, so build with module targets.

**Concurrency.** Other agents work at the same time on other files.
- Build only your own modules, with explicit targets.
- Never run `lake build` with no target.

**Stop condition.** You are done when everything listed compiles without `sorry` and with the
standard axioms only. Stop early and report if:
- a statement appears false or mis-typed (do not change it);
- a sealed anchor you need is not sealed.

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

Use the copyright header of the existing files. Put scratch files in `.lake/probes/a10/`.

**Handoff.** Report:
- the files created;
- the approach;
- the exact commands and their output;
- axioms;
- reusable helpers;
- anything unproved or uncertain.
