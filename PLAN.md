# Formalization plan — arXiv:2411.06301v2

*Gwynne & Liu, "Inverting the operation of conditioning a branching process on extinction"*

**Status: plan only. Nothing is frozen or proved yet.**

This plan follows the `lean-orchestrator` and `build-proof-dependency-graph` skills from
LeanAutoformalizationSkills (CC-BY 4.0; read from leonardob's vendored copy). Their
required order is:

> **author-frozen anchors → anchored source dependency graph → Lean proof orchestration**

Toolchain: Lean `v4.36.0-rc2`, Mathlib `9d581dff` (2026-10-27, modular). The project is
at `~/formalization`, and the pins are frozen for the whole campaign.

Decisions already made by you:

- Brouwer is proved in-project.
- Prop 2.1(a) and 2.1(c) (cited from Athreya–Ney) are not formalized.
- At most **two agents at a time in total**: Sonnet for writers and auditors, Fable only for
  the hardest proofs.
- Leonardob's skill files are the workflow reference.

---

## 1. Roles

| Role | Who | Does |
|------|-----|------|
| Author | you | Approves every exact frozen Lean declaration, rules on errata and splits, receives phase reports |
| Orchestrator | me (Opus) | Writes all definitions and anchor statements; keeps source interpretation and shared APIs; is the single writer of the graph, manifest and ledgers; reviews every diff; runs every check; commits locally |
| Writers | Sonnet (Fable for Brouwer, and for path space if Sonnet stalls) | One bounded provider target per brief, on files they own |
| Auditors | Sonnet, always fresh context | Statement audits, graph slice reviews, global graph review, seal audits — refute-first |

The skill's two-key rule applies: a result is `PROVED` only when a writer supplies evidence
**and** a fresh auditor fails to refute it, after my own checks pass.

---

## 2. Scope

Legend: **P** = proved in the paper, **C** = cited, **U** = asserted without proof.

| Item | Kind | Plan |
|------|------|------|
| (1.1)–(1.3), Def 1.1, Def 1.3 | definitions | anchor |
| Thm 1.4 (fixed-point form and conjugate form) | P | anchor (split needs your ruling, §5) |
| Remark after 1.4: Hyp. III automatic when `f_k < ∞` on `(0,∞)^d` | P (sketch) | anchor |
| Remark after 1.4: `P[X=m] = a m⁻³` example | P (sketch) | anchor |
| Ex 1.5: hypotheses of Thm 1.4 hold, three fixed points in `(1,∞)²` | P ("one can check") | anchor "≥ 3 distinct"; "exactly 3" as stretch |
| Ex 1.5: robustness; `d = 3` with seven fixed points | U | excluded |
| Prop 1.6 (existence **and uniqueness**) | P | anchor |
| Prop 2.1(b): conditional law formula (2.1) | C | anchor (needed for the converse direction of Thm 1.4) |
| Prop 2.1(a), 2.1(c) | C | external node, not formalized |
| Prop 2.2 | P | anchor |
| Lemmas 2.3–2.5, Defs 2.6/2.8, Thm 2.7, Lemma 2.9 – Lemma 2.19 | P | anchor (see §5, question A) |
| §3.1 setup, truncation `Xᵈ`, (3.2) | definitions | anchor |
| §3.1 global/partial/local extinction facts (Moy64, BBHZ22, …) | C | excluded (not used in any proof) |
| Thm 3.1, Lemmas 3.2–3.4, Ex 3.5 | P | anchor |
| §4 (LQG and biology) | discussion | excluded |

---

## 3. Lean encoding of the definitions

These are the meaning-carrying definitions. I write them myself, a Sonnet auditor checks
them against the source, and you approve them before anything else is frozen.

- **Offspring laws.**
  - Types `Fin d`; population vectors `Fin d → ℕ`.
  - A process is given by offspring laws `μ : Fin d → PMF (Fin d → ℕ)`.
- **Generating function (1.1).** `f q k = ∑' c, μ k c * ∏ j, q j ^ c j` in `ℝ≥0∞`.
  - `ℝ≥0∞` already has `∞⁰ = 1` and `∞ˣ = ∞`.
  - The domain `(0,∞]^d` is imposed by hypothesis.
  - The order topology on `ℝ≥0∞` restricts to the paper's half-open-interval topology.
- **Iterates (1.2).** `f⁽ⁿ⁾ = f^[n]` (composition). The identity
  `f⁽ⁿ⁾_k(q) = E_k[∏ q_j^{X_j(n)}]` is a separate characterization theorem, so the source
  meaning is proved rather than assumed.
- **Mean matrix (1.3) and subcriticality.**
  - `M k j = ∑' c, μ k c * c j`, with finiteness as a hypothesis, as in the paper.
  - Subcritical means `spectralRadius ℂ M < 1`. For non-negative `M` this is the
    "largest eigenvalue".
- **Generation laws and path law.**
  - One-step kernel: the sum of `x_j` independent `μ_j` samples.
  - Path law on `ℕ → (Fin d → ℕ)` via Mathlib's Ionescu-Tulcea `Kernel.traj`.
  - Extinction `E = ⋃ₙ {X(n) = 0}`; conditioning via `ProbabilityTheory.cond`.
- **Def 1.3 and Def 1.1.** Positive regular, non-singular, and "conjugate" are stated
  literally on the path law. "Not the same law" is inequality of path measures for some
  starting type.
- **Def 2.6 (log coordinates).** `g λ k = ENNReal.log (f (EReal.exp ∘ λ) k)`, with
  `λ : Fin d → EReal`.
- **Def 2.8.** Mathlib's product order on `Fin d → EReal` is exactly the paper's `≤` and `<`
  (`<` means `≤` with one coordinate strict). It is reused rather than redefined.
- **§3.** Types `ℕ`, populations `ℕ →₀ ℕ` (this builds in (3.1)). The truncation `Xᵈ` lands
  in the `Fin d` setting.
- **Module system.** Mathlib is modular, so every project file is a `module`. Frozen files
  are `public section`, and source-facing definitions are `@[expose]`.

---

## 4. Phases

### Phase 0 — setup (orchestrator only, no agents)

1. **Pin the source.**
   - Download the arXiv LaTeX for v2 into `source/` and record its SHA-256.
   - The graph skill needs line-addressable source; the PDF is not enough.
2. **Install the skill bundle.** Copy it, not symlink it, into `~/.claude/skills/` so
   subagents can read it, with the CC-BY attribution.
   - Copy `check_frozen_anchors.py` and `proof_depgraph.py` into `tools/`.
3. **Set up the project skeleton.**
   - Rename the library `Formalization` → `Conjugate`. Layout:
     - `Conjugate/Frozen/` — one declaration per file;
     - `Conjugate/Internal/` — providers;
     - `Conjugate/Infrastructure/` — Brouwer and other off-source infrastructure.
   - Add a project `CLAUDE.md` with the hard rules every brief repeats verbatim:
     - no custom axioms;
     - no unregistered `sorry`;
     - no heartbeat overrides;
     - module headers;
     - file-size limit;
     - the build commands with the `PATH` fix;
     - no edits to frozen files.
4. **Add tooling.** An ABI-hash helper (a Lean metaprogram that prints the elaborated
   type, plus the body for definitions, piped to SHA-256). Also add an untracked
   `#print axioms` probe path.
5. **Commit a local git baseline** (no pushing, ever).

### Phase 1 — anchors (orchestrator writes → Sonnet audits → you approve → freeze)

Three batches. Each batch has these steps:

1. I write the exact final declarations, with real binders and imports, and elaborate them
   in an untracked scratch file.
2. A fresh Sonnet auditor runs `lean-statement-audit`, including the five-bin binder test
   (any binder not justified by the source fails), against the LaTeX.
3. You see each complete declaration and approve it, rule on it, or reject it.
4. On approval:
   - theorems are frozen as `by sorry` with state `DRAFT_SORRY`;
   - definitions are frozen as sealed bodies;
   - each gets one manifest entry, the checker must pass, and I commit.

Batches:

- **1A — definitions:**
  - (1.1)–(1.3); generation laws plus the (1.2) characterization;
  - path law, extinction and conditioning;
  - Def 1.3, Def 1.1, Def 2.6, (2.9) `S₀` and `S∞`;
  - §3.1 countable-type definitions and truncation.
- **1B — roots:**
  - Thm 1.4 (as split), Prop 1.6, Prop 2.1(b), Prop 2.2, Thm 2.7, Thm 3.1;
  - Ex 1.5, Ex 3.5, and both remarks.
- **1C — lemmas:** 2.3–2.5, 2.9–2.19, 3.2–3.4, if you choose to anchor them (question A).

### Phase 2 — source dependency graph (`build-proof-dependency-graph`)

1. **Freeze the extraction spec:**
   - roots;
   - the corpus hash;
   - conventions: `ℝ≥0∞` and `EReal` carriers, the product order, `∞⁰ = 1`;
   - external-input policy;
   - the step threshold.
2. **Build the coverage inventory** mechanically from the LaTeX.
3. **Extract in slices.** Four slices: (i) §1 and §2.1, (ii) §2.2, (iii) §2.3, (iv) §3.
   - One Sonnet extractor per slice returns packets only; two run at a time.
   - I merge as the single writer, with an `EDGE` record and source evidence for every
     dependency.
4. **Review.**
   - A different Sonnet reviewer checks each slice.
   - Then one fresh Sonnet global reviewer traces the whole root closure.
5. **External / gap nodes,** each marked `EXTERNAL`:
   - Brouwer; Perron–Frobenius; Prop 2.1(a),(c) [AN72, JLs08];
   - Fatou, Hölder, Vitali, dominated convergence, Taylor expansion;
   - unproved bridges get a `SOURCE_GAP` node.
6. **Gate.** The linter passes with `--require-reviewed --require-complete-coverage
   --require-all-reachable --check`.

Estimate: about 9 Sonnet runs, two at a time.

### Phase 3 — proofs (`lean-orchestrator`)

Work is assigned from the dependency-ready frontier only. Every brief uses the skill's
worker-brief template: one target, owned files, allowed inputs, checks, stop condition,
hard rules and handoff format. Two lanes, two agents in total:

| Lane | First | Then |
|------|-------|------|
| A (Sonnet) | foundations: generation-law characterization, means / Gelfand / extinction a.s., monotonicity and continuity of `f`, `g` | §2 chain 2.3 → 2.19, Prop 1.6, path-space layer and Props 2.1(b)/2.2, §3, examples |
| B | **Fable on Brouwer** (standard simplex; Sperner/Kuhn route) | after Brouwer lands, Lane B becomes Sonnet audits and writers |

While Fable holds Lane B, seal audits for Lane A's results queue behind it or interleave
in Lane A. That is the cost of the two-agent cap: the §2 chain runs at single-lane speed
during the Brouwer work.

Per result:

1. The provider lemma is written in `Conjugate/Internal/`.
2. It is sealed: the frozen body becomes `by exact Conjugate.Internal.…`.
3. I run the checker, compile the export, and run the axioms probe. Only `propext`,
   `Classical.choice` and `Quot.sound` are allowed.
4. A fresh Sonnet seal audit follows.
5. Then the result is marked `PROVED` and committed.

Draft providers stay quarantined until sealed.

### Phase 4 — closure

- All anchors are `PROVED`.
- A fresh full-closure audit passes.
- `ERRATA.md` lists every ruling.
- A final status report is produced.

Every status report carries the skill's mandatory fields:

```text
DRAFT_ANCHORS: <count and paths>
UNREGISTERED_SORRIES: <count and paths>
DRAFT_IMPORT_VIOLATIONS: <count and paths>
SEALED_THIS_TURN: <count and exports>
```

---

## 5. Decisions needed from you (at or before Phase 1)

**A. Anchor surface.**
- The skill recommends freezing only roots, gates and definitions (~25 declarations).
  Lemmas would then be proved as graph nodes without frozen statements.
- Since the goal is "all results", **I recommend anchoring every numbered result
  (~45 declarations)**. That way each lemma's statement is also author-approved and audited.
- The cost is your review time: three batches.

**B. Splitting Theorem 1.4.** It asserts both "a conjugate exists" and "equivalently,
`∃ q ∈ (1,∞)^d, f q = q`". I propose three anchors:
- (i) the fixed-point form;
- (ii) the conjugate form;
- (iii) the equivalence stated just before Thm 1.4: fixed point in `(1,∞)^d` ⟺ conjugate
  exists, under positive regularity and non-singularity.

**C. Errata rulings** (shown with the exact Lean at Phase 1):

- **E1 — Hyp. III:** "for each `k ∈ ℕ`" → `k ∈ {1,…,d}`.
- **E2 — (1.2):** `∏_{j=1}^{k}` → `∏_{j=1}^{d}`.
- **E3 — Lemma 2.16, substantive:**
  - The statement says `g(λ) > λ`, but this can fail.
  - Counterexample (`d = 2`): type 1 has only type-2 children, `λ = (L, 0)`. Then
    `g₁(λ) = 0 < L`, while the hypotheses can all hold.
  - The proof actually gives `g⁽ᴺ⁾(λ) > λ`, which is all that later lemmas use.
  - The proof's display uses `min_j λ_j`, which only covers `[C,∞)^d`. With `max_j`
    it covers `[0,∞)^d ∖ [0,C]^d` and is strict.
  - Proposed ruling: the anchor states `g⁽ᴺ⁾(λ) > λ` (with `N` from Lemma 2.4) and
    `g⁽ⁿ⁾(λ) → ∞`.
- **E4 — (3.13):** `g_k(λ₁ᵈ,…,λ_dᵈ, 1, 1, …)` → `(…, 0, 0, …)` (log coordinates).
- **Minor:**
  - §2.3 cites "positive regular (Definition 2.8)"; it should be Definition 1.3.
  - "`(1,∞)^{ℕ₀}`" in §3.2 should be `ℕ`.

---

## 6. Proof-route notes for the Lean side

These change how proofs are found, not what the statements say. Statements always match
the frozen anchors.

- **Thm 2.7.** Apply Brouwer to `π ∘ g ∘ φ` on the simplex `{λ ≥ 0, ∑λ = 1}`. This uses
  only Lemmas 2.14–2.18 and avoids "the annulus is homeomorphic to a ball".
  Lemma 2.19 is still proved as stated.
- **Lemma 2.5** without Perron–Frobenius:
  - `v = ∑ Mⁿ𝟙` (converges by Gelfand) gives `Mv = v − 𝟙 < v`;
  - the derivative of `ε ↦ f(𝟙 + εv)` at 0 is `Mv`, by monotone convergence.
- **Lemma 2.11** without Vitali: `Z_n ≥ 1`, so `E Z_n = P(Z_n = 1) + E[Z_n; Z_n > 1] → 1`
  directly from the Hölder bound.
- **Prop 2.2 / Thm 1.4 equivalence** as a Doob h-transform on cylinder sets.
  - Since `f̂⁽ⁿ⁾(s) = f⁽ⁿ⁾(A s)/A`, we get `P̂_k(E) = 1/A_k` without Prop 2.1(a).
  - The converse uses formula (2.1) and Lemma 2.3.

---

## 7. Risks

- **Brouwer** is the long pole and blocks Thm 2.7, and everything downstream of it.
  - Under the two-agent cap it also halves throughput while it runs.
  - If Fable stalls, I stop and ask you. Options would be a different proof route, or
    temporarily recording Brouwer as an `EXTERNAL` input (Thm 2.7 would then be reported
    as conditional, never as `PROVED`).
- **Ionescu–Tulcea API** in Mathlib is new. The fallback is finite-dimensional
  distributions plus Carathéodory uniqueness, with the frozen statement unchanged.
- **Wrong frozen statements.** If an approved statement turns out wrong, work stops. You
  rule, a versioned successor is created, and dependent status is invalidated. Nothing is
  repaired in place.
