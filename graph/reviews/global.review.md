# Global root-closure review — arXiv:2411.06301v2

Reviewer: `global-reviewer/sonnet` (fresh; did not extract or locally review any node). Date: 2026-10-28.
Graph reviewed: `DEPGRAPH.md` GRAPH_VERSION 4 (199 nodes, 397 edges, 13 roots, `AMEND` section empty, so the
effective graph is the node section), `DEPGRAPH_COVERAGE.md` (187 items, 78 excluded), manifest
`frozen-anchor-manifest.json` sha256 `a735f3ce…2844`.

Read: the skill Phase 6 text and packet §3; `EXTRACTION_SPEC.md`; `ERRATA.md`; the whole corpus L170-L1215
(comment blocks ignored; §4 and the bibliography not reviewed); the whole node section and the coverage
manifest; manifest identity fields; and, for the 13 roots only, each frozen declaration file up to the
first `:=` (statement and docstring only; no proof body, `sorry`, axiom or Lean status was read). I did
not read `ADJUDICATION.md`, `GLOBAL_QUEUE.md`, packets, or the slice reviews, to stay independent.
Linter (`--check`, `--source-root .`) returns 0. I also ran my own scripts for identity, edge/DEPS
consistency, closure, locator and environment checks (results below).

Severity legend: **BLOCKING** = a conditional-premise or dependency defect that must be corrected before
the graph is published (changes the verdict of every root whose closure contains it); **SHOULD-FIX** = a
missing/incomplete edge or a marker the linter cannot see, no verdict change; **LABEL** = a `SOURCE_GAP:`
label is missing on a node that already admits an unwritten bridge, no verdict change.

## 1. Root verdicts

### 1.0 Global checks (apply to all roots)

(Per-root `SOURCE_GAP` counts below use the `SOURCE_GAP` prefix on the node's NOTE, i.e. they include the two
nodes of G4/G5 that the linter's list of 50 omits.)

**Identity.**
- `ROOTS` equals the spec's 13 IDs; all 13 are in `FROZEN_ANCHORS` (28 anchors = 15 definitions + 13 roots).
- The manifest file hash in the header matches the file on disk. For all 28 anchors the graph's
  `FROZEN_FILE/DECL/ANCHOR_ID/ABI_SHA256`, `CONTRACT_ID` and `CONTRACT_VERSION` equal the manifest entry
  exactly. All 171 non-anchor nodes have `-` in all four `FROZEN_*` fields. No anchor is a route, step,
  application, assumption or external node. There are no `assumption` or `route` nodes (`STANDING_ASSUMPTIONS: -`).
- On every node the set of DEPS entries equals the set of EDGE targets (no missing or surplus EDGE line). No
  cycle. 199/199 nodes are reachable from the roots (no unreachable node). `--require-complete-coverage
  --require-initial-lean-status --require-all-reachable --check` also returns 0 (reviewed-status gates not
  applied, since 75 nodes are `PROPOSED`).

**Locators.** For 31 lemma/proposition/theorem/definition/example nodes I compared `STATEMENT_SOURCE` and
`PROOF_SOURCE` ranges with the LaTeX `thm/lem/prop/defn/proof/example` environment boundaries. Statement ranges
coincide with the environment (or lie inside it for the split definition `def-bp-basic.positive-regular`);
proof ranges coincide with the `proof` environment for every lemma/proposition and for Theorems 2.7 and 3.1;
for roots whose proof is a pointer sentence (L238, L249, L262, L350, L1195-L1200) the range is that sentence.
Theorem 3.1 has no environment (L957-L987 and L1149-L1179 are correct for the text). Mechanical EDGE-site check: of 397 EDGE
locators, 391 lie inside the consumer's own statement or proof range. The 6 outside are acceptable or
queued: `conjugate-to-fixed-point -> lem-fixed-pos / claim:subcritical-extinction` at L437 (the paper's own
link between Lemma 2.3 and the setting of Prop 2.2; the consumer is itself a `SOURCE_GAP` reconstruction);
`lem-unstable-scaled#vitali -> eqn-convex-func-n` at L624-L626 (inside the lemma's proof; node range narrower
than the use); `example-ctble#global-extinction / #assume-I -> def:stoch-dom` at L1194 (the sentence that
introduces the hypothesis); `thm-fixed-pt-infty -> #reduce-to-g` at L996 (inside the proof prose of Thm 3.1
that starts at L989, but outside the root's recorded `PROOF_SOURCE` L1149-L1179; see question Q3).

**Convention and ruling audit.** E1 (Hyp. III over `k ∈ {1,…,d}`) is applied in every "setting of Thm 1.4"
record (the only `k ∈ ℕ` occurrences are in countable-type nodes, correctly). E2 in `eqn-gen-func-n`; E3 in
`lem-attractive-infty`, `#lower-bound` and `#strict-increase` (`max_j`, `g^{(N)}(λ) > λ`, `∃N ∃C`, N chosen
before C);
E4 in `eqn-log-gf-truncated` (tail `0,0,…` in log coordinates, used consistently in `#growth-compare`,
`#subinvariant-weights`, `#growth-bound`); E5 in the `eqn-infty-subset#blowup` note; E6 in
`eqn-log-gf-infty`, `thm-fixed-pt-infty`; E7 in `prop-single-type.*` and `lem-1d-soln#apply-prop-1-6`; E8 in
`example-ctble` and its steps; R1 conventions (M finite inside "subcritical", sup norm in Lean, any norm in
source fields) consistent; R3/R5 independent-witness policy recorded in each split root; R6 respected
(`prop-cond-on-ext.cond-law` anchors only the conditional-law paragraph; part (a) is `ext:an72-v3-thm2`).
E9 (L1127 `k ≥ d`) is read as `d ≥ k` in `lem-1d-soln#bound-by-eta`; still an open orchestrator proposal.

**AND/OR structure.** The graph has 0 alternative routes. I searched the corpus for source-offered
alternative derivations ("equivalently" L188, L238, L249, L350; "equivalent" L553; "similarly" L693;
Remark L252; L934) and found none: each is a single derivation or a restatement, and each is modeled as a
conjunction. `thm-fixed-gf.equivalence` correctly has both directions as conjuncts (it is an iff).
The root `thm-fixed-gf.conjugate` uses the whole equivalence root although only the "fixed point implies
conjugate" half is needed; this is a coarser (sound) dependency, not an error.

**Application-by-application premise audit** (the packet's required checks):
- *Setting of Theorem 1.4 (L528) in §2.2-2.3.* Every node from `lem-mono` onward carries (I)-(III) in
  `SOURCE_HYPOTHESES` (spec §4). `thm-fixed` supplies them to all consumed lemmas with the same X;
  `#reduce-to-thm-2-7` supplies them to `thm-fixed` from the root's own (I)-(III). Lemmas 2.3/2.4 precede L528
  and are used with: Lemma 2.4 — positive regular + non-singular (setting; in §3 from Assumption I for X^k);
  Lemma 2.3 — see G1 for the extinction premise, `q = e^λ` fixed point from `eqn-fixed-pt-equiv`, positive
  regularity from (II). The skeleton X̃ in Lemma 2.12 gets its own `SOURCE_GAP` leaf
  (`#skeleton-hypotheses`), which is the correct way to expose "one easily verifies".
- *Setting of Theorem 1.4 in §3.* `lem-fixed-liminf#iterate-subinvariant` and `#orbit-decay` apply Lemma 2.9 /
  Prop 2.10 to X^d (premises from Assumption I); `thm-fixed-pt-infty#choose-lambda-d` applies
  `thm-fixed-gf.fixed-point` to X^d (premises from Assumption I) and converts with `eqn-fixed-pt-equiv`;
  `lem-fixed-limsup#choose-N` applies Lemma 2.4 to X^k; `lem-1d-soln#apply-prop-1-6` applies
  `prop-single-type.fixed-point` to X̃^k with (I),(III) discharged by two `SOURCE_GAP` steps and (II) by the
  lemma's own hypothesis. All premises are supplied.
- *Proposition 2.1 applied to X̂.* Two sites. (i) `thm-fixed-gf.equivalence#conjugate-is-tilt`: premises
  (positive regular, non-singular, 0 < â_k < 1) are carried by the `SOURCE_GAP` leaf `#conjugate-regularity`,
  which exposes all three; none is in the source. Because the anchored Prop 2.1 (Lean `ha01 : 0 < a k ∧ a k < 1`)
  literally needs `a_k < 1`, the full premise set must stay (see Q5). (ii) `prop-conjugate#cond-law-hat`:
  positive regular/non-singular from `#hat-pos-reg-nonsing`; `0 < a_k < 1` from `lem-fixed-pos` (the L437
  dichotomy, not cited in the proof) with the case `A = (1,…,1)` flagged as untreated. Correct.
- *Lemma 2.3.* Three applications: `prop-conjugate#cond-law-hat` (extinction premise is the root's own
  hypothesis: fine), `conjugate-to-fixed-point` and `thm-fixed#positivity` (premise supplied by the shared claim:
  **see G1**).
- *§3.2 assumption packages for Lemmas 3.2-3.4.* The full package (global extinction, I-IV, (3.1), the family
  λ^d of (3.6)) is in every consuming lemma's `SOURCE_HYPOTHESES`; the family's existence/selection is consumed
  at four application nodes (`#diagonal-limit`, `#before-dct`, `#dominated-bound`, `#nonzero-limit`). Actual use:
  3.2 uses I; 3.3 uses I (Lemma 2.9, Prop 2.10 for X^d), II, III; 3.4 uses I (X^k), II, IV; the final DCT uses IV
  and (3.1). Nothing is used that the root does not assume, and nothing is added to the root's hypotheses.
- *Shared nodes.* `claim:branching-property` (consumers: `eqn-gen-func-n`, `claim:mean-matrix-powers`,
  `lem-gf-pos#two-individuals`, `#kj-descendants`, `lem-mono#positivity-all-n`): generic in the process, premises
  trivial; fine. `claim:subcritical-extinction` (consumers: `hat-differs-from-X`, `fixed-point-to-conjugate`,
  `conjugate-to-fixed-point`, `lem-unstable-scaled#extinction-as`, `thm-fixed#positivity`): defect G1.
- *External boundary.* The 12 externals cover every named theorem the source invokes (Fatou, Hölder, Vitali,
  Perron-Frobenius, Taylor, Brouwer, connectedness, compact-to-Hausdorff, DCT, diagonal compactness, AN72, JL08).
  The intermediate value step in Prop 1.6 is unnamed in the source and sits inside `#fixed-point-exists`.
  The exact hypotheses of AN72 V.3 Thm 2 and JL08 Thm 1 are not in the corpus (Q6).
- *Paragraph coverage.* Every proof paragraph in L170-L1215 that carries an obligation is a node or an
  explicit `EXCLUDED` coverage item (checked against the 187 items: §1.3 outline, remarks L193-L196/L252/L560,
  the countable-type background L928-L936, `L731` asymmetry note, §4). I found no uncovered substantive paragraph.

### R1 `thm-fixed-gf.fixed-point` — FAIL (blocking only on G1)

- Source fields (L241-L250, E1, R3): hypotheses — `d ∈ ℕ`, d-type process X with generating function f;
  (I) subcritical, ρ < 1; (II) positive regular and non-singular; (III) for each `k ∈ {1,…,d}` f_k continuous
  `(0,∞]^d → (0,∞]` (half-open topology). Quantifiers — d, X, (I)-(III), then ∃q. Conclusion — ∃ q ∈ (1,∞)^d with
  f(q) = q. Scope — witness depends on X only, independent of the other two R3 witnesses. All four graph fields
  agree; Lean header `theorem_1_4_fixedPoint` agrees.
- Closure: 104 nodes, 8 externals, 19 `SOURCE_GAP` nodes. `#reduce-to-thm-2-7 -> {thm-fixed, eqn-fixed-pt-equiv}`;
  the g/f, λ = log q carrier change happens once, at that node; Theorem 2.7's premises are the root's own (I)-(III).
- Finding: G1 (via `thm-fixed#positivity`). Non-blocking: G2, G3 (continuity edge in Lemma 2.13), G4/G5 (gap-marker prefix), G7-G9 labels.

### R2 `thm-fixed-gf.conjugate` — FAIL (blocking only on G1)

- Fields: same hypotheses as R1; conclusion "∃ conjugate X̂ in the sense of Def 1.1". Graph and Lean
  (`theorem_1_4_conjugate`) agree.
- Closure: 122 nodes; uses `thm-fixed-gf.fixed-point` and `thm-fixed-gf.equivalence`; premises of the equivalence
  are literally (I), (II), so no extra application node is needed.
- Findings: G1. The node itself is still `PROPOSED` with no node-level reviewer (Q7).

### R3 `thm-fixed-gf.equivalence` — FAIL (blocking only on G1)

- Fields (L238): hypotheses subcritical + positive regular + non-singular (no Hyp. III); conclusion
  "∃ conjugate ⇔ ∃ q ∈ (1,∞)^d, f(q) = q". Graph and Lean (`exists_conjugate_iff_exists_fixedPoint`) agree,
  including the note that Hyp. III is not a hypothesis here.
- Closure: 31 nodes, 10 `SOURCE_GAP` nodes. Direction "fixed point ⇒ conjugate" = `#fixed-point-to-conjugate`
  (Prop 2.2 + `#hat-differs-from-X` for clause (a) + extinction claim); direction "conjugate ⇒ fixed point" =
  `#conjugate-regularity` → `#conjugate-is-tilt` (Prop 2.1 for X̂) → `#conjugate-to-fixed-point` (Lemma 2.3 and
  clause (a) exclude `A = 1`). Both directions are reconstructions of the single sentence L238 and are all
  marked `SOURCE_GAP`; nothing is filled in beyond reconstruction edges. Reading both directions against the
  statement, I found no hidden extra hypothesis beyond the exposed gaps.
- Finding: G1. `fixed-point-to-conjugate` explicitly claims to discharge Prop 2.2's premise "extinction
  probability started from any state is one", but its supplier concludes only ℙ_k[E] = 1 per type.

### R4 `prop-single-type.fixed-point` — PASS

- Fields (L343-L355, E7, R5): single-type X; (I) E[X(1)] < 1; (II) ℙ[X(1) ≥ 2] > 0; (III) f continuous
  `(0,∞] → (0,∞]`; ∃! q ∈ (1,∞) with f(q) = q. Graph and Lean (`proposition_1_6_fixedPoint`) agree.
- Closure: 11 nodes; the proof's sentences L353-L354 are seven step nodes in source order; existence =
  `#fixed-point-exists` (needs s from `#f-below-diagonal`, t from `#f-above-diagonal`), uniqueness =
  `#at-most-two-fixed-points` (needs `#strict-convexity`). No premise is unsupplied.
- Non-blocking: G6 (`#f-above-diagonal` is an unmarked dependency leaf for a step the source only asserts).

### R5 `prop-single-type.conjugate` — FAIL (blocking only on G1)

- Fields: same hypotheses; "a conjugate exists and any two have the same law from one individual" (R5).
  Graph and Lean agree.
- Closure: 46 nodes. Existence = `prop-single-type.fixed-point` + equivalence (+ `#hyps-imply-equivalence-hypotheses`,
  which correctly derives positive regularity of the d = 1 process from (II)); uniqueness = tilt + fixed-point
  uniqueness. The `Equivalently` of L350 is the only text, all child nodes are `SOURCE_GAP`.
- Finding: G1 via the equivalence steps. It uses private step nodes of another root
  (`#conjugate-is-tilt`, `#conjugate-to-fixed-point`); acceptable.

### R6 `prop-cond-on-ext.cond-law` — PASS

- Fields (L390-L403; R6): positive regular, non-singular X; a_k := ℙ_k[E]; 0 < a_k < 1 for all k; for each k the
  ℙ_k-conditional law given E is that of a branching process with offspring law (2.1). Graph and Lean
  (`proposition_2_1_condLaw`) agree; part (a) and "subcritical" are correctly outside the anchor.
- Closure: 3 nodes (`ext:jl08-thm1` for the conditional law, `ext:an72-v3-thm2` for "a is a fixed point so that
  (2.1) is a probability law"); both edges are at L405, the proof's only sentence.
- Remark: the external node's conclusion is the root's conclusion, so this root is exactly as strong as the
  cited theorems; their exact hypotheses are outside the corpus (Q6).

### R7 `prop-conjugate` — PASS

- Fields (L420-L432): positive regular, non-singular X; extinction from any state is one; `A ∈ [1,∞)^d`, f(A) = A;
  (2.2) defines X̂; extinction probability of X̂ from type k is 1/A_k; conditional law of X̂ given extinction is
  ℙ_k. Graph and Lean (`proposition_2_2`) agree.
- Closure: 23 nodes; the three proof sentences yield `#offspring-law`, `#abs-continuity` (gap), `#hat-pos-reg-nonsing`,
  `#hat-fixed-point`, `#ext-prob-hat`, `#cond-law-hat`. The root's extinction hypothesis is its own, so G1 does
  not apply. The untreated case `A = (1,…,1)` and the uncited Lemma 2.3 dichotomy needed for `0 < a_k < 1` are
  both flagged. Premises of Prop 2.1 (a) and of the conditional-law paragraph for X̂ are supplied (see 1.0).

### R8 `thm-fixed` — FAIL (blocking only on G1)

- Fields (L555-L557 with the standing sentence L528): Thm 1.4 setting (I)-(III) ⇒ ∃ λ ∈ (0,∞)^d, g(λ) = λ.
  Graph and Lean (`theorem_2_7`) agree.
- Closure: 102 nodes, 19 `SOURCE_GAP`. Every paragraph of the proof L894-L905 is a node
  (`#g-image-finite`, `#Lambda-invariant`, `#apply-retract`, `#A-homeomorphic-to-ball`, `#brouwer-on-A`,
  `#gH1-self-map`, `#fixed-point-in-Lambda`, `#zero-notin-Lambda`, `#positivity`). The chain
  Lemmas 2.14-2.19 (+2.9-2.13, 2.15, 2.16, 2.3, 2.5, 2.4) is complete; the hidden uses of (2.10) at L870 and L896 are
  exposed as `SOURCE_GAP` with edges. Reading Lemmas 2.15-2.19 against the source, the only implicit prerequisites
that are not already flagged are `0 ∉ Λ` (G7, G9); there is no missing prerequisite beyond those and G2/G3.
- Findings: G1 (`#positivity`); G2/G3 (Lemma 2.13 continuity edge); G4/G5 (gap-marker prefix); labels G7, G8, G9. The node is still
  `PROPOSED` (Q7).

### R9 `thm-fixed-pt-infty` — FAIL (blocking only on G1)

- Fields (L957-L987, E6): countable-type X, (3.1), global extinction probability one (read per starting type,
  as in Lean `hext : ∀ k`), Assumptions I-IV with φ, ψ, s, t, then ∃ q ∈ (1,∞)^ℕ with f(q) = q. Graph and Lean
  (`theorem_3_1`) agree; φ, ψ as parameters in Lean versus "∃φ,ψ supplied by hypotheses" in the source fields is
  an equivalent presentation.
- Closure: 154 nodes. Carrier changes: λ = log q (`#reduce-to-g`, `eqn-log-gf-infty`), finite-type
  truncation (`eqn-gf-truncated`, `eqn-log-gf-truncated`, E4), single-type restriction X̃^k
  (`lem-1d-soln#single-type-*`). The witness-selection policy is explicit and consistent (selection carried as a
  hypothesis of Lemmas 3.2-3.4). The "similar to Lemma 2.3" positivity step is a `SOURCE_GAP` node whose edge to
  `lem-fixed-pos#pos-reg-strict` is an analogy, not an applicable lemma (Q8).
- Finding: G1 (via Theorem 1.4 and Prop 2.10 for X^d). The global-extinction hypothesis is correctly not consumed.

### R10 `counterexample` — PASS

- Fields (L255-L264, R4): d = 2, the stated offspring masses, hypotheses of Thm 1.4 hold, f(q) = q has (at least)
  three solutions in (1,∞)². Graph and Lean (`example_1_5`) agree. Independent numerical check: the mean
  matrix is [[0.77,0.02],[0.02,0.77]] (ρ = 0.79 < 1) and Newton iteration finds exactly three fixed points in
  (1,∞)², at (1.17418, 1.82582), (1.62011, 1.62011), (1.82582, 1.17418).
- Closure: 5 nodes; four unproved obligations are four `SOURCE_GAP` leaves. Robustness, d = 3 and "arbitrarily
  many" are excluded (spec §7), correct.

### R11 `example-ctble` — FAIL (blocking only on G1)

- Fields (L1182-L1201, E8): (3.23) for ℙ_1; for each k ≥ 2 all four conditions of (3.23) for ℙ_k plus domination by
  the sum of k i.i.d. ℙ_1 samples; φ(k) = k, ψ(k) = 1; ∃s, t as displayed; Thm 3.1 gives q. Graph and Lean
  (`example_3_5`) agree.
- Closure: 165 nodes (it contains the whole Theorem 3.1 closure). The verification claims are `SOURCE_GAP` steps
  (`#global-extinction`, `#assume-I..IV`, `#choose-s/t`); the premises of Thm 3.1 are discharged one by one in
  `#apply-thm-3-1`. The conjugate-process remark (L1183, L934) is excluded, consistent with the anchor.
- Finding: G1 (through Thm 3.1). Node is `PROPOSED` (Q7).

### R12 `rem:hyp-iii-necessary` — FAIL (blocking only on G1)

- Fields (L252): ∃ a, b > 0, single-type X with ℙ[X(1) = m] = a m^{-3} (m ≥ 1), ℙ[X(1) = 0] = b; (I), (II) hold,
  f(q) = ∞ for every q ∈ (1,∞), no conjugate exists. Graph and Lean (`remark_hypIII_necessary`) agree.
- Closure: 36 nodes; "no conjugate" uses the equivalence's "conjugate ⇒ fixed point" half
  (`#no-conjugate`), whose supporting steps carry G1.

### R13 `rem:hyp-iii-automatic` — PASS

- Fields (L252, last sentence): positive regular, non-singular, f_k(q) < ∞ for all q ∈ (0,∞)^d ⇒ Hyp. III.
  Graph and Lean (`remark_hypIII_automatic`) agree. Closure: 2 nodes; the unproved bridge is one
  `SOURCE_GAP` leaf. No defect.

**Verdict counts: 5 PASS (R4, R6, R7, R10, R13), 8 FAIL (R1, R2, R3, R5, R8, R9, R11, R12), all 8 FAILs
caused by the single defect G1. No other BLOCKING defect; no source-topology failure beyond G1.**

## 2. Correction fragments

### G1 claim:subcritical-extinction

BLOCKING. The consumers state that this node "discharges the premise 'extinction probability started from any
state is one'" of Proposition 2.2 (L421) and of Lemma 2.3 (L441), and the anchored Prop 2.2 (Lean `hext : ∀ x`)
needs it for every initial population. The node concludes only `ℙ_k[E] = 1` for one starting individual of each
type. The step from per-type to any initial population is the independence part of the branching property; it is
unwritten in the source and absent from the graph. Replacement field lines (all other fields unchanged):

```
SOURCE_QUANTIFIERS: d ∈ ℕ; X; initial population x ∈ ℕ_0^d (in particular x = one type-k individual, k ∈ {1,…,d})
SOURCE_CONCLUSION: ℙ_x[E] = 1 for every initial population x, where E is the extinction event; equivalently (independence of the lines of descent of the initial individuals) ℙ_k[E] = 1 for every k ∈ {1,…,d}
DEPS: claim:branching-property
EDGE: claim:branching-property | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#conjugate-iff-fixed-point@L238-L238 | the consumers need extinction from any initial population (Proposition 2.2 L421, Lemma 2.3 L441) while Definition 1.1 (L185) and the proof of Lemma 2.3 (L449) use ℙ_k[E] = 1 per type; passing from one type-k individual to an arbitrary initial population is the independence part of the branching property, ℙ_x[E] = ∏_k ℙ_k[E]^{x_k}, which the source never states
NOTE: SOURCE_GAP: Definition 1.1 (L185) and Proposition 2.2 (L421) both assume that the extinction probability is one, while L238 and Theorem 1.4 assume only subcriticality, positive regularity and non-singularity; the paper never states that these imply certain extinction. No edge is added to ext:an72-v3-thm2 because the source does not invoke it here; orchestrator may decide whether to add it. Merged per ADJUDICATION A3/C1: the same unproved claim is invoked at L628 ("Since the extinction probability is one (Hypothesis I)") and in the Lemma 2.3 application at L905; all three uses consume this node. Second unwritten step: Definition 1.1 and the argument at L449 use certain extinction per starting type, whereas Proposition 2.2 and Lemma 2.3 assume it from any initial population; the bridge (independence of individuals) is not written in the source
```

### G2 lem-monotone-lim#limit-fixed

SHOULD-FIX. The node's own note records that passing the limit through `g^{(m)}` needs continuity of `g^{(m)}`
(Hypothesis III); the graph has exactly that node (`lem-basin-open#g-iter-continuous`, depends only on
`def-log-gf`, so no cycle) but omits the edge, contrary to the "logically consumes" rule. Replacement field lines:

```
DEPS: lem-monotone-lim#limits-exist, lem-basin-open#g-iter-continuous
EDGE: lem-monotone-lim#limits-exist | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-monotone-lim#limit-fixed@L689-L689 | lambda-bar^s is the limit (2.8) of g^{(r m + s)}(lambda)
EDGE: lem-basin-open#g-iter-continuous | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-monotone-lim#limit-fixed@L689-L689 | SOURCE_GAP reconstruction, not cited at L689: g^{(m)}(lambda-bar^s) = lim_r g^{(m)}(g^{(r m + s)}(lambda)) needs continuity of g^{(m)} on [0,inf)^d, which the paper derives from Hypothesis III only later (L814)
```

### G3 lem-monotone-lim#part-b

SHOULD-FIX. The node's `DEPS` are "the ingredients of the first assertion"; the first assertion's ingredient
`limit-fixed` consumes continuity (G2), so the same edge belongs here. Replacement field lines:

```
DEPS: lem-mono, lem-unstable-ssl, def-componentwise, lem-basin-open#g-iter-continuous
EDGE: lem-mono | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-monotone-lim#part-b@L675-L693 | 'proven similarly' (L693): the increasing analogue of the (2.7) argument at L676-L680
EDGE: lem-unstable-ssl | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-monotone-lim#part-b@L675-L693 | 'proven similarly' (L693): the analogue of the contradiction argument at L690
EDGE: def-componentwise | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-monotone-lim#part-b@L675-L693 | 'proven similarly' (L693): the sense of '>' is that of Definition 2.8
EDGE: lem-basin-open#g-iter-continuous | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-monotone-lim#part-b@L689-L693 | SOURCE_GAP reconstruction: the analogue of the limit-fixed step (L689) passes a monotone limit through g^{(m)}, which needs continuity of g^{(m)} (Hypothesis III)
```

### G4 lem-monotone-lim#shifted-mono

SHOULD-FIX (marker visibility). The note starts `SOURCE_GAP (minor):`; the linter's explicit-gap list matches
`SOURCE_GAP:` only, so this node and `lem-monotone-lim#limits-zero` (next fragment) are missing from the 50
reported gap nodes (they would make 52). Replacement field line:

```
NOTE: SOURCE_GAP: the strict clause of Lemma 2.9 holds only for n >= N with |g^{(n)}(lambda)| < inf (lambda is the larger argument); the source asserts 'strict if n is sufficiently large' (L680) without showing that this finiteness proviso holds for all large n.
```

### G5 lem-monotone-lim#limits-zero

SHOULD-FIX (same reason as G4). Replacement field line:

```
NOTE: SOURCE_GAP: Lemma 2.12(ii) is applied at L690 with lambda := lambda-bar^s and eta := g^{(s)}(lambda), but its premises (lambda-bar^s in [0,inf)^d \ {0}, eta in [0,inf)^d, i.e. finiteness of g^{(s)}(lambda) for s in {0,...,m-1}) are not discharged in the source; lambda-bar^s < g^{(s)}(lambda) is asserted in one clause from the large-n strictness of (2.7). Proof by contradiction for the first assertion; the m subsequences s = 0,...,m-1 are combined to conclude convergence of the full sequence (routine).
```

### G6 prop-single-type#f-above-diagonal

LABEL. A dependency-free leaf whose content is only asserted ("By Hypothesis II, there exists a sufficiently large
t > 1 for which f(t) > t"), with `t > s` unwritten; same status as the already-labelled `#strict-convexity`
and `#mean-eq-derivative`. Replacement field line:

```
NOTE: SOURCE_GAP: 'By Hypothesis II, there exists a sufficiently large t > 1 for which f(t) > t' (L354) is asserted with no argument; hypothesis (II) is the root's own. The requirement t > s is not written
```

### G7 thm-fixed#zero-notin-Lambda

LABEL. The source gives no reason for "Since 0 ∉ Λ"; the node supplies a reason through a "reading" edge and
declares itself not a gap. Replacement field line:

```
NOTE: SOURCE_GAP: the source states 'Since 0 not in Lambda' (L904) without a reason; the edges record one reading (0 in [0,eps]^d subset S_0, Lemma 2.15). An alternative reading is Lambda subset A(r,R) with r > 0 (lem-retract#choose-r-R).
```

### G8 prop-unstable#strict-case

LABEL. The edge to `lem-mono` has no source evidence (the note admits the monotonicity step is unstated).
Replacement field line:

```
NOTE: SOURCE_GAP: the monotonicity step from eta <= r lambda to the norm bound |g^{(n)}(eta)| <= |g^{(n)}(r lambda)| (first assertion of Lemma 2.9, g^{(n)} >= 0 on [0,inf)^d) is not stated in the source ('By Lemma 2.11, this implies', L643); the edge to lem-mono records that unwritten use.
```

### G9 lem-retract#radial-bijection

LABEL. `π` is defined only on `[0,∞)^d ∖ {0}`; "π|_Λ is a bijection onto B" silently needs `0 ∉ Λ`, which the source only
asserts at L904 (no reason is given anywhere). Replacement field line:

```
NOTE: SOURCE_GAP: pi is defined only on [0,inf)^d \ {0}; that Lambda lies in this domain (0 is not in Lambda) is used implicitly here and stated, without reason, at L904 (see thm-fixed#zero-notin-Lambda; it also follows from Lambda being a subset of A(r,R) with r > 0). Lemma 2.18 itself only covers rays through u in B.
```

## 3. Unreachable nodes

None. All 199 nodes lie in the union of the 13 root closures (verified independently of the linter's
`outside_root_closure`). Per-root closure sizes: R1 104, R2 122, R3 31, R4 11, R5 46, R6 3, R7 23, R8 102, R9 154,
R10 5, R11 165, R12 36, R13 2. Nodes reachable from exactly one root: `thm-fixed-gf.conjugate`, the `prop-single-type.conjugate*` steps,
`counterexample*`, `rem:hyp-iii-necessary*`, `rem:hyp-iii-automatic*`, `example-ctble*` and `def:stoch-dom`.

## 4. Unresolved questions for the author/orchestrator

- **Q1 (G1 adjudication).** If the orchestrator prefers not to touch the REVIEWED claim node, the alternative is a
  new step `claim:extinction-all-states` (SOURCE_GAP, dep `claim:branching-property`) consumed by
  `fixed-point-to-conjugate`, `conjugate-to-fixed-point`, `thm-fixed#positivity` in place of the per-type claim.
  Either way the per-type consumers (`lem-unstable-scaled#extinction-as`, which uses only ℙ_k-a.s. extinction) may
  keep the per-type form. Also decide whether the claim's `STATEMENT_SOURCE`/`PROOF_SOURCE` (currently L238, where
  the claim is needed but not asserted) should move to L628 ("Since the extinction probability is one
  (Hypothesis I)"), the only sentence that attributes certain extinction to Hypothesis I.
- **Q2 (optional edges not invoked by the source).** `counterexample#hyp-III-continuous` and
  `example-ctble#assume-I` (continuity part) could be derived from the Remark L252 (`rem:hyp-iii-automatic`);
  the source never invokes it, so I recommend no edge. Likewise `prop-conjugate#abs-continuity`, the skeleton
  steps and `eqn-infty-subset#blowup` consume the branching structure / (2.5) without citing it; the graph's policy
  (edges only for cited or reconstructed-and-flagged uses) is consistent, but a Lean planner will need these as
  prerequisites. Confirm the policy is intended.
- **Q3 (frozen locator).** The anchor `thm-fixed-pt-infty` records `PROOF_SOURCE` L1149-L1179, but its proof starts at
  L989 (setup, reduction at L996, choice of λ^d at L998-L1002, lemmas). The EDGE to `#reduce-to-g` cites L996,
  outside both recorded ranges. Since anchor locators must not be amended after the freeze, either accept the
  discrepancy (as is) or authorize a versioned correction.
- **Q4 (`def:stoch-dom` range).** Manifest range L1188-L1190 holds display (3.23), while the phrase "stochastically
  dominated" is at L1194; the graph already follows the text. Informational; no action possible without a new
  anchor version.
- **Q5 (conjugate-regularity ambiguity).** `thm-fixed-gf.equivalence#conjugate-regularity` carries an open
  alternative in its note (keep only `0 < â_k` and mark `#conjugate-is-tilt` DISPUTED). I recommend keeping the full
  premise set `0 < â_k < 1` + positive regular + non-singular: the anchored Prop 2.1 (R6, Lean `ha01`) literally
  requires `a_k < 1`, and the premise is exposed as `SOURCE_GAP`, which is the faithful modeling. My own reading is
  that the three facts are true for any conjugate (mutual absolute continuity of the offspring laws; `â_k < 1` from
  clause (a) and positive regularity of X), but the source supplies none of this, so it must stay a gap leaf.
- **Q6 (externals).** The hypotheses recorded in `ext:an72-v3-thm2` and `ext:jl08-thm1` are "as used by the paper";
  the cited theorems are outside the corpus, so the author should confirm them (especially whether JL08 Thm 1
  needs more than the d-type, positive regular, non-singular setting, and whether AN72 V.3 Thm 2 requires
  non-singularity as recorded).
- **Q7 (review status).** 75 nodes are `PROPOSED` (no node-level reviewer), including the roots
  `thm-fixed-gf.conjugate`, `thm-fixed`, `example-ctble` and the anchors `def:population-sigma`,
  `def-bp-basic.positive-regular`. The global review does not replace those reviews. After applying G1-G9,
  `GLOBAL_REVIEWER`/`GLOBAL_REVIEW_REF` can be filled only if the orchestrator accepts the corrections; G1 changes a
  REVIEWED node, so it needs a fresh node-level review.
- **Q8 (analogy edge).** `thm-fixed-pt-infty#positivity -> lem-fixed-pos#pos-reg-strict` is a by-analogy edge
  ("similar to the second paragraph of Lemma 2.3"); `pos-reg-strict` has finite-type hypotheses and cannot be applied
  to X. The note says this; the Lean orchestrator should treat the edge as "re-prove the argument in countable
  type", not as a usable lemma. Consider rewording the EDGE rationale to start with `analogy only:`.
- **Q9 (E9).** ERRATA E9 (L1127 `k ≥ d` read as `d ≥ k`) is still "Open"; the graph already uses the reading.
- **Q10 (reading of global extinction).** "global extinction probability one" (L958) is read per starting type k in
  the graph and in Lean (`hext : ∀ k`); the source does not say. It is not consumed by any step of Thm 3.1, so the
  choice only affects the statement's strength. Confirm.
- **Q11 (harmless gap).** `lem-unstable-scaled#holder-bound` flags the case `r = 0` of Lemma 2.11; no consumer uses
  `r = 0` (`prop-unstable#strict-case` uses `r ∈ (0,1)`, `lem-ray-intersect#uniqueness` uses `r/R ∈ (0,1)`). No change
  needed.

## 5. Follow-up verdicts

Verifier: `global-reviewer/sonnet`, as distinct reviewer of the 13 records rewritten by the queue reviewer plus the two
addendum records (`eqn-infty-subset#blowup` with the Q27 edge applied, `claim:subcritical-extinction` as rewritten by P1).
Method: current `DEPGRAPH.md` / `DEPGRAPH_COVERAGE.md` (regenerated 18:02; linter `--check` returns 0, so no dangling
or cyclic edge) compared with the raw LaTeX L176-L177, L238, L247, L252-L276, L343-L356, L390-L432, L441-L449, L732-L735,
L781-L800, L851-L905, L930-L937, L1127-L1145 (comments ignored). Edge policy used (as settled by the coordinator): an
edge is allowed if the source cites the use, or if the consuming node's `SOURCE_GAP` note explicitly names it as a
reconstructed use. No project file other than this report was written.

PASS def:population-sigma
PASS eqn-infty-subset#blowup
PASS inv:L265:counterexample-claims
PASS inv:L930:ctble-extinction-facts
PASS inv:fig-counterexample
PASS lem-1d-soln#diagonal-position
PASS lem-attractive-infty#strict-increase
FAIL prop-single-type#f-below-diagonal: after the queue rewrite the node states "f(s) < s for all s ∈ (1,1+ε')" with only hypothesis (I); without hypothesis (III) (f finite near 1, L353 "by Hypothesis III") the statement is false (the a·m^{-3} example of L252 has E[X(1)] < 1 and f(s) = ∞ for every s > 1), so the record drops a source premise; the TITLE still says "for some s"
PASS prop-single-type#mean-eq-derivative
PASS rem:hyp-iii-necessary#no-conjugate
PASS thm-fixed#apply-retract
PASS thm-fixed-gf.equivalence#conjugate-is-tilt
PASS thm-fixed-gf.equivalence#conjugate-regularity
PASS claim:subcritical-extinction

### H1 prop-single-type#f-below-diagonal

Replacement field lines (all other fields unchanged; DEPS and EDGE stay as they are):

```text
TITLE: f(s) < s for every s > 1 sufficiently close to 1 (Taylor expansion)
SOURCE_HYPOTHESES: X single-type branching process started from a single individual with generating function f; (I) 𝔼[X(1)] < 1; (III) f is continuous from (0,∞] to (0,∞], with (0,∞] carrying the half-open-interval topology
NOTE: witness choice: the consumer prop-single-type#fixed-point-exists fixes one s ∈ (1, 1+ε'); hypotheses (I) and (III) are the root's own
```

### Evidence for the PASS verdicts

- `def:population-sigma`: L176-L177 is the only statement text; L402 and L427 contain "for every bounded measurable function F : ℕ_0^d → ℝ" under (2.1) and (2.2). The NOTE's consumer chain (step-kernel → path-law → branching-property / eqn-gen-func-n / mean-matrix-powers) matches DEPS. Frozen fields and manifest range (176, 402, 427, 915-918) unchanged.
- `eqn-infty-subset#blowup`: fields match L732 (∃N before λ; conclusion `g^{(N)}(λ) = (∞,…,∞)`; E5 read as Definition 1.3). DEPS = {def-bp-basic.positive-regular, eqn-convex-func-n}; the second edge sits at L732 and its rationale and the NOTE both say "logically consumed, not cited" and name it as the reconstructed use inside a `SOURCE_GAP` node, which is what the settled policy requires. `eqn-convex-func-n` is stated on (-∞,∞]^d and depends only on `def-log-gf`, `eqn-gen-func-n`: no cycle. The old "dropped (ADJUDICATION C5)" sentence is gone. (The NOTE says the same thing twice; harmless.)
- `inv:L265:counterexample-claims`: L262 holds exactly the two claims named (clearly satisfies the hypotheses; three solutions) plus the three sibling claims, all with their own items; the offspring-law display is the separate item `inv:counterexample`. The ID's "L265" is cosmetic.
- `inv:L930:ctble-extinction-facts`: L930-L934 contain the three extinction notions, q ≤ q(A) ≤ q̃ ≤ 1, S and Q, Moyal/Bertacchi (L932), "we focus on global extinction" (L932) and the L934 conjugate remark: all background, none consumed. L936 (introductory sentence) and L937 (definition of X^d) are covered by `inv:L936:def-truncation`; the global-extinction definition at L930 by `inv:L930:global-extinction-def`. No source line lost by narrowing from L930-L936.
- `inv:fig-counterexample`: L267-L273 is the figure environment with the Mathematica caption; the EXCLUDED reason is accurate and agrees with the note in `counterexample#three-fixed-points`.
- `lem-1d-soln#diagonal-position`: L1134 gives `x < f̃_k(x)` for x > e^{η_k} (general k); L1136 gives `f̃_1(x) ≤ x` on [1,e^{η_1}] for k = 1 only. The new QUANTIFIERS, CONCLUSION and NOTE say exactly this; only the k = 1 inequality is consumed by `#eta1-lt-log-t`, the strict part for general k by `#bound-by-eta`.
- `lem-attractive-infty#strict-increase`: L799 (E3 reading); `C := log m^{-1} ≥ 0` since m ≤ 1; the lemma's "C > 0" is not discussed in the source and any larger C works; the claim `exp(g_k^{(N)}) ≥ e^{λ_k} m e^{max_j λ_j} > e^{λ_k}` for max_j λ_j > C is correct.
- `prop-single-type#mean-eq-derivative`: L354 asserts `𝔼[X(1)] = f'(1)` from the definition of f and finiteness near 1; removing the `eqn-mean-matrix` edge is faithful (L354 does not invoke M); `eqn-mean-matrix` is still reached through `lem-gf-bded#jacobian`, `#perron-frobenius`, `claim:mean-matrix-powers`, `prop-single-type.conjugate#hyps-imply-equivalence-hypotheses`. `SOURCE_GAP` label kept.
- `rem:hyp-iii-necessary#no-conjugate`: hypotheses now repeat the source's "for appropriate constants a, b > 0 (the source does not specify them)"; the discharge of subcritical / positive regular / non-singular stays in DEPS (not laundered into the statement); the edge to the equivalence is the labelled reconstruction.
- `thm-fixed#apply-retract`: L898 ("Let A be as in Lemma 2.19, so that Λ ⊂ A") and L901 ("Let H_1 : A → Λ be a retraction, as given by Lemma 2.19") lie in L898-L901; STATEMENT/PROOF/EDGE locators now agree. The span also contains the ball and Brouwer sentences owned by `#A-homeomorphic-to-ball` and `#brouwer-on-A` (locators may overlap).
- `thm-fixed-gf.equivalence#conjugate-is-tilt`: the NOTE now states that the two edges (Prop 2.1 and the premise node) are reconstructions; L238 does not invoke Prop 2.1. The tilt computation (offspring of X̂ = tilt of X by A = 1/â, normalisation gives f(A) = A, A_k ≥ 1 since â_k ≤ 1, A_k < ∞ since â_k > 0) matches the CONCLUSION.
- `thm-fixed-gf.equivalence#conjugate-regularity`: Prop 2.1's premises are at L391 and L397; the three premises are listed as a package and `<1` is explicitly not supplied. Matches the anchored Prop 2.1 (`0 < a k ∧ a k < 1`), so the full package must stay.
- `claim:subcritical-extinction` (P1): "orchestrator may decide…" is gone; SOURCE_CONCLUSION is now a plain statement (every initial population, in particular each type) and the per-type/any-state bridge sits where it belongs, in the edge to `claim:branching-property` (reconstruction named in the NOTE) and in the NOTE. This matches Prop 2.2 (L421), Lemma 2.3 (L441) and the per-type use at L449, and removes my G1 defect. `claim:branching-property` depends only on `def:path-law` and `def:step-kernel`: no cycle.

### Non-blocking observations (no verdict changed)

1. `claim:subcritical-extinction` NOTE says the Lemma 2.3 application is "at L905"; L905 is `\end{proof}`, the application is at L904 ("By Lemma 2.3, in fact λ ∈ (0,∞)^d"). Same off-by-one existed in the original text. Fix: replace "at L905" by "at L904".
2. `lem-1d-soln#diagonal-position` TITLE still reads "f̃_k(x)≤x on [1,e^{η_k}]" for general k, which the narrowed fields no longer claim. Suggested TITLE: `Position of f̃_k relative to the diagonal: f̃_k(x)>x for x>e^{η_k}; f̃_1(x)≤x on [1,e^{η_1}]`.
3. `thm-fixed-gf.equivalence#conjugate-regularity` NOTE says Definition 1.1 and L238 "supply none of these" and, in the same sentence, that clause (b) "presupposes ℙ̂_k[E] > 0". The lower bound is thus presupposed by the definition; only regularity and `ℙ̂_k[E] < 1` are not supplied. Wording only.
4. `prop-single-type#fixed-point-exists` still says "s and t the witnesses of … #f-below-diagonal"; with H1 (∀ s ∈ (1,1+ε')) read "s a chosen point of (1,1+ε') and t the witness of #f-above-diagonal". Wording only.
5. Under the settled edge policy the remaining edge-less `SOURCE_GAP` nodes whose notes do not name a reconstructed use (e.g. `lem-unstable-ssl#skeleton-hypotheses`, which records "no dependencies") stay as they are; no change needed.

### Additional finding X1 (coverage item outside the 13)

A mechanical pass over all 188 items found one more uncovered source environment: Figure 2 (`fig-brouwer-proof`, L841-L847; caption: illustration of the proof of Lemma 2.19 for d = 2) has no inventory item, while Figure 1 now has `inv:fig-counterexample`. All other lines outside item spans are label lines or display lines whose item anchor cites the label/first line, or expository sentences. Suggested new item (EXTRACTOR left to the orchestrator so that `GLOBAL_REVIEWER` stays independent of extraction):

```text
ITEM: inv:fig-brouwer-proof
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#fig-brouwer-proof@L841-L847
DISPOSITION: EXCLUDED
REASON: Figure 2 (illustration of the proof of Lemma 2.19 for d = 2: the deformation retraction from the region A to Λ by sliding points along rays through the origin) pictures the construction (2.13) and states nothing that the proof of Lemma 2.19 (nodes eqn-retract-def, lem-retract#phi-homeomorphism, #H-continuous, #H-fixes-Lambda, #H-preserves-A) does not prove; it is not a proof obligation
COVERAGE_STATUS: PROPOSED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: -
```
