# Slice A extraction packet — §1 (paper.tex L170-L379)

Extractor: `extractor-A/sonnet`. Status of every record: PROPOSED. Locators use `source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#<anchor>@Lx-Ly`; line numbers are revisable locators only.

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
SOURCE_CONCLUSION: the (implicit) measurable structure on the population space ℕ_0^d and on the space of paths of populations with respect to which X_j(n), the laws ℙ_k, the expectations 𝔼_k and the bounded measurable test functions F : ℕ_0^d → ℝ of (2.1) and (1.5) (L402, L427, slice B) are understood; the paper never writes this structure out
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
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
NOTE: definition leaf. The clause 'equivalent to M^N has all positive entries' (L229) is not consumed by any root's proof and is excluded (ADJUDICATION A1). N ≥ 1 (R1)

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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
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
DEPS: eqn-generating-function, def:step-kernel, def:path-law, def:population-sigma
ROUTES: -
ROUTE_FOR: -
EDGE: eqn-generating-function | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-gen-func-n@L209-L213 | f in 'the composition of f with itself n times' is the one-generation generating function of display (1.1)
EDGE: def:step-kernel | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-gen-func-n@L209-L213 | the identity between the n-fold composition and the generation-n expectation rests on the branching (independent-offspring) property of the one-generation mechanism; the paper gives no argument
EDGE: def:path-law | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-gen-func-n@L209-L213 | the generation-n expectation is taken under ℙ_k, the law of the process started from one type-k individual
EDGE: def:population-sigma | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-gen-func-n@L209-L213 | 𝔼_k of a function of X(n) requires X(n) to be measurable for the population structure
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: the paper asserts the identification with a bare 'Equivalently' and gives no proof. Edges to the three process-definition nodes are the characterization consumption of spec §8, not source-stated. Feeds slices B-D (lem-fixed-pos L454-L467, display (2.5) L540)

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
DEPS: eqn-mean-matrix, def:step-kernel, def:path-law, def:population-sigma
ROUTES: -
ROUTE_FOR: -
EDGE: eqn-mean-matrix | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#mean-matrix-powers@L219-L220 | M is the matrix of display (1.3) whose powers are being identified
EDGE: def:step-kernel | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#mean-matrix-powers@L219-L220 | the n-th generation mean is obtained by iterating the one-generation branching mechanism; the paper gives no argument
EDGE: def:path-law | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#mean-matrix-powers@L219-L220 | the mean 𝔼_k[X_j(n)] is taken under ℙ_k
EDGE: def:population-sigma | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#mean-matrix-powers@L219-L220 | 𝔼_k[X_j(n)] requires X_j(n) to be measurable
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
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
SOURCE_HYPOTHESES: hypotheses (I)-(III) of Theorem 1.4 (the setting assumed throughout §2.2, L528); λ ∈ (0,∞)^d with g(λ) = λ is provided by Theorem 2.7
SOURCE_QUANTIFIERS: d ∈ ℕ; X satisfying (I)-(III); λ ∈ (0,∞)^d with g(λ) = λ; q := e^λ componentwise
SOURCE_CONCLUSION: q := (e^{λ_1},…,e^{λ_d}) lies in (1,∞)^d and satisfies f(q) = q, by the equivalence (2.6) g(λ) = λ iff f(e^λ) = e^λ
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
EDGE: thm-fixed-gf.equivalence | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#conjugate-iff-fixed-point@L238-L238 | converts the fixed point into a conjugate; its premises (subcritical, positive regular, non-singular) are the root's hypotheses (I) and (II)
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
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
SOURCE_HYPOTHESES: d ∈ ℕ; X is a subcritical, positive regular and non-singular d-type branching process with certain extinction; A ∈ (1,∞)^d with f(A) = A; X̂ is the branching process of display (1.5) built from A
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
SOURCE_CONCLUSION: there exists a conjugate branching process X̂ for X in the sense of Definition 1.1, namely the process of display (1.5) with A = q
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
TITLE: Regularity and positive extinction probability of a conjugate process X̂ (premises for formula 2.1)
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#conjugate-iff-fixed-point@L238-L238
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#conjugate-iff-fixed-point@L238-L238
CONTRACT_ID: paper.thm-fixed-gf.equivalence#conjugate-regularity
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: d ∈ ℕ; X is a subcritical, positive regular and non-singular d-type branching process; X̂ is a conjugate branching process for X in the sense of Definition 1.1
SOURCE_QUANTIFIERS: d ∈ ℕ; X; X̂ conjugate for X; k ∈ {1,…,d}
SOURCE_CONCLUSION: X̂ is positive regular and non-singular and ℙ̂_k[E] > 0 for each k ∈ {1,…,d}, so that the conditioning in clause (b) of Definition 1.1 is defined and the conditional-law formula (2.1) of Proposition 2.1 is available for X̂
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
NOTE: SOURCE_GAP: Proposition 2.1 (L391, L397) is stated for a positive regular, non-singular process with 0 < a_k < 1; a conjugate X̂ is assumed to satisfy none of these and the paper never checks them. Ambiguity for the orchestrator: the upper bound ℙ̂_k[E] < 1 of Proposition 2.1 would itself give A in (1,∞)^d and make Lemma 2.3 redundant, but it is only available after the trivial case A = (1,…,1) is excluded by clause (a); this node therefore records only the positive-regularity and ℙ̂_k[E] > 0 premises, and the bound < 1 is left to the Lemma 2.3 plus clause (a) route of conjugate-to-fixed-point

NODE: thm-fixed-gf.equivalence#conjugate-is-tilt
KIND: application
TITLE: A conjugate is an exponential tilt of X by A = 1/ℙ̂[E], and A is a fixed point
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#conjugate-iff-fixed-point@L238-L238
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#conjugate-iff-fixed-point@L238-L238
CONTRACT_ID: paper.thm-fixed-gf.equivalence#conjugate-is-tilt
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: d ∈ ℕ; X is a subcritical, positive regular and non-singular d-type branching process with generating function f; X̂ is a conjugate for X; X̂ is positive regular and non-singular with ℙ̂_k[E] > 0 for each k
SOURCE_QUANTIFIERS: d ∈ ℕ; X; X̂ conjugate for X; â_k := ℙ̂_k[E] for k ∈ {1,…,d}; A_k := 1/â_k
SOURCE_CONCLUSION: A ∈ [1,∞)^d; the offspring laws of X̂ are the tilt of those of X by A as in display (1.5), equivalently those of X are the tilt of X̂ by â as in display (2.1); and f(A) = A
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
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
SOURCE_HYPOTHESES: X single-type with generating function f finite on [1,1+ε]
SOURCE_QUANTIFIERS: X; ε from the previous step
SOURCE_CONCLUSION: 𝔼[X(1)] = f'(1), the derivative of f at 1, and f'(1) < 1 by hypothesis (I)
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
SOURCE_HYPOTHESES: X single-type with generating function f; (I) 𝔼[X(1)] < 1; f'(1) = 𝔼[X(1)]
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
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
SOURCE_HYPOTHESES: X single-type with generating function f; (III) f is continuous from (0,∞] to (0,∞]; s > 1 with f(s) < s; t > s with f(t) > t
SOURCE_QUANTIFIERS: X; s, t as above; ∃ q̄ ∈ [s,t]
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
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
SOURCE_HYPOTHESES: X single-type with generating function f; f convex on the maximal interval where it is finite; q̄ ∈ (1,∞) with f(q̄) = q̄ and f(1) = 1
SOURCE_QUANTIFIERS: X; q > 0
SOURCE_CONCLUSION: there are at most two values of q with f(q) = q, namely 1 and q̄; in particular q̄ is the only solution in (1,∞)
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: prop-single-type#strict-convexity, prop-single-type#fixed-point-exists
ROUTES: -
ROUTE_FOR: -
EDGE: prop-single-type#strict-convexity | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L354-L354 | 'Hence there are at most two values of q for which f(q) = q' follows from convexity on the finite interval
EDGE: prop-single-type#fixed-point-exists | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L354-L354 | identifies the second fixed point as q̄ ('namely 1 and q̄')
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
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
DEPS: def:subcritical, def-bp-basic.positive-regular, def-bp-basic.non-singular
ROUTES: -
ROUTE_FOR: -
EDGE: def:subcritical | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L346-L346 | hypothesis (I) rewrites 'subcritical' as 𝔼[X(1)] < 1, i.e. spectral radius of the 1 × 1 mean matrix below one
EDGE: def-bp-basic.positive-regular | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L347-L347 | positive regularity for d = 1 is not stated in Proposition 1.6 and must be derived from (II)
EDGE: def-bp-basic.non-singular | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L347-L347 | hypothesis (II) is Definition 1.3 non-singularity for d = 1
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
SOURCE_HYPOTHESES: X single-type satisfying (I)-(III) of Proposition 1.6; X subcritical, positive regular and non-singular as a 1-type process
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
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
SOURCE_HYPOTHESES: the example is a subcritical, positive regular, non-singular single-type process with f(q) ≠ q for every q ∈ (1,∞)
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -
LEAN_STATUS: EXTERNAL
LEAN_REF: -
LEAN_NOTE: -
NOTE: canonical external (spec §5). Slice A consumes it in prop-single-type#f-below-diagonal (L354 'by Taylor expansion'); slice B (lem-gf-bded L511) consumes it too, so this block is expected to duplicate slice B's; orchestrator to merge by ID

## Coverage

ITEM: inv:heading:L170
KIND: heading
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#sec-intro@L170-L170
DISPOSITION: EXCLUDED
REASON: section heading 'Introduction'; no mathematical statement or proof content
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:heading:L173
KIND: heading
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#sec-overview@L173-L173
DISPOSITION: EXCLUDED
REASON: subsection heading 'Overview'; no mathematical statement or proof content
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:L176:bp-setup
KIND: definition
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#bp-setup@L176-L177
DISPOSITION: NODE def:population-sigma, def:step-kernel, def:path-law, claim:branching-property
REASON: the sentence introducing the d-type branching process X(n), the measures ℙ_k and expectations 𝔼_k is split into the three frozen definition anchors for population structure, one-generation mechanism and path law
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:L179:extinction-event
KIND: definition
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#extinction-event@L179-L179
DISPOSITION: NODE def:extinction
REASON: defines the extinction event E; the classical conditioning fact restated in the same sentence is Proposition 2.1 (slice B node prop-cond-on-ext.cond-law, R6) and is not duplicated in slice A
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:cite:L179:jl-cond-on-ext
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#extinction-event@L179-L179
DISPOSITION: EXCLUDED
REASON: expository pointer ('for a more general result') in the overview; no slice-A proof consumes the cited theorem, whose use is in the proof of Proposition 2.1 (L405, slice B, ext:jl08-thm1)
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:def-conjugate
KIND: definition
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#def-conjugate@L184-L187
DISPOSITION: NODE def-conjugate
REASON: Definition 1.1 is the frozen definition anchor; consumed by the direction steps of thm-fixed-gf.equivalence
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:L193:remark
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#remark-other-conditioning@L193-L196
DISPOSITION: EXCLUDED
REASON: literature remark on other ways to condition on non-extinction (spec §7: expository, no proof obligation for any root)
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:cite:L194:Penisson-thesis
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#remark-other-conditioning@L194-L194
DISPOSITION: EXCLUDED
REASON: citation inside the expository remark L193-L196 (spec §7); not invoked by any proof
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:cite:L194:dallaporta2008q
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#remark-other-conditioning@L194-L194
DISPOSITION: EXCLUDED
REASON: citation inside the expository remark L193-L196 (spec §7); not invoked by any proof
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:cite:L194:harris1963theory
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#remark-other-conditioning@L194-L194
DISPOSITION: EXCLUDED
REASON: citation inside the expository remark L193-L196 (spec §7); not invoked by any proof
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:cite:L194:kolmogorov1938losung
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#remark-other-conditioning@L194-L194
DISPOSITION: EXCLUDED
REASON: citation inside the expository remark L193-L196 (spec §7); not invoked by any proof
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:cite:L194:lamperti1968conditioned
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#remark-other-conditioning@L194-L194
DISPOSITION: EXCLUDED
REASON: citation inside the expository remark L193-L196 (spec §7); not invoked by any proof
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:cite:L194:seneta1966quasi
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#remark-other-conditioning@L194-L194
DISPOSITION: EXCLUDED
REASON: citation inside the expository remark L193-L196 (spec §7); not invoked by any proof
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:cite:L194:yaglom1947certain.2
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#remark-other-conditioning@L194-L194
DISPOSITION: EXCLUDED
REASON: citation inside the expository remark L193-L196 (spec §7); not invoked by any proof
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:cite:L194:yaglom1947certain.3
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#remark-other-conditioning@L194-L194
DISPOSITION: EXCLUDED
REASON: citation inside the expository remark L193-L196 (spec §7); not invoked by any proof
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:cite:L194:yaglom1947certain.4
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#remark-other-conditioning@L194-L194
DISPOSITION: EXCLUDED
REASON: citation inside the expository remark L193-L196 (spec §7); not invoked by any proof
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:heading:L199
KIND: heading
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#sec-result@L199-L199
DISPOSITION: EXCLUDED
REASON: subsection heading 'Main result'; no mathematical statement or proof content
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:eqn-generating-function
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-generating-function@L205-L205
DISPOSITION: NODE eqn-generating-function
REASON: display (1.1) is the frozen definition anchor of the generating function f (with the ∞ conventions of L208)
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:L209:iterate-equivalence
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-gen-func-n@L209-L213
DISPOSITION: NODE eqn-gen-func-n
REASON: the 'Equivalently' sentence identifies the n-fold composition of f with a generation-n expectation; reused by later lemmas, so it is a claim node with SOURCE_GAP
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:eqn-gen-func-n
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-gen-func-n@L211-L211
DISPOSITION: NODE eqn-gen-func-n
REASON: display (1.2) is the content of the same claim node (E2 applied: product over j ≤ d)
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:eqn-mean-matrix
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-mean-matrix@L216-L216
DISPOSITION: NODE eqn-mean-matrix
REASON: display (1.3) is the frozen definition anchor of the mean matrix M
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:L219:finite-mean
KIND: assumption
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#subcritical-def@L219-L219
DISPOSITION: NODE def:subcritical, claim:mean-matrix-powers
REASON: 'We assume that each M_{k,j} is finite' is bundled into the subcritical anchor (R1) and recorded as a hypothesis of the L220 claim; it is not a standing assumption (STANDING_ASSUMPTIONS is -)
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:L220:mean-matrix-powers
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#mean-matrix-powers@L220-L220
DISPOSITION: NODE claim:mean-matrix-powers
REASON: reused unlabeled claim (M^n)_{k,j} = 𝔼_k[X_j(n)] (spec §6); asserted without proof, so SOURCE_GAP
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:L220:subcritical-def
KIND: definition
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#subcritical-def@L220-L220
DISPOSITION: NODE def:subcritical
REASON: definition of subcritical/critical/supercritical through the largest eigenvalue of M is the frozen definition anchor
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:cite:L222:an-branching-processes
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#def-bp-basic-cite@L222-L222
DISPOSITION: EXCLUDED
REASON: 'see, e.g., [Section 6]' only motivates the non-degeneracy conditions of Definition 1.3; no slice-A proof invokes this reference (the An72 result used by Proposition 2.1 is ext:an72-v3-thm2, slice B)
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:def-bp-basic
KIND: definition
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#def-bp-basic@L224-L234
DISPOSITION: NODE def-bp-basic.positive-regular, def-bp-basic.non-singular
REASON: Definition 1.3 is split into its two frozen definition anchors (positive regular; non-singular)
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:L229:pos-reg-matrix-equiv
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#def-bp-basic@L229-L229
DISPOSITION: EXCLUDED
REASON: the claim 'positive regular iff M^N has all positive entries' (L229) is not consumed by any root's proof; per ERRATA R2 only roots are anchored, so it is excluded (ADJUDICATION A1)
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:L238:conjugate-iff-fixed-point
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#conjugate-iff-fixed-point@L238-L238
DISPOSITION: NODE thm-fixed-gf.equivalence, thm-fixed-gf.equivalence#fixed-point-to-conjugate, thm-fixed-gf.equivalence#conjugate-to-fixed-point, claim:subcritical-extinction, thm-fixed-gf.equivalence#hat-differs-from-X, thm-fixed-gf.equivalence#conjugate-regularity, thm-fixed-gf.equivalence#conjugate-is-tilt
REASON: the 'It is easy to see ... equivalent' sentence is the frozen equivalence root; its two directions and the premise-discharge bridges (extinction certain, clause (a), regularity premises for formula (2.1), inverse tilt) are separate SOURCE_GAP nodes
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:thm-fixed-gf
KIND: theorem
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed-gf@L241-L250
DISPOSITION: NODE thm-fixed-gf.fixed-point, thm-fixed-gf.fixed-point#reduce-to-thm-2-7, thm-fixed-gf.conjugate, thm-fixed-gf.equivalence
REASON: Theorem 1.4 is split (R3) into the fixed-point and conjugate roots; the 'equivalently' clause of L249 is the equivalence root; the reduction to Theorem 2.7 (carrier change q = e^λ) is a separate application node
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:L252:hyp-i-necessary
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#hyp-iii-necessary-remarks@L252-L252
DISPOSITION: EXCLUDED
REASON: 'Hypothesis I is necessary since a supercritical branching process conditioned on extinction is always subcritical' feeds no root (spec §7, R2); the cited fact is the un-anchored 'Moreover' clause of Proposition 2.1 (R6)
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:L252:hyp-iii-automatic
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#hyp-iii-automatic@L252-L252
DISPOSITION: NODE rem:hyp-iii-automatic, rem:hyp-iii-automatic#continuity-from-finiteness
REASON: frozen remark root and its single unproved bridge (SOURCE_GAP)
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:L252:hyp-iii-necessary
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#hyp-iii-necessary@L252-L252
DISPOSITION: NODE rem:hyp-iii-necessary, rem:hyp-iii-necessary#constants-and-hyp-I, rem:hyp-iii-necessary#hyp-II-regular, rem:hyp-iii-necessary#f-infinite, rem:hyp-iii-necessary#no-conjugate
REASON: frozen remark root, split into the unspecified constants with subcriticality, positive regularity and non-singularity, divergence of f, and the application of the equivalence for 'no conjugate exists' (all SOURCE_GAP)
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:L265:counterexample-claims
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#counterexample@L255-L276
DISPOSITION: NODE counterexample, counterexample#hyp-I-subcritical, counterexample#hyp-II-regular, counterexample#hyp-III-continuous, counterexample#three-fixed-points
REASON: Example 1.5's hypotheses-hold and three-solutions claims are the root and its SOURCE_GAP steps (R4). The robustness-under-perturbation claim, the d = 3 seven-fixed-point claim and the 'arbitrarily large' expectation (L262-L263) feed no root and have no node (spec §7); they are not separately inventoried
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:counterexample
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#counterexample@L255-L264
DISPOSITION: NODE counterexample, counterexample#hyp-I-subcritical, counterexample#hyp-II-regular, counterexample#hyp-III-continuous, counterexample#three-fixed-points
REASON: the example environment itself (offspring law and the two asserted conclusions) is the frozen root and its SOURCE_GAP steps; same nodes as the claim item above
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:prop-single-type
KIND: proposition
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L343-L351
DISPOSITION: NODE prop-single-type.fixed-point, prop-single-type.conjugate, prop-single-type.conjugate#hyps-imply-equivalence-hypotheses, prop-single-type.conjugate#existence, prop-single-type.conjugate#unique-in-law
REASON: Proposition 1.6 is split (R5) into the fixed-point and conjugate roots; the 'Equivalently' bridge from conjugate to fixed point is the existence and uniqueness-in-law application steps plus the d = 1 hypothesis check (SOURCE_GAP)
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:proof:prop-single-type
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L352-L355
DISPOSITION: NODE prop-single-type#finite-near-one, prop-single-type#mean-eq-derivative, prop-single-type#f-below-diagonal, prop-single-type#f-above-diagonal, prop-single-type#fixed-point-exists, prop-single-type#strict-convexity, prop-single-type#at-most-two-fixed-points, ext:taylor
REASON: the proof paragraph is decomposed sentence by sentence into finiteness near 1, mean equals derivative, the two diagonal-crossing witnesses (using the named Taylor expansion), the intermediate-value fixed point, strict convexity, and the at-most-two-fixed-points conclusion
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

ITEM: inv:heading:L359
KIND: heading
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#sec-outline@L359-L359
DISPOSITION: EXCLUDED
REASON: subsection heading 'Proof outline'; the outline body (L360-L377) is expository and duplicates §2 statements (spec §7)
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-A/sonnet
REVIEWER: -

## Report

**Source ranges read.** `fixed-pt-finite-type.tex` L165-L384 (all of the owned slice L170-L379, plus context), L380-L565 (Props 2.1/2.2, Lemmas 2.3-2.5, Def 2.6, (2.5)-(2.6), Thm 2.7 statement, to see how Theorem 1.4 and the L238 equivalence are assembled), L890-L909 (proof of Theorem 2.7). Spot re-reads of L253-L254, L436-L438, L548-L553. `\begin{comment}` blocks (L277-L339, L407-L415, L562-L582) ignored. Also read: skill `SKILL.md`, `agent-packets.md`, both templates, `graph/EXTRACTION_SPEC.md`, `graph/INVENTORY.md` (Slice A), `graph/DEPGRAPH.header.md`, `ERRATA.md` (rulings R1-R6, E1-E8).

**Counts.** 48 nodes: 10 definition anchors, 8 root theorem anchors (thm-fixed-gf x3, prop-single-type x2, counterexample, rem:hyp-iii-necessary, rem:hyp-iii-automatic), 3 claims (eqn-gen-func-n, claim:mean-matrix-powers, def-bp-basic.positive-regular#matrix-equiv), 6 application nodes, 20 step nodes, 1 external (`ext:taylor`). 69 EDGE records (one per DEPS entry; no ROUTES). Every anchor's `FROZEN_*`, `CONTRACT_ID`, `CONTRACT_VERSION` fields were generated by script from the spec §8 table; the skill linter run on a scratch copy (this packet plus stub nodes for other slices' IDs, with `--source-root`) found no shape, locator, edge-count, contract-uniqueness or frozen-binding error for slice-A nodes.

**Coverage.** 37 inventory items: 20 mapped to nodes, 17 EXCLUDED (4 headings L170/L173/L199/L359; 9 L194 citations plus the L179 jl-cond-on-ext and L222 an-branching-processes citations = 11 citations; the L193 remark; `inv:L252:hyp-i-necessary`). Every slice-A node is named by at least one item. Body paragraphs of the proof outline (L360-L377), Figure 1 (L267-L273) and the L188/L190 summary sentences have no inventory item and are treated as expository (spec §7).

**Cross-slice IDs consumed (all canonical).** `prop-cond-on-ext.cond-law` (use site: conjugate-is-tilt), `prop-conjugate` (fixed-point-to-conjugate, hat-differs-from-X), `lem-fixed-pos` (conjugate-to-fixed-point), `thm-fixed` and `eqn-fixed-pt-equiv` (reduce-to-thm-2-7). Nodes slice A provides that other slices should consume: `eqn-gen-func-n`, `claim:mean-matrix-powers`, `prop-single-type.fixed-point` (slice D, lem-1d-soln L1125), `thm-fixed-gf.fixed-point` / `.conjugate` (slice D, L998, L1009), `thm-fixed-gf.equivalence`, definition anchors. **New non-canonical ID proposed:** `def-bp-basic.positive-regular#matrix-equiv` (consumer expected: lem-gf-bded L508 Perron-Frobenius step; orchestrator to wire the edge or exclude per R2). No new `ext:` IDs; `ext:taylor` is canonical but I emitted its block (consumer here: prop-single-type#f-below-diagonal), so expect a duplicate from slice B (lem-gf-bded L511) to merge.

**Reachability caveat.** In a graph of slice A alone, six nodes lie outside the closure of A's roots: `def:population-sigma`, `def:step-kernel`, `def:path-law`, `eqn-gen-func-n`, `claim:mean-matrix-powers`, `def-bp-basic.positive-regular#matrix-equiv`. They are reachable only if another slice consumes `eqn-gen-func-n` (lem-fixed-pos L454-L467, display (2.5) L540) and the matrix-equivalence node (lem-gf-bded). No definition-to-definition edges were added (spec §8: definitions are leaves).

**Alternate routes.** None offered by the source; no ROUTES or route nodes. Unmodeled possibilities for the orchestrator: (i) Example 1.5's hypothesis III could be derived from `rem:hyp-iii-automatic` (the L252 sentence precedes the example) but L262 says only 'clearly'; (ii) existence in `prop-single-type.conjugate` could alternatively come from `thm-fixed-gf.conjugate` with d = 1, but the source never says so.

**SOURCE_GAP nodes (23).** eqn-gen-func-n; claim:mean-matrix-powers; def-bp-basic.positive-regular#matrix-equiv; thm-fixed-gf.equivalence#{extinction-certain, hat-differs-from-X, fixed-point-to-conjugate, conjugate-regularity, conjugate-is-tilt, conjugate-to-fixed-point}; prop-single-type#{mean-eq-derivative, strict-convexity}; prop-single-type.conjugate#{hyps-imply-equivalence-hypotheses, existence, unique-in-law}; counterexample#{hyp-I-subcritical, hyp-II-regular, hyp-III-continuous, three-fixed-points}; rem:hyp-iii-necessary#{constants-and-hyp-I, hyp-II-regular, f-infinite, no-conjugate}; rem:hyp-iii-automatic#continuity-from-finiteness. The roots thm-fixed-gf.equivalence, prop-single-type.conjugate, counterexample, rem:hyp-iii-necessary and rem:hyp-iii-automatic carry no SOURCE_GAP: marker themselves; their children do.

**Ambiguities and points for adjudication.**
- Equivalence (L238), converse direction: the paper gives no argument. Edges of `#conjugate-is-tilt` to `prop-cond-on-ext.cond-law` and of `#conjugate-to-fixed-point` to `lem-fixed-pos` follow the orchestrator's hint (Props 2.1/2.2, Lemma 2.3) and the paper's own L437 sentence tying Lemma 2.3 to the Prop 2.2 setting; L238 itself invokes only Prop 2.2. The EDGE locator for those is L238 or L437, not a proof site.
- Prop 2.1 as stated needs `0 < a_k < 1` and positive regularity for the process it is applied to. For a conjugate X̂ the bound `ℙ̂_k[E] < 1` is available only after the trivial case A = (1,…,1) is excluded (by clause (a)), and then Lemma 2.3 would be redundant; I recorded only the premises `positive regular, non-singular, ℙ̂_k[E] > 0` and left the exclusion of A = 1 to `#conjugate-to-fixed-point`. Orchestrator may prefer a different reconstruction.
- `#extinction-certain` (subcritical + positive regular + non-singular implies certain extinction) is needed by Def 1.1 context, Prop 2.2 and Lemma 2.3 but is never stated. I did not add an edge to `ext:an72-v3-thm2`, since L238 does not invoke it; the orchestrator may add one.
- Definition 1.1 clause (a) ('does not have the same law as X') is never discharged; modeled as `#hat-differs-from-X` (forward) and inside `#conjugate-to-fixed-point` (converse).
- Prop 1.6: positive regularity for d = 1 is never mentioned; the conjugate form rests on the word 'Equivalently' (L350). Uniqueness read as uniqueness in law (R5). `#unique-in-law` depends on the two intermediate steps of the equivalence (conjugate-is-tilt, conjugate-to-fixed-point), which are internal nodes of another root; the orchestrator may prefer to hoist them.
- Prop 1.6 step `f-above-diagonal` needs t > s, unwritten; `strict-convexity` records the gap that f'' > 0 is asserted with no stated reason (only the label item-single-type-convex).
- `thm-fixed-gf.conjugate` depends directly on the two sibling roots `.fixed-point` and `.equivalence` with no application node, because the equivalence's premises are literally hypotheses I and II.
- Hypothesis III: source prints `k ∈ ℕ`; source fields use `k ∈ {1,…,d}` (E1). (1.2) uses product over j ≤ d (E2). Prop 1.6 `q > 1` read as `q ∈ (1,∞)` (E7). `f` domain kept as `(0,∞]^d` as printed at L204.
- Example 1.5: source says 'three solutions'; fields record this with the R4 'at least three distinct' note. Inventory item `inv:L265:counterexample-claims` bundles the excluded sub-claims (robustness, d = 3, 'arbitrarily large'); it is mapped to NODE with the exclusion stated in REASON; the orchestrator may split the item.
- `rem:hyp-iii-necessary`: the 'appropriate constants' a, b are never specified; `#no-conjugate` relies on the equivalence's converse direction (reconstruction, not named in the source).
- Where a SOURCE_GAP node has no source proof, its locators point to the sentence that invokes the bridge (L238, L252, L262, L350).

**Confirmations.** No Lean evidence was sought: I read the statement parts of the eight frozen declaration files for slice-A theorem roots (Theorem_1_4_FixedPoint, Theorem_1_4_Conjugate, ExistsConjugateIff, Proposition_1_6_FixedPoint, Proposition_1_6_Conjugate, Example_1_5, Remark_HypIII_Necessary, Remark_HypIII_Automatic) only to confirm the R3/R4/R5 split reading; their bodies and any `sorry`/axiom/status content were not used, and no `Conjugate/Internal` file, `STATUS.md` or other implementation file was opened. Source-statement fields were written from the paper text. No anchor ABI was edited or inferred; all `FROZEN_*`, `CONTRACT_*` values are the spec §8 table copied by script (the linter's manifest-binding check passed on the scratch copy; it hashes the manifest JSON and does not read Lean). The only project file written is this packet, `/home/ewain/formalization/graph/packets/slice-A.md`; the existing `graph/packets/slice-X.md` was not touched. Scratch files (template, build script, stub graph for linting) live under the session scratchpad, outside the project.
