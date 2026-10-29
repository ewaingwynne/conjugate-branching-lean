# Slice E — countable-type conjugates (batch 2, ERRATA R8, E10)

Added 2026-10-28 after the author froze five new root anchors (`review/batch-2.md`). New nodes only; no existing node is changed. Coverage re-scoping of L928/L934 items is in slice-D with notes.

## Nodes

NODE: prop-cond-on-ext.ctble.cond-law
KIND: proposition
TITLE: Proposition 2.1 (conditional law (2.1)) for countable types, with global extinction
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934
CONTRACT_ID: paper.ctble.prop2_1.condLaw
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X a countable-type branching process (types N), positive regular and non-singular in the sense of Definition 1.3 with d extended to N (L928); E the global extinction event (L930, (1)); a_k = P_k[E] with 0 < a_k < 1 for all k (hypotheses of Proposition 2.1, L390-L397, carried over by 'still holds'; R8(b))
SOURCE_QUANTIFIERS: X; for each k in N: the P_k-conditional law of X given E
SOURCE_CONCLUSION: for each k, the P_k-conditional law of X given global extinction is that of a branching process with offspring law (2.1): Ehat_k[F(X(1))] = a_k^{-1} E_k[F(X(1)) prod_j a_j^{X_j(1)}] (conditional-law paragraph only, R6, R8)
CONSTANT_SCOPE: none
FROZEN_FILE: Conjugate/Frozen/Proposition_2_1_CondLaw_Countable.lean
FROZEN_DECL: Conjugate.proposition_2_1_condLaw_countable
FROZEN_ANCHOR_ID: thm.proposition_2_1_condLaw_countable.v1
FROZEN_ABI_SHA256: 6d31e5333e5775f249b3e6ecaec7311196549dad6e52cf5b3b65ec24d5ff5f09
DEPS: ext:jl08-thm1, def:path-law, def:extinction, def-bp-basic.positive-regular, def-bp-basic.non-singular
ROUTES: -
ROUTE_FOR: -
EDGE: ext:jl08-thm1 | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934 | 'since the result of [JL08] applies also in the countable-type case, (2.1) in Proposition 2.1 still holds'
EDGE: def:path-law | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934 | the conditional law is a law of the generation process
EDGE: def:extinction | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934 | global extinction replaces extinction
EDGE: def-bp-basic.positive-regular | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-regularity-extension@L928-L928 | premise of Proposition 2.1, extended to N at L928
EDGE: def-bp-basic.non-singular | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-regularity-extension@L928-L928 | premise of Proposition 2.1, extended to N at L928
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: the paper asserts the countable-type (2.1) by citation only. Lean route (PLAN §6, as for the finite-type anchor): Doob h-transform on cylinder sets with h(y) = prod_j a_j^{y_j} = P_y[E]; the citation is not formalized. Positive regularity and non-singularity are kept verbatim (R8(b)) though the h-transform does not use them.

NODE: prop-conjugate.ctble
KIND: proposition
TITLE: Proposition 2.2 for countable types, with global extinction
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934
CONTRACT_ID: paper.ctble.prop2_2
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X a positive regular, non-singular countable-type branching process (L928) with generating function f, whose global extinction probability started from any state is one; A in [1,inf)^N with f(A) = A ('Replacing extinction with global extinction, the statement of Proposition 2.2 extends essentially verbatim', L934; R8(b))
SOURCE_QUANTIFIERS: X; A in [1,inf)^N with f(A) = A; X-hat defined by (2.2); for each k in N
SOURCE_CONCLUSION: (2.2) defines the offspring distribution of a branching process X-hat; for each k its global extinction probability from one type-k individual is 1/A_k, and its P-hat_k-conditional law given global extinction is P_k
CONSTANT_SCOPE: none
FROZEN_FILE: Conjugate/Frozen/Proposition_2_2_Countable.lean
FROZEN_DECL: Conjugate.proposition_2_2_countable
FROZEN_ANCHOR_ID: thm.proposition_2_2_countable.v1
FROZEN_ABI_SHA256: 3ce6b7593e0e215319fa2cd52346f98d33a26c234ad66f94e039414252e8ad41
DEPS: prop-conjugate.ctble#offspring-law, prop-conjugate.ctble#ext-prob-hat, prop-conjugate.ctble#cond-law-hat
ROUTES: -
ROUTE_FOR: -
EDGE: prop-conjugate.ctble#offspring-law | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934 | 'with the same proof': first sentence of the proof of Prop 2.2 (L430)
EDGE: prop-conjugate.ctble#ext-prob-hat | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934 | 'with the same proof': 1/A is the vector of extinction probabilities of X-hat (L431)
EDGE: prop-conjugate.ctble#cond-law-hat | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934 | 'with the same proof': conditional law of X-hat given extinction is P (L431)
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Statement transcribed from Proposition 2.2 (L420-L428) with global extinction and types N, per L934 and R8.

NODE: prop-conjugate.ctble#offspring-law
KIND: step
TITLE: Countable types: (2.2) defines an offspring law
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate@L430-L430
CONTRACT_ID: paper.ctble.prop2_2#offspring-law
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: f(A) = A with A in [1,inf)^N
SOURCE_QUANTIFIERS: k in N
SOURCE_CONCLUSION: c -> A_k^{-1} mu_k(c) prod_j A_j^{c_j} is a probability distribution on finitely supported offspring vectors, for each k
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: eqn-generating-function
ROUTES: -
ROUTE_FOR: -
EDGE: eqn-generating-function | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate@L430-L430 | 'Since f(A) = A, (2.2) defines the offspring distribution' (finite proof, reused verbatim)
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Same argument as prop-conjugate#offspring-law; sums over c are countable sums.

NODE: prop-conjugate.ctble#ext-prob-hat
KIND: step
TITLE: Countable types: the global extinction probability of X-hat from type k is 1/A_k
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate@L431-L431
CONTRACT_ID: paper.ctble.prop2_2#ext-prob-hat
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X with global extinction probability one from any state; A in [1,inf)^N with f(A) = A; X-hat as in (2.2)
SOURCE_QUANTIFIERS: k in N
SOURCE_CONCLUSION: P-hat_k[global extinction] = 1/A_k
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: prop-conjugate.ctble#offspring-law, def:extinction, def:path-law, claim:branching-property
ROUTES: -
ROUTE_FOR: -
EDGE: prop-conjugate.ctble#offspring-law | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate@L431-L431 | X-hat is a branching process
EDGE: def:extinction | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934 | global extinction
EDGE: def:path-law | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934 | law of X-hat
EDGE: claim:branching-property | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934 | cylinder probabilities of X-hat are tilted cylinder probabilities of X (independence of individuals)
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: 'with the same proof' — the finite proof identifies 1/A as the extinction vector through Proposition 2.1 / [AN72, V.3 Thm 2] (fixed points of f in [0,1]^d are a and 1), which fails for countable types: there may be a continuum of fixed points in [0,1]^N (L930). The identification must instead use global extinction of X from every state: P-hat_x[X(n) = 0] = P_x[X(n) = 0] / prod_j A_j^{x_j} -> 1/prod_j A_j^{x_j}.

NODE: prop-conjugate.ctble#cond-law-hat
KIND: step
TITLE: Countable types: the conditional law of X-hat given global extinction is P
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate@L431-L431
CONTRACT_ID: paper.ctble.prop2_2#cond-law-hat
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X-hat as in (2.2), with global extinction probabilities 1/A_k
SOURCE_QUANTIFIERS: k in N
SOURCE_CONCLUSION: the P-hat_k-conditional law of X-hat given global extinction is P_k
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: prop-cond-on-ext.ctble.cond-law, prop-conjugate.ctble#ext-prob-hat
ROUTES: -
ROUTE_FOR: -
EDGE: prop-cond-on-ext.ctble.cond-law | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate@L431-L431 | 'By Proposition 2.1 ... the conditional law of X-hat given extinction is the same as the law of X' (finite proof, reused)
EDGE: prop-conjugate.ctble#ext-prob-hat | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate@L431-L431 | the a_k of Proposition 2.1 for X-hat are 1/A_k
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP (as for prop-conjugate#cond-law-hat): applying Proposition 2.1 to X-hat needs X-hat positive regular, non-singular and 0 < 1/A_k < 1, which fails when A = 1. Lean route: the time-n Markov property for X-hat directly (h-transform), with no regularity of X-hat.

NODE: thm-fixed-gf.equivalence.ctble
KIND: theorem
TITLE: Countable types: a conjugate exists iff f has a fixed point in (1,inf)^N
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934
CONTRACT_ID: paper.ctble.equivalence
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X a countable-type branching process with global extinction probability one from one individual of each type (Definition 1.1 context, per type as R7; replaces subcriticality of L238), positive regular and non-singular (L238 hypotheses, d extended to N, L928; R8(c), E10)
SOURCE_QUANTIFIERS: X; existence of a conjugate X-hat; existence of q in (1,inf)^N
SOURCE_CONCLUSION: there is a conjugate branching process for X iff there is q in (1,inf)^N with f(q) = q (existence form, R3(iii), R8(c))
CONSTANT_SCOPE: none
FROZEN_FILE: Conjugate/Frozen/ExistsConjugateIffCountable.lean
FROZEN_DECL: Conjugate.exists_conjugate_iff_exists_fixedPoint_countable
FROZEN_ANCHOR_ID: thm.exists_conjugate_iff_exists_fixedPoint_countable.v1
FROZEN_ABI_SHA256: 2c68124c547cb351e49fa2700161c11473cd26f397a7690b623045ddab2e4f6e
DEPS: thm-fixed-gf.equivalence.ctble#fixed-point-to-conjugate, thm-fixed-gf.equivalence.ctble#conjugate-to-fixed-point
ROUTES: -
ROUTE_FOR: -
EDGE: thm-fixed-gf.equivalence.ctble#fixed-point-to-conjugate | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934 | 'conjugate branching processes correspond to solutions of f(q) = q in (1,inf)^N', direction <=
EDGE: thm-fixed-gf.equivalence.ctble#conjugate-to-fixed-point | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934 | same sentence, direction =>
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: E10: false without positive regularity (sterile type 0 plus types reproducing only themselves: a conjugate exists, no fixed point in (1,inf)^N); anchored with positive regularity. Non-singularity retained for parity (R8(c)).

NODE: thm-fixed-gf.equivalence.ctble#fixed-point-to-conjugate
KIND: application
TITLE: Countable types: a fixed point q in (1,inf)^N gives a conjugate (the tilt by q)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934
CONTRACT_ID: paper.ctble.equivalence#fixed-point-to-conjugate
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: global extinction probability one per type; q in (1,inf)^N with f(q) = q
SOURCE_QUANTIFIERS: X; q
SOURCE_CONCLUSION: the process X-hat of (2.2) with A = q is a conjugate of X: its conditional law given global extinction is P_k and P-hat_k[E] = 1/q_k < 1 = P_k[E], so its law differs
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: prop-conjugate.ctble, claim:branching-property, def-conjugate
ROUTES: -
ROUTE_FOR: -
EDGE: prop-conjugate.ctble | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934 | Proposition 2.2 for countable types gives X-hat with the conditional law and extinction probabilities
EDGE: claim:branching-property | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934 | global extinction from every state follows from per-type extinction (independence of individuals)
EDGE: def-conjugate | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934 | 'we can define a conjugate branching process for X in exactly the same manner as in the finite-type case'
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP (unwritten bridge, as in the finite case): Proposition 2.2 assumes extinction one from any state, Definition 1.1 per type; the bridge is the product formula P_x[E] = prod_k P_k[E]^{x_k}. Positive regularity and non-singularity of X are not used by this direction; theorem_3_1_conjugate and example_3_5_conjugate consume this step without them (Thm 3.1 does not assume X positive regular).

NODE: thm-fixed-gf.equivalence.ctble#conjugate-to-fixed-point
KIND: application
TITLE: Countable types: a conjugate gives a fixed point q in (1,inf)^N
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934
CONTRACT_ID: paper.ctble.equivalence#conjugate-to-fixed-point
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X positive regular with global extinction probability one per type; X-hat a conjugate of X
SOURCE_QUANTIFIERS: X; X-hat
SOURCE_CONCLUSION: q_k := 1 / P-hat_k[global extinction] lies in (1,inf)^N and satisfies f(q) = q
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: prop-cond-on-ext.ctble.cond-law, lem-fixed-pos, def-conjugate
ROUTES: -
ROUTE_FOR: -
EDGE: prop-cond-on-ext.ctble.cond-law | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934 | the conditional law of X-hat given global extinction has offspring law (2.1), i.e. X is the tilt of X-hat
EDGE: lem-fixed-pos | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934 | 'just as in the finite-type case': under positive regularity the fixed point is in (1,inf)^N rather than [1,inf)^N minus {1}
EDGE: def-conjugate | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934 | conjugate definition for countable types
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: Lemma 2.3 is stated for d types; its proof (Fatou; positive regularity) applies verbatim to N types with per-type global extinction. As in the finite case, applying Proposition 2.1 to X-hat needs regularity of X-hat (the leaf thm-fixed-gf.equivalence#conjugate-regularity); Lean route: read the tilt off generation 1 by the time-1 Markov property (no regularity of X-hat). E10 applies.

NODE: thm-fixed-pt-infty.conjugate
KIND: theorem
TITLE: Theorem 3.1, conjugate form: Assumptions I-IV ensure a conjugate branching process
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#assumptions-I-IV@L958-L959
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed-pt-infty@L985-L987
CONTRACT_ID: paper.thm3_1.conjugate
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X a countable-type branching process with global extinction probability one (per type, R7); Assumptions I-IV (L960-L981)
SOURCE_QUANTIFIERS: X; phi, psi; s; t (as in thm-fixed-pt-infty)
SOURCE_CONCLUSION: there exists a conjugate branching process for X ('assumptions which ensure the existence of a conjugate branching process, equivalently, a fixed point ... in (1,inf)^N', L959; E6)
CONSTANT_SCOPE: none
FROZEN_FILE: Conjugate/Frozen/Theorem_3_1_Conjugate.lean
FROZEN_DECL: Conjugate.theorem_3_1_conjugate
FROZEN_ANCHOR_ID: thm.theorem_3_1_conjugate.v1
FROZEN_ABI_SHA256: e83a543ba30fcb1eae3b951a3e9641ca24dc9b11abe36174b523610544b54c49
DEPS: thm-fixed-pt-infty, thm-fixed-gf.equivalence.ctble#fixed-point-to-conjugate
ROUTES: -
ROUTE_FOR: -
EDGE: thm-fixed-pt-infty | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed-pt-infty@L985-L987 | Theorem 3.1 gives q in (1,inf)^N with f(q) = q
EDGE: thm-fixed-gf.equivalence.ctble#fixed-point-to-conjugate | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#assumptions-I-IV@L958-L959 | 'equivalently': the fixed point yields a conjugate
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: L959 says the assumptions ensure a conjugate 'equivalently' a fixed point; the countable equivalence (L934) is stated for positive regular, non-singular X, which Assumptions I-IV do not assume (only the truncations X^d are). Only the fixed point => conjugate direction is needed, and it does not use regularity of X.

NODE: example-ctble.conjugate
KIND: theorem
TITLE: Example 3.5, conjugate form: the example class admits a conjugate branching process
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1183-L1183
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1182-L1201
CONTRACT_ID: paper.ex3_5.conjugate
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: the offspring laws of Example 3.5 (E8: all of (3.23) for every P_k; P_k for k >= 2 dominated by the sum of k i.i.d. samples of P_1)
SOURCE_QUANTIFIERS: X as in Example 3.5
SOURCE_CONCLUSION: there exists a conjugate branching process for X ('a simple class of examples where Theorem 3.1 implies the existence of a conjugate branching process', L1183)
CONSTANT_SCOPE: none
FROZEN_FILE: Conjugate/Frozen/Example_3_5_Conjugate.lean
FROZEN_DECL: Conjugate.example_3_5_conjugate
FROZEN_ANCHOR_ID: thm.example_3_5_conjugate.v1
FROZEN_ABI_SHA256: 976e83537b839e3e47bf7f69c948909d005ee03f92231e81870631eacc4cdcc9
DEPS: example-ctble, thm-fixed-gf.equivalence.ctble#fixed-point-to-conjugate
ROUTES: -
ROUTE_FOR: -
EDGE: example-ctble | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1183-L1183 | Theorem 3.1 applies and gives a fixed point in (1,inf)^N, and global extinction holds
EDGE: thm-fixed-gf.equivalence.ctble#fixed-point-to-conjugate | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1183-L1183 | 'implies the existence of a conjugate'
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Consumes the anchored conclusion of example-ctble (global extinction and a fixed point).
