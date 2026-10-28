# Proof dependency database — arXiv:2411.06301v2 (conjugate branching processes)

GRAPH_VERSION: 4
ROOTS: thm-fixed-gf.fixed-point, thm-fixed-gf.conjugate, thm-fixed-gf.equivalence, prop-single-type.fixed-point, prop-single-type.conjugate, prop-cond-on-ext.cond-law, prop-conjugate, thm-fixed, thm-fixed-pt-infty, counterexample, example-ctble, rem:hyp-iii-necessary, rem:hyp-iii-automatic
CORPUS: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex sha256:b0fb466bfd59b1fd0e03757eddca48f8e67aa194a43b66880d2caeb677061670
CONVENTIONS: see graph/EXTRACTION_SPEC.md §3 (paper indexing in source fields; f on [0,∞]^d, g on [-∞,∞]^d; M finite inside subcritical; Def 2.8 order; rulings E1-E8, R1-R6)
STANDING_ASSUMPTIONS: -
EXTERNAL_POLICY: cited literature results and named standard theorems explicitly invoked by a proof are KIND external leaves (graph/EXTRACTION_SPEC.md §5); routine facts below the step threshold are not nodes
FROZEN_ANCHORS: def:population-sigma, def:step-kernel, def:path-law, def:extinction, def-conjugate, eqn-generating-function, eqn-mean-matrix, def:subcritical, def-bp-basic.positive-regular, def-bp-basic.non-singular, def-log-gf, eqn-basin-def.zero, eqn-basin-def.infty, def:truncation, def:stoch-dom, thm-fixed-gf.fixed-point, thm-fixed-gf.conjugate, thm-fixed-gf.equivalence, prop-single-type.fixed-point, prop-single-type.conjugate, prop-cond-on-ext.cond-law, prop-conjugate, thm-fixed, thm-fixed-pt-infty, counterexample, example-ctble, rem:hyp-iii-necessary, rem:hyp-iii-automatic
FROZEN_MANIFEST: frozen-anchor-manifest.json | sha256:a735f3ce9e29a57154affcc72f18e05490295a40306a231e960ef604bfca2844
WRITER: orchestrator/opus-5.5/session-f41ccbab
GLOBAL_REVIEWER: -
GLOBAL_REVIEW_REF: -

The dependency direction is `NODE -> prerequisite`. `DEPS` is conjunctive. `ROUTES` lists
alternative `KIND: route` nodes; one route is sufficient. Lean fields are initialized planning
metadata and are not evaluated here. Node schema: see
`~/.claude/skills/build-proof-dependency-graph/assets/DEPGRAPH.template.md`.

## Nodes

NODE: def:population-sigma
KIND: definition
TITLE: Measurable structure on populations and paths of a d-type branching process
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#bp-setup@L176-L177
PROOF_SOURCE: -
CONTRACT_ID: paper.def.populationMeasurableSpace
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: d ∈ ℕ; X = {X(n)}_{n∈ℕ_0} is a d-type branching process whose population vector X(n) = (X_1(n),…,X_d(n)) takes values in ℕ_0^d
SOURCE_QUANTIFIERS: d ∈ ℕ; process X; generation n ∈ ℕ_0
SOURCE_CONCLUSION: the (implicit) measurable structure on the population space ℕ_0^d and on the space of paths of populations with respect to which X_j(n), the laws ℙ_k, the expectations 𝔼_k and the bounded measurable test functions F : ℕ_0^d → ℝ of (2.1) and (2.2) (L402, L427, slice B) are understood; the paper never writes this structure out
CONSTANT_SCOPE: none
FROZEN_FILE: Conjugate/Frozen/Defs/PopulationMeasurableSpace.lean
FROZEN_DECL: Conjugate.populationMeasurableSpace
FROZEN_ANCHOR_ID: def.populationMeasurableSpace.v1
FROZEN_ABI_SHA256: 98d6e8f17a8fbbf47f2376e7f4b24e45caeebc5a06a5eae8bbb2a81a7deb1613
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: definition leaf. Slice-A text is only L176-L177; the manifest range also cites L402, L427, L915-L918 (slices B, D). Consumed through eqn-gen-func-n and claim:mean-matrix-powers (measurability of X(n) for 𝔼_k); no definition-to-definition edge is proposed

NODE: def:step-kernel
KIND: definition
TITLE: One-generation branching mechanism (step kernel) of a d-type branching process
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#bp-setup@L176-L177
PROOF_SOURCE: -
CONTRACT_ID: paper.def.stepKernel
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: d ∈ ℕ; for each type k ∈ {1,…,d} an offspring law on ℕ_0^d (the numbers of children of each type of a type-k individual), the branching process being identified with its family of offspring laws (spec §3)
SOURCE_QUANTIFIERS: d ∈ ℕ; type k ∈ {1,…,d}; generation n ∈ ℕ_0
SOURCE_CONCLUSION: X_j(n) is the number of type-j individuals in generation n; the population X(n+1) of the next generation is the sum, over the individuals of X(n), of independent offspring vectors drawn from the offspring law of each individual's type
CONSTANT_SCOPE: none
FROZEN_FILE: Conjugate/Frozen/Defs/StepKernel.lean
FROZEN_DECL: Conjugate.stepKernel
FROZEN_ANCHOR_ID: def.stepKernel.v1
FROZEN_ABI_SHA256: adde03310e606b6255e52a5077af0424ba2bc245679ea0e947f3f0c43b928a7a
DEPS: def:population-sigma
ROUTES: -
ROUTE_FOR: -
EDGE: def:population-sigma | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#bp-setup@L176-L177 | the kernel is a law on populations, which carry the discrete sigma-algebra
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: definition leaf. The paper only says 'd-type branching process' (L176); the offspring mechanism is the standard definition implicit in that phrase. Consumed through eqn-gen-func-n and claim:mean-matrix-powers (branching property)

NODE: def:path-law
KIND: definition
TITLE: Law ℙ_k and expectation 𝔼_k of the process started from a single type-k individual
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#bp-setup@L176-L177
PROOF_SOURCE: -
CONTRACT_ID: paper.def.pathLaw
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: d ∈ ℕ; X = {X(n)}_{n∈ℕ_0} is a d-type branching process; k ∈ {1,…,d}
SOURCE_QUANTIFIERS: d ∈ ℕ; X; k ∈ {1,…,d}
SOURCE_CONCLUSION: ℙ_k is the probability measure (law of the whole process {X(n)}_{n∈ℕ_0}) under which X_k(0) = 1 and X_j(0) = 0 for j ≠ k, and 𝔼_k is the corresponding expectation
CONSTANT_SCOPE: none
FROZEN_FILE: Conjugate/Frozen/Defs/PathLaw.lean
FROZEN_DECL: Conjugate.pathLaw
FROZEN_ANCHOR_ID: def.pathLaw.v1
FROZEN_ABI_SHA256: 2372048aaa8bc54fbfa32e7bd267288703d52bd79a97acbf3e07309474f3d1a1
DEPS: def:step-kernel
ROUTES: -
ROUTE_FOR: -
EDGE: def:step-kernel | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#bp-setup@L176-L177 | the path law is the Markov chain whose transitions are the one-step offspring kernel
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: definition leaf. Consumed through eqn-gen-func-n and claim:mean-matrix-powers (generation-n expectations under ℙ_k)

NODE: def:extinction
KIND: definition
TITLE: Extinction event E of a branching process
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#extinction-event@L179-L179
PROOF_SOURCE: -
CONTRACT_ID: paper.def.extinctionEvent
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: d ∈ ℕ; X = {X(n)}_{n∈ℕ_0} is a d-type branching process
SOURCE_QUANTIFIERS: d ∈ ℕ; X; k ∈ {1,…,d} for the measure ℙ_k
SOURCE_CONCLUSION: E is the event that X(n) = 0 for all sufficiently large n (the process eventually becomes extinct); the extinction probability started from type k is ℙ_k[E]
CONSTANT_SCOPE: none
FROZEN_FILE: Conjugate/Frozen/Defs/ExtinctionEvent.lean
FROZEN_DECL: Conjugate.extinctionEvent
FROZEN_ANCHOR_ID: def.extinctionEvent.v1
FROZEN_ABI_SHA256: 029afe3845b4a340f7f51ca5ad0c46ac5c86167dee9a1668f6910cc3bcdfcace
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: definition leaf. The classical-conditioning fact in the same sentence (assume 0 < ℙ_k[E] < 1; the conditional law is subcritical, L179) is Prop 2.1 and belongs to slice B (prop-cond-on-ext.cond-law, R6); it is not a slice-A node

NODE: def-conjugate
KIND: definition
TITLE: Conjugate branching process (Definition 1.1)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#def-conjugate@L184-L187
PROOF_SOURCE: -
CONTRACT_ID: paper.def.IsConjugate
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X = {X(n) : n ∈ ℕ} is a subcritical d-type branching process; the ℙ_k-extinction probability of X is one for each k ∈ {1,…,d}
SOURCE_QUANTIFIERS: d ∈ ℕ; X (subcritical with certain extinction); X̂ a d-type branching process; for each k ∈ {1,…,d}
SOURCE_CONCLUSION: X̂ is called a conjugate branching process for X iff (a) X̂ does not have the same law as X and (b) for each k ∈ {1,…,d} the conditional law of X̂ (started from a single type-k individual) given that it eventually becomes extinct is the same as the ℙ_k-law of X
CONSTANT_SCOPE: none
FROZEN_FILE: Conjugate/Frozen/Defs/IsConjugate.lean
FROZEN_DECL: Conjugate.IsConjugate
FROZEN_ANCHOR_ID: def.IsConjugate.v1
FROZEN_ABI_SHA256: f6bcafcfaf8bd0ae3f9ee76d0e290d7c7ae70a0c175ef00027da56e0a789c22d
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: definition leaf. R1: the Definition 1.1 context (subcritical, extinction probability one) is not inside the Lean IsConjugate predicate; source fields keep the paper's wording. Consumed by the two direction steps of thm-fixed-gf.equivalence. The countable-type reuse at L934 is slice D

NODE: eqn-generating-function
KIND: definition
TITLE: Generating function f of a d-type branching process (display 1.1)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-generating-function@L203-L208
PROOF_SOURCE: -
CONTRACT_ID: paper.def.genFun
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: d ∈ ℕ; X = {X(n)}_{n∈ℕ_0} is a d-type branching process
SOURCE_QUANTIFIERS: d ∈ ℕ; X; k ∈ {1,…,d}; q = (q_1,…,q_d) ∈ (0,∞]^d
SOURCE_CONCLUSION: f : (0,∞]^d → (0,∞]^d is defined by f_k(q) := 𝔼_k[∏_{j=1}^d q_j^{X_j(1)}] and f(q) = (f_1(q),…,f_d(q)), with the conventions ∞^0 = 1 and ∞^x = ∞ for x > 0
CONSTANT_SCOPE: none
FROZEN_FILE: Conjugate/Frozen/Defs/GenFun.lean
FROZEN_DECL: Conjugate.genFun
FROZEN_ANCHOR_ID: def.genFun.v1
FROZEN_ABI_SHA256: 5d96211315214940f56bc4128ab12c73b79fa91d079d185c1f50b4be8f3b0d1c
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: definition leaf. Paper domain is (0,∞]^d (L204); the Lean convention of spec §3 extends it to [0,∞]^d with the same formula. Consumed by eqn-gen-func-n, the conjugate-is-tilt step and the Prop 1.6 steps

NODE: eqn-mean-matrix
KIND: definition
TITLE: Mean matrix M of a d-type branching process (display 1.3)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-mean-matrix@L215-L218
PROOF_SOURCE: -
CONTRACT_ID: paper.def.meanMatrix
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: d ∈ ℕ; X = {X(n)}_{n∈ℕ_0} is a d-type branching process
SOURCE_QUANTIFIERS: d ∈ ℕ; X; k, j ∈ {1,…,d}
SOURCE_CONCLUSION: M is the d × d matrix with entries M_{k,j} := 𝔼_k[X_j(1)] ∈ [0,∞]
CONSTANT_SCOPE: none
FROZEN_FILE: Conjugate/Frozen/Defs/MeanMatrix.lean
FROZEN_DECL: Conjugate.meanMatrix
FROZEN_ANCHOR_ID: def.meanMatrix.v1
FROZEN_ABI_SHA256: dff61f8e61cbe15e3579255adc6f1d37b5baa6abcd5ae5f6899ace77e6f66cbb
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: definition leaf. Finiteness of the entries is a separate sentence (L219) bundled into def:subcritical (R1) and recorded as a hypothesis of claim:mean-matrix-powers

NODE: def:subcritical
KIND: definition
TITLE: Subcritical branching process (largest eigenvalue of M below one)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#subcritical-def@L219-L220
PROOF_SOURCE: -
CONTRACT_ID: paper.def.IsSubcritical
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: d ∈ ℕ; X a d-type branching process with mean matrix M of display (1.3); each M_{k,j} is finite
SOURCE_QUANTIFIERS: d ∈ ℕ; X; ρ = largest eigenvalue of M
SOURCE_CONCLUSION: X is subcritical iff ρ < 1 (critical iff ρ = 1, supercritical iff ρ > 1)
CONSTANT_SCOPE: none
FROZEN_FILE: Conjugate/Frozen/Defs/IsSubcritical.lean
FROZEN_DECL: Conjugate.IsSubcritical
FROZEN_ANCHOR_ID: def.IsSubcritical.v1
FROZEN_ABI_SHA256: e70d8da7c37614b34bd483024a839f1be91c19ee7b6bd021bdd6c99df38a5e4a
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: definition leaf. R1: finiteness of every M_{k,j} (L219, 'We assume that each M_{k,j} is finite') is bundled into 'subcritical'; ρ is the spectral radius. Consumed by the single-type hypothesis check of prop-single-type.conjugate and (outside slice A) by lem-gf-bded

NODE: def-bp-basic.positive-regular
KIND: definition
TITLE: Positive regular branching process (Definition 1.3, first part)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#def-bp-basic@L225-L229
PROOF_SOURCE: -
CONTRACT_ID: paper.def.IsPositiveRegular
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: d ∈ ℕ; X = {X(n)}_{n∈ℕ_0} is a d-type branching process
SOURCE_QUANTIFIERS: d ∈ ℕ; X; ∃ N ∈ ℕ; ∀ k, j ∈ {1,…,d}
SOURCE_CONCLUSION: X is positive regular iff there exists N ∈ ℕ such that ℙ_k[X_j(N) ≥ 1] > 0 for all k, j ∈ {1,…,d}
CONSTANT_SCOPE: N depends on X only
FROZEN_FILE: Conjugate/Frozen/Defs/IsPositiveRegular.lean
FROZEN_DECL: Conjugate.IsPositiveRegular
FROZEN_ANCHOR_ID: def.IsPositiveRegular.v1
FROZEN_ABI_SHA256: e05d2b9a55ef42cf5628e1a4460361152c5d0f0c198614c69ef3e769a4291435
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: definition leaf. The clause 'equivalent to the condition that M^N has all positive entries' (L229) is a separate claim: it is consumed by the Perron-Frobenius application at L508 (lem-gf-bded#perron-frobenius) and is modeled as def-bp-basic.positive-regular#matrix-equiv. N ≥ 1 (R1)

NODE: def-bp-basic.non-singular
KIND: definition
TITLE: Non-singular branching process (Definition 1.3, second part)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#def-bp-basic@L230-L233
PROOF_SOURCE: -
CONTRACT_ID: paper.def.IsNonsingular
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: d ∈ ℕ; X = {X(n)}_{n∈ℕ_0} is a d-type branching process
SOURCE_QUANTIFIERS: d ∈ ℕ; X; ∃ k ∈ {1,…,d}
SOURCE_CONCLUSION: X is non-singular iff there exists k ∈ {1,…,d} such that ℙ_k[Σ_{j=1}^d X_j(1) ≥ 2] > 0
CONSTANT_SCOPE: none
FROZEN_FILE: Conjugate/Frozen/Defs/IsNonsingular.lean
FROZEN_DECL: Conjugate.IsNonsingular
FROZEN_ANCHOR_ID: def.IsNonsingular.v1
FROZEN_ABI_SHA256: 246bd29740c5ec0b8a051ef2c5dd283b578c5d27bcb90febab7318df7452d5d9
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: definition leaf

NODE: eqn-gen-func-n
KIND: claim
TITLE: Iterates of the generating function (display 1.2)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-gen-func-n@L209-L213
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-gen-func-n@L209-L210
CONTRACT_ID: paper.eqn-gen-func-n
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: d ∈ ℕ; X = {X(n)}_{n∈ℕ_0} is a d-type branching process with generating function f of display (1.1); n ∈ ℕ
SOURCE_QUANTIFIERS: d ∈ ℕ; X; n ∈ ℕ; k ∈ {1,…,d}; q ∈ (0,∞]^d
SOURCE_CONCLUSION: the k-th component of the n-fold composition f^{(n)} = f∘…∘f equals 𝔼_k[∏_{j=1}^d q_j^{X_j(n)}] (E2: product over j ≤ d; the source prints j ≤ k)
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: eqn-generating-function, claim:branching-property, def:path-law
ROUTES: -
ROUTE_FOR: -
EDGE: eqn-generating-function | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-gen-func-n@L209-L213 | f in 'the composition of f with itself n times' is the one-generation generating function of display (1.1)
EDGE: def:path-law | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-gen-func-n@L209-L213 | the generation-n expectation is taken under ℙ_k, the law of the process started from one type-k individual
EDGE: claim:branching-property | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-gen-func-n@L209-L213 | the identity between the n-fold composition and the generation-n expectation ('Equivalently') is the branching (independent offspring) and Markov property of the generation process; the paper gives no argument
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: the paper asserts the identification with a bare 'Equivalently' and gives no proof. The edge to claim:branching-property is the characterization consumption of spec §8, not source-stated; def:step-kernel and def:population-sigma are reached through def:path-law and claim:branching-property. Feeds slices B-D (lem-fixed-pos L454-L467, display (2.5) L540)

NODE: claim:mean-matrix-powers
KIND: claim
TITLE: Entries of M^n are n-th generation means
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#mean-matrix-powers@L219-L220
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#mean-matrix-powers@L220-L220
CONTRACT_ID: paper.claim:mean-matrix-powers
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: d ∈ ℕ; X a d-type branching process with mean matrix M of display (1.3); each M_{k,j} is finite
SOURCE_QUANTIFIERS: d ∈ ℕ; X; n ∈ ℕ; k, j ∈ {1,…,d}
SOURCE_CONCLUSION: the (k,j) entry of M^n equals 𝔼_k[X_j(n)]
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: eqn-mean-matrix, claim:branching-property, def:path-law
ROUTES: -
ROUTE_FOR: -
EDGE: eqn-mean-matrix | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#mean-matrix-powers@L219-L220 | M is the matrix of display (1.3) whose powers are being identified
EDGE: def:path-law | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#mean-matrix-powers@L219-L220 | the mean 𝔼_k[X_j(n)] is taken under ℙ_k
EDGE: claim:branching-property | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#mean-matrix-powers@L219-L220 | the n-th generation mean is obtained by iterating the one-generation mechanism, i.e. by the branching and Markov property; the paper gives no argument
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: asserted ('Then for n ∈ ℕ, the k,j entry of M^n is 𝔼_k[X_j(n)]') with no proof. Consumed by lem-gf-bded#perron-frobenius

NODE: thm-fixed-gf.fixed-point
KIND: theorem
TITLE: Theorem 1.4, fixed-point form
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed-gf@L241-L250
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-equiv@L548-L557
CONTRACT_ID: paper.thm1_4.fixedPoint
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: d ∈ ℕ; X = {X(n)}_{n∈ℕ_0} is a d-type branching process with generating function f; (I) X is subcritical, i.e. ρ < 1; (II) X is positive regular and non-singular (Definition 1.3); (III) for each k ∈ {1,…,d} (E1; the source prints k ∈ ℕ) the component f_k is a continuous function from (0,∞]^d to (0,∞], with (0,∞] carrying the half-open-interval topology
SOURCE_QUANTIFIERS: d ∈ ℕ; X satisfying (I)-(III); ∃ q ∈ (1,∞)^d
SOURCE_CONCLUSION: there exists q ∈ (1,∞)^d with f(q) = q
CONSTANT_SCOPE: none; the witness q depends on X only and is independent of the witnesses of thm-fixed-gf.conjugate and thm-fixed-gf.equivalence (R3 split, independent witnesses)
FROZEN_FILE: Conjugate/Frozen/Theorem_1_4_FixedPoint.lean
FROZEN_DECL: Conjugate.theorem_1_4_fixedPoint
FROZEN_ANCHOR_ID: thm.theorem_1_4_fixedPoint.v1
FROZEN_ABI_SHA256: 60a9a3c78807be049624125acbefc987e9480282f5407f9e72fbf8b1be682e79
DEPS: thm-fixed-gf.fixed-point#reduce-to-thm-2-7
ROUTES: -
ROUTE_FOR: -
EDGE: thm-fixed-gf.fixed-point#reduce-to-thm-2-7 | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-equiv@L548-L557 | L553: 'Therefore, Theorem 1.4 is equivalent to the following statement'; the root is obtained from Theorem 2.7 through the g to f carrier change
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: proof is the reduction at L548-L557 plus the proof of thm-fixed (L894-L905, slice C); the paper has no separate proof paragraph for Theorem 1.4. Hypothesis III is consumed inside the proof of thm-fixed (basin openness, slice C) and is supplied by this root's own hypotheses

NODE: thm-fixed-gf.fixed-point#reduce-to-thm-2-7
KIND: application
TITLE: Reduction of Theorem 1.4 to Theorem 2.7 via q = e^λ
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed-gf@L241-L250
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-equiv@L548-L557
CONTRACT_ID: paper.thm-fixed-gf.fixed-point#reduce-to-thm-2-7
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: hypotheses (I)-(III) of Theorem 1.4 (the setting assumed throughout §2.2, L528)
SOURCE_QUANTIFIERS: d ∈ ℕ; X satisfying (I)-(III); λ ∈ (0,∞)^d with g(λ) = λ (the witness of Theorem 2.7); q := e^λ componentwise
SOURCE_CONCLUSION: q := (e^{λ_1},…,e^{λ_d}) lies in (1,∞)^d and satisfies f(q) = q
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: thm-fixed, eqn-fixed-pt-equiv
ROUTES: -
ROUTE_FOR: -
EDGE: thm-fixed | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed@L553-L557 | supplies λ ∈ (0,∞)^d with g(λ) = λ; the hypotheses of Theorem 2.7 (setting of Theorem 1.4, L528) are exactly the root's (I)-(III)
EDGE: eqn-fixed-pt-equiv | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-equiv@L548-L553 | converts g(λ) = λ into f(e^λ) = e^λ; λ ∈ (0,∞)^d is e^λ ∈ (1,∞)^d
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: carrier-change step (λ = log q) named in spec §6; premises of thm-fixed are discharged by the root's own hypotheses (I)-(III)

NODE: thm-fixed-gf.conjugate
KIND: theorem
TITLE: Theorem 1.4, conjugate form
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed-gf@L241-L250
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed-gf@L249-L249
CONTRACT_ID: paper.thm1_4.conjugate
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: d ∈ ℕ; X = {X(n)}_{n∈ℕ_0} is a d-type branching process with generating function f; (I) X is subcritical, i.e. ρ < 1; (II) X is positive regular and non-singular (Definition 1.3); (III) for each k ∈ {1,…,d} (E1; the source prints k ∈ ℕ) the component f_k is a continuous function from (0,∞]^d to (0,∞], with (0,∞] carrying the half-open-interval topology
SOURCE_QUANTIFIERS: d ∈ ℕ; X satisfying (I)-(III); ∃ X̂ a d-type branching process
SOURCE_CONCLUSION: there exists a conjugate branching process X̂ for X in the sense of Definition 1.1
CONSTANT_SCOPE: none; the witness X̂ depends on X only and is independent of the witness of thm-fixed-gf.fixed-point (R3 split, independent witnesses)
FROZEN_FILE: Conjugate/Frozen/Theorem_1_4_Conjugate.lean
FROZEN_DECL: Conjugate.theorem_1_4_conjugate
FROZEN_ANCHOR_ID: thm.theorem_1_4_conjugate.v1
FROZEN_ABI_SHA256: ae0441875035cde86a0846001f3021e499f947d76f759864ce855d4b578c761f
DEPS: thm-fixed-gf.fixed-point, thm-fixed-gf.equivalence
ROUTES: -
ROUTE_FOR: -
EDGE: thm-fixed-gf.fixed-point | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed-gf@L249-L249 | the conclusion 'equivalently, there exists q ∈ (1,∞)^d such that f(q) = q' supplies the fixed point; hypotheses (I)-(III) are the root's own
EDGE: thm-fixed-gf.equivalence | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed-gf@L249-L249 | the 'equivalently' clause of Theorem 1.4 (restating the equivalence of L238) converts the fixed point into a conjugate; its premises (subcritical, positive regular, non-singular) are the root's hypotheses (I) and (II)
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: the paper proves no separate statement here; the 'equivalently' clause of L249 together with L238 is the whole derivation. No extra application node is split out because the premises of the equivalence are literally hypotheses (I) and (II)

NODE: thm-fixed-gf.equivalence
KIND: theorem
TITLE: Existence of a conjugate is equivalent to existence of a fixed point in (1,∞)^d
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#conjugate-iff-fixed-point@L238-L238
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#conjugate-iff-fixed-point@L238-L238
CONTRACT_ID: paper.thm1_4.equivalence
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: d ∈ ℕ; X is a subcritical, positive regular and non-singular d-type branching process with generating function f
SOURCE_QUANTIFIERS: d ∈ ℕ; X; (∃ X̂ a d-type branching process that is a conjugate for X in the sense of Definition 1.1) iff (∃ q ∈ (1,∞)^d with f(q) = q)
SOURCE_CONCLUSION: the existence of a conjugate branching process for X in the sense of Definition 1.1 is equivalent to the existence of a point q ∈ (1,∞)^d for which f(q) = q
CONSTANT_SCOPE: none; each side's witness is independent of the other and of the other parts of Theorem 1.4 (R3 split, independent witnesses). Hypothesis (III) of Theorem 1.4 is not a hypothesis here
FROZEN_FILE: Conjugate/Frozen/ExistsConjugateIff.lean
FROZEN_DECL: Conjugate.exists_conjugate_iff_exists_fixedPoint
FROZEN_ANCHOR_ID: thm.exists_conjugate_iff_exists_fixedPoint.v1
FROZEN_ABI_SHA256: 8b5e83dea9a90b228d39d3b5cd00e167176f545879b0d61eaa1a780b1b761ae3
DEPS: thm-fixed-gf.equivalence#fixed-point-to-conjugate, thm-fixed-gf.equivalence#conjugate-to-fixed-point
ROUTES: -
ROUTE_FOR: -
EDGE: thm-fixed-gf.equivalence#fixed-point-to-conjugate | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#conjugate-iff-fixed-point@L238-L238 | the direction 'fixed point implies conjugate' of the iff; the paper points to Proposition 2.2 for it
EDGE: thm-fixed-gf.equivalence#conjugate-to-fixed-point | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#conjugate-iff-fixed-point@L238-L238 | the direction 'conjugate implies fixed point' of the iff
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: the paper's only argument is 'It is easy to see ... (see Proposition 2.2 below)'; the unproved bridges are the child nodes marked SOURCE_GAP (two directions and four premise steps), none of which is stated in the paper. L249 repeats the equivalence as the 'equivalently' clause of Theorem 1.4

NODE: claim:subcritical-extinction
KIND: step
TITLE: Subcritical, positive regular, non-singular implies extinction probability one
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#conjugate-iff-fixed-point@L238-L238
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#conjugate-iff-fixed-point@L238-L238
CONTRACT_ID: paper.claim:subcritical-extinction
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: d ∈ ℕ; X is a subcritical, positive regular and non-singular d-type branching process
SOURCE_QUANTIFIERS: d ∈ ℕ; X; k ∈ {1,…,d}
SOURCE_CONCLUSION: ℙ_k[E] = 1 for every k ∈ {1,…,d}, where E is the extinction event
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: Definition 1.1 (L185) and Proposition 2.2 (L421) both assume that the extinction probability is one, while L238 and Theorem 1.4 assume only subcriticality, positive regularity and non-singularity; the paper never states that these imply certain extinction. No edge is added to ext:an72-v3-thm2 because the source does not invoke it here; orchestrator may decide whether to add it. Merged per ADJUDICATION A3/C1: the same unproved claim is invoked at L628 ("Since the extinction probability is one (Hypothesis I)") and in the Lemma 2.3 application at L905; all three uses consume this node

NODE: thm-fixed-gf.equivalence#hat-differs-from-X
KIND: step
TITLE: The tilted process of Proposition 2.2 is not equal in law to X
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#conjugate-iff-fixed-point@L238-L238
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#conjugate-iff-fixed-point@L238-L238
CONTRACT_ID: paper.thm-fixed-gf.equivalence#hat-differs-from-X
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: d ∈ ℕ; X is a subcritical, positive regular and non-singular d-type branching process with generating function f; A ∈ (1,∞)^d with f(A) = A; X̂ is the branching process of display (2.2) built from A
SOURCE_QUANTIFIERS: d ∈ ℕ; X; A ∈ (1,∞)^d with f(A) = A; X̂ determined by A
SOURCE_CONCLUSION: X̂ does not have the same law as X (clause (a) of Definition 1.1)
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: prop-conjugate, claim:subcritical-extinction
ROUTES: -
ROUTE_FOR: -
EDGE: prop-conjugate | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#conjugate-iff-fixed-point@L238-L238 | Proposition 2.2 gives extinction probability 1/A_k < 1 for X̂ (L427), which differs from the extinction probability one of X
EDGE: claim:subcritical-extinction | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#conjugate-iff-fixed-point@L238-L238 | the comparison needs X to have extinction probability exactly one
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: Proposition 2.2 concludes only the extinction probability and the conditional law of X̂; clause (a) of Definition 1.1 is never discharged in the paper

NODE: thm-fixed-gf.equivalence#fixed-point-to-conjugate
KIND: application
TITLE: Fixed point in (1,∞)^d gives a conjugate (application of Proposition 2.2)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#conjugate-iff-fixed-point@L238-L238
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#conjugate-iff-fixed-point@L238-L238
CONTRACT_ID: paper.thm-fixed-gf.equivalence#fixed-point-to-conjugate
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: d ∈ ℕ; X is a subcritical, positive regular and non-singular d-type branching process with generating function f; q ∈ (1,∞)^d with f(q) = q
SOURCE_QUANTIFIERS: d ∈ ℕ; X; q ∈ (1,∞)^d with f(q) = q; ∃ X̂
SOURCE_CONCLUSION: there exists a conjugate branching process X̂ for X in the sense of Definition 1.1, namely the process of display (2.2) with A = q
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: prop-conjugate, claim:subcritical-extinction, thm-fixed-gf.equivalence#hat-differs-from-X, def-conjugate
ROUTES: -
ROUTE_FOR: -
EDGE: prop-conjugate | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#conjugate-iff-fixed-point@L238-L238 | '(see Proposition 2.2 below)': builds X̂ from A = q ∈ [1,∞)^d and gives the conditional-law clause (b); its premises are positive regular, non-singular (hypotheses), extinction probability one (extinction-certain step) and A ∈ [1,∞)^d (q ∈ (1,∞)^d)
EDGE: claim:subcritical-extinction | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#conjugate-iff-fixed-point@L238-L238 | discharges the premise 'extinction probability started from any state is one' of Proposition 2.2 (L421) and the context of Definition 1.1
EDGE: thm-fixed-gf.equivalence#hat-differs-from-X | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#conjugate-iff-fixed-point@L238-L238 | discharges clause (a) of Definition 1.1, which Proposition 2.2 does not state
EDGE: def-conjugate | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#conjugate-iff-fixed-point@L238-L238 | L238 asks for a conjugate 'in the sense of Definition 1.1'; both clauses (a) and (b) must be verified for X̂
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: the paper only points to Proposition 2.2; discharge of its premises and of clause (a) is not written. Edges are reconstruction of the pointer 'see Proposition 2.2 below'

NODE: thm-fixed-gf.equivalence#conjugate-regularity
KIND: step
TITLE: Premises of Proposition 2.1 for a conjugate process X̂ (positive regular, non-singular, 0 < ℙ̂_k[E] < 1)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#conjugate-iff-fixed-point@L238-L238
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#conjugate-iff-fixed-point@L238-L238
CONTRACT_ID: paper.thm-fixed-gf.equivalence#conjugate-regularity
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: d ∈ ℕ; X is a subcritical, positive regular and non-singular d-type branching process; X̂ is a conjugate branching process for X in the sense of Definition 1.1
SOURCE_QUANTIFIERS: d ∈ ℕ; X; X̂ conjugate for X; k ∈ {1,…,d}
SOURCE_CONCLUSION: X̂ is positive regular and non-singular and 0 < ℙ̂_k[E] < 1 for each k ∈ {1,…,d}, i.e. every premise of Proposition 2.1 (L391, L397) holds for X̂ (the lower bound is also what makes the conditioning in clause (b) of Definition 1.1 meaningful)
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: Proposition 2.1 (L391, L397) is stated for a positive regular, non-singular process with 0 < a_k < 1 for every k; a conjugate X̂ is assumed to satisfy none of these and the paper never checks them. This node exposes all of them as the premises under which thm-fixed-gf.equivalence#conjugate-is-tilt applies Proposition 2.1 to X̂. The bound ℙ̂_k[E] < 1 is NOT supplied by the source; the extractor's observation that it would make Lemma 2.3 redundant, and that A = (1,…,1) is only excluded afterwards by clause (a), is retained as an ambiguity for the orchestrator (neither argument is supplied here; if the orchestrator prefers to keep this node at `> 0` only, then `#conjugate-is-tilt` must instead be marked DISPUTED because Proposition 2.1 is applied without its premise a_k < 1)

NODE: thm-fixed-gf.equivalence#conjugate-is-tilt
KIND: application
TITLE: A conjugate is an exponential tilt of X by A = 1/ℙ̂[E], and A is a fixed point
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#conjugate-iff-fixed-point@L238-L238
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#conjugate-iff-fixed-point@L238-L238
CONTRACT_ID: paper.thm-fixed-gf.equivalence#conjugate-is-tilt
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: d ∈ ℕ; X is a subcritical, positive regular and non-singular d-type branching process with generating function f; X̂ is a conjugate branching process for X in the sense of Definition 1.1
SOURCE_QUANTIFIERS: d ∈ ℕ; X; X̂ conjugate for X; â_k := ℙ̂_k[E] for k ∈ {1,…,d}; A_k := 1/â_k (well defined by thm-fixed-gf.equivalence#conjugate-regularity)
SOURCE_CONCLUSION: A ∈ [1,∞)^d; the offspring laws of X̂ are the tilt of those of X by A as in display (2.2), equivalently those of X are the tilt of X̂ by â as in display (2.1); and f(A) = A
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: prop-cond-on-ext.cond-law, thm-fixed-gf.equivalence#conjugate-regularity, def:extinction, def-conjugate, eqn-generating-function
ROUTES: -
ROUTE_FOR: -
EDGE: prop-cond-on-ext.cond-law | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#conjugate-iff-fixed-point@L238-L238 | display (2.1) expresses the conditional law of X̂ given extinction as a tilt by the extinction probabilities; the same use of Proposition 2.1 in the reverse direction is at L431
EDGE: thm-fixed-gf.equivalence#conjugate-regularity | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#conjugate-iff-fixed-point@L238-L238 | discharges the regularity and positive-extinction-probability premises under which formula (2.1) is applied to X̂
EDGE: def:extinction | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#conjugate-iff-fixed-point@L238-L238 | the tilting parameters are the extinction probabilities â_k = ℙ̂_k[E] of X̂
EDGE: def-conjugate | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#conjugate-iff-fixed-point@L238-L238 | clause (b) of Definition 1.1 identifies the conditional law of X̂ with the law of X
EDGE: eqn-generating-function | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#conjugate-iff-fixed-point@L238-L238 | f_k(A) = 𝔼_k[∏ A_j^{X_j(1)}] is evaluated through the tilt to give f(A) = A
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: the paper never writes the inverse tilt computation f(A) = A for a given conjugate; it is the converse of the proof of Proposition 2.2 (L430-L431). Edges are the reconstruction indicated by the orchestrator (Propositions 2.1/2.2); L238 itself does not invoke Proposition 2.1

NODE: thm-fixed-gf.equivalence#conjugate-to-fixed-point
KIND: application
TITLE: Conjugate gives a fixed point in (1,∞)^d (uses Lemma 2.3 and clause (a))
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#conjugate-iff-fixed-point@L238-L238
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#conjugate-iff-fixed-point@L238-L238
CONTRACT_ID: paper.thm-fixed-gf.equivalence#conjugate-to-fixed-point
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: d ∈ ℕ; X is a subcritical, positive regular and non-singular d-type branching process with generating function f; X̂ is a conjugate branching process for X
SOURCE_QUANTIFIERS: d ∈ ℕ; X; X̂ conjugate for X; A := 1/ℙ̂[E]; ∃ q ∈ (1,∞)^d
SOURCE_CONCLUSION: q := A lies in (1,∞)^d and f(q) = q
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: thm-fixed-gf.equivalence#conjugate-is-tilt, lem-fixed-pos, claim:subcritical-extinction, def-conjugate
ROUTES: -
ROUTE_FOR: -
EDGE: thm-fixed-gf.equivalence#conjugate-is-tilt | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#conjugate-iff-fixed-point@L238-L238 | supplies A ∈ [1,∞)^d with f(A) = A and the tilt relation between X̂ and X
EDGE: lem-fixed-pos | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-pos-role@L437-L437 | L437: Lemma 2.3 implies that a fixed point A in the setting of Proposition 2.2 is either (1,…,1) or in (1,∞)^d; it needs A ∈ (0,∞)^d with f(A) = A, positive regularity and certain extinction
EDGE: claim:subcritical-extinction | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-pos-role@L437-L437 | discharges the premise 'extinction probability started from any state is one' of Lemma 2.3
EDGE: def-conjugate | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#conjugate-iff-fixed-point@L238-L238 | clause (a) (X̂ is not equal in law to X) excludes A = (1,…,1), for which the tilt is trivial
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: the converse direction of the equivalence is not written. Edge to lem-fixed-pos cites L437, where the paper itself ties Lemma 2.3 to the Proposition 2.2 setting; exclusion of A = (1,…,1) from clause (a) is not written anywhere

NODE: prop-single-type.fixed-point
KIND: theorem
TITLE: Proposition 1.6, fixed-point form (single type)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L343-L351
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L352-L355
CONTRACT_ID: paper.prop1_6.fixedPoint
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X = {X(n)}_{n≥0} is a single-type branching process started from a single individual with generating function f; (I) X is subcritical, i.e. 𝔼[X(1)] < 1; (II) ℙ[X(1) ≥ 2] > 0; (III) f is continuous from (0,∞] to (0,∞], with (0,∞] carrying the half-open-interval topology
SOURCE_QUANTIFIERS: X (d = 1) satisfying (I)-(III); ∃! q
SOURCE_CONCLUSION: there exists a unique q ∈ (1,∞) with f(q) = q (E7: the source prints q > 1 and is read as q ∈ (1,∞))
CONSTANT_SCOPE: none; the fixed point depends on X only; R5 split: independent of the witness of prop-single-type.conjugate
FROZEN_FILE: Conjugate/Frozen/Proposition_1_6_FixedPoint.lean
FROZEN_DECL: Conjugate.proposition_1_6_fixedPoint
FROZEN_ANCHOR_ID: thm.proposition_1_6_fixedPoint.v1
FROZEN_ABI_SHA256: ed854fd7bac3e9807f038336520fdb6c369ad7ea86bc3b07fefa04eb0836a736
DEPS: prop-single-type#fixed-point-exists, prop-single-type#at-most-two-fixed-points
ROUTES: -
ROUTE_FOR: -
EDGE: prop-single-type#fixed-point-exists | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L354-L354 | 'there exists q̄ ∈ [s,t] for which f(q̄) = q̄' gives existence, and q̄ ≥ s > 1
EDGE: prop-single-type#at-most-two-fixed-points | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L354-L354 | 'at most two values of q ... namely 1 and q̄' gives uniqueness in (1,∞)
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: the proof is the paragraph L353-L354; steps below follow its sentences in order

NODE: prop-single-type#finite-near-one
KIND: step
TITLE: f is finite on a right neighbourhood [1,1+ε] of 1
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L343-L351
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L353-L353
CONTRACT_ID: paper.prop-single-type#finite-near-one
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X single-type with generating function f; (III) f is continuous from (0,∞] to (0,∞]
SOURCE_QUANTIFIERS: X; ∃ ε > 0; ∀ q ∈ [1,1+ε]
SOURCE_CONCLUSION: f(1) = 1 and f(q) < ∞ for all q ∈ [1,1+ε]
CONSTANT_SCOPE: ε depends on f only
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: eqn-generating-function
ROUTES: -
ROUTE_FOR: -
EDGE: eqn-generating-function | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L353-L353 | 'Since f(1) = 1': f_1(1) = 𝔼[1^{X(1)}] = 1 by the definition of f
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: parameter choice (ε) from continuity of f at 1; hypothesis (III) is the root's own hypothesis

NODE: prop-single-type#mean-eq-derivative
KIND: step
TITLE: 𝔼[X(1)] equals f'(1)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L343-L351
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L354-L354
CONTRACT_ID: paper.prop-single-type#mean-eq-derivative
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X single-type branching process started from a single individual with generating function f; (I) 𝔼[X(1)] < 1; (III) f is continuous from (0,∞] to (0,∞], with (0,∞] carrying the half-open-interval topology
SOURCE_QUANTIFIERS: X; ε the witness of prop-single-type#finite-near-one
SOURCE_CONCLUSION: 𝔼[X(1)] = f'(1), the derivative of f at 1 (f being finite on [1,1+ε]), and consequently f'(1) < 1
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: eqn-generating-function, eqn-mean-matrix, prop-single-type#finite-near-one
ROUTES: -
ROUTE_FOR: -
EDGE: eqn-generating-function | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L354-L354 | f'(1) is the derivative of f_1(q) = 𝔼[q^{X(1)}] at q = 1
EDGE: eqn-mean-matrix | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L354-L354 | for d = 1 the mean matrix is M_{1,1} = 𝔼[X(1)]; the identity is the d = 1 case of 'M is the Jacobian matrix of f at 1' (L510)
EDGE: prop-single-type#finite-near-one | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L353-L354 | differentiability at 1 uses that f is finite on [1,1+ε]
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: 'We have 𝔼[X(1)] = f'(1)' is asserted without justification

NODE: prop-single-type#f-below-diagonal
KIND: step
TITLE: f(s) < s for some s > 1 close to 1 (Taylor expansion)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L343-L351
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L354-L354
CONTRACT_ID: paper.prop-single-type#f-below-diagonal
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X single-type branching process started from a single individual with generating function f; (I) 𝔼[X(1)] < 1
SOURCE_QUANTIFIERS: X; ∃ s > 1 (sufficiently close to 1)
SOURCE_CONCLUSION: there exists s > 1 with f(s) < s
CONSTANT_SCOPE: s depends on f only
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: prop-single-type#mean-eq-derivative, ext:taylor
ROUTES: -
ROUTE_FOR: -
EDGE: prop-single-type#mean-eq-derivative | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L354-L354 | 'E[X(1)] = f'(1) < 1, so ...' supplies f'(1) < 1
EDGE: ext:taylor | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L354-L354 | 'by Taylor expansion' gives f(s) = 1 + f'(1)(s-1) + o(s-1) < s for s > 1 close to 1
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: witness choice of s; hypothesis (I) is the root's own

NODE: prop-single-type#f-above-diagonal
KIND: step
TITLE: f(t) > t for some large t
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L343-L351
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L354-L354
CONTRACT_ID: paper.prop-single-type#f-above-diagonal
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X single-type with generating function f; (II) ℙ[X(1) ≥ 2] > 0
SOURCE_QUANTIFIERS: X; ∃ t > 1 (sufficiently large)
SOURCE_CONCLUSION: there exists t > 1 with f(t) > t
CONSTANT_SCOPE: t depends on f only; t is implicitly taken larger than s so that [s,t] is an interval
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: witness choice of t; justified in the source only by 'By Hypothesis II'; hypothesis (II) is the root's own. The requirement t > s is not written

NODE: prop-single-type#fixed-point-exists
KIND: step
TITLE: Intermediate value argument gives q̄ ∈ [s,t] with f(q̄) = q̄
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L343-L351
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L354-L354
CONTRACT_ID: paper.prop-single-type#fixed-point-exists
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X single-type branching process started from a single individual with generating function f; (III) f is continuous from (0,∞] to (0,∞], with (0,∞] carrying the half-open-interval topology
SOURCE_QUANTIFIERS: X; s and t the witnesses of prop-single-type#f-below-diagonal and prop-single-type#f-above-diagonal (s < t); ∃ q̄ ∈ [s,t]
SOURCE_CONCLUSION: there exists q̄ ∈ [s,t] ⊂ (1,∞) with f(q̄) = q̄
CONSTANT_SCOPE: q̄ depends on f only
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: prop-single-type#f-below-diagonal, prop-single-type#f-above-diagonal
ROUTES: -
ROUTE_FOR: -
EDGE: prop-single-type#f-below-diagonal | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L354-L354 | f(s) < s is the lower endpoint sign of the crossing argument on [s,t]
EDGE: prop-single-type#f-above-diagonal | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L354-L354 | f(t) > t is the upper endpoint sign of the crossing argument on [s,t]
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: continuity hypothesis (III) is the root's own; the intermediate-value step is quoted as 'By Hypothesis III, there exists q̄ ∈ [s,t]'

NODE: prop-single-type#strict-convexity
KIND: step
TITLE: f'' > 0 where f is finite, so f is convex on its maximal finite interval
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L343-L351
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L354-L354
CONTRACT_ID: paper.prop-single-type#strict-convexity
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X single-type with generating function f; (II) ℙ[X(1) ≥ 2] > 0
SOURCE_QUANTIFIERS: X; q > 0 with f(q) < ∞
SOURCE_CONCLUSION: f''(q) > 0 for every q > 0 with f(q) < ∞, hence f is convex on the maximal interval on which it is finite-valued
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: 'f''(q) > 0 for all q > 0 for which f(q) < ∞' is asserted without computation; the only trace of the role of hypothesis (II) here is its label (item-single-type-convex)

NODE: prop-single-type#at-most-two-fixed-points
KIND: step
TITLE: At most two fixed points: 1 and q̄
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L343-L351
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L354-L354
CONTRACT_ID: paper.prop-single-type#at-most-two-fixed-points
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X single-type branching process started from a single individual with generating function f; (II) ℙ[X(1) ≥ 2] > 0
SOURCE_QUANTIFIERS: X; q > 0; q̄ the fixed point of prop-single-type#fixed-point-exists
SOURCE_CONCLUSION: there are at most two values of q with f(q) = q, namely 1 and q̄; in particular q̄ is the only solution in (1,∞)
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: prop-single-type#strict-convexity, prop-single-type#fixed-point-exists, eqn-generating-function
ROUTES: -
ROUTE_FOR: -
EDGE: prop-single-type#strict-convexity | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L354-L354 | 'Hence there are at most two values of q for which f(q) = q' follows from convexity on the finite interval
EDGE: prop-single-type#fixed-point-exists | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L354-L354 | identifies the second fixed point as q̄ ('namely 1 and q̄')
EDGE: eqn-generating-function | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L353-L354 | 'namely 1 and q̄': f(1) = 𝔼[1^{X(1)}] = 1 (the proof's 'Since f(1) = 1') shows that 1 is the other fixed point
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: quantifier closure: a fixed point q ∈ (1,∞) has f(q) = q < ∞, so it lies in the finite interval and must equal q̄

NODE: prop-single-type.conjugate
KIND: theorem
TITLE: Proposition 1.6, conjugate form (single type)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L343-L351
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L350-L350
CONTRACT_ID: paper.prop1_6.conjugate
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X = {X(n)}_{n≥0} is a single-type branching process started from a single individual with generating function f; (I) X is subcritical, i.e. 𝔼[X(1)] < 1; (II) ℙ[X(1) ≥ 2] > 0; (III) f is continuous from (0,∞] to (0,∞], with (0,∞] carrying the half-open-interval topology
SOURCE_QUANTIFIERS: X (d = 1) satisfying (I)-(III); ∃ a conjugate X̂, and any conjugate is unique
SOURCE_CONCLUSION: there exists a unique conjugate branching process for X (R5: a conjugate exists and any two conjugates have the same law when started from a single individual)
CONSTANT_SCOPE: none; the witness depends on X only and is independent of the witness of prop-single-type.fixed-point (R5 split, independent witnesses)
FROZEN_FILE: Conjugate/Frozen/Proposition_1_6_Conjugate.lean
FROZEN_DECL: Conjugate.proposition_1_6_conjugate
FROZEN_ANCHOR_ID: thm.proposition_1_6_conjugate.v1
FROZEN_ABI_SHA256: eb22dc06b010505b63a7a7772da6a03209fe64a2c23b3d1e8654107c9313ea16
DEPS: prop-single-type.conjugate#existence, prop-single-type.conjugate#unique-in-law
ROUTES: -
ROUTE_FOR: -
EDGE: prop-single-type.conjugate#existence | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L350-L350 | 'there exists a unique conjugate branching process for X': the existence part
EDGE: prop-single-type.conjugate#unique-in-law | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L350-L350 | 'there exists a unique conjugate branching process for X': the uniqueness part
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: the proof paragraph L353-L355 treats only the fixed-point form; the conjugate form rests on the bare 'Equivalently' of L350, carried by the child nodes marked SOURCE_GAP. Uniqueness is read as uniqueness in law (R5)

NODE: prop-single-type.conjugate#hyps-imply-equivalence-hypotheses
KIND: step
TITLE: Single-type hypotheses (I)-(III) give the hypotheses of the equivalence for d = 1
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L343-L351
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L346-L347
CONTRACT_ID: paper.prop-single-type.conjugate#hyps-imply-equivalence-hypotheses
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X single-type with (I) 𝔼[X(1)] < 1 and (II) ℙ[X(1) ≥ 2] > 0
SOURCE_QUANTIFIERS: X (d = 1)
SOURCE_CONCLUSION: X, viewed as a 1-type branching process, is subcritical (ρ = M_{1,1} = 𝔼[X(1)] < 1), non-singular (ℙ[X(1) ≥ 2] > 0) and positive regular (ℙ_1[X_1(N) ≥ 1] > 0 for some N)
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: def:subcritical, eqn-mean-matrix, def-bp-basic.positive-regular, def-bp-basic.non-singular
ROUTES: -
ROUTE_FOR: -
EDGE: def:subcritical | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L346-L346 | hypothesis (I) rewrites 'subcritical' as 𝔼[X(1)] < 1, i.e. spectral radius of the 1 × 1 mean matrix below one
EDGE: def-bp-basic.positive-regular | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L347-L347 | positive regularity for d = 1 is not stated in Proposition 1.6 and must be derived from (II)
EDGE: def-bp-basic.non-singular | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L347-L347 | hypothesis (II) is Definition 1.3 non-singularity for d = 1
EDGE: eqn-mean-matrix | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L346-L346 | 'subcritical, i.e. 𝔼[X(1)] < 1': for d = 1 the mean matrix is M_{1,1} = 𝔼[X(1)] by (1.3), so ρ = M_{1,1}
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: partly. 'subcritical, i.e. 𝔼[X(1)] < 1' and the non-singular reading of (II) are source-stated; positive regularity is not mentioned anywhere in Proposition 1.6 or its proof

NODE: prop-single-type.conjugate#existence
KIND: application
TITLE: Existence of a conjugate for the single-type process
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L343-L351
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L350-L350
CONTRACT_ID: paper.prop-single-type.conjugate#existence
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X single-type branching process started from a single individual satisfying (I)-(III) of Proposition 1.6
SOURCE_QUANTIFIERS: X (d = 1); ∃ X̂
SOURCE_CONCLUSION: there exists a conjugate branching process for X
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: prop-single-type.fixed-point, thm-fixed-gf.equivalence, prop-single-type.conjugate#hyps-imply-equivalence-hypotheses
ROUTES: -
ROUTE_FOR: -
EDGE: prop-single-type.fixed-point | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L350-L350 | 'Equivalently, there exists a unique value of q > 1 for which f(q) = q': the fixed point from the fixed-point form is the input of the equivalence
EDGE: thm-fixed-gf.equivalence | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L350-L350 | the 'Equivalently' bridge between a conjugate and a fixed point in (1,∞) is the equivalence of L238 with d = 1
EDGE: prop-single-type.conjugate#hyps-imply-equivalence-hypotheses | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L350-L350 | discharges the premises (subcritical, positive regular, non-singular) of the equivalence
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: only the word 'Equivalently' links the two forms. Alternative derivation not offered by the source (not modeled as a route): thm-fixed-gf.conjugate specialised to d = 1

NODE: prop-single-type.conjugate#unique-in-law
KIND: step
TITLE: Any two conjugates of the single-type process have the same law
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L343-L351
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L350-L350
CONTRACT_ID: paper.prop-single-type.conjugate#unique-in-law
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X single-type satisfying (I)-(III) of Proposition 1.6; X̂_1 and X̂_2 are conjugates for X
SOURCE_QUANTIFIERS: X (d = 1); X̂_1, X̂_2 conjugates of X
SOURCE_CONCLUSION: X̂_1 and X̂_2 have the same law when started from a single individual
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: prop-single-type.fixed-point, thm-fixed-gf.equivalence#conjugate-is-tilt, thm-fixed-gf.equivalence#conjugate-to-fixed-point, prop-single-type.conjugate#hyps-imply-equivalence-hypotheses
ROUTES: -
ROUTE_FOR: -
EDGE: prop-single-type.fixed-point | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L350-L350 | 'unique value of q > 1' makes the two fixed points coming from X̂_1 and X̂_2 equal
EDGE: thm-fixed-gf.equivalence#conjugate-is-tilt | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L350-L350 | each conjugate is the tilt of X by A = 1/ℙ̂[E], so its law is determined by A
EDGE: thm-fixed-gf.equivalence#conjugate-to-fixed-point | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L350-L350 | places A in (1,∞) so that the uniqueness of the fixed point in (1,∞) applies
EDGE: prop-single-type.conjugate#hyps-imply-equivalence-hypotheses | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L350-L350 | discharges the premises of the two steps of thm-fixed-gf.equivalence used above
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: uniqueness of the conjugate in law is asserted only through 'Equivalently'; the correspondence between conjugates and fixed points being injective is not written

NODE: counterexample
KIND: theorem
TITLE: Example 1.5 (non-uniqueness of the conjugate): three fixed points in (1,∞)^2
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#counterexample@L255-L264
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#counterexample@L262-L262
CONTRACT_ID: paper.ex1_5
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: d = 2; for each k ∈ {1,2} the offspring law under ℙ_k is ℙ_k[X_k(1) = 1, X_{3-k}(1) = 0] = ℙ_k[X_k(1) = 2, X_{3-k}(1) = 0] = 1/4, ℙ_k[X_k(1) = X_{3-k}(1) = 2] = 1/100, ℙ_k[X_k(1) = X_{3-k}(1) = 0] = 49/100
SOURCE_QUANTIFIERS: for all k ∈ {1,2} the offspring law above; X the resulting 2-type branching process; then the hypotheses of Theorem 1.4 hold and ∃ three solutions q ∈ (1,∞)^2 of f(q) = q
SOURCE_CONCLUSION: X satisfies hypotheses (I)-(III) of Theorem 1.4, and the equation f(q_1,q_2) = (q_1,q_2) has three solutions in (1,∞)^2 (author ruling R4: anchored as at least three distinct solutions)
CONSTANT_SCOPE: none; the offspring masses are the fixed numbers 1/4, 1/4, 1/100, 49/100
FROZEN_FILE: Conjugate/Frozen/Example_1_5.lean
FROZEN_DECL: Conjugate.example_1_5
FROZEN_ANCHOR_ID: thm.example_1_5.v1
FROZEN_ABI_SHA256: b00c67e0781cfdc17a070d2527c868c04f159bf161b256fbf7e30c07ea5b3287
DEPS: counterexample#hyp-I-subcritical, counterexample#hyp-II-regular, counterexample#hyp-III-continuous, counterexample#three-fixed-points
ROUTES: -
ROUTE_FOR: -
EDGE: counterexample#hyp-I-subcritical | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#counterexample@L262-L262 | 'clearly satisfies the hypotheses of Theorem 1.4': hypothesis (I)
EDGE: counterexample#hyp-II-regular | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#counterexample@L262-L262 | 'clearly satisfies the hypotheses of Theorem 1.4': hypothesis (II)
EDGE: counterexample#hyp-III-continuous | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#counterexample@L262-L262 | 'clearly satisfies the hypotheses of Theorem 1.4': hypothesis (III)
EDGE: counterexample#three-fixed-points | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#counterexample@L262-L262 | 'one can check that the equation f(q_1,q_2) = (q_1,q_2) has three solutions in (1,∞)^2'
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: the paper gives no proof; every obligation is a SOURCE_GAP child step. Robustness under perturbation, the d = 3 example with seven fixed points and the 'arbitrarily large' expectation (L262-L263) feed no root and are not modeled (spec §7)

NODE: counterexample#hyp-I-subcritical
KIND: step
TITLE: Example 1.5 is subcritical
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#counterexample@L255-L264
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#counterexample@L262-L262
CONTRACT_ID: paper.counterexample#hyp-I-subcritical
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: d = 2 with the offspring law of Example 1.5
SOURCE_QUANTIFIERS: the 2-type process of Example 1.5
SOURCE_CONCLUSION: X is subcritical (hypothesis (I) of Theorem 1.4)
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: asserted as 'clearly'; no computation of the mean matrix or its eigenvalue is given

NODE: counterexample#hyp-II-regular
KIND: step
TITLE: Example 1.5 is positive regular and non-singular
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#counterexample@L255-L264
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#counterexample@L262-L262
CONTRACT_ID: paper.counterexample#hyp-II-regular
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: d = 2 with the offspring law of Example 1.5
SOURCE_QUANTIFIERS: the 2-type process of Example 1.5
SOURCE_CONCLUSION: X is positive regular and non-singular (hypothesis (II) of Theorem 1.4)
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: asserted as 'clearly'; not computed

NODE: counterexample#hyp-III-continuous
KIND: step
TITLE: Example 1.5 satisfies the continuity hypothesis
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#counterexample@L255-L264
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#counterexample@L262-L262
CONTRACT_ID: paper.counterexample#hyp-III-continuous
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: d = 2 with the offspring law of Example 1.5
SOURCE_QUANTIFIERS: the 2-type process of Example 1.5; k ∈ {1,2}
SOURCE_CONCLUSION: for each k ∈ {1,2} the component f_k is continuous from (0,∞]^2 to (0,∞] (hypothesis (III) of Theorem 1.4)
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: asserted as 'clearly'. The remark at L252 (rem:hyp-iii-automatic) is a possible derivation but the source does not invoke it here, so no edge is added

NODE: counterexample#three-fixed-points
KIND: step
TITLE: f(q) = q has three solutions in (1,∞)^2 for Example 1.5
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#counterexample@L255-L264
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#counterexample@L262-L262
CONTRACT_ID: paper.counterexample#three-fixed-points
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: d = 2 with the offspring law of Example 1.5 and generating function f
SOURCE_QUANTIFIERS: the 2-type process of Example 1.5; ∃ three distinct q ∈ (1,∞)^2
SOURCE_CONCLUSION: the equation f(q_1,q_2) = (q_1,q_2) has three solutions in (1,∞)^2
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: 'one can check that ... has three solutions' with no computation; Figure 1 (L267-L273) is a plot illustrating it and is not a proof

NODE: rem:hyp-iii-necessary
KIND: theorem
TITLE: Hypothesis III of Theorem 1.4 cannot be removed (concrete a·m^{-3} example)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#hyp-iii-necessary@L252-L252
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#hyp-iii-necessary@L252-L252
CONTRACT_ID: paper.rem1_4.hypIII_necessary
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: none
SOURCE_QUANTIFIERS: ∃ constants a, b > 0 ('appropriate'); ∃ a single-type branching process X with ℙ[X(1) = m] = a m^{-3} for every m ≥ 1 and ℙ[X(1) = 0] = b
SOURCE_CONCLUSION: X satisfies hypotheses (I) and (II) of Theorem 1.4 but f(q) = ∞ ≠ q for every q ∈ (1,∞) (so hypothesis (III) fails), and no conjugate branching process for X exists
CONSTANT_SCOPE: a, b > 0 are the unspecified 'appropriate constants' of the source, chosen once; they depend on nothing else
FROZEN_FILE: Conjugate/Frozen/Remark_HypIII_Necessary.lean
FROZEN_DECL: Conjugate.remark_hypIII_necessary
FROZEN_ANCHOR_ID: thm.remark_hypIII_necessary.v1
FROZEN_ABI_SHA256: 040e7973829d9af59daafcc3ff36fdf466f78258759694f79b4f8b781b024a11
DEPS: rem:hyp-iii-necessary#constants-and-hyp-I, rem:hyp-iii-necessary#hyp-II-regular, rem:hyp-iii-necessary#f-infinite, rem:hyp-iii-necessary#no-conjugate
ROUTES: -
ROUTE_FOR: -
EDGE: rem:hyp-iii-necessary#constants-and-hyp-I | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#hyp-iii-necessary@L252-L252 | 'for appropriate constants a, b > 0' together with 'the first two hypotheses hold': hypothesis (I)
EDGE: rem:hyp-iii-necessary#hyp-II-regular | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#hyp-iii-necessary@L252-L252 | 'the first two hypotheses hold': hypothesis (II)
EDGE: rem:hyp-iii-necessary#f-infinite | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#hyp-iii-necessary@L252-L252 | 'f(q) = (∞,…,∞) ≠ q for all q ∈ (1,∞)^d' for the concrete example
EDGE: rem:hyp-iii-necessary#no-conjugate | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#hyp-iii-necessary@L252-L252 | '(in which case no conjugate branching process exists)'
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: the remark is a single unproved sentence; every obligation is a SOURCE_GAP child step

NODE: rem:hyp-iii-necessary#constants-and-hyp-I
KIND: step
TITLE: Appropriate constants a, b exist and the example is subcritical
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#hyp-iii-necessary@L252-L252
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#hyp-iii-necessary@L252-L252
CONTRACT_ID: paper.rem:hyp-iii-necessary#constants-and-hyp-I
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: none
SOURCE_QUANTIFIERS: ∃ a, b > 0
SOURCE_CONCLUSION: there exist a, b > 0 such that ℙ[X(1) = m] = a m^{-3} (m ≥ 1) and ℙ[X(1) = 0] = b define a probability law and the resulting single-type process is subcritical (hypothesis (I))
CONSTANT_SCOPE: a, b depend on nothing else
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: 'appropriate constants' are never specified and the existence of constants making the law a probability measure and the process subcritical is not argued

NODE: rem:hyp-iii-necessary#hyp-II-regular
KIND: step
TITLE: The a·m^{-3} example is positive regular and non-singular
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#hyp-iii-necessary@L252-L252
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#hyp-iii-necessary@L252-L252
CONTRACT_ID: paper.rem:hyp-iii-necessary#hyp-II-regular
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: none
SOURCE_QUANTIFIERS: the single-type process with ℙ[X(1) = m] = a m^{-3} (m ≥ 1) and ℙ[X(1) = 0] = b
SOURCE_CONCLUSION: the process is positive regular and non-singular (hypothesis (II))
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: asserted ('the first two hypotheses hold') without verification

NODE: rem:hyp-iii-necessary#f-infinite
KIND: step
TITLE: f(q) = ∞ for every q > 1 in the a·m^{-3} example
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#hyp-iii-necessary@L252-L252
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#hyp-iii-necessary@L252-L252
CONTRACT_ID: paper.rem:hyp-iii-necessary#f-infinite
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: the single-type process with ℙ[X(1) = m] = a m^{-3} (m ≥ 1) and ℙ[X(1) = 0] = b
SOURCE_QUANTIFIERS: the process above; q ∈ (1,∞)
SOURCE_CONCLUSION: f(q) = ∞ for every q ∈ (1,∞); in particular f(q) ≠ q
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: the divergence of the series is asserted ('f(q) = (∞,…,∞)') and not shown

NODE: rem:hyp-iii-necessary#no-conjugate
KIND: application
TITLE: No conjugate exists for the a·m^{-3} example
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#hyp-iii-necessary@L252-L252
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#hyp-iii-necessary@L252-L252
CONTRACT_ID: paper.rem:hyp-iii-necessary#no-conjugate
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: the single-type branching process with ℙ[X(1) = m] = a m^{-3} for m ≥ 1 and ℙ[X(1) = 0] = b, for the constants a, b > 0 of rem:hyp-iii-necessary#constants-and-hyp-I
SOURCE_QUANTIFIERS: the process above; ∄ X̂ conjugate for X
SOURCE_CONCLUSION: there is no conjugate branching process for X
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: thm-fixed-gf.equivalence, rem:hyp-iii-necessary#f-infinite, rem:hyp-iii-necessary#constants-and-hyp-I, rem:hyp-iii-necessary#hyp-II-regular
ROUTES: -
ROUTE_FOR: -
EDGE: thm-fixed-gf.equivalence | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#hyp-iii-necessary@L252-L252 | '(in which case no conjugate branching process exists)': a conjugate exists iff a fixed point in (1,∞)^d exists (L238), applied with d = 1
EDGE: rem:hyp-iii-necessary#f-infinite | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#hyp-iii-necessary@L252-L252 | f(q) = ∞ ≠ q for all q ∈ (1,∞) means no fixed point in (1,∞)
EDGE: rem:hyp-iii-necessary#constants-and-hyp-I | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#hyp-iii-necessary@L252-L252 | discharges the premise 'subcritical' of the equivalence
EDGE: rem:hyp-iii-necessary#hyp-II-regular | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#hyp-iii-necessary@L252-L252 | discharges the premises 'positive regular' and 'non-singular' of the equivalence
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: the parenthetical '(in which case no conjugate branching process exists)' is unproved; which result gives it is not named. The edge to thm-fixed-gf.equivalence (direction 'conjugate implies fixed point') is the reconstruction suggested by L238 and L188

NODE: rem:hyp-iii-automatic
KIND: theorem
TITLE: Hypothesis III is automatic when f is finite
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#hyp-iii-automatic@L252-L252
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#hyp-iii-automatic@L252-L252
CONTRACT_ID: paper.rem1_4.hypIII_automatic
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: d ∈ ℕ; X is a d-type branching process that is positive regular and non-singular; f_k(q) < ∞ for all k ∈ {1,…,d} and all q ∈ (0,∞)^d
SOURCE_QUANTIFIERS: d ∈ ℕ; X; for all k ∈ {1,…,d}
SOURCE_CONCLUSION: hypothesis (III) of Theorem 1.4 holds, i.e. each f_k is a continuous function from (0,∞]^d to (0,∞] (half-open-interval topology)
CONSTANT_SCOPE: none
FROZEN_FILE: Conjugate/Frozen/Remark_HypIII_Automatic.lean
FROZEN_DECL: Conjugate.remark_hypIII_automatic
FROZEN_ANCHOR_ID: thm.remark_hypIII_automatic.v1
FROZEN_ABI_SHA256: 7345689e590028548ae2178c9699138a6af41eec25eb8cd7bf186444f8ed77ef
DEPS: rem:hyp-iii-automatic#continuity-from-finiteness
ROUTES: -
ROUTE_FOR: -
EDGE: rem:hyp-iii-automatic#continuity-from-finiteness | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#hyp-iii-automatic@L252-L252 | 'Hypothesis III is automatically satisfied if X is positive regular and non-singular and f_k(q) < ∞ ...' is the entire argument
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: the remark is an unproved sentence; the single child step records the unproved bridge

NODE: rem:hyp-iii-automatic#continuity-from-finiteness
KIND: step
TITLE: Finiteness on (0,∞)^d implies continuity on (0,∞]^d
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#hyp-iii-automatic@L252-L252
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#hyp-iii-automatic@L252-L252
CONTRACT_ID: paper.rem:hyp-iii-automatic#continuity-from-finiteness
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: d ∈ ℕ; X positive regular and non-singular; f_k(q) < ∞ for all k and all q ∈ (0,∞)^d
SOURCE_QUANTIFIERS: d ∈ ℕ; X; k ∈ {1,…,d}
SOURCE_CONCLUSION: each f_k is continuous from (0,∞]^d to (0,∞]
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: asserted with no argument; the source does not separate continuity in the interior (0,∞)^d from continuity at points with infinite coordinates, so the bridge is kept as one node

NODE: ext:taylor
KIND: external
TITLE: First-order Taylor expansion at a point of differentiability
STATEMENT_SOURCE: external:standard#first-order-taylor
PROOF_SOURCE: -
CONTRACT_ID: paper.ext:taylor
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: φ is a real function defined on a neighbourhood (one-sided suffices) of x_0 and differentiable at x_0
SOURCE_QUANTIFIERS: φ; x_0; h → 0
SOURCE_CONCLUSION: φ(x_0 + h) = φ(x_0) + φ'(x_0) h + o(h) as h → 0
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-A/sonnet
REVIEWER: reviewer-A/sonnet
LEAN_STATUS: EXTERNAL
LEAN_REF: -
LEAN_NOTE: -
NOTE: canonical external (spec §5). Slice A consumes it in prop-single-type#f-below-diagonal (L354 'by Taylor expansion'); slice B (lem-gf-bded L511) consumes it too, so this block is expected to duplicate slice B's; orchestrator to merge by ID

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

NODE: ext:an72-v3-thm2
KIND: external
TITLE: Athreya-Ney V.3 Thm 2: fixed points of f in the unit cube are the extinction vector a and (1,...,1)
STATEMENT_SOURCE: external:an-branching-processes#thm-V.3.2
PROOF_SOURCE: -
CONTRACT_ID: paper.ext:an72-v3-thm2
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X is a positive regular, non-singular d-type branching process with generating function f; E is the event that the process eventually becomes extinct; a_k := P_k[E]
SOURCE_QUANTIFIERS: d in N; X; q in [0,1]^d
SOURCE_CONCLUSION: the only solutions of f(q) = q in the unit cube [0,1]^d are a = (a_1,...,a_d) and (1,...,1) (in particular f(a) = a)
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: EXTERNAL
LEAN_REF: -
LEAN_NOTE: -
NOTE: First paragraph of Proposition 2.1 (paper.tex L395), cited at L405 as [an-branching-processes, Theorem 2, Section V.3]. Per spec R6 this is a cited external result, not an anchored statement. Hypotheses recorded as the paper states them for Prop 2.1.

NODE: ext:jl08-thm1
KIND: external
TITLE: Jagers-Lageras Thm 1: law of a branching process conditioned on extinction
STATEMENT_SOURCE: external:jl-cond-on-ext#thm-1
PROOF_SOURCE: -
CONTRACT_ID: paper.ext:jl08-thm1
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X is a branching process (the paper uses the d-type positive regular, non-singular case with 0 < P_k[E] < 1; the cited theorem is stated 'in a somewhat more general setting', L405); E = extinction event
SOURCE_QUANTIFIERS: d in N; X; k in {1,...,d}
SOURCE_CONCLUSION: the P_k-conditional law of X given E is that of a branching process whose offspring distribution is E_k[F(X(1)) | E] = a_k^{-1} E_k[F(X(1)) prod_j a_j^{X_j(1)}] for bounded measurable F, where a_k = P_k[E]
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: EXTERNAL
LEAN_REF: -
LEAN_NOTE: -
NOTE: Cited at L405 (and L179, L934). The exact hypotheses of the cited theorem are not in the corpus; fields record the use the paper makes of it (the description of the conditional law, (2.1)).

NODE: ext:fatou
KIND: external
TITLE: Fatou's lemma
STATEMENT_SOURCE: external:standard#fatou-lemma
PROOF_SOURCE: -
CONTRACT_ID: paper.ext:fatou
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: (Omega, F, mu) a measure space; Y_n >= 0 measurable for n in N
SOURCE_QUANTIFIERS: (Omega, F, mu); (Y_n)_n
SOURCE_CONCLUSION: integral of liminf_n Y_n d mu <= liminf_n integral of Y_n d mu
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: EXTERNAL
LEAN_REF: -
LEAN_NOTE: -
NOTE: Invoked by name at L451 (Lemma 2.3). Canonical ID from spec section 5; may also be defined by other slices (dedupe in merge).

NODE: ext:holder
KIND: external
TITLE: Holder's inequality
STATEMENT_SOURCE: external:standard#holder-inequality
PROOF_SOURCE: -
CONTRACT_ID: paper.ext:holder
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: p, q in (1,inf) with 1/p + 1/q = 1; U, V >= 0 measurable on a probability space
SOURCE_QUANTIFIERS: p, q; U, V
SOURCE_CONCLUSION: E[U V] <= E[U^p]^(1/p) E[V^q]^(1/q)
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: EXTERNAL
LEAN_REF: -
LEAN_NOTE: -
NOTE: Invoked by name at L629-L632 (Lemma 2.11) with exponents 1/r and 1/(1-r), r in (0,1). Canonical ID from spec section 5; may be duplicated in other slices.

NODE: ext:vitali
KIND: external
TITLE: Vitali convergence theorem
STATEMENT_SOURCE: external:standard#vitali-convergence
PROOF_SOURCE: -
CONTRACT_ID: paper.ext:vitali
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: (Omega, F, P) a probability space; Y_n -> Y almost surely; (Y_n) uniformly integrable
SOURCE_QUANTIFIERS: (Omega, F, P); (Y_n)_n; Y
SOURCE_CONCLUSION: Y is integrable and E[Y_n] -> E[Y]
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: EXTERNAL
LEAN_REF: -
LEAN_NOTE: -
NOTE: Invoked by name at L635 (Lemma 2.11). Canonical ID from spec section 5; may be duplicated in other slices.

NODE: ext:perron-frobenius
KIND: external
TITLE: Perron-Frobenius theorem
STATEMENT_SOURCE: external:standard#perron-frobenius
PROOF_SOURCE: -
CONTRACT_ID: paper.ext:perron-frobenius
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: M a d x d matrix with nonnegative entries such that some power M^N has all entries positive (primitive/irreducible)
SOURCE_QUANTIFIERS: d; M
SOURCE_CONCLUSION: the spectral radius rho of M is an eigenvalue of M with an eigenvector all of whose components are positive
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: EXTERNAL
LEAN_REF: -
LEAN_NOTE: -
NOTE: Invoked by name at L508 (Lemma 2.5). Canonical ID from spec section 5. The paper states the hypothesis as 'positive regular and non-singular'; the precise matrix hypothesis (positivity of a power of M) is recorded here as the standard form.

NODE: prop-cond-on-ext.cond-law
KIND: proposition
TITLE: Proposition 2.1 (conditional-law paragraph): conditional law of X given extinction
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-cond-on-ext.cond-law@L390-L403
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-cond-on-ext.cond-law@L404-L406
CONTRACT_ID: paper.prop2_1.condLaw
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X = {X(n)}_{n in N_0} is a positive regular, non-singular d-type branching process (Definition 1.3) with generating function f; E is the event that the process eventually becomes extinct; a_k := P_k[E] for k in {1,...,d}; 0 < a_k < 1 for every k in {1,...,d}
SOURCE_QUANTIFIERS: d in N; X; (a_k := P_k[E]); assume 0 < a_k < 1 for all k; for each k in {1,...,d}: the P_k-conditional law of X given E is that of a branching process whose offspring distribution is given by (2.1) for every bounded measurable F: N_0^d -> R
SOURCE_CONCLUSION: for each k in {1,...,d}, the P_k-conditional law of X given E is that of a branching process with offspring distribution determined by (2.1): E_k[F(X_1(1),...,X_d(1)) | E] = (1/a_k) E_k[F(X_1(1),...,X_d(1)) prod_{j=1}^d a_j^{X_j(1)}] for every bounded measurable F: N_0^d -> R
CONSTANT_SCOPE: none
FROZEN_FILE: Conjugate/Frozen/Proposition_2_1_CondLaw.lean
FROZEN_DECL: Conjugate.proposition_2_1_condLaw
FROZEN_ANCHOR_ID: thm.proposition_2_1_condLaw.v1
FROZEN_ABI_SHA256: c35be0988368897ab13b4adf2f5ddc76f65b47041e3a2c331794933fc10ab6de
DEPS: ext:jl08-thm1, ext:an72-v3-thm2
ROUTES: -
ROUTE_FOR: -
EDGE: ext:jl08-thm1 | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-cond-on-ext.cond-law@L405-L405 | proof cites [jl-cond-on-ext, Theorem 1] for the description of the conditional law of X given E, i.e. formula (2.1)
EDGE: ext:an72-v3-thm2 | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-cond-on-ext.cond-law@L405-L405 | proof cites [an-branching-processes, Theorem 2, Section V.3] for the properties of a (a is a fixed point of f, so that (2.1) defines probability laws)
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Per spec R6 only the conditional-law paragraph (statement L397-L402 including (2.1)) is the root; locator spans the whole proposition L390-L403 as in the manifest. First paragraph (L395) is the external ext:an72-v3-thm2. The clause 'Moreover, this branching process is subcritical' (L402) is a cited result consumed by no root and is not modeled. The proof (L405) only cites two references; the AN edge records 'properties of a' as read from the citation text.

NODE: prop-conjugate
KIND: proposition
TITLE: Proposition 2.2: the exponentially tilted process X-hat is a conjugate of X
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate@L420-L428
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate@L429-L432
CONTRACT_ID: paper.prop2_2
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X = {X(n)}_{n in N_0} is a positive regular, non-singular d-type branching process (Definition 1.3) with generating function f; the extinction probability started from any state is one; A in [1,inf)^d with f(A) = A
SOURCE_QUANTIFIERS: d in N; X; A in [1,inf)^d with f(A) = A; X-hat is defined from (X, A) by (2.2); for each k in {1,...,d}: extinction probability of X-hat under P-hat_k, and conditional law of X-hat under P-hat_k given extinction
SOURCE_CONCLUSION: (2.2), Ehat_k[F(X_1(1),...,X_d(1))] = (1/A_k) E_k[F(X_1(1),...,X_d(1)) prod_j A_j^{X_j(1)}] for all k and all bounded measurable F: N_0^d -> R, defines the offspring distribution of a branching process X-hat; for each k in {1,...,d} the extinction probability of X-hat started from one type-k individual is 1/A_k, and the P-hat_k-conditional law of X-hat given that it eventually becomes extinct is the P_k-law of X
CONSTANT_SCOPE: none
FROZEN_FILE: Conjugate/Frozen/Proposition_2_2.lean
FROZEN_DECL: Conjugate.proposition_2_2
FROZEN_ANCHOR_ID: thm.proposition_2_2.v1
FROZEN_ABI_SHA256: 927d2807e8bf34483ea1bcff664f03c4646ec4c310bcbfa0d6cc200dc7476939
DEPS: prop-conjugate#offspring-law, prop-conjugate#ext-prob-hat, prop-conjugate#cond-law-hat
ROUTES: -
ROUTE_FOR: -
EDGE: prop-conjugate#offspring-law | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate@L430-L430 | first proof sentence: (2.2) defines a genuine offspring law, which is the existence assertion of the statement
EDGE: prop-conjugate#ext-prob-hat | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate@L431-L431 | proof concludes that 1/A is the vector of extinction probabilities of X-hat
EDGE: prop-conjugate#cond-law-hat | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate@L431-L431 | proof concludes that the conditional law of X-hat given extinction is the law of X
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Display (2.2) (L423-L426) is part of the statement and is not a separate node. Statement fields read from L420-L428 only; the 'defines a branching process' well-definedness (proved in the first proof sentence) is placed in SOURCE_CONCLUSION because the frozen root asserts the existence of the offspring law.

NODE: prop-conjugate#offspring-law
KIND: step
TITLE: (2.2) defines a probability offspring law because f(A) = A
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate#offspring-law@L430-L430
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate#offspring-law@L430-L430
CONTRACT_ID: paper.prop-conjugate#offspring-law
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X positive regular, non-singular d-type branching process with generating function f; A in [1,inf)^d; f(A) = A
SOURCE_QUANTIFIERS: d; X; A; for each k in {1,...,d}
SOURCE_CONCLUSION: for each k, (2.2) (with F ranging over indicators of points c in N_0^d) defines a probability measure on N_0^d: mass at c is A_k^{-1} P_k[X(1) = c] prod_j A_j^{c_j}; total mass is A_k^{-1} f_k(A) = 1, so (2.2) is the offspring law of a d-type branching process X-hat
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: eqn-generating-function
ROUTES: -
ROUTE_FOR: -
EDGE: eqn-generating-function | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate#offspring-law@L430-L430 | total mass of (2.2) is A_k^{-1} E_k[prod_j A_j^{X_j(1)}] = A_k^{-1} f_k(A) = 1: unfolds the definition of f at the finite point A
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Source sentence: 'Since f(A) = A, we see that (2.2) defines the offspring distribution for a branching process X-hat' (L430). Normalization only; A in [1,inf)^d makes every weight finite and positive.

NODE: prop-conjugate#abs-continuity
KIND: step
TITLE: Mutual absolute continuity of the first-n-generation laws of X-hat and X
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate#abs-continuity@L430-L430
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate#abs-continuity@L430-L430
CONTRACT_ID: paper.prop-conjugate#abs-continuity
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X as in Proposition 2.2; A in [1,inf)^d with f(A) = A; X-hat with offspring laws (2.2)
SOURCE_QUANTIFIERS: d; X; A; n in N; k in {1,...,d}
SOURCE_CONCLUSION: for every n in N and every k, the P-hat_k-law of the first n generations of X-hat and the P_k-law of the first n generations of X are mutually absolutely continuous
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: prop-conjugate#offspring-law
ROUTES: -
ROUTE_FOR: -
EDGE: prop-conjugate#offspring-law | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate#abs-continuity@L430-L430 | (2.2) gives the offspring law of X-hat as a strictly positive, finite density A_k^{-1} prod_j A_j^{c_j} with respect to that of X
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: asserted without proof in the clause 'Since the law of the first n generations of X-hat is mutually absolutely continuous with respect to the law of the first n generations of X' (L430). The source supplies no argument (e.g. an explicit density over individuals of the first n generations).

NODE: prop-conjugate#hat-pos-reg-nonsing
KIND: step
TITLE: X-hat is positive regular and non-singular
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate#hat-pos-reg-nonsing@L430-L430
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate#hat-pos-reg-nonsing@L430-L430
CONTRACT_ID: paper.prop-conjugate#hat-pos-reg-nonsing
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X positive regular, non-singular d-type branching process; A in [1,inf)^d with f(A) = A; X-hat with offspring laws (2.2)
SOURCE_QUANTIFIERS: d; X; A
SOURCE_CONCLUSION: X-hat is positive regular and non-singular (Definition 1.3)
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: prop-conjugate#abs-continuity, def-bp-basic.positive-regular, def-bp-basic.non-singular
ROUTES: -
ROUTE_FOR: -
EDGE: prop-conjugate#abs-continuity | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate#hat-pos-reg-nonsing@L430-L430 | mutual absolute continuity of the first n generations transfers positivity of the relevant probabilities from X to X-hat
EDGE: def-bp-basic.positive-regular | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate#hat-pos-reg-nonsing@L430-L430 | positive regularity of X is transferred through events {X_j(N) >= 1} of the first N generations
EDGE: def-bp-basic.non-singular | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate#hat-pos-reg-nonsing@L430-L430 | non-singularity of X is transferred through the event {sum_j X_j(1) >= 2} of the first generation
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Source sentence: '... we obtain that X-hat is also positive regular and non-singular' (L430). Deduction from the (unproved) mutual absolute continuity; itself not flagged as a gap.

NODE: prop-conjugate#hat-fixed-point
KIND: step
TITLE: f-hat(1/A) = 1/A for the generating function of X-hat
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate#hat-fixed-point@L431-L431
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate#hat-fixed-point@L431-L431
CONTRACT_ID: paper.prop-conjugate#hat-fixed-point
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X positive regular, non-singular d-type branching process; A in [1,inf)^d with f(A) = A; X-hat with offspring laws (2.2); f-hat the generating function of X-hat
SOURCE_QUANTIFIERS: d; X; A; k in {1,...,d}
SOURCE_CONCLUSION: with 1/A := (1/A_1,...,1/A_d) in [0,1]^d (source writes the last index as k), f-hat(1/A) = 1/A
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: prop-conjugate#offspring-law, eqn-generating-function
ROUTES: -
ROUTE_FOR: -
EDGE: prop-conjugate#offspring-law | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate#hat-fixed-point@L431-L431 | (2.2) applied with the bounded function F(c) = prod_j A_j^{-c_j} gives f-hat_k(1/A) = A_k^{-1} E_k[1] = 1/A_k
EDGE: eqn-generating-function | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate#hat-fixed-point@L431-L431 | f-hat is the generating function (1.1) of X-hat evaluated at 1/A
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Source sentence: 'By (2.2), f-hat(1/A) = 1/A' (L431). Computation: f-hat_k(1/A) = Ehat_k[prod_j A_j^{-X_j(1)}] = A_k^{-1} E_k[prod_j A_j^{X_j(1)} A_j^{-X_j(1)}] = 1/A_k, with F bounded by 1 because A_j >= 1.

NODE: prop-conjugate#ext-prob-hat
KIND: step
TITLE: Extinction probability vector of X-hat is 1/A (application of the unit-cube fixed-point statement)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate#ext-prob-hat@L431-L431
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate#ext-prob-hat@L431-L431
CONTRACT_ID: paper.prop-conjugate#ext-prob-hat
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X positive regular, non-singular d-type branching process with extinction probability one from any state; A in [1,inf)^d with f(A) = A; X-hat with offspring laws (2.2)
SOURCE_QUANTIFIERS: d; X; A; k in {1,...,d}
SOURCE_CONCLUSION: the extinction probability of X-hat under P-hat_k equals 1/A_k for every k in {1,...,d}
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: ext:an72-v3-thm2, prop-conjugate#hat-fixed-point, prop-conjugate#hat-pos-reg-nonsing
ROUTES: -
ROUTE_FOR: -
EDGE: ext:an72-v3-thm2 | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate#ext-prob-hat@L431-L431 | Prop 2.1 first paragraph applied to X-hat: its only fixed points in [0,1]^d are its extinction vector and (1,...,1), and 1/A is a fixed point
EDGE: prop-conjugate#hat-fixed-point | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate#ext-prob-hat@L431-L431 | supplies the fixed point 1/A of f-hat in [0,1]^d
EDGE: prop-conjugate#hat-pos-reg-nonsing | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate#ext-prob-hat@L430-L431 | hypothesis (positive regular, non-singular) of Proposition 2.1 for X-hat
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: Proposition 2.1(a) identifies the extinction vector of X-hat with 1/A only if 1/A != (1,...,1) (the fixed points in [0,1]^d are the extinction vector and (1,...,1)). The case A = (1,...,1) (so 1/A = (1,...,1), X-hat has the offspring laws of X, and the extinction vector is (1,...,1) by the extinction hypothesis) is not treated in the source. Source sentence: 'By Proposition 2.1, it follows that 1/A is the vector of extinction probabilities for X-hat' (L431). Uses part (a) of Proposition 2.1 (L395, external).

NODE: prop-conjugate#cond-law-hat
KIND: application
TITLE: Application of Prop 2.1 (conditional law) to X-hat with a = 1/A; identification with the law of X
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate#cond-law-hat@L431-L431
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate#cond-law-hat@L431-L431
CONTRACT_ID: paper.prop-conjugate#cond-law-hat
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X positive regular, non-singular d-type branching process with extinction probability one from any state; A in [1,inf)^d with f(A) = A; X-hat with offspring laws (2.2)
SOURCE_QUANTIFIERS: d; X; A; k in {1,...,d}
SOURCE_CONCLUSION: the P-hat_k-conditional law of X-hat given extinction is the law of a branching process with offspring distribution (2.1) taken with a = 1/A; this offspring distribution equals that of X (a_k^{-1} Ehat_k[F prod_j a_j^{X_j(1)}] = E_k[F]), so the conditional law equals the P_k-law of X for every k
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: prop-cond-on-ext.cond-law, prop-conjugate#ext-prob-hat, prop-conjugate#hat-pos-reg-nonsing, lem-fixed-pos
ROUTES: -
ROUTE_FOR: -
EDGE: prop-cond-on-ext.cond-law | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate#cond-law-hat@L431-L431 | second paragraph of Prop 2.1 (formula (2.1)) applied to X-hat with extinction vector a = 1/A
EDGE: prop-conjugate#ext-prob-hat | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate#cond-law-hat@L431-L431 | identifies the extinction vector of X-hat with 1/A, so that a_k = 1/A_k in (2.1)
EDGE: prop-conjugate#hat-pos-reg-nonsing | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate#cond-law-hat@L430-L431 | hypothesis (positive regular, non-singular) of Proposition 2.1 for X-hat
EDGE: lem-fixed-pos | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate#cond-law-hat@L431-L431 | supplies the hypothesis 0 < a_k < 1 of Prop 2.1: A = (1,...,1) or A in (1,inf)^d (the dichotomy announced at L437, not cited in the proof)
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: the proof says only 'By Proposition 2.1, it follows ... that the conditional law of X-hat given extinction is the same as the law of X' (L431). It does not verify the hypothesis 0 < a_k < 1 of Prop 2.1 for a = 1/A (this needs Lemma 2.3 via the remark at L437, never cited in the proof) and does not treat A = (1,...,1) (a_k = 1, outside Prop 2.1's hypothesis; there X-hat = X and P[E] = 1, so the claim is trivial). The one-line identification of the (2.1) offspring law with that of X is a computation from (2.2).

NODE: lem-fixed-pos
KIND: lemma
TITLE: Lemma 2.3: fixed points of f in (0,inf)^d are >= 1, and all = 1 or all > 1
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-pos@L440-L446
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-pos@L447-L472
CONTRACT_ID: paper.lem-fixed-pos
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X = {X(n)}_{n in N_0} is a d-type branching process whose extinction probability started from any state is one, with generating function f; q in (0,inf)^d with f(q) = q; (second assertion only) X is positive regular
SOURCE_QUANTIFIERS: d in N; X; q in (0,inf)^d with f(q) = q; for all k: q_k >= 1; if X is positive regular: (for all k q_k = 1) or (for all k q_k > 1)
SOURCE_CONCLUSION: q_k >= 1 for every k in {1,...,d} (2.3); moreover if the branching process is positive regular then either q_k = 1 for every k in {1,...,d} or q_k > 1 for every k in {1,...,d}
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-fixed-pos#geq-one, lem-fixed-pos#pos-reg-strict
ROUTES: -
ROUTE_FOR: -
EDGE: lem-fixed-pos#geq-one | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-pos@L459-L459 | first assertion (2.3) is the conclusion 'Thus (2.3) holds'
EDGE: lem-fixed-pos#pos-reg-strict | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-pos@L461-L471 | second assertion: a coordinate q_{j*} > 1 forces all q_k > 1 (the alternative q_k = 1 for all k then follows from (2.3))
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Display (2.3) (L442) is the first assertion and is modeled as lem-fixed-pos#geq-one. Consumed outside this slice at L904 (proof of Thm 2.7, slice C) and L1178 (slice D); within this slice by prop-conjugate#cond-law-hat (remark at L437).

NODE: lem-fixed-pos#geq-one
KIND: application
TITLE: Fatou argument: q_k >= 1 (2.3)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-pos#geq-one@L449-L459
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-pos#geq-one@L449-L458
CONTRACT_ID: paper.lem-fixed-pos#geq-one
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: d-type branching process X with extinction probability one from any state and generating function f; q in (0,inf)^d with f(q) = q
SOURCE_QUANTIFIERS: d; X; q; k in {1,...,d}
SOURCE_CONCLUSION: q_k >= 1 for every k in {1,...,d}
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: ext:fatou, eqn-gen-func-n, def:extinction
ROUTES: -
ROUTE_FOR: -
EDGE: ext:fatou | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-pos#geq-one@L451-L458 | Fatou's lemma gives lim_n E_k[prod_j q_j^{X_j(n)}] >= E_k[lim_n prod_j q_j^{X_j(n)}]
EDGE: eqn-gen-func-n | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-pos#geq-one@L450-L455 | f^{(n)}(q) = q for all n and f_k^{(n)}(q) = E_k[prod_j q_j^{X_j(n)}]
EDGE: def:extinction | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-pos#geq-one@L449-L449 | extinction probability one: P_k-a.s. X_j(n) = 0 for all large n, so prod_j q_j^{X_j(n)} -> 1
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Display (2.3) (L442) as proved at L449-L459. Includes the a.s. limit prod_j q_j^{X_j(n)} -> 1 (L449) and f^{(n)}(q) = q (L450) as sub-steps of the Fatou application.

NODE: lem-fixed-pos#pos-reg-strict
KIND: step
TITLE: Positive regularity: one coordinate q_{j*} > 1 forces q_k > 1 for all k
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-pos#pos-reg-strict@L461-L471
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-pos#pos-reg-strict@L461-L471
CONTRACT_ID: paper.lem-fixed-pos#pos-reg-strict
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: positive regular d-type branching process X with extinction probability one from any state and generating function f; q in (0,inf)^d with f(q) = q; exists j* in {1,...,d} with q_{j*} > 1
SOURCE_QUANTIFIERS: d; X; q; j*; N in N with P_k[X_{j*}(N) >= 1] > 0 for every k; k in {1,...,d}
SOURCE_CONCLUSION: q_k > 1 for every k in {1,...,d}
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-fixed-pos#geq-one, eqn-gen-func-n, def-bp-basic.positive-regular
ROUTES: -
ROUTE_FOR: -
EDGE: lem-fixed-pos#geq-one | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-pos#pos-reg-strict@L468-L468 | q_j >= 1 for all j makes prod_j q_j^{X_j(N)} >= 1 off the event {X_{j*}(N) >= 1} and >= q_{j*} on it
EDGE: eqn-gen-func-n | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-pos#pos-reg-strict@L466-L467 | q_k = f_k^{(N)}(q) = E_k[prod_j q_j^{X_j(N)}]
EDGE: def-bp-basic.positive-regular | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-pos#pos-reg-strict@L462-L462 | choice of N with P_k[X_{j*}(N) >= 1] > 0 for all k
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Witness choice N from positive regularity (L462) and the bound q_k >= q_{j*} P + (1-P) > 1 (L468-L470). Combined with (2.3) this gives the 'either all = 1 or all > 1' dichotomy.

NODE: lem-gf-pos
KIND: lemma
TITLE: Lemma 2.4: uniform positivity p_{k,j}(N) > 0 for positive regular, non-singular processes
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-pos@L477-L487
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-pos@L488-L494
CONTRACT_ID: paper.lem-gf-pos
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X = {X(n)}_{n in N_0} is a d-type branching process which is positive regular and non-singular (Definition 1.3)
SOURCE_QUANTIFIERS: d in N; X; exists N in N; for all k, j in {1,...,d}: p_{k,j}(N) > 0
SOURCE_CONCLUSION: there exists N in N such that for all k, j in {1,...,d}, p_{k,j}(N) > 0 (2.4), where p_{k,j}(N) := P_k[X_j(N) >= 1 and X_k(N) >= 1] if k != j and p_{k,k}(N) := P_k[X_k(N) >= 2]
CONSTANT_SCOPE: N depends only on X (exists N before for all k, j)
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-gf-pos#kj-descendants
ROUTES: -
ROUTE_FOR: -
EDGE: lem-gf-pos#kj-descendants | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-pos@L493-L493 | proof concludes 'the lemma statement holds with N = 2N_0 + 1'
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Display (2.4) (L479) is the statement's conclusion, not a separate node. Consumed at L786-L787 (slice C) and L1009 (slice D). This lemma is stated before L528, so it does not carry the Theorem 1.4 setting.

NODE: lem-gf-pos#choose-N0-k0
KIND: step
TITLE: Choice of N_0 (positive regularity) and k_0 (non-singularity)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-pos#choose-N0-k0@L489-L493
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-pos#choose-N0-k0@L489-L493
CONTRACT_ID: paper.lem-gf-pos#choose-N0-k0
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X positive regular and non-singular d-type branching process
SOURCE_QUANTIFIERS: d; X; exists N_0 in N, exists k_0 in {1,...,d}
SOURCE_CONCLUSION: there exist N_0 in N with P_k[X_j(N_0) >= 1] > 0 for all k, j in {1,...,d}, and k_0 in {1,...,d} with P_{k_0}[sum_j X_j(1) >= 2] > 0
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: def-bp-basic.positive-regular, def-bp-basic.non-singular
ROUTES: -
ROUTE_FOR: -
EDGE: def-bp-basic.positive-regular | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-pos#choose-N0-k0@L489-L492 | 'By positive regularity, there exists N_0 ...'
EDGE: def-bp-basic.non-singular | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-pos#choose-N0-k0@L493-L493 | 'By non-singularity, there exists k_0 ...'
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Parameter/witness choice only.

NODE: lem-gf-pos#two-individuals
KIND: step
TITLE: Positive chance of at least two individuals in generation N_0 + 1
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-pos#two-individuals@L493-L493
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-pos#two-individuals@L493-L493
CONTRACT_ID: paper.lem-gf-pos#two-individuals
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X positive regular, non-singular d-type branching process; N_0, k_0 as in lem-gf-pos#choose-N0-k0
SOURCE_QUANTIFIERS: d; X; N_0; k_0; k in {1,...,d}
SOURCE_CONCLUSION: for every k in {1,...,d}, P_k[sum_j X_j(N_0 + 1) >= 2] > 0 (positive P_k-chance of a type-k_0 individual in generation N_0; conditional on this, positive chance of at least two individuals in generation N_0 + 1)
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-gf-pos#choose-N0-k0, claim:branching-property
ROUTES: -
ROUTE_FOR: -
EDGE: lem-gf-pos#choose-N0-k0 | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-pos#two-individuals@L493-L493 | supplies N_0 (reach a type-k_0 individual from any type k) and k_0 (two offspring with positive chance)
EDGE: claim:branching-property | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-pos#two-individuals@L493-L493 | 'Conditional on this ...' uses the Markov/branching property of the process at generation N_0
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: The Markov (branching) property is used implicitly in 'Conditional on this' (L493); it is modeled by the shared node claim:branching-property. The positive probability of a type-k_0 individual in generation N_0 comes from positive regularity (lem-gf-pos#choose-N0-k0).

NODE: lem-gf-pos#kj-descendants
KIND: step
TITLE: Descendants of two individuals: types k and j (or two of type k) at generation 2N_0 + 1
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-pos#kj-descendants@L493-L493
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-pos#kj-descendants@L493-L493
CONTRACT_ID: paper.lem-gf-pos#kj-descendants
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X positive regular, non-singular d-type branching process; N_0, k_0 as in lem-gf-pos#choose-N0-k0; N := 2N_0 + 1
SOURCE_QUANTIFIERS: d; X; N := 2N_0 + 1; k, j in {1,...,d}
SOURCE_CONCLUSION: for all k, j in {1,...,d}, p_{k,j}(2N_0 + 1) > 0 (conditional on at least two individuals in generation N_0 + 1, positive chance of at least one type-k and one type-j individual in generation 2N_0 + 1 if k != j, or at least two type-k individuals if k = j)
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-gf-pos#two-individuals, lem-gf-pos#choose-N0-k0, claim:branching-property
ROUTES: -
ROUTE_FOR: -
EDGE: lem-gf-pos#two-individuals | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-pos#kj-descendants@L493-L493 | supplies the positive-probability event of two individuals in generation N_0 + 1 to condition on
EDGE: lem-gf-pos#choose-N0-k0 | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-pos#kj-descendants@L493-L493 | positive regularity at time N_0 gives each of the two individuals a positive chance of a type-k (resp. type-j) descendant N_0 generations later
EDGE: claim:branching-property | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-pos#kj-descendants@L493-L493 | Markov property at generation N_0 + 1 and independence of the two individuals' descendant lines (branching property)
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Witness N = 2N_0 + 1. The independence of the two descendant lines and the use of positive regularity for each are not spelled out in the source (read from 'Conditional on this, there is a positive chance ...').

NODE: lem-gf-bded
KIND: lemma
TITLE: Lemma 2.5: strictly subinvariant point q^0 in (1,inf)^d, f_k(q^0) < q^0_k
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-bded@L500-L506
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-bded@L507-L515
CONTRACT_ID: paper.lem-gf-bded
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf])
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; exists q^0 in (1,inf)^d; for all k in {1,...,d}: f_k(q^0) < q^0_k
SOURCE_CONCLUSION: there exists q^0 in (1,inf)^d such that f_k(q^0) < q^0_k for all k in {1,...,d}
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-gf-bded#choose-eps
ROUTES: -
ROUTE_FOR: -
EDGE: lem-gf-bded#choose-eps | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-bded@L514-L514 | proof concludes the lemma with q^0 = 1 + eps v for small eps
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Hypotheses are 'the hypotheses of Theorem 1.4' (L501); carried as SOURCE_HYPOTHESES per spec section 4 (no assumption nodes). Consumed at L771 (slice C).

NODE: lem-gf-bded#perron-frobenius
KIND: application
TITLE: Perron-Frobenius: eigenvector v > 0 for the eigenvalue rho < 1 of M
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-bded#perron-frobenius@L508-L508
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-bded#perron-frobenius@L508-L508
CONTRACT_ID: paper.lem-gf-bded#perron-frobenius
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf])
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d; X; rho largest eigenvalue of M; v eigenvector with norm |v| = 1
SOURCE_CONCLUSION: rho < 1 is the largest eigenvalue of M and has an eigenvector v with |v| = 1 all of whose d components are positive (so M v = rho v)
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: ext:perron-frobenius, eqn-mean-matrix, claim:mean-matrix-powers, def-bp-basic.positive-regular, def-bp-basic.positive-regular#matrix-equiv
ROUTES: -
ROUTE_FOR: -
EDGE: ext:perron-frobenius | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-bded#perron-frobenius@L508-L508 | 'the Perron-Frobenius theorem implies that each of the d components of v is positive'
EDGE: eqn-mean-matrix | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-bded#perron-frobenius@L508-L508 | 'Recall the matrix M from (1.3)': M_kj = E_k[X_j(1)]
EDGE: claim:mean-matrix-powers | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-bded#perron-frobenius@L508-L508 | M^N has entries E_k[X_j(N)] > 0 for the positive regularity time N, which is what Perron-Frobenius needs
EDGE: def-bp-basic.positive-regular | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-bded#perron-frobenius@L508-L508 | 'we have assumed that our branching process is positive regular': source of the positive power of M
EDGE: def-bp-basic.positive-regular#matrix-equiv | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-bded#perron-frobenius@L508-L508 | 'we have assumed that our branching process is positive regular and non-singular, the Perron-Frobenius theorem implies ...': the theorem needs a power of M with all positive entries, which is the L229 clause
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: rho < 1 comes from Hypothesis I (SOURCE_HYPOTHESES). The positivity of a power of M is the usual hypothesis of PF; the source says only 'positive regular and non-singular'. Cross-slice IDs claim:mean-matrix-powers and def-bp-basic.positive-regular are slice A's; the L229 'positive regular iff M^N > 0' claim has no canonical ID (see report).

NODE: lem-gf-bded#finite-nbhd
KIND: step
TITLE: f is finite on a neighborhood of 1 = (1,...,1)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-bded#finite-nbhd@L510-L510
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-bded#finite-nbhd@L510-L510
CONTRACT_ID: paper.lem-gf-bded#finite-nbhd
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf])
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d; X
SOURCE_CONCLUSION: f_k(q) < inf for all q in a neighborhood of 1 = (1,...,1) in (0,inf]^d
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: eqn-generating-function
ROUTES: -
ROUTE_FOR: -
EDGE: eqn-generating-function | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-bded#finite-nbhd@L510-L510 | f(1) = 1 from the definition of f as an expectation of a product of powers, so continuity (III) at 1 forces finiteness nearby
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: 'By our continuity hypothesis (III) and since f(1) = 1, the function f is finite on a neighborhood of 1' (L510). Hypothesis (III) is in SOURCE_HYPOTHESES.

NODE: lem-gf-bded#jacobian
KIND: step
TITLE: M is the Jacobian of f at 1; f is regular enough for a quadratic Taylor remainder
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-bded#jacobian@L510-L510
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-bded#jacobian@L510-L510
CONTRACT_ID: paper.lem-gf-bded#jacobian
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf])
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d; X
SOURCE_CONCLUSION: f is differentiable at 1 = (1,...,1) with Jacobian matrix M (d f_k/d q_j (1) = E_k[X_j(1)] = M_kj), with enough regularity near 1 for f(1 + h) = 1 + M h + O(|h|^2)
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-gf-bded#finite-nbhd, eqn-mean-matrix, eqn-generating-function
ROUTES: -
ROUTE_FOR: -
EDGE: lem-gf-bded#finite-nbhd | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-bded#jacobian@L510-L510 | differentiation under the expectation at 1 needs f finite in a neighborhood of 1
EDGE: eqn-mean-matrix | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-bded#jacobian@L510-L510 | identifies the derivative E_k[X_j(1)] with the entry M_kj
EDGE: eqn-generating-function | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-bded#jacobian@L510-L510 | f_k(q) = E_k[prod_j q_j^{X_j(1)}] is the function being differentiated
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: 'Furthermore, M is the Jacobian matrix of f at 1' (L510) is asserted without proof. It requires differentiating q -> E_k[prod_j q_j^{X_j(1)}] under the expectation at q = 1 using finiteness on a neighborhood (power series with nonnegative coefficients), and the second-order regularity behind the O(eps^2) remainder at L512; none of this is supplied.

NODE: lem-gf-bded#taylor
KIND: application
TITLE: Taylor expansion f(1 + eps v) = 1 + rho eps v + O(eps^2)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-bded#taylor@L510-L513
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-bded#taylor@L510-L513
CONTRACT_ID: paper.lem-gf-bded#taylor
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf])
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d; X; eps -> 0 with eps > 0
SOURCE_CONCLUSION: f(1 + eps v) = 1 + rho eps v + O(eps^2) as eps -> 0
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: ext:taylor, lem-gf-bded#jacobian, lem-gf-bded#perron-frobenius
ROUTES: -
ROUTE_FOR: -
EDGE: ext:taylor | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-bded#taylor@L510-L513 | 'By Taylor expansion, for eps > 0, we have f(1 + eps v) = 1 + rho eps v + O(eps^2)'
EDGE: lem-gf-bded#jacobian | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-bded#taylor@L510-L510 | Jacobian of f at 1 is M and f has a quadratic remainder
EDGE: lem-gf-bded#perron-frobenius | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-bded#taylor@L512-L512 | M v = rho v turns 1 + eps M v into 1 + rho eps v
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Application of first-order Taylor expansion; regularity discussed at lem-gf-bded#jacobian.

NODE: lem-gf-bded#choose-eps
KIND: step
TITLE: Choice of eps and q^0 = 1 + eps v
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-bded#choose-eps@L514-L514
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-bded#choose-eps@L514-L514
CONTRACT_ID: paper.lem-gf-bded#choose-eps
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf])
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d; X; exists eps > 0 small enough
SOURCE_CONCLUSION: there is eps > 0 such that q^0 := 1 + eps v lies in (1,inf)^d and f_k(q^0) < q^0_k for all k
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-gf-bded#taylor, lem-gf-bded#perron-frobenius
ROUTES: -
ROUTE_FOR: -
EDGE: lem-gf-bded#taylor | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-bded#choose-eps@L514-L514 | 'Since rho < 1, this implies the lemma statement': rho eps v_k + O(eps^2) < eps v_k for small eps
EDGE: lem-gf-bded#perron-frobenius | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-bded#choose-eps@L514-L514 | v_k > 0 gives q^0 in (1,inf)^d and rho < 1 gives the strict inequality
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Parameter (eps) choice; witness q^0.

NODE: def-log-gf
KIND: definition
TITLE: Definition 2.6: log-coordinate generating function g and its iterates
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#def-log-gf@L533-L546
PROOF_SOURCE: -
CONTRACT_ID: paper.def.logGenFun
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X is a d-type branching process with generating function f (f_k(q) = E_k[prod_j q_j^{X_j(1)}], q in (0,inf]^d, inf^0 = 1); lambda = (lambda_1,...,lambda_d) in (-inf,inf]^d
SOURCE_QUANTIFIERS: d in N; X; lambda in (-inf,inf]^d; k in {1,...,d}; n in N
SOURCE_CONCLUSION: g_k(lambda) := log f_k(e^{lambda_1},...,e^{lambda_d}) and g(lambda) := (g_1(lambda),...,g_d(lambda)); g^{(n)} is the n-fold composition of g
CONSTANT_SCOPE: none
FROZEN_FILE: Conjugate/Frozen/Defs/LogGenFun.lean
FROZEN_DECL: Conjugate.logGenFun
FROZEN_ANCHOR_ID: def.logGenFun.v1
FROZEN_ABI_SHA256: 6323bd49d4d920a8615979bad829c80575e5cb2287b49079f468a1078067da2a
DEPS: eqn-generating-function
ROUTES: -
ROUTE_FOR: -
EDGE: eqn-generating-function | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#def-log-gf@L536-L537 | g_k is defined by composing f_k with the coordinatewise exponential and then taking log
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Statement fields exclude the derived display (2.5) at L541-L544, which is modeled separately as eqn-convex-func-n. The manifest source range also lists L991-L995 (the (3.5) countable-type version, slice D). Paper domain (-inf,inf]^d is used here; the Lean extension to [-inf,inf]^d is a Lean convention (spec section 3).

NODE: eqn-convex-func-n
KIND: display
TITLE: (2.5): g_k^{(n)}(lambda) = log f_k^{(n)}(e^lambda) = log E_k[prod_j e^{lambda_j X_j(n)}]
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-convex-func-n@L540-L545
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-convex-func-n@L540-L545
CONTRACT_ID: paper.eqn-convex-func-n
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X d-type branching process with generating function f; g as in Definition 2.6; lambda in (-inf,inf]^d
SOURCE_QUANTIFIERS: d; X; lambda in (-inf,inf]^d; k in {1,...,d}; n in N
SOURCE_CONCLUSION: g_k^{(n)}(lambda) = log f_k^{(n)}(e^{lambda_1},...,e^{lambda_d}) = log E_k[prod_{j=1}^d e^{lambda_j X_j(n)}]
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: def-log-gf, eqn-gen-func-n
ROUTES: -
ROUTE_FOR: -
EDGE: def-log-gf | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-convex-func-n@L540-L543 | g^{(n)} is the n-fold composition of g = log o f o exp (coordinatewise), so g^{(n)} = log o f^{(n)} o exp
EDGE: eqn-gen-func-n | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-convex-func-n@L540-L540 | 'Then, using (1.2), we see that ...': f_k^{(n)}(q) = E_k[prod_j q_j^{X_j(n)}]
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Labeled display consumed by lem-mono, lem-unstable-scaled and lem-unstable-ssl as the characterization of g^{(n)}. Statement and proof locators coincide (the display is observed from (1.2) in the same sentence).

NODE: eqn-fixed-pt-equiv
KIND: display
TITLE: (2.6): g(lambda) = lambda iff f(e^lambda) = e^lambda
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-equiv@L548-L552
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-equiv@L548-L552
CONTRACT_ID: paper.eqn-fixed-pt-equiv
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X d-type branching process with generating function f; g as in Definition 2.6; lambda = (lambda_1,...,lambda_d) in (-inf,inf]^d
SOURCE_QUANTIFIERS: d; X; lambda in (-inf,inf]^d
SOURCE_CONCLUSION: g(lambda_1,...,lambda_d) = (lambda_1,...,lambda_d) if and only if f(e^{lambda_1},...,e^{lambda_d}) = (e^{lambda_1},...,e^{lambda_d})
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: def-log-gf
ROUTES: -
ROUTE_FOR: -
EDGE: def-log-gf | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-equiv@L548-L552 | g = log o f o exp coordinatewise with log and exp mutually inverse between (-inf,inf] and (0,inf], so fixed points correspond
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: 'We observe that' (L548): immediate from the definition of g. Used (L553) to pass between Theorem 1.4 and Theorem 2.7; consumers are in slices A/C (cross-slice canonical ID).

NODE: def-componentwise
KIND: definition
TITLE: Definition 2.8: componentwise order on (-inf,inf]^d
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#def-componentwise@L587-L589
PROOF_SOURCE: -
CONTRACT_ID: paper.def-componentwise
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: lambda, eta in (-inf,inf]^d
SOURCE_QUANTIFIERS: d in N; lambda, eta in (-inf,inf]^d
SOURCE_CONCLUSION: lambda <= eta iff lambda_j <= eta_j for each j in {1,...,d}; lambda < eta iff lambda <= eta and there exists j in {1,...,d} with lambda_j < eta_j
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Spec section 3: '<' means '<=' with at least one strict coordinate. Consumed as the unfolding of '<' in lem-mono, prop-unstable and lem-monotone-lim proofs. Slice C's L732 reference to 'Definition 2.8' means Definition 1.3 (E5).

NODE: lem-mono
KIND: lemma
TITLE: Lemma 2.9 (Monotonicity): g^{(n)} is monotone, and strictly so after a fixed time
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-mono@L594-L598
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-mono@L599-L604
CONTRACT_ID: paper.lem-mono
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); lambda, eta in [0,inf)^d with lambda <= eta; (second assertion only) lambda < eta
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d; X; lambda, eta in [0,inf)^d with lambda <= eta; [for all k in {1,...,d}, n in N: g_k^{(n)}(lambda) <= g_k^{(n)}(eta)]; exists N in N such that [if lambda < eta then for all k and all n >= N with |g^{(n)}(eta)| < inf: g_k^{(n)}(lambda) < g_k^{(n)}(eta)]
SOURCE_CONCLUSION: g_k^{(n)}(lambda) <= g_k^{(n)}(eta) for every k in {1,...,d} and n in N; moreover there exists N in N such that if lambda < eta then g_k^{(n)}(lambda) < g_k^{(n)}(eta) for every k in {1,...,d} and every n >= N such that |g^{(n)}(eta)| < inf
CONSTANT_SCOPE: N is introduced after lambda and eta ('Let lambda, eta ... Moreover, there exists N such that ...'), so the statement lets N depend on X, lambda and eta (not on k or n)
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: eqn-convex-func-n, lem-mono#strict-ineq
ROUTES: -
ROUTE_FOR: -
EDGE: eqn-convex-func-n | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-mono@L600-L600 | first assertion 'immediate from the definition of g^{(n)}': g_k^{(n)} = log E_k[prod_j e^{lambda_j X_j(n)}] is monotone in lambda since X_j(n) >= 0
EDGE: lem-mono#strict-ineq | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-mono@L602-L603 | second assertion is the strict-inequality argument
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Consumed at L646 (this slice), L689/L676 (lem-monotone-lim), L772/L799 (slice C), L1054 (slice D). Values g_k^{(n)} lie in [0,inf] (g^{(n)}(0) = 0 since f(1) = 1). The proof's N is the positive-regularity time of lem-mono#positivity-all-n and depends only on X; that uniform reading is stronger than the statement and is recorded for Lean planning only (ADJUDICATION B4).

NODE: lem-mono#positivity-all-n
KIND: step
TITLE: P_k[X_j(n) >= 1] > 0 for all n >= N (positive regularity propagated by the Markov property)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-mono#positivity-all-n@L602-L602
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-mono#positivity-all-n@L602-L602
CONTRACT_ID: paper.lem-mono#positivity-all-n
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: positive regular d-type branching process X
SOURCE_QUANTIFIERS: d; X; exists N in N; for all n >= N, k, j in {1,...,d}
SOURCE_CONCLUSION: there exists N in N (positive regularity time, depends only on X) such that P_k[X_j(n) >= 1] > 0 for every n >= N and every k, j in {1,...,d}
CONSTANT_SCOPE: N depends only on X
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: def-bp-basic.positive-regular, claim:branching-property
ROUTES: -
ROUTE_FOR: -
EDGE: def-bp-basic.positive-regular | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-mono#positivity-all-n@L602-L602 | 'By positive regularity (Definition 1.3), there exists N in N such that ...'
EDGE: claim:branching-property | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-mono#positivity-all-n@L602-L602 | 'From this and the Markov property of the branching process, in fact ... for each n >= N'
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: The Markov property is invoked by name in the source ('From this and the Markov property of the branching process', L602); it is modeled by the shared node claim:branching-property.

NODE: lem-mono#strict-ineq
KIND: step
TITLE: Strict inequality of expectations on a positive-probability event
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-mono#strict-ineq@L602-L603
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-mono#strict-ineq@L602-L603
CONTRACT_ID: paper.lem-mono#strict-ineq
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); lambda, eta in [0,inf)^d with lambda < eta
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d; X; lambda < eta; j* with lambda_{j*} < eta_{j*}; N from lem-mono#positivity-all-n; k; n >= N with g_k^{(n)}(eta) finite
SOURCE_CONCLUSION: for n >= N, with positive P_k-probability prod_j e^{lambda_j X_j(n)} < prod_j e^{eta_j X_j(n)} (the event X_{j*}(n) >= 1), hence taking E_k-expectations g_k^{(n)}(lambda) < g_k^{(n)}(eta) provided g_k^{(n)}(eta) is finite
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-mono#positivity-all-n, eqn-convex-func-n, def-componentwise
ROUTES: -
ROUTE_FOR: -
EDGE: lem-mono#positivity-all-n | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-mono#strict-ineq@L603-L603 | positive probability of X_{j*}(n) >= 1 for n >= N gives the strict pointwise inequality on a positive-probability event
EDGE: eqn-convex-func-n | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-mono#strict-ineq@L603-L603 | g_k^{(n)} = log E_k[prod_j e^{lambda_j X_j(n)}]: expectations of the two products are compared
EDGE: def-componentwise | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-mono#strict-ineq@L602-L602 | 'let j* be such that lambda_{j*} < eta_{j*}': unfolds lambda < eta of Definition 2.8
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: The source proves strictness 'provided g_k^{(n)}(eta) is finite' (L603); the statement asks for |g^{(n)}(eta)| < inf (all components), which is stronger.

NODE: lem-unstable-scaled
KIND: lemma
TITLE: Lemma 2.11: scaling a bounded orbit by r < 1 sends it to 0
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-unstable-scaled@L619-L622
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-unstable-scaled@L623-L636
CONTRACT_ID: paper.lem-unstable-scaled
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); lambda in [0,inf)^d minus {0} with limsup_{n} |g^{(n)}(lambda)| < inf
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d; X; lambda in [0,inf)^d minus {0} with limsup_n |g^{(n)}(lambda)| < inf; for all r in [0,1): lim_n |g^{(n)}(r lambda)| = 0
SOURCE_CONCLUSION: for every r in [0,1), lim_{n -> inf} |g^{(n)}(r lambda)| = 0
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-unstable-scaled#vitali
ROUTES: -
ROUTE_FOR: -
EDGE: lem-unstable-scaled#vitali | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-unstable-scaled@L635-L635 | the lemma conclusion is the Vitali-convergence conclusion g_k^{(n)}(r lambda) -> 0
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: |.| is any norm (R1). Consumed at L643 (prop-unstable) and L835 (slice C, lem-ray-intersect). The statement says the lemma is 'a straightforward consequence of the Vitali convergence theorem' (L617).

NODE: lem-unstable-scaled#extinction-as
KIND: step
TITLE: Almost-sure extinction under Hypothesis I; Z_n -> 1 a.s.
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-unstable-scaled#extinction-as@L628-L628
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-unstable-scaled#extinction-as@L628-L628
CONTRACT_ID: paper.lem-unstable-scaled#extinction-as
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); lambda in [0,inf)^d; r in [0,1)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d; X; k in {1,...,d}
SOURCE_CONCLUSION: P_k-a.s., each X_j(n) equals 0 for all sufficiently large n (extinction probability one); hence Z_n := prod_j e^{r lambda_j X_j(n)} -> 1 P_k-a.s.
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: claim:subcritical-extinction, def:extinction
ROUTES: -
ROUTE_FOR: -
EDGE: claim:subcritical-extinction | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-unstable-scaled#extinction-as@L628-L628 | 'Since the extinction probability is one (Hypothesis I)': subcriticality is the stated reason
EDGE: def:extinction | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-unstable-scaled#extinction-as@L628-L628 | extinction event: a.s. X_j(n) = 0 for all large n, so Z_n = 1 eventually
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: the source attributes 'extinction probability is one' to Hypothesis I (subcritical, rho < 1) with no argument at L628, and Definition 1.2 (L185) lists extinction probability one as a separate assumption on the subcritical process; subcritical => almost-sure extinction is not proved in the corpus.

NODE: lem-unstable-scaled#holder-bound
KIND: application
TITLE: Holder bound: E_k[Z_n 1_{Z_n > 1}] <= exp(r g_k^{(n)}(lambda)) P_k[Z_n > 1]^{1-r}
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-unstable-scaled#holder-bound@L629-L634
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-unstable-scaled#holder-bound@L629-L634
CONTRACT_ID: paper.lem-unstable-scaled#holder-bound
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); lambda in [0,inf)^d; r in (0,1)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d; X; r in (0,1); k in {1,...,d}; n in N
SOURCE_CONCLUSION: E_k[Z_n 1_{Z_n > 1}] <= E_k[Z_n^{1/r}]^r P_k[Z_n > 1]^{1-r} = exp(r g_k^{(n)}(lambda)) P_k[Z_n > 1]^{1-r}, where Z_n = prod_j e^{r lambda_j X_j(n)}
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: ext:holder, eqn-convex-func-n
ROUTES: -
ROUTE_FOR: -
EDGE: ext:holder | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-unstable-scaled#holder-bound@L631-L632 | Holder's inequality with exponents 1/r and 1/(1-r) applied to Z_n and 1_{Z_n > 1}
EDGE: eqn-convex-func-n | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-unstable-scaled#holder-bound@L633-L633 | E_k[Z_n^{1/r}] = E_k[prod_j e^{lambda_j X_j(n)}] = exp(g_k^{(n)}(lambda))
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: Holder needs r > 0 (exponent 1/r) while Lemma 2.11 is stated for r in [0,1); the case r = 0 (Z_n = 1, g^{(n)}(0) = 0) is not discussed in the source, so lem-unstable-scaled#vitali obtains its conclusion from the source text only for r in (0,1).

NODE: lem-unstable-scaled#vitali
KIND: application
TITLE: Vitali convergence: E_k[Z_n] -> 1, hence g_k^{(n)}(r lambda) -> 0
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-unstable-scaled#vitali@L635-L635
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-unstable-scaled#vitali@L635-L635
CONTRACT_ID: paper.lem-unstable-scaled#vitali
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); lambda in [0,inf)^d minus {0} with limsup_n |g^{(n)}(lambda)| < inf; r in [0,1)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d; X; r in [0,1); k in {1,...,d}
SOURCE_CONCLUSION: E_k[Z_n 1_{Z_n > 1}] -> 0 (because limsup_n g_k^{(n)}(lambda) < inf and P_k[Z_n > 1] -> 0 from Z_n -> 1 a.s.), so by Vitali convergence E_k[Z_n] -> 1 and g_k^{(n)}(r lambda) = log E_k[Z_n] -> 0, i.e. |g^{(n)}(r lambda)| -> 0
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: ext:vitali, lem-unstable-scaled#holder-bound, lem-unstable-scaled#extinction-as, eqn-convex-func-n
ROUTES: -
ROUTE_FOR: -
EDGE: ext:vitali | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-unstable-scaled#vitali@L635-L635 | 'By the Vitali convergence theorem, we get that ... E_k[Z_n] = 1 in the limit'
EDGE: lem-unstable-scaled#holder-bound | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-unstable-scaled#vitali@L635-L635 | 'this goes to zero as n -> inf': the Holder bound controls E_k[Z_n 1_{Z_n > 1}]
EDGE: lem-unstable-scaled#extinction-as | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-unstable-scaled#vitali@L635-L635 | Z_n -> 1 a.s. and P_k[Z_n > 1] -> 0
EDGE: eqn-convex-func-n | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-unstable-scaled#vitali@L624-L626 | g_k^{(n)}(r lambda) = log E_k[Z_n]
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Source writes 'lim_{k -> inf} E_k[Z_n]' and 'lim_{k -> inf} g_k^{(n)}' (L635); read as n -> inf (typo). The step from E_k[Z_n 1_{Z_n > 1}] -> 0 to uniform integrability of (Z_n) is part of this application.

NODE: prop-unstable
KIND: proposition
TITLE: Proposition 2.10: bounded/nonvanishing orbits are unstable under strict decrease/increase
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-unstable@L608-L615
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-unstable@L640-L649
CONTRACT_ID: paper.prop-unstable
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); (i) lambda in [0,inf)^d minus {0}, limsup_n |g^{(n)}(lambda)| < inf, eta in [0,inf)^d with eta < lambda; (ii) lambda in [0,inf)^d minus {0}, limsup_n |g^{(n)}(lambda)| > 0, eta in [0,inf)^d with eta > lambda
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d; X; for each of (i), (ii): lambda, then eta; (i) lim_n |g^{(n)}(eta)| = 0; (ii) limsup_n |g^{(n)}(eta)| = inf
SOURCE_CONCLUSION: (i) if lambda in [0,inf)^d minus {0}, limsup_n |g^{(n)}(lambda)| < inf and eta in [0,inf)^d with eta < lambda, then lim_n |g^{(n)}(eta)| = 0; (ii) if lambda in [0,inf)^d minus {0}, limsup_n |g^{(n)}(lambda)| > 0 and eta in [0,inf)^d with eta > lambda, then limsup_n |g^{(n)}(eta)| = inf
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: prop-unstable#part-i, prop-unstable#part-ii
ROUTES: -
ROUTE_FOR: -
EDGE: prop-unstable#part-i | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-unstable@L647-L647 | 'This gives assertion (i)'
EDGE: prop-unstable#part-ii | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-unstable@L648-L648 | 'Assertion (ii) follows by ...'
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Two parts modeled as step nodes. Consumed in slice C at L731 (motivation for the lim/limsup asymmetry) and slice D at L1058.

NODE: prop-unstable#strict-case
KIND: step
TITLE: Strict-in-every-coordinate case via scaling (Lemma 2.11)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-unstable#strict-case@L641-L643
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-unstable#strict-case@L641-L643
CONTRACT_ID: paper.prop-unstable#strict-case
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); lambda in [0,inf)^d minus {0} with limsup_n |g^{(n)}(lambda)| < inf; eta in [0,inf)^d with eta_j < lambda_j for every j
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d; X; lambda; eta; exists r in (0,1) with eta <= r lambda
SOURCE_CONCLUSION: if eta_j < lambda_j for each j in {1,...,d}, there is r in (0,1) with eta <= r lambda, and then lim_n |g^{(n)}(eta)| = 0
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-unstable-scaled, lem-mono
ROUTES: -
ROUTE_FOR: -
EDGE: lem-unstable-scaled | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-unstable#strict-case@L643-L643 | 'By Lemma 2.11, this implies that lim_n ‖g^{(n)}(eta)‖ = 0'
EDGE: lem-mono | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-unstable#strict-case@L642-L643 | implicit in 'this implies': eta <= r lambda gives g^{(n)}(eta) <= g^{(n)}(r lambda) coordinatewise (first assertion of Lemma 2.9), with g^{(n)} >= 0 on [0,inf)^d, so ‖g^{(n)}(eta)‖ is controlled by ‖g^{(n)}(r lambda)‖
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: The monotonicity step from eta <= r lambda to the norm bound is not stated in the source (the edge to lem-mono records an implicit use; this node is not a gap node).

NODE: prop-unstable#part-i
KIND: step
TITLE: Assertion (i): eta < lambda implies lim |g^{(n)}(eta)| = 0
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-unstable#part-i@L610-L611
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-unstable#part-i@L645-L647
CONTRACT_ID: paper.prop-unstable#part-i
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); lambda in [0,inf)^d minus {0} with limsup_n |g^{(n)}(lambda)| < inf; eta in [0,inf)^d with eta < lambda
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d; X; lambda; eta
SOURCE_CONCLUSION: lim_{n -> inf} |g^{(n)}(eta)| = 0
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: prop-unstable#strict-case, lem-mono, def-componentwise
ROUTES: -
ROUTE_FOR: -
EDGE: prop-unstable#strict-case | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-unstable#part-i@L646-L646 | apply 'the first paragraph' with g^{(N)}(lambda) in place of lambda and g^{(N)}(eta) in place of eta
EDGE: lem-mono | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-unstable#part-i@L646-L646 | 'By the second assertion of Lemma 2.9, there exists N with g_k^{(N)}(eta) < g_k^{(N)}(lambda) for each k'
EDGE: def-componentwise | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-unstable#part-i@L645-L645 | unfolds eta < lambda: eta_j <= lambda_j for every j with at least one strict inequality
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: premises of the two cited results are not discharged at L646: the strict clause of Lemma 2.9 holds only for n >= N with |g^{(n)}(lambda)| < inf (lambda is the larger argument), so N has to be chosen with g^{(N)}(lambda) finite, and the first paragraph needs g^{(N)}(lambda) in [0,inf)^d \ {0} and limsup_n |g^{(n)}(g^{(N)}(lambda))| < inf (stated by the source). Source writes 'limsup_n |g^{(n)}(eta)| = 0' at L646 for the conclusion of (i); read as lim (typo; limsup = 0 is equivalent to lim = 0 for nonnegative quantities).

NODE: prop-unstable#part-ii
KIND: step
TITLE: Assertion (ii): eta > lambda implies limsup |g^{(n)}(eta)| = infinity
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-unstable#part-ii@L612-L613
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-unstable#part-ii@L648-L648
CONTRACT_ID: paper.prop-unstable#part-ii
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); lambda in [0,inf)^d minus {0} with limsup_n |g^{(n)}(lambda)| > 0; eta in [0,inf)^d with eta > lambda
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d; X; lambda; eta
SOURCE_CONCLUSION: limsup_{n -> inf} |g^{(n)}(eta)| = inf
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: prop-unstable#part-i
ROUTES: -
ROUTE_FOR: -
EDGE: prop-unstable#part-i | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-unstable#part-ii@L648-L648 | 'follows by applying Assertion (i) with the roles of lambda and eta interchanged'
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Source reading (L648): contrapositive of (i) with roles swapped (if limsup |g^{(n)}(eta)| were finite, (i) applied to the pair (eta, lambda) would give lim |g^{(n)}(lambda)| = 0, contradicting limsup |g^{(n)}(lambda)| > 0). The source states only the one-line pointer.

NODE: lem-unstable-ssl
KIND: lemma
TITLE: Lemma 2.12: Proposition 2.10 along the subsequence r m
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-unstable-ssl@L653-L661
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-unstable-ssl@L662-L664
CONTRACT_ID: paper.lem-unstable-ssl
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); m in N fixed; (i) lambda in [0,inf)^d minus {0}, limsup_{r -> inf} |g^{(r m)}(lambda)| < inf, eta in [0,inf)^d with eta < lambda; (ii) lambda in [0,inf)^d minus {0}, limsup_{r -> inf} |g^{(r m)}(lambda)| > 0, eta in [0,inf)^d with eta > lambda
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d; X; m in N fixed; for each of (i), (ii): lambda, then eta; (i) lim_r |g^{(r m)}(eta)| = 0; (ii) limsup_r |g^{(r m)}(eta)| = inf
SOURCE_CONCLUSION: Fix m in N. (i) if lambda in [0,inf)^d minus {0}, limsup_{r -> inf} |g^{(r m)}(lambda)| < inf and eta in [0,inf)^d with eta < lambda, then lim_{r -> inf} |g^{(r m)}(eta)| = 0; (ii) if lambda in [0,inf)^d minus {0}, limsup_{r -> inf} |g^{(r m)}(lambda)| > 0 and eta in [0,inf)^d with eta > lambda, then limsup_{r -> inf} |g^{(r m)}(eta)| = inf
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-unstable-ssl#apply-prop-unstable
ROUTES: -
ROUTE_FOR: -
EDGE: lem-unstable-ssl#apply-prop-unstable | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-unstable-ssl@L663-L663 | 'The lemma follows by applying Proposition 2.10 to this branching process'
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Consumed by lem-monotone-lim (L690) in this slice.

NODE: lem-unstable-ssl#skeleton-hypotheses
KIND: step
TITLE: The m-skeleton X-tilde(r) = X(m r) satisfies the hypotheses of Theorem 1.4
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-unstable-ssl#skeleton-hypotheses@L663-L663
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-unstable-ssl#skeleton-hypotheses@L663-L663
CONTRACT_ID: paper.lem-unstable-ssl#skeleton-hypotheses
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); m in N; X-tilde_k(r) := X_k(m r) for r in N_0
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d; X; m in N
SOURCE_CONCLUSION: X-tilde = {X(m r)}_{r in N_0} is a d-type branching process (with P-tilde_k = P_k and generating function f^{(m)}) satisfying (I) subcritical, (II) positive regular and non-singular, (III) each f-tilde_k = f_k^{(m)} is continuous from (0,inf]^d to (0,inf]
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: 'One easily verifies that {X-tilde(r)} satisfies the hypotheses of Theorem 1.4' (L663) is asserted without proof. The three verifications are independent obligations: (I) the mean matrix of X-tilde is M^m so rho^m < 1 (needs (1.4)-type facts about M^n); (II) positive regularity and, in particular, non-singularity of the m-skeleton; (III) continuity of f^{(m)} as an m-fold composition of continuous maps (with the half-open topology). The source supplies none of these arguments, so no dependencies are recorded.

NODE: lem-unstable-ssl#skeleton-gf
KIND: step
TITLE: The log generating function of X-tilde is g^{(m)}, so its r-th iterate is g^{(r m)}
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-unstable-ssl#skeleton-gf@L663-L663
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-unstable-ssl#skeleton-gf@L663-L663
CONTRACT_ID: paper.lem-unstable-ssl#skeleton-gf
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); m in N; X-tilde(r) := X(m r)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d; X; m in N; r in N
SOURCE_CONCLUSION: the function g-tilde of Definition 2.6 for X-tilde equals g^{(m)}, hence g-tilde^{(r)} = g^{(r m)} and |g-tilde^{(r)}| = |g^{(r m)}| for every r in N
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: eqn-convex-func-n
ROUTES: -
ROUTE_FOR: -
EDGE: eqn-convex-func-n | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-unstable-ssl#skeleton-gf@L663-L663 | g-tilde_k(lambda) = log E_k[prod_j e^{lambda_j X-tilde_j(1)}] = log E_k[prod_j e^{lambda_j X_j(m)}] = g_k^{(m)}(lambda)
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: (minor, unstated bridge) the identification g-tilde = g^{(m)} that turns Proposition 2.10 for X-tilde into the statement about g^{(r m)} is not written in the source; it is implicit in 'applying Proposition 2.10 to this branching process' (L663).

NODE: lem-unstable-ssl#apply-prop-unstable
KIND: application
TITLE: Apply Proposition 2.10 to the m-skeleton
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-unstable-ssl#apply-prop-unstable@L663-L663
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-unstable-ssl#apply-prop-unstable@L663-L663
CONTRACT_ID: paper.lem-unstable-ssl#apply-prop-unstable
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); m in N
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d; X; m in N; (i), (ii) of Lemma 2.12
SOURCE_CONCLUSION: Proposition 2.10 (i) and (ii) applied to X-tilde, together with g-tilde^{(r)} = g^{(r m)}, gives (i) and (ii) of Lemma 2.12
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: prop-unstable, lem-unstable-ssl#skeleton-hypotheses, lem-unstable-ssl#skeleton-gf
ROUTES: -
ROUTE_FOR: -
EDGE: prop-unstable | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-unstable-ssl#apply-prop-unstable@L663-L663 | 'The lemma follows by applying Proposition 2.10 to this branching process'
EDGE: lem-unstable-ssl#skeleton-hypotheses | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-unstable-ssl#apply-prop-unstable@L663-L663 | the hypotheses of Theorem 1.4 (which Prop 2.10 assumes) for X-tilde
EDGE: lem-unstable-ssl#skeleton-gf | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-unstable-ssl#apply-prop-unstable@L663-L663 | translates g-tilde^{(r)} into g^{(r m)}
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Application whose premises (setting of Theorem 1.4 for X-tilde) are discharged by lem-unstable-ssl#skeleton-hypotheses.

NODE: lem-monotone-lim
KIND: lemma
TITLE: Lemma 2.13: g^{(m)}(lambda) < lambda forces convergence to 0; g^{(m)}(lambda) > lambda forces divergence
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-monotone-lim@L669-L673
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-monotone-lim@L674-L694
CONTRACT_ID: paper.lem-monotone-lim
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); lambda in [0,inf)^d; (a) there exists m in N with g^{(m)}(lambda) < lambda; (b) there exists m in N with g^{(m)}(lambda) > lambda
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d; X; lambda in [0,inf)^d; then (a) under its premise lim_n g^{(n)}(lambda) = 0, (b) under its premise lim_n |g^{(n)}(lambda)| = inf
SOURCE_CONCLUSION: for lambda in [0,inf)^d: if there exists m in N such that g^{(m)}(lambda) < lambda then lim_{n -> inf} g^{(n)}(lambda) = 0; if there exists m in N such that g^{(m)}(lambda) > lambda then lim_{n -> inf} |g^{(n)}(lambda)| = inf
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-monotone-lim#limits-zero, lem-monotone-lim#part-b
ROUTES: -
ROUTE_FOR: -
EDGE: lem-monotone-lim#limits-zero | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-monotone-lim@L691-L691 | 'which implies that lim_n g^{(n)}(lambda) = 0': first assertion
EDGE: lem-monotone-lim#part-b | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-monotone-lim@L693-L693 | 'The statement when g^{(m)}(lambda) > lambda is proven similarly': second assertion
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: '<' and '>' are those of Definition 2.8 (componentwise, at least one strict). Consumed at L771 and L799 (slice C).

NODE: lem-monotone-lim#shifted-mono
KIND: step
TITLE: (2.7): g^{(m+n)}(lambda) <= g^{(n)}(lambda), strict for large n
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-monotone-lim#shifted-mono@L675-L680
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-monotone-lim#shifted-mono@L675-L680
CONTRACT_ID: paper.lem-monotone-lim#shifted-mono
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); lambda in [0,inf)^d; m in N with g^{(m)}(lambda) < lambda; g^{(0)}(lambda) := lambda
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d; X; lambda; m; n >= 0
SOURCE_CONCLUSION: g^{(m+n)}(lambda) <= g^{(n)}(lambda) for every n >= 0 (g^{(0)}(lambda) = lambda), and the inequality is strict for all sufficiently large n
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-mono, def-componentwise
ROUTES: -
ROUTE_FOR: -
EDGE: lem-mono | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-monotone-lim#shifted-mono@L676-L680 | both assertions of Lemma 2.9 applied to g^{(m)}(lambda) < lambda: monotonicity gives (2.7), the strict clause gives strictness for large n
EDGE: def-componentwise | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-monotone-lim#shifted-mono@L675-L675 | the hypothesis g^{(m)}(lambda) < lambda is in the sense of Definition 2.8
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP (minor): the strict clause of Lemma 2.9 holds only for n >= N with |g^{(n)}(lambda)| < inf (lambda is the larger argument); the source asserts 'strict if n is sufficiently large' (L680) without showing that this finiteness proviso holds for all large n.

NODE: lem-monotone-lim#limits-exist
KIND: step
TITLE: (2.8): the limits lambda-bar^s = lim_r g^{(r m + s)}(lambda) exist
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-monotone-lim#limits-exist@L681-L685
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-monotone-lim#limits-exist@L681-L685
CONTRACT_ID: paper.lem-monotone-lim#limits-exist
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); lambda in [0,inf)^d; m in N with g^{(m)}(lambda) < lambda; s in {0,...,m-1}
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d; X; lambda; m; s in {0,...,m-1}; r >= 0
SOURCE_CONCLUSION: g^{((r+1) m + s)}(lambda) <= g^{(r m + s)}(lambda) for every integer r >= 0, hence lambda-bar^s := lim_{r -> inf} g^{(r m + s)}(lambda) exists (monotone, bounded below by 0)
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-monotone-lim#shifted-mono
ROUTES: -
ROUTE_FOR: -
EDGE: lem-monotone-lim#shifted-mono | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-monotone-lim#limits-exist@L681-L681 | apply (2.7) with n = r m + s
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Monotone convergence in each coordinate; g^{(n)} >= 0 on [0,inf)^d.

NODE: lem-monotone-lim#limit-fixed
KIND: step
TITLE: g^{(r m)}(lambda-bar^s) = lambda-bar^s (passing the limit through g^{(m)})
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-monotone-lim#limit-fixed@L689-L689
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-monotone-lim#limit-fixed@L689-L689
CONTRACT_ID: paper.lem-monotone-lim#limit-fixed
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); lambda in [0,inf)^d; m in N with g^{(m)}(lambda) < lambda; s in {0,...,m-1}; lambda-bar^s as in (2.8)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d; X; lambda; m; s; r in N
SOURCE_CONCLUSION: g^{(r m)}(lambda-bar^s) = lambda-bar^s for every r in N; in particular limsup_{r -> inf} |g^{(r m)}(lambda-bar^s)| = |lambda-bar^s| > 0 when lambda-bar^s > 0
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-monotone-lim#limits-exist
ROUTES: -
ROUTE_FOR: -
EDGE: lem-monotone-lim#limits-exist | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-monotone-lim#limit-fixed@L689-L689 | lambda-bar^s is the limit (2.8) of g^{(r m + s)}(lambda)
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: 'We have g^{(r m)}(lambda-bar^s) = lambda-bar^s for each r in N' (L689) is asserted without argument. It requires continuity of g^{(m)} (consequence of Hypothesis III) to pass the limit through g^{(m)}: g^{(m)}(lambda-bar^s) = lim_r g^{(m)}(g^{(r m + s)}(lambda)) = lambda-bar^s. Continuity of g^{(n)} is proved only later (L814, slice C).

NODE: lem-monotone-lim#limits-zero
KIND: step
TITLE: Contradiction argument: lambda-bar^s = 0 for every s, hence g^{(n)}(lambda) -> 0
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-monotone-lim#limits-zero@L687-L691
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-monotone-lim#limits-zero@L687-L691
CONTRACT_ID: paper.lem-monotone-lim#limits-zero
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); lambda in [0,inf)^d; m in N with g^{(m)}(lambda) < lambda; lambda-bar^s as in (2.8)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d; X; lambda; m; s in {0,...,m-1}
SOURCE_CONCLUSION: lambda-bar^s = 0 for every s in {0,...,m-1}, hence lim_{n -> inf} g^{(n)}(lambda) = 0
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-monotone-lim#limits-exist, lem-monotone-lim#limit-fixed, lem-monotone-lim#shifted-mono, lem-unstable-ssl, def-componentwise
ROUTES: -
ROUTE_FOR: -
EDGE: lem-monotone-lim#limits-exist | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-monotone-lim#limits-zero@L688-L691 | (2.8) supplies lambda-bar^s and its convergence, contradicted by the divergence of the orbit from g^{(s)}(lambda)
EDGE: lem-monotone-lim#limit-fixed | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-monotone-lim#limits-zero@L689-L689 | gives limsup_r ‖g^{(r m)}(lambda-bar^s)‖ > 0 when lambda-bar^s > 0
EDGE: lem-monotone-lim#shifted-mono | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-monotone-lim#limits-zero@L689-L689 | strictness of (2.7) for large n gives lambda-bar^s < g^{(s)}(lambda)
EDGE: lem-unstable-ssl | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-monotone-lim#limits-zero@L690-L690 | assertion (ii) of Lemma 2.12 with lambda-bar^s and eta = g^{(s)}(lambda) gives limsup_r ‖g^{(r m)}(g^{(s)}(lambda))‖ = inf, contradicting (2.8)
EDGE: def-componentwise | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-monotone-lim#limits-zero@L688-L689 | 'lambda-bar^s > 0 (at least one component positive)' and 'lambda-bar^s < g^{(s)}(lambda)' use Definition 2.8
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP (minor): Lemma 2.12(ii) is applied at L690 with lambda := lambda-bar^s and eta := g^{(s)}(lambda), but its premises (lambda-bar^s in [0,inf)^d \ {0}, eta in [0,inf)^d, i.e. finiteness of g^{(s)}(lambda) for s in {0,...,m-1}) are not discharged in the source; lambda-bar^s < g^{(s)}(lambda) is asserted in one clause from the large-n strictness of (2.7). Proof by contradiction for the first assertion; the m subsequences s = 0,...,m-1 are combined to conclude convergence of the full sequence (routine).

NODE: lem-monotone-lim#part-b
KIND: step
TITLE: Second assertion (g^{(m)}(lambda) > lambda forces |g^{(n)}(lambda)| -> inf)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-monotone-lim#part-b@L672-L672
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-monotone-lim#part-b@L693-L693
CONTRACT_ID: paper.lem-monotone-lim#part-b
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); lambda in [0,inf)^d; m in N with g^{(m)}(lambda) > lambda
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d; X; lambda; m
SOURCE_CONCLUSION: lim_{n -> inf} |g^{(n)}(lambda)| = inf
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-mono, lem-unstable-ssl, def-componentwise
ROUTES: -
ROUTE_FOR: -
EDGE: lem-mono | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-monotone-lim#part-b@L675-L693 | 'proven similarly' (L693): the increasing analogue of the (2.7) argument at L676-L680
EDGE: lem-unstable-ssl | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-monotone-lim#part-b@L675-L693 | 'proven similarly' (L693): the analogue of the contradiction argument at L690
EDGE: def-componentwise | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-monotone-lim#part-b@L675-L693 | 'proven similarly' (L693): the sense of '>' is that of Definition 2.8
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-B/sonnet
REVIEWER: reviewer-B/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: the second assertion is not proved; the source says only 'The statement when g^{(m)}(lambda) > lambda is proven similarly' (L693). The commented-out proof at L696-L715 is not part of the paper and was ignored. The DEPS list is the extractor's reading of 'similarly' (the ingredients of the first assertion); in the divergent case the limits of the monotone subsequences may have infinite components, which the source does not address.

NODE: eqn-basin-def.zero
KIND: definition
TITLE: (2.9) basin of attraction of 0: S_0 = {lambda in [0,inf]^d : lim_n |g^{(n)}(lambda)| = 0}
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-basin-def.zero@L726-L729
PROOF_SOURCE: -
CONTRACT_ID: paper.def.basinZero
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X is a d-type branching process with generating function f; g, g^{(n)} as in Definition 2.6 evaluated on [0,inf]^d; |.| is any norm on R^d (R1). (Paper context: Section 2.3 sits under the Theorem 1.4 setting of L528; the definition itself uses none of Hypotheses I-III.)
SOURCE_QUANTIFIERS: d in N; X; lambda in [0,inf]^d; limit over n -> inf
SOURCE_CONCLUSION: S_0 := {lambda in [0,inf]^d : lim_{n -> inf} |g^{(n)}(lambda)| = 0}
CONSTANT_SCOPE: none
FROZEN_FILE: Conjugate/Frozen/Defs/BasinZero.lean
FROZEN_DECL: Conjugate.basinZero
FROZEN_ANCHOR_ID: def.basinZero.v1
FROZEN_ABI_SHA256: f2c0dd7ccb2b062e31b279ed5f2ef546f4ff7baed6bab7b69c5125a00dfbb702
DEPS: def-log-gf
ROUTES: -
ROUTE_FOR: -
EDGE: def-log-gf | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-basin-def.zero@L728-L728 | S_0 is defined through the iterates g^{(n)} of g from Definition 2.6
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: reviewer-C/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Display (2.9) (L727-L730) defines both basins; it is split into the two frozen anchors eqn-basin-def.zero and eqn-basin-def.infty, both with the manifest source range L726-L729. Note the asymmetry stated at L731: lim for S_0, limsup for S_inf (motivation only; L731 cites Proposition 2.10 as the reason but consumes no result, so no edge to prop-unstable is added). Statement fields read from L726-L729 only; FROZEN_* and CONTRACT_* copied verbatim from EXTRACTION_SPEC section 8.

NODE: eqn-basin-def.infty
KIND: definition
TITLE: (2.9) basin of attraction of infinity: S_inf = {lambda in [0,inf]^d : limsup_n |g^{(n)}(lambda)| = inf}
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-basin-def.infty@L726-L729
PROOF_SOURCE: -
CONTRACT_ID: paper.def.basinInfty
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X is a d-type branching process with generating function f; g, g^{(n)} as in Definition 2.6 evaluated on [0,inf]^d; |.| is any norm on R^d (R1). (Paper context: Section 2.3 sits under the Theorem 1.4 setting of L528; the definition itself uses none of Hypotheses I-III.)
SOURCE_QUANTIFIERS: d in N; X; lambda in [0,inf]^d; limsup over n -> inf
SOURCE_CONCLUSION: S_inf := {lambda in [0,inf]^d : limsup_{n -> inf} |g^{(n)}(lambda)| = inf}
CONSTANT_SCOPE: none
FROZEN_FILE: Conjugate/Frozen/Defs/BasinInfty.lean
FROZEN_DECL: Conjugate.basinInfty
FROZEN_ANCHOR_ID: def.basinInfty.v1
FROZEN_ABI_SHA256: 5b77ae3e04c31f9db7d9bdc3f5c0959e35d4398ebc99896298879a88133e8a0c
DEPS: def-log-gf
ROUTES: -
ROUTE_FOR: -
EDGE: def-log-gf | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-basin-def.infty@L729-L729 | S_inf is defined through the iterates g^{(n)} of g from Definition 2.6
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: reviewer-C/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Second half of display (2.9) (see eqn-basin-def.zero). FROZEN_* and CONTRACT_* copied verbatim from EXTRACTION_SPEC section 8.

NODE: eqn-infty-subset#blowup
KIND: step
TITLE: Positive regularity: g^{(N)}(lambda) = (inf,...,inf) whenever some coordinate of lambda in [0,inf]^d is inf
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-infty-subset#blowup@L732-L732
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-infty-subset#blowup@L732-L732
CONTRACT_ID: paper.eqn-infty-subset#blowup
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); g, g^{(n)} as in Definition 2.6 evaluated on [0,inf]^d; lambda in [0,inf]^d with at least one coordinate equal to inf (conventions inf^0 = 1, inf^x = inf for x > 0, L208)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; exists N in N; for all lambda in [0,inf]^d with lambda_j = inf for some j in {1,...,d}
SOURCE_CONCLUSION: there exists N in N such that for every lambda in [0,inf]^d having at least one coordinate equal to inf, g^{(N)}(lambda) = (inf,...,inf)
CONSTANT_SCOPE: N depends only on X (from positive regularity), not on lambda
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: def-bp-basic.positive-regular
ROUTES: -
ROUTE_FOR: -
EDGE: def-bp-basic.positive-regular | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-infty-subset#blowup@L732-L732 | 'since our branching process is positive regular (Definition 2.8) there exists N such that ...' (E5: Definition 1.3)
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: asserted ('since our branching process is positive regular, there exists N such that if any of the d coordinates of lambda is equal to inf, then g^{(N)}(lambda) = (inf,...,inf)', L732) with no argument. The source does not show how positive regularity (P_k[X_j(N) >= 1] > 0 for all k, j) interacts with the infinite-coordinate convention for f^{(N)} and the exponential/log carrier. The paper's 'Definition 2.8' here is Definition 1.3 (E5). The only edge is to the definition of positive regularity; the edge to eqn-convex-func-n was dropped (ADJUDICATION C5) because the source cites only positive regularity.

NODE: eqn-infty-subset
KIND: display
TITLE: (2.10): [0,inf]^d \ [0,inf)^d is contained in S_inf
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-infty-subset@L732-L735
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-infty-subset@L732-L733
CONTRACT_ID: paper.eqn-infty-subset
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); S_0, S_inf as in (2.9)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X
SOURCE_CONCLUSION: [0,inf]^d \ [0,inf)^d is a subset of S_inf: every lambda in [0,inf]^d with at least one coordinate equal to inf satisfies limsup_{n -> inf} |g^{(n)}(lambda)| = inf
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: eqn-infty-subset#blowup, eqn-basin-def.infty
ROUTES: -
ROUTE_FOR: -
EDGE: eqn-infty-subset#blowup | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-infty-subset@L732-L733 | 'This implies that (2.10)': g^{(N)}(lambda) = (inf,...,inf) is the stated reason
EDGE: eqn-basin-def.infty | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-infty-subset@L733-L734 | membership in S_inf means limsup of the norm of g^{(n)}(lambda) is inf, by (2.9)
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: reviewer-C/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Canonical cross-slice ID (spec section 9). The passage from g^{(N)}(lambda) = (inf,...,inf) to limsup = inf is stated only as 'This implies'; it needs g^{(kN)}(lambda) = (inf,...,inf) for all k, which is the blowup claim re-applied to the point (inf,...,inf) itself (unstated; not modeled separately). Consumed at L820 (lem-basin-open) and, without being cited by the source, at L870 (Lambda closed) and L896 (g(Lambda) finite).

NODE: lem-basin-closed
KIND: lemma
TITLE: Lemma 2.14: S_0 and S_inf are forward and backward invariant under g
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-basin-closed@L737-L739
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-basin-closed@L740-L742
CONTRACT_ID: paper.lem-basin-closed
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); S_0, S_inf as in (2.9); g acts on [0,inf]^d
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; four inclusions (no further quantifier)
SOURCE_CONCLUSION: g(S_0) is a subset of S_0, g(S_inf) is a subset of S_inf, g^{-1}(S_0) is a subset of S_0 and g^{-1}(S_inf) is a subset of S_inf (preimages taken within [0,inf]^d)
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: eqn-basin-def.zero, eqn-basin-def.infty
ROUTES: -
ROUTE_FOR: -
EDGE: eqn-basin-def.zero | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-basin-closed@L741-L741 | 'immediate from the definition (2.9)': g^{(n)}(g(lambda)) = g^{(n+1)}(lambda) shifts the sequence inside the lim
EDGE: eqn-basin-def.infty | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-basin-closed@L741-L741 | same shift inside the limsup
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: reviewer-C/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: The proof is the single sentence at L741; the longer proof at L744-L760 is inside a comment block and is not part of the paper. Reading choices (see report): g^{-1}(S) is read as {lambda in [0,inf]^d : g(lambda) in S}, and the forward inclusions silently use g([0,inf]^d) in [0,inf]^d, which the source states only in passing at L814 (lem-basin-open#g-iter-continuous); no edge is added for it because the source's proof cites only (2.9).

NODE: lem-attractive-zero#subinvariant-point
KIND: step
TITLE: Lemma 2.5 in log coordinates: lambda^0 = log q^0 in (0,inf)^d with g(lambda^0) < lambda^0
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-zero#subinvariant-point@L771-L771
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-zero#subinvariant-point@L771-L771
CONTRACT_ID: paper.lem-attractive-zero#subinvariant-point
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); g, g^{(n)} as in Definition 2.6 evaluated on [0,inf]^d
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; exists lambda^0 in (0,inf)^d
SOURCE_CONCLUSION: there exists lambda^0 = (lambda^0_1,...,lambda^0_d) in (0,inf)^d such that g(lambda^0) < lambda^0 (componentwise order of Definition 2.8)
CONSTANT_SCOPE: lambda^0 depends only on X
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-gf-bded, def-log-gf, def-componentwise
ROUTES: -
ROUTE_FOR: -
EDGE: lem-gf-bded | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-zero#subinvariant-point@L771-L771 | 'By Lemma 2.5, there exists lambda^0 ... such that g(lambda^0) < lambda^0': Lemma 2.5 supplies q^0 in (1,inf)^d with f_k(q^0) < q^0_k for all k
EDGE: def-log-gf | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-zero#subinvariant-point@L771-L771 | lambda^0 := log q^0 coordinatewise gives g_k(lambda^0) = log f_k(q^0) < log q^0_k = lambda^0_k since g = log o f o exp
EDGE: def-componentwise | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-zero#subinvariant-point@L771-L771 | g_k(lambda^0) < lambda^0_k for every k yields g(lambda^0) < lambda^0 in the sense of Definition 2.8 (<= with at least one strict coordinate)
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: reviewer-C/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Lemma 2.5 is stated in the variable q (f_k(q^0) < q^0_k); L771 passes silently to lambda^0 with g(lambda^0) < lambda^0. The carrier change q <-> lambda = log q is elementary and attributed to Lemma 2.5, so it is not marked SOURCE_GAP.

NODE: lem-attractive-zero#orbit-lambda0
KIND: application
TITLE: Lemma 2.13(a) with m = 1 applied to lambda^0: |g^{(n)}(lambda^0)| -> 0
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-zero#orbit-lambda0@L771-L771
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-zero#orbit-lambda0@L771-L771
CONTRACT_ID: paper.lem-attractive-zero#orbit-lambda0
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf])
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; lambda^0 the witness of lem-attractive-zero#subinvariant-point (lambda^0 in (0,inf)^d with g(lambda^0) < lambda^0)
SOURCE_CONCLUSION: lim_{n -> inf} |g^{(n)}(lambda^0)| = 0
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-monotone-lim, lem-attractive-zero#subinvariant-point
ROUTES: -
ROUTE_FOR: -
EDGE: lem-monotone-lim | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-zero#orbit-lambda0@L771-L771 | 'By Lemma 2.13, this implies lim ‖g^{(n)}(lambda^0)‖ = 0': first assertion with m = 1 and lambda = lambda^0 in [0,inf)^d
EDGE: lem-attractive-zero#subinvariant-point | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-zero#orbit-lambda0@L771-L771 | supplies the premise g^{(m)}(lambda) < lambda for m = 1
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Lemma 2.13 concludes lim g^{(n)}(lambda) = 0 as a vector limit; equivalence with the norm form lim |g^{(n)}(lambda)| = 0 is immediate for any norm.

NODE: lem-attractive-zero#comparison
KIND: step
TITLE: eps := min_j lambda^0_j; monotone comparison 0 <= g^{(n)}(lambda) <= g^{(n)}(lambda^0) on [0,eps]^d
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-zero#comparison@L772-L775
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-zero#comparison@L772-L775
CONTRACT_ID: paper.lem-attractive-zero#comparison
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf])
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; lambda^0 the witness of lem-attractive-zero#subinvariant-point (lambda^0 in (0,inf)^d) with lim_n |g^{(n)}(lambda^0)| = 0 by lem-attractive-zero#orbit-lambda0; eps := min_{j in {1,...,d}} lambda^0_j; lambda in [0,eps]^d
SOURCE_CONCLUSION: with eps := min_{j in {1,...,d}} lambda^0_j > 0, for every lambda in [0,eps]^d: lim_{n -> inf} |g^{(n)}(lambda)| = 0
CONSTANT_SCOPE: eps depends only on X (through lambda^0)
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-mono, lem-attractive-zero#orbit-lambda0, lem-attractive-zero#subinvariant-point
ROUTES: -
ROUTE_FOR: -
EDGE: lem-mono | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-zero#comparison@L772-L772 | 'By the monotonicity of g (Lemma 2.9)': lambda <= lambda^0 gives g^{(n)}(lambda) <= g^{(n)}(lambda^0) coordinatewise (first assertion)
EDGE: lem-attractive-zero#orbit-lambda0 | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-zero#comparison@L771-L772 | supplies lim of the norm of g^{(n)}(lambda^0) = 0, which is transferred to every lambda in [0,eps]^d
EDGE: lem-attractive-zero#subinvariant-point | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-zero#comparison@L772-L775 | 'eps := min_j lambda^0_j > 0': positivity of eps and lambda <= lambda^0 for lambda in [0,eps]^d use lambda^0 in (0,inf)^d, the conclusion of the node that chooses lambda^0
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: The transfer from the coordinatewise bound to the norm bound uses g^{(n)} >= 0 on [0,inf)^d (g(0) = 0 as f(1) = 1, plus monotonicity) and monotonicity of the norm on the orthant (sup norm; any other norm up to equivalence). Neither is spelled out; below the step threshold, not marked SOURCE_GAP.

NODE: lem-attractive-zero
KIND: lemma
TITLE: Lemma 2.15: 0 is an attractive fixed point of g
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-zero@L767-L769
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-zero@L770-L776
CONTRACT_ID: paper.lem-attractive-zero
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); g, g^{(n)} as in Definition 2.6 evaluated on [0,inf]^d; |.| is any norm on R^d (R1)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; exists ep > 0; for all lambda in [0,ep]^d
SOURCE_CONCLUSION: there exists ep > 0 such that for every lambda in [0,ep]^d, lim_{n -> inf} |g^{(n)}(lambda)| = 0
CONSTANT_SCOPE: ep depends only on X (it is quantified before lambda)
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-attractive-zero#comparison
ROUTES: -
ROUTE_FOR: -
EDGE: lem-attractive-zero#comparison | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-zero@L772-L775 | proof concludes 'the lemma statement holds with eps := min_j lambda^0_j > 0'
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: reviewer-C/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Consumed at L808 (lem-basin-open via (2.11)), L832 (lem-ray-intersect), L865 (lem-retract) and, as a reading of 'Since 0 is not in Lambda', at L904 (thm-fixed).

NODE: lem-attractive-infty#choose-N-m
KIND: step
TITLE: Choice of N and m := min p_{k,j}(N) > 0 (Lemma 2.4)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-infty#choose-N-m@L786-L791
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-infty#choose-N-m@L786-L791
CONTRACT_ID: paper.lem-attractive-infty#choose-N-m
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); p_{k,j}(N) for N in N as defined in Lemma 2.4 (p_{k,j}(N) := P_k[X_j(N) >= 1 and X_k(N) >= 1] for k != j and p_{k,k}(N) := P_k[X_k(N) >= 2])
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; exists N in N; m := min over k, j in {1,...,d} of p_{k,j}(N)
SOURCE_CONCLUSION: there exists N in N with p_{k,j}(N) > 0 for all k, j in {1,...,d} (Lemma 2.4), hence m := min{p_{k,j}(N) : k, j in {1,...,d}} > 0
CONSTANT_SCOPE: N and m depend only on X
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-gf-pos
ROUTES: -
ROUTE_FOR: -
EDGE: lem-gf-pos | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-infty#choose-N-m@L786-L787 | 'Let N and p_{k,j}(N) be as in Lemma 2.4. By Lemma 2.4, each p_{k,j}(N) is positive'
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Witness choice; the minimum of finitely many positive numbers is positive.

NODE: lem-attractive-infty#lower-bound
KIND: step
TITLE: Lower bound exp(g_k^{(N)}(lambda)) >= e^{lambda_k} m exp(max_j lambda_j) for lambda in [0,inf)^d (E3: max_j in place of min_j)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-infty#lower-bound@L792-L798
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-infty#lower-bound@L792-L798
CONTRACT_ID: paper.lem-attractive-infty#lower-bound
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); lambda in [0,inf)^d
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; N, m the witnesses of lem-attractive-infty#choose-N-m; lambda in [0,inf)^d; k in {1,...,d}
SOURCE_CONCLUSION: for every lambda in [0,inf)^d and k in {1,...,d}: exp(g_k^{(N)}(lambda)) = E_k[prod_j e^{lambda_j X_j(N)}] >= max_j (e^{lambda_j + lambda_k} p_{k,j}(N)) >= e^{lambda_k} m exp(max_j lambda_j)  (ruled reading E3; the source display has min_j)
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-attractive-infty#choose-N-m, eqn-convex-func-n
ROUTES: -
ROUTE_FOR: -
EDGE: lem-attractive-infty#choose-N-m | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-infty#lower-bound@L792-L793 | 'the definitions of p_{k,j}(N) and m imply': each event {X_j(N) >= 1, X_k(N) >= 1} (or X_k(N) >= 2 when j = k) has probability p_{k,j}(N) >= m
EDGE: eqn-convex-func-n | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-infty#lower-bound@L794-L795 | exp(g_k^{(N)}(lambda)) = E_k[prod_j e^{lambda_j X_j(N)}] is display (2.5)
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Ruling E3 applied: the source display (L796-L797) has min_j lambda_j in both places; the ruled reading is max_j, which is what the range lambda not in [0,C]^d (i.e. max_j lambda_j > C) of the lemma requires. The estimate is a nontrivial lower bound (event decomposition using lambda_j >= 0), hence a step.

NODE: lem-attractive-infty#strict-increase
KIND: step
TITLE: For lambda outside [0,C]^d: g^{(N)}(lambda) > lambda (C := log m^{-1})
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-infty#strict-increase@L799-L799
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-infty#strict-increase@L799-L799
CONTRACT_ID: paper.lem-attractive-infty#strict-increase
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); lambda in [0,inf)^d \ [0,C]^d (i.e. max_j lambda_j > C)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; N, m the witnesses of lem-attractive-infty#choose-N-m; C := log m^{-1}; lambda in [0,inf)^d \ [0,C]^d; k in {1,...,d}
SOURCE_CONCLUSION: for every lambda in [0,inf)^d \ [0,C]^d: g^{(N)}_k(lambda) > lambda_k for every k in {1,...,d}; in particular g^{(N)}(lambda) > lambda in the sense of Definition 2.8 (ruled reading E3)
CONSTANT_SCOPE: C depends only on X (through m)
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-attractive-infty#lower-bound, def-componentwise
ROUTES: -
ROUTE_FOR: -
EDGE: lem-attractive-infty#lower-bound | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-infty#strict-increase@L799-L799 | 'Therefore, if ... >= C := log m^{-1}, then g^{(N)}(lambda) > lambda': the lower bound exp(g_k^{(N)}(lambda)) >= e^{lambda_k} m exp(max_j lambda_j) > e^{lambda_k} when max_j lambda_j > C
EDGE: def-componentwise | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-infty#strict-increase@L799-L799 | strict inequality in every coordinate gives g^{(N)}(lambda) > lambda in the sense of Definition 2.8
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Ruling E3: the literal text (L799) reads 'if min_j lambda_j >= C ... then g^{(N)}(lambda) > lambda'; the ruled reading uses the lemma's range max_j lambda_j > C (strict). C := log m^{-1} >= 0 because m <= 1; the lemma asserts C > 0 and the source does not comment (any larger C also works); see report.

NODE: lem-attractive-infty#divergence
KIND: application
TITLE: Lemma 2.13(b) with m = N: g^{(N)}(lambda) > lambda forces |g^{(n)}(lambda)| -> inf
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-infty#divergence@L799-L799
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-infty#divergence@L799-L799
CONTRACT_ID: paper.lem-attractive-infty#divergence
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); g, g^{(n)} as in Definition 2.6 evaluated on [0,inf]^d
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; N, C the witnesses of lem-attractive-infty#strict-increase (g^{(N)}(lambda) > lambda for every lambda in [0,inf)^d \ [0,C]^d); lambda in [0,inf)^d \ [0,C]^d
SOURCE_CONCLUSION: for every lambda in [0,inf)^d \ [0,C]^d: lim_{n -> inf} |g^{(n)}(lambda)| = inf
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-monotone-lim, lem-attractive-infty#strict-increase
ROUTES: -
ROUTE_FOR: -
EDGE: lem-monotone-lim | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-infty#divergence@L799-L799 | 'By Lemma 2.13, this implies lim ‖g^{(n)}(lambda)‖ = inf': second assertion with m = N
EDGE: lem-attractive-infty#strict-increase | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-infty#divergence@L799-L799 | supplies the premise g^{(N)}(lambda) > lambda
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: -

NODE: lem-attractive-infty
KIND: lemma
TITLE: Lemma 2.16 (ruled reading E3): g^{(N)}(lambda) > lambda and |g^{(n)}(lambda)| -> inf outside a cube [0,C]^d
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-infty@L781-L784
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-infty@L785-L800
CONTRACT_ID: paper.lem-attractive-infty
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); g, g^{(n)} as in Definition 2.6 evaluated on [0,inf]^d; |.| is any norm on R^d (R1)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; exists N in N; exists C > 0; for all lambda in [0,inf)^d \ [0,C]^d
SOURCE_CONCLUSION: [Ruled reading E3] there exist N in N and C > 0 such that for every lambda in [0,inf)^d \ [0,C]^d: g^{(N)}(lambda) > lambda (componentwise order of Definition 2.8) and lim_{n -> inf} |g^{(n)}(lambda)| = inf
CONSTANT_SCOPE: N and C depend only on X (both precede lambda)
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-attractive-infty#strict-increase, lem-attractive-infty#divergence
ROUTES: -
ROUTE_FOR: -
EDGE: lem-attractive-infty#strict-increase | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-infty@L799-L799 | first conjunct g^{(N)}(lambda) > lambda (ruled reading)
EDGE: lem-attractive-infty#divergence | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-infty@L799-L799 | second conjunct lim ‖g^{(n)}(lambda)‖ = inf
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Ruling E3 (ERRATA E3, EXTRACTION_SPEC section 3): the literal statement (L783) 'g(lambda) > lambda' can fail; the proof proves g^{(N)}(lambda) > lambda, and its display needs max_j in place of min_j. SOURCE_CONCLUSION records the ruled reading, not the literal text; N is introduced by the ruling (the literal statement has no N). Consumed at L820 (lem-basin-open), L832 (lem-ray-intersect) and L865, L870 (lem-retract).

NODE: lem-basin-open#g-iter-continuous
KIND: step
TITLE: Hypothesis III: each g^{(n)} is a continuous self-map of [0,inf]^d
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-basin-open#g-iter-continuous@L814-L814
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-basin-open#g-iter-continuous@L814-L814
CONTRACT_ID: paper.lem-basin-open#g-iter-continuous
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); g, g^{(n)} as in Definition 2.6 evaluated on [0,inf]^d; [0,inf]^d with its usual (extended-real) topology
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; n in N
SOURCE_CONCLUSION: for every n in N, g^{(n)} maps [0,inf]^d into [0,inf]^d and is continuous from [0,inf]^d to itself
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: def-log-gf
ROUTES: -
ROUTE_FOR: -
EDGE: def-log-gf | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-basin-open#g-iter-continuous@L814-L814 | g = log o f o exp coordinatewise (Definition 2.6): continuity of each f_k from (0,inf]^d to (0,inf] (Hypothesis III) transfers to g and its iterates by composition
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: reviewer-C/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Source justification is the single clause 'By Hypothesis III' (L814). The elementary facts that exp: [0,inf] -> [1,inf] and log: [1,inf] -> [0,inf] are continuous and that f_k >= 1 on [1,inf]^d (so g maps [0,inf]^d into itself) are not spelled out; not marked SOURCE_GAP because the source names the hypothesis that delivers the claim. Reused: L820 (S_inf part), L902 (thm-fixed, n = 1) and L896 (self-map).

NODE: eqn-use-attractive-zero
KIND: display
TITLE: (2.11): [0,eps]^d is a subset of S_0
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-use-attractive-zero@L808-L811
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-use-attractive-zero@L808-L811
CONTRACT_ID: paper.eqn-use-attractive-zero
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); S_0, S_inf as in (2.9)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; eps the witness of lem-attractive-zero (Lemma 2.15)
SOURCE_CONCLUSION: [0,eps]^d is a subset of S_0, where eps > 0 is as in Lemma 2.15
CONSTANT_SCOPE: eps depends only on X
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-attractive-zero, eqn-basin-def.zero
ROUTES: -
ROUTE_FOR: -
EDGE: lem-attractive-zero | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-use-attractive-zero@L808-L810 | 'Let eps be as in Lemma 2.15, so that [0,eps]^d is a subset of S_0'
EDGE: eqn-basin-def.zero | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-use-attractive-zero@L808-L810 | lim ‖g^{(n)}(lambda)‖ = 0 on [0,eps]^d is membership in S_0 by (2.9)
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Labeled display used once, at L816.

NODE: lem-basin-open#S0-open
KIND: step
TITLE: S_0 is relatively open in [0,inf]^d
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-basin-open#S0-open@L812-L817
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-basin-open#S0-open@L812-L817
CONTRACT_ID: paper.lem-basin-open#S0-open
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); S_0, S_inf as in (2.9)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; eps the witness of lem-attractive-zero; lambda in S_0; n in N (chosen with g^{(n)}(lambda) in [0,eps)^d)
SOURCE_CONCLUSION: S_0 is a relatively open subset of [0,inf]^d
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: eqn-use-attractive-zero, lem-basin-open#g-iter-continuous, lem-basin-closed, eqn-basin-def.zero
ROUTES: -
ROUTE_FOR: -
EDGE: eqn-use-attractive-zero | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-basin-open#S0-open@L816-L816 | 'By (2.11) and Lemma 2.14, (g^{(n)})^{-1}([0,eps)^d) is a subset of S_0': [0,eps)^d is a subset of [0,eps]^d, which lies in S_0
EDGE: lem-basin-open#g-iter-continuous | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-basin-open#S0-open@L814-L815 | 'By Hypothesis III, g^{(n)} is continuous': the preimage of the relatively open set [0,eps)^d is open
EDGE: lem-basin-closed | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-basin-open#S0-open@L816-L816 | iterating g^{-1}(S_0) subset S_0 n times shows (g^{(n)})^{-1}(S_0) is a subset of S_0
EDGE: eqn-basin-def.zero | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-basin-open#S0-open@L813-L813 | 'By the definition of S_0, there exists n with g^{(n)}(lambda) in [0,eps)^d': lim of the norm is 0
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: The neighbourhood is of lambda in the topology of [0,inf]^d; the openness of [0,eps)^d in [0,inf]^d is a one-line topological remark at L815. Passing from norm convergence to g^{(n)}(lambda) in [0,eps)^d uses equivalence of norms (any norm, R1).

NODE: lem-basin-open#outside-cube-in-Sinf
KIND: step
TITLE: [0,inf]^d \ [0,C]^d is a subset of S_inf (Lemma 2.16 and (2.10))
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-basin-open#outside-cube-in-Sinf@L820-L820
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-basin-open#outside-cube-in-Sinf@L820-L820
CONTRACT_ID: paper.lem-basin-open#outside-cube-in-Sinf
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); S_0, S_inf as in (2.9)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; C the witness of lem-attractive-infty (Lemma 2.16)
SOURCE_CONCLUSION: [0,inf]^d \ [0,C]^d is a subset of S_inf, where C > 0 is as in Lemma 2.16
CONSTANT_SCOPE: C depends only on X
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-attractive-infty, eqn-infty-subset, eqn-basin-def.infty
ROUTES: -
ROUTE_FOR: -
EDGE: lem-attractive-infty | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-basin-open#outside-cube-in-Sinf@L820-L820 | 'By that lemma and (2.10)': on [0,inf)^d \ [0,C]^d, lim ‖g^{(n)}(lambda)‖ = inf, hence limsup = inf (only the divergence conjunct is used)
EDGE: eqn-infty-subset | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-basin-open#outside-cube-in-Sinf@L820-L820 | covers the points of [0,inf]^d with an infinite coordinate
EDGE: eqn-basin-def.infty | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-basin-open#outside-cube-in-Sinf@L820-L820 | membership in S_inf is limsup of the norm = inf by (2.9)
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Unlabeled display-level claim at L820; the source uses it only as the input of the S_inf openness argument.

NODE: lem-basin-open#Sinf-open
KIND: step
TITLE: S_inf is relatively open in [0,inf]^d (same argument as for S_0)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-basin-open#Sinf-open@L820-L820
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-basin-open#Sinf-open@L820-L820
CONTRACT_ID: paper.lem-basin-open#Sinf-open
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); S_0, S_inf as in (2.9)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; C the witness of lem-attractive-infty; lambda in S_inf; n in N (chosen with g^{(n)}(lambda) in [0,inf]^d \ [0,C]^d)
SOURCE_CONCLUSION: S_inf is a relatively open subset of [0,inf]^d
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-basin-open#outside-cube-in-Sinf, lem-basin-open#g-iter-continuous, lem-basin-closed, eqn-basin-def.infty
ROUTES: -
ROUTE_FOR: -
EDGE: lem-basin-open#outside-cube-in-Sinf | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-basin-open#Sinf-open@L820-L820 | '[0,inf]^d \ [0,C]^d is a subset of S_inf' replaces (2.11) in the S_0 argument
EDGE: lem-basin-open#g-iter-continuous | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-basin-open#Sinf-open@L820-L820 | 'g^{(n)}: [0,inf]^d -> [0,inf]^d is continuous', so the preimage of the relatively open set [0,inf]^d \ [0,C]^d is open
EDGE: lem-basin-closed | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-basin-open#Sinf-open@L820-L820 | 'exactly the same argument': (g^{(n)})^{-1}(S_inf) is a subset of S_inf by iterating g^{-1}(S_inf) subset S_inf
EDGE: eqn-basin-def.infty | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-basin-open#Sinf-open@L820-L820 | 'exactly the same argument': limsup = inf provides n with g^{(n)}(lambda) outside [0,C]^d
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: 'Exactly the same argument' hides one change: limsup (not lim) = inf only gives some n (not all large n) with g^{(n)}(lambda) outside [0,C]^d, which is all the argument needs; not spelled out by the source.

NODE: lem-basin-open
KIND: lemma
TITLE: Lemma 2.17: S_0 and S_inf are relatively open subsets of [0,inf]^d
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-basin-open@L804-L806
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-basin-open@L807-L821
CONTRACT_ID: paper.lem-basin-open
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); S_0, S_inf as in (2.9); |.| is any norm on R^d (R1)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X
SOURCE_CONCLUSION: S_0 and S_inf are relatively open subsets of [0,inf]^d
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-basin-open#S0-open, lem-basin-open#Sinf-open
ROUTES: -
ROUTE_FOR: -
EDGE: lem-basin-open#S0-open | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-basin-open@L808-L817 | first half of the proof
EDGE: lem-basin-open#Sinf-open | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-basin-open@L820-L820 | second half of the proof ('To prove the statement for S_inf')
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: reviewer-C/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Consumed at L832 (lem-ray-intersect), L870 (lem-retract, Lambda closed).

NODE: lem-ray-intersect#ray-meets-both
KIND: step
TITLE: The ray L = {ru : r > 0} meets both S_0 and S_inf
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-ray-intersect#ray-meets-both@L832-L832
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-ray-intersect#ray-meets-both@L832-L832
CONTRACT_ID: paper.lem-ray-intersect#ray-meets-both
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); S_0, S_inf as in (2.9); u in [0,inf)^d with |u| = 1; L := {ru : r > 0}
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; u in [0,inf)^d with |u| = 1; L
SOURCE_CONCLUSION: L contains a point of S_0 and a point of S_inf
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-attractive-zero, lem-attractive-infty, eqn-basin-def.zero, eqn-basin-def.infty
ROUTES: -
ROUTE_FOR: -
EDGE: lem-attractive-zero | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-ray-intersect#ray-meets-both@L832-L832 | 'By Lemmas 2.15 and 2.16, L intersects both S_0 and S_inf': ru in [0,eps]^d for small r gives a point of S_0
EDGE: lem-attractive-infty | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-ray-intersect#ray-meets-both@L832-L832 | ru outside [0,C]^d for large r gives lim ‖g^{(n)}(ru)‖ = inf, a point of S_inf
EDGE: eqn-basin-def.zero | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-ray-intersect#ray-meets-both@L832-L832 | membership in S_0 by (2.9)
EDGE: eqn-basin-def.infty | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-ray-intersect#ray-meets-both@L832-L832 | membership in S_inf by (2.9)
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: reviewer-C/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: The choice of small and large radii (using |u| = 1 and equivalence of norms) is implicit in the source sentence.

NODE: lem-ray-intersect#existence
KIND: application
TITLE: Connectedness of the ray: L contains a point of [0,inf)^d \ (S_0 u S_inf)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-ray-intersect#existence@L832-L833
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-ray-intersect#existence@L832-L833
CONTRACT_ID: paper.lem-ray-intersect#existence
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); S_0, S_inf as in (2.9); u in [0,inf)^d with |u| = 1; L := {ru : r > 0}
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; u in [0,inf)^d with |u| = 1
SOURCE_CONCLUSION: L contains at least one element of [0,inf)^d \ (S_0 u S_inf)
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: ext:connectedness, lem-basin-open, lem-ray-intersect#ray-meets-both, eqn-basin-def.zero, eqn-basin-def.infty
ROUTES: -
ROUTE_FOR: -
EDGE: ext:connectedness | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-ray-intersect#existence@L833-L833 | 'Since L is connected, L must contain at least one element of [0,inf)^d \ (S_0 u S_inf)': L is not the union of two disjoint nonempty relatively open subsets
EDGE: lem-basin-open | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-ray-intersect#existence@L832-L832 | 'By Lemma 2.17, the intersections with [0,inf)^d are open': S_0 and S_inf restricted to L are relatively open
EDGE: lem-ray-intersect#ray-meets-both | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-ray-intersect#existence@L832-L832 | both relatively open pieces S_0 cap L and S_inf cap L are nonempty
EDGE: eqn-basin-def.zero | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-ray-intersect#existence@L832-L832 | 'By (2.9), S_0 and S_inf are disjoint': lim of the norm = 0 excludes limsup = inf
EDGE: eqn-basin-def.infty | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-ray-intersect#existence@L832-L832 | same disjointness statement
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: reviewer-C/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Application of a standard connectedness theorem whose premises (two disjoint nonempty relatively open subsets covering L if no point of Lambda existed) are discharged by the listed edges.

NODE: lem-ray-intersect#uniqueness
KIND: application
TITLE: At most one point of L outside S_0 u S_inf (application of Lemma 2.11)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-ray-intersect#uniqueness@L835-L835
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-ray-intersect#uniqueness@L835-L835
CONTRACT_ID: paper.lem-ray-intersect#uniqueness
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); S_0, S_inf as in (2.9); u in [0,inf)^d with |u| = 1
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; u; R > r > 0
SOURCE_CONCLUSION: there do not exist R > r > 0 with both ru and Ru in [0,inf)^d \ (S_0 u S_inf); equivalently L contains at most one element of [0,inf)^d \ (S_0 u S_inf)
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-unstable-scaled, eqn-basin-def.zero, eqn-basin-def.infty
ROUTES: -
ROUTE_FOR: -
EDGE: lem-unstable-scaled | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-ray-intersect#uniqueness@L835-L835 | 'This contradicts Lemma 2.11': applied to lambda = Ru (nonzero, bounded orbit) with scaling factor r/R in (0,1) it gives lim of the norm of g^{(n)}(ru) = 0, contradicting limsup > 0
EDGE: eqn-basin-def.zero | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-ray-intersect#uniqueness@L835-L835 | ru not in S_0 means limsup of the norm of g^{(n)}(ru) > 0 (by (2.9))
EDGE: eqn-basin-def.infty | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-ray-intersect#uniqueness@L835-L835 | Ru not in S_inf means limsup of the norm of g^{(n)}(Ru) < inf (by (2.9))
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Contradiction argument by 'Suppose by way of contradiction ...'; the scaling factor r/R is implicit.

NODE: lem-ray-intersect
KIND: lemma
TITLE: Lemma 2.18: each ray from 0 meets [0,inf)^d \ (S_0 u S_inf) exactly once
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-ray-intersect@L828-L830
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-ray-intersect@L831-L836
CONTRACT_ID: paper.lem-ray-intersect
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); S_0, S_inf as in (2.9); |.| is any norm on R^d (R1); u in [0,inf)^d with |u| = 1
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; u in [0,inf)^d with |u| = 1; exists exactly one r in (0,inf)
SOURCE_CONCLUSION: there exists exactly one r in (0,inf) such that ru in [0,inf)^d \ (S_0 u S_inf)
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-ray-intersect#existence, lem-ray-intersect#uniqueness
ROUTES: -
ROUTE_FOR: -
EDGE: lem-ray-intersect#existence | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-ray-intersect@L832-L833 | first paragraph: at least one such r
EDGE: lem-ray-intersect#uniqueness | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-ray-intersect@L835-L835 | second paragraph: at most one such r
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: reviewer-C/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Consumed at L868 (lem-retract: pi restricted to Lambda is a bijection).

NODE: lem-retract#choose-r-R
KIND: step
TITLE: Choice of R > r > 0 with Lambda contained in A(r,R)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract#choose-r-R@L865-L865
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract#choose-r-R@L865-L865
CONTRACT_ID: paper.lem-retract#choose-r-R
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); S_0, S_inf as in (2.9); Lambda := [0,inf)^d \ (S_0 u S_inf); A(r,R) as in (2.12)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; eps, C the witnesses of lem-attractive-zero and lem-attractive-infty; exists R > r > 0
SOURCE_CONCLUSION: there exist R > r > 0 such that Lambda is a subset of A(r,R) = {lambda in [0,inf)^d : r <= |lambda| <= R}
CONSTANT_SCOPE: r and R depend only on X
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-attractive-zero, lem-attractive-infty, eqn-basin-def.zero, eqn-basin-def.infty
ROUTES: -
ROUTE_FOR: -
EDGE: lem-attractive-zero | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract#choose-r-R@L865-L865 | 'By Lemmas 2.15 and 2.16': [0,eps]^d lies in S_0, so Lambda avoids a neighbourhood of 0 and ‖lambda‖ >= r > 0 on Lambda
EDGE: lem-attractive-infty | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract#choose-r-R@L865-L865 | points of [0,inf)^d outside [0,C]^d lie in S_inf, so Lambda is a subset of [0,C]^d and ‖lambda‖ <= R on Lambda
EDGE: eqn-basin-def.zero | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract#choose-r-R@L865-L865 | membership in S_0 by (2.9)
EDGE: eqn-basin-def.infty | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract#choose-r-R@L865-L865 | membership in S_inf by (2.9)
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Witness choice; r and R are fixed for the rest of the proof ('Henceforth fix such a choice'). Display (2.12) is part of the statement of lem-retract.

NODE: lem-retract#radial-bijection
KIND: step
TITLE: pi restricted to Lambda is a bijection onto B = {lambda in [0,inf)^d : |lambda| = 1}
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract#radial-bijection@L867-L868
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract#radial-bijection@L867-L868
CONTRACT_ID: paper.lem-retract#radial-bijection
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); S_0, S_inf as in (2.9); Lambda := [0,inf)^d \ (S_0 u S_inf); B := {lambda in [0,inf)^d : |lambda| = 1}; pi(lambda) := lambda/|lambda| on [0,inf)^d \ {0}
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; pi; B
SOURCE_CONCLUSION: pi restricted to Lambda is a bijection from Lambda onto B (so Lambda is a subset of [0,inf)^d \ {0})
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-ray-intersect
ROUTES: -
ROUTE_FOR: -
EDGE: lem-ray-intersect | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract#radial-bijection@L868-L868 | 'By Lemma 2.18, pi restricted to Lambda is a bijection': for each u in B there is exactly one r > 0 with ru in Lambda
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: reviewer-C/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: pi is defined only on [0,inf)^d \ {0}; that Lambda lies in this domain (0 is not in Lambda) is used implicitly here and stated, without reason, at L904 (see thm-fixed#zero-notin-Lambda; it also follows from Lambda being a subset of A(r,R) with r > 0).

NODE: lem-retract#Lambda-compact
KIND: step
TITLE: Lambda is compact (relatively closed in [0,inf]^d and bounded)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract#Lambda-compact@L870-L870
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract#Lambda-compact@L870-L870
CONTRACT_ID: paper.lem-retract#Lambda-compact
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); S_0, S_inf as in (2.9); Lambda := [0,inf)^d \ (S_0 u S_inf)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X
SOURCE_CONCLUSION: Lambda is a relatively closed subset of [0,inf]^d, is bounded, and is therefore compact
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-basin-open, lem-attractive-infty, eqn-infty-subset
ROUTES: -
ROUTE_FOR: -
EDGE: lem-basin-open | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract#Lambda-compact@L870-L870 | 'By Lemma 2.17, Lambda is a relatively closed subset of [0,inf]^d': S_0 u S_inf is relatively open
EDGE: lem-attractive-infty | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract#Lambda-compact@L870-L870 | 'By Lemma 2.16, Lambda is also bounded'
EDGE: eqn-infty-subset | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract#Lambda-compact@L870-L870 | needed (not cited) to identify Lambda with the complement of the open set S_0 u S_inf in [0,inf]^d, since Lambda lies in [0,inf)^d
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: reviewer-C/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: the source says 'By Lemma 2.17, Lambda is a relatively closed subset of [0,inf]^d', but Lambda is defined as a subset of [0,inf)^d; closedness in [0,inf]^d needs Lambda = [0,inf]^d \ (S_0 u S_inf), i.e. (2.10), which is not cited here. Also, boundedness (Lemma 2.16) is invoked by the source although a closed subset of the compact space [0,inf]^d is already compact; the edge to lem-attractive-infty records the source's own invocation.

NODE: lem-retract#phi-homeomorphism
KIND: application
TITLE: pi restricted to Lambda is a homeomorphism; continuous inverse phi : B -> Lambda
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract#phi-homeomorphism@L869-L875
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract#phi-homeomorphism@L869-L875
CONTRACT_ID: paper.lem-retract#phi-homeomorphism
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); S_0, S_inf as in (2.9); Lambda := [0,inf)^d \ (S_0 u S_inf); B := {lambda in [0,inf)^d : |lambda| = 1}; pi(lambda) := lambda/|lambda| on [0,inf)^d \ {0}
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; pi restricted to Lambda is the bijection onto B of lem-retract#radial-bijection, with Lambda compact by lem-retract#Lambda-compact; phi
SOURCE_CONCLUSION: pi restricted to Lambda is a homeomorphism from Lambda onto B; its inverse phi : B -> Lambda is continuous and satisfies phi(u)/|phi(u)| = u for all u in B
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: ext:compact-hausdorff, lem-retract#radial-bijection, lem-retract#Lambda-compact
ROUTES: -
ROUTE_FOR: -
EDGE: ext:compact-hausdorff | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract#phi-homeomorphism@L871-L872 | 'Therefore, pi restricted to Lambda is a homeomorphism': a continuous bijection from a compact space onto a Hausdorff space (B in R^d) is a homeomorphism
EDGE: lem-retract#radial-bijection | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract#phi-homeomorphism@L871-L871 | supplies the bijection pi restricted to Lambda
EDGE: lem-retract#Lambda-compact | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract#phi-homeomorphism@L870-L871 | supplies compactness of the domain Lambda
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: 'Obviously, pi is continuous' (L869) is below the step threshold and is folded in here.

NODE: eqn-retract-def
KIND: display
TITLE: (2.13): H_t(lambda) = (1-t) lambda + t phi(lambda/|lambda|) on A x [0,1]
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-retract-def@L877-L880
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-retract-def@L877-L880
CONTRACT_ID: paper.eqn-retract-def
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); Lambda := [0,inf)^d \ (S_0 u S_inf); B := {lambda in [0,inf)^d : |lambda| = 1}; pi(lambda) := lambda/|lambda|
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; r, R the witnesses of lem-retract#choose-r-R (A = A(r,R) as in (2.12)); phi the continuous inverse of pi restricted to Lambda from lem-retract#phi-homeomorphism; lambda in A; t in [0,1]
SOURCE_CONCLUSION: for lambda in A and t in [0,1], H_t(lambda) := (1-t) lambda + t phi(lambda/|lambda|)
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-retract#phi-homeomorphism, lem-retract#choose-r-R
ROUTES: -
ROUTE_FOR: -
EDGE: lem-retract#phi-homeomorphism | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-retract-def@L879-L879 | H is defined through the continuous inverse phi : B -> Lambda of pi restricted to Lambda
EDGE: lem-retract#choose-r-R | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-retract-def@L877-L877 | domain A = A(r,R): ‖lambda‖ >= r > 0 makes lambda/‖lambda‖ defined and in B
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Construction of the deformation; labeled display.

NODE: lem-retract#H-continuous
KIND: step
TITLE: H is jointly continuous on A x [0,1]
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract#H-continuous@L882-L882
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract#H-continuous@L882-L882
CONTRACT_ID: paper.lem-retract#H-continuous
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); Lambda := [0,inf)^d \ (S_0 u S_inf); A = A(r,R); H as in (2.13)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; phi continuous by lem-retract#phi-homeomorphism; (lambda, t) in A x [0,1]
SOURCE_CONCLUSION: (lambda, t) -> H_t(lambda) is jointly continuous on A x [0,1]
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: eqn-retract-def, lem-retract#phi-homeomorphism
ROUTES: -
ROUTE_FOR: -
EDGE: eqn-retract-def | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract#H-continuous@L882-L882 | formula (2.13) is a composition of continuous operations in (lambda, t)
EDGE: lem-retract#phi-homeomorphism | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract#H-continuous@L882-L882 | 'Since phi is continuous, H is jointly continuous in t and lambda'
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: -

NODE: lem-retract#H-fixes-Lambda
KIND: step
TITLE: H_t(lambda) = lambda for lambda in Lambda and t in [0,1]
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract#H-fixes-Lambda@L883-L884
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract#H-fixes-Lambda@L883-L884
CONTRACT_ID: paper.lem-retract#H-fixes-Lambda
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); Lambda := [0,inf)^d \ (S_0 u S_inf); H as in (2.13)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; lambda in Lambda; t in [0,1]
SOURCE_CONCLUSION: for every lambda in Lambda and t in [0,1]: phi(lambda/|lambda|) = lambda, hence H_t(lambda) = lambda
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: eqn-retract-def, lem-retract#phi-homeomorphism
ROUTES: -
ROUTE_FOR: -
EDGE: eqn-retract-def | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract#H-fixes-Lambda@L884-L884 | substituting phi(lambda/‖lambda‖) = lambda into (2.13) gives H_t(lambda) = lambda
EDGE: lem-retract#phi-homeomorphism | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract#H-fixes-Lambda@L883-L883 | 'By construction, phi(lambda/‖lambda‖) = lambda for lambda in Lambda': phi is the inverse of pi restricted to Lambda
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: reviewer-C/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: -

NODE: lem-retract#H-preserves-A
KIND: step
TITLE: Each H_t maps A into A (norm of H_t(lambda) lies in [r,R])
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract#H-preserves-A@L885-L889
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract#H-preserves-A@L885-L889
CONTRACT_ID: paper.lem-retract#H-preserves-A
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); Lambda := [0,inf)^d \ (S_0 u S_inf); A = A(r,R); H as in (2.13)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; r, R the witnesses of lem-retract#choose-r-R (Lambda subset A(r,R)); lambda in A; t in [0,1]
SOURCE_CONCLUSION: for every lambda in A and t in [0,1]: lambda and phi(lambda/|lambda|) lie on the same ray from 0, |H_t(lambda)| = (1-t)|lambda| + t|phi(lambda/|lambda|)| in [r,R], so H_t(lambda) in A
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: eqn-retract-def, lem-retract#phi-homeomorphism, lem-retract#choose-r-R
ROUTES: -
ROUTE_FOR: -
EDGE: eqn-retract-def | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract#H-preserves-A@L885-L887 | formula (2.13) for H_t(lambda)
EDGE: lem-retract#phi-homeomorphism | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract#H-preserves-A@L885-L885 | phi(u)/‖phi(u)‖ = u: lambda and phi(lambda/‖lambda‖) are positive multiples of the same unit vector, so their norms combine linearly
EDGE: lem-retract#choose-r-R | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract#H-preserves-A@L885-L887 | 'Since Lambda is a subset of A': ‖phi(lambda/‖lambda‖)‖ lies in [r,R], as does ‖lambda‖, so the convex combination does too
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Also uses that H_t(lambda) lies in [0,inf)^d (convex combination of points of [0,inf)^d); implicit.

NODE: lem-retract
KIND: lemma
TITLE: Lemma 2.19: an annulus A(r,R) deformation retracts onto Lambda
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract@L851-L857
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract@L858-L891
CONTRACT_ID: paper.lem-retract
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); S_0, S_inf as in (2.9); |.| is any norm on R^d (R1); Lambda := [0,inf)^d \ (S_0 u S_inf)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; exists R > r > 0 (A = A(r,R) as in (2.12))
SOURCE_CONCLUSION: there exist R > r > 0 such that A = A(r,R) := {lambda in [0,inf)^d : r <= |lambda| <= R} deformation retracts onto Lambda := [0,inf)^d \ (S_0 u S_inf) (in particular Lambda is a subset of A)
CONSTANT_SCOPE: r and R depend only on X
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-retract#choose-r-R, eqn-retract-def, lem-retract#phi-homeomorphism, lem-retract#H-continuous, lem-retract#H-fixes-Lambda, lem-retract#H-preserves-A
ROUTES: -
ROUTE_FOR: -
EDGE: lem-retract#choose-r-R | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract@L865-L865 | the lemma's R > r > 0 with Lambda subset A
EDGE: eqn-retract-def | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract@L881-L881 | 'We claim that H is a deformation retraction from A to Lambda': H is the explicit homotopy (2.13)
EDGE: lem-retract#phi-homeomorphism | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract@L890-L890 | endpoints: H_0 is the identity on A and H_1(lambda) = phi(lambda/‖lambda‖) lies in Lambda
EDGE: lem-retract#H-continuous | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract@L882-L882 | continuity of H
EDGE: lem-retract#H-fixes-Lambda | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract@L883-L884 | H_t restricted to Lambda is the identity for all t
EDGE: lem-retract#H-preserves-A | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract@L885-L889 | each H_t maps A to itself
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: reviewer-C/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: 'Deformation retracts' is not defined in the statement; the proof (L881-L890) verifies the strong form: H : A x [0,1] -> A continuous, H_0 = identity on A, H_1(A) a subset of Lambda, H_t = identity on Lambda for every t. Theorem 2.7's proof uses H_1 as a retraction A -> Lambda (L901). Display (2.12) (L853-L855) is part of the statement and is not a separate node.

NODE: thm-fixed#g-image-finite
KIND: step
TITLE: g(Lambda) has finite coordinates: g maps Lambda into [0,inf)^d
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#g-image-finite@L896-L896
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#g-image-finite@L896-L896
CONTRACT_ID: paper.thm-fixed#g-image-finite
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); S_0, S_inf as in (2.9); Lambda := [0,inf)^d \ (S_0 u S_inf)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; lambda in Lambda
SOURCE_CONCLUSION: for every lambda in Lambda, g(lambda) lies in [0,inf)^d (every coordinate of g(lambda) is finite)
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: eqn-infty-subset, lem-basin-closed, lem-basin-open#g-iter-continuous
ROUTES: -
ROUTE_FOR: -
EDGE: eqn-infty-subset | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#g-image-finite@L896-L896 | if g(lambda) were in [0,inf]^d \ [0,inf)^d it would lie in S_inf by (2.10)
EDGE: lem-basin-closed | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#g-image-finite@L896-L896 | g(lambda) in S_inf would force lambda in S_inf (g^{-1}(S_inf) subset S_inf), contradicting lambda in Lambda
EDGE: lem-basin-open#g-iter-continuous | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#g-image-finite@L896-L896 | g maps [0,inf]^d into [0,inf]^d (n = 1), so g(lambda) is a point of [0,inf]^d
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: reviewer-C/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: the proof shows g(lambda) is not in S_0 u S_inf and then writes 'Hence, if lambda in Lambda, we must have g(lambda) in Lambda' (L896), but Lambda is a subset of [0,inf)^d and the source never says why the coordinates of g(lambda) are finite (the passage from 'not in S_0 u S_inf' to 'in [0,inf)^d' needs (2.10), not cited here).

NODE: thm-fixed#Lambda-invariant
KIND: step
TITLE: g(Lambda) is a subset of Lambda
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#Lambda-invariant@L896-L896
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#Lambda-invariant@L896-L896
CONTRACT_ID: paper.thm-fixed#Lambda-invariant
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); S_0, S_inf as in (2.9); Lambda := [0,inf)^d \ (S_0 u S_inf)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; lambda in Lambda
SOURCE_CONCLUSION: g(Lambda) is a subset of Lambda
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-basin-closed, thm-fixed#g-image-finite
ROUTES: -
ROUTE_FOR: -
EDGE: lem-basin-closed | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#Lambda-invariant@L896-L896 | 'if lambda in [0,inf)^d and g(lambda) in S_0, then Lemma 2.14 implies lambda in S_0; similarly for S_inf': g^{-1}(S_0) subset S_0 and g^{-1}(S_inf) subset S_inf
EDGE: thm-fixed#g-image-finite | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#Lambda-invariant@L896-L896 | 'Hence, if lambda in Lambda, we must have g(lambda) in Lambda' requires g(lambda) in [0,inf)^d
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: reviewer-C/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Source statement 'We first argue that g(Lambda) subset Lambda' (L896); the finiteness bridge is split out as thm-fixed#g-image-finite.

NODE: thm-fixed#apply-retract
KIND: application
TITLE: Application of Lemma 2.19: A = A(r,R) with Lambda subset A and a continuous retraction H_1 : A -> Lambda
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#apply-retract@L898-L898
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#apply-retract@L898-L898
CONTRACT_ID: paper.thm-fixed#apply-retract
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); S_0, S_inf as in (2.9); Lambda := [0,inf)^d \ (S_0 u S_inf)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; r, R the witnesses of lem-retract (Lemma 2.19); H_1
SOURCE_CONCLUSION: for r, R as in Lemma 2.19 and A = A(r,R): Lambda is a subset of A, and H_1 : A -> Lambda is a continuous retraction (H_1(A) subset Lambda, H_1 restricted to Lambda is the identity)
CONSTANT_SCOPE: r and R depend only on X
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-retract
ROUTES: -
ROUTE_FOR: -
EDGE: lem-retract | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#apply-retract@L898-L901 | 'Let A be as in Lemma 2.19, so that Lambda subset A' and 'Let H_1 : A -> Lambda be a retraction, as given by Lemma 2.19'
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: The retraction is the time-one map of the deformation retraction of Lemma 2.19 (H_t = identity on Lambda gives the retraction property); not spelled out.

NODE: thm-fixed#A-homeomorphic-to-ball
KIND: step
TITLE: A is homeomorphic to a closed d-dimensional Euclidean ball
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#A-homeomorphic-to-ball@L898-L898
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#A-homeomorphic-to-ball@L898-L898
CONTRACT_ID: paper.thm-fixed#A-homeomorphic-to-ball
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); |.| is any norm on R^d (R1)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; r, R the witnesses of lem-retract (A = A(r,R) as in Lemma 2.19)
SOURCE_CONCLUSION: A = {lambda in [0,inf)^d : r <= |lambda| <= R} is homeomorphic to a closed d-dimensional Euclidean ball
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-retract
ROUTES: -
ROUTE_FOR: -
EDGE: lem-retract | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#A-homeomorphic-to-ball@L898-L898 | A is the set A(r,R) of Lemma 2.19 ('Let A be as in Lemma 2.19')
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: asserted ('The set A is homeomorphic to a closed d-dimensional Euclidean ball', L898) with no argument, for A the part of the norm-annulus {r <= |lambda| <= R} lying in the orthant [0,inf)^d (an arbitrary norm; any norm per R1). Substantive topological input to the Brouwer application.

NODE: thm-fixed#brouwer-on-A
KIND: application
TITLE: Brouwer fixed point theorem on A: every continuous self-map of A has a fixed point
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#brouwer-on-A@L899-L899
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#brouwer-on-A@L899-L899
CONTRACT_ID: paper.thm-fixed#brouwer-on-A
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf])
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; A = A(r,R), homeomorphic to a closed d-dimensional Euclidean ball by thm-fixed#A-homeomorphic-to-ball; F : A -> A continuous
SOURCE_CONCLUSION: every continuous function from A to itself has a fixed point
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: ext:brouwer, thm-fixed#A-homeomorphic-to-ball
ROUTES: -
ROUTE_FOR: -
EDGE: ext:brouwer | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#brouwer-on-A@L899-L899 | 'By the Brouwer fixed point theorem, every continuous function from A to itself has a fixed point'
EDGE: thm-fixed#A-homeomorphic-to-ball | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#brouwer-on-A@L898-L899 | the premise of Brouwer's theorem: A is homeomorphic to a closed ball (the fixed-point property is invariant under homeomorphism)
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: -

NODE: thm-fixed#gH1-self-map
KIND: step
TITLE: g o H_1 is a continuous function from A to itself (indeed into Lambda)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#gH1-self-map@L902-L902
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#gH1-self-map@L902-L902
CONTRACT_ID: paper.thm-fixed#gH1-self-map
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); Lambda := [0,inf)^d \ (S_0 u S_inf)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; A, H_1 as given by thm-fixed#apply-retract; g(Lambda) subset Lambda by thm-fixed#Lambda-invariant
SOURCE_CONCLUSION: g o H_1 : A -> Lambda is a continuous function from A to itself (Lambda subset A)
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: thm-fixed#Lambda-invariant, thm-fixed#apply-retract, lem-basin-open#g-iter-continuous
ROUTES: -
ROUTE_FOR: -
EDGE: thm-fixed#Lambda-invariant | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#gH1-self-map@L902-L902 | 'Since g(Lambda) subset Lambda, g o H_1 : A -> Lambda'
EDGE: thm-fixed#apply-retract | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#gH1-self-map@L901-L902 | H_1 : A -> Lambda is a continuous retraction and Lambda subset A
EDGE: lem-basin-open#g-iter-continuous | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#gH1-self-map@L902-L902 | 'g o H_1 is a continuous function': g is continuous (n = 1) on [0,inf]^d, in particular on A
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: -

NODE: thm-fixed#fixed-point-in-Lambda
KIND: step
TITLE: There is lambda in Lambda with g(lambda) = lambda
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#fixed-point-in-Lambda@L902-L902
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#fixed-point-in-Lambda@L902-L902
CONTRACT_ID: paper.thm-fixed#fixed-point-in-Lambda
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); Lambda := [0,inf)^d \ (S_0 u S_inf)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; A, H_1 as given by thm-fixed#apply-retract; lambda in A
SOURCE_CONCLUSION: there exists lambda in Lambda such that g(lambda) = lambda
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: thm-fixed#brouwer-on-A, thm-fixed#gH1-self-map, thm-fixed#apply-retract
ROUTES: -
ROUTE_FOR: -
EDGE: thm-fixed#brouwer-on-A | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#fixed-point-in-Lambda@L902-L902 | 'there exists lambda in A such that g(H_1(lambda)) = lambda': Brouwer applied to the continuous self-map g o H_1 of A
EDGE: thm-fixed#gH1-self-map | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#fixed-point-in-Lambda@L902-L902 | supplies the continuous self-map g o H_1; its image lies in Lambda, so 'Necessarily, lambda in Lambda'
EDGE: thm-fixed#apply-retract | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#fixed-point-in-Lambda@L902-L902 | 'H_1(lambda) = lambda since H_1 is a retraction', hence g(lambda) = lambda
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: -

NODE: thm-fixed#zero-notin-Lambda
KIND: step
TITLE: 0 is not in Lambda
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#zero-notin-Lambda@L904-L904
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#zero-notin-Lambda@L904-L904
CONTRACT_ID: paper.thm-fixed#zero-notin-Lambda
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); S_0, S_inf as in (2.9); Lambda := [0,inf)^d \ (S_0 u S_inf)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X
SOURCE_CONCLUSION: 0 is not in Lambda
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-attractive-zero, eqn-basin-def.zero
ROUTES: -
ROUTE_FOR: -
EDGE: lem-attractive-zero | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#zero-notin-Lambda@L904-L904 | 'Since 0 is not in Lambda': 0 lies in [0,eps]^d, on which the orbit tends to 0 (reading; the source gives no reason)
EDGE: eqn-basin-def.zero | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#zero-notin-Lambda@L904-L904 | hence 0 is in S_0 by (2.9), so 0 is not in Lambda
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: reviewer-C/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: The source states 'Since 0 not in Lambda' without a reason; read as 0 in [0,eps]^d subset S_0 (Lemma 2.15). An alternative reading is Lambda subset A(r,R) with r > 0 (lem-retract#choose-r-R). Not marked SOURCE_GAP (immediate either way).

NODE: thm-fixed#positivity
KIND: application
TITLE: Lemma 2.3 applied to q = e^lambda: a nonzero fixed point of g in [0,inf)^d lies in (0,inf)^d
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#positivity@L904-L904
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#positivity@L904-L904
CONTRACT_ID: paper.thm-fixed#positivity
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); g, g^{(n)} as in Definition 2.6 evaluated on [0,inf]^d
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; lambda in Lambda with g(lambda) = lambda (the witness of thm-fixed#fixed-point-in-Lambda), lambda != 0 (thm-fixed#zero-notin-Lambda); q := e^lambda
SOURCE_CONCLUSION: lambda in (0,inf)^d (every coordinate of lambda is positive)
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-fixed-pos, eqn-fixed-pt-equiv, claim:subcritical-extinction, thm-fixed#fixed-point-in-Lambda, thm-fixed#zero-notin-Lambda
ROUTES: -
ROUTE_FOR: -
EDGE: lem-fixed-pos | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#positivity@L904-L904 | 'By Lemma 2.3, in fact lambda in (0,inf)^d': applied to the fixed point q = e^lambda of f in (0,inf)^d, using its second assertion (q_k = 1 for all k or q_k > 1 for all k)
EDGE: eqn-fixed-pt-equiv | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#positivity@L904-L904 | g(lambda) = lambda iff f(e^lambda) = e^lambda: supplies f(q) = q for q = e^lambda (not cited by the source)
EDGE: claim:subcritical-extinction | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#positivity@L904-L904 | supplies the premise of Lemma 2.3 that the extinction probability from any state is one, from Hypothesis I of the setting (not discussed at L904)
EDGE: thm-fixed#fixed-point-in-Lambda | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#positivity@L902-L904 | supplies lambda in Lambda with g(lambda) = lambda
EDGE: thm-fixed#zero-notin-Lambda | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#positivity@L904-L904 | gives lambda != 0, so 'lambda in [0,inf)^d \ {0}'; q_k = 1 for all k would force lambda = 0
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: the source says only 'Since 0 not in Lambda, we have lambda in [0,inf)^d \ {0}. By Lemma 2.3, in fact lambda in (0,inf)^d' (L904). It does not state (a) the translation q := e^lambda with f(q) = q through (2.6); (b) the premise of Lemma 2.3 that the extinction probability is one, which the setting delivers only through Hypothesis I (modeled by the shared SOURCE_GAP node claim:subcritical-extinction, the same unproved step as at L628); (c) positive regularity (Hypothesis II) for the second assertion; (d) that the dichotomy 'all q_k = 1 or all q_k > 1' together with lambda != 0 gives positivity of every coordinate.

NODE: thm-fixed
KIND: theorem
TITLE: Theorem 2.7: there exists lambda in (0,inf)^d with g(lambda) = lambda
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed@L555-L557
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed@L894-L905
CONTRACT_ID: paper.thm2_7
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); g as in Definition 2.6 (the standing sentence at L528 puts all of Section 2.2-2.3 in the setting of Theorem 1.4; Theorem 2.7 itself states no further premise)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; exists lambda in (0,inf)^d
SOURCE_CONCLUSION: there exists lambda in (0,inf)^d such that g(lambda) = lambda
CONSTANT_SCOPE: none
FROZEN_FILE: Conjugate/Frozen/Theorem_2_7.lean
FROZEN_DECL: Conjugate.theorem_2_7
FROZEN_ANCHOR_ID: thm.theorem_2_7.v1
FROZEN_ABI_SHA256: 0e7b189be47e05741d5424232b7bda2d63fd1958f0dce6b3d8873519c8bfe314
DEPS: thm-fixed#fixed-point-in-Lambda, thm-fixed#positivity
ROUTES: -
ROUTE_FOR: -
EDGE: thm-fixed#positivity | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed@L904-L904 | the proof concludes 'By Lemma 2.3, in fact lambda in (0,inf)^d' for the Brouwer fixed point of g in Lambda
EDGE: thm-fixed#fixed-point-in-Lambda | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed@L902-L902 | 'Thus g(lambda) = lambda': the Brouwer fixed point lambda in Lambda found at L902 supplies the equation g(lambda) = lambda of the theorem's conclusion; positivity (L904) supplies lambda in (0,inf)^d for the same lambda
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Root anchor; FROZEN_* and CONTRACT_* copied verbatim from EXTRACTION_SPEC section 8. Hypotheses read from the standing sentence L528 (Hypothesis III read for k in {1,...,d}, E1). Equivalence with Theorem 1.4 through (2.6) (L548-L553) is consumed by the proof of Theorem 1.4 (slice A roots), not by this proof; (2.6) is used here only inside thm-fixed#positivity. Proof structure: g(Lambda) subset Lambda; Lemma 2.19 gives A and retraction H_1; A homeomorphic to a closed ball (unproved); Brouwer for g o H_1; positivity via Lemma 2.3.

NODE: ext:brouwer
KIND: external
TITLE: Brouwer fixed point theorem
STATEMENT_SOURCE: external:standard#brouwer-fixed-point
PROOF_SOURCE: -
CONTRACT_ID: paper.ext:brouwer
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: K is a space homeomorphic to the closed d-dimensional Euclidean ball (d in N); F : K -> K is continuous
SOURCE_QUANTIFIERS: d in N; K; F
SOURCE_CONCLUSION: F has a fixed point
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: reviewer-C/sonnet
LEAN_STATUS: EXTERNAL
LEAN_REF: -
LEAN_NOTE: -
NOTE: Invoked by name at L899 (proof of Theorem 2.7). Canonical ID from spec section 5; may also be defined by other slices (dedupe in merge).

NODE: ext:connectedness
KIND: external
TITLE: A connected space is not the union of two disjoint nonempty relatively open subsets
STATEMENT_SOURCE: external:standard#connected-not-union-of-disjoint-open
PROOF_SOURCE: -
CONTRACT_ID: paper.ext:connectedness
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: T is a connected topological space; U, V are disjoint open subsets of T with U u V = T
SOURCE_QUANTIFIERS: T; U; V
SOURCE_CONCLUSION: U is empty or V is empty
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: reviewer-C/sonnet
LEAN_STATUS: EXTERNAL
LEAN_REF: -
LEAN_NOTE: -
NOTE: Invoked as 'Since L is connected' at L833 (Lemma 2.18); the definition of connectedness itself. Canonical ID from spec section 5.

NODE: ext:compact-hausdorff
KIND: external
TITLE: A continuous bijection from a compact space onto a Hausdorff space is a homeomorphism
STATEMENT_SOURCE: external:standard#continuous-bijection-compact-hausdorff
PROOF_SOURCE: -
CONTRACT_ID: paper.ext:compact-hausdorff
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: K is a compact topological space; Y is a Hausdorff topological space; h : K -> Y is a continuous bijection
SOURCE_QUANTIFIERS: K; Y; h
SOURCE_CONCLUSION: h is a homeomorphism (its inverse is continuous)
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-C/sonnet
REVIEWER: reviewer-C/sonnet
LEAN_STATUS: EXTERNAL
LEAN_REF: -
LEAN_NOTE: -
NOTE: Invoked at L871 ('Therefore, pi restricted to Lambda is a homeomorphism'). Canonical ID from spec section 5.

NODE: def:truncation
KIND: definition
TITLE: Branching process X^d truncated at level d (individuals of type ≥ d+1 killed)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#truncation@L936-L937
PROOF_SOURCE: -
CONTRACT_ID: paper.def.truncate
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X is a countable-type branching process with types k∈ℕ and finite offspring (3.1); d∈ℕ
SOURCE_QUANTIFIERS: X; d∈ℕ
SOURCE_CONCLUSION: X^d = {X^d(n)}_{n∈ℕ_0} is the d-type branching process obtained from X by immediately killing each individual of type k≥d+1: an individual of X corresponds to an individual of X^d iff each of its ancestors has type k≤d (so X^d_k(1)=0 for k≥d+1); all objects associated with X^d (f^d, g^d, …) carry an additional superscript d
CONSTANT_SCOPE: none
FROZEN_FILE: Conjugate/Frozen/Defs/Truncate.lean
FROZEN_DECL: Conjugate.truncate
FROZEN_ANCHOR_ID: def.truncate.v1
FROZEN_ABI_SHA256: 8c0eb7b86da143d341441e880b49fe6eb178b6132f157ba5ed5f491598122531
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: definition leaf. Manifest range L937-L948 also covers the opening of display (3.2), modeled separately as eqn-gf-truncated. The source says only that each ancestor has type k≤d; the individual own type must also be ≤ d (cf. L1120 for X̃^k: the individual and all of its ancestors; and (3.2)); see graph/packets/slice-D.md, section Report

NODE: eqn-gf-truncated
KIND: display
TITLE: (3.2): generating function of the truncated process, f^d_k(q_1,…,q_d)=f_k(q_1,…,q_d,1,1,…)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-gf-truncated@L945-L951
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-gf-truncated@L945-L945
CONTRACT_ID: paper.eqn-gf-truncated
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X countable-type branching process with types ℕ and (3.1); f its generating function (L920-L926: f_k(q)=𝔼_k[∏_{j≥1} q_j^{X_j(1)}]); d∈ℕ; X^d the truncation of X at level d with generating function f^d
SOURCE_QUANTIFIERS: X; d∈ℕ; k∈{1,…,d}; (q_1,…,q_d)∈(0,∞]^d
SOURCE_CONCLUSION: f^d_k(q_1,…,q_d) = 𝔼_k[∏_{j=1}^d q_j^{X^d_j(1)}] = f_k(q_1,…,q_d,1,1,…) for all k∈{1,…,d}
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: def:truncation, eqn-generating-function
ROUTES: -
ROUTE_FOR: -
EDGE: def:truncation | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-gf-truncated@L945-L945 | 'Consequently': under ℙ_k with k≤d, X^d_j(1)=X_j(1) for j≤d and X^d_j(1)=0 for j>d, which turns the d-type expectation into f_k with tail arguments equal to 1
EDGE: eqn-generating-function | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-gf-truncated@L945-L951 | both sides are generating functions in the sense of (1.1): f^d of the d-type process X^d and the countable-type f_k of L920-L926
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Labeled display (3.2): the characterization of f^d consumed by (3.9), (3.13), (3.18), (3.20) and the log form eqn-log-gf-truncated. Statement and proof locators coincide (one-word justification Consequently).

NODE: eqn-log-gf-infty
KIND: display
TITLE: (3.5): log-coordinate generating functions g (countable type) and g^d (truncation)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-log-gf-infty@L991-L995
PROOF_SOURCE: -
CONTRACT_ID: paper.eqn-log-gf-infty
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X countable-type branching process with types ℕ and (3.1) with generating function f; d∈ℕ; f^d the generating function of X^d; log and exp applied componentwise
SOURCE_QUANTIFIERS: X; d∈ℕ; λ∈(-∞,∞]^ℕ for g (E6: the source ℕ_0 is ℕ); λ∈(-∞,∞]^d for g^d
SOURCE_CONCLUSION: g(λ) := log f(exp λ) for λ∈(-∞,∞]^ℕ and g^d(λ) := log f^d(exp λ) for λ∈(-∞,∞]^d, as in Definition 2.6
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: def-log-gf, eqn-generating-function, def:truncation
ROUTES: -
ROUTE_FOR: -
EDGE: def-log-gf | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-log-gf-infty@L991-L993 | 'As in Definition 2.6, we define': g=log∘f∘exp coordinatewise, the same construction as Definition 2.6, here for the countable-type f and for the generating function f^d of X^d
EDGE: eqn-generating-function | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-log-gf-infty@L992-L994 | f in g=log f(exp λ) is the countable-type generating function of L920-L926 (covered by the anchor eqn-generating-function, manifest range L919-L925)
EDGE: def:truncation | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-log-gf-infty@L990-L995 | g^d is built from f^d, the generating function of the truncated process X^d of L937
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Display (3.5). The anchor def-log-gf has manifest range L533-L546,L991-L995 (slice B note), so this display is the slice-D countable-type/truncated version and depends on that anchor. Immediate unfoldings used downstream: g_k(λ)=log 𝔼_k[exp(Σ_j λ_j X_j(1))].

NODE: eqn-log-gf-truncated
KIND: claim
TITLE: Log-coordinate form of (3.2): g^d_k(μ_1,…,μ_d) = g_k(μ_1,…,μ_d,0,0,…)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-exp-bd@L1075-L1075
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-exp-bd@L1075-L1075
CONTRACT_ID: paper.eqn-log-gf-truncated
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X countable-type branching process with types ℕ and (3.1); d∈ℕ; g, g^d as in (3.5)
SOURCE_QUANTIFIERS: X; d∈ℕ; k∈{1,…,d}; μ=(μ_1,…,μ_d)∈(-∞,∞]^d
SOURCE_CONCLUSION: g^d_k(μ_1,…,μ_d) = g_k(μ_1,…,μ_d,0,0,…): display (3.2) in log coordinates (E4: the source prints the tail arguments of g_k as 1,1,… at L1075; they are read as 0,0,…, as printed at L1139)
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: eqn-gf-truncated, eqn-log-gf-infty
ROUTES: -
ROUTE_FOR: -
EDGE: eqn-gf-truncated | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-exp-bd@L1075-L1075 | '(by (3.2))': f^d_k(e^μ)=f_k(e^{μ_1},…,e^{μ_d},1,1,…), and e^0=1 turns the tail arguments into 0,0,… after taking log
EDGE: eqn-log-gf-infty | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-exp-bd@L1074-L1075 | passes from f to g and from f^d to g^d by taking log (the definitions of (3.5))
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Reused carrier-change claim (f to g) consumed at L1049 ((3.9)), L1075-L1077 ((3.13)), L1139-L1141 ((3.17) proof). Not a displayed formula of the paper; introduced as a node to carry the E4 reading (L1075 prints 1,1,…, L1139 prints 0,0,…).

NODE: def:stoch-dom
KIND: definition
TITLE: Stochastic domination of one offspring law by another (componentwise order)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#stoch-dom@L1194-L1194
PROOF_SOURCE: -
CONTRACT_ID: paper.def.StochDominated
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: ν, ρ are probability measures on sequences {X_j(1)}_{j∈ℕ} of non-negative integers (offspring vectors) ordered componentwise
SOURCE_QUANTIFIERS: ν; ρ
SOURCE_CONCLUSION: ν is stochastically dominated by ρ for the componentwise order on offspring vectors; the paper uses the phrase without writing the definition (standard notion) and applies it with ν=ℙ_k and ρ=the law of the componentwise sum of k i.i.d. samples from ℙ_1
CONSTANT_SCOPE: none
FROZEN_FILE: Conjugate/Frozen/Defs/StochDominated.lean
FROZEN_DECL: Conjugate.StochDominated
FROZEN_ANCHOR_ID: def.StochDominated.v1
FROZEN_ABI_SHA256: 44d5e5c00d3f94614e3c4473d3b4ab45776539b0144ee18d9b356f065dc58567
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: definition leaf; the paper does not define the notion. The manifest source range L1188-L1190 contains the display (3.23) and not the phrase stochastically dominated, which occurs only at L1194; the locator here follows the text (see graph/packets/slice-D.md, section Report). Consumed by example-ctble#global-extinction and #assume-I..IV.

NODE: thm-fixed-pt-infty
KIND: theorem
TITLE: Theorem 3.1: a fixed point q∈(1,∞)^ℕ of the countable-type generating function
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed-pt-infty@L957-L987
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-thm-fixed-pt-infty@L1149-L1179
CONTRACT_ID: paper.thm3_1
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X = {X(n)}_{n∈ℕ_0} is a countable-type branching process with types k∈ℕ and finite offspring (3.1): ℙ_k[Σ_{j≥1} X_j(1)<∞]=1 for every k∈ℕ; X has global extinction probability one (L958; read as for every starting type k); Assumption I: for each d∈ℕ the truncation X^d satisfies the hypotheses of Theorem 1.4 (subcritical; positive regular and non-singular; f^d_k continuous from (0,∞]^d to (0,∞] for each k∈{1,…,d}); Assumption II: there exist φ,ψ:ℕ→[1,∞) with lim_{k→∞}φ(k)=∞ and lim_{k→∞}log ψ(k)/φ(k)=0 such that f_k(q)≤ψ(k)[f_1(q)]^{φ(k)} for all k∈ℕ and all q∈[1,∞)^ℕ; Assumption III: there exists s>1 with 𝔼_k[s^{Σ_{j≥1}φ(j)X_j(1)}]≤s^{φ(k)} for all k∈ℕ; Assumption IV: there exists t>1 with f_1(t,1,1,…)>t and f_k({ψ(j)t^{φ(j)}}_{j∈ℕ})<∞ for all k∈ℕ
SOURCE_QUANTIFIERS: X (countable type, (3.1), global extinction probability one); Assumption I (for every d∈ℕ); ∃φ,ψ (Assumption II); ∃s>1 (Assumption III, for these φ); ∃t>1 (Assumption IV, for these φ,ψ); ∃q∈(1,∞)^ℕ
SOURCE_CONCLUSION: there exists q∈(1,∞)^ℕ such that f(q)=q (E6: the source ℕ_0 is ℕ)
CONSTANT_SCOPE: q is quantified after X and the assumption witnesses φ,ψ,s,t (supplied by the hypotheses); the selection d↦λ^d of (3.6) is internal to the proof and does not appear in the statement
FROZEN_FILE: Conjugate/Frozen/Theorem_3_1.lean
FROZEN_DECL: Conjugate.theorem_3_1
FROZEN_ANCHOR_ID: thm.theorem_3_1.v1
FROZEN_ABI_SHA256: 068d102eb9de927f8f4534494b8a560ad89f1fefedd48d8163838ea19d070819
DEPS: thm-fixed-pt-infty#reduce-to-g, thm-fixed-pt-infty#interchange, thm-fixed-pt-infty#positivity
ROUTES: -
ROUTE_FOR: -
EDGE: thm-fixed-pt-infty#reduce-to-g | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed-pt-infty@L996-L996 | 'it suffices to find λ∈(0,∞)^ℕ such that g(λ)=λ (we can then set q=exp(λ))': carrier change λ↔q
EDGE: thm-fixed-pt-infty#interchange | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-thm-fixed-pt-infty@L1176-L1176 | 'In other words, g(λ)=λ': the subsequential limit λ is a fixed point of g
EDGE: thm-fixed-pt-infty#positivity | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-thm-fixed-pt-infty@L1178-L1178 | 'in fact λ∈(0,∞)^ℕ': strict positivity, needed for q=exp λ∈(1,∞)^ℕ
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Anchor root. Statement locator spans L957-L987 as in the manifest (global-extinction sentence L958, Assumptions I-IV L960-L981, theorem L985-L987). The §3.2 assumption packages are local hypotheses (spec §4): recorded here and in every consuming lemma/step, no assumption nodes. Proof = setup L989-L1002 + Lemmas 3.2-3.4 (L1004-L1145) + proof paragraph L1149-L1179. The global-extinction hypothesis (L958) is not consumed by any step of the proof.

NODE: thm-fixed-pt-infty#reduce-to-g
KIND: step
TITLE: Reduction to a fixed point λ∈(0,∞)^ℕ of g (q := exp λ)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed-pt-infty@L996-L996
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed-pt-infty@L996-L996
CONTRACT_ID: paper.thm-fixed-pt-infty#reduce-to-g
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X countable-type branching process with types ℕ and generating function f; g as in (3.5)
SOURCE_QUANTIFIERS: X; λ∈(0,∞)^ℕ with g(λ)=λ (the witness assembled by thm-fixed-pt-infty#interchange and thm-fixed-pt-infty#positivity); q := exp(λ) componentwise
SOURCE_CONCLUSION: q=(e^{λ_k})_{k∈ℕ}∈(1,∞)^ℕ and f(q)=q
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: eqn-log-gf-infty
ROUTES: -
ROUTE_FOR: -
EDGE: eqn-log-gf-infty | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed-pt-infty@L996-L996 | g=log∘f∘exp coordinatewise with log and exp mutually inverse between (-∞,∞] and (0,∞], so g(λ)=λ iff f(e^λ)=e^λ, and λ∈(0,∞)^ℕ iff e^λ∈(1,∞)^ℕ
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Carrier change (λ=log q) stated at L996. The finite-type analogue is eqn-fixed-pt-equiv (2.6); the source does not cite it here, so no edge to it.

NODE: thm-fixed-pt-infty#choose-lambda-d
KIND: application
TITLE: Choice of a fixed point λ^d∈(0,∞)^d of g^d for each d (Theorem 1.4 applied to X^d), arbitrary when not unique
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-trunc@L998-L1002
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-trunc@L998-L1002
CONTRACT_ID: paper.thm-fixed-pt-infty#choose-lambda-d
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X countable-type branching process with types ℕ and (3.1); Assumption I: for each d∈ℕ the truncation X^d satisfies the hypotheses of Theorem 1.4 (subcritical; positive regular and non-singular; f^d_k continuous from (0,∞]^d to (0,∞] for each k∈{1,…,d}); g^d as in (3.5)
SOURCE_QUANTIFIERS: X; for each d∈ℕ: ∃λ^d=(λ^d_1,…,λ^d_d)∈(0,∞)^d with g^d(λ^d)=λ^d; if there are several such points one is chosen in an arbitrary manner (one selection d↦λ^d, fixed for the rest of the section)
SOURCE_CONCLUSION: for each d∈ℕ there exists λ^d∈(0,∞)^d with g^d(λ^d)=λ^d (3.6); a fixed selection d↦λ^d is made in an arbitrary manner when g^d has more than one fixed point in (0,∞)^d
CONSTANT_SCOPE: λ^d depends on X and d only; the selection is made once, before and independently of the parameters of Lemmas 3.2-3.4 and of the subsequence 𝒟; every later statement is claimed for every such selection
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: thm-fixed-gf.fixed-point, eqn-fixed-pt-equiv, eqn-log-gf-infty
ROUTES: -
ROUTE_FOR: -
EDGE: thm-fixed-gf.fixed-point | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-trunc@L998-L998 | 'By Theorem 1.4, for each d∈ℕ there exists λ^d…': Theorem 1.4 (fixed-point form) applied to the d-type process X^d; its hypotheses (I)-(III) for X^d are Assumption I, supplied by the root hypotheses
EDGE: eqn-fixed-pt-equiv | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-trunc@L998-L1000 | Theorem 1.4 gives q^d∈(1,∞)^d with f^d(q^d)=q^d; (2.6) for X^d converts this to λ^d=log q^d∈(0,∞)^d with g^d(λ^d)=λ^d
EDGE: eqn-log-gf-infty | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-trunc@L999-L1000 | g^d of (3.5) is the log-coordinate function in which (3.6) is stated
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: WITNESS-CHOICE POLICY: the paper fixes ONE arbitrary selection d↦λ^d of fixed points (we choose one in an arbitrary manner), uses no property of the selection beyond λ^d∈(0,∞)^d and g^d(λ^d)=λ^d, and Lemmas 3.2-3.4 and the proof of Theorem 3.1 are claims about this selection, hence true for every selection. Lemmas 3.2-3.4 therefore carry the family (λ^d)_d as a hypothesis (3.6); the existence/selection is consumed at their applications (#diagonal-limit, #before-dct, #dominated-bound, #nonzero-limit). The conversion q^d=exp λ^d (carrier change) is implicit in By Theorem 1.4 … λ^d; the paper does not cite (2.6) here.

NODE: thm-fixed-pt-infty#diagonal-limit
KIND: application
TITLE: Subsequential limit λ_k=lim_{𝒟∋d→∞}λ^d_k for all k (3.19), using Lemma 3.2
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-ssl@L1150-L1153
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-ssl@L1150-L1155
CONTRACT_ID: paper.thm-fixed-pt-infty#diagonal-limit
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: §3.2 setting S (countable-type X with (3.1), global extinction probability one, Assumptions I-IV with witnesses φ, ψ, s, t; full text in SOURCE_HYPOTHESES of thm-fixed-pt-infty)
SOURCE_QUANTIFIERS: X; (λ^d)_{d∈ℕ} the selection of thm-fixed-pt-infty#choose-lambda-d (λ^d∈(0,∞)^d, g^d(λ^d)=λ^d, (3.6)); ∃ a sequence 𝒟 of positive integers tending to ∞ such that for every k∈ℕ the limit lim_{𝒟∋d→∞}λ^d_k exists
SOURCE_CONCLUSION: there is a sequence 𝒟 of positive integers tending to ∞ such that λ_k := lim_{𝒟∋d→∞}λ^d_k exists for every k∈ℕ (3.19); λ := {λ_k}_{k∈ℕ}∈[0,∞)^ℕ (L1027)
CONSTANT_SCOPE: 𝒟 and λ depend on X and the selection (λ^d) only; 𝒟 is independent of k
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-fixed-limsup, ext:diagonal-subsequence, thm-fixed-pt-infty#choose-lambda-d
ROUTES: -
ROUTE_FOR: -
EDGE: lem-fixed-limsup | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-ssl@L1150-L1150 | 'By Lemma 3.2 and a standard compactness argument': limsup_dλ^d_k<∞ for each k makes {λ^d_k}_d pre-compact in [0,∞)
EDGE: ext:diagonal-subsequence | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-ssl@L1150-L1150 | 'a standard compactness argument': diagonal extraction of one subsequence along which every coordinate converges
EDGE: thm-fixed-pt-infty#choose-lambda-d | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-ssl@L1150-L1152 | supplies the family λ^d of (3.6) to which Lemma 3.2 is applied
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: 'Standard compactness argument' is the canonical external ext:diagonal-subsequence (spec §5). The source places λ in [0,∞)^ℕ at L1027; non-negativity of each λ_k comes from λ^d_k>0 and finiteness from Lemma 3.2.

NODE: thm-fixed-pt-infty#before-dct
KIND: step
TITLE: (3.20): e^{λ^d_k} = 𝔼_k[exp(Σ_{j≤d}λ^d_jX_j(1))] for k≤d
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-before-fatou@L1155-L1159
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-before-fatou@L1156-L1156
CONTRACT_ID: paper.thm-fixed-pt-infty#before-dct
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: §3.2 setting S (countable-type X with (3.1), global extinction probability one, Assumptions I-IV with witnesses φ, ψ, s, t; full text in SOURCE_HYPOTHESES of thm-fixed-pt-infty)
SOURCE_QUANTIFIERS: X; (λ^d)_{d∈ℕ} the selection of thm-fixed-pt-infty#choose-lambda-d (λ^d∈(0,∞)^d, g^d(λ^d)=λ^d, (3.6)); d∈ℕ; k∈{1,…,d}
SOURCE_CONCLUSION: for each d∈ℕ and k∈{1,…,d}: e^{λ^d_k} = 𝔼_k[exp(Σ_{j=1}^dλ^d_jX_j(1))] (3.20), the expectation under the law of X
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: eqn-gf-truncated, eqn-log-gf-infty, thm-fixed-pt-infty#choose-lambda-d
ROUTES: -
ROUTE_FOR: -
EDGE: eqn-gf-truncated | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-before-fatou@L1156-L1156 | f^d_k(e^{λ^d})=f_k(e^{λ^d_1},…,e^{λ^d_d},1,1,…)=𝔼_k[∏_{j≤d}e^{λ^d_jX_j(1)}] expresses the truncated generating function through the offspring of X
EDGE: eqn-log-gf-infty | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-before-fatou@L1156-L1156 | 'By the definitions of g^d': g^d_k(λ)=log f^d_k(e^λ)
EDGE: thm-fixed-pt-infty#choose-lambda-d | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-before-fatou@L1156-L1156 | g^d(λ^d)=λ^d (3.6) gives e^{λ^d_k}=f^d_k(e^{λ^d})
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: The source label eqn-before-fatou is historical: the display feeds the dominated convergence step, not a Fatou step.

NODE: thm-fixed-pt-infty#as-convergence
KIND: step
TITLE: (3.21): almost sure convergence of exp(Σ_{j≤d}λ^d_jX_j(1)) along 𝒟
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-as-conv@L1160-L1163
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-as-conv@L1160-L1160
CONTRACT_ID: paper.thm-fixed-pt-infty#as-convergence
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: §3.2 setting S (countable-type X with (3.1), global extinction probability one, Assumptions I-IV with witnesses φ, ψ, s, t; full text in SOURCE_HYPOTHESES of thm-fixed-pt-infty); in particular finite offspring (3.1): ℙ_k-a.s. only finitely many j have X_j(1)≠0
SOURCE_QUANTIFIERS: X; (λ^d)_{d∈ℕ} the selection of thm-fixed-pt-infty#choose-lambda-d; 𝒟 and λ=(λ_j)_j the sequence and limit of thm-fixed-pt-infty#diagonal-limit (3.19); k∈ℕ
SOURCE_CONCLUSION: for each k∈ℕ, ℙ_k-a.s.: lim_{𝒟∋d→∞}exp(Σ_{j=1}^dλ^d_jX_j(1)) = exp(Σ_{j=1}^∞λ_jX_j(1)) (3.21)
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: thm-fixed-pt-infty#diagonal-limit
ROUTES: -
ROUTE_FOR: -
EDGE: thm-fixed-pt-infty#diagonal-limit | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-as-conv@L1160-L1160 | 'As 𝒟∋d→∞, we have λ^d_j→λ_j': termwise convergence of the exponents; with a.s. finitely many nonzero X_j(1) the sums eventually reduce to the same finite sum
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: (3.1) (inventory item inv:eqn-finite-offspring) is consumed here as a hypothesis of the countable-type setting (L1160 see (3.1)); it is supplied by the root hypotheses, not by a node.

NODE: thm-fixed-pt-infty#dominated-bound
KIND: application
TITLE: (3.22): domination of exp(Σ_{j≤d}λ^d_jX_j(1)) by ∏_j[ψ(j)t^{φ(j)}]^{X_j(1)} via Lemma 3.4
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-dominate@L1166-L1171
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-dominate@L1167-L1167
CONTRACT_ID: paper.thm-fixed-pt-infty#dominated-bound
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: §3.2 setting S (countable-type X with (3.1), global extinction probability one, Assumptions I-IV with witnesses φ, ψ, s, t; full text in SOURCE_HYPOTHESES of thm-fixed-pt-infty); t>1 from Assumption IV and φ,ψ from Assumption II
SOURCE_QUANTIFIERS: X; (λ^d)_{d∈ℕ} the selection of thm-fixed-pt-infty#choose-lambda-d; d∈ℕ; j≤d; the non-negative integers X_j(1)
SOURCE_CONCLUSION: for every d∈ℕ: exp(Σ_{j=1}^dλ^d_jX_j(1)) ≤ ∏_{j=1}^∞[ψ(j)t^{φ(j)}]^{X_j(1)} (3.22)
CONSTANT_SCOPE: the dominating random variable does not depend on d
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-1d-soln, thm-fixed-pt-infty#choose-lambda-d
ROUTES: -
ROUTE_FOR: -
EDGE: lem-1d-soln | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-dominate@L1167-L1167 | 'By Lemma 3.4, we have λ^d_j≤φ(j)log t+log ψ(j) for each d≥j': part (3.17) bounds the exponents uniformly in d
EDGE: thm-fixed-pt-infty#choose-lambda-d | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-dominate@L1167-L1167 | Lemma 3.4 is a statement about the selected family λ^d of (3.6)
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Extending the product from j≤d to all j uses X_j(1)≥0 and ψ(j)t^{φ(j)}≥1 (ψ,φ≥1, t>1) and is finite a.s. by (3.1). Integrability of the right side under 𝔼_k (Assumption IV: f_k({ψ(j)t^{φ(j)}}_j)<∞) is used at L1172 in #interchange.

NODE: thm-fixed-pt-infty#interchange
KIND: application
TITLE: Dominated convergence along 𝒟: g(λ)=λ
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-thm-fixed-pt-infty@L1172-L1176
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-thm-fixed-pt-infty@L1166-L1176
CONTRACT_ID: paper.thm-fixed-pt-infty#interchange
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: §3.2 setting S (countable-type X with (3.1), global extinction probability one, Assumptions I-IV with witnesses φ, ψ, s, t; full text in SOURCE_HYPOTHESES of thm-fixed-pt-infty); in particular Assumption IV (f_k({ψ(j)t^{φ(j)}}_j)<∞ for every k) and (3.1)
SOURCE_QUANTIFIERS: X; (λ^d)_{d∈ℕ} the selection of thm-fixed-pt-infty#choose-lambda-d; 𝒟 and λ the sequence and limit of thm-fixed-pt-infty#diagonal-limit (3.19); k∈ℕ
SOURCE_CONCLUSION: for every k∈ℕ: λ_k = lim_{𝒟∋d→∞}λ^d_k = lim_{𝒟∋d→∞}g_k(λ^d) = g_k(λ); i.e. g(λ)=λ, where g_k(λ)=log 𝔼_k[exp(Σ_{j=1}^∞λ_jX_j(1))]
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: ext:dct, thm-fixed-pt-infty#before-dct, thm-fixed-pt-infty#as-convergence, thm-fixed-pt-infty#dominated-bound, thm-fixed-pt-infty#diagonal-limit, eqn-log-gf-infty
ROUTES: -
ROUTE_FOR: -
EDGE: ext:dct | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-thm-fixed-pt-infty@L1172-L1172 | 'and the dominated convergence theorem': Y_d := exp(Σ_{j≤d}λ^d_jX_j(1)) converges a.s. along 𝒟 to Y, is dominated by Z, and 𝔼_kZ<∞, so 𝔼_kY_d→𝔼_kY
EDGE: thm-fixed-pt-infty#before-dct | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-thm-fixed-pt-infty@L1172-L1174 | (3.20) gives e^{λ^d_k}=𝔼_k[Y_d], i.e. λ^d_k=g_k(λ^d) after taking log
EDGE: thm-fixed-pt-infty#as-convergence | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-thm-fixed-pt-infty@L1172-L1172 | (3.21) supplies the a.s. convergence Y_d→Y
EDGE: thm-fixed-pt-infty#dominated-bound | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-thm-fixed-pt-infty@L1172-L1172 | (3.22) supplies the dominating variable Z=∏_j[ψ(j)t^{φ(j)}]^{X_j(1)}, integrable under 𝔼_k by Assumption IV
EDGE: thm-fixed-pt-infty#diagonal-limit | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-thm-fixed-pt-infty@L1174-L1174 | λ_k=lim_{𝒟∋d→∞}λ^d_k (3.19) is the left end of the chain of equalities
EDGE: eqn-log-gf-infty | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-thm-fixed-pt-infty@L1174-L1176 | identifies log 𝔼_k[exp(Σ_jλ_jX_j(1))] with g_k(λ) of (3.5)
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Premise discharge for dominated convergence: a.s. convergence by (3.21), dominating function by (3.22), integrability by Assumption IV (a hypothesis of the root, supplied by it; no node). 𝔼_kY is finite since Y≤Z; continuity of log passes the limit through g_k.

NODE: thm-fixed-pt-infty#nonzero-limit
KIND: step
TITLE: λ∈[0,∞)^ℕ∖{0} via Lemma 3.3
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-thm-fixed-pt-infty@L1178-L1178
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-thm-fixed-pt-infty@L1178-L1178
CONTRACT_ID: paper.thm-fixed-pt-infty#nonzero-limit
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: §3.2 setting S (countable-type X with (3.1), global extinction probability one, Assumptions I-IV with witnesses φ, ψ, s, t; full text in SOURCE_HYPOTHESES of thm-fixed-pt-infty)
SOURCE_QUANTIFIERS: X; (λ^d)_{d∈ℕ} the selection of thm-fixed-pt-infty#choose-lambda-d; 𝒟 and λ the sequence and limit of thm-fixed-pt-infty#diagonal-limit (3.19); K from Lemma 3.3 (lem-fixed-liminf); ∃k∈{1,…,K}
SOURCE_CONCLUSION: there exists k∈{1,…,K} with λ_k>0; hence λ∈[0,∞)^ℕ∖{0}
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-fixed-liminf, thm-fixed-pt-infty#diagonal-limit, thm-fixed-pt-infty#choose-lambda-d
ROUTES: -
ROUTE_FOR: -
EDGE: lem-fixed-liminf | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-thm-fixed-pt-infty@L1178-L1178 | 'By Lemma 3.3, there exists k∈{1,…,K} such that λ_k>0': liminf_d max_{k≤K}λ^d_k>0 passes to the limit along 𝒟
EDGE: thm-fixed-pt-infty#diagonal-limit | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-thm-fixed-pt-infty@L1178-L1178 | λ_k=lim_{𝒟}λ^d_k: the maximum over the finite index set {1,…,K} of the limits is the limit of the maxima; also gives λ∈[0,∞)^ℕ
EDGE: thm-fixed-pt-infty#choose-lambda-d | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-thm-fixed-pt-infty@L1178-L1178 | Lemma 3.3 is applied to the selected family λ^d
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Passing from liminf_d max_{k≤K}λ^d_k>0 to some λ_k>0 along 𝒟 uses that a finite maximum of convergent sequences converges to the maximum of the limits; the source states only the conclusion (below the step threshold, not a gap node).

NODE: thm-fixed-pt-infty#positivity
KIND: step
TITLE: λ∈(0,∞)^ℕ: positive regularity upgrades λ∈[0,∞)^ℕ∖{0} to strict positivity
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-thm-fixed-pt-infty@L1178-L1178
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-thm-fixed-pt-infty@L1178-L1178
CONTRACT_ID: paper.thm-fixed-pt-infty#positivity
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: §3.2 setting S (countable-type X with (3.1), global extinction probability one, Assumptions I-IV with witnesses φ, ψ, s, t; full text in SOURCE_HYPOTHESES of thm-fixed-pt-infty); in particular Assumption I (each truncation X^d is positive regular, Definition 1.3)
SOURCE_QUANTIFIERS: X; λ=(λ_k)_{k∈ℕ} the limit of thm-fixed-pt-infty#diagonal-limit (3.19), with g(λ)=λ (thm-fixed-pt-infty#interchange) and λ∈[0,∞)^ℕ∖{0} (thm-fixed-pt-infty#nonzero-limit); k∈ℕ
SOURCE_CONCLUSION: λ_k>0 for every k∈ℕ, i.e. λ∈(0,∞)^ℕ
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: thm-fixed-pt-infty#nonzero-limit, thm-fixed-pt-infty#interchange, lem-fixed-pos#pos-reg-strict, def-bp-basic.positive-regular
ROUTES: -
ROUTE_FOR: -
EDGE: thm-fixed-pt-infty#nonzero-limit | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-thm-fixed-pt-infty@L1178-L1178 | supplies λ∈[0,∞)^ℕ∖{0}, i.e. a coordinate j_* with λ_{j_*}>0 (the analogue of q_{j_*}>1 in Lemma 2.3)
EDGE: thm-fixed-pt-infty#interchange | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-thm-fixed-pt-infty@L1176-L1178 | λ is a fixed point g(λ)=λ, hence g^{(N)}(λ)=λ for every N, the identity the argument iterates
EDGE: lem-fixed-pos#pos-reg-strict | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-thm-fixed-pt-infty@L1178-L1178 | 'an argument similar to that in the second paragraph of the proof of Lemma 2.3' (L461-L471): one coordinate q_{j_*}>1 plus positive regularity forces q_k>1 for all k
EDGE: def-bp-basic.positive-regular | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-thm-fixed-pt-infty@L1178-L1178 | 'Since each truncated branching process X^d is positive regular (Definition 1.3)': supplies N with ℙ_k[X_{j_*}(N)≥1]>0
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: the paper only says an argument similar to the second paragraph of the proof of Lemma 2.3 shows λ∈(0,∞)^ℕ ('an argument similar to that in the second paragraph of the proof of Lemma 2.3 shows', L1178). Unwritten: (i) positive regularity is available for each truncation X^d, not for the countable-type X, and the transfer of ℙ_k[X^d_{j_*}(N)≥1]>0 (k,j_*≤d, N=N(d)) to ℙ_k[X_{j_*}(N)≥1]>0 is not written; (ii) the countable-type identities g^{(N)}(λ)=λ and f^{(N)}_k(q)=𝔼_k[∏_jq_j^{X_j(N)}] ((1.2) for infinitely many types) are not stated anywhere (L927 only defines f^{(n)} as a composition); (iii) the quantifier order of N and d. The edge to lem-fixed-pos#pos-reg-strict is the source's own pointer ('similar') and is a reconstruction by analogy, not a use of its finite-type statement. The earlier edge to eqn-gen-func-n was dropped by review: the source does not cite (1.2) at L1178, the finite-type (1.2) is already reached through lem-fixed-pos#pos-reg-strict, and it cannot discharge the countable-type identity of (ii), which stays an unwritten part of this gap.

NODE: lem-fixed-limsup
KIND: lemma
TITLE: Lemma 3.2: limsup_d λ^d_k<∞ for each k
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-limsup@L1004-L1006
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-limsup@L1007-L1025
CONTRACT_ID: paper.lem-fixed-limsup
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X = {X(n)}_{n∈ℕ_0} is a countable-type branching process with types k∈ℕ and finite offspring (3.1): ℙ_k[Σ_{j≥1} X_j(1)<∞]=1 for every k∈ℕ; X has global extinction probability one (L958; read as for every starting type k); Assumption I: for each d∈ℕ the truncation X^d satisfies the hypotheses of Theorem 1.4 (subcritical; positive regular and non-singular; f^d_k continuous from (0,∞]^d to (0,∞] for each k∈{1,…,d}); Assumption II: there exist φ,ψ:ℕ→[1,∞) with lim_{k→∞}φ(k)=∞ and lim_{k→∞}log ψ(k)/φ(k)=0 such that f_k(q)≤ψ(k)[f_1(q)]^{φ(k)} for all k∈ℕ and all q∈[1,∞)^ℕ; Assumption III: there exists s>1 with 𝔼_k[s^{Σ_{j≥1}φ(j)X_j(1)}]≤s^{φ(k)} for all k∈ℕ; Assumption IV: there exists t>1 with f_1(t,1,1,…)>t and f_k({ψ(j)t^{φ(j)}}_{j∈ℕ})<∞ for all k∈ℕ; for each d∈ℕ, λ^d=(λ^d_1,…,λ^d_d)∈(0,∞)^d satisfies g^d(λ^d)=λ^d (3.6), selected arbitrarily when g^d has several fixed points in (0,∞)^d; g, g^d as in (3.5)
SOURCE_QUANTIFIERS: §3.2 setting; selection (λ^d)_d; ∀k∈ℕ
SOURCE_CONCLUSION: for each k∈ℕ, limsup_{d→∞}λ^d_k<∞
CONSTANT_SCOPE: none (the statement names no constant: limsup_{d→∞}λ^d_k<∞ is asserted for each k∈ℕ and the given selection (λ^d)_d)
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-fixed-limsup#moment-bound
ROUTES: -
ROUTE_FOR: -
EDGE: lem-fixed-limsup#moment-bound | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-limsup@L1024-L1024 | 'Re-arranging gives λ^d_k≤log(1/p_k)': the d-uniform bound gives limsup_dλ^d_k≤log(1/p_k)<∞
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Lemmas 3.2-3.4 live in the setting of §3.2 (spec §4): global extinction probability one and Assumptions I-IV; no assumption nodes. λ^d_k is defined for d≥k, so the limsup is over d≥k. The proof consumes only Assumption I (through Lemma 2.4 for X^k). Recorded for Lean planning only: the proof's bound log(1/p_k) depends on k and X only (not on d and not on the selection), a stronger uniform reading than the statement.

NODE: lem-fixed-limsup#choose-N
KIND: application
TITLE: Lemma 2.4 applied to X^k: N=N(k) with p_k := ℙ_k[X^k_k(N)≥2]>0
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-limsup@L1009-L1012
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-limsup@L1009-L1009
CONTRACT_ID: paper.lem-fixed-limsup#choose-N
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: k∈ℕ; the truncation X^k is a k-type branching process satisfying the hypotheses of Theorem 1.4 (Assumption I; in particular positive regular and non-singular)
SOURCE_QUANTIFIERS: k∈ℕ; ∃N∈ℕ (depending on k)
SOURCE_CONCLUSION: there exists N∈ℕ (depending on k) such that p_k := ℙ_k[X^k_k(N)≥2]>0
CONSTANT_SCOPE: N and p_k depend on k and X only
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-gf-pos
ROUTES: -
ROUTE_FOR: -
EDGE: lem-gf-pos | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-limsup@L1009-L1009 | 'we can apply Lemma 2.4 to X^k': the case (k,k) of (2.4), p_{k,k}(N)=ℙ_k[X_k(N)≥2]>0 for the positive regular, non-singular process X^k
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Premises of Lemma 2.4 (X^k positive regular and non-singular) are supplied by Assumption I (hypotheses of Theorem 1.4 for X^k), part of the root hypotheses; no node. Notation: k is both a type and the truncation level (X^k).

NODE: lem-fixed-limsup#truncation-monotone
KIND: step
TITLE: ℙ_k[X^d_k(N)≥2] ≥ p_k for all d≥k (monotonicity of truncations)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-limsup@L1013-L1016
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-limsup@L1013-L1013
CONTRACT_ID: paper.lem-fixed-limsup#truncation-monotone
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: k∈ℕ; truncations X^d of X (d≥k)
SOURCE_QUANTIFIERS: X; k; N and p_k := ℙ_k[X^k_k(N)≥2] the witnesses of lem-fixed-limsup#choose-N; d≥k
SOURCE_CONCLUSION: ℙ_k[X^d_k(N)≥2] ≥ p_k for every d≥k
CONSTANT_SCOPE: the bound is uniform in d≥k
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-fixed-limsup#choose-N, def:truncation
ROUTES: -
ROUTE_FOR: -
EDGE: lem-fixed-limsup#choose-N | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-limsup@L1013-L1016 | p_k=ℙ_k[X^k_k(N)≥2] is the level-k probability compared with the level-d probability
EDGE: def:truncation | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-limsup@L1013-L1013 | 'by the definition of X^d': for d≥k every individual of X^k also belongs to X^d (all ancestors have type ≤k≤d), so {X^k_k(N)≥2}⊂{X^d_k(N)≥2}
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: The source justification is the single phrase by the definition of X^d; the content is the monotone coupling of X^k inside X^d. Not flagged as a gap (immediate from the definition).

NODE: lem-fixed-limsup#moment-bound
KIND: step
TITLE: e^{λ^d_k}=𝔼_k[exp(Σ_{j≤d}λ^d_jX^d_j(N))]≥e^{2λ^d_k}p_k, hence λ^d_k≤log(1/p_k)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-limsup@L1017-L1024
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-limsup@L1017-L1024
CONTRACT_ID: paper.lem-fixed-limsup#moment-bound
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: §3.2 setting S (countable-type X with (3.1), global extinction probability one, Assumptions I-IV with witnesses φ, ψ, s, t; full text in SOURCE_HYPOTHESES of lem-fixed-limsup) and the family λ^d of (3.6); k∈ℕ and d≥k
SOURCE_QUANTIFIERS: X; k; N and p_k from lem-fixed-limsup#choose-N; d≥k; n≥1
SOURCE_CONCLUSION: for every d≥k: e^{λ^d_k}=exp(g^{d,(N)}_k(λ^d))=𝔼_k[exp(Σ_{j=1}^dλ^d_jX^d_j(N))] ≥ e^{2λ^d_k}p_k, hence λ^d_k≤log(1/p_k)
CONSTANT_SCOPE: the bound log(1/p_k) is uniform in d≥k
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-fixed-limsup#truncation-monotone, lem-fixed-limsup#choose-N, eqn-convex-func-n
ROUTES: -
ROUTE_FOR: -
EDGE: lem-fixed-limsup#truncation-monotone | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-limsup@L1017-L1022 | supplies ℙ_k[X^d_k(N)≥2]≥p_k on the event where exp(Σ_jλ^d_jX^d_j(N))≥e^{2λ^d_k} (all λ^d_j>0)
EDGE: lem-fixed-limsup#choose-N | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-limsup@L1017-L1024 | supplies N in g^{d,(N)} and p_k>0 in the final division giving λ^d_k≤log(1/p_k)
EDGE: eqn-convex-func-n | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-limsup@L1019-L1021 | (2.5) for the d-type process X^d: g^{d,(N)}_k(λ)=log 𝔼_k[exp(Σ_{j≤d}λ_jX^d_j(N))]
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: g^{d,(n)}(λ^d)=λ^d for all n≥1 follows from g^d(λ^d)=λ^d (3.6) by iteration (routine). The rearrangement e^λ≥e^{2λ}p implies λ≤log(1/p) is routine algebra.

NODE: lem-fixed-liminf
KIND: lemma
TITLE: Lemma 3.3: liminf_d max_{k≤K}λ^d_k>0 for some K
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-liminf@L1031-L1036
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-liminf@L1037-L1097
CONTRACT_ID: paper.lem-fixed-liminf
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X = {X(n)}_{n∈ℕ_0} is a countable-type branching process with types k∈ℕ and finite offspring (3.1): ℙ_k[Σ_{j≥1} X_j(1)<∞]=1 for every k∈ℕ; X has global extinction probability one (L958; read as for every starting type k); Assumption I: for each d∈ℕ the truncation X^d satisfies the hypotheses of Theorem 1.4 (subcritical; positive regular and non-singular; f^d_k continuous from (0,∞]^d to (0,∞] for each k∈{1,…,d}); Assumption II: there exist φ,ψ:ℕ→[1,∞) with lim_{k→∞}φ(k)=∞ and lim_{k→∞}log ψ(k)/φ(k)=0 such that f_k(q)≤ψ(k)[f_1(q)]^{φ(k)} for all k∈ℕ and all q∈[1,∞)^ℕ; Assumption III: there exists s>1 with 𝔼_k[s^{Σ_{j≥1}φ(j)X_j(1)}]≤s^{φ(k)} for all k∈ℕ; Assumption IV: there exists t>1 with f_1(t,1,1,…)>t and f_k({ψ(j)t^{φ(j)}}_{j∈ℕ})<∞ for all k∈ℕ; for each d∈ℕ, λ^d=(λ^d_1,…,λ^d_d)∈(0,∞)^d satisfies g^d(λ^d)=λ^d (3.6), selected arbitrarily when g^d has several fixed points in (0,∞)^d; g, g^d as in (3.5)
SOURCE_QUANTIFIERS: §3.2 setting; selection (λ^d)_d; ∃K∈ℕ; liminf over d→∞ of max over k∈{1,…,K}
SOURCE_CONCLUSION: there exists K∈ℕ such that liminf_{d→∞}max_{k∈{1,…,K}}λ^d_k>0
CONSTANT_SCOPE: K is introduced after X, φ, ψ, s, t and the selection (λ^d)_d ('There exists K∈ℕ such that liminf_{d→∞} …'), so the statement lets K depend on all of them but not on d; it asserts no independence of K from the selection
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-fixed-liminf#step2, lem-fixed-liminf#choose-K
ROUTES: -
ROUTE_FOR: -
EDGE: lem-fixed-liminf#step2 | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-liminf@L1096-L1096 | Step 2 yields max_{k≤K}λ^d_k≥δ/2 for every d, hence the liminf is ≥δ/2>0
EDGE: lem-fixed-liminf#choose-K | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-liminf@L1080-L1083 | supplies the witness K (not depending on d)
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: The paper says this is where Assumptions II and III are used (L1028); Assumption I enters through Lemma 2.9 and Proposition 2.10 for X^d. Step 1 enters the conclusion through the case split of #step2. Constant scope: literal reading as in CONSTANT_SCOPE; the proof's K (#choose-K) depends only on φ, ψ and δ=log s, a stronger uniform reading recorded for Lean planning only (cf. ADJUDICATION B4 for lem-mono).

NODE: lem-fixed-liminf#subinvariant-weights
KIND: step
TITLE: δ=log s: the weight vector (δφ(j)) is g-subinvariant, also for truncations (3.7)-(3.9)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-use-gf-bded-infty@L1039-L1052
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-use-gf-bded-infty@L1040-L1052
CONTRACT_ID: paper.lem-fixed-liminf#subinvariant-weights
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: §3.2 setting S (countable-type X with (3.1), global extinction probability one, Assumptions I-IV with witnesses φ, ψ, s, t; full text in SOURCE_HYPOTHESES of lem-fixed-limsup) and the family λ^d of (3.6); in particular Assumption III with δ := log s>0 and φ:ℕ→[1,∞) from Assumption II
SOURCE_QUANTIFIERS: X; δ=log s>0; k∈ℕ for (3.7)-(3.8); d∈ℕ and k∈{1,…,d} for (3.9)
SOURCE_CONCLUSION: with δ=log s>0: 𝔼_k[exp(δΣ_{j≥1}φ(j)X_j(1))]≤e^{δφ(k)} for all k∈ℕ (3.7), equivalently g_k({δφ(j)}_{j∈ℕ})≤δφ(k) (3.8); consequently g^d_k(δφ(1),…,δφ(d))≤δφ(k) for all d∈ℕ and k∈{1,…,d} (3.9)
CONSTANT_SCOPE: δ=log s is the constant fixed here and used throughout the proof of Lemma 3.3
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: eqn-log-gf-infty, eqn-log-gf-truncated
ROUTES: -
ROUTE_FOR: -
EDGE: eqn-log-gf-infty | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-use-gf-bded-infty@L1045-L1048 | 'By the definition (3.5) of g_k, (3.7) is equivalent to' (3.8): g_k(λ)=log 𝔼_k[exp(Σ_jλ_jX_j(1))]
EDGE: eqn-log-gf-truncated | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-gf-truncated-strict@L1049-L1049 | 'By (3.2), this implies (3.9)': g^d_k(δφ(1),…,δφ(d))=g_k(δφ(1),…,δφ(d),0,0,…)≤g_k({δφ(j)}_j) since g_k is coordinatewise non-decreasing
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Assumption III is supplied by the root hypotheses. The comparison of the zero-padded vector with the full weight vector is routine monotonicity of g_k in each coordinate (X_j(1)≥0).

NODE: lem-fixed-liminf#iterate-subinvariant
KIND: application
TITLE: (3.10): g^{d,(n)}_k(δφ(1),…,δφ(d))≤δφ(k) for all n (monotonicity, Lemma 2.9)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-use-mono-infty@L1054-L1057
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-use-mono-infty@L1054-L1054
CONTRACT_ID: paper.lem-fixed-liminf#iterate-subinvariant
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: §3.2 setting S (countable-type X with (3.1), global extinction probability one, Assumptions I-IV with witnesses φ, ψ, s, t; full text in SOURCE_HYPOTHESES of thm-fixed-pt-infty); in particular Assumption I (each X^d satisfies the hypotheses of Theorem 1.4); δ=log s
SOURCE_QUANTIFIERS: X; d∈ℕ; n∈ℕ; k∈{1,…,d}
SOURCE_CONCLUSION: g^{d,(n)}_k(δφ(1),…,δφ(d))≤δφ(k) for all d,n∈ℕ and k∈{1,…,d}
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-mono, lem-fixed-liminf#subinvariant-weights
ROUTES: -
ROUTE_FOR: -
EDGE: lem-mono | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-use-mono-infty@L1054-L1054 | 'By the monotonicity of g^{d,(n)} (Lemma 2.9)': first assertion applied to X^d (premises: Assumption I, and λ≤η in [0,∞)^d) iterates the one-step bound
EDGE: lem-fixed-liminf#subinvariant-weights | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-use-mono-infty@L1054-L1056 | (3.9) is the one-step bound g^d(δφ)≤δφ that monotonicity iterates
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Premises of Lemma 2.9 for X^d are supplied by Assumption I (hypotheses of Theorem 1.4 for X^d); no node.

NODE: lem-fixed-liminf#orbit-decay
KIND: application
TITLE: (3.11): lim_n g^{d,(n)}(η)=0 for η below the weight vector (Proposition 2.10)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-liminf-zero@L1058-L1061
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-liminf-zero@L1058-L1058
CONTRACT_ID: paper.lem-fixed-liminf#orbit-decay
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: §3.2 setting S (countable-type X with (3.1), global extinction probability one, Assumptions I-IV with witnesses φ, ψ, s, t; full text in SOURCE_HYPOTHESES of thm-fixed-pt-infty); in particular Assumption I; δ=log s
SOURCE_QUANTIFIERS: X; d∈ℕ; η∈[0,δφ(1))×…×[0,δφ(d))
SOURCE_CONCLUSION: lim_{n→∞}g^{d,(n)}(η)=0 for every η∈[0,δφ(1))×…×[0,δφ(d))
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: prop-unstable, lem-fixed-liminf#iterate-subinvariant
ROUTES: -
ROUTE_FOR: -
EDGE: prop-unstable | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-liminf-zero@L1058-L1058 | 'By Proposition 2.10': assertion (i) with λ=(δφ(j))_{j≤d}∈[0,∞)^d∖{0} (φ≥1, δ>0) and η<λ coordinatewise; X^d satisfies the Theorem 1.4 setting by Assumption I
EDGE: lem-fixed-liminf#iterate-subinvariant | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-liminf-zero@L1058-L1058 | (3.10) gives 0≤g^{d,(n)}(λ)≤λ for all n, the boundedness premise limsup_n of the norm of g^{(n)}(λ) being finite in Proposition 2.10(i)
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Premises of Proposition 2.10(i): λ∈[0,∞)^d∖{0} and η<λ are immediate from φ≥1, δ>0 and the box; the boundedness premise is (3.10).

NODE: lem-fixed-liminf#step1
KIND: step
TITLE: Step 1: for each d there is k(d)∈{1,…,d} with λ^d_{k(d)}≥δφ(k(d)) (3.12)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-one-coord@L1038-L1065
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-one-coord@L1062-L1065
CONTRACT_ID: paper.lem-fixed-liminf#step1
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: §3.2 setting S (countable-type X with (3.1), global extinction probability one, Assumptions I-IV with witnesses φ, ψ, s, t; full text in SOURCE_HYPOTHESES of lem-fixed-limsup) and the family λ^d of (3.6); δ=log s
SOURCE_QUANTIFIERS: X; d∈ℕ; ∃k(d)∈{1,…,d}
SOURCE_CONCLUSION: for each d∈ℕ there exists k(d)∈{1,…,d} such that λ^d_{k(d)}≥δφ(k(d)) (3.12)
CONSTANT_SCOPE: k(d) depends on d and on the selection; no uniformity in d is asserted
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-fixed-liminf#orbit-decay
ROUTES: -
ROUTE_FOR: -
EDGE: lem-fixed-liminf#orbit-decay | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-one-coord@L1062-L1065 | 'Since g^{d,(n)}(λ^d)=λ^d for every n, it follows from (3.11)': if λ^d_k<δφ(k) for all k then λ^d lies in the box of (3.11) and g^{d,(n)}(λ^d)→0, contradicting g^{d,(n)}(λ^d)=λ^d∈(0,∞)^d
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: A lower bound for at least one value of k. λ^d∈(0,∞)^d and g^d(λ^d)=λ^d are the (3.6) hypotheses of the lemma; the contradiction argument is routine given (3.11).

NODE: lem-fixed-liminf#growth-compare
KIND: step
TITLE: (3.13): λ^d_k ≤ log ψ(k)+φ(k)λ^d_1 for k≤d (Assumption II)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-exp-bd@L1069-L1078
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-exp-bd@L1071-L1078
CONTRACT_ID: paper.lem-fixed-liminf#growth-compare
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: §3.2 setting S (countable-type X with (3.1), global extinction probability one, Assumptions I-IV with witnesses φ, ψ, s, t; full text in SOURCE_HYPOTHESES of lem-fixed-limsup) and the family λ^d of (3.6); in particular Assumption II (f_k(q)≤ψ(k)[f_1(q)]^{φ(k)} for all q∈[1,∞)^ℕ)
SOURCE_QUANTIFIERS: X; d∈ℕ; k∈{1,…,d}
SOURCE_CONCLUSION: for every d∈ℕ and k∈{1,…,d}: λ^d_k=g^d_k(λ^d)=g_k(λ^d_1,…,λ^d_d,0,0,…) ≤ log ψ(k)+φ(k)g_1(λ^d_1,…,λ^d_d,0,0,…) = log ψ(k)+φ(k)λ^d_1 (3.13); E4: the source prints the tail arguments of g_k as 1,1,…; read as 0,0,…
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: eqn-log-gf-truncated, eqn-log-gf-infty
ROUTES: -
ROUTE_FOR: -
EDGE: eqn-log-gf-truncated | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-exp-bd@L1074-L1077 | '(by (3.2))' and '(definition of λ^d and (3.2))': g^d_k(λ^d)=g_k(λ^d,0,0,…) for the index k and for the index 1
EDGE: eqn-log-gf-infty | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-exp-bd@L1076-L1076 | '(by Assumption II)': f_k(q)≤ψ(k)[f_1(q)]^{φ(k)} at q=e^{(λ^d,0,0,…)}∈[1,∞)^ℕ becomes g_k≤log ψ(k)+φ(k)g_1 after taking log (g=log f(exp))
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Assumption II is supplied by the root hypotheses. The inequality is the log form of Assumption II applied at a vector with non-negative coordinates.

NODE: lem-fixed-liminf#choose-K
KIND: step
TITLE: Choice of K (independent of d) with log ψ(k)≤(δ/2)φ(k) for all k≥K
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-liminf@L1080-L1083
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-liminf@L1080-L1083
CONTRACT_ID: paper.lem-fixed-liminf#choose-K
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Assumption II: lim_{k→∞}log ψ(k)/φ(k)=0 with φ≥1; δ=log s>0 from Assumption III
SOURCE_QUANTIFIERS: δ>0; ∃K∈ℕ (not depending on d); ∀k≥K
SOURCE_CONCLUSION: there exists K∈ℕ (not depending on d) such that log ψ(k)≤(δ/2)φ(k) for all k≥K
CONSTANT_SCOPE: K depends only on φ, ψ and δ=log s; independent of d and of the selection (λ^d)
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Witness choice from lim log ψ(k)/φ(k)=0 (display (3.3), inventory item inv:eqn-weight-function) with tolerance δ/2; Assumption II is supplied by the root hypotheses. K≥1, so index 1 lies in {1,…,K} (used in #step2).

NODE: lem-fixed-liminf#case-small-k
KIND: step
TITLE: Case k(d)≤K-1: max_{k≤K}λ^d_k≥δ
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-liminf@L1084-L1087
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-liminf@L1084-L1087
CONTRACT_ID: paper.lem-fixed-liminf#case-small-k
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: §3.2 setting S (countable-type X with (3.1), global extinction probability one, Assumptions I-IV with witnesses φ, ψ, s, t; full text in SOURCE_HYPOTHESES of lem-fixed-limsup) and the family λ^d of (3.6)
SOURCE_QUANTIFIERS: X; K the witness of lem-fixed-liminf#choose-K; d∈ℕ with k(d)≤K-1, where k(d)∈{1,…,d} is the index of lem-fixed-liminf#step1 (λ^d_{k(d)}≥δφ(k(d)), (3.12))
SOURCE_CONCLUSION: if k(d)≤K-1 then max_{k∈{1,…,K}}λ^d_k ≥ λ^d_{k(d)} ≥ δφ(k(d)) ≥ δ
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-fixed-liminf#step1, lem-fixed-liminf#choose-K
ROUTES: -
ROUTE_FOR: -
EDGE: lem-fixed-liminf#step1 | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-liminf@L1084-L1086 | (3.12): λ^d_{k(d)}≥δφ(k(d)), with φ≥1 giving ≥δ; k(d)≤K-1 puts k(d) in {1,…,K}
EDGE: lem-fixed-liminf#choose-K | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-liminf@L1084-L1084 | K defines the case boundary k(d)≤K-1 and the index set {1,…,K}
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: First half of the case split on k(d) (spec §6: case split); routine given (3.12).

NODE: lem-fixed-liminf#case-large-k
KIND: step
TITLE: Case k(d)≥K: λ^d_1≥δ/2 (3.14)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-coord-compare@L1089-L1096
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-coord-compare@L1089-L1096
CONTRACT_ID: paper.lem-fixed-liminf#case-large-k
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: §3.2 setting S (countable-type X with (3.1), global extinction probability one, Assumptions I-IV with witnesses φ, ψ, s, t; full text in SOURCE_HYPOTHESES of lem-fixed-limsup) and the family λ^d of (3.6)
SOURCE_QUANTIFIERS: X; K the witness of lem-fixed-liminf#choose-K; d∈ℕ with k(d)≥K, where k(d)∈{1,…,d} is the index of lem-fixed-liminf#step1 (λ^d_{k(d)}≥δφ(k(d)), (3.12))
SOURCE_CONCLUSION: if k(d)≥K then log ψ(k(d))+φ(k(d))λ^d_1 ≥ λ^d_{k(d)} ≥ δφ(k(d)) (3.14), and since log ψ(k(d))≤(δ/2)φ(k(d)), λ^d_1≥δ/2
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-fixed-liminf#growth-compare, lem-fixed-liminf#step1, lem-fixed-liminf#choose-K
ROUTES: -
ROUTE_FOR: -
EDGE: lem-fixed-liminf#growth-compare | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-coord-compare@L1089-L1091 | 'we combine (3.12) and (3.13)': (3.13) with k=k(d) gives the left inequality of (3.14)
EDGE: lem-fixed-liminf#step1 | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-coord-compare@L1089-L1091 | (3.12) gives the right inequality λ^d_{k(d)}≥δφ(k(d))
EDGE: lem-fixed-liminf#choose-K | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-coord-compare@L1093-L1093 | 'By our choice of K, we have log ψ(k(d))≤(δ/2)φ(k(d))' since k(d)≥K, giving λ^d_1≥δ/2 after dividing by φ(k(d))≥1
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Second half of the case split on k(d).

NODE: lem-fixed-liminf#step2
KIND: step
TITLE: Step 2: max_{k≤K}λ^d_k≥δ/2 for all d (transfer to a bounded index)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-liminf@L1067-L1096
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-liminf@L1067-L1096
CONTRACT_ID: paper.lem-fixed-liminf#step2
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: §3.2 setting S (countable-type X with (3.1), global extinction probability one, Assumptions I-IV with witnesses φ, ψ, s, t; full text in SOURCE_HYPOTHESES of lem-fixed-limsup) and the family λ^d of (3.6)
SOURCE_QUANTIFIERS: X; K the witness of lem-fixed-liminf#choose-K; ∀d∈ℕ (d≥K so that the indices ≤K make sense)
SOURCE_CONCLUSION: for every d≥K: max_{k∈{1,…,K}}λ^d_k ≥ δ/2; hence liminf_{d→∞}max_{k≤K}λ^d_k ≥ δ/2>0
CONSTANT_SCOPE: δ/2 does not depend on d
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-fixed-liminf#case-small-k, lem-fixed-liminf#case-large-k, lem-fixed-liminf#choose-K
ROUTES: -
ROUTE_FOR: -
EDGE: lem-fixed-liminf#case-small-k | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-liminf@L1084-L1087 | first case of the dichotomy k(d)≤K-1 versus k(d)≥K
EDGE: lem-fixed-liminf#case-large-k | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-liminf@L1089-L1096 | second case; λ^d_1≥δ/2 and 1∈{1,…,K}
EDGE: lem-fixed-liminf#choose-K | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-liminf@L1080-L1083 | K≥1 is the cut-off of the dichotomy and the size of the index set {1,…,K}
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: The paper never writes the final inequality: Step 2 ends at λ^d_1≥δ/2 (L1095) and L1068 says (3.12) would give the lemma if k(d) were bounded. The liminf conclusion follows from the two cases (max≥δ in case 1; max≥λ^d_1≥δ/2 in case 2, since 1∈{1,…,K}). This closing inference is below the step threshold and is not a gap node.

NODE: lem-1d-soln
KIND: lemma
TITLE: Lemma 3.4: single-type fixed point η_k and d-uniform upper bounds on λ^d_k
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-1d-soln@L1101-L1115
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-1d-soln@L1116-L1145
CONTRACT_ID: paper.lem-1d-soln
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X = {X(n)}_{n∈ℕ_0} is a countable-type branching process with types k∈ℕ and finite offspring (3.1): ℙ_k[Σ_{j≥1} X_j(1)<∞]=1 for every k∈ℕ; X has global extinction probability one (L958; read as for every starting type k); Assumption I: for each d∈ℕ the truncation X^d satisfies the hypotheses of Theorem 1.4 (subcritical; positive regular and non-singular; f^d_k continuous from (0,∞]^d to (0,∞] for each k∈{1,…,d}); Assumption II: there exist φ,ψ:ℕ→[1,∞) with lim_{k→∞}φ(k)=∞ and lim_{k→∞}log ψ(k)/φ(k)=0 such that f_k(q)≤ψ(k)[f_1(q)]^{φ(k)} for all k∈ℕ and all q∈[1,∞)^ℕ; Assumption III: there exists s>1 with 𝔼_k[s^{Σ_{j≥1}φ(j)X_j(1)}]≤s^{φ(k)} for all k∈ℕ; Assumption IV: there exists t>1 with f_1(t,1,1,…)>t and f_k({ψ(j)t^{φ(j)}}_{j∈ℕ})<∞ for all k∈ℕ; for each d∈ℕ, λ^d=(λ^d_1,…,λ^d_d)∈(0,∞)^d satisfies g^d(λ^d)=λ^d (3.6), selected arbitrarily when g^d has several fixed points in (0,∞)^d; g, g^d as in (3.5); k∈ℕ with ℙ_k[X_k(1)≥2]>0 (which in particular holds for k=1) for the first two assertions
SOURCE_QUANTIFIERS: §3.2 setting; selection (λ^d)_d; k∈ℕ with ℙ_k[X_k(1)≥2]>0; (a) ∃!η_k∈(0,∞): g_k(0,…,0,η_k,0,0,…)=η_k; (b) ∀d≥k: λ^d_k≤η_k; (c) with t>1 as in Assumption IV and φ,ψ as in Assumption II: ∀ integers d≥k≥1: λ^d_k≤φ(k)log t+log ψ(k)
SOURCE_CONCLUSION: (a) there is a unique η_k∈(0,∞) with g_k(0,…,0,η_k,0,0,…)=η_k (3.15), the input of g_k having 0 in every component except the k-th, which is η_k; (b) λ^d_k≤η_k for each d≥k (3.16); (c) λ^d_k≤φ(k)log t+log ψ(k) for all integers d≥k≥1 (3.17); the condition ℙ_k[X_k(1)≥2]>0 holds in particular for k=1
CONSTANT_SCOPE: η_k depends on X and k only (not on d and not on the selection); the right side of (3.17) depends on φ, ψ, t and k only
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-1d-soln#k1-nonsingular, lem-1d-soln#apply-prop-1-6, lem-1d-soln#bound-by-eta, lem-1d-soln#growth-bound
ROUTES: -
ROUTE_FOR: -
EDGE: lem-1d-soln#k1-nonsingular | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-1d-soln@L1117-L1117 | the first sentence of the proof ('ℙ_1[X_1(1)≥2]>0 since X^1 satisfies the hypotheses of Theorem 1.4') backs 'which in particular holds for k=1'
EDGE: lem-1d-soln#apply-prop-1-6 | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-1d-soln@L1119-L1125 | first assertion (3.15): unique η_k from Proposition 1.6 applied to the single-type process X̃^k
EDGE: lem-1d-soln#bound-by-eta | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-1d-soln@L1127-L1134 | second assertion (3.16)
EDGE: lem-1d-soln#growth-bound | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-1d-soln@L1136-L1144 | third assertion (3.17)
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Quantifier scoping: the hypothesis ℙ_k[X_k(1)≥2]>0 introduces k for (3.15)-(3.16); (3.17) re-quantifies over all integers d≥k≥1 (it uses η_1, available because ℙ_1[X_1(1)≥2]>0). The proof prints For each k≥d at L1127; read as d≥k (see graph/packets/slice-D.md, section Report).

NODE: lem-1d-soln#k1-nonsingular
KIND: step
TITLE: ℙ_1[X_1(1)≥2]>0 (non-singularity of X^1)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-1d-soln@L1117-L1117
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-1d-soln@L1117-L1117
CONTRACT_ID: paper.lem-1d-soln#k1-nonsingular
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Assumption I for d=1: the one-type truncation X^1 satisfies the hypotheses of Theorem 1.4 (in particular is non-singular)
SOURCE_QUANTIFIERS: X; d=1
SOURCE_CONCLUSION: ℙ_1[X_1(1)≥2]>0
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: def-bp-basic.non-singular, def:truncation
ROUTES: -
ROUTE_FOR: -
EDGE: def-bp-basic.non-singular | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-1d-soln@L1117-L1117 | 'so in particular it is non-singular': for the one-type process X^1 non-singularity reads ℙ_1[X^1_1(1)≥2]>0
EDGE: def:truncation | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-1d-soln@L1117-L1117 | X^1_1(1)=X_1(1) under ℙ_1 (the truncation keeps type-1 offspring), so the inequality transfers from X^1 to X
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Assumption I is supplied by the root hypotheses.

NODE: lem-1d-soln#single-type-process
KIND: step
TITLE: Single-type process X̃^k (all types ≠k killed) with generating function f̃_k(x)=f_k(1,…,1,x,1,1,…)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-1d-soln@L1119-L1124
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-1d-soln@L1120-L1124
CONTRACT_ID: paper.lem-1d-soln#single-type-process
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: X countable-type branching process with generating function f; k∈ℕ
SOURCE_QUANTIFIERS: X; k∈ℕ; x∈(0,∞]
SOURCE_CONCLUSION: X̃^k is the single-type branching process obtained from X by immediately killing all individuals of type j∈ℕ∖{k} (an individual of X corresponds to one of X̃^k iff it and all of its ancestors have type k); its generating function is f̃_k(x)=f_k(1,…,1,x,1,1,…), the input of f_k having 1 in every component except the k-th, which is x
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: eqn-gf-truncated, eqn-generating-function
ROUTES: -
ROUTE_FOR: -
EDGE: eqn-gf-truncated | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-1d-soln@L1120-L1120 | 'Similarly as in (3.2)': killing types sets the corresponding arguments of f_k to 1
EDGE: eqn-generating-function | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-1d-soln@L1120-L1124 | f_k is the countable-type generating function; f̃_k is its restriction to the k-th axis through (1,1,…)
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Construction / carrier change (many-type to one-type) asserted by analogy with (3.2); not flagged as a gap (a one-line restriction).

NODE: lem-1d-soln#single-type-subcritical
KIND: step
TITLE: X̃^k is subcritical (mean offspring number <1)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-1d-soln@L1125-L1125
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-1d-soln@L1125-L1125
CONTRACT_ID: paper.lem-1d-soln#single-type-subcritical
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Assumption I for d=k: X^k satisfies the hypotheses of Theorem 1.4 (in particular is subcritical)
SOURCE_QUANTIFIERS: X; k∈ℕ
SOURCE_CONCLUSION: X̃^k is subcritical, i.e. its mean offspring number 𝔼_k[X_k(1)] is <1
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-1d-soln#single-type-process, def:subcritical
ROUTES: -
ROUTE_FOR: -
EDGE: lem-1d-soln#single-type-process | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-1d-soln@L1125-L1125 | the single-type process whose subcriticality is asserted
EDGE: def:subcritical | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-1d-soln@L1125-L1125 | 'it is immediate that X̃^k is subcritical': for a single type subcritical means mean offspring <1 (the 1×1 mean matrix has spectral radius 𝔼_k[X_k(1)]), to be deduced from subcriticality of X^k
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: it is immediate with no argument. The deduction (the (k,k) diagonal entry of the k×k mean matrix of X^k is at most its spectral radius, which is <1) is not written. Assumption I is supplied by the root hypotheses.

NODE: lem-1d-soln#single-type-continuous
KIND: step
TITLE: f̃_k is continuous from (0,∞] to [0,∞]
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-1d-soln@L1125-L1125
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-1d-soln@L1125-L1125
CONTRACT_ID: paper.lem-1d-soln#single-type-continuous
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Assumption I for d=k: f^k_k is continuous from (0,∞]^k to (0,∞]
SOURCE_QUANTIFIERS: X; k∈ℕ
SOURCE_CONCLUSION: f̃_k is continuous from (0,∞] to [0,∞] (as printed at L1125)
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-1d-soln#single-type-process, eqn-gf-truncated
ROUTES: -
ROUTE_FOR: -
EDGE: lem-1d-soln#single-type-process | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-1d-soln@L1125-L1125 | defines f̃_k as a restriction of f_k
EDGE: eqn-gf-truncated | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-1d-soln@L1120-L1125 | by (3.2) with d=k, f̃_k(x)=f_k(1,…,1,x,1,…)=f^k_k(1,…,1,x), the restriction of f^k_k, continuous by Assumption I (hypothesis (III) of Theorem 1.4 for X^k)
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: it is immediate that f̃_k is continuous, with no argument. Codomain: the source prints [0,∞], while hypothesis (III) of Proposition 1.6 asks for (0,∞]; the values lie in (0,∞] since f̃_k(x)=𝔼_k[x^{X_k(1)}]>0, which the source does not write.

NODE: lem-1d-soln#apply-prop-1-6
KIND: application
TITLE: Proposition 1.6 applied to X̃^k: unique η_k=log q (3.15)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-1d-soln@L1102-L1106
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-1d-soln@L1125-L1125
CONTRACT_ID: paper.lem-1d-soln#apply-prop-1-6
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: k∈ℕ with ℙ_k[X_k(1)≥2]>0; Assumption I for d=k (X^k satisfies the hypotheses of Theorem 1.4); g as in (3.5)
SOURCE_QUANTIFIERS: X; k∈ℕ with ℙ_k[X_k(1)≥2]>0; ∃!η_k∈(0,∞)
SOURCE_CONCLUSION: there is a unique η_k∈(0,∞) with g_k(0,…,0,η_k,0,0,…)=η_k (3.15); η_k is the logarithm of the unique q∈(1,∞) with f̃_k(q)=q given by Proposition 1.6 for X̃^k
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: prop-single-type.fixed-point, lem-1d-soln#single-type-process, lem-1d-soln#single-type-subcritical, lem-1d-soln#single-type-continuous, eqn-log-gf-infty
ROUTES: -
ROUTE_FOR: -
EDGE: prop-single-type.fixed-point | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-1d-soln@L1125-L1125 | 'That proposition then gives us the desired unique solution': hypothesis (II) of Proposition 1.6 is ℙ_k[X_k(1)≥2]>0 (the lemma hypothesis); (I) and (III) are discharged by #single-type-subcritical and #single-type-continuous
EDGE: lem-1d-soln#single-type-process | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-1d-soln@L1120-L1125 | X̃^k and f̃_k are the single-type process and generating function to which Proposition 1.6 is applied
EDGE: lem-1d-soln#single-type-subcritical | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-1d-soln@L1125-L1125 | discharges hypothesis (I) of Proposition 1.6
EDGE: lem-1d-soln#single-type-continuous | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-1d-soln@L1125-L1125 | discharges hypothesis (III) of Proposition 1.6
EDGE: eqn-log-gf-infty | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-1d-soln@L1125-L1125 | 'η_k is the log of the solution q': g_k(0,…,η,…,0)=log f_k(1,…,e^η,…,1)=log f̃_k(e^η), so g_k(…η_k…)=η_k iff f̃_k(e^{η_k})=e^{η_k}; η>0 iff q=e^η>1
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: E7: the q>1 of Proposition 1.6 means q∈(1,∞). Uniqueness of η_k in (0,∞) corresponds to uniqueness of q in (1,∞). Hypothesis (II) of Proposition 1.6, ℙ[X̃^k(1)≥2]>0, is the lemma own hypothesis (X̃^k(1)=X_k(1) under ℙ_k).

NODE: lem-1d-soln#convexity
KIND: step
TITLE: f̃_k is convex (second derivative positive) with f̃_k(1)=1
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-1d-soln@L1134-L1134
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-1d-soln@L1134-L1134
CONTRACT_ID: paper.lem-1d-soln#convexity
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: k∈ℕ with ℙ_k[X_k(1)≥2]>0; f̃_k the generating function of X̃^k
SOURCE_QUANTIFIERS: X; k; x in the interval where f̃_k is finite
SOURCE_CONCLUSION: f̃_k is convex (its second derivative is positive) and satisfies f̃_k(1)=1
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-1d-soln#single-type-process
ROUTES: -
ROUTE_FOR: -
EDGE: lem-1d-soln#single-type-process | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-1d-soln@L1134-L1134 | 'Since f̃_k is convex (its second derivative is positive)': convexity of the generating function f̃_k of X̃^k
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: positivity of f̃_k second derivative is asserted in a parenthesis with no computation (it needs ℙ_k[X_k(1)≥2]>0 and finiteness). The same claim is the SOURCE_GAP node prop-single-type#strict-convexity of slice A (inside the proof of Proposition 1.6); the source of Lemma 3.4 does not cite it, so no edge. Where f̃_k=∞ convexity is meant in the extended sense; only [1,e^{η_k}] and its right neighbourhood are used.

NODE: lem-1d-soln#diagonal-position
KIND: step
TITLE: Position of f̃_k relative to the diagonal: f̃_k(x)>x for x>e^{η_k}; f̃_k(x)≤x on [1,e^{η_k}]
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-1d-soln@L1134-L1136
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-1d-soln@L1134-L1136
CONTRACT_ID: paper.lem-1d-soln#diagonal-position
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: k∈ℕ with ℙ_k[X_k(1)≥2]>0
SOURCE_QUANTIFIERS: X; k; η_k the unique solution of (3.15) supplied by lem-1d-soln#apply-prop-1-6 (f̃_k(e^{η_k})=e^{η_k}); x≥1
SOURCE_CONCLUSION: since f̃_k is convex with f̃_k(1)=1 and f̃_k(e^{η_k})=e^{η_k}: x<f̃_k(x) for all x>e^{η_k} (L1134), and f̃_k(x)≤x for all x∈[1,e^{η_k}] (stated at L1136 for k=1)
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-1d-soln#convexity, lem-1d-soln#apply-prop-1-6
ROUTES: -
ROUTE_FOR: -
EDGE: lem-1d-soln#convexity | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-1d-soln@L1134-L1134 | 'Since f̃_k is convex … and satisfies f̃_k(1)=1': convexity together with the two diagonal points 1 and e^{η_k} gives the position relative to the diagonal
EDGE: lem-1d-soln#apply-prop-1-6 | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-1d-soln@L1134-L1134 | supplies η_k with f̃_k(e^{η_k})=e^{η_k}
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: The inequality f̃_k(x)≤x on [1,e^{η_k}] is stated in the source only for k=1 (L1136, By convexity); the same convexity argument gives it for every k. Reused by #bound-by-eta (strict part) and #eta1-lt-log-t (≤ part).

NODE: lem-1d-soln#bound-by-eta
KIND: step
TITLE: (3.18) and (3.16): λ^d_k≤η_k for d≥k
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-1d-soln-ineq@L1107-L1110
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-first-coord@L1127-L1134
CONTRACT_ID: paper.lem-1d-soln#bound-by-eta
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: §3.2 setting S (countable-type X with (3.1), global extinction probability one, Assumptions I-IV with witnesses φ, ψ, s, t; full text in SOURCE_HYPOTHESES of lem-fixed-limsup) and the family λ^d of (3.6); k∈ℕ with ℙ_k[X_k(1)≥2]>0; d≥k
SOURCE_QUANTIFIERS: X; k with ℙ_k[X_k(1)≥2]>0; η_k of (3.15); d≥k
SOURCE_CONCLUSION: for d≥k: e^{λ^d_k}=f_k(e^{λ^d_1},…,e^{λ^d_d},1,1,…) ≥ f_k(1,…,1,e^{λ^d_k},1,1,…)=f̃_k(e^{λ^d_k}) (3.18); since x<f̃_k(x) for x>e^{η_k}, λ^d_k≤η_k (3.16)
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-1d-soln#diagonal-position, eqn-gf-truncated, eqn-log-gf-infty, lem-1d-soln#single-type-process
ROUTES: -
ROUTE_FOR: -
EDGE: lem-1d-soln#diagonal-position | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-first-coord@L1134-L1134 | 'we have x<f̃_k(x) for all x>e^{η_k}. Hence (3.18) implies λ^d_k≤η_k': f̃_k(e^{λ^d_k})≤e^{λ^d_k} excludes e^{λ^d_k}>e^{η_k}
EDGE: eqn-gf-truncated | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-first-coord@L1129-L1130 | 'the definition (3.6) of λ^d': e^{λ^d_k}=f^d_k(e^{λ^d})=f_k(e^{λ^d_1},…,e^{λ^d_d},1,1,…) by (3.2)
EDGE: eqn-log-gf-infty | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-first-coord@L1129-L1130 | g^d(λ^d)=λ^d means f^d(e^{λ^d})=e^{λ^d}, with g^d=log f^d(exp) of (3.5)
EDGE: lem-1d-soln#single-type-process | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-first-coord@L1131-L1132 | the last equality identifies f_k(1,…,1,e^{λ^d_k},1,…) with f̃_k(e^{λ^d_k})
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: The inequality f_k(e^{λ^d},1,…)≥f_k(1,…,e^{λ^d_k},1,…) is monotonicity of f_k in each coordinate on [1,∞) (all e^{λ^d_j}≥1 since λ^d_j>0): routine. Typo: For each k≥d at L1127 is read as d≥k.

NODE: lem-1d-soln#eta1-lt-log-t
KIND: step
TITLE: η_1<log t (from f̃_1(t)>t of Assumption IV)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-1d-soln-growth@L1136-L1136
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-1d-soln-growth@L1136-L1136
CONTRACT_ID: paper.lem-1d-soln#eta1-lt-log-t
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: Assumption IV: t>1 with f_1(t,1,1,…)>t
SOURCE_QUANTIFIERS: X; t>1 from Assumption IV; η_1 the solution of (3.15) for k=1 (supplied by lem-1d-soln#apply-prop-1-6, admissible by lem-1d-soln#k1-nonsingular)
SOURCE_CONCLUSION: η_1<log t
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-1d-soln#diagonal-position, lem-1d-soln#k1-nonsingular, lem-1d-soln#single-type-process
ROUTES: -
ROUTE_FOR: -
EDGE: lem-1d-soln#diagonal-position | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-1d-soln-growth@L1136-L1136 | 'By convexity, f̃_1(x)≤x for all x∈[1,e^{η_1}], so η_1<log t': f̃_1(t)>t with t>1 excludes t∈[1,e^{η_1}], hence t>e^{η_1}
EDGE: lem-1d-soln#k1-nonsingular | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-1d-soln-growth@L1136-L1136 | η_1 is defined by (3.15) for k=1, which requires ℙ_1[X_1(1)≥2]>0
EDGE: lem-1d-soln#single-type-process | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-1d-soln-growth@L1136-L1136 | 'by Assumption IV we have f̃_1(t)>t': f̃_1(t)=f_1(t,1,1,…) by the definition of f̃_k (L1120-L1124), the identification of Assumption IV with the one-type function to which diagonal-position applies
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Assumption IV is supplied by the root hypotheses: f̃_1(t)=f_1(t,1,1,…)>t.

NODE: lem-1d-soln#growth-bound
KIND: step
TITLE: (3.17): λ^d_k≤φ(k)log t+log ψ(k) for d≥k≥1
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-1d-soln-growth@L1111-L1114
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-1d-soln-growth@L1136-L1144
CONTRACT_ID: paper.lem-1d-soln#growth-bound
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: §3.2 setting S (countable-type X with (3.1), global extinction probability one, Assumptions I-IV with witnesses φ, ψ, s, t; full text in SOURCE_HYPOTHESES of lem-fixed-limsup) and the family λ^d of (3.6); in particular Assumption II (growth) and Assumption IV (t)
SOURCE_QUANTIFIERS: X; t, φ, ψ; integers d≥k≥1
SOURCE_CONCLUSION: for all integers d≥k≥1: λ^d_k=g_k(λ^d,0,0,…) ≤ φ(k)g_1(λ^d,0,0,…)+log ψ(k) = φ(k)λ^d_1+log ψ(k) ≤ φ(k)η_1+log ψ(k) ≤ φ(k)log t+log ψ(k)
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-1d-soln#eta1-lt-log-t, lem-1d-soln#bound-by-eta, eqn-log-gf-truncated, eqn-log-gf-infty
ROUTES: -
ROUTE_FOR: -
EDGE: lem-1d-soln#eta1-lt-log-t | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-1d-soln-growth@L1143-L1143 | last inequality: φ(k)η_1≤φ(k)log t since η_1<log t
EDGE: lem-1d-soln#bound-by-eta | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-1d-soln-growth@L1142-L1142 | '(by (3.16))': λ^d_1≤η_1, the case k=1 of (3.16)
EDGE: eqn-log-gf-truncated | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-1d-soln-growth@L1139-L1141 | '(by (3.6))': λ^d_k=g^d_k(λ^d)=g_k(λ^d,0,0,…) and λ^d_1=g_1(λ^d,0,0,…); the source writes 0,0,… here, consistent with E4
EDGE: eqn-log-gf-infty | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-1d-soln-growth@L1140-L1140 | '(by Assumption II)': f_k(q)≤ψ(k)[f_1(q)]^{φ(k)} for q=exp(λ^d,0,0,…)∈[1,∞)^ℕ becomes g_k≤log ψ(k)+φ(k)g_1 after taking log
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Assumptions II and IV are supplied by the root hypotheses. The (3.17) chain uses (3.16) only for k=1.

NODE: example-ctble
KIND: theorem
TITLE: Example 3.5: a class of countable-type processes satisfying the assumptions of Theorem 3.1
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1182-L1201
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1195-L1200
CONTRACT_ID: paper.ex3_5
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: ℙ_1 is a probability measure on sequences {X_j(1)}_{j∈ℕ} of non-negative integers satisfying (3.23): ℙ_1[X_j(1)≥1]>0 for all j∈ℕ; ℙ_1[X_1(1)≥2]>0; 𝔼_1[u^{Σ_{j≥1}jX_j(1)}]<∞ for all u>1; 𝔼_1[Σ_{j≥1}jX_j(1)]<1; for each k≥2, ℙ_k is a probability measure on such sequences satisfying (3.23) with ℙ_k, 𝔼_k in place of ℙ_1, 𝔼_1 (E8: all four conditions) and stochastically dominated by the componentwise sum of k i.i.d. samples from ℙ_1; X is the countable-type branching process whose offspring law of a type-k individual is ℙ_k, k∈ℕ
SOURCE_QUANTIFIERS: ℙ_1; ℙ_k for each k≥2; the branching process X with offspring laws {ℙ_k}_{k∈ℕ}; φ(k)=k and ψ(k)=1 (specified, not chosen); ∃s>1 and ∃t>1 with 𝔼_1[s^{Σ_jjX_j(1)}]<s and 𝔼_1[t^{X_1(1)}]>t; ∃q∈(1,∞)^ℕ
SOURCE_CONCLUSION: for the branching process with offspring distributions {ℙ_k}_{k∈ℕ} (ℙ_1-a.s. only finitely many X_j(1) non-zero, i.e. (3.1)) the assumptions of Theorem 3.1 are satisfied (global extinction probability one and Assumptions I-IV) with φ(k)=k, ψ(k)=1 and s,t>1 chosen so that 𝔼_1[s^{Σ_jjX_j(1)}]<s and 𝔼_1[t^{X_1(1)}]>t (such s and t exist, by (3.23)); thus Theorem 3.1 yields q∈(1,∞)^ℕ with f(q)=q (L1183: the example is a class where Theorem 3.1 implies the existence of a conjugate branching process)
CONSTANT_SCOPE: φ(k)=k and ψ(k)=1 are specified; s and t are chosen from ℙ_1 through the unnumbered display after (3.23), independent of k; q depends on the process only
FROZEN_FILE: Conjugate/Frozen/Example_3_5.lean
FROZEN_DECL: Conjugate.example_3_5
FROZEN_ANCHOR_ID: thm.example_3_5.v1
FROZEN_ABI_SHA256: 625ddeabe869ec4d90a0ad4400b19dbf048cdbc9e6c26909e7b081695f1f85a9
DEPS: example-ctble#finite-offspring, example-ctble#global-extinction, example-ctble#assume-I, example-ctble#assume-II, example-ctble#assume-III, example-ctble#assume-IV, example-ctble#choose-s, example-ctble#choose-t, example-ctble#apply-thm-3-1
ROUTES: -
ROUTE_FOR: -
EDGE: example-ctble#finite-offspring | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1195-L1195 | 'for the branching process with offspring distributions {ℙ_k}, the assumptions of Theorem 3.1 are satisfied': the example process is a countable-type process in the sense of §3.1 only if (3.1) holds, which is the Note at L1192 (the prerequisite's own site, not cited here)
EDGE: example-ctble#global-extinction | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1195-L1195 | 'the assumptions of Theorem 3.1 are satisfied': global extinction probability one is the standing hypothesis of §3.2 (L958)
EDGE: example-ctble#assume-I | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1195-L1195 | 'the assumptions of Theorem 3.1 are satisfied': Assumption I
EDGE: example-ctble#assume-II | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1195-L1195 | 'the assumptions of Theorem 3.1 are satisfied with φ(k)=k, ψ(k)=1': Assumption II
EDGE: example-ctble#assume-III | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1195-L1198 | '… and s,t>1 chosen so that': Assumption III with the chosen s
EDGE: example-ctble#assume-IV | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1195-L1199 | '… and s,t>1 chosen so that': Assumption IV with the chosen t
EDGE: example-ctble#choose-s | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1196-L1200 | '(existence of such an s and t follows easily from (3.23))': the existence of s with 𝔼_1[s^{Σ_jjX_j(1)}]<s is part of the claim
EDGE: example-ctble#choose-t | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1196-L1200 | '(existence of such an s and t follows easily from (3.23))': the existence of t with 𝔼_1[t^{X_1(1)}]>t is part of the claim
EDGE: example-ctble#apply-thm-3-1 | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1182-L1183 | 'a simple class of examples where Theorem 3.1 implies the existence of a conjugate branching process': application of Theorem 3.1 to this process
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Anchor root. The paper asserts the verification (One can easily verify …, follows easily from (3.23)) without proof: the child nodes #global-extinction, #assume-I..IV, #choose-s and #choose-t carry the gap markers; this root carries none itself. L1193 (a concrete example by sampling N and then uniform sequences) is an illustration with no claim and is not modeled. The text in the comment block L1204-L1213 is not part of the paper and is not used. The step from fixed point to conjugate branching process (L934, countable-type extension of Proposition 2.2) is excluded per spec §7 and not modeled.

NODE: example-ctble#finite-offspring
KIND: step
TITLE: (3.23) implies finitely many non-zero X_j(1) almost surely (finite offspring (3.1))
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1192-L1192
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1192-L1192
CONTRACT_ID: paper.example-ctble#finite-offspring
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: (3.23) for ℙ_1 (in particular 𝔼_1[Σ_{j≥1}jX_j(1)]<1) and, by E8, for each ℙ_k with k≥2
SOURCE_QUANTIFIERS: ℙ_1; ℙ_k for k≥2
SOURCE_CONCLUSION: ℙ_1-a.s. only finitely many of the random variables X_j(1) are non-zero (the source states this for ℙ_1; by E8 the same holds for every ℙ_k, so the example satisfies (3.1))
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Asserted by Note that, with no proof; immediate from 𝔼[Σ_jjX_j(1)]<1 (Σ_jjX_j(1)<∞ a.s., and X_j(1)≥1 contributes at least j≥1 to the sum), so below the step threshold: not flagged as a gap. Included because (3.1) is part of the countable-type setting of Theorem 3.1 and is invoked at L1160.

NODE: example-ctble#global-extinction
KIND: step
TITLE: The example process has global extinction probability one
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1195-L1195
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1195-L1195
CONTRACT_ID: paper.example-ctble#global-extinction
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: (3.23) for every ℙ_k; domination of ℙ_k (k≥2) by the componentwise sum of k i.i.d. samples from ℙ_1
SOURCE_QUANTIFIERS: the process X with offspring laws {ℙ_k}; k∈ℕ
SOURCE_CONCLUSION: the process has global extinction probability one: for every k∈ℕ, ℙ_k[lim_{n→∞}Σ_{j≥1}X_j(n)=0]=1 (the standing hypothesis of §3.2, L958, read for every starting type k)
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: def:extinction, def:stoch-dom
ROUTES: -
ROUTE_FOR: -
EDGE: def:extinction | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1195-L1195 | global extinction is the event defined at L930 (the manifest range of the anchor def:extinction covers L930); it is part of 'the assumptions of Theorem 3.1' (L958)
EDGE: def:stoch-dom | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1194-L1194 | the process is dominated by k i.i.d. copies of the type-1 mechanism, the only link between ℙ_k and ℙ_1
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: global extinction probability one is part of the assumptions of Theorem 3.1 (L958) but the example never mentions it, and no argument is given (the data are 𝔼_1[Σ_jjX_j(1)]<1 and the domination).

NODE: example-ctble#assume-I
KIND: step
TITLE: Assumption I holds: every truncation X^d satisfies the hypotheses of Theorem 1.4
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1195-L1195
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1195-L1195
CONTRACT_ID: paper.example-ctble#assume-I
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: (3.23) for every ℙ_k (E8); domination of ℙ_k (k≥2) by the componentwise sum of k i.i.d. samples from ℙ_1
SOURCE_QUANTIFIERS: X; d∈ℕ; k∈{1,…,d}
SOURCE_CONCLUSION: Assumption I: for each d∈ℕ the truncation X^d is subcritical, positive regular and non-singular and f^d_k is continuous from (0,∞]^d to (0,∞] for each k∈{1,…,d} (the hypotheses of Theorem 1.4)
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: def:truncation, def:stoch-dom, def:subcritical, def-bp-basic.positive-regular, def-bp-basic.non-singular
ROUTES: -
ROUTE_FOR: -
EDGE: def:truncation | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1195-L1195 | Assumption I concerns the truncations X^d of the example process
EDGE: def:stoch-dom | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1194-L1194 | domination is the only hypothesis on ℙ_k (k≥2) besides (3.23); it links the truncations of the example to ℙ_1
EDGE: def:subcritical | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1195-L1195 | obligation: X^d subcritical (spectral radius of its mean matrix <1) from 𝔼_1[Σ_jjX_j(1)]<1 and the domination
EDGE: def-bp-basic.positive-regular | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1195-L1195 | obligation: X^d positive regular, from ℙ_k[X_j(1)≥1]>0 for all j (applied to each k, E8)
EDGE: def-bp-basic.non-singular | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1195-L1195 | obligation: X^d non-singular, from ℙ_1[X_1(1)≥2]>0
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: One can easily verify with no argument. Unwritten sub-obligations: positive regularity, non-singularity, subcriticality of every X^d, and continuity of f^d_k from (0,∞]^d to (0,∞] (finite exponential moments of (3.23)). The comment block L1206-L1211 sketches such an argument but is not part of the paper and is not used.

NODE: example-ctble#assume-II
KIND: step
TITLE: Assumption II holds with φ(k)=k, ψ(k)=1
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1195-L1195
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1195-L1195
CONTRACT_ID: paper.example-ctble#assume-II
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: (3.23) for every ℙ_k (E8: all four conditions for each k); domination of ℙ_k (k≥2) by the componentwise sum of k i.i.d. samples from ℙ_1
SOURCE_QUANTIFIERS: X; φ(k)=k, ψ(k)=1; k∈ℕ; q∈[1,∞)^ℕ
SOURCE_CONCLUSION: Assumption II holds with φ(k)=k and ψ(k)=1: φ,ψ:ℕ→[1,∞), φ(k)→∞, log ψ(k)/φ(k)=0, and f_k(q)≤[f_1(q)]^k for all k∈ℕ and q∈[1,∞)^ℕ
CONSTANT_SCOPE: φ and ψ are the specified functions k and 1
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: def:stoch-dom
ROUTES: -
ROUTE_FOR: -
EDGE: def:stoch-dom | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1194-L1195 | obligation: f_k(q)≤[f_1(q)]^k for q∈[1,∞)^ℕ must follow from ℙ_k being dominated by the sum of k i.i.d. samples from ℙ_1 (x↦∏q_j^{x_j} is increasing for q≥1)
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: asserted by the sentence the assumptions of Theorem 3.1 are satisfied with φ(k)=k, ψ(k)=1; no argument. The comment block L1208 is not part of the paper and is not used.

NODE: example-ctble#assume-III
KIND: step
TITLE: Assumption III holds with φ(k)=k and the chosen s
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1195-L1198
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1195-L1198
CONTRACT_ID: paper.example-ctble#assume-III
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: (3.23) for every ℙ_k; domination of ℙ_k (k≥2) by the componentwise sum of k i.i.d. samples from ℙ_1
SOURCE_QUANTIFIERS: X; s>1 the witness of example-ctble#choose-s (𝔼_1[s^{Σ_jjX_j(1)}]<s); k∈ℕ
SOURCE_CONCLUSION: Assumption III holds with φ(k)=k and the chosen s>1: 𝔼_k[s^{Σ_{j≥1}jX_j(1)}]≤s^k for all k∈ℕ
CONSTANT_SCOPE: s is the one chosen from ℙ_1 (independent of k)
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: def:stoch-dom, example-ctble#choose-s
ROUTES: -
ROUTE_FOR: -
EDGE: def:stoch-dom | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1194-L1195 | obligation: for k≥2 the bound must come from ℙ_k being dominated by k i.i.d. samples from ℙ_1
EDGE: example-ctble#choose-s | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1195-L1198 | supplies s with 𝔼_1[s^{Σ_jjX_j(1)}]<s, the case k=1 and the base for the other k
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: asserted with no argument; the passage from the type-1 inequality to all k is not written.

NODE: example-ctble#assume-IV
KIND: step
TITLE: Assumption IV holds with ψ(k)=1, φ(k)=k and the chosen t
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1195-L1199
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1195-L1199
CONTRACT_ID: paper.example-ctble#assume-IV
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: (3.23) for every ℙ_k (finite exponential moments); domination of ℙ_k (k≥2) by the componentwise sum of k i.i.d. samples from ℙ_1
SOURCE_QUANTIFIERS: X; t>1 the witness of example-ctble#choose-t (𝔼_1[t^{X_1(1)}]>t); k∈ℕ
SOURCE_CONCLUSION: Assumption IV holds with ψ(k)=1, φ(k)=k and the chosen t>1: f_1(t,1,1,…)>t and f_k({t^j}_{j∈ℕ})<∞ for all k∈ℕ
CONSTANT_SCOPE: t is the one chosen from ℙ_1 (independent of k)
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: def:stoch-dom, example-ctble#choose-t, eqn-generating-function
ROUTES: -
ROUTE_FOR: -
EDGE: def:stoch-dom | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1194-L1195 | obligation: finiteness of f_k({t^j}) for k≥2 must come from domination by k i.i.d. samples from ℙ_1 plus the finite exponential moments of (3.23)
EDGE: example-ctble#choose-t | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1195-L1199 | supplies t with 𝔼_1[t^{X_1(1)}]>t
EDGE: eqn-generating-function | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1195-L1199 | f_1(t,1,1,…)=𝔼_1[t^{X_1(1)}] by the definition of f, so the first condition of Assumption IV is the second inequality of the display
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: asserted with no argument (finiteness of f_k({t^j}_j) for every k).

NODE: example-ctble#choose-s
KIND: step
TITLE: Existence of s>1 with 𝔼_1[s^{Σ_jjX_j(1)}]<s
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1195-L1200
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1200-L1200
CONTRACT_ID: paper.example-ctble#choose-s
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: (3.23) for ℙ_1, all four conditions: ℙ_1[X_j(1)≥1]>0 for all j∈ℕ; ℙ_1[X_1(1)≥2]>0; 𝔼_1[u^{Σ_{j≥1}jX_j(1)}]<∞ for all u>1; 𝔼_1[Σ_{j≥1}jX_j(1)]<1 (the source says only that existence 'follows easily from (3.23)')
SOURCE_QUANTIFIERS: ℙ_1; ∃s>1
SOURCE_CONCLUSION: there exists s>1 with 𝔼_1[s^{Σ_{j≥1}jX_j(1)}]<s
CONSTANT_SCOPE: s depends on ℙ_1 only
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: existence of such an s and t follows easily from (3.23): asserted, with no argument (witness choice). Fields from the display L1197.

NODE: example-ctble#choose-t
KIND: step
TITLE: Existence of t>1 with 𝔼_1[t^{X_1(1)}]>t
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1195-L1200
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1200-L1200
CONTRACT_ID: paper.example-ctble#choose-t
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: (3.23) for ℙ_1, all four conditions: ℙ_1[X_j(1)≥1]>0 for all j∈ℕ; ℙ_1[X_1(1)≥2]>0; 𝔼_1[u^{Σ_{j≥1}jX_j(1)}]<∞ for all u>1; 𝔼_1[Σ_{j≥1}jX_j(1)]<1 (the source says only that existence 'follows easily from (3.23)')
SOURCE_QUANTIFIERS: ℙ_1; ∃t>1
SOURCE_CONCLUSION: there exists t>1 with 𝔼_1[t^{X_1(1)}]>t
CONSTANT_SCOPE: t depends on ℙ_1 only
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: existence of such an s and t follows easily from (3.23): asserted, with no argument (witness choice). Fields from the display L1198.

NODE: example-ctble#apply-thm-3-1
KIND: application
TITLE: Theorem 3.1 applied to the example process
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1182-L1183
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1183-L1195
CONTRACT_ID: paper.example-ctble#apply-thm-3-1
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: the branching process X with offspring laws {ℙ_k}_{k∈ℕ} of Example 3.5 (types ℕ)
SOURCE_QUANTIFIERS: X (the example process); ∃q∈(1,∞)^ℕ
SOURCE_CONCLUSION: Theorem 3.1 applies to the example process and gives q∈(1,∞)^ℕ with f(q)=q
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: thm-fixed-pt-infty, example-ctble#finite-offspring, example-ctble#global-extinction, example-ctble#assume-I, example-ctble#assume-II, example-ctble#assume-III, example-ctble#assume-IV
ROUTES: -
ROUTE_FOR: -
EDGE: thm-fixed-pt-infty | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1183-L1183 | 'where Theorem 3.1 implies the existence of a conjugate branching process'
EDGE: example-ctble#finite-offspring | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1195-L1195 | 'the assumptions of Theorem 3.1 are satisfied': (3.1) is part of the countable-type setting of Theorem 3.1 (L915-L918); it is verified for the example by the Note at L1192 (the prerequisite's own site, not cited here)
EDGE: example-ctble#global-extinction | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1195-L1195 | premise 'global extinction probability one' of Theorem 3.1
EDGE: example-ctble#assume-I | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1195-L1195 | premise: Assumption I of Theorem 3.1
EDGE: example-ctble#assume-II | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1195-L1195 | premise: Assumption II of Theorem 3.1 with φ(k)=k, ψ(k)=1
EDGE: example-ctble#assume-III | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1195-L1198 | premise: Assumption III of Theorem 3.1 with the chosen s
EDGE: example-ctble#assume-IV | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1195-L1199 | premise: Assumption IV of Theorem 3.1 with the chosen t
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: Premise discharge for Theorem 3.1: (3.1) by #finite-offspring; global extinction by #global-extinction; Assumptions I-IV by #assume-I..IV with φ(k)=k, ψ(k)=1 and the s,t of #choose-s and #choose-t (carried through #assume-III and #assume-IV). The fixed-point-to-conjugate step (L934) is excluded per spec §7.

NODE: ext:dct
KIND: external
TITLE: Dominated convergence theorem
STATEMENT_SOURCE: external:standard#dominated-convergence
PROOF_SOURCE: -
CONTRACT_ID: paper.ext:dct
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: (Ω,F,ℙ) a probability space (more generally a measure space); Y_n, Y, Z measurable; Y_n→Y almost surely; |Y_n|≤Z almost surely with 𝔼[Z]<∞
SOURCE_QUANTIFIERS: (Ω,F,ℙ); (Y_n)_n; Y; Z
SOURCE_CONCLUSION: Y is integrable and 𝔼[Y_n]→𝔼[Y]
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet
LEAN_STATUS: EXTERNAL
LEAN_REF: -
LEAN_NOTE: -
NOTE: Invoked by name at L1172 (proof of Theorem 3.1) for the interchange along the subsequence 𝒟. Canonical ID from spec §5; not defined by slices A or B, first defined here.

NODE: ext:diagonal-subsequence
KIND: external
TITLE: Diagonal subsequence (compactness) argument
STATEMENT_SOURCE: external:standard#diagonal-subsequence
PROOF_SOURCE: -
CONTRACT_ID: paper.ext:diagonal-subsequence
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: for each k∈ℕ a real sequence (a^d_k)_{d≥k} with limsup_{d→∞}|a^d_k|<∞
SOURCE_QUANTIFIERS: (a^d_k)_{k∈ℕ, d≥k}
SOURCE_CONCLUSION: there exists a strictly increasing sequence 𝒟 of positive integers such that lim_{𝒟∋d→∞}a^d_k exists in ℝ for every k∈ℕ
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet
LEAN_STATUS: EXTERNAL
LEAN_REF: -
LEAN_NOTE: -
NOTE: Invoked as a standard compactness argument at L1150 (not by name). Canonical ID from spec §5; not defined by slices A or B, first defined here.

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

## Append-only structural amendments

<!-- BEGIN PROOF DEPGRAPH GENERATED -->
Regenerated by `proof_depgraph.py`; do not hand-edit.

### Dashboard

* Total nodes: **199**
* Frozen anchors: **28**
* Versioned statement contracts: **199**
* Total edges: **397**
* Root-closure nodes: **199**
* Dependency leaves in root closure: **40**
* Assumption boundary leaves: **0**
* External boundary leaves: **12**
* Alternative routes: **0**
* Topology review queue: **75**
* Explicit source gaps: **50**
* Coverage items: **187**; excluded: **78**

### Roots

* `thm-fixed-gf.fixed-point` [REVIEWED; frozen] — contract `paper.thm1_4.fixedPoint@1`
* `thm-fixed-gf.conjugate` [PROPOSED; frozen] — contract `paper.thm1_4.conjugate@1`
* `thm-fixed-gf.equivalence` [REVIEWED; frozen] — contract `paper.thm1_4.equivalence@1`
* `prop-single-type.fixed-point` [REVIEWED; frozen] — contract `paper.prop1_6.fixedPoint@1`
* `prop-single-type.conjugate` [REVIEWED; frozen] — contract `paper.prop1_6.conjugate@1`
* `prop-cond-on-ext.cond-law` [REVIEWED; frozen] — contract `paper.prop2_1.condLaw@1`
* `prop-conjugate` [REVIEWED; frozen] — contract `paper.prop2_2@1`
* `thm-fixed` [PROPOSED; frozen] — contract `paper.thm2_7@1`
* `thm-fixed-pt-infty` [REVIEWED; frozen] — contract `paper.thm3_1@1`
* `counterexample` [REVIEWED; frozen] — contract `paper.ex1_5@1`
* `example-ctble` [PROPOSED; frozen] — contract `paper.ex3_5@1`
* `rem:hyp-iii-necessary` [REVIEWED; frozen] — contract `paper.rem1_4.hypIII_necessary@1`
* `rem:hyp-iii-automatic` [REVIEWED; frozen] — contract `paper.rem1_4.hypIII_automatic@1`

### Topology review queue

* `claim:branching-property` [PROPOSED] — Branching (independence) and Markov property of the generation process
* `claim:mean-matrix-powers` [PROPOSED] — Entries of M^n are n-th generation means
* `def-bp-basic.positive-regular` [PROPOSED] — Positive regular branching process (Definition 1.3, first part)
* `def-bp-basic.positive-regular#matrix-equiv` [PROPOSED] — Positive regularity at time N is equivalent to M^N having all positive entries
* `def:population-sigma` [PROPOSED] — Measurable structure on populations and paths of a d-type branching process
* `eqn-gen-func-n` [PROPOSED] — Iterates of the generating function (display 1.2)
* `eqn-infty-subset#blowup` [PROPOSED] — Positive regularity: g^{(N)}(lambda) = (inf,...,inf) whenever some coordinate of lambda in [0,inf]^d is inf
* `eqn-retract-def` [PROPOSED] — (2.13): H_t(lambda) = (1-t) lambda + t phi(lambda/|lambda|) on A x [0,1]
* `eqn-use-attractive-zero` [PROPOSED] — (2.11): [0,eps]^d is a subset of S_0
* `example-ctble` [PROPOSED] — Example 3.5: a class of countable-type processes satisfying the assumptions of Theorem 3.1
* `example-ctble#apply-thm-3-1` [PROPOSED] — Theorem 3.1 applied to the example process
* `example-ctble#assume-II` [PROPOSED] — Assumption II holds with φ(k)=k, ψ(k)=1
* `example-ctble#assume-III` [PROPOSED] — Assumption III holds with φ(k)=k and the chosen s
* `example-ctble#assume-IV` [PROPOSED] — Assumption IV holds with ψ(k)=1, φ(k)=k and the chosen t
* `example-ctble#choose-s` [PROPOSED] — Existence of s>1 with 𝔼_1[s^{Σ_jjX_j(1)}]<s
* `example-ctble#choose-t` [PROPOSED] — Existence of t>1 with 𝔼_1[t^{X_1(1)}]>t
* `lem-1d-soln#diagonal-position` [PROPOSED] — Position of f̃_k relative to the diagonal: f̃_k(x)>x for x>e^{η_k}; f̃_k(x)≤x on [1,e^{η_k}]
* `lem-1d-soln#eta1-lt-log-t` [PROPOSED] — η_1<log t (from f̃_1(t)>t of Assumption IV)
* `lem-attractive-infty` [PROPOSED] — Lemma 2.16 (ruled reading E3): g^{(N)}(lambda) > lambda and |g^{(n)}(lambda)| -> inf outside a cube [0,C]^d
* `lem-attractive-infty#choose-N-m` [PROPOSED] — Choice of N and m := min p_{k,j}(N) > 0 (Lemma 2.4)
* `lem-attractive-infty#divergence` [PROPOSED] — Lemma 2.13(b) with m = N: g^{(N)}(lambda) > lambda forces |g^{(n)}(lambda)| -> inf
* `lem-attractive-infty#lower-bound` [PROPOSED] — Lower bound exp(g_k^{(N)}(lambda)) >= e^{lambda_k} m exp(max_j lambda_j) for lambda in [0,inf)^d (E3: max_j in place of min_j)
* `lem-attractive-infty#strict-increase` [PROPOSED] — For lambda outside [0,C]^d: g^{(N)}(lambda) > lambda (C := log m^{-1})
* `lem-attractive-zero#comparison` [PROPOSED] — eps := min_j lambda^0_j; monotone comparison 0 <= g^{(n)}(lambda) <= g^{(n)}(lambda^0) on [0,eps]^d
* `lem-attractive-zero#orbit-lambda0` [PROPOSED] — Lemma 2.13(a) with m = 1 applied to lambda^0: |g^{(n)}(lambda^0)| -> 0
* `lem-basin-open#S0-open` [PROPOSED] — S_0 is relatively open in [0,inf]^d
* `lem-basin-open#Sinf-open` [PROPOSED] — S_inf is relatively open in [0,inf]^d (same argument as for S_0)
* `lem-basin-open#outside-cube-in-Sinf` [PROPOSED] — [0,inf]^d \ [0,C]^d is a subset of S_inf (Lemma 2.16 and (2.10))
* `lem-fixed-liminf` [PROPOSED] — Lemma 3.3: liminf_d max_{k≤K}λ^d_k>0 for some K
* `lem-fixed-liminf#case-large-k` [PROPOSED] — Case k(d)≥K: λ^d_1≥δ/2 (3.14)
* `lem-fixed-liminf#case-small-k` [PROPOSED] — Case k(d)≤K-1: max_{k≤K}λ^d_k≥δ
* `lem-fixed-liminf#step2` [PROPOSED] — Step 2: max_{k≤K}λ^d_k≥δ/2 for all d (transfer to a bounded index)
* `lem-fixed-limsup` [PROPOSED] — Lemma 3.2: limsup_d λ^d_k<∞ for each k
* `lem-fixed-limsup#truncation-monotone` [PROPOSED] — ℙ_k[X^d_k(N)≥2] ≥ p_k for all d≥k (monotonicity of truncations)
* `lem-gf-pos#two-individuals` [PROPOSED] — Positive chance of at least two individuals in generation N_0 + 1
* `lem-mono` [PROPOSED] — Lemma 2.9 (Monotonicity): g^{(n)} is monotone, and strictly so after a fixed time
* `lem-mono#positivity-all-n` [PROPOSED] — P_k[X_j(n) >= 1] > 0 for all n >= N (positive regularity propagated by the Markov property)
* `lem-monotone-lim#limits-zero` [PROPOSED] — Contradiction argument: lambda-bar^s = 0 for every s, hence g^{(n)}(lambda) -> 0
* `lem-monotone-lim#shifted-mono` [PROPOSED] — (2.7): g^{(m+n)}(lambda) <= g^{(n)}(lambda), strict for large n
* `lem-ray-intersect#uniqueness` [PROPOSED] — At most one point of L outside S_0 u S_inf (application of Lemma 2.11)
* `lem-retract#H-continuous` [PROPOSED] — H is jointly continuous on A x [0,1]
* `lem-retract#H-preserves-A` [PROPOSED] — Each H_t maps A into A (norm of H_t(lambda) lies in [r,R])
* `lem-retract#choose-r-R` [PROPOSED] — Choice of R > r > 0 with Lambda contained in A(r,R)
* `lem-retract#phi-homeomorphism` [PROPOSED] — pi restricted to Lambda is a homeomorphism; continuous inverse phi : B -> Lambda
* `lem-unstable-scaled#holder-bound` [PROPOSED] — Holder bound: E_k[Z_n 1_{Z_n > 1}] <= exp(r g_k^{(n)}(lambda)) P_k[Z_n > 1]^{1-r}
* `prop-conjugate#ext-prob-hat` [PROPOSED] — Extinction probability vector of X-hat is 1/A (application of the unit-cube fixed-point statement)
* `prop-single-type#at-most-two-fixed-points` [PROPOSED] — At most two fixed points: 1 and q̄
* `prop-single-type#f-below-diagonal` [PROPOSED] — f(s) < s for some s > 1 close to 1 (Taylor expansion)
* `prop-single-type#fixed-point-exists` [PROPOSED] — Intermediate value argument gives q̄ ∈ [s,t] with f(q̄) = q̄
* `prop-single-type#mean-eq-derivative` [PROPOSED] — 𝔼[X(1)] equals f'(1)
* `prop-single-type.conjugate#existence` [PROPOSED] — Existence of a conjugate for the single-type process
* `prop-single-type.conjugate#hyps-imply-equivalence-hypotheses` [PROPOSED] — Single-type hypotheses (I)-(III) give the hypotheses of the equivalence for d = 1
* `prop-unstable#part-i` [PROPOSED] — Assertion (i): eta < lambda implies lim |g^{(n)}(eta)| = 0
* `rem:hyp-iii-necessary#no-conjugate` [PROPOSED] — No conjugate exists for the a·m^{-3} example
* `thm-fixed` [PROPOSED] — Theorem 2.7: there exists lambda in (0,inf)^d with g(lambda) = lambda
* `thm-fixed#A-homeomorphic-to-ball` [PROPOSED] — A is homeomorphic to a closed d-dimensional Euclidean ball
* `thm-fixed#apply-retract` [PROPOSED] — Application of Lemma 2.19: A = A(r,R) with Lambda subset A and a continuous retraction H_1 : A -> Lambda
* `thm-fixed#brouwer-on-A` [PROPOSED] — Brouwer fixed point theorem on A: every continuous self-map of A has a fixed point
* `thm-fixed#fixed-point-in-Lambda` [PROPOSED] — There is lambda in Lambda with g(lambda) = lambda
* `thm-fixed#gH1-self-map` [PROPOSED] — g o H_1 is a continuous function from A to itself (indeed into Lambda)
* `thm-fixed#positivity` [PROPOSED] — Lemma 2.3 applied to q = e^lambda: a nonzero fixed point of g in [0,inf)^d lies in (0,inf)^d
* `thm-fixed-gf.conjugate` [PROPOSED] — Theorem 1.4, conjugate form
* `thm-fixed-gf.equivalence#conjugate-is-tilt` [PROPOSED] — A conjugate is an exponential tilt of X by A = 1/ℙ̂[E], and A is a fixed point
* `thm-fixed-gf.equivalence#conjugate-regularity` [PROPOSED] — Premises of Proposition 2.1 for a conjugate process X̂ (positive regular, non-singular, 0 < ℙ̂_k[E] < 1)
* `thm-fixed-gf.equivalence#fixed-point-to-conjugate` [PROPOSED] — Fixed point in (1,∞)^d gives a conjugate (application of Proposition 2.2)
* `thm-fixed-gf.equivalence#hat-differs-from-X` [PROPOSED] — The tilted process of Proposition 2.2 is not equal in law to X
* `thm-fixed-gf.fixed-point#reduce-to-thm-2-7` [PROPOSED] — Reduction of Theorem 1.4 to Theorem 2.7 via q = e^λ
* `thm-fixed-pt-infty#as-convergence` [PROPOSED] — (3.21): almost sure convergence of exp(Σ_{j≤d}λ^d_jX_j(1)) along 𝒟
* `thm-fixed-pt-infty#before-dct` [PROPOSED] — (3.20): e^{λ^d_k} = 𝔼_k[exp(Σ_{j≤d}λ^d_jX_j(1))] for k≤d
* `thm-fixed-pt-infty#diagonal-limit` [PROPOSED] — Subsequential limit λ_k=lim_{𝒟∋d→∞}λ^d_k for all k (3.19), using Lemma 3.2
* `thm-fixed-pt-infty#dominated-bound` [PROPOSED] — (3.22): domination of exp(Σ_{j≤d}λ^d_jX_j(1)) by ∏_j[ψ(j)t^{φ(j)}]^{X_j(1)} via Lemma 3.4
* `thm-fixed-pt-infty#interchange` [PROPOSED] — Dominated convergence along 𝒟: g(λ)=λ
* `thm-fixed-pt-infty#nonzero-limit` [PROPOSED] — λ∈[0,∞)^ℕ∖{0} via Lemma 3.3
* `thm-fixed-pt-infty#positivity` [PROPOSED] — λ∈(0,∞)^ℕ: positive regularity upgrades λ∈[0,∞)^ℕ∖{0} to strict positivity
* `thm-fixed-pt-infty#reduce-to-g` [PROPOSED] — Reduction to a fixed point λ∈(0,∞)^ℕ of g (q := exp λ)

### Dependency leaves in root closure

* `claim:subcritical-extinction` [REVIEWED] — Subcritical, positive regular, non-singular implies extinction probability one
* `counterexample#hyp-I-subcritical` [REVIEWED] — Example 1.5 is subcritical
* `counterexample#hyp-II-regular` [REVIEWED] — Example 1.5 is positive regular and non-singular
* `counterexample#hyp-III-continuous` [REVIEWED] — Example 1.5 satisfies the continuity hypothesis
* `counterexample#three-fixed-points` [REVIEWED] — f(q) = q has three solutions in (1,∞)^2 for Example 1.5
* `def-bp-basic.non-singular` [REVIEWED] — Non-singular branching process (Definition 1.3, second part)
* `def-bp-basic.positive-regular` [PROPOSED] — Positive regular branching process (Definition 1.3, first part)
* `def-componentwise` [REVIEWED] — Definition 2.8: componentwise order on (-inf,inf]^d
* `def-conjugate` [REVIEWED] — Conjugate branching process (Definition 1.1)
* `def:extinction` [REVIEWED] — Extinction event E of a branching process
* `def:population-sigma` [PROPOSED] — Measurable structure on populations and paths of a d-type branching process
* `def:stoch-dom` [REVIEWED] — Stochastic domination of one offspring law by another (componentwise order)
* `def:subcritical` [REVIEWED] — Subcritical branching process (largest eigenvalue of M below one)
* `def:truncation` [REVIEWED] — Branching process X^d truncated at level d (individuals of type ≥ d+1 killed)
* `eqn-generating-function` [REVIEWED] — Generating function f of a d-type branching process (display 1.1)
* `eqn-mean-matrix` [REVIEWED] — Mean matrix M of a d-type branching process (display 1.3)
* `example-ctble#choose-s` [PROPOSED] — Existence of s>1 with 𝔼_1[s^{Σ_jjX_j(1)}]<s
* `example-ctble#choose-t` [PROPOSED] — Existence of t>1 with 𝔼_1[t^{X_1(1)}]>t
* `example-ctble#finite-offspring` [REVIEWED] — (3.23) implies finitely many non-zero X_j(1) almost surely (finite offspring (3.1))
* `ext:an72-v3-thm2` [REVIEWED] — Athreya-Ney V.3 Thm 2: fixed points of f in the unit cube are the extinction vector a and (1,...,1)
* `ext:brouwer` [REVIEWED] — Brouwer fixed point theorem
* `ext:compact-hausdorff` [REVIEWED] — A continuous bijection from a compact space onto a Hausdorff space is a homeomorphism
* `ext:connectedness` [REVIEWED] — A connected space is not the union of two disjoint nonempty relatively open subsets
* `ext:dct` [REVIEWED] — Dominated convergence theorem
* `ext:diagonal-subsequence` [REVIEWED] — Diagonal subsequence (compactness) argument
* `ext:fatou` [REVIEWED] — Fatou's lemma
* `ext:holder` [REVIEWED] — Holder's inequality
* `ext:jl08-thm1` [REVIEWED] — Jagers-Lageras Thm 1: law of a branching process conditioned on extinction
* `ext:perron-frobenius` [REVIEWED] — Perron-Frobenius theorem
* `ext:taylor` [REVIEWED] — First-order Taylor expansion at a point of differentiability
* `ext:vitali` [REVIEWED] — Vitali convergence theorem
* `lem-fixed-liminf#choose-K` [REVIEWED] — Choice of K (independent of d) with log ψ(k)≤(δ/2)φ(k) for all k≥K
* `lem-unstable-ssl#skeleton-hypotheses` [REVIEWED] — The m-skeleton X-tilde(r) = X(m r) satisfies the hypotheses of Theorem 1.4
* `prop-single-type#f-above-diagonal` [REVIEWED] — f(t) > t for some large t
* `prop-single-type#strict-convexity` [REVIEWED] — f'' > 0 where f is finite, so f is convex on its maximal finite interval
* `rem:hyp-iii-automatic#continuity-from-finiteness` [REVIEWED] — Finiteness on (0,∞)^d implies continuity on (0,∞]^d
* `rem:hyp-iii-necessary#constants-and-hyp-I` [REVIEWED] — Appropriate constants a, b exist and the example is subcritical
* `rem:hyp-iii-necessary#f-infinite` [REVIEWED] — f(q) = ∞ for every q > 1 in the a·m^{-3} example
* `rem:hyp-iii-necessary#hyp-II-regular` [REVIEWED] — The a·m^{-3} example is positive regular and non-singular
* `thm-fixed-gf.equivalence#conjugate-regularity` [PROPOSED] — Premises of Proposition 2.1 for a conjugate process X̂ (positive regular, non-singular, 0 < ℙ̂_k[E] < 1)

### Assumption boundary leaves

* _(none)_

### External boundary leaves

* `ext:an72-v3-thm2` [REVIEWED] — Athreya-Ney V.3 Thm 2: fixed points of f in the unit cube are the extinction vector a and (1,...,1)
* `ext:brouwer` [REVIEWED] — Brouwer fixed point theorem
* `ext:compact-hausdorff` [REVIEWED] — A continuous bijection from a compact space onto a Hausdorff space is a homeomorphism
* `ext:connectedness` [REVIEWED] — A connected space is not the union of two disjoint nonempty relatively open subsets
* `ext:dct` [REVIEWED] — Dominated convergence theorem
* `ext:diagonal-subsequence` [REVIEWED] — Diagonal subsequence (compactness) argument
* `ext:fatou` [REVIEWED] — Fatou's lemma
* `ext:holder` [REVIEWED] — Holder's inequality
* `ext:jl08-thm1` [REVIEWED] — Jagers-Lageras Thm 1: law of a branching process conditioned on extinction
* `ext:perron-frobenius` [REVIEWED] — Perron-Frobenius theorem
* `ext:taylor` [REVIEWED] — First-order Taylor expansion at a point of differentiability
* `ext:vitali` [REVIEWED] — Vitali convergence theorem

### Uncovered graph nodes

* _(none)_

### Nodes outside every root closure

* _(none)_

### Explicit source gaps

* `claim:mean-matrix-powers` [PROPOSED] — Entries of M^n are n-th generation means
* `claim:subcritical-extinction` [REVIEWED] — Subcritical, positive regular, non-singular implies extinction probability one
* `counterexample#hyp-I-subcritical` [REVIEWED] — Example 1.5 is subcritical
* `counterexample#hyp-II-regular` [REVIEWED] — Example 1.5 is positive regular and non-singular
* `counterexample#hyp-III-continuous` [REVIEWED] — Example 1.5 satisfies the continuity hypothesis
* `counterexample#three-fixed-points` [REVIEWED] — f(q) = q has three solutions in (1,∞)^2 for Example 1.5
* `def-bp-basic.positive-regular#matrix-equiv` [PROPOSED] — Positive regularity at time N is equivalent to M^N having all positive entries
* `eqn-gen-func-n` [PROPOSED] — Iterates of the generating function (display 1.2)
* `eqn-infty-subset#blowup` [PROPOSED] — Positive regularity: g^{(N)}(lambda) = (inf,...,inf) whenever some coordinate of lambda in [0,inf]^d is inf
* `example-ctble#assume-I` [REVIEWED] — Assumption I holds: every truncation X^d satisfies the hypotheses of Theorem 1.4
* `example-ctble#assume-II` [PROPOSED] — Assumption II holds with φ(k)=k, ψ(k)=1
* `example-ctble#assume-III` [PROPOSED] — Assumption III holds with φ(k)=k and the chosen s
* `example-ctble#assume-IV` [PROPOSED] — Assumption IV holds with ψ(k)=1, φ(k)=k and the chosen t
* `example-ctble#choose-s` [PROPOSED] — Existence of s>1 with 𝔼_1[s^{Σ_jjX_j(1)}]<s
* `example-ctble#choose-t` [PROPOSED] — Existence of t>1 with 𝔼_1[t^{X_1(1)}]>t
* `example-ctble#global-extinction` [REVIEWED] — The example process has global extinction probability one
* `lem-1d-soln#convexity` [REVIEWED] — f̃_k is convex (second derivative positive) with f̃_k(1)=1
* `lem-1d-soln#single-type-continuous` [REVIEWED] — f̃_k is continuous from (0,∞] to [0,∞]
* `lem-1d-soln#single-type-subcritical` [REVIEWED] — X̃^k is subcritical (mean offspring number <1)
* `lem-gf-bded#jacobian` [REVIEWED] — M is the Jacobian of f at 1; f is regular enough for a quadratic Taylor remainder
* `lem-monotone-lim#limit-fixed` [REVIEWED] — g^{(r m)}(lambda-bar^s) = lambda-bar^s (passing the limit through g^{(m)})
* `lem-monotone-lim#part-b` [REVIEWED] — Second assertion (g^{(m)}(lambda) > lambda forces |g^{(n)}(lambda)| -> inf)
* `lem-retract#Lambda-compact` [REVIEWED] — Lambda is compact (relatively closed in [0,inf]^d and bounded)
* `lem-unstable-scaled#extinction-as` [REVIEWED] — Almost-sure extinction under Hypothesis I; Z_n -> 1 a.s.
* `lem-unstable-scaled#holder-bound` [PROPOSED] — Holder bound: E_k[Z_n 1_{Z_n > 1}] <= exp(r g_k^{(n)}(lambda)) P_k[Z_n > 1]^{1-r}
* `lem-unstable-ssl#skeleton-gf` [REVIEWED] — The log generating function of X-tilde is g^{(m)}, so its r-th iterate is g^{(r m)}
* `lem-unstable-ssl#skeleton-hypotheses` [REVIEWED] — The m-skeleton X-tilde(r) = X(m r) satisfies the hypotheses of Theorem 1.4
* `prop-conjugate#abs-continuity` [REVIEWED] — Mutual absolute continuity of the first-n-generation laws of X-hat and X
* `prop-conjugate#cond-law-hat` [REVIEWED] — Application of Prop 2.1 (conditional law) to X-hat with a = 1/A; identification with the law of X
* `prop-conjugate#ext-prob-hat` [PROPOSED] — Extinction probability vector of X-hat is 1/A (application of the unit-cube fixed-point statement)
* `prop-single-type#mean-eq-derivative` [PROPOSED] — 𝔼[X(1)] equals f'(1)
* `prop-single-type#strict-convexity` [REVIEWED] — f'' > 0 where f is finite, so f is convex on its maximal finite interval
* `prop-single-type.conjugate#existence` [PROPOSED] — Existence of a conjugate for the single-type process
* `prop-single-type.conjugate#hyps-imply-equivalence-hypotheses` [PROPOSED] — Single-type hypotheses (I)-(III) give the hypotheses of the equivalence for d = 1
* `prop-single-type.conjugate#unique-in-law` [REVIEWED] — Any two conjugates of the single-type process have the same law
* `prop-unstable#part-i` [PROPOSED] — Assertion (i): eta < lambda implies lim |g^{(n)}(eta)| = 0
* `rem:hyp-iii-automatic#continuity-from-finiteness` [REVIEWED] — Finiteness on (0,∞)^d implies continuity on (0,∞]^d
* `rem:hyp-iii-necessary#constants-and-hyp-I` [REVIEWED] — Appropriate constants a, b exist and the example is subcritical
* `rem:hyp-iii-necessary#f-infinite` [REVIEWED] — f(q) = ∞ for every q > 1 in the a·m^{-3} example
* `rem:hyp-iii-necessary#hyp-II-regular` [REVIEWED] — The a·m^{-3} example is positive regular and non-singular
* `rem:hyp-iii-necessary#no-conjugate` [PROPOSED] — No conjugate exists for the a·m^{-3} example
* `thm-fixed#A-homeomorphic-to-ball` [PROPOSED] — A is homeomorphic to a closed d-dimensional Euclidean ball
* `thm-fixed#g-image-finite` [REVIEWED] — g(Lambda) has finite coordinates: g maps Lambda into [0,inf)^d
* `thm-fixed#positivity` [PROPOSED] — Lemma 2.3 applied to q = e^lambda: a nonzero fixed point of g in [0,inf)^d lies in (0,inf)^d
* `thm-fixed-gf.equivalence#conjugate-is-tilt` [PROPOSED] — A conjugate is an exponential tilt of X by A = 1/ℙ̂[E], and A is a fixed point
* `thm-fixed-gf.equivalence#conjugate-regularity` [PROPOSED] — Premises of Proposition 2.1 for a conjugate process X̂ (positive regular, non-singular, 0 < ℙ̂_k[E] < 1)
* `thm-fixed-gf.equivalence#conjugate-to-fixed-point` [REVIEWED] — Conjugate gives a fixed point in (1,∞)^d (uses Lemma 2.3 and clause (a))
* `thm-fixed-gf.equivalence#fixed-point-to-conjugate` [PROPOSED] — Fixed point in (1,∞)^d gives a conjugate (application of Proposition 2.2)
* `thm-fixed-gf.equivalence#hat-differs-from-X` [PROPOSED] — The tilted process of Proposition 2.2 is not equal in law to X
* `thm-fixed-pt-infty#positivity` [PROPOSED] — λ∈(0,∞)^ℕ: positive regularity upgrades λ∈[0,∞)^ℕ∖{0} to strict positivity
<!-- END PROOF DEPGRAPH GENERATED -->
