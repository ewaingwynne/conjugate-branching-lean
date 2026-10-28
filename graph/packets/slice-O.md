# Orchestrator-owned nodes

## Nodes

NODE: claim:branching-property
KIND: claim
TITLE: Branching (independence) and Markov property of the generation process
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#bp-setup@L176-L177
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#bp-setup@L176-L177
CONTRACT_ID: paper.claim:branching-property
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X is a d-type branching process (L176-177)
SOURCE_QUANTIFIERS: X; populations x, y; n, m in N_0
SOURCE_CONCLUSION: given X(n) = x, the process (X(n+m))_m is distributed as X started from x, and X started from x + y is the sum of independent copies started from x and from y (in particular E_x[prod_j q_j^(X_j(m))] = prod_k f_k^(m)(q)^(x_k))
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
