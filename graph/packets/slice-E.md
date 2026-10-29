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
SOURCE_QUANTIFIERS: X; (a_k := P_k[E]); assume 0 < a_k < 1 for all k; for each k in N: the P_k-conditional law of X given E
SOURCE_CONCLUSION: for each k, the P_k-conditional law of X given global extinction is that of a branching process with offspring law (2.1): Ehat_k[F(X(1))] = a_k^{-1} E_k[F(X(1)) prod_j a_j^{X_j(1)}] (conditional-law paragraph only, R6, R8)
CONSTANT_SCOPE: none
FROZEN_FILE: Conjugate/Frozen/Proposition_2_1_CondLaw_Countable.lean
FROZEN_DECL: Conjugate.proposition_2_1_condLaw_countable
FROZEN_ANCHOR_ID: thm.proposition_2_1_condLaw_countable.v1
FROZEN_ABI_SHA256: 6d31e5333e5775f249b3e6ecaec7311196549dad6e52cf5b3b65ec24d5ff5f09
DEPS: ext:jl08-thm1, def:path-law, def:extinction, claim:branching-property
ROUTES: -
ROUTE_FOR: -
EDGE: ext:jl08-thm1 | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934 | 'since the result of [JL08] applies also in the countable-type case, (2.1) in Proposition 2.1 still holds' (the first sentence of L934 cites [JL08] for the conditioned process being a branching process)
EDGE: def:path-law | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934 | named reconstruction (SOURCE_GAP): the conditional law is a law on generation paths, computed on cylinder sets by the h-transform
EDGE: def:extinction | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934 | global extinction replaces extinction; h(y) = P_y[E] (named reconstruction, SOURCE_GAP)
EDGE: claim:branching-property | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934 | named reconstruction (SOURCE_GAP): h(y) = P_y[E] = prod_j a_j^{y_j} (independence of individuals) and E_x[h(X(1))] = h(x) (Markov property at time 1)
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: graph-reviewer-E2/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: the paper asserts the countable-type (2.1) by citation only. Lean route (PLAN §6, as for the finite-type anchor): Doob h-transform on cylinder sets with h(y) = prod_j a_j^{y_j} = P_y[E]; the identification h(y) = P_y[E] = prod_j a_j^{y_j} is the independence of individuals and the harmonicity E_x[h(X(1))] = h(x) is the time-1 Markov property, both in claim:branching-property; the edges to def:path-law, def:extinction and claim:branching-property are this named reconstruction. The citation is not formalized. Positive regularity and non-singularity are premises kept inside the statement (R8(b)); the h-transform does not use them, so (as for the finite-type node prop-cond-on-ext.cond-law) there are no edges to def-bp-basic.positive-regular / def-bp-basic.non-singular. No edge to ext:an72-v3-thm2: the finite proof cites it for the properties of a, namely f(a) = a and the uniqueness of unit-cube fixed points; uniqueness fails for countable types (L930: possibly a continuum of fixed points) and f(a) = a is the first-step identity a_k = E_k[prod_j a_j^{X_j(1)}] from claim:branching-property.

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
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: graph-reviewer-E/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Statement transcribed from Proposition 2.2 (L420-L428) with global extinction and types N, per L934 and R8. The three step nodes are the unconditional core of the countable Proposition 2.2 and are also consumed directly by thm-fixed-gf.equivalence.ctble#fixed-point-to-conjugate (which does not supply the regularity premises of this root).

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
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: graph-reviewer-E/sonnet
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
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: graph-reviewer-E/sonnet
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
SOURCE_HYPOTHESES: X a countable-type branching process (types N) whose global extinction probability started from any state is one; A in [1,inf)^N with f(A) = A; X-hat the countable-type branching process with offspring distribution (2.2) built from X and A; no positive regularity or non-singularity of X or X-hat is assumed
SOURCE_QUANTIFIERS: X; A; X-hat; for each k in N
SOURCE_CONCLUSION: the P-hat_k-conditional law of X-hat given global extinction is P_k
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: prop-conjugate.ctble#ext-prob-hat, claim:branching-property, def:path-law, def:extinction
ROUTES: -
ROUTE_FOR: -
EDGE: prop-conjugate.ctble#ext-prob-hat | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate@L431-L431 | the finite proof first identifies the extinction probabilities of X-hat as 1/A and then applies (2.1) with a = 1/A (L431); here they give the product formula P-hat_y[E] = prod_j A_j^{-y_j} and the normalization P-hat_k[E] = 1/A_k of the conditional law
EDGE: claim:branching-property | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934 | named reconstruction (SOURCE_GAP): independence of individuals gives the tilted cylinder probabilities of X-hat and the product formula P-hat_y[E] = prod_j P-hat_j[E]^{y_j}; the time-n Markov property of X-hat gives P-hat_k[cylinder, E] = P-hat_k[cylinder] P-hat_{x(n)}[E]
EDGE: def:path-law | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934 | named reconstruction (SOURCE_GAP): the conditional law is a law on generation paths and is identified on cylinder sets of the first n generations
EDGE: def:extinction | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934 | named reconstruction (SOURCE_GAP): global extinction E = {X(n) = 0 for all large n} is invariant under the time-n shift, which turns the time-n Markov property into P-hat_k[cylinder, E] = P-hat_k[cylinder] P-hat_{x(n)}[E]
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: graph-reviewer-E4/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP (as for prop-conjugate#cond-law-hat): the finite proof obtains the conditional law by applying Proposition 2.1 to X-hat (L431), which needs X-hat positive regular, non-singular and 0 < 1/A_k < 1. For countable types the source supplies none of these, and no consumer of this step supplies all of them. Positive regularity and non-singularity of X-hat come from those of X (mutual absolute continuity, L430). These are hypotheses of the root prop-conjugate.ctble but not of thm-fixed-gf.equivalence.ctble#fixed-point-to-conjugate, and the consumers of the latter do not supply them either: theorem_3_1_conjugate, whose Assumptions I-IV give positive regularity only for the truncations X^d with N = N(d), so that the uniform N of Definition 1.3 need not exist for X, and example_3_5_conjugate, for which no graph node derives it (although (3.23) with E8 gives N = 1). Conversely 0 < 1/A_k < 1 holds for fixed-point-to-conjugate (A = q in (1,inf)^N) but fails for A = (1,...,1), which the root prop-conjugate.ctble allows. The step is shared by these consumers, so it is stated without the regularity premises and has no edge to prop-cond-on-ext.ctble.cond-law (the cited route): such an edge would make its premise package a hidden conditional premise that at least one consumer cannot supply. The extinction probabilities P-hat_k[E] = 1/A_k are the conclusion of prop-conjugate.ctble#ext-prob-hat and enter as a dependency, not as a hypothesis; the only extinction hypothesis of this statement is that of X, consumed through that step (fixed-point-to-conjugate obtains extinction from every state from per-type extinction by claim:branching-property). The Lean route reads the conditional law off cylinder sets (def:path-law): P-hat_k[cylinder of the first n generations] = P_k[cylinder] prod_j A_j^{x_j(n)} / A_k (the tilt (2.2), independence of individuals), the time-n Markov property of X-hat with the shift invariance of E (def:extinction), and the product formula P-hat_y[E] = prod_j A_j^{-y_j} (claim:branching-property, named reconstruction), so P-hat_k[cylinder, E] = P_k[cylinder] / A_k; with P-hat_k[E] = 1/A_k (prop-conjugate.ctble#ext-prob-hat) the conditional law is P_k. No regularity of X or X-hat is used.

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
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: graph-reviewer-E/sonnet
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
SOURCE_HYPOTHESES: X a countable-type branching process with global extinction probability one per type; q in (1,inf)^N with f(q) = q (no positive regularity or non-singularity of X)
SOURCE_QUANTIFIERS: X; q
SOURCE_CONCLUSION: the process X-hat of (2.2) with A = q is a conjugate of X: its conditional law given global extinction is P_k and P-hat_k[E] = 1/q_k < 1 = P_k[E], so its law differs
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: prop-conjugate.ctble#offspring-law, prop-conjugate.ctble#ext-prob-hat, prop-conjugate.ctble#cond-law-hat, claim:branching-property, def-conjugate
ROUTES: -
ROUTE_FOR: -
EDGE: prop-conjugate.ctble#offspring-law | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934 | 'with the same proof' (L430): (2.2) with A = q in (1,inf)^N, a subset of [1,inf)^N, defines the offspring law of X-hat because f(q) = q
EDGE: prop-conjugate.ctble#ext-prob-hat | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934 | P-hat_k[global extinction] = 1/q_k < 1 = P_k[global extinction]: the extinction probability of X-hat, and clause (a) of Definition 1.1
EDGE: prop-conjugate.ctble#cond-law-hat | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934 | clause (b) of Definition 1.1: the conditional law of X-hat given global extinction is P_k
EDGE: claim:branching-property | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934 | global extinction from every state follows from per-type extinction (independence of individuals)
EDGE: def-conjugate | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934 | 'we can define a conjugate branching process for X in exactly the same manner as in the finite-type case'
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: graph-reviewer-E2/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP (unwritten bridges, as in the finite case): (i) Proposition 2.2 assumes extinction one from any state, Definition 1.1 per type; the bridge is the product formula P_x[E] = prod_k P_k[E]^{x_k} (claim:branching-property). (ii) Clause (a) of Definition 1.1 (X-hat not equal in law to X) is never discharged in the source; it follows from P-hat_k[E] = 1/q_k < 1 = P_k[E] (finite analogue: thm-fixed-gf.equivalence#hat-differs-from-X). (iii) The dependencies are the three step nodes of Proposition 2.2 for countable types and deliberately not its root prop-conjugate.ctble, whose premises (X positive regular and non-singular, L928, R8(b)) are not hypotheses of this node and are not supplied by its consumers: Assumptions I-IV of Theorem 3.1 give positive regularity only for the truncations X^d (the uniform N of Definition 1.3 need not exist for X), and no node derives it for Example 3.5 (although (3.23) with E8 gives N = 1). Those step nodes are stated without these premises; their source route (Proposition 2.1 applied to X-hat) does need them, see the SOURCE_GAP of prop-conjugate.ctble#cond-law-hat, and the Lean route is the unconditional h-transform. theorem_3_1_conjugate and example_3_5_conjugate consume this step.

NODE: thm-fixed-gf.equivalence.ctble#conjugate-to-fixed-point
KIND: application
TITLE: Countable types: a conjugate gives a fixed point q in (1,inf)^N
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934
CONTRACT_ID: paper.ctble.equivalence#conjugate-to-fixed-point
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X a positive regular, non-singular countable-type branching process with global extinction probability one per type (non-singularity is a premise of thm-fixed-gf.equivalence.ctble#conjugate-regularity and is kept as in the root, R8(c); the Lean route does not use it); X-hat a conjugate of X
SOURCE_QUANTIFIERS: X; X-hat
SOURCE_CONCLUSION: q_k := 1 / P-hat_k[global extinction] lies in (1,inf)^N and satisfies f(q) = q
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: prop-cond-on-ext.ctble.cond-law, thm-fixed-gf.equivalence.ctble#conjugate-regularity, lem-fixed-pos, def-conjugate, def:extinction, eqn-generating-function, claim:branching-property
ROUTES: -
ROUTE_FOR: -
EDGE: prop-cond-on-ext.ctble.cond-law | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934 | the conditional law of X-hat given global extinction has offspring law (2.1), i.e. X is the tilt of X-hat; its premises for X-hat are supplied only by the unwritten package thm-fixed-gf.equivalence.ctble#conjugate-regularity, see NOTE
EDGE: thm-fixed-gf.equivalence.ctble#conjugate-regularity | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934 | premise package of Proposition 2.1 for the given conjugate X-hat (unsupplied by the source; named in the SOURCE_GAP)
EDGE: lem-fixed-pos | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934 | analogy only: 'just as in the finite-type case': under positive regularity a fixed point is in (1,inf)^N rather than [1,inf)^N minus {1} (Lemma 2.3 is a d-type statement)
EDGE: def-conjugate | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934 | clause (a) excludes the trivial tilt q = (1,...,1); clause (b) identifies the conditional law with P (the source never writes this)
EDGE: def:extinction | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934 | q_k := 1/P-hat_k[global extinction]
EDGE: eqn-generating-function | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934 | f_k(q) = E_k[prod_j q_j^{X_j(1)}] is evaluated through the tilt to give f(q) = q (converse of the proof of Proposition 2.2, L430-L431)
EDGE: claim:branching-property | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934 | named reconstruction (SOURCE_GAP): time-1 Markov property and product formula P-hat_y[E] = prod_j P-hat_j[E]^{y_j}; also per-type extinction implies extinction from every state (premise of Lemma 2.3)
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: graph-reviewer-E3/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: the converse direction is not written for countable types. It compresses the three finite-type steps thm-fixed-gf.equivalence#conjugate-regularity, #conjugate-is-tilt and #conjugate-to-fixed-point. Lemma 2.3 is stated for d types; its proof (Fatou; positive regularity) applies verbatim to N types with per-type global extinction, but only through the countable-type identities f^{(n)}_k(q) = E_k[prod_j q_j^{X_j(n)}] that the paper never states (L927 only defines f^{(n)} as a composition; cf. the SOURCE_GAP of thm-fixed-pt-infty#positivity), so the edge to lem-fixed-pos is by analogy only. As in the finite case, applying Proposition 2.1 to X-hat needs the premise package thm-fixed-gf.equivalence.ctble#conjugate-regularity (unsupplied by the source); the Lean route avoids it by reading the tilt off generation 1 with the time-1 Markov property and the product formula P-hat_y[E] = prod_j P-hat_j[E]^{y_j} (claim:branching-property), then f_k(q) = q_k from the total mass of the offspring law of X-hat (eqn-generating-function) and q in (1,inf)^N from Lemma 2.3 plus clause (a). E10 applies: positive regularity is used only by lem-fixed-pos.

NODE: thm-fixed-pt-infty.conjugate
KIND: theorem
TITLE: Theorem 3.1, conjugate form: Assumptions I-IV ensure a conjugate branching process
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#assumptions-I-IV@L958-L959
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed-pt-infty@L985-L987
CONTRACT_ID: paper.thm3_1.conjugate
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X = {X(n)}_{n∈ℕ_0} is a countable-type branching process with types k∈ℕ and finite offspring (3.1): ℙ_k[Σ_{j≥1} X_j(1)<∞]=1 for every k∈ℕ; X has global extinction probability one (L958; read as for every starting type k); Assumption I: for each d∈ℕ the truncation X^d satisfies the hypotheses of Theorem 1.4 (subcritical; positive regular and non-singular; f^d_k continuous from (0,∞]^d to (0,∞] for each k∈{1,…,d}); Assumption II: there exist φ,ψ:ℕ→[1,∞) with lim_{k→∞}φ(k)=∞ and lim_{k→∞}log ψ(k)/φ(k)=0 such that f_k(q)≤ψ(k)[f_1(q)]^{φ(k)} for all k∈ℕ and all q∈[1,∞)^ℕ; Assumption III: there exists s>1 with 𝔼_k[s^{Σ_{j≥1}φ(j)X_j(1)}]≤s^{φ(k)} for all k∈ℕ; Assumption IV: there exists t>1 with f_1(t,1,1,…)>t and f_k({ψ(j)t^{φ(j)}}_{j∈ℕ})<∞ for all k∈ℕ (the hypotheses of thm-fixed-pt-infty, exactly the binders of theorem_3_1, R8(d))
SOURCE_QUANTIFIERS: X (countable type, (3.1), global extinction probability one); Assumption I (for every d in N); exists phi, psi (Assumption II); exists s > 1 (Assumption III, for these phi); exists t > 1 (Assumption IV, for these phi, psi); exists X-hat a conjugate branching process for X
SOURCE_CONCLUSION: there exists a conjugate branching process for X ('assumptions which ensure the existence of a conjugate branching process, equivalently, a fixed point ... in (1,inf)^N', L959; E6)
CONSTANT_SCOPE: X-hat is quantified after X and the assumption witnesses phi, psi, s, t supplied by the hypotheses; no relation to the witness q of thm-fixed-pt-infty is claimed (separate anchor, not a split)
FROZEN_FILE: Conjugate/Frozen/Theorem_3_1_Conjugate.lean
FROZEN_DECL: Conjugate.theorem_3_1_conjugate
FROZEN_ANCHOR_ID: thm.theorem_3_1_conjugate.v1
FROZEN_ABI_SHA256: e83a543ba30fcb1eae3b951a3e9641ca24dc9b11abe36174b523610544b54c49
DEPS: thm-fixed-pt-infty, thm-fixed-gf.equivalence.ctble#fixed-point-to-conjugate
ROUTES: -
ROUTE_FOR: -
EDGE: thm-fixed-pt-infty | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed-pt-infty@L985-L987 | Theorem 3.1 gives q in (1,inf)^N with f(q) = q
EDGE: thm-fixed-gf.equivalence.ctble#fixed-point-to-conjugate | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#assumptions-I-IV@L958-L959 | 'equivalently': the fixed point yields a conjugate
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: graph-reviewer-E2/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: L959 says the assumptions ensure a conjugate 'equivalently' a fixed point; the equivalence of L934 is read under positive regularity and non-singularity of X (R8(c), E10; L934 itself states no regularity hypothesis, the finite statement L238 does), and Assumptions I-IV do not assume these for X (Assumption I gives them only for each truncation X^d, with N = N(d) possibly unbounded in d, so the uniform N of Definition 1.3 need not exist for X). Only the fixed point => conjugate direction is needed, and it does not use regularity of X: the edge goes to thm-fixed-gf.equivalence.ctble#fixed-point-to-conjugate and not to the root thm-fixed-gf.equivalence.ctble, whose premises Theorem 3.1 does not supply.

NODE: example-ctble.conjugate
KIND: theorem
TITLE: Example 3.5, conjugate form: the example class admits a conjugate branching process
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1183-L1183
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1182-L1201
CONTRACT_ID: paper.ex3_5.conjugate
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: ℙ_1 is a probability measure on sequences {X_j(1)}_{j∈ℕ} of non-negative integers satisfying (3.23): ℙ_1[X_j(1)≥1]>0 for all j∈ℕ; ℙ_1[X_1(1)≥2]>0; 𝔼_1[u^{Σ_{j≥1}jX_j(1)}]<∞ for all u>1; 𝔼_1[Σ_{j≥1}jX_j(1)]<1; for each k≥2, ℙ_k is a probability measure on such sequences satisfying (3.23) with ℙ_k, 𝔼_k in place of ℙ_1, 𝔼_1 (E8: all four conditions) and stochastically dominated by the componentwise sum of k i.i.d. samples from ℙ_1; X is the countable-type branching process whose offspring law of a type-k individual is ℙ_k, k∈ℕ (the hypotheses of example-ctble, exactly the binders of example_3_5, R8(d))
SOURCE_QUANTIFIERS: P_1; P_k for each k >= 2; the branching process X with offspring laws {P_k}_{k in N}; exists X-hat a conjugate branching process for X
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
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: graph-reviewer-E2/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: L1183 says Theorem 3.1 'implies the existence of a conjugate branching process' and gives no argument; the step fixed point => conjugate is thm-fixed-gf.equivalence.ctble#fixed-point-to-conjugate (L934), consumed here with the anchored conclusion of example-ctble (global extinction probability one per type, and a fixed point in (1,inf)^N). X of Example 3.5 is in fact positive regular (N = 1 by (3.23), E8) but that step does not use it.

NODE: thm-fixed-gf.equivalence.ctble#conjugate-regularity
KIND: step
TITLE: Countable types: premises of Proposition 2.1 for a conjugate process X-hat (positive regular, non-singular, 0 < P-hat_k[E] < 1)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-conjugate-extension@L934-L934
CONTRACT_ID: paper.ctble.equivalence#conjugate-regularity
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X a positive regular, non-singular countable-type branching process with global extinction probability one per type; X-hat a conjugate branching process for X in the sense of Definition 1.1
SOURCE_QUANTIFIERS: X; X-hat conjugate for X; k in N
SOURCE_CONCLUSION: X-hat is positive regular and non-singular and 0 < P-hat_k[global extinction] < 1 for each k in N, i.e. every premise of the countable-type Proposition 2.1 holds for X-hat
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: graph-reviewer-E2/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: countable-type analogue of thm-fixed-gf.equivalence#conjugate-regularity. The premises of Proposition 2.1 (L390-L397, extended to N at L928) are never checked for a conjugate X-hat, neither at L934 nor in the finite-type text; the package is recorded as the unsupplied premise set under which thm-fixed-gf.equivalence.ctble#conjugate-to-fixed-point applies prop-cond-on-ext.ctble.cond-law to X-hat. Lean route: not needed, the tilt is read off generation 1 with the time-1 Markov property.

