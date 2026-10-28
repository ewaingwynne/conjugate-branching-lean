# Slice A topology review — reviewer-A/sonnet

Scope: slice A (paper.tex L170-L379) of `DEPGRAPH.md` / `DEPGRAPH_COVERAGE.md`.
Nodes reviewed: all 47 blocks with `EXTRACTOR: extractor-A/sonnet` plus `claim:branching-property` (48 total).
Coverage reviewed: all 37 records with `EXTRACTOR: extractor-A/sonnet`, plus an inventory-completeness check of L170-L379.
No file other than this one was written. No Lean proof body, `sorry`, axiom or Lean status was used; frozen declaration files were read for statement identity only
(the ten slice-A definition anchors, Theorem_1_4_FixedPoint/Conjugate, ExistsConjugateIff, Proposition_1_6_FixedPoint/Conjugate, Example_1_5, Remark_HypIII_Necessary/Automatic).

Tally: nodes PASS 30 / FAIL 18; coverage PASS 33 / FAIL 4; plus 1 inventory-completeness FAIL (missing item for L188).

Mechanical checks done by script (all clean): DEPS and EDGE lists coincide for every slice-A node; no dangling DEPS target; no cycle in the whole graph;
every slice-A anchor's FROZEN_*/CONTRACT_* fields equal the EXTRACTION_SPEC §8 table; every non-anchor has `-` FROZEN fields and `paper.<id>` CONTRACT_ID;
every coverage `DISPOSITION: NODE` id exists and every slice-A node is mapped by at least one coverage item.

Main failure themes (details and fixes below):
1. Source-statement fields that put a *previous step's output* into SOURCE_HYPOTHESES (f'(1)=E[X(1)], s/t, q-bar, A-with-regularity, "certain extinction", lambda "provided by Theorem 2.7", "subcritical, positive regular, non-singular as a 1-type process", "f(q) != q"). Slice B's convention (theorem setting only; earlier results only in DEPS) is the one SKILL Phase 4 requires.
2. A nonexistent display number "(1.5)" used for the display of Proposition 2.2 (it is (2.2): `\numberwithin{equation}{section}`, section 1 has only (1.1)-(1.3)).
3. `conjugate-is-tilt` applies Proposition 2.1 to X-hat but no node discharges the Prop 2.1 premise 0 < a_k < 1 (only `> 0` is discharged).
4. The L229 clause "positive regular iff M^N has all positive entries" is consumed by the Perron-Frobenius application at L508 but was dropped as "unconsumed".
5. (1.2) and the L220 claim reach the branching property through three definition nodes instead of the node `claim:branching-property`, whose own conclusion in turn smuggles in (1.2).

---

## 1. Node verdicts

FAIL def:population-sigma: SOURCE_CONCLUSION cites the nonexistent display "(1.5)" for the F-test-function sentence at L427 (it is display (2.2), L423-L426). Fix F1.
PASS def:step-kernel
PASS def:path-law
PASS def:extinction
PASS def-conjugate
PASS eqn-generating-function
PASS eqn-mean-matrix
PASS def:subcritical
FAIL def-bp-basic.positive-regular: NOTE says the L229 clause "equivalent to M^N has all positive entries" is not consumed by any root's proof; it is consumed at L508 (Perron-Frobenius needs M^N > 0). Fix F2 (NOTE) and F3 (new node).
PASS def-bp-basic.non-singular
FAIL eqn-gen-func-n: the identification of f^(n) with E_k[prod q_j^{X_j(n)}] is the branching/Markov property, which has its own node `claim:branching-property`; the three direct edges to `def:step-kernel`, `def:path-law`, `def:population-sigma` are transitive shortcuts around it (and the NOTE concedes they are "not source-stated"). Fix F4.
FAIL claim:mean-matrix-powers: same shortcut pattern (E_k[X_j(n)] = (M^n)_kj is obtained by iterating the one-generation mechanism = branching/Markov property). Fix F5.
PASS thm-fixed-gf.fixed-point
FAIL thm-fixed-gf.fixed-point#reduce-to-thm-2-7: SOURCE_HYPOTHESES contains "lambda in (0,inf)^d with g(lambda)=lambda is provided by Theorem 2.7" (= the conclusion of its DEP `thm-fixed`), and SOURCE_CONCLUSION carries a proof pointer ("by the equivalence (2.6)"). Fix F6.
FAIL thm-fixed-gf.conjugate: EDGE to `thm-fixed-gf.equivalence` cites L238, the prerequisite's own statement/proof site, not the consumer's use site (the "equivalently" clause at L249, the node's own PROOF_SOURCE). Fix F7.
PASS thm-fixed-gf.equivalence
PASS claim:subcritical-extinction
FAIL thm-fixed-gf.equivalence#hat-differs-from-X: SOURCE_HYPOTHESES adds "with certain extinction" (the conclusion of its DEP `claim:subcritical-extinction`; L238's hypotheses are only subcritical/positive regular/non-singular) and cites the nonexistent "(1.5)". Fix F8.
FAIL thm-fixed-gf.equivalence#fixed-point-to-conjugate: SOURCE_CONCLUSION cites the nonexistent "(1.5)" (should be display (2.2)). Fix F9.
FAIL thm-fixed-gf.equivalence#conjugate-regularity: it is the only node that discharges the premises of Proposition 2.1 for X-hat, but Proposition 2.1 (L391, L397) also requires 0 < a_k < 1; "a_k < 1" is discharged nowhere, while the conclusion asserts that formula (2.1) "is available for X-hat". Conditional premise never supplied at its consumer. Fix F10.
FAIL thm-fixed-gf.equivalence#conjugate-is-tilt: SOURCE_HYPOTHESES contains "X-hat is positive regular and non-singular with P-hat_k[E] > 0" (the conclusion of its DEP `#conjugate-regularity`, not a premise of the source statement); cites "(1.5)" for display (2.2). Fix F11.
PASS thm-fixed-gf.equivalence#conjugate-to-fixed-point
PASS prop-single-type.fixed-point
PASS prop-single-type#finite-near-one
FAIL prop-single-type#mean-eq-derivative: SOURCE_HYPOTHESES contains "f finite on [1,1+eps]" (conclusion of DEP `#finite-near-one`); the conclusion also silently uses hypothesis (I). Fix F12.
FAIL prop-single-type#f-below-diagonal: SOURCE_HYPOTHESES contains "f'(1) = E[X(1)]" (conclusion of DEP `#mean-eq-derivative`). Fix F13.
PASS prop-single-type#f-above-diagonal
FAIL prop-single-type#fixed-point-exists: SOURCE_HYPOTHESES contains "s > 1 with f(s) < s; t > s with f(t) > t" (conclusions of its two DEPS). Fix F14.
PASS prop-single-type#strict-convexity
FAIL prop-single-type#at-most-two-fixed-points: SOURCE_HYPOTHESES contains "f convex ...; q-bar in (1,inf) with f(q-bar)=q-bar and f(1)=1" (conclusions of DEPS); and the fact "1 is a fixed point" (f(1)=1, the proof's "Since f(1) = 1", L353, reused in "namely 1 and q-bar", L354) has no edge. Fix F15.
PASS prop-single-type.conjugate
FAIL prop-single-type.conjugate#hyps-imply-equivalence-hypotheses: conclusion states rho = M_{1,1} = E[X(1)] but there is no edge to `eqn-mean-matrix` (the sibling step `#mean-eq-derivative` has it for the same identification; the "i.e." at L346 is the use site). Fix F16.
FAIL prop-single-type.conjugate#existence: SOURCE_HYPOTHESES contains "X subcritical, positive regular and non-singular as a 1-type process" (conclusion of DEP `#hyps-imply-equivalence-hypotheses`; positive regularity is not a hypothesis of Proposition 1.6). Fix F17.
PASS prop-single-type.conjugate#unique-in-law
PASS counterexample
PASS counterexample#hyp-I-subcritical
PASS counterexample#hyp-II-regular
PASS counterexample#hyp-III-continuous
PASS counterexample#three-fixed-points
PASS rem:hyp-iii-necessary
PASS rem:hyp-iii-necessary#constants-and-hyp-I
PASS rem:hyp-iii-necessary#hyp-II-regular
PASS rem:hyp-iii-necessary#f-infinite
FAIL rem:hyp-iii-necessary#no-conjugate: SOURCE_HYPOTHESES contains "subcritical, positive regular, non-singular single-type process with f(q) != q for every q in (1,inf)" = the conclusions of its three DEP steps. Fix F18.
PASS rem:hyp-iii-automatic
PASS rem:hyp-iii-automatic#continuity-from-finiteness
PASS ext:taylor
FAIL claim:branching-property: (a) its conclusion's "in particular E_x[prod q_j^{X_j(m)}] = prod_k f_k^(m)(q)^{x_k}" is (1.2) for x = e_k, so it needs `eqn-gen-func-n` (no such edge) and would make F4/F5 circular; it is not part of the branching/Markov property and no consumer (lem-gf-pos, lem-mono) uses it; (b) SOURCE_HYPOTHESES omits d in N. Fix F19.

---

## 2. Replacement fragments for node FAILs

(Each fragment replaces the whole field line / EDGE line of the same name in the named block. Fields not listed stay unchanged. No FROZEN_*, CONTRACT_ID, CONTRACT_VERSION, STATEMENT_SOURCE or PROOF_SOURCE of any anchor is altered.)

### F1 def:population-sigma
```
SOURCE_CONCLUSION: the (implicit) measurable structure on the population space ℕ_0^d and on the space of paths of populations with respect to which X_j(n), the laws ℙ_k, the expectations 𝔼_k and the bounded measurable test functions F : ℕ_0^d → ℝ of (2.1) and (2.2) (L402, L427, slice B) are understood; the paper never writes this structure out
```

### F2 def-bp-basic.positive-regular
```
NOTE: definition leaf. The clause 'equivalent to the condition that M^N has all positive entries' (L229) is a separate claim: it is consumed by the Perron-Frobenius application at L508 (lem-gf-bded#perron-frobenius) and is modeled as def-bp-basic.positive-regular#matrix-equiv. N ≥ 1 (R1)
```

### F3 new node (re-instates the original `#matrix-equiv` of ADJUDICATION A1, whose "if still unreachable" condition fails)
```
NODE: def-bp-basic.positive-regular#matrix-equiv
KIND: claim
TITLE: Positive regularity at time N is equivalent to M^N having all positive entries
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#def-bp-basic@L229-L229
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#def-bp-basic@L229-L229
CONTRACT_ID: paper.def-bp-basic.positive-regular#matrix-equiv
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: d ∈ ℕ; X = {X(n)}_{n∈ℕ_0} is a d-type branching process with mean matrix M of display (1.3); each M_{k,j} is finite (L219); N ∈ ℕ
SOURCE_QUANTIFIERS: d ∈ ℕ; X; N ∈ ℕ; k, j ∈ {1,…,d}
SOURCE_CONCLUSION: ℙ_k[X_j(N) ≥ 1] > 0 for all k, j ∈ {1,…,d} if and only if the matrix M^N has all positive entries
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: claim:mean-matrix-powers, def-bp-basic.positive-regular
ROUTES: -
ROUTE_FOR: -
EDGE: claim:mean-matrix-powers | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#def-bp-basic@L229-L229 | 'the matrix M^N has all positive entries': (M^N)_{k,j} = 𝔼_k[X_j(N)], so positivity of the entries is positivity of the means
EDGE: def-bp-basic.positive-regular | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#def-bp-basic@L225-L229 | the probabilistic form ℙ_k[X_j(N) ≥ 1] > 0 of the same definition
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: asserted ('which is equivalent to') without argument; that 𝔼_k[X_j(N)] > 0 iff ℙ_k[X_j(N) ≥ 1] > 0 and the passage from M^N entries to means are not written. Consumed (cross-slice, owned by slice B) by lem-gf-bded#perron-frobenius, whose use of the Perron-Frobenius theorem (L508) needs M^N > 0
```
Cross-slice companion (slice-B-owned block `lem-gf-bded#perron-frobenius`, flag for the orchestrator/B reviewer): add
```
DEPS: ext:perron-frobenius, eqn-mean-matrix, claim:mean-matrix-powers, def-bp-basic.positive-regular, def-bp-basic.positive-regular#matrix-equiv
EDGE: def-bp-basic.positive-regular#matrix-equiv | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-bded#perron-frobenius@L508-L508 | 'we have assumed that our branching process is positive regular and non-singular, the Perron-Frobenius theorem implies ...': the theorem needs a power of M with all positive entries, which is the L229 clause
```
(the existing edges to `claim:mean-matrix-powers` and `def-bp-basic.positive-regular` may then be dropped as transitive; orchestrator's call).

### F4 eqn-gen-func-n
```
DEPS: eqn-generating-function, claim:branching-property, def:path-law
EDGE: eqn-generating-function | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-gen-func-n@L209-L213 | f in 'the composition of f with itself n times' is the one-generation generating function of display (1.1)
EDGE: claim:branching-property | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-gen-func-n@L209-L213 | the identity between the n-fold composition and the generation-n expectation ('Equivalently') is the branching (independent offspring) and Markov property of the generation process; the paper gives no argument
EDGE: def:path-law | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-gen-func-n@L209-L213 | the generation-n expectation is taken under ℙ_k, the law of the process started from one type-k individual
NOTE: SOURCE_GAP: the paper asserts the identification with a bare 'Equivalently' and gives no proof. The edge to claim:branching-property is the characterization consumption of spec §8, not source-stated; def:step-kernel and def:population-sigma are reached through def:path-law and claim:branching-property. Feeds slices B-D (lem-fixed-pos L454-L467, display (2.5) L540)
```
(delete the EDGE lines to `def:step-kernel` and `def:population-sigma`; keep the rest of the NOTE text after "Feeds slices B-D" as is.)

### F5 claim:mean-matrix-powers
```
DEPS: eqn-mean-matrix, claim:branching-property, def:path-law
EDGE: eqn-mean-matrix | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#mean-matrix-powers@L219-L220 | M is the matrix of display (1.3) whose powers are being identified
EDGE: claim:branching-property | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#mean-matrix-powers@L219-L220 | the n-th generation mean is obtained by iterating the one-generation mechanism, i.e. by the branching and Markov property; the paper gives no argument
EDGE: def:path-law | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#mean-matrix-powers@L219-L220 | the mean 𝔼_k[X_j(n)] is taken under ℙ_k
```
(delete the EDGE lines to `def:step-kernel` and `def:population-sigma`.)

### F6 thm-fixed-gf.fixed-point#reduce-to-thm-2-7
```
SOURCE_HYPOTHESES: hypotheses (I)-(III) of Theorem 1.4 (the setting assumed throughout §2.2, L528)
SOURCE_QUANTIFIERS: d ∈ ℕ; X satisfying (I)-(III); λ ∈ (0,∞)^d with g(λ) = λ (the witness of Theorem 2.7); q := e^λ componentwise
SOURCE_CONCLUSION: q := (e^{λ_1},…,e^{λ_d}) lies in (1,∞)^d and satisfies f(q) = q
```

### F7 thm-fixed-gf.conjugate
```
EDGE: thm-fixed-gf.equivalence | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed-gf@L249-L249 | the 'equivalently' clause of Theorem 1.4 (restating the equivalence of L238) converts the fixed point into a conjugate; its premises (subcritical, positive regular, non-singular) are the root's hypotheses (I) and (II)
```

### F8 thm-fixed-gf.equivalence#hat-differs-from-X
```
SOURCE_HYPOTHESES: d ∈ ℕ; X is a subcritical, positive regular and non-singular d-type branching process with generating function f; A ∈ (1,∞)^d with f(A) = A; X̂ is the branching process of display (2.2) built from A
```
(quantifiers/conclusion/DEPS unchanged; certain extinction enters only through the existing edge to `claim:subcritical-extinction`.)

### F9 thm-fixed-gf.equivalence#fixed-point-to-conjugate
```
SOURCE_CONCLUSION: there exists a conjugate branching process X̂ for X in the sense of Definition 1.1, namely the process of display (2.2) with A = q
```

### F10 thm-fixed-gf.equivalence#conjugate-regularity
```
TITLE: Premises of Proposition 2.1 for a conjugate process X̂ (positive regular, non-singular, 0 < ℙ̂_k[E] < 1)
SOURCE_CONCLUSION: X̂ is positive regular and non-singular and 0 < ℙ̂_k[E] < 1 for each k ∈ {1,…,d}, i.e. every premise of Proposition 2.1 (L391, L397) holds for X̂ (the lower bound is also what makes the conditioning in clause (b) of Definition 1.1 meaningful)
NOTE: SOURCE_GAP: Proposition 2.1 (L391, L397) is stated for a positive regular, non-singular process with 0 < a_k < 1 for every k; a conjugate X̂ is assumed to satisfy none of these and the paper never checks them. This node exposes all of them as the premises under which thm-fixed-gf.equivalence#conjugate-is-tilt applies Proposition 2.1 to X̂. The bound ℙ̂_k[E] < 1 is NOT supplied by the source; the extractor's observation that it would make Lemma 2.3 redundant, and that A = (1,…,1) is only excluded afterwards by clause (a), is retained as an ambiguity for the orchestrator (neither argument is supplied here; if the orchestrator prefers to keep this node at `> 0` only, then `#conjugate-is-tilt` must instead be marked DISPUTED because Proposition 2.1 is applied without its premise a_k < 1)
```
(SOURCE_HYPOTHESES, SOURCE_QUANTIFIERS, DEPS unchanged.)

### F11 thm-fixed-gf.equivalence#conjugate-is-tilt
```
SOURCE_HYPOTHESES: d ∈ ℕ; X is a subcritical, positive regular and non-singular d-type branching process with generating function f; X̂ is a conjugate branching process for X in the sense of Definition 1.1
SOURCE_QUANTIFIERS: d ∈ ℕ; X; X̂ conjugate for X; â_k := ℙ̂_k[E] for k ∈ {1,…,d}; A_k := 1/â_k (well defined by thm-fixed-gf.equivalence#conjugate-regularity)
SOURCE_CONCLUSION: A ∈ [1,∞)^d; the offspring laws of X̂ are the tilt of those of X by A as in display (2.2), equivalently those of X are the tilt of X̂ by â as in display (2.1); and f(A) = A
```

### F12 prop-single-type#mean-eq-derivative
```
SOURCE_HYPOTHESES: X single-type branching process started from a single individual with generating function f; (I) 𝔼[X(1)] < 1; (III) f is continuous from (0,∞] to (0,∞], with (0,∞] carrying the half-open-interval topology
SOURCE_QUANTIFIERS: X; ε the witness of prop-single-type#finite-near-one
SOURCE_CONCLUSION: 𝔼[X(1)] = f'(1), the derivative of f at 1 (f being finite on [1,1+ε]), and consequently f'(1) < 1
```

### F13 prop-single-type#f-below-diagonal
```
SOURCE_HYPOTHESES: X single-type branching process started from a single individual with generating function f; (I) 𝔼[X(1)] < 1
SOURCE_QUANTIFIERS: X; ∃ s > 1 (sufficiently close to 1)
SOURCE_CONCLUSION: there exists s > 1 with f(s) < s
```

### F14 prop-single-type#fixed-point-exists
```
SOURCE_HYPOTHESES: X single-type branching process started from a single individual with generating function f; (III) f is continuous from (0,∞] to (0,∞], with (0,∞] carrying the half-open-interval topology
SOURCE_QUANTIFIERS: X; s and t the witnesses of prop-single-type#f-below-diagonal and prop-single-type#f-above-diagonal (s < t); ∃ q̄ ∈ [s,t]
```
(SOURCE_CONCLUSION, DEPS, EDGE lines unchanged.)

### F15 prop-single-type#at-most-two-fixed-points
```
SOURCE_HYPOTHESES: X single-type branching process started from a single individual with generating function f; (II) ℙ[X(1) ≥ 2] > 0
SOURCE_QUANTIFIERS: X; q > 0; q̄ the fixed point of prop-single-type#fixed-point-exists
DEPS: prop-single-type#strict-convexity, prop-single-type#fixed-point-exists, eqn-generating-function
EDGE: prop-single-type#strict-convexity | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L354-L354 | 'Hence there are at most two values of q for which f(q) = q' follows from convexity on the finite interval
EDGE: prop-single-type#fixed-point-exists | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L354-L354 | identifies the second fixed point as q̄ ('namely 1 and q̄')
EDGE: eqn-generating-function | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L353-L354 | 'namely 1 and q̄': f(1) = 𝔼[1^{X(1)}] = 1 (the proof's 'Since f(1) = 1') shows that 1 is the other fixed point
```

### F16 prop-single-type.conjugate#hyps-imply-equivalence-hypotheses
```
DEPS: def:subcritical, eqn-mean-matrix, def-bp-basic.positive-regular, def-bp-basic.non-singular
EDGE: eqn-mean-matrix | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L346-L346 | 'subcritical, i.e. 𝔼[X(1)] < 1': for d = 1 the mean matrix is M_{1,1} = 𝔼[X(1)] by (1.3), so ρ = M_{1,1}
```
(add this EDGE line; the three existing EDGE lines stay.)

### F17 prop-single-type.conjugate#existence
```
SOURCE_HYPOTHESES: X single-type branching process started from a single individual satisfying (I)-(III) of Proposition 1.6
```
(SOURCE_QUANTIFIERS, SOURCE_CONCLUSION, DEPS unchanged: the equivalence's premises are discharged through the existing edge to `#hyps-imply-equivalence-hypotheses`.)

### F18 rem:hyp-iii-necessary#no-conjugate
```
SOURCE_HYPOTHESES: the single-type branching process with ℙ[X(1) = m] = a m^{-3} for m ≥ 1 and ℙ[X(1) = 0] = b, for the constants a, b > 0 of rem:hyp-iii-necessary#constants-and-hyp-I
```
(SOURCE_QUANTIFIERS, SOURCE_CONCLUSION, DEPS, EDGE unchanged: subcritical / positive regular / non-singular / f(q) ≠ q enter through the four existing edges.)

### F19 claim:branching-property
```
SOURCE_HYPOTHESES: d ∈ ℕ; X = {X(n)}_{n∈ℕ_0} is a d-type branching process (L176-177)
SOURCE_CONCLUSION: given X(n) = x, the process (X(n+m))_{m∈ℕ_0} is distributed as X started from x, and X started from x + y is the sum of independent copies started from x and from y
```
(DEPS `def:path-law, def:step-kernel` unchanged. The generating-function identity E_x[prod_j q_j^{X_j(m)}] = prod_k f_k^(m)(q)^{x_k} is the consequence of this node together with `eqn-gen-func-n`; it must not be stated here, otherwise this node would need an edge to `eqn-gen-func-n` and F4 would create a cycle.)

---

## 3. Coverage verdicts (records with EXTRACTOR: extractor-A/sonnet)

PASS inv:heading:L170
PASS inv:heading:L173
FAIL inv:L176:bp-setup: DISPOSITION lists `claim:branching-property` but REASON says the sentence is "split into the three frozen definition anchors" and does not justify the fourth node. Fix C1.
PASS inv:L179:extinction-event
PASS inv:cite:L179:jl-cond-on-ext
PASS inv:def-conjugate
PASS inv:L193:remark
PASS inv:cite:L194:Penisson-thesis
PASS inv:cite:L194:dallaporta2008q
PASS inv:cite:L194:harris1963theory
PASS inv:cite:L194:kolmogorov1938losung
PASS inv:cite:L194:lamperti1968conditioned
PASS inv:cite:L194:seneta1966quasi
PASS inv:cite:L194:yaglom1947certain.2
PASS inv:cite:L194:yaglom1947certain.3
PASS inv:cite:L194:yaglom1947certain.4
PASS inv:heading:L199
PASS inv:eqn-generating-function
PASS inv:L209:iterate-equivalence
PASS inv:eqn-gen-func-n
PASS inv:eqn-mean-matrix
PASS inv:L219:finite-mean
PASS inv:L220:mean-matrix-powers
PASS inv:L220:subcritical-def
PASS inv:cite:L222:an-branching-processes
PASS inv:def-bp-basic
FAIL inv:L229:pos-reg-matrix-equiv: REASON "not consumed by any root's proof" is false; L508 (`lem-gf-bded`, in the closure of `thm-fixed` and so of `thm-fixed-gf.fixed-point`) applies Perron-Frobenius to M, which needs M^N > 0, i.e. this clause. ADJUDICATION A1 excluded it only "if still unreachable"; it is reachable. Fix C2 (with F3).
PASS inv:L238:conjugate-iff-fixed-point
PASS inv:thm-fixed-gf
PASS inv:L252:hyp-i-necessary
PASS inv:L252:hyp-iii-automatic
PASS inv:L252:hyp-iii-necessary
FAIL inv:L265:counterexample-claims: the robustness, d = 3 seven-fixed-point and "arbitrarily large" claims (L262-L263) are said to be "not separately inventoried" and appear only inside a NODE item's REASON; spec §7 says to mark such claims `EXCLUDED` explicitly, and an item with `DISPOSITION: NODE` must not also carry unrecorded exclusions. Fix C3.
PASS inv:counterexample
PASS inv:prop-single-type
PASS inv:proof:prop-single-type
FAIL inv:heading:L359: SOURCE is only the heading line L359 but the REASON excludes "the outline body (L360-L377)"; the body (L360-L379: prose summary, the display of S_0, S_infinity at L366-L369, forward references to Lemmas 2.x, Theorem 3.1) is covered by no item. Fix C4.
FAIL inventory-completeness (slice A): L188 "By basic branching process theory, this is equivalent to the existence of a fixed point for the generating function which lies in (1,∞)^d" is a mathematical claim (an early statement of the L238 equivalence) with no inventory item. Fix C5.

---

## 4. Replacement fragments for coverage FAILs

### C1 inv:L176:bp-setup
```
REASON: the sentence introducing the d-type branching process X(n), the measures ℙ_k and expectations 𝔼_k is split into the three frozen definition anchors for population structure, one-generation mechanism and path law, plus the shared implicit branching/Markov-property node claim:branching-property used without statement by later proofs (ADJUDICATION B2)
```

### C2 inv:L229:pos-reg-matrix-equiv
```
DISPOSITION: NODE def-bp-basic.positive-regular#matrix-equiv
REASON: the clause 'which is equivalent to the condition that the matrix M^N has all positive entries' (L229) is consumed by the Perron-Frobenius application at L508 (lem-gf-bded#perron-frobenius); asserted without argument, so a SOURCE_GAP claim node (supersedes ADJUDICATION A1, whose condition 'if still unreachable' does not hold)
```

### C3 inv:L265:counterexample-claims (replace) and three new items
```
ITEM: inv:L265:counterexample-claims
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#counterexample@L262-L262
DISPOSITION: NODE counterexample, counterexample#hyp-I-subcritical, counterexample#hyp-II-regular, counterexample#hyp-III-continuous, counterexample#three-fixed-points
REASON: 'clearly satisfies the hypotheses of Theorem 1.4' and 'one can check that f(q) = q has three solutions in (1,∞)^2' are the root and its SOURCE_GAP steps (R4)
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:L262:robustness-claim
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#counterexample@L262-L262
DISPOSITION: EXCLUDED
REASON: 'this example is robust' (three fixed points persist under small perturbations) feeds no root (spec §7; Example 1.5 is anchored only as the concrete offspring law with at least three fixed points, R4)
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:L262:d3-seven-fixed-points
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#counterexample@L262-L262
DISPOSITION: EXCLUDED
REASON: 'a similar example where d = 3 and there are seven fixed points' is not in the anchored statement and feeds no root (spec §7)
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:L263:arbitrarily-many-fixed-points
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#counterexample@L263-L263
DISPOSITION: EXCLUDED
REASON: 'we expect that ... the number of fixed points can be arbitrarily large' is a stated expectation with no proof obligation and feeds no root (spec §7)
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
```

### C4 inv:heading:L359 (keep, reword) and one new item
```
ITEM: inv:heading:L359
KIND: heading
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#sec-outline@L359-L359
DISPOSITION: EXCLUDED
REASON: subsection heading 'Proof outline'; its body is the separate excluded item inv:outline:L360
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:outline:L360
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#sec-outline@L360-L379
DISPOSITION: EXCLUDED
REASON: §1.3 proof outline (spec §7): expository summary of §2 and §3; the display of S_0 and S_∞ (L366-L369) restates the basin definitions (2.9) (eqn-basin-def.zero/infty, L726-L729) and every lemma it cites (Lemmas 2.3, 2.16-2.19 and Theorem 3.1) has its own node in slices B-D; it supplies no hypothesis, step or edge for any root
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
```

### C5 new item (inventory completeness)
```
ITEM: inv:L188:equivalence-preview
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#equivalence-preview@L188-L188
DISPOSITION: NODE thm-fixed-gf.equivalence
REASON: 'By basic branching process theory, this is equivalent to the existence of a fixed point for the generating function which lies in (1,∞)^d' is the first informal statement of the equivalence of L238 (repeated at L249); same node, no separate obligation
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
```

---

## 5. Non-blocking advisories (no verdict change)

1. Definition-to-definition edges (`def:step-kernel -> def:population-sigma`, `def:path-law -> def:step-kernel`) are Lean-layering edges sanctioned by ADJUDICATION A1; they are not source-evident (L176-L177 says only "d-type branching process"), and EXTRACTION_SPEC §8 / ADJUDICATION B3 would otherwise forbid def-to-def edges. For consistency one could equally add `def:subcritical -> eqn-mean-matrix`, `def-conjugate -> def:extinction, def:path-law`. I did not fail either way; orchestrator should pick one policy.
2. `thm-fixed-gf.equivalence#conjugate-to-fixed-point` (and its edges to `lem-fixed-pos`, `def-conjugate`) is a faithful reconstruction of L437 plus clause (a). If F10 keeps `ℙ̂_k[E] < 1` in `#conjugate-regularity`, those two edges become redundant for the A = (1,…,1) exclusion; they are still defensible as the paper's own L437 pointer, so I left the node PASS.
3. `ext:taylor` states only the first-order (o(h)) Taylor expansion, which is all `prop-single-type#f-below-diagonal` needs. Slice B's `lem-gf-bded#taylor` consumes the same ID for an O(eps^2) remainder; that is a slice-B/orchestrator issue (the external's statement is weaker than B's use).
4. SOURCE_GAP flagging is not uniform: `prop-single-type#strict-convexity` (f'' > 0 "since ...") is flagged, while `#f-above-diagonal` ("By Hypothesis II ... t large") is not. Both are one-line routine claims; I left both as they are.
5. Coverage item ids `inv:cite:L194:yaglom1947certain.2/.3/.4` have no `.1`/unsuffixed sibling; the source has exactly three Yaglom citations (L194), so the three items are complete (numbering cosmetic). `inv:cite:L194:harris1963theory` also covers jirina1957asymptotic, joffe1967, mullikin1963 (one `\cite` command).
6. `counterexample#hyp-III-continuous`: no edge to `rem:hyp-iii-automatic` is correct (the source says only "clearly"); `thm-fixed-gf.conjugate`/`.equivalence`/`.fixed-point` edges to the §2 nodes (`prop-conjugate`, `lem-fixed-pos`, `prop-cond-on-ext.cond-law`, `thm-fixed`, `eqn-fixed-pt-equiv`) all exist and point in the correct direction; no AND/OR route issue in slice A (no alternative derivation is offered by the source; the `prop-single-type.conjugate#existence` alternative via `thm-fixed-gf.conjugate` is correctly not modeled).
7. Cross-slice check of Thm 1.4's three root parts: fixed-point part uses L548-L557 (+ L894-L905 through `thm-fixed`); conjugate part = fixed-point root + the L238/L249 equivalence; equivalence part = L238 pointer to Prop 2.2 (L420-L432) plus the L437 remark on Lemma 2.3 (L440-L472). Each of these cited §2 nodes exists; the only missing slice-A-to-§2 premise discharge is the Prop 2.1 premise `a_k < 1` (F10).

---

## 6. Source spans re-read

- paper.tex L150-L399 (entire slice A L170-L379 line by line, including L193-L196 remark, L203-L238, L241-L264, L343-L355, L359-L379; comment block L277-L339 skipped as non-source).
- paper.tex L38-L73 (theorem/equation counters: confirms display numbering (1.1)-(1.3), (2.1) = L398-L401, (2.2) = L423-L426; Remark 1.2 shares the theorem counter).
- paper.tex L399-L406 (Prop 2.1, premises 0 < a_k < 1), L420-L472 (Prop 2.2, L437 remark, Lemma 2.3 and proof), L474-L515 (Lemmas 2.4-2.5; Perron-Frobenius use at L508), L525-L557 (Def 2.6, (2.5), (2.6), Theorem 2.7), L626-L628 (extinction-probability-one claim), L884-L905 (proof of Theorem 2.7), L934.
- DEPGRAPH.md blocks: all 47 `extractor-A/sonnet` blocks (L22-L1311) and `claim:branching-property` (L5534-L5560); context blocks `prop-cond-on-ext.cond-law`, `thm-fixed`, `eqn-fixed-pt-equiv`, `lem-gf-bded`, `lem-gf-bded#perron-frobenius/finite-nbhd/jacobian/taylor/choose-eps` (for cross-slice edges).
- DEPGRAPH_COVERAGE.md: the 37 `extractor-A/sonnet` records; graph/INVENTORY.md, graph/inventory.json (slice A rows), graph/ADJUDICATION.md (A1-A5, B2, B3, C1), EXTRACTION_SPEC.md (all).
- Frozen declaration statements (identity only): the ten slice-A definition anchors, `theorem_1_4_fixedPoint`, `theorem_1_4_conjugate`, `exists_conjugate_iff_exists_fixedPoint`, `proposition_1_6_fixedPoint`, `proposition_1_6_conjugate`, `example_1_5`, `remark_hypIII_necessary`, `remark_hypIII_automatic`. Source-statement fields of every slice-A root were reconstructed from the raw LaTeX and compared with these statements: hypotheses, quantifier order and conclusions agree for all 18 anchors owned by slice A (10 definitions, 8 roots; the only defect is the wrong display number in `def:population-sigma`'s conclusion; the Lean `IsSubcritical` bundling of finiteness, `IsPositiveRegular` with N ≥ 1, `example_1_5` "at least three", `proposition_1_6_*` with q ∈ (1,∞) match the recorded R1/R4/R5/E7 readings).
