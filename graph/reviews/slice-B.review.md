# Slice B topology review (L380-L721)

REVIEWER: reviewer-B/sonnet
SCOPE: all 52 node blocks with `EXTRACTOR: extractor-B/sonnet` in `DEPGRAPH.md`; all 37 coverage records with `EXTRACTOR: extractor-B/sonnet` in `DEPGRAPH_COVERAGE.md`; plus missing inventory items found in L380-L721.
METHOD: independent reconstruction of SOURCE_HYPOTHESES / SOURCE_QUANTIFIERS / SOURCE_CONCLUSION / CONSTANT_SCOPE from the raw statement; edge-by-edge check of every DEPS/EDGE (direction, directness, AND/OR, consumer locator); discharge of conditional premises at each consumer; mechanical checks (EDGE set == DEPS set for every node, CONTRACT_ID = `paper.<id>`, FROZEN_* = `-` for non-anchors, anchor fields equal to EXTRACTION_SPEC section 8, every slice-B node reachable from a root, no dangling IDs). `proof_depgraph.py --check` was run read-only and printed nothing. No file was edited except this report.

TOTALS: nodes 52 = 44 PASS + 8 FAIL. Coverage records 37 = 36 PASS + 1 FAIL. Missing inventory items: 2 FAIL (+1 advisory).

Severity tags: MAJOR = source-statement field or edge/topology wrong; MINOR = NOTE/tagging/documentation only.

Policy used for FAIL on gaps: a gap is failed when the record itself relies on a bridge or an undischarged premise of a cited lemma that the source does not supply and the NOTE does not carry the `SOURCE_GAP:` tag (so the dashboard would not list it), or when the NOTE contradicts the DEPS. I did not supply any omitted argument; fixes only re-tag.

---------------------------------------------------------------------------
## 1. Node verdicts

### External leaves

PASS ext:an72-v3-thm2 | spans re-read L390-L406 (first paragraph L395; citation L405; R6 split in spec section 3)
PASS ext:jl08-thm1 | spans re-read L397-L406 (display (2.1) L398-L401; citation L405)
PASS ext:fatou | spans re-read L447-L459 (Fatou invoked by name L451)
PASS ext:holder | spans re-read L629-L636 (exponents 1/r, 1/(1-r), r in (0,1), L631-L633)
PASS ext:vitali | spans re-read L629-L636 (invoked L635)
PASS ext:perron-frobenius | spans re-read L507-L515 (invoked L508)

### Proposition 2.1 / 2.2 (roots) and proof steps

PASS prop-cond-on-ext.cond-law | spans re-read L390-L406 (statement L390-L403, proof L404-L406), L172-L180 context; frozen file `Conjugate/Frozen/Proposition_2_1_CondLaw.lean` read for statement identity only. Hypotheses (positive regular, non-singular, `0 < a_k < 1`), quantifier order (k, then every bounded measurable F) and conclusion (2.1) match; no first-paragraph conclusion is smuggled into hypotheses; R6 exclusions respected. Anchor fields equal spec section 8. Advisory A-1 (AN edge).
PASS prop-conjugate | spans re-read L420-L432, frozen file `Conjugate/Frozen/Proposition_2_2.lean` (statement identity only). Hypotheses (positive regular, non-singular, certain extinction from any state, `A in [1,inf)^d`, `f(A) = A`), the existence-of-offspring-law clause, the `1/A_k` extinction probability and the conditional-law identification all match. DEPS (offspring-law, ext-prob-hat, cond-law-hat) are direct and complete: abs-continuity, hat-pos-reg-nonsing and hat-fixed-point are consumed by ext-prob-hat/cond-law-hat, not by the root.
PASS prop-conjugate#offspring-law | spans re-read L423-L426, L430
PASS prop-conjugate#abs-continuity | spans re-read L430. Correctly a SOURCE_GAP step (clause asserted without argument); sole edge to offspring-law is the only thing the source supplies.
PASS prop-conjugate#hat-pos-reg-nonsing | spans re-read L430, L224-L234 (Definition 1.3 as consumed by the edges)
PASS prop-conjugate#hat-fixed-point | spans re-read L431, L423-L426
FAIL prop-conjugate#ext-prob-hat: MINOR. Prop 2.1(a) (L395) only says the fixed points of f-hat in [0,1]^d are the extinction vector and (1,...,1), so L431 identifies 1/A with the extinction vector only when 1/A != (1,...,1). The case A = (1,...,1) is a case split the source does not treat; the NOTE says it is "not spelled out" but does not carry `SOURCE_GAP:`, while the sibling node prop-conjugate#cond-law-hat does tag the same case. Edges and fields are otherwise correct (an72, hat-fixed-point, hat-pos-reg-nonsing all direct). spans re-read L395, L421, L430-L431.
  REPLACEMENT (replace NOTE line only):
  NOTE: SOURCE_GAP: Proposition 2.1(a) identifies the extinction vector of X-hat with 1/A only if 1/A != (1,...,1) (the fixed points in [0,1]^d are the extinction vector and (1,...,1)). The case A = (1,...,1) (so 1/A = (1,...,1), X-hat has the offspring laws of X, and the extinction vector is (1,...,1) by the extinction hypothesis) is not treated in the source. Source sentence: 'By Proposition 2.1, it follows that 1/A is the vector of extinction probabilities for X-hat' (L431). Uses part (a) of Proposition 2.1 (L395, external).
PASS prop-conjugate#cond-law-hat | spans re-read L431, L437, L395-L402. SOURCE_GAP tag is correct and complete (0 < a_k < 1 unverified; A = (1,...,1) untreated). The edge to lem-fixed-pos has no citation in the proof of Prop 2.2; its only source evidence is the L437 remark ("Our next lemma implies in particular ..."). That is source-supported, flagged, and not silently filled. Premises of Prop 2.1 (second paragraph) at this consumer: positive regular/non-singular supplied by hat-pos-reg-nonsing, a = 1/A by ext-prob-hat, 0 < a_k < 1 by lem-fixed-pos (gap-tagged). See missing coverage item inv:L437:fixed-pos-remark.

### Lemma 2.3

PASS lem-fixed-pos | spans re-read L440-L472, L437
PASS lem-fixed-pos#geq-one | spans re-read L449-L459 (Fatou step; extinction a.s. limit; f^(n)(q) = q)
PASS lem-fixed-pos#pos-reg-strict | spans re-read L461-L471

### Lemma 2.4

PASS lem-gf-pos | spans re-read L477-L494. N introduced before k, j: CONSTANT_SCOPE correct. Not under the L528 setting (L477 < L528): correct.
PASS lem-gf-pos#choose-N0-k0 | spans re-read L489-L493
FAIL lem-gf-pos#two-individuals: MINOR. NOTE contradicts DEPS: it says "no canonical node exists for it, so the edge goes to the frozen path-law definition", but after merge (ADJUDICATION B2) the edge goes to `claim:branching-property`. Topology, fields and edge locators are correct. spans re-read L493.
  REPLACEMENT (replace NOTE line only):
  NOTE: The Markov (branching) property is used implicitly in 'Conditional on this' (L493); it is modeled by the shared node claim:branching-property. The positive probability of a type-k_0 individual in generation N_0 comes from positive regularity (lem-gf-pos#choose-N0-k0).
PASS lem-gf-pos#kj-descendants | spans re-read L493 (independence of the two descendant lines and use of positivity for each are via claim:branching-property and choose-N0-k0, both direct edges)

### Lemma 2.5

PASS lem-gf-bded | spans re-read L500-L515. Hypotheses = hypotheses of Theorem 1.4 (I-III, Hyp III read for k in {1,...,d} by E1), `q^0` is existential after X only. Advisory A-2 (locator "(L528)" in prose should be "(L501)"; content identical).
PASS lem-gf-bded#perron-frobenius | spans re-read L507-L509, L219-L229 context. Edges to claim:mean-matrix-powers and def-bp-basic.positive-regular reconstruct the L229 equivalence; see cross-slice note X-1.
PASS lem-gf-bded#finite-nbhd | spans re-read L510
PASS lem-gf-bded#jacobian | spans re-read L510-L512. SOURCE_GAP correct (Jacobian and second-order regularity asserted).
PASS lem-gf-bded#taylor | spans re-read L510-L513
PASS lem-gf-bded#choose-eps | spans re-read L512-L514

### Definition 2.6, displays (2.5)-(2.6), Definition 2.8

PASS def-log-gf | spans re-read L533-L546, frozen file `Conjugate/Frozen/Defs/LogGenFun.lean` (statement identity only). Domain `(-inf,inf]^d`, `g_k(lambda) = log f_k(e^lambda)`, iterates as composition: match; (2.5) correctly excluded from the conclusion. Anchor fields equal spec section 8.
PASS eqn-convex-func-n | spans re-read L533-L546 (display L541-L545)
PASS eqn-fixed-pt-equiv | spans re-read L548-L553
PASS def-componentwise | spans re-read L584-L589

### Lemma 2.9

FAIL lem-mono: MAJOR (source-statement field). CONSTANT_SCOPE is an unresolved placeholder ("orchestrator to fix the reading") and mixes a proof fact (the proof's N is the positivity time depending only on X) into a field that must record what the statement permits. The statement reads "Let lambda, eta ... such that lambda <= eta. Then ... Moreover, there exists N such that ...": N is introduced after lambda, eta, so it may depend on X, lambda, eta. The other three source fields and DEPS/EDGE are correct. spans re-read L594-L604.
  REPLACEMENT (replace CONSTANT_SCOPE and NOTE lines):
  CONSTANT_SCOPE: N is introduced after lambda and eta ('Let lambda, eta ... Moreover, there exists N such that ...'), so the statement lets N depend on X, lambda and eta (not on k or n)
  NOTE: Consumed at L646 (this slice), L689/L676 (lem-monotone-lim), L772/L799 (slice C), L1054 (slice D). Values g_k^{(n)} lie in [0,inf] (g^{(n)}(0) = 0 since f(1) = 1). The proof's N is the positive-regularity time of lem-mono#positivity-all-n and depends only on X; that uniform reading is stronger than the statement and is recorded for Lean planning only (ADJUDICATION B4).
FAIL lem-mono#positivity-all-n: MINOR. NOTE contradicts DEPS (says the edge goes to the frozen path-law definition; DEPS correctly use claim:branching-property). spans re-read L602.
  REPLACEMENT (replace NOTE line only):
  NOTE: The Markov property is invoked by name in the source ('From this and the Markov property of the branching process', L602); it is modeled by the shared node claim:branching-property.
PASS lem-mono#strict-ineq | spans re-read L602-L603. Statement asks `|g^{(n)}(eta)| < inf` (all components) while the proof only needs `g_k^{(n)}(eta)` finite: stronger hypothesis than the proof, which is the safe direction and is noted.

### Lemma 2.11

PASS lem-unstable-scaled | spans re-read L617-L636
PASS lem-unstable-scaled#extinction-as | spans re-read L628, L185 (Def 1.1). SOURCE_GAP correct; edge to claim:subcritical-extinction is the shared unproved step.
FAIL lem-unstable-scaled#holder-bound: MINOR. Hoelder with exponents 1/r and 1/(1-r) needs r in (0,1), but the lemma (and lem-unstable-scaled#vitali, which depends on this node) covers r in [0,1). The r = 0 case is a case split the source skips; the NOTE records it ("not discussed in the source") without `SOURCE_GAP:`. spans re-read L621, L624-L636.
  REPLACEMENT (replace NOTE line only):
  NOTE: SOURCE_GAP: Holder needs r > 0 (exponent 1/r) while Lemma 2.11 is stated for r in [0,1); the case r = 0 (Z_n = 1, g^{(n)}(0) = 0) is not discussed in the source, so lem-unstable-scaled#vitali obtains its conclusion from the source text only for r in (0,1).
PASS lem-unstable-scaled#vitali | spans re-read L624-L636. Four direct edges (Vitali, Holder bound, a.s. extinction, (2.5)); the integrability/uniform-integrability step is part of the application as noted. Covered by the r = 0 tag on holder-bound.

### Proposition 2.10

PASS prop-unstable | spans re-read L606-L615, L640-L649
PASS prop-unstable#strict-case | spans re-read L641-L643. The edge to lem-mono is a logical consumption (monotone domination `eta <= r lambda`) of an earlier lemma rather than a missing substantive bridge; locator L642-L643 is the consumer's own proof. No tag needed.
FAIL prop-unstable#part-i: MINOR. L646 applies the strict-case paragraph to the pair (g^{(N)}(eta), g^{(N)}(lambda)) and the strict clause of Lemma 2.9 at the single time N. The premises that the application never supplies (a conditional-premise discharge failure): the strict clause of Lemma 2.9 requires `|g^{(N)}(lambda)| < inf` (lambda is the larger argument here), and the first paragraph requires `g^{(N)}(lambda)` in `[0,inf)^d \ {0}`. The NOTE says the side conditions are "stated only partially" but does not tag a gap. spans re-read L608-L615, L645-L647.
  REPLACEMENT (replace NOTE line only):
  NOTE: SOURCE_GAP: premises of the two cited results are not discharged at L646: the strict clause of Lemma 2.9 holds only for n >= N with |g^{(n)}(lambda)| < inf (lambda is the larger argument), so N has to be chosen with g^{(N)}(lambda) finite, and the first paragraph needs g^{(N)}(lambda) in [0,inf)^d \ {0} and limsup_n |g^{(n)}(g^{(N)}(lambda))| < inf (stated by the source). Source writes 'limsup_n |g^{(n)}(eta)| = 0' at L646 for the conclusion of (i); read as lim (typo; limsup = 0 is equivalent to lim = 0 for nonnegative quantities).
PASS prop-unstable#part-ii | spans re-read L612-L614, L648. The edge to part-i (role swap) is the only dependency the source gives.

### Lemma 2.12

PASS lem-unstable-ssl | spans re-read L653-L664
PASS lem-unstable-ssl#skeleton-hypotheses | spans re-read L662-L663. SOURCE_GAP correct; no DEPS correct (source supplies no argument). Advisory A-3 (conclusion already unpacks (III) as continuity of f^{(m)}; harmless).
PASS lem-unstable-ssl#skeleton-gf | spans re-read L663, L540-L545
PASS lem-unstable-ssl#apply-prop-unstable | spans re-read L662-L664. Premise discharge at the consumer is complete: Prop 2.10's setting for X-tilde by skeleton-hypotheses, translation g-tilde^{(r)} = g^{(rm)} by skeleton-gf.

### Lemma 2.13

PASS lem-monotone-lim | spans re-read L669-L694
FAIL lem-monotone-lim#shifted-mono: MINOR. The strict clause of Lemma 2.9 is conditional on `|g^{(n)}(eta)| < inf` (here eta is lambda, so on `|g^{(n)}(lambda)| < inf`). L680 asserts "strict if n is sufficiently large" without showing that this finiteness holds for large n (conditional premise never supplied). The NOTE calls this a "minor omission (not a gap node)". spans re-read L594-L598, L675-L680.
  REPLACEMENT (replace NOTE line only):
  NOTE: SOURCE_GAP (minor): the strict clause of Lemma 2.9 holds only for n >= N with |g^{(n)}(lambda)| < inf (lambda is the larger argument); the source asserts 'strict if n is sufficiently large' (L680) without showing that this finiteness proviso holds for all large n.
PASS lem-monotone-lim#limits-exist | spans re-read L681-L685
PASS lem-monotone-lim#limit-fixed | spans re-read L688-L689. SOURCE_GAP correct (continuity of g^{(m)}); no edge to the later slice-C continuity node is right because the source does not cite it at L689 (see X-5).
FAIL lem-monotone-lim#limits-zero: MINOR. L690 applies Lemma 2.12(ii) with lambda := lambda-bar^s and eta := g^{(s)}(lambda). Its premises `lambda-bar^s` in `[0,inf)^d \ {0}` and `eta` in `[0,inf)^d` (finiteness of `g^{(s)}(lambda)`, `0 <= s < m`) are never supplied, and `lambda-bar^s < g^{(s)}(lambda)` is obtained in one clause from the large-n strictness of (2.7). The NOTE has no gap tag. Edges (limits-exist, limit-fixed, shifted-mono, lem-unstable-ssl, def-componentwise) are all direct and correctly located. spans re-read L669-L673, L687-L691.
  REPLACEMENT (replace NOTE line only):
  NOTE: SOURCE_GAP (minor): Lemma 2.12(ii) is applied at L690 with lambda := lambda-bar^s and eta := g^{(s)}(lambda), but its premises (lambda-bar^s in [0,inf)^d \ {0}, eta in [0,inf)^d, i.e. finiteness of g^{(s)}(lambda) for s in {0,...,m-1}) are not discharged in the source; lambda-bar^s < g^{(s)}(lambda) is asserted in one clause from the large-n strictness of (2.7). Proof by contradiction for the first assertion; the m subsequences s = 0,...,m-1 are combined to conclude convergence of the full sequence (routine).
PASS lem-monotone-lim#part-b | spans re-read L672, L693. SOURCE_GAP faithful; DEPS (lem-mono, lem-unstable-ssl, def-componentwise) are the extractor's reading of "similarly" and are labelled as such; no alternative route in the source.

---------------------------------------------------------------------------
## 2. Coverage verdicts (37 records)

PASS inv:heading:L380 | spans re-read L380-L381
PASS inv:heading:L384 | spans re-read L384-L387
PASS inv:prop-cond-on-ext | spans re-read L390-L403. The "Moreover ... subcritical" clause (L402) is not modeled and is explained in REASON (consumed by no root, spec R6/section 7); consistent with how slice A's inv:L265 was accepted. Advisory A-4 (could be split into an EXCLUDED sub-item).
PASS inv:eqn-cond-on-ext | spans re-read L398-L401
PASS inv:proof:prop-cond-on-ext | spans re-read L404-L406
PASS inv:cite:L405:an-branching-processes | spans re-read L405
PASS inv:cite:L405:jl-cond-on-ext | spans re-read L405
PASS inv:prop-conjugate | spans re-read L420-L428
PASS inv:eqn-conjugate-def | spans re-read L423-L426
PASS inv:proof:prop-conjugate | spans re-read L429-L432
PASS inv:lem-fixed-pos | spans re-read L440-L446
PASS inv:eqn-fixed-pos-geq | spans re-read L442-L459
PASS inv:proof:lem-fixed-pos | spans re-read L447-L472
PASS inv:lem-gf-pos | spans re-read L477-L487
PASS inv:eqn-gf-pos | spans re-read L479-L486
PASS inv:proof:lem-gf-pos | spans re-read L488-L494
PASS inv:lem-gf-bded | spans re-read L500-L506
PASS inv:proof:lem-gf-bded | spans re-read L507-L515
PASS inv:heading:L525 | spans re-read L525-L531. Standing sentence L528 is carried in SOURCE_HYPOTHESES per spec section 4; see advisory A-5 (own item recommended).
PASS inv:def-log-gf | spans re-read L533-L546
PASS inv:eqn-convex-func-n | spans re-read L540-L545
PASS inv:eqn-fixed-pt-equiv | spans re-read L548-L553
FAIL inv:thm-fixed: MINOR. REASON still carries an unresolved reviewer-directed instruction ("this packet defines no block for it. Orchestrator: confirm slice C's packet covers it."). The node `thm-fixed` exists (slice C, STATEMENT_SOURCE L555-L557, PROOF_SOURCE L894-L905); the disposition is right. spans re-read L553-L557.
  REPLACEMENT (replace REASON line only):
  REASON: Theorem 2.7: the statement (L555-L557) lies in slice-B lines, but the root node thm-fixed is owned by slice C per spec section 9 (statement L555-L557, proof L894-L905); slice B defines no block for it.
PASS inv:L560:g-convex | spans re-read L559-L560 (and ignored comment L562-L582)
PASS inv:def-componentwise | spans re-read L584-L589
PASS inv:lem-mono | spans re-read L594-L598
PASS inv:proof:lem-mono | spans re-read L599-L604
PASS inv:prop-unstable | spans re-read L606-L615
PASS inv:lem-unstable-scaled | spans re-read L617-L622
PASS inv:proof:lem-unstable-scaled | spans re-read L623-L636
PASS inv:proof:prop-unstable | spans re-read L640-L649
PASS inv:lem-unstable-ssl | spans re-read L651-L661
PASS inv:proof:lem-unstable-ssl | spans re-read L662-L664
PASS inv:lem-monotone-lim | spans re-read L667-L673
PASS inv:proof:lem-monotone-lim | spans re-read L674-L694 (comment block L696-L715 ignored)
PASS inv:eqn-shifted-mono | spans re-read L675-L680
PASS inv:eqn-mono-ssl | spans re-read L681-L685

### Missing coverage items (source units in L380-L721 with no inventory item)

FAIL (missing) inv:L437:fixed-pos-remark: the sentence at L437 ("Our next lemma implies in particular that in the setting of Proposition 2.2, the fixed point A must either be equal to (1,...,1) or be in (1,inf)^d") is the only source evidence for the edge prop-conjugate#cond-law-hat -> lem-fixed-pos and for the SOURCE_GAP on that node, but it has no inventory item. It is not inside any inventoried proof region (L429-L432 ends before it).
  ADD:
  ITEM: inv:L437:fixed-pos-remark
  KIND: claim
  SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#fixed-pos-remark@L437-L437
  DISPOSITION: NODE lem-fixed-pos, prop-conjugate#cond-law-hat
  REASON: Remark that Lemma 2.3 implies that in the setting of Proposition 2.2 the fixed point A is either (1,...,1) or in (1,inf)^d. It is the only source evidence for the edge prop-conjugate#cond-law-hat -> lem-fixed-pos, which the proof of Proposition 2.2 (L431) does not cite; the unverified hypothesis 0 < a_k < 1 of Proposition 2.1 is recorded as a SOURCE_GAP on prop-conjugate#cond-law-hat.
  COVERAGE_STATUS: PROPOSED
  EXTRACTOR: extractor-B/sonnet
  REVIEWER: -
FAIL (missing) inv:L553:thm-equivalence: the sentence at L553 ("Therefore, Theorem 1.4 is equivalent to the following statement") is a claim in slice-B lines that is consumed by the slice-A node thm-fixed-gf.fixed-point#reduce-to-thm-2-7 (its EDGE cites L548-L557) but has no inventory item in either slice (inv:eqn-fixed-pt-equiv covers only the display (2.6)).
  ADD:
  ITEM: inv:L553:thm-equivalence
  KIND: claim
  SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-equivalence-reduction@L553-L553
  DISPOSITION: NODE thm-fixed-gf.fixed-point#reduce-to-thm-2-7, eqn-fixed-pt-equiv
  REASON: The reduction of Theorem 1.4 to Theorem 2.7 through (2.6); the node is owned by slice A (root thm-fixed-gf.fixed-point), the display (2.6) by slice B.
  COVERAGE_STATUS: PROPOSED
  EXTRACTOR: extractor-B/sonnet
  REVIEWER: -

---------------------------------------------------------------------------
## 3. Cross-slice findings and advisories (no FAIL issued on slice-B records for these)

X-1 (slice A coverage, inv:L229:pos-reg-matrix-equiv). It is EXCLUDED with the reason "not consumed by any root's proof", but its content (positive regular iff `M^N` has all entries positive, L229) is what the Perron-Frobenius application at L508 needs; slice B reconstructs it through lem-gf-bded#perron-frobenius -> {claim:mean-matrix-powers, def-bp-basic.positive-regular}. The disposition is acceptable; the REASON is factually wrong. Suggested replacement REASON for inv:L229: "Not a standalone node: its content ((M^N)_kj = E_k[X_j(N)] > 0 iff P_k[X_j(N) >= 1] > 0) is consumed in lem-gf-bded#perron-frobenius through its edges to claim:mean-matrix-powers and def-bp-basic.positive-regular."
X-2 Cross-slice consumers of slice-B nodes checked: thm-fixed-pt-infty#positivity -> lem-fixed-pos#pos-reg-strict is supported by L1178 ("an argument similar to ... the second paragraph of the proof of Lemma 2.3"); thm-fixed#positivity -> lem-fixed-pos (L904) and lem-gf-pos/lem-gf-bded/lem-mono/lem-monotone-lim/prop-unstable consumers are consistent with the cited lines. No dangling or unreachable slice-B node.
X-3 ext:taylor (slice A block) states the first-order expansion `o(h)`; lem-gf-bded#taylor concludes `O(eps^2)`. The difference is exposed as SOURCE_GAP on lem-gf-bded#jacobian ("second-order regularity ... not supplied"); no further edit.
X-4 AND/OR audit of slice B: no alternative derivations occur in L380-L721 (the "either ... or" in Lemma 2.3 and the "more generally" case in Prop 2.10 are conclusions/cases, correctly modeled as conjunctive steps); no ROUTES needed.
X-5 lem-monotone-lim#limit-fixed needs continuity of `g^{(m)}`, which the source proves only later (L814, slice C). Not adding an edge is correct (the source does not cite it at L689; adding one would invent a dependency), and the gap tag is right.
A-1 prop-cond-on-ext.cond-law -> ext:an72-v3-thm2: the proof says AN is cited "for the properties of a" (L405), while the root is the conditional-law paragraph only; the edge records the proof's own citation (ADJUDICATION B5) and is acceptable, but its rationale ("so that (2.1) defines probability laws") is the extractor's inference.
A-2 lem-gf-bded and its four step nodes cite "Theorem 1.4 setting (L528)" in SOURCE_HYPOTHESES; Lemma 2.5 (L500-L501) precedes L528 and says "Assume the hypotheses of Theorem 1.4". Content is the same; the locator in prose should read "(L501)".
A-3 lem-unstable-ssl#skeleton-hypotheses states in SOURCE_CONCLUSION that the generating function of X-tilde is `f^{(m)}`; the source only says "satisfies the hypotheses of Theorem 1.4". Harmless unpacking of Hypothesis III but not source-stated; consider trimming.
A-4 inv:prop-cond-on-ext folds the unmodeled "Moreover ... subcritical" clause into REASON; optionally split into `inv:L402:cond-on-ext-subcritical` (EXCLUDED, spec R6, no root consumes it).
A-5 Optional new inventory item for the standing sentence: `ITEM: inv:L528:standing-setting | KIND: assumption | SOURCE: ...#standing-setting@L528-L528 | DISPOSITION: EXCLUDED | REASON: local hypothesis package (spec section 4), not an assumption node; recorded in SOURCE_HYPOTHESES of every consuming node after L528 (lem-mono, lem-unstable-scaled, prop-unstable, lem-unstable-ssl, lem-monotone-lim and their steps); definitions and displays (2.5), (2.6), Def 2.8 need none of Hypotheses I-III`.
A-6 The labeled enumerate items `item-unstable-zero` (L611), `item-unstable-infty` (L613), `item-unstable-zero-ssl` (L657), `item-unstable-infty-ssl` (L659) are referenced at L647, L648, L690 but are covered only inside inv:prop-unstable / inv:lem-unstable-ssl; acceptable.
A-7 Stale merge text: ext:fatou NOTE ("may also be defined by other slices (dedupe in merge)"), ext:holder and ext:vitali NOTEs ("may be duplicated in other slices"), "(see report)" in lem-gf-bded#perron-frobenius. Cosmetic only.
A-8 ID choice: (2.3), (2.7), (2.8) carry source labels (`eqn-fixed-pos-geq`, `eqn-shifted-mono`, `eqn-mono-ssl`) but are modeled under `parent#slug` step IDs; the skill prefers source labels, but the spec uses `parent#slug` for proof steps and the coverage items map the labels correctly, so no FAIL.
A-9 Frozen-anchor identity: for prop-cond-on-ext.cond-law, prop-conjugate and def-log-gf the FROZEN_FILE, FROZEN_DECL, FROZEN_ANCHOR_ID, FROZEN_ABI_SHA256, CONTRACT_ID/VERSION equal EXTRACTION_SPEC section 8; the three declaration files' statements are consistent with the node source fields (cond-law: 0 < a_k < 1, conditional law equals law of offspring family from (2.1); Prop 2.2: `1 <= A_j < inf`, `genFun mu A = A`, certain extinction; logGenFun: `log (genFun mu (exp x) k)`). Non-anchor slice-B nodes all have `FROZEN_* : -`, `CONTRACT_ID = paper.<id>`, `CONTRACT_VERSION: 1`, `LEAN_STATUS: NOT_STARTED` (`EXTERNAL` for the six external leaves).

---------------------------------------------------------------------------
## 4. Source spans re-read

- Corpus `source/arxiv-2411.06301v2/fixed-pt-finite-type.tex`: L170-L282 (setting, Defs 1.1/1.3, Thm 1.4, Ex 1.5), L370-L729 (entire slice B L380-L721 plus the first lines of section 2.3; comment blocks L407-L415, L562-L582, L696-L715 read and ignored per spec), L1170-L1182 (slice-D consumer of Lemma 2.3).
- Repository records read: `graph/EXTRACTION_SPEC.md`; `DEPGRAPH.md` L1-L80 header and all 52 extractor-B blocks (L1313-L2760) plus the context blocks eqn-gen-func-n, claim:mean-matrix-powers, claim:subcritical-extinction, claim:branching-property, thm-fixed, thm-fixed#positivity, eqn-basin-def.zero/.infty; `DEPGRAPH_COVERAGE.md` L335-L680; `graph/INVENTORY.md`, `graph/inventory.json` (slice B) and `graph/ADJUDICATION.md` (orchestrator log, read after the raw-source pass; no verdict above depends on it).
- Lean: only the three declaration files named in the anchor table for slice-B anchors (`Conjugate/Frozen/Proposition_2_1_CondLaw.lean`, `Conjugate/Frozen/Proposition_2_2.lean`, `Conjugate/Frozen/Defs/LogGenFun.lean`), read for statement identity only (the files were printed whole, including the frozen placeholder body, but only the declared statements were used); no axiom or Lean status was consulted and no other Lean file was opened.
