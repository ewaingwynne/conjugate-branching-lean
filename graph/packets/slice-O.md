# Orchestrator-owned nodes

## Nodes

NODE: claim:branching-property
KIND: claim
TITLE: Branching (independence) and Markov property of the generation process
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#bp-setup@L176-L177
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#bp-setup@L176-L177
CONTRACT_ID: paper.claim:branching-property
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: d ∈ ℕ; X = {X(n)}_{n∈ℕ_0} is a d-type branching process (L176-177)
SOURCE_QUANTIFIERS: X; populations x, y; n, m in N_0
SOURCE_CONCLUSION: given X(n) = x, the process (X(n+m))_{m∈ℕ_0} is distributed as X started from x, and X started from x + y is the sum of independent copies started from x and from y
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: def:path-law, def:step-kernel
ROUTES: -
ROUTE_FOR: -
EDGE: def:path-law | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#bp-setup@L176-L177 | the generation process is the Markov chain defined by the path law
EDGE: def:step-kernel | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#bp-setup@L176-L177 | independence of individuals is built into the one-step offspring kernel
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: orchestrator/opus-5.5/session-f41ccbab
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: standard defining property of a branching process, used without statement in the proofs of Lemmas 2.4, 2.9 and elsewhere (merged per ADJUDICATION B2); not a SOURCE_GAP in the paper's terms, but it is a separate Lean characterization theorem of `pathLaw`

## Coverage

ITEM: inv:L437:fixed-pos-remark
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#fixed-pos-remark@L437-L437
DISPOSITION: NODE lem-fixed-pos, prop-conjugate#cond-law-hat
REASON: Remark that Lemma 2.3 implies that in the setting of Proposition 2.2 the fixed point A is either (1,...,1) or in (1,inf)^d. It is the only source evidence for the edge prop-conjugate#cond-law-hat -> lem-fixed-pos, which the proof of Proposition 2.2 (L431) does not cite; the unverified hypothesis 0 < a_k < 1 of Proposition 2.1 is recorded as a SOURCE_GAP on prop-conjugate#cond-law-hat.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -

ITEM: inv:L553:thm-equivalence
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-equivalence-reduction@L553-L553
DISPOSITION: NODE thm-fixed-gf.fixed-point#reduce-to-thm-2-7, eqn-fixed-pt-equiv
REASON: The reduction of Theorem 1.4 to Theorem 2.7 through (2.6); the node is owned by slice A (root thm-fixed-gf.fixed-point), the display (2.6) by slice B.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -

ITEM: inv:L731:asymmetry-note
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-basin-def@L731-L731
DISPOSITION: EXCLUDED
REASON: motivational remark: it cites Proposition 2.10 (prop-unstable) as the origin of the lim / limsup asymmetry in (2.9) but no proof in the root closure consumes it as an input (ADJUDICATION C2); prop-unstable is reached through lem-unstable-ssl and lem-monotone-lim, whose own proofs are owned by slice B
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -

