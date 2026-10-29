# Proof-source coverage manifest — arXiv:2411.06301v2

CORPUS: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex sha256:b0fb466bfd59b1fd0e03757eddca48f8e67aa194a43b66880d2caeb677061670

Every theorem-like source unit, definition, reused display, citation, and candidate substantive proof paragraph receives exactly one disposition.

## Inventory

ITEM: inv:heading:L170
KIND: heading
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#sec-intro@L170-L170
DISPOSITION: EXCLUDED
REASON: section heading 'Introduction'; no mathematical statement or proof content
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet

ITEM: inv:heading:L173
KIND: heading
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#sec-overview@L173-L173
DISPOSITION: EXCLUDED
REASON: subsection heading 'Overview'; no mathematical statement or proof content
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet

ITEM: inv:L176:bp-setup
KIND: definition
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#bp-setup@L176-L177
DISPOSITION: NODE def:population-sigma, def:step-kernel, def:path-law, claim:branching-property
REASON: the sentence introducing the d-type branching process X(n), the measures ℙ_k and expectations 𝔼_k is split into the three frozen definition anchors for population structure, one-generation mechanism and path law, plus the shared implicit branching/Markov-property node claim:branching-property used without statement by later proofs (ADJUDICATION B2)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: queue-reviewer/sonnet

ITEM: inv:L179:extinction-event
KIND: definition
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#extinction-event@L179-L179
DISPOSITION: NODE def:extinction
REASON: defines the extinction event E; the classical conditioning fact restated in the same sentence is Proposition 2.1 (slice B node prop-cond-on-ext.cond-law, R6) and is not duplicated in slice A
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet

ITEM: inv:cite:L179:jl-cond-on-ext
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#extinction-event@L179-L179
DISPOSITION: EXCLUDED
REASON: expository pointer ('for a more general result') in the overview; no slice-A proof consumes the cited theorem, whose use is in the proof of Proposition 2.1 (L405, slice B, ext:jl08-thm1)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet

ITEM: inv:def-conjugate
KIND: definition
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#def-conjugate@L184-L187
DISPOSITION: NODE def-conjugate
REASON: Definition 1.1 is the frozen definition anchor; consumed by the direction steps of thm-fixed-gf.equivalence
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet

ITEM: inv:L193:remark
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#remark-other-conditioning@L193-L196
DISPOSITION: EXCLUDED
REASON: literature remark on other ways to condition on non-extinction (spec §7: expository, no proof obligation for any root)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet

ITEM: inv:cite:L194:Penisson-thesis
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#remark-other-conditioning@L194-L194
DISPOSITION: EXCLUDED
REASON: citation inside the expository remark L193-L196 (spec §7); not invoked by any proof
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet

ITEM: inv:cite:L194:dallaporta2008q
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#remark-other-conditioning@L194-L194
DISPOSITION: EXCLUDED
REASON: citation inside the expository remark L193-L196 (spec §7); not invoked by any proof
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet

ITEM: inv:cite:L194:harris1963theory
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#remark-other-conditioning@L194-L194
DISPOSITION: EXCLUDED
REASON: citation inside the expository remark L193-L196 (spec §7); not invoked by any proof
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet

ITEM: inv:cite:L194:kolmogorov1938losung
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#remark-other-conditioning@L194-L194
DISPOSITION: EXCLUDED
REASON: citation inside the expository remark L193-L196 (spec §7); not invoked by any proof
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet

ITEM: inv:cite:L194:lamperti1968conditioned
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#remark-other-conditioning@L194-L194
DISPOSITION: EXCLUDED
REASON: citation inside the expository remark L193-L196 (spec §7); not invoked by any proof
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet

ITEM: inv:cite:L194:seneta1966quasi
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#remark-other-conditioning@L194-L194
DISPOSITION: EXCLUDED
REASON: citation inside the expository remark L193-L196 (spec §7); not invoked by any proof
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet

ITEM: inv:cite:L194:yaglom1947certain.2
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#remark-other-conditioning@L194-L194
DISPOSITION: EXCLUDED
REASON: citation inside the expository remark L193-L196 (spec §7); not invoked by any proof
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet

ITEM: inv:cite:L194:yaglom1947certain.3
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#remark-other-conditioning@L194-L194
DISPOSITION: EXCLUDED
REASON: citation inside the expository remark L193-L196 (spec §7); not invoked by any proof
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet

ITEM: inv:cite:L194:yaglom1947certain.4
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#remark-other-conditioning@L194-L194
DISPOSITION: EXCLUDED
REASON: citation inside the expository remark L193-L196 (spec §7); not invoked by any proof
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet

ITEM: inv:heading:L199
KIND: heading
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#sec-result@L199-L199
DISPOSITION: EXCLUDED
REASON: subsection heading 'Main result'; no mathematical statement or proof content
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet

ITEM: inv:eqn-generating-function
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-generating-function@L205-L205
DISPOSITION: NODE eqn-generating-function
REASON: display (1.1) is the frozen definition anchor of the generating function f (with the ∞ conventions of L208)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet

ITEM: inv:L209:iterate-equivalence
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-gen-func-n@L209-L213
DISPOSITION: NODE eqn-gen-func-n
REASON: the 'Equivalently' sentence identifies the n-fold composition of f with a generation-n expectation; reused by later lemmas, so it is a claim node with SOURCE_GAP
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet

ITEM: inv:eqn-gen-func-n
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-gen-func-n@L211-L211
DISPOSITION: NODE eqn-gen-func-n
REASON: display (1.2) is the content of the same claim node (E2 applied: product over j ≤ d)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet

ITEM: inv:eqn-mean-matrix
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-mean-matrix@L216-L216
DISPOSITION: NODE eqn-mean-matrix
REASON: display (1.3) is the frozen definition anchor of the mean matrix M
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet

ITEM: inv:L219:finite-mean
KIND: assumption
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#subcritical-def@L219-L219
DISPOSITION: NODE def:subcritical, claim:mean-matrix-powers
REASON: 'We assume that each M_{k,j} is finite' is bundled into the subcritical anchor (R1) and recorded as a hypothesis of the L220 claim; it is not a standing assumption (STANDING_ASSUMPTIONS is -)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet

ITEM: inv:L220:mean-matrix-powers
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#mean-matrix-powers@L220-L220
DISPOSITION: NODE claim:mean-matrix-powers
REASON: reused unlabeled claim (M^n)_{k,j} = 𝔼_k[X_j(n)] (spec §6); asserted without proof, so SOURCE_GAP
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet

ITEM: inv:L220:subcritical-def
KIND: definition
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#subcritical-def@L220-L220
DISPOSITION: NODE def:subcritical
REASON: definition of subcritical/critical/supercritical through the largest eigenvalue of M is the frozen definition anchor
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet

ITEM: inv:cite:L222:an-branching-processes
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#def-bp-basic-cite@L222-L222
DISPOSITION: EXCLUDED
REASON: 'see, e.g., [Section 6]' only motivates the non-degeneracy conditions of Definition 1.3; no slice-A proof invokes this reference (the An72 result used by Proposition 2.1 is ext:an72-v3-thm2, slice B)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet

ITEM: inv:def-bp-basic
KIND: definition
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#def-bp-basic@L224-L234
DISPOSITION: NODE def-bp-basic.positive-regular, def-bp-basic.non-singular
REASON: Definition 1.3 is split into its two frozen definition anchors (positive regular; non-singular)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet

ITEM: inv:L229:pos-reg-matrix-equiv
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#def-bp-basic@L229-L229
DISPOSITION: NODE def-bp-basic.positive-regular#matrix-equiv
REASON: the clause 'which is equivalent to the condition that the matrix M^N has all positive entries' (L229) is consumed by the Perron-Frobenius application at L508 (lem-gf-bded#perron-frobenius); asserted without argument, so a SOURCE_GAP claim node (supersedes ADJUDICATION A1, whose condition 'if still unreachable' does not hold)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: queue-reviewer/sonnet

ITEM: inv:L238:conjugate-iff-fixed-point
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#conjugate-iff-fixed-point@L238-L238
DISPOSITION: NODE thm-fixed-gf.equivalence, thm-fixed-gf.equivalence#fixed-point-to-conjugate, thm-fixed-gf.equivalence#conjugate-to-fixed-point, claim:subcritical-extinction, thm-fixed-gf.equivalence#hat-differs-from-X, thm-fixed-gf.equivalence#conjugate-regularity, thm-fixed-gf.equivalence#conjugate-is-tilt
REASON: the 'It is easy to see ... equivalent' sentence is the frozen equivalence root; its two directions and the premise-discharge bridges (extinction certain, clause (a), regularity premises for formula (2.1), inverse tilt) are separate SOURCE_GAP nodes
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet

ITEM: inv:thm-fixed-gf
KIND: theorem
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed-gf@L241-L250
DISPOSITION: NODE thm-fixed-gf.fixed-point, thm-fixed-gf.fixed-point#reduce-to-thm-2-7, thm-fixed-gf.conjugate, thm-fixed-gf.equivalence
REASON: Theorem 1.4 is split (R3) into the fixed-point and conjugate roots; the 'equivalently' clause of L249 is the equivalence root; the reduction to Theorem 2.7 (carrier change q = e^λ) is a separate application node
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet

ITEM: inv:L252:hyp-i-necessary
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#hyp-iii-necessary-remarks@L252-L252
DISPOSITION: EXCLUDED
REASON: 'Hypothesis I is necessary since a supercritical branching process conditioned on extinction is always subcritical' feeds no root (spec §7, R2); the cited fact is the un-anchored 'Moreover' clause of Proposition 2.1 (R6)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet

ITEM: inv:L252:hyp-iii-automatic
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#hyp-iii-automatic@L252-L252
DISPOSITION: NODE rem:hyp-iii-automatic, rem:hyp-iii-automatic#continuity-from-finiteness
REASON: frozen remark root and its single unproved bridge (SOURCE_GAP)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet

ITEM: inv:L252:hyp-iii-necessary
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#hyp-iii-necessary@L252-L252
DISPOSITION: NODE rem:hyp-iii-necessary, rem:hyp-iii-necessary#constants-and-hyp-I, rem:hyp-iii-necessary#hyp-II-regular, rem:hyp-iii-necessary#f-infinite, rem:hyp-iii-necessary#no-conjugate
REASON: frozen remark root, split into the unspecified constants with subcriticality, positive regularity and non-singularity, divergence of f, and the application of the equivalence for 'no conjugate exists' (all SOURCE_GAP)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet

ITEM: inv:L265:counterexample-claims
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#counterexample@L262-L262
DISPOSITION: NODE counterexample, counterexample#hyp-I-subcritical, counterexample#hyp-II-regular, counterexample#hyp-III-continuous, counterexample#three-fixed-points
REASON: 'clearly satisfies the hypotheses of Theorem 1.4' and 'one can check that f(q) = q has three solutions in (1,∞)^2' are the root and its SOURCE_GAP steps (R4)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: global-reviewer/sonnet

ITEM: inv:L262:robustness-claim
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#counterexample@L262-L262
DISPOSITION: EXCLUDED
REASON: 'this example is robust' (three fixed points persist under small perturbations) feeds no root (spec §7; Example 1.5 is anchored only as the concrete offspring law with at least three fixed points, R4)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: queue-reviewer/sonnet

ITEM: inv:L262:d3-seven-fixed-points
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#counterexample@L262-L262
DISPOSITION: EXCLUDED
REASON: 'a similar example where d = 3 and there are seven fixed points' is not in the anchored statement and feeds no root (spec §7)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: queue-reviewer/sonnet

ITEM: inv:L263:arbitrarily-many-fixed-points
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#counterexample@L263-L263
DISPOSITION: EXCLUDED
REASON: 'we expect that ... the number of fixed points can be arbitrarily large' is a stated expectation with no proof obligation and feeds no root (spec §7)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: queue-reviewer/sonnet

ITEM: inv:counterexample
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#counterexample@L255-L264
DISPOSITION: NODE counterexample, counterexample#hyp-I-subcritical, counterexample#hyp-II-regular, counterexample#hyp-III-continuous, counterexample#three-fixed-points
REASON: the example environment itself (offspring law and the two asserted conclusions) is the frozen root and its SOURCE_GAP steps; same nodes as the claim item above
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet

ITEM: inv:prop-single-type
KIND: proposition
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L343-L351
DISPOSITION: NODE prop-single-type.fixed-point, prop-single-type.conjugate, prop-single-type.conjugate#hyps-imply-equivalence-hypotheses, prop-single-type.conjugate#existence, prop-single-type.conjugate#unique-in-law
REASON: Proposition 1.6 is split (R5) into the fixed-point and conjugate roots; the 'Equivalently' bridge from conjugate to fixed point is the existence and uniqueness-in-law application steps plus the d = 1 hypothesis check (SOURCE_GAP)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet

ITEM: inv:proof:prop-single-type
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L352-L355
DISPOSITION: NODE prop-single-type#finite-near-one, prop-single-type#mean-eq-derivative, prop-single-type#f-below-diagonal, prop-single-type#f-above-diagonal, prop-single-type#fixed-point-exists, prop-single-type#strict-convexity, prop-single-type#at-most-two-fixed-points, ext:taylor
REASON: the proof paragraph is decomposed sentence by sentence into finiteness near 1, mean equals derivative, the two diagonal-crossing witnesses (using the named Taylor expansion), the intermediate-value fixed point, strict convexity, and the at-most-two-fixed-points conclusion
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet

ITEM: inv:heading:L359
KIND: heading
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#sec-outline@L359-L359
DISPOSITION: EXCLUDED
REASON: subsection heading 'Proof outline'; its body is the separate excluded item inv:outline:L360
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: queue-reviewer/sonnet

ITEM: inv:outline:L360
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#sec-outline@L360-L379
DISPOSITION: EXCLUDED
REASON: §1.3 proof outline (spec §7): expository summary of §2 and §3; the display of S_0 and S_∞ (L366-L369) restates the basin definitions (2.9) (eqn-basin-def.zero/infty, L726-L729) and every lemma it cites (Lemmas 2.3, 2.16-2.19 and Theorem 3.1) has its own node in slices B-D; it supplies no hypothesis, step or edge for any root
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: queue-reviewer/sonnet

ITEM: inv:L188:equivalence-preview
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#equivalence-preview@L188-L188
DISPOSITION: NODE thm-fixed-gf.equivalence
REASON: 'By basic branching process theory, this is equivalent to the existence of a fixed point for the generating function which lies in (1,∞)^d' is the first informal statement of the equivalence of L238 (repeated at L249); same node, no separate obligation
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: queue-reviewer/sonnet

ITEM: inv:heading:L380
KIND: heading
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#heading-sec-proof@L380-L380
DISPOSITION: EXCLUDED
REASON: Section heading 'Proof of main theorem'; no mathematical content and no proof obligation.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet

ITEM: inv:heading:L384
KIND: heading
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#heading-sec-prelim@L384-L384
DISPOSITION: EXCLUDED
REASON: Subsection heading 'Preliminaries on branching processes'; no mathematical content and no proof obligation.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet

ITEM: inv:prop-cond-on-ext
KIND: proposition
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-cond-on-ext@L390-L403
DISPOSITION: NODE prop-cond-on-ext.cond-law, ext:an72-v3-thm2
REASON: Spec R6 split: the conditional-law paragraph (L397-L402) is the root prop-cond-on-ext.cond-law; the first paragraph (L395, only fixed points in [0,1]^d are a and 1) is the external ext:an72-v3-thm2, consumed by prop-conjugate#ext-prob-hat. The clause 'Moreover, this branching process is subcritical' (L402) is a cited result consumed by no root and is not modeled (covered by this item, no separate node).
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet

ITEM: inv:eqn-cond-on-ext
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-cond-on-ext@L398-L398
DISPOSITION: NODE prop-cond-on-ext.cond-law
REASON: Display (2.1) is the offspring-law formula inside the statement of the anchored conditional-law paragraph; part of the root's SOURCE_CONCLUSION, not a separate node.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet

ITEM: inv:proof:prop-cond-on-ext
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-prop-cond-on-ext@L404-L406
DISPOSITION: NODE prop-cond-on-ext.cond-law
REASON: The proof is two citations; its topology (edges to ext:jl08-thm1 and ext:an72-v3-thm2) is recorded on the root node.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet

ITEM: inv:cite:L405:an-branching-processes
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-an-branching-processes@L405-L405
DISPOSITION: NODE ext:an72-v3-thm2
REASON: Citation [an-branching-processes, Theorem 2, Section V.3] is the external leaf for the first paragraph of Prop 2.1.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet

ITEM: inv:cite:L405:jl-cond-on-ext
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-jl-cond-on-ext@L405-L405
DISPOSITION: NODE ext:jl08-thm1
REASON: Citation [jl-cond-on-ext, Theorem 1] is the external leaf for the description of the conditional law.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet

ITEM: inv:prop-conjugate
KIND: proposition
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate@L420-L428
DISPOSITION: NODE prop-conjugate
REASON: Root anchor for Proposition 2.2 (statement including display (2.2)).
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet

ITEM: inv:eqn-conjugate-def
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-conjugate-def@L423-L423
DISPOSITION: NODE prop-conjugate, prop-conjugate#offspring-law
REASON: Display (2.2) defines X-hat inside the root statement; its well-definedness (normalization from f(A) = A) is the step prop-conjugate#offspring-law.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet

ITEM: inv:proof:prop-conjugate
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-prop-conjugate@L429-L432
DISPOSITION: NODE prop-conjugate#offspring-law, prop-conjugate#abs-continuity, prop-conjugate#hat-pos-reg-nonsing, prop-conjugate#hat-fixed-point, prop-conjugate#ext-prob-hat, prop-conjugate#cond-law-hat
REASON: Proof paragraph split into its substantive steps: normalization (L430), unproved mutual absolute continuity (SOURCE_GAP, L430), regularity transfer (L430), f-hat(1/A) = 1/A (L431), extinction vector via Prop 2.1(a) (L431), conditional law via Prop 2.1 plus Lemma 2.3 (SOURCE_GAP, L431).
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet

ITEM: inv:lem-fixed-pos
KIND: lemma
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-pos@L440-L446
DISPOSITION: NODE lem-fixed-pos
REASON: Lemma 2.3 statement node.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet

ITEM: inv:eqn-fixed-pos-geq
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pos-geq@L442-L442
DISPOSITION: NODE lem-fixed-pos#geq-one
REASON: Display (2.3) q_k >= 1 is the first assertion, proved by the Fatou argument and reused in the second assertion; modeled as lem-fixed-pos#geq-one.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet

ITEM: inv:proof:lem-fixed-pos
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-lem-fixed-pos@L447-L472
DISPOSITION: NODE lem-fixed-pos#geq-one, lem-fixed-pos#pos-reg-strict, ext:fatou
REASON: Proof has two substantive parts: the Fatou argument (L449-L458, ext:fatou) and the positive-regularity strictness argument (L461-L471).
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet

ITEM: inv:lem-gf-pos
KIND: lemma
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-pos@L477-L487
DISPOSITION: NODE lem-gf-pos
REASON: Lemma 2.4 statement node.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet

ITEM: inv:eqn-gf-pos
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-gf-pos@L479-L479
DISPOSITION: NODE lem-gf-pos
REASON: Display (2.4) is the lemma's conclusion (definition of p_{k,j}(N) and its positivity); part of lem-gf-pos, not a separate node.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet

ITEM: inv:proof:lem-gf-pos
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-lem-gf-pos@L488-L494
DISPOSITION: NODE lem-gf-pos#choose-N0-k0, lem-gf-pos#two-individuals, lem-gf-pos#kj-descendants
REASON: Proof split into witness choice (N_0, k_0), the two-individuals step, and the descendants step giving N = 2N_0 + 1.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet

ITEM: inv:lem-gf-bded
KIND: lemma
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-bded@L500-L506
DISPOSITION: NODE lem-gf-bded
REASON: Lemma 2.5 statement node (carries the Theorem 1.4 setting as SOURCE_HYPOTHESES).
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet

ITEM: inv:proof:lem-gf-bded
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-lem-gf-bded@L507-L515
DISPOSITION: NODE lem-gf-bded#perron-frobenius, lem-gf-bded#finite-nbhd, lem-gf-bded#jacobian, lem-gf-bded#taylor, lem-gf-bded#choose-eps, ext:perron-frobenius, ext:taylor
REASON: Proof split into Perron-Frobenius (L508, ext:perron-frobenius), finiteness near 1 (L510), the unproved Jacobian claim (SOURCE_GAP, L510), Taylor expansion (L510-L513, ext:taylor) and the choice of eps (L514).
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet

ITEM: inv:heading:L525
KIND: heading
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#heading-sec-mono@L525-L525
DISPOSITION: EXCLUDED
REASON: Subsection heading 'Monotonicity properties'; the standing sentence at L528 (setting of Theorem 1.4) is carried as SOURCE_HYPOTHESES of each consuming lemma per spec section 4.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet

ITEM: inv:def-log-gf
KIND: definition
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#def-log-gf@L533-L546
DISPOSITION: NODE def-log-gf
REASON: Frozen definition anchor for Definition 2.6 (g and its iterates).
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet

ITEM: inv:eqn-convex-func-n
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-convex-func-n@L541-L541
DISPOSITION: NODE eqn-convex-func-n
REASON: Display (2.5) is consumed as the characterization of g^{(n)} by lem-mono, lem-unstable-scaled and the skeleton step of lem-unstable-ssl.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet

ITEM: inv:eqn-fixed-pt-equiv
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-equiv@L549-L549
DISPOSITION: NODE eqn-fixed-pt-equiv
REASON: Display (2.6) is a canonical cross-slice claim (spec section 9).
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet

ITEM: inv:thm-fixed
KIND: theorem
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed@L555-L557
DISPOSITION: NODE thm-fixed
REASON: Theorem 2.7: the statement (L555-L557) lies in slice-B lines, but the root node thm-fixed is owned by slice C per spec section 9 (statement L555-L557, proof L894-L905); slice B defines no block for it.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: queue-reviewer/sonnet

ITEM: inv:L560:g-convex
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#g-convex-remark@L560-L560
DISPOSITION: EXCLUDED
REASON: Remark that each g_k is convex by Holder's inequality: stated as 'not needed for our proofs' (L559) and the commented-out lemma at L562-L582 is not part of the paper; feeds no root (spec section 7).
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet

ITEM: inv:def-componentwise
KIND: definition
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#def-componentwise@L587-L589
DISPOSITION: NODE def-componentwise
REASON: Definition 2.8 is consumed as the unfolding of '<' in lem-mono, prop-unstable and lem-monotone-lim proofs.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet

ITEM: inv:lem-mono
KIND: lemma
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-mono@L594-L598
DISPOSITION: NODE lem-mono
REASON: Lemma 2.9 statement node.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet

ITEM: inv:proof:lem-mono
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-lem-mono@L599-L604
DISPOSITION: NODE lem-mono#positivity-all-n, lem-mono#strict-ineq
REASON: First assertion is immediate from (2.5) (edge on lem-mono); the strict assertion is split into positivity for all n >= N (Markov property) and the strict-inequality step.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet

ITEM: inv:prop-unstable
KIND: proposition
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-unstable@L608-L615
DISPOSITION: NODE prop-unstable, prop-unstable#part-i, prop-unstable#part-ii
REASON: Proposition 2.10 statement node plus its two parts (i) and (ii) as separate step nodes.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet

ITEM: inv:lem-unstable-scaled
KIND: lemma
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-unstable-scaled@L619-L622
DISPOSITION: NODE lem-unstable-scaled
REASON: Lemma 2.11 statement node.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet

ITEM: inv:proof:lem-unstable-scaled
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-lem-unstable-scaled@L623-L636
DISPOSITION: NODE lem-unstable-scaled#extinction-as, lem-unstable-scaled#holder-bound, lem-unstable-scaled#vitali, ext:holder, ext:vitali
REASON: Proof split into almost-sure extinction (SOURCE_GAP, L628), the Holder bound (L629-L634, ext:holder) and the Vitali conclusion (L635, ext:vitali).
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet

ITEM: inv:proof:prop-unstable
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-prop-unstable@L640-L649
DISPOSITION: NODE prop-unstable#strict-case, prop-unstable#part-i, prop-unstable#part-ii
REASON: Proof split into the strict-in-every-coordinate case (L641-L643), the general case via Lemma 2.9 (L645-L647) and assertion (ii) by role reversal (L648).
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet

ITEM: inv:lem-unstable-ssl
KIND: lemma
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-unstable-ssl@L653-L661
DISPOSITION: NODE lem-unstable-ssl
REASON: Lemma 2.12 statement node.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet

ITEM: inv:proof:lem-unstable-ssl
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-lem-unstable-ssl@L662-L664
DISPOSITION: NODE lem-unstable-ssl#skeleton-hypotheses, lem-unstable-ssl#skeleton-gf, lem-unstable-ssl#apply-prop-unstable
REASON: Proof split into the unproved m-skeleton hypotheses (SOURCE_GAP, 'one easily verifies'), the unstated identification g-tilde = g^{(m)}, and the application of Prop 2.10.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet

ITEM: inv:lem-monotone-lim
KIND: lemma
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-monotone-lim@L669-L673
DISPOSITION: NODE lem-monotone-lim
REASON: Lemma 2.13 statement node.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet

ITEM: inv:proof:lem-monotone-lim
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-lem-monotone-lim@L674-L694
DISPOSITION: NODE lem-monotone-lim#shifted-mono, lem-monotone-lim#limits-exist, lem-monotone-lim#limit-fixed, lem-monotone-lim#limits-zero, lem-monotone-lim#part-b
REASON: Proof split into (2.7), (2.8), the continuity/limit step (SOURCE_GAP), the contradiction argument via Lemma 2.12, and the unproved second assertion ('proven similarly', SOURCE_GAP). The commented-out proof at L696-L715 is ignored.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet

ITEM: inv:eqn-shifted-mono
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-shifted-mono@L677-L677
DISPOSITION: NODE lem-monotone-lim#shifted-mono
REASON: Display (2.7) is the content of the step lem-monotone-lim#shifted-mono.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet

ITEM: inv:eqn-mono-ssl
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-mono-ssl@L682-L682
DISPOSITION: NODE lem-monotone-lim#limits-exist
REASON: Display (2.8) defines the limits lambda-bar^s; it is the content of the step lem-monotone-lim#limits-exist.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet

ITEM: inv:heading:L722
KIND: heading
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#heading-sec-basins@L722-L722
DISPOSITION: EXCLUDED
REASON: Subsection heading 'Basins of attraction of 0 and infinity'; no mathematical content and no proof obligation. The standing sentence of Theorem 1.4 (L528) is carried as SOURCE_HYPOTHESES of each node (spec section 4).
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: reviewer-C/sonnet

ITEM: inv:eqn-basin-def
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-basin-def@L727-L727
DISPOSITION: NODE eqn-basin-def.zero, eqn-basin-def.infty
REASON: Display (2.9) defines the two basins S_0 and S_inf; it is split into the two frozen definition anchors.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: reviewer-C/sonnet

ITEM: inv:eqn-infty-subset
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-infty-subset@L732-L735
DISPOSITION: NODE eqn-infty-subset, eqn-infty-subset#blowup
REASON: Display (2.10) is the node eqn-infty-subset; the preceding unproved claim (g^{(N)} blows up when a coordinate is infinite, L732) is the SOURCE_GAP step eqn-infty-subset#blowup.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: queue-reviewer/sonnet

ITEM: inv:lem-basin-closed
KIND: lemma
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-basin-closed@L737-L739
DISPOSITION: NODE lem-basin-closed
REASON: Lemma 2.14 statement.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: reviewer-C/sonnet

ITEM: inv:proof:lem-basin-closed
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-lem-basin-closed@L740-L742
DISPOSITION: NODE lem-basin-closed
REASON: One-sentence proof ('immediate from the definition (2.9)') is carried by the lemma node and its edges to the two basin definitions; below the step threshold.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: reviewer-C/sonnet

ITEM: inv:lem-attractive-zero
KIND: lemma
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-zero@L767-L769
DISPOSITION: NODE lem-attractive-zero
REASON: Lemma 2.15 statement.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: reviewer-C/sonnet

ITEM: inv:proof:lem-attractive-zero
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-lem-attractive-zero@L770-L776
DISPOSITION: NODE lem-attractive-zero#subinvariant-point, lem-attractive-zero#orbit-lambda0, lem-attractive-zero#comparison
REASON: Proof split into: Lemma 2.5 in log coordinates (lambda^0), the application of Lemma 2.13 with m = 1, and the monotone comparison with eps := min_j lambda^0_j.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: reviewer-C/sonnet

ITEM: inv:lem-attractive-infty
KIND: lemma
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-infty@L781-L784
DISPOSITION: NODE lem-attractive-infty
REASON: Lemma 2.16 statement, read as ruled by E3.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: reviewer-C/sonnet

ITEM: inv:proof:lem-attractive-infty
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-lem-attractive-infty@L785-L800
DISPOSITION: NODE lem-attractive-infty#choose-N-m, lem-attractive-infty#lower-bound, lem-attractive-infty#strict-increase, lem-attractive-infty#divergence
REASON: Proof split into: the choice of N and m (Lemma 2.4), the lower bound (E3: max_j), the strict increase outside [0,C]^d, and the application of Lemma 2.13(b).
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: reviewer-C/sonnet

ITEM: inv:lem-basin-open
KIND: lemma
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-basin-open@L804-L806
DISPOSITION: NODE lem-basin-open
REASON: Lemma 2.17 statement.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: reviewer-C/sonnet

ITEM: inv:proof:lem-basin-open
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-lem-basin-open@L807-L821
DISPOSITION: NODE lem-basin-open#g-iter-continuous, lem-basin-open#S0-open, lem-basin-open#outside-cube-in-Sinf, lem-basin-open#Sinf-open
REASON: Proof split into: continuity of g^{(n)} from Hypothesis III, openness of S_0 via (2.11), the inclusion of the complement of [0,C]^d in S_inf, and openness of S_inf.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: reviewer-C/sonnet

ITEM: inv:eqn-use-attractive-zero
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-use-attractive-zero@L809-L809
DISPOSITION: NODE eqn-use-attractive-zero
REASON: Display (2.11) is a labeled consequence of Lemma 2.15 used in the openness argument.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: reviewer-C/sonnet

ITEM: inv:lem-ray-intersect
KIND: lemma
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-ray-intersect@L828-L830
DISPOSITION: NODE lem-ray-intersect
REASON: Lemma 2.18 statement.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: reviewer-C/sonnet

ITEM: inv:proof:lem-ray-intersect
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-lem-ray-intersect@L831-L836
DISPOSITION: NODE lem-ray-intersect#ray-meets-both, lem-ray-intersect#existence, lem-ray-intersect#uniqueness, ext:connectedness
REASON: Proof split into: the ray meets both basins, the connectedness application (existence), and the contradiction with Lemma 2.11 (uniqueness).
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: reviewer-C/sonnet

ITEM: inv:lem-retract
KIND: lemma
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract@L851-L857
DISPOSITION: NODE lem-retract
REASON: Lemma 2.19 statement.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: reviewer-C/sonnet

ITEM: inv:eqn-retract-annulus
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-retract-annulus@L853-L853
DISPOSITION: NODE lem-retract
REASON: Display (2.12) defines A(r,R) inside the statement of Lemma 2.19; part of lem-retract, not a separate node.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: reviewer-C/sonnet

ITEM: inv:proof:lem-retract
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-lem-retract@L858-L891
DISPOSITION: NODE lem-retract#choose-r-R, lem-retract#radial-bijection, lem-retract#Lambda-compact, lem-retract#phi-homeomorphism, lem-retract#H-continuous, lem-retract#H-fixes-Lambda, lem-retract#H-preserves-A, ext:compact-hausdorff
REASON: Proof split into: choice of r, R; the radial bijection; compactness of Lambda; the homeomorphism phi (compact-Hausdorff); and the three verifications for H (continuity, fixing Lambda, mapping A to A); H itself is the node eqn-retract-def.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: reviewer-C/sonnet

ITEM: inv:eqn-retract-def
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-retract-def@L878-L878
DISPOSITION: NODE eqn-retract-def
REASON: Display (2.13) defines the deformation H_t; labeled display consumed by the verification steps.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: reviewer-C/sonnet

ITEM: inv:proof:thm-fixed
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-thm-fixed@L894-L905
DISPOSITION: NODE thm-fixed, thm-fixed#g-image-finite, thm-fixed#Lambda-invariant, thm-fixed#apply-retract, thm-fixed#A-homeomorphic-to-ball, thm-fixed#brouwer-on-A, thm-fixed#gH1-self-map, thm-fixed#fixed-point-in-Lambda, thm-fixed#zero-notin-Lambda, thm-fixed#positivity, ext:brouwer
REASON: Proof of Theorem 2.7 split into: invariance of Lambda (with the finiteness bridge), the application of Lemma 2.19, the unproved ball homeomorphism, Brouwer for g o H_1, the fixed point in Lambda, 0 not in Lambda, and the positivity application of Lemma 2.3; assembled in the root node thm-fixed.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: reviewer-C/sonnet

ITEM: inv:fig-brouwer-proof
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#fig-brouwer-proof@L841-L847
DISPOSITION: EXCLUDED
REASON: Figure 2 (illustration of the proof of Lemma 2.19 for d = 2: the deformation retraction from the region A to Λ by sliding points along rays through the origin) pictures the construction (2.13) and states nothing that the proof of Lemma 2.19 (nodes eqn-retract-def, lem-retract#phi-homeomorphism, #H-continuous, #H-fixes-Lambda, #H-preserves-A) does not prove; it is not a proof obligation
COVERAGE_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: queue-reviewer/sonnet

ITEM: inv:heading:L908
KIND: heading
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#sec-infty@L908-L908
DISPOSITION: EXCLUDED
REASON: section heading (The countable-type case); the orienting paragraph L911 is expository and states no claim consumed by a root. heading with no mathematical content; the statements under it are covered by their own items
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:heading:L913
KIND: heading
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#sec-ctble-type@L913-L913
DISPOSITION: EXCLUDED
REASON: subsection heading (Countable-type branching processes). heading with no mathematical content; the statements under it are covered by their own items
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:eqn-finite-offspring
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-finite-offspring@L917-L917
DISPOSITION: NODE thm-fixed-pt-infty, thm-fixed-pt-infty#as-convergence, example-ctble#finite-offspring
REASON: (3.1) is a hypothesis of the countable-type setting (a local hypothesis package, spec §4): recorded in the SOURCE_HYPOTHESES of the root and of the lemma and step nodes; consumed at L1160 by #as-convergence (a.s. finitely many non-zero X_j(1)); checked for the example by example-ctble#finite-offspring (L1192)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:L930:ctble-extinction-facts
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-extinction-facts@L930-L932
DISPOSITION: EXCLUDED
REASON: cited background in L930-L932 on partial and local extinction, the inequalities q ≤ q(A) ≤ q̃ ≤ 1, the fixed-point sets S and Q and their literature, excluded by spec §7: no proof of a root consumes it. The sentence 'all of the extinction probabilities are solutions to s = f(s)' is the countable counterpart of the property of a taken from [AN72] in Proposition 2.1; L934 does not cite it, and f(a) = a is the first-step identity inside the SOURCE_GAP route of prop-cond-on-ext.ctble.cond-law (claim:branching-property). The sentence on a continuum of fixed points is only the rationale of the SOURCE_GAP of prop-conjugate.ctble#ext-prob-hat, not a consumed result. Not excluded: the definition of global extinction in L930 (item inv:L930:global-extinction-def), the truncation paragraph L936-L937 (item inv:L936:def-truncation) and L934 (item inv:L934:ctble-conjugate-extension, re-scoped by R8)
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: global-reviewer/sonnet

ITEM: inv:cite:L930:Bertacchi2014
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L930-Bertacchi2014@L930-L930
DISPOSITION: EXCLUDED
REASON: literature citation in the excluded section 3.1 discussion of extinction notions (L930-L936, spec §7); no proof of a root consumes the cited result
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:cite:L930:Bertacchi2020
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L930-Bertacchi2020@L930-L930
DISPOSITION: EXCLUDED
REASON: literature citation in the excluded section 3.1 discussion of extinction notions (L930-L936, spec §7); no proof of a root consumes the cited result
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:cite:L932:Bertacchi2022
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L932-Bertacchi2022@L932-L932
DISPOSITION: EXCLUDED
REASON: literature citation in the excluded section 3.1 discussion of extinction notions (L930-L936, spec §7); no proof of a root consumes the cited result
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:cite:L932:Moyal1964
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L932-Moyal1964@L932-L932
DISPOSITION: EXCLUDED
REASON: literature citation in the excluded section 3.1 discussion of extinction notions (L930-L936, spec §7); no proof of a root consumes the cited result
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:L934:ctble-conjugate-extension
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934
DISPOSITION: NODE prop-cond-on-ext.ctble.cond-law, prop-conjugate.ctble, prop-conjugate.ctble#offspring-law, prop-conjugate.ctble#ext-prob-hat, prop-conjugate.ctble#cond-law-hat, thm-fixed-gf.equivalence.ctble, thm-fixed-gf.equivalence.ctble#fixed-point-to-conjugate, thm-fixed-gf.equivalence.ctble#conjugate-to-fixed-point, thm-fixed-gf.equivalence.ctble#conjugate-regularity, def-conjugate
REASON: Re-scoped by the author's ruling R8 (2026-10-28), sentence by sentence: conditioning on global extinction gives a branching process and (2.1) still holds, both citing [JL08]: prop-cond-on-ext.ctble.cond-law; the conjugate is defined as in Definition 1.1: def-conjugate; Proposition 2.2 extends with the same proof: prop-conjugate.ctble and its three steps; conjugate processes correspond to fixed points in (1,∞)^ℕ: thm-fixed-gf.equivalence.ctble and its two direction steps (E10: this needs positive regularity). The last sentence is split: 'the conjugate process has global extinction probability less than 1' is a consequence of what is modeled (P̂_k[E] = 1/q_k < 1, prop-conjugate.ctble#ext-prob-hat and thm-fixed-gf.equivalence.ctble#fixed-point-to-conjugate); 'but the partial extinction probability may be 1' has no proof and remains excluded (R8(e)). [Phase 2 disposition was EXCLUDED: countable-type extension of (2.1) and Proposition 2.2 (conjugate processes correspond to fixed points in (1,∞)^ℕ) is excluded by spec §7: the proof of Theorem 3.1 constructs only a fixed point and does not consume it. Proof obligation not modeled: the step fixed point implies conjugate process asserted at L934 and in the first sentence of Example 3.5 (L1183)]
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:cite:L934:jl-cond-on-ext.2
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L934-jl-cond-on-ext-2@L934-L934
DISPOSITION: NODE ext:jl08-thm1, prop-cond-on-ext.ctble.cond-law
REASON: Re-scoped by R8: first occurrence of [JL08] in L934 ('conditioning an infinite-type branching process on global extinction gives an infinite-type branching process'): the external leaf ext:jl08-thm1 (as for inv:cite:L405:jl-cond-on-ext), consumed by the root prop-cond-on-ext.ctble.cond-law (edge). [Phase 2 disposition was EXCLUDED: citation supporting the countable-type extension of (2.1) and Proposition 2.2 (L934, excluded by spec §7); Theorem 3.1 and Example 3.5 produce a fixed point of f and never consume this extension]
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:cite:L934:jl-cond-on-ext.3
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L934-jl-cond-on-ext-3@L934-L934
DISPOSITION: NODE ext:jl08-thm1, prop-cond-on-ext.ctble.cond-law
REASON: Re-scoped by R8: second occurrence of [JL08] in L934 ('since the result of [JL08] applies also in the countable-type case, (2.1) still holds'): the external leaf ext:jl08-thm1, consumed by the root prop-cond-on-ext.ctble.cond-law (edge). [Phase 2 disposition was EXCLUDED: citation supporting the countable-type extension of (2.1) and Proposition 2.2 (L934, excluded by spec §7); Theorem 3.1 and Example 3.5 produce a fixed point of f and never consume this extension]
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:eqn-gf-truncated
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-gf-truncated@L946-L946
DISPOSITION: NODE eqn-gf-truncated, def:truncation
REASON: display (3.2) is the characterization of f^d, modeled as eqn-gf-truncated; the truncation definition it follows (L936-L937, no separate inventory item) is the frozen anchor def:truncation
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:cite:L952:hln-ext-prob
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L952-hln-ext-prob@L952-L952
DISPOSITION: EXCLUDED
REASON: attribution remark (the idea of approximating a countable-type process by finite-type truncations also appears in hln-ext-prob); no claim and no proof obligation
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:heading:L955
KIND: heading
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#sec-existence@L955-L955
DISPOSITION: EXCLUDED
REASON: subsection heading (Existence of a conjugate branching process). heading with no mathematical content; the statements under it are covered by their own items
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:eqn-weight-function
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-weight-function@L963-L963
DISPOSITION: NODE thm-fixed-pt-infty, lem-fixed-liminf#choose-K
REASON: (3.3) is the requirement on φ,ψ inside Assumption II, a local hypothesis package recorded in SOURCE_HYPOTHESES of the root and of the §3.2 lemmas (spec §4); its limit statement lim log ψ(k)/φ(k)=0 is consumed by the witness choice #choose-K
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:thm-fixed-pt-infty
KIND: theorem
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed-pt-infty@L985-L987
DISPOSITION: NODE thm-fixed-pt-infty, thm-fixed-pt-infty.conjugate
REASON: Theorem 3.1 statement node (the frozen root); L985-L987 is also the PROOF_SOURCE of its conjugate form thm-fixed-pt-infty.conjugate
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:eqn-log-gf-infty
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-log-gf-infty@L992-L992
DISPOSITION: NODE eqn-log-gf-infty, thm-fixed-pt-infty#reduce-to-g
REASON: display (3.5) defines g and g^d (eqn-log-gf-infty); the sentence immediately after it (L996, it suffices to find λ∈(0,∞)^ℕ with g(λ)=λ) is the carrier-change step #reduce-to-g
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:L998:arbitrary-fixed-point-choice
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#arbitrary-fixed-point-choice@L997-L1001
DISPOSITION: NODE thm-fixed-pt-infty#choose-lambda-d
REASON: application of Theorem 1.4 to X^d and the arbitrary selection of λ^d (witness-choice policy in the NOTE of the node)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:eqn-fixed-pt-trunc
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-trunc@L999-L999
DISPOSITION: NODE thm-fixed-pt-infty#choose-lambda-d
REASON: display (3.6) is the content of the choice node thm-fixed-pt-infty#choose-lambda-d
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:lem-fixed-limsup
KIND: lemma
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-limsup@L1004-L1006
DISPOSITION: NODE lem-fixed-limsup
REASON: Lemma 3.2 statement node (setting of §3.2 in SOURCE_HYPOTHESES)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:proof:lem-fixed-limsup
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-lem-fixed-limsup@L1007-L1025
DISPOSITION: NODE lem-fixed-limsup#choose-N, lem-fixed-limsup#truncation-monotone, lem-fixed-limsup#moment-bound
REASON: proof split into the application of Lemma 2.4 to X^k (L1009), the uniform-in-d lower bound by the definition of X^d (L1013) and the moment inequality with the final rearrangement (L1017-L1024)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:lem-fixed-liminf
KIND: lemma
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-liminf@L1031-L1036
DISPOSITION: NODE lem-fixed-liminf
REASON: Lemma 3.3 statement node (setting of §3.2 in SOURCE_HYPOTHESES)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:proof:lem-fixed-liminf
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-lem-fixed-liminf@L1037-L1097
DISPOSITION: NODE lem-fixed-liminf#subinvariant-weights, lem-fixed-liminf#iterate-subinvariant, lem-fixed-liminf#orbit-decay, lem-fixed-liminf#step1, lem-fixed-liminf#growth-compare, lem-fixed-liminf#choose-K, lem-fixed-liminf#case-small-k, lem-fixed-liminf#case-large-k, lem-fixed-liminf#step2
REASON: proof split into Step 1 (subinvariant weights (3.7)-(3.9), iteration by Lemma 2.9 (3.10), Proposition 2.10 (3.11), the one-coordinate bound (3.12)) and Step 2 (growth comparison (3.13), choice of K, the two cases on k(d) including (3.14), and the closing transfer)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:eqn-use-gf-bded-infty
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-use-gf-bded-infty@L1041-L1041
DISPOSITION: NODE lem-fixed-liminf#subinvariant-weights
REASON: display (3.7) (with (3.8) and (3.9)) is the content of the step #subinvariant-weights
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:eqn-gf-truncated-strict
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-gf-truncated-strict@L1050-L1050
DISPOSITION: NODE lem-fixed-liminf#subinvariant-weights
REASON: display (3.9) is the truncated form of the subinvariance, the conclusion of the step #subinvariant-weights
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:eqn-use-mono-infty
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-use-mono-infty@L1055-L1055
DISPOSITION: NODE lem-fixed-liminf#iterate-subinvariant
REASON: display (3.10) is the content of the application #iterate-subinvariant (Lemma 2.9)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:eqn-fixed-liminf-zero
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-liminf-zero@L1059-L1059
DISPOSITION: NODE lem-fixed-liminf#orbit-decay
REASON: display (3.11) is the content of the application #orbit-decay (Proposition 2.10)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:eqn-fixed-pt-one-coord
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-one-coord@L1063-L1063
DISPOSITION: NODE lem-fixed-liminf#step1
REASON: display (3.12) is the conclusion of Step 1
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:eqn-fixed-pt-exp-bd
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-exp-bd@L1072-L1072
DISPOSITION: NODE lem-fixed-liminf#growth-compare, eqn-log-gf-truncated
REASON: display (3.13) is the content of #growth-compare; its reused log-coordinate form of (3.2) with the E4 reading of the tail arguments is split out as eqn-log-gf-truncated
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:eqn-fixed-pt-coord-compare
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-coord-compare@L1090-L1090
DISPOSITION: NODE lem-fixed-liminf#case-large-k
REASON: display (3.14) is the content of the case k(d)≥K
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:lem-1d-soln
KIND: lemma
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-1d-soln@L1101-L1115
DISPOSITION: NODE lem-1d-soln
REASON: Lemma 3.4 statement node (setting of §3.2 in SOURCE_HYPOTHESES)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:eqn-1d-soln
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-1d-soln@L1103-L1103
DISPOSITION: NODE lem-1d-soln, lem-1d-soln#apply-prop-1-6
REASON: display (3.15) is the first assertion of the lemma, proved by the application of Proposition 1.6 to X̃^k
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:eqn-1d-soln-ineq
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-1d-soln-ineq@L1108-L1108
DISPOSITION: NODE lem-1d-soln, lem-1d-soln#bound-by-eta
REASON: display (3.16) is the second assertion of the lemma, proved in #bound-by-eta
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:eqn-1d-soln-growth
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-1d-soln-growth@L1112-L1112
DISPOSITION: NODE lem-1d-soln, lem-1d-soln#growth-bound
REASON: display (3.17) is the third assertion of the lemma, proved in #growth-bound
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:proof:lem-1d-soln
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-lem-1d-soln@L1116-L1145
DISPOSITION: NODE lem-1d-soln#k1-nonsingular, lem-1d-soln#single-type-process, lem-1d-soln#single-type-subcritical, lem-1d-soln#single-type-continuous, lem-1d-soln#apply-prop-1-6, lem-1d-soln#convexity, lem-1d-soln#diagonal-position, lem-1d-soln#bound-by-eta, lem-1d-soln#eta1-lt-log-t, lem-1d-soln#growth-bound
REASON: proof split into: non-singularity of X^1 (L1117); the single-type process X̃^k and its generating function (L1120-L1124); the asserted subcriticality and continuity (L1125, gaps); the application of Proposition 1.6 (L1125); convexity and diagonal position of f̃_k (L1134, gap); the bound λ^d_k≤η_k (L1127-L1134); η_1<log t (L1136); the final growth chain (L1137-L1144)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:eqn-fixed-pt-first-coord
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-first-coord@L1128-L1128
DISPOSITION: NODE lem-1d-soln#bound-by-eta
REASON: display (3.18) is the first step of #bound-by-eta
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:proof:thm-fixed-pt-infty
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-thm-fixed-pt-infty@L1149-L1179
DISPOSITION: NODE thm-fixed-pt-infty#diagonal-limit, thm-fixed-pt-infty#before-dct, thm-fixed-pt-infty#as-convergence, thm-fixed-pt-infty#dominated-bound, thm-fixed-pt-infty#interchange, thm-fixed-pt-infty#nonzero-limit, thm-fixed-pt-infty#positivity, ext:dct, ext:diagonal-subsequence
REASON: proof split into the subsequence (3.19) with its standard compactness argument, (3.20), (3.21), the domination (3.22), the dominated-convergence interchange, nonvanishing via Lemma 3.3 and the final strict positivity (gap); the standard compactness argument and the dominated convergence theorem are the external nodes
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:eqn-ssl
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-ssl@L1151-L1151
DISPOSITION: NODE thm-fixed-pt-infty#diagonal-limit
REASON: display (3.19) is the content of #diagonal-limit
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:eqn-before-fatou
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-before-fatou@L1157-L1157
DISPOSITION: NODE thm-fixed-pt-infty#before-dct
REASON: display (3.20) is the content of #before-dct
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:eqn-fixed-pt-as-conv
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-as-conv@L1161-L1161
DISPOSITION: NODE thm-fixed-pt-infty#as-convergence
REASON: display (3.21) is the content of #as-convergence
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:eqn-dominate
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-dominate@L1168-L1168
DISPOSITION: NODE thm-fixed-pt-infty#dominated-bound
REASON: display (3.22) is the content of #dominated-bound
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:example-ctble
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1182-L1201
DISPOSITION: NODE example-ctble, example-ctble#finite-offspring, example-ctble#global-extinction, example-ctble#assume-I, example-ctble#assume-II, example-ctble#assume-III, example-ctble#assume-IV, example-ctble#choose-s, example-ctble#choose-t, example-ctble#apply-thm-3-1, def:stoch-dom, example-ctble.conjugate
REASON: Example 3.5 root, the asserted verifications (global extinction, Assumptions I-IV, existence of s and t, each a SOURCE_GAP step), the note on finite offspring (L1192), the application of Theorem 3.1 (L1183), and the frozen definition anchor for stochastic domination (L1194). L1193 (concrete sampling construction) is an illustration with no claim and is not modeled. The conjugate form of L1183 ('implies the existence of a conjugate branching process') is the root example-ctble.conjugate (R8(d)); it depends on example-ctble and on thm-fixed-gf.equivalence.ctble#fixed-point-to-conjugate
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:eqn-example-condition
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-example-condition@L1186-L1186
DISPOSITION: NODE example-ctble, example-ctble#finite-offspring, example-ctble#assume-I, example-ctble#choose-s, example-ctble#choose-t
REASON: (3.23) is the hypothesis package of Example 3.5, recorded in SOURCE_HYPOTHESES of the root (E8: all four conditions for every ℙ_k); it is consumed by the finite-offspring note, the verification of Assumption I and the choices of s and t
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:L930:global-extinction-def
KIND: definition
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#global-extinction-def@L930-L930
DISPOSITION: NODE def:extinction, example-ctble#global-extinction
REASON: 'global extinction, defined as lim_{n→∞} Σ_k X_k(n) = 0' is the extinction notion of the hypothesis 'global extinction probability one' of Theorem 3.1 (L958) and of the conclusion of Example 3.5; the frozen anchor def:extinction (owned by slice A, STATEMENT_SOURCE L179) has manifest range paper.tex:179,930, and example-ctble#global-extinction consumes it. No new node
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: queue-reviewer/sonnet

ITEM: inv:L936:def-truncation
KIND: definition
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#truncation@L936-L937
DISPOSITION: NODE def:truncation
REASON: the branching process X^d truncated at level d (individuals of type ≥ d+1 killed immediately, X^d_k(1)=0 for k≥d+1, superscript-d convention for all associated objects) is the frozen definition anchor def:truncation (manifest range paper.tex:937-948); the display (3.2) that follows is inv:eqn-gf-truncated
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: queue-reviewer/sonnet

ITEM: inv:L957:assumptions-I-IV
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#assumptions-I-IV@L957-L984
DISPOSITION: NODE thm-fixed-pt-infty, lem-fixed-limsup, lem-fixed-liminf, lem-1d-soln, lem-fixed-liminf#choose-K, example-ctble#assume-I, example-ctble#assume-II, example-ctble#assume-III, example-ctble#assume-IV, thm-fixed-pt-infty.conjugate
REASON: the global-extinction sentence (L958) and Assumptions I-IV (labels item-gf-trunc-infty, item-gf-growth-infty, item-gf-bded-infty, item-gf-perturb-infty; numbered display (3.4) at L970 is the inequality of Assumption II; unnumbered displays L974, L978-L979) are a local hypothesis package (spec §4): recorded whole in SOURCE_HYPOTHESES of the root and of the §3.2 lemmas and steps, used by name at L1028 and L1195, and each assumption is verified for Example 3.5 by the example-ctble#assume-I..IV nodes. The weights remark L982-L983 is expository (pointer to Example 3.5) and excluded. The sentence L958-L959 ('assumptions which ensure the existence of a conjugate branching process, equivalently, a fixed point ... in (1,∞)^{ℕ_0}', E6) is the conjugate form of Theorem 3.1, the root thm-fixed-pt-infty.conjugate (R8(d)); it depends on thm-fixed-pt-infty and on thm-fixed-gf.equivalence.ctble#fixed-point-to-conjugate
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: queue-reviewer/sonnet

ITEM: inv:L927:ctble-fn-iterate
KIND: definition
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-fn-iterate@L927-L927
DISPOSITION: NODE thm-fixed-pt-infty#positivity, thm-fixed-gf.equivalence.ctble#conjugate-to-fixed-point
REASON: 'We also define f^{(n)} to be the composition of f with itself n times' for the countable-type f of L920-L926; its consumers are the unwritten countable-type identity f^{(N)}_k(q)=𝔼_k[∏_j q_j^{X_j(N)}] behind the SOURCE_GAP of #positivity (L1178) and behind the transfer of Lemma 2.3 to ℕ types in thm-fixed-gf.equivalence.ctble#conjugate-to-fixed-point (L934, 'just as in the finite-type case'); every other iterate in §3 is g^{d,(n)} of a finite-type truncation
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: queue-reviewer/sonnet

ITEM: inv:L928:ctble-regularity-extension
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-regularity-extension@L928-L928
DISPOSITION: NODE def-bp-basic.positive-regular, def-bp-basic.non-singular
REASON: Re-scoped by R8: positive regularity and non-singularity for countable types are now consumed as premises of the batch-2 roots (R8(b), (c), E10). [Phase 2 disposition was EXCLUDED: extends positive regularity and non-singularity (Definition 1.3) to countable-type X; never consumed: Assumption I (L961), Lemma 3.4 (L1117) and the proof of Theorem 3.1 (L1178) use these notions only for the finite-type truncations X^d]
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: queue-reviewer/sonnet

ITEM: inv:L1193:concrete-example
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#concrete-example@L1193-L1193
DISPOSITION: EXCLUDED
REASON: illustration of how a ℙ_1 satisfying (3.23) can be sampled (N from a law on ℕ_0 with mean <1 and exponential moments, then a uniform sequence with Σ j X_j(1) = N); the hypotheses of Example 3.5 are the display (3.23), not this recipe, and no root proof consumes it (spec §7: claims that feed no root)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: queue-reviewer/sonnet

ITEM: inv:L437:fixed-pos-remark
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#fixed-pos-remark@L437-L437
DISPOSITION: NODE lem-fixed-pos, prop-conjugate#cond-law-hat
REASON: Remark that Lemma 2.3 implies that in the setting of Proposition 2.2 the fixed point A is either (1,...,1) or in (1,inf)^d. It is the only source evidence for the edge prop-conjugate#cond-law-hat -> lem-fixed-pos, which the proof of Proposition 2.2 (L431) does not cite; the unverified hypothesis 0 < a_k < 1 of Proposition 2.1 is recorded as a SOURCE_GAP on prop-conjugate#cond-law-hat.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: queue-reviewer/sonnet

ITEM: inv:L553:thm-equivalence
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-equivalence-reduction@L553-L553
DISPOSITION: NODE thm-fixed-gf.fixed-point#reduce-to-thm-2-7, eqn-fixed-pt-equiv
REASON: The reduction of Theorem 1.4 to Theorem 2.7 through (2.6); the node is owned by slice A (root thm-fixed-gf.fixed-point), the display (2.6) by slice B.
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: queue-reviewer/sonnet

ITEM: inv:L731:asymmetry-note
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-basin-def@L731-L731
DISPOSITION: EXCLUDED
REASON: motivational remark: it cites Proposition 2.10 (prop-unstable) as the origin of the lim / limsup asymmetry in (2.9) but no proof in the root closure consumes it as an input (ADJUDICATION C2); prop-unstable is reached through lem-unstable-ssl and lem-monotone-lim, whose own proofs are owned by slice B
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: queue-reviewer/sonnet

ITEM: inv:fig-counterexample
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#fig-counterexample@L267-L273
DISPOSITION: EXCLUDED
REASON: Figure 1 (plot of the solution sets of f_1(q_1,q_2) = q_1 and f_2(q_1,q_2) = q_2 for the offspring law of Example 1.5, made with Mathematica) illustrates the three fixed points asserted at L262; it states nothing beyond the definition of a fixed point and is not a proof obligation (the three-fixed-points claim itself is the node counterexample#three-fixed-points; spec §7, R4)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: queue-reviewer/sonnet
REVIEWER: global-reviewer/sonnet

ITEM: inv:heading:L1216
KIND: heading
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#heading-L1216@L1216-L1216
DISPOSITION: EXCLUDED
REASON: §4 Applications (L1216-L1345) is discussion of applications to LQG and biology; it states no formal claim and no root consumes it
COVERAGE_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: queue-reviewer/sonnet

ITEM: inv:heading:L1218
KIND: heading
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#heading-L1218@L1218-L1218
DISPOSITION: EXCLUDED
REASON: §4 Applications (L1216-L1345) is discussion of applications to LQG and biology; it states no formal claim and no root consumes it
COVERAGE_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: queue-reviewer/sonnet

ITEM: inv:cite:L1221:bp-lqg-notes
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L1221-bp-lqg-notes@L1221-L1221
DISPOSITION: EXCLUDED
REASON: citation inside §4 Applications (discussion only; no root consumes it)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: queue-reviewer/sonnet

ITEM: inv:cite:L1237:shef-cle
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L1237-shef-cle@L1237-L1237
DISPOSITION: EXCLUDED
REASON: citation inside §4 Applications (discussion only; no root consumes it)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: queue-reviewer/sonnet

ITEM: inv:cite:L1238:bbg-recursive-approach
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L1238-bbg-recursive-approach@L1238-L1238
DISPOSITION: EXCLUDED
REASON: citation inside §4 Applications (discussion only; no root consumes it)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: queue-reviewer/sonnet

ITEM: inv:cite:L1246:bp-lqg-notes
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L1246-bp-lqg-notes@L1246-L1246
DISPOSITION: EXCLUDED
REASON: citation inside §4 Applications (discussion only; no root consumes it)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: queue-reviewer/sonnet

ITEM: inv:cite:L1246:gms-tutte.2
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L1246-gms-tutte.2@L1246-L1246
DISPOSITION: EXCLUDED
REASON: citation inside §4 Applications (discussion only; no root consumes it)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: queue-reviewer/sonnet

ITEM: inv:cite:L1246:gms-tutte.3
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L1246-gms-tutte.3@L1246-L1246
DISPOSITION: EXCLUDED
REASON: citation inside §4 Applications (discussion only; no root consumes it)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: queue-reviewer/sonnet

ITEM: inv:cite:L1246:nachmias-circle-packing
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L1246-nachmias-circle-packing@L1246-L1246
DISPOSITION: EXCLUDED
REASON: citation inside §4 Applications (discussion only; no root consumes it)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: queue-reviewer/sonnet

ITEM: inv:cite:L1248:msw-non-simple-cle
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L1248-msw-non-simple-cle@L1248-L1248
DISPOSITION: EXCLUDED
REASON: citation inside §4 Applications (discussion only; no root consumes it)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: queue-reviewer/sonnet

ITEM: inv:cite:L1248:shef-cle
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L1248-shef-cle@L1248-L1248
DISPOSITION: EXCLUDED
REASON: citation inside §4 Applications (discussion only; no root consumes it)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: queue-reviewer/sonnet

ITEM: inv:cite:L1253:ag-supercritical-cle4
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L1253-ag-supercritical-cle4@L1253-L1253
DISPOSITION: EXCLUDED
REASON: citation inside §4 Applications (discussion only; no root consumes it)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: queue-reviewer/sonnet

ITEM: inv:cite:L1253:ghpr-central-charge
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L1253-ghpr-central-charge@L1253-L1253
DISPOSITION: EXCLUDED
REASON: citation inside §4 Applications (discussion only; no root consumes it)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: queue-reviewer/sonnet

ITEM: inv:cite:L1255:ag-supercritical-cle4
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L1255-ag-supercritical-cle4@L1255-L1255
DISPOSITION: EXCLUDED
REASON: citation inside §4 Applications (discussion only; no root consumes it)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: queue-reviewer/sonnet

ITEM: inv:cite:L1255:bgs-supercritical-crt
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L1255-bgs-supercritical-crt@L1255-L1255
DISPOSITION: EXCLUDED
REASON: citation inside §4 Applications (discussion only; no root consumes it)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: queue-reviewer/sonnet

ITEM: inv:cite:L1260:aldous-crt1
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L1260-aldous-crt1@L1260-L1260
DISPOSITION: EXCLUDED
REASON: citation inside §4 Applications (discussion only; no root consumes it)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: queue-reviewer/sonnet

ITEM: inv:cite:L1261:bgs-supercritical-crt
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L1261-bgs-supercritical-crt@L1261-L1261
DISPOSITION: EXCLUDED
REASON: citation inside §4 Applications (discussion only; no root consumes it)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: queue-reviewer/sonnet

ITEM: inv:cite:L1261:feng-fk-triviality
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L1261-feng-fk-triviality@L1261-L1261
DISPOSITION: EXCLUDED
REASON: citation inside §4 Applications (discussion only; no root consumes it)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: queue-reviewer/sonnet

ITEM: inv:cite:L1261:ghpr-central-charge
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L1261-ghpr-central-charge@L1261-L1261
DISPOSITION: EXCLUDED
REASON: citation inside §4 Applications (discussion only; no root consumes it)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: queue-reviewer/sonnet

ITEM: inv:cite:L1266:apps-central-charge
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L1266-apps-central-charge@L1266-L1266
DISPOSITION: EXCLUDED
REASON: citation inside §4 Applications (discussion only; no root consumes it)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: queue-reviewer/sonnet

ITEM: inv:cite:L1266:bgs-supercritical-crt
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L1266-bgs-supercritical-crt@L1266-L1266
DISPOSITION: EXCLUDED
REASON: citation inside §4 Applications (discussion only; no root consumes it)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: queue-reviewer/sonnet

ITEM: inv:cite:L1266:ghpr-central-charge
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L1266-ghpr-central-charge@L1266-L1266
DISPOSITION: EXCLUDED
REASON: citation inside §4 Applications (discussion only; no root consumes it)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: queue-reviewer/sonnet

ITEM: inv:cite:L1272:ag-supercritical-cle4
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L1272-ag-supercritical-cle4@L1272-L1272
DISPOSITION: EXCLUDED
REASON: citation inside §4 Applications (discussion only; no root consumes it)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: queue-reviewer/sonnet

ITEM: inv:cite:L1274:ag-supercritical-cle4
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L1274-ag-supercritical-cle4@L1274-L1274
DISPOSITION: EXCLUDED
REASON: citation inside §4 Applications (discussion only; no root consumes it)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: queue-reviewer/sonnet

ITEM: inv:cite:L1274:bgs-supercritical-crt.2
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L1274-bgs-supercritical-crt.2@L1274-L1274
DISPOSITION: EXCLUDED
REASON: citation inside §4 Applications (discussion only; no root consumes it)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: queue-reviewer/sonnet

ITEM: inv:cite:L1274:bgs-supercritical-crt.3
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L1274-bgs-supercritical-crt.3@L1274-L1274
DISPOSITION: EXCLUDED
REASON: citation inside §4 Applications (discussion only; no root consumes it)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: queue-reviewer/sonnet

ITEM: inv:cite:L1276:ag-supercritical-cle4.2
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L1276-ag-supercritical-cle4.2@L1276-L1276
DISPOSITION: EXCLUDED
REASON: citation inside §4 Applications (discussion only; no root consumes it)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: queue-reviewer/sonnet

ITEM: inv:cite:L1276:ag-supercritical-cle4.3
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L1276-ag-supercritical-cle4.3@L1276-L1276
DISPOSITION: EXCLUDED
REASON: citation inside §4 Applications (discussion only; no root consumes it)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: queue-reviewer/sonnet

ITEM: inv:cite:L1284:zinn-justin-six-vertex
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L1284-zinn-justin-six-vertex@L1284-L1284
DISPOSITION: EXCLUDED
REASON: citation inside §4 Applications (discussion only; no root consumes it)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: queue-reviewer/sonnet

ITEM: inv:heading:L1289
KIND: heading
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#heading-L1289@L1289-L1289
DISPOSITION: EXCLUDED
REASON: §4 Applications (L1216-L1345) is discussion of applications to LQG and biology; it states no formal claim and no root consumes it
COVERAGE_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: queue-reviewer/sonnet

ITEM: inv:cite:L1294:Davis2017
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L1294-Davis2017@L1294-L1294
DISPOSITION: EXCLUDED
REASON: citation inside §4 Applications (discussion only; no root consumes it)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: queue-reviewer/sonnet

ITEM: inv:cite:L1296:Durrett2015cancer
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L1296-Durrett2015cancer@L1296-L1296
DISPOSITION: EXCLUDED
REASON: citation inside §4 Applications (discussion only; no root consumes it)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: queue-reviewer/sonnet

ITEM: inv:cite:L1298:Bozic2010
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L1298-Bozic2010@L1298-L1298
DISPOSITION: EXCLUDED
REASON: citation inside §4 Applications (discussion only; no root consumes it)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: queue-reviewer/sonnet

ITEM: inv:cite:L1307:Sottoriva2017
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L1307-Sottoriva2017@L1307-L1307
DISPOSITION: EXCLUDED
REASON: citation inside §4 Applications (discussion only; no root consumes it)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: queue-reviewer/sonnet

ITEM: inv:cite:L1333:Del2009
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L1333-Del2009@L1333-L1333
DISPOSITION: EXCLUDED
REASON: citation inside §4 Applications (discussion only; no root consumes it)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: queue-reviewer/sonnet

ITEM: inv:cite:L1335:Harnevo1991
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L1335-Harnevo1991@L1335-L1335
DISPOSITION: EXCLUDED
REASON: citation inside §4 Applications (discussion only; no root consumes it)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: queue-reviewer/sonnet

ITEM: inv:cite:L1335:Jacob2010
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L1335-Jacob2010@L1335-L1335
DISPOSITION: EXCLUDED
REASON: citation inside §4 Applications (discussion only; no root consumes it)
COVERAGE_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: queue-reviewer/sonnet
