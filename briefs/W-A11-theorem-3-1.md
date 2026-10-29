# Brief W-A11 — Lemma 3.3 and Theorem 3.1 (provider + seal) — Fable

**Goal.** Prove Lemma 3.3 and the provider of the frozen anchor `Conjugate.theorem_3_1`
(paper.tex:957-987, proof paper.tex:1149-1179; rulings E6 and R7). This is the countable-type
theorem: a fixed point `q ∈ (1,∞)^ℕ` of `f`, obtained as a subsequential limit of fixed points of
the truncations.

**Indexing.** Paper type `k` is Lean type `k - 1`. The paper's `f_1` is `genFun μ · 0`. Truncations
are `truncate μ d : Fin d → PMF (Fin d →₀ ℕ)`.

**Graph nodes served** (`DEPGRAPH.md`, read-only for you):
- `lem-fixed-liminf` with its steps (Lemma 3.3, paper.tex:1031-1097);
- `thm-fixed-pt-infty` with its steps `#reduce-to-g`, `#choose-lambda-d`, `#diagonal-limit`,
  `#as-convergence`, `#before-dct`, `#dominated-bound`, `#interchange`, `#nonzero-limit` and
  `#positivity`.

**Exact frozen type.** Read `Conjugate/Frozen/Theorem_3_1.lean`. The provider
`Conjugate.Internal.theorem_3_1`, in the existing stub `Conjugate/Internal/Theorem_3_1.lean`, must
have exactly that type, binder names and order:
`μ hext hI φ ψ hφ hψ hφ_lim hψφ_lim hII hIII hIV`. The seal will be
`by exact Conjugate.Internal.theorem_3_1 μ hext hI φ ψ hφ hψ hφ_lim hψφ_lim hII hIII hIV`.
`hext` may turn out unused (ERRATA R7 notes that no step of the proof needs it). Keep the name.

**Ownership.**
- Edit the stub `Conjugate/Internal/Theorem_3_1.lean` (keep its header and docstring).
- Create new files under `Conjugate/Internal/Section3/` whose names start with `Liminf` or
  `Theorem31`.
- Edit nothing else. The W-A10 files `Section3/{Truncation,LimsupBound,SingleTypeRestriction,…}.lean`
  are read-only for you.

**Allowed inputs.**
- Mathlib.
- `Conjugate/Frozen/Defs/*`.
- `Conjugate.Infrastructure.*`.
- `Conjugate.Internal.{Foundations,Analytic,Section2,SingleType,Section3}.*`. These are finished;
  read them for exact statements. In particular:
  - W-A10: `genFun_truncate`, `logGenFun_truncate`, `genFun_truncate_iterate_le`,
    `exists_bound_fixedPoint_truncate`, `fixedPoint_truncate_le_growth`;
  - W-A5: `tendsto_zero_of_lt` (Prop 2.10 (i), with `m = 1`);
  - W-A4: `exists_pos_of_le`;
  - W-A2: `pathLaw_extinctionEvent_eq_one`;
  - W-A3: `genFun_mono`, `logGenFun_mono`, `logGenFun_iterate`, `genFun_iterate_eq`.
- The **sealed** frozen module `Conjugate.Frozen.Theorem_2_7` (export `Conjugate.theorem_2_7`),
  applied to each truncation.

Never import a DRAFT anchor (check `frozen-anchor-manifest.json`) or another anchor's provider.

**Public API to prove** (namespace `Conjugate`; elaborated against the current build). Helpers
with other names are welcome.
```lean
open MeasureTheory ProbabilityTheory Filter Topology
open scoped ENNReal

/-- Truncated iterates are dominated by full iterates on `[1,∞]^ℕ`. -/
theorem genFun_truncate_iterate_le_genFun (μ : ℕ → PMF (ℕ →₀ ℕ)) (d n : ℕ)
    (q : ℕ → ℝ≥0∞) (hq : ∀ j, 1 ≤ q j) (k : Fin d) :
    (genFun (truncate μ d))^[n] (fun j => q j) k ≤ (genFun μ)^[n] q k

/-- Lemma 3.3, in a form uniform in the fixed point. -/
theorem exists_liminf_fixedPoint_truncate (μ : ℕ → PMF (ℕ →₀ ℕ))
    (hI : ∀ d, 1 ≤ d →
      IsSubcritical (truncate μ d) ∧
        (IsPositiveRegular (truncate μ d) ∧ IsNonsingular (truncate μ d)) ∧
        ∀ k, ContinuousOn (fun q => genFun (truncate μ d) q k) {q | ∀ j, 0 < q j})
    (φ ψ : ℕ → ℝ) (hφ : ∀ k, 1 ≤ φ k) (hψ : ∀ k, 1 ≤ ψ k)
    (hψφ_lim : Tendsto (fun k => Real.log (ψ k) / φ k) atTop (𝓝 0))
    (hII : ∀ k (q : ℕ → ℝ≥0∞), (∀ j, 1 ≤ q j ∧ q j < ∞) →
      genFun μ q k ≤ ENNReal.ofReal (ψ k) * genFun μ q 0 ^ φ k)
    (hIII : ∃ s : ℝ, 1 < s ∧ ∀ k,
      ∫⁻ c, ENNReal.ofReal (s ^ (c.sum fun j n => φ j * n)) ∂(μ k).toMeasure ≤
        ENNReal.ofReal (s ^ φ k)) :
    ∃ K : ℕ, 1 ≤ K ∧ ∃ c : ℝ, 0 < c ∧ ∀ d (x : Fin d → EReal), (∀ j, 0 ≤ x j ∧ x j < ⊤) →
      x ≠ 0 → logGenFun (truncate μ d) x = x →
        ∃ k, ∃ hk : k < d, k < K ∧ (c : EReal) ≤ x ⟨k, hk⟩
```

**Mathematics.**

*Lemma 3.3* (paper.tex:1037-1097). Let `δ = log s`.
1. **Step 1.**
   - `g_k(δφ) ≤ δφ(k)` for all `k`: this is `hIII` rewritten, since
     `s^{∑ φ_j c_j} = ∏ (e^{δφ_j})^{c_j}`.
   - Hence `g^d_k(δφ|_d) = g_k(δφ|_d, 0, …) ≤ δφ(k)`, by `logGenFun_truncate` and monotonicity.
   - Iterating gives `0 ≤ g^{d,(n)}(δφ|_d) ≤ δφ|_d`, so the orbit is bounded.
   - If every `x_k < δφ(k)`, then Prop 2.10 (i) (`tendsto_zero_of_lt`, `m = 1`, applied to
     `truncate μ d`) gives `g^{d,(n)}(x) → 0`. Its hypotheses: certain extinction from
     subcriticality, and positive regularity from `hI`. But `x` is a nonzero fixed point, a
     contradiction.
   - So some `k(d) < d` has `x_{k(d)} ≥ δφ(k(d))`.
2. **Step 2.**
   - `hII` with `q = exp(x, 0, 0, …)` gives `x_k ≤ log ψ(k) + φ(k) x_0`.
   - Choose `K ≥ 1` with `log ψ(k) ≤ (δ/2)φ(k)` for `k ≥ K` (`hψφ_lim`).
   - Then either `k(d) < K` with `x_{k(d)} ≥ δ`, or `x_0 ≥ δ/2`.
   - Take `c = δ/2`, using `φ ≥ 1`.

*Theorem 3.1* (paper.tex:1149-1179).
1. **Choose `λ^d`.** For each `d ≥ 1`, apply the sealed `Conjugate.theorem_2_7` to
   `truncate μ d`. This gives `λ^d ∈ (0,∞)^d` with `g^d(λ^d) = λ^d`. Choosing from `∃` is fine
   here: it is a proof-internal choice, and the theorem's statement does not depend on it.
   - Extend to `Λ^d : ℕ → ℝ`, by `λ^d_k` for `k < d` and `0` otherwise.
2. **Bounds.** `0 ≤ Λ^d_k ≤ B_k := φ(k) log t + log ψ(k)` for `k < d`
   (`fixedPoint_truncate_le_growth`, with `t` from `hIV`).
3. **Subsequence.**
   - `∏_k [0, max B_k 0]` is compact in `ℕ → ℝ` (Tychonoff, `isCompact_univ_pi`), and the space
     is metrizable.
   - So a subsequence `Λ^{D(i)} → Λ` converges pointwise (`IsCompact.tendsto_subseq`).
   - Mathlib's countable-product metrizability: `PiCountable` / `metrizableSpace_pi`.
4. **Dominated convergence**, coordinate by coordinate. For `D(i) > k`:
   - `e^{Λ^{D(i)}_k} = 𝔼_k[∏_j (e^{Λ^{D(i)}_j})^{c_j}]`, by `genFun_truncate`.
   - The integrand converges for every `c`, because `c : ℕ →₀ ℕ` has finite support: (3.1) is
     automatic.
   - It is dominated by `∏_j (ψ(j) t^{φ(j)})^{c_j}`, whose `μ_k`-integral is finite by `hIV`
     (`tendsto_lintegral_of_dominated_convergence`).
   - Hence `e^{Λ_k} = f_k(e^Λ)`.
5. **Nonzero limit.** Lemma 3.3 gives, for each `D(i)`, some `k_i < K` with
   `Λ^{D(i)}_{k_i} ≥ c`. One `k < K` occurs infinitely often, so `Λ_k ≥ c > 0`.
6. **Positivity of all coordinates** (paper.tex:1178). Let `q = e^Λ ≥ 1`, with `q_{j*} > 1`.
   - For any `k`, take `d > max(k, j*)` and `N` from positive regularity of `truncate μ d`
     (`exists_pos_of_le`).
   - Then `q_k = f^{(N)}_k(q) ≥ f^{d,(N)}_k(q|_d)` (`genFun_truncate_iterate_le_genFun`).
   - And `f^{d,(N)}_k(q|_d) ≥ 1 + (q_{j*} − 1)·ℙ_k[X^d_{j*}(N) ≥ 1] > 1`. This is the same
     argument as the second part of Lemma 2.3, W-A4 `eq_one_or_one_lt_of_genFun_eq_self`; reuse
     its pieces.
   - So `q ∈ (1,∞)^ℕ`, `f(q) = q`, and `q` is finite because `Λ` is real.

**Checks** (run them and paste the output):
```bash
export PATH="$HOME/.elan/bin:$HOME/.local/bin:$PATH"
lake build Conjugate.Internal.Theorem_3_1
python3 -I tools/check_lean_modules.py --root . --max-lines 1500 --files Conjugate/Internal/Theorem_3_1.lean Conjugate/Internal/Section3/*.lean
python3 -I tools/leanprobe.py axioms Conjugate.Internal.Theorem_3_1 Conjugate.Internal.theorem_3_1
```
Also probe the two API theorems. Only `propext`, `Classical.choice` and `Quot.sound` are
acceptable.

**Seal probe.**
- Put a copy of the frozen file, with the body replaced by the seal line above, in
  `.lake/probes/a11/`.
- Compile it with the lakefile options (a module target, or
  `-DautoImplicit=false -DrelaxedAutoImplicit=false`).
- Report the result, then delete it.

**Concurrency.** Other agents work at the same time on other files.
- Build only your own modules, with explicit targets.
- Never run `lake build` with no target.

**Stop condition.** You are done when the provider and both API theorems compile without `sorry`
and with the standard axioms only, and the seal probe passes. Stop and report if the frozen
statement appears false or mis-typed (do not change it), or with a precise gap if you are stuck.

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
`.lake/probes/a11/`, never in `Conjugate/`.)

Use the copyright header of the existing files.

**Handoff.** Report:
- the files created and their line counts;
- the approach;
- the exact commands and their output;
- axioms;
- the seal-probe result;
- reusable helpers;
- anything unproved or uncertain.
