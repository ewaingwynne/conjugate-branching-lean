## Nodes

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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
LEAN_STATUS: EXTERNAL
LEAN_REF: -
LEAN_NOTE: -
NOTE: Invoked by name at L508 (Lemma 2.5). Canonical ID from spec section 5. The paper states the hypothesis as 'positive regular and non-singular'; the precise matrix hypothesis (positivity of a power of M) is recorded here as the standard form.

NODE: ext:taylor
KIND: external
TITLE: First-order Taylor expansion with quadratic remainder
STATEMENT_SOURCE: external:standard#first-order-taylor
PROOF_SOURCE: -
CONTRACT_ID: paper.ext:taylor
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: F a map from an open neighborhood of x_0 in R^d to R^d that is differentiable at x_0 with enough regularity near x_0 for a quadratic remainder (regularity not stated by the paper)
SOURCE_QUANTIFIERS: F; x_0; h -> 0
SOURCE_CONCLUSION: F(x_0 + h) = F(x_0) + DF(x_0) h + O(|h|^2) as h -> 0
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: -
ROUTES: -
ROUTE_FOR: -
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
LEAN_STATUS: EXTERNAL
LEAN_REF: -
LEAN_NOTE: -
NOTE: Invoked by name ('By Taylor expansion') at L510-L513 (Lemma 2.5) and in the proof of Prop 1.6 (slice A). Canonical ID from spec section 5. The regularity needed for the O(eps^2) remainder is not discussed by the paper: see the unproved Jacobian claim at lem-gf-bded#jacobian.

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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
NOTE: Source sentence: 'By Proposition 2.1, it follows that 1/A is the vector of extinction probabilities for X-hat' (L431). Uses part (a) of Proposition 2.1 (L395, external). The sub-case A = (1,...,1) (so 1/A = (1,...,1), X-hat = X, extinction probability one by hypothesis) is not spelled out in the source.

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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
NOTE: Markov (branching) property used implicitly in 'Conditional on this'; no canonical node exists for it, so the edge goes to the frozen path-law definition (see report).

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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
DEPS: ext:perron-frobenius, eqn-mean-matrix, claim:mean-matrix-powers, def-bp-basic.positive-regular
ROUTES: -
ROUTE_FOR: -
EDGE: ext:perron-frobenius | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-bded#perron-frobenius@L508-L508 | 'the Perron-Frobenius theorem implies that each of the d components of v is positive'
EDGE: eqn-mean-matrix | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-bded#perron-frobenius@L508-L508 | 'Recall the matrix M from (1.3)': M_kj = E_k[X_j(1)]
EDGE: claim:mean-matrix-powers | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-bded#perron-frobenius@L508-L508 | M^N has entries E_k[X_j(N)] > 0 for the positive regularity time N, which is what Perron-Frobenius needs
EDGE: def-bp-basic.positive-regular | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-bded#perron-frobenius@L508-L508 | 'we have assumed that our branching process is positive regular': source of the positive power of M
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
CONSTANT_SCOPE: N is introduced after lambda, eta in the statement, so literally it may depend on lambda, eta; the proof's N is the positive-regularity time and depends only on X (orchestrator to fix the reading)
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
NOTE: Consumed at L646 (this slice), L689/L676 (lem-monotone-lim), L772/L799 (slice C), L1054 (slice D). Values g_k^{(n)} lie in [0,inf] (g^{(n)}(0) = 0 since f(1) = 1).

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
NOTE: The Markov property is invoked by name in the source; there is no canonical node for it, so the edge goes to the frozen path-law definition (see report).

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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
NOTE: Holder needs r > 0; the case r = 0 (where Z_n = 1 and g^{(n)}(0) = 0) is not discussed in the source.

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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
NOTE: Source writes 'limsup_n |g^{(n)}(eta)| = 0' at L646 for the conclusion of (i); read as lim (typo; limsup = 0 is equivalent to lim = 0 for nonnegative quantities). Side conditions for the reduction (g^{(N)}(lambda) finite and nonzero, limsup_n |g^{(n)}(g^{(N)}(lambda))| < inf) are stated only partially at L646.

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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
NOTE: Minor omission (not a gap node): the finiteness proviso |g^{(n)}(lambda)| < inf of the strict clause of Lemma 2.9 is not discussed for 'n sufficiently large' (L680).

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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
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
NOTE: Proof by contradiction for the first assertion; the m subsequences s = 0,...,m-1 are combined to conclude convergence of the full sequence (routine).

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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: the second assertion is not proved; the source says only 'The statement when g^{(m)}(lambda) > lambda is proven similarly' (L693). The commented-out proof at L696-L715 is not part of the paper and was ignored. The DEPS list is the extractor's reading of 'similarly' (the ingredients of the first assertion); in the divergent case the limits of the monotone subsequences may have infinite components, which the source does not address.

## Coverage

ITEM: inv:heading:L380
KIND: heading
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#heading-sec-proof@L380-L380
DISPOSITION: EXCLUDED
REASON: Section heading 'Proof of main theorem'; no mathematical content and no proof obligation.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -

ITEM: inv:heading:L384
KIND: heading
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#heading-sec-prelim@L384-L384
DISPOSITION: EXCLUDED
REASON: Subsection heading 'Preliminaries on branching processes'; no mathematical content and no proof obligation.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -

ITEM: inv:prop-cond-on-ext
KIND: proposition
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-cond-on-ext@L390-L403
DISPOSITION: NODE prop-cond-on-ext.cond-law, ext:an72-v3-thm2
REASON: Spec R6 split: the conditional-law paragraph (L397-L402) is the root prop-cond-on-ext.cond-law; the first paragraph (L395, only fixed points in [0,1]^d are a and 1) is the external ext:an72-v3-thm2, consumed by prop-conjugate#ext-prob-hat. The clause 'Moreover, this branching process is subcritical' (L402) is a cited result consumed by no root and is not modeled (covered by this item, no separate node).
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -

ITEM: inv:eqn-cond-on-ext
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-cond-on-ext@L398-L398
DISPOSITION: NODE prop-cond-on-ext.cond-law
REASON: Display (2.1) is the offspring-law formula inside the statement of the anchored conditional-law paragraph; part of the root's SOURCE_CONCLUSION, not a separate node.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -

ITEM: inv:proof:prop-cond-on-ext
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-prop-cond-on-ext@L404-L406
DISPOSITION: NODE prop-cond-on-ext.cond-law
REASON: The proof is two citations; its topology (edges to ext:jl08-thm1 and ext:an72-v3-thm2) is recorded on the root node.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -

ITEM: inv:cite:L405:an-branching-processes
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-an-branching-processes@L405-L405
DISPOSITION: NODE ext:an72-v3-thm2
REASON: Citation [an-branching-processes, Theorem 2, Section V.3] is the external leaf for the first paragraph of Prop 2.1.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -

ITEM: inv:cite:L405:jl-cond-on-ext
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-jl-cond-on-ext@L405-L405
DISPOSITION: NODE ext:jl08-thm1
REASON: Citation [jl-cond-on-ext, Theorem 1] is the external leaf for the description of the conditional law.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -

ITEM: inv:prop-conjugate
KIND: proposition
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-conjugate@L420-L428
DISPOSITION: NODE prop-conjugate
REASON: Root anchor for Proposition 2.2 (statement including display (2.2)).
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -

ITEM: inv:eqn-conjugate-def
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-conjugate-def@L423-L423
DISPOSITION: NODE prop-conjugate, prop-conjugate#offspring-law
REASON: Display (2.2) defines X-hat inside the root statement; its well-definedness (normalization from f(A) = A) is the step prop-conjugate#offspring-law.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -

ITEM: inv:proof:prop-conjugate
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-prop-conjugate@L429-L432
DISPOSITION: NODE prop-conjugate#offspring-law, prop-conjugate#abs-continuity, prop-conjugate#hat-pos-reg-nonsing, prop-conjugate#hat-fixed-point, prop-conjugate#ext-prob-hat, prop-conjugate#cond-law-hat
REASON: Proof paragraph split into its substantive steps: normalization (L430), unproved mutual absolute continuity (SOURCE_GAP, L430), regularity transfer (L430), f-hat(1/A) = 1/A (L431), extinction vector via Prop 2.1(a) (L431), conditional law via Prop 2.1 plus Lemma 2.3 (SOURCE_GAP, L431).
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -

ITEM: inv:lem-fixed-pos
KIND: lemma
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-fixed-pos@L440-L446
DISPOSITION: NODE lem-fixed-pos
REASON: Lemma 2.3 statement node.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -

ITEM: inv:eqn-fixed-pos-geq
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pos-geq@L442-L442
DISPOSITION: NODE lem-fixed-pos#geq-one
REASON: Display (2.3) q_k >= 1 is the first assertion, proved by the Fatou argument and reused in the second assertion; modeled as lem-fixed-pos#geq-one.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -

ITEM: inv:proof:lem-fixed-pos
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-lem-fixed-pos@L447-L472
DISPOSITION: NODE lem-fixed-pos#geq-one, lem-fixed-pos#pos-reg-strict, ext:fatou
REASON: Proof has two substantive parts: the Fatou argument (L449-L458, ext:fatou) and the positive-regularity strictness argument (L461-L471).
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -

ITEM: inv:lem-gf-pos
KIND: lemma
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-pos@L477-L487
DISPOSITION: NODE lem-gf-pos
REASON: Lemma 2.4 statement node.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -

ITEM: inv:eqn-gf-pos
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-gf-pos@L479-L479
DISPOSITION: NODE lem-gf-pos
REASON: Display (2.4) is the lemma's conclusion (definition of p_{k,j}(N) and its positivity); part of lem-gf-pos, not a separate node.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -

ITEM: inv:proof:lem-gf-pos
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-lem-gf-pos@L488-L494
DISPOSITION: NODE lem-gf-pos#choose-N0-k0, lem-gf-pos#two-individuals, lem-gf-pos#kj-descendants
REASON: Proof split into witness choice (N_0, k_0), the two-individuals step, and the descendants step giving N = 2N_0 + 1.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -

ITEM: inv:lem-gf-bded
KIND: lemma
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-gf-bded@L500-L506
DISPOSITION: NODE lem-gf-bded
REASON: Lemma 2.5 statement node (carries the Theorem 1.4 setting as SOURCE_HYPOTHESES).
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -

ITEM: inv:proof:lem-gf-bded
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-lem-gf-bded@L507-L515
DISPOSITION: NODE lem-gf-bded#perron-frobenius, lem-gf-bded#finite-nbhd, lem-gf-bded#jacobian, lem-gf-bded#taylor, lem-gf-bded#choose-eps, ext:perron-frobenius, ext:taylor
REASON: Proof split into Perron-Frobenius (L508, ext:perron-frobenius), finiteness near 1 (L510), the unproved Jacobian claim (SOURCE_GAP, L510), Taylor expansion (L510-L513, ext:taylor) and the choice of eps (L514).
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -

ITEM: inv:heading:L525
KIND: heading
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#heading-sec-mono@L525-L525
DISPOSITION: EXCLUDED
REASON: Subsection heading 'Monotonicity properties'; the standing sentence at L528 (setting of Theorem 1.4) is carried as SOURCE_HYPOTHESES of each consuming lemma per spec section 4.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -

ITEM: inv:def-log-gf
KIND: definition
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#def-log-gf@L533-L546
DISPOSITION: NODE def-log-gf
REASON: Frozen definition anchor for Definition 2.6 (g and its iterates).
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -

ITEM: inv:eqn-convex-func-n
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-convex-func-n@L541-L541
DISPOSITION: NODE eqn-convex-func-n
REASON: Display (2.5) is consumed as the characterization of g^{(n)} by lem-mono, lem-unstable-scaled and the skeleton step of lem-unstable-ssl.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -

ITEM: inv:eqn-fixed-pt-equiv
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-fixed-pt-equiv@L549-L549
DISPOSITION: NODE eqn-fixed-pt-equiv
REASON: Display (2.6) is a canonical cross-slice claim (spec section 9).
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -

ITEM: inv:thm-fixed
KIND: theorem
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed@L555-L557
DISPOSITION: NODE thm-fixed
REASON: Theorem 2.7: the node thm-fixed (root) is owned by slice C per spec section 9 (statement L555-L557 lies in slice-B lines, proof L894-L905 in slice C); this packet defines no block for it. Orchestrator: confirm slice C's packet covers it.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -

ITEM: inv:L560:g-convex
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#g-convex-remark@L560-L560
DISPOSITION: EXCLUDED
REASON: Remark that each g_k is convex by Holder's inequality: stated as 'not needed for our proofs' (L559) and the commented-out lemma at L562-L582 is not part of the paper; feeds no root (spec section 7).
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -

ITEM: inv:def-componentwise
KIND: definition
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#def-componentwise@L587-L589
DISPOSITION: NODE def-componentwise
REASON: Definition 2.8 is consumed as the unfolding of '<' in lem-mono, prop-unstable and lem-monotone-lim proofs.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -

ITEM: inv:lem-mono
KIND: lemma
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-mono@L594-L598
DISPOSITION: NODE lem-mono
REASON: Lemma 2.9 statement node.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -

ITEM: inv:proof:lem-mono
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-lem-mono@L599-L604
DISPOSITION: NODE lem-mono#positivity-all-n, lem-mono#strict-ineq
REASON: First assertion is immediate from (2.5) (edge on lem-mono); the strict assertion is split into positivity for all n >= N (Markov property) and the strict-inequality step.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -

ITEM: inv:prop-unstable
KIND: proposition
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-unstable@L608-L615
DISPOSITION: NODE prop-unstable, prop-unstable#part-i, prop-unstable#part-ii
REASON: Proposition 2.10 statement node plus its two parts (i) and (ii) as separate step nodes.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -

ITEM: inv:lem-unstable-scaled
KIND: lemma
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-unstable-scaled@L619-L622
DISPOSITION: NODE lem-unstable-scaled
REASON: Lemma 2.11 statement node.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -

ITEM: inv:proof:lem-unstable-scaled
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-lem-unstable-scaled@L623-L636
DISPOSITION: NODE lem-unstable-scaled#extinction-as, lem-unstable-scaled#holder-bound, lem-unstable-scaled#vitali, ext:holder, ext:vitali
REASON: Proof split into almost-sure extinction (SOURCE_GAP, L628), the Holder bound (L629-L634, ext:holder) and the Vitali conclusion (L635, ext:vitali).
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -

ITEM: inv:proof:prop-unstable
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-prop-unstable@L640-L649
DISPOSITION: NODE prop-unstable#strict-case, prop-unstable#part-i, prop-unstable#part-ii
REASON: Proof split into the strict-in-every-coordinate case (L641-L643), the general case via Lemma 2.9 (L645-L647) and assertion (ii) by role reversal (L648).
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -

ITEM: inv:lem-unstable-ssl
KIND: lemma
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-unstable-ssl@L653-L661
DISPOSITION: NODE lem-unstable-ssl
REASON: Lemma 2.12 statement node.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -

ITEM: inv:proof:lem-unstable-ssl
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-lem-unstable-ssl@L662-L664
DISPOSITION: NODE lem-unstable-ssl#skeleton-hypotheses, lem-unstable-ssl#skeleton-gf, lem-unstable-ssl#apply-prop-unstable
REASON: Proof split into the unproved m-skeleton hypotheses (SOURCE_GAP, 'one easily verifies'), the unstated identification g-tilde = g^{(m)}, and the application of Prop 2.10.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -

ITEM: inv:lem-monotone-lim
KIND: lemma
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-monotone-lim@L669-L673
DISPOSITION: NODE lem-monotone-lim
REASON: Lemma 2.13 statement node.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -

ITEM: inv:proof:lem-monotone-lim
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-lem-monotone-lim@L674-L694
DISPOSITION: NODE lem-monotone-lim#shifted-mono, lem-monotone-lim#limits-exist, lem-monotone-lim#limit-fixed, lem-monotone-lim#limits-zero, lem-monotone-lim#part-b
REASON: Proof split into (2.7), (2.8), the continuity/limit step (SOURCE_GAP), the contradiction argument via Lemma 2.12, and the unproved second assertion ('proven similarly', SOURCE_GAP). The commented-out proof at L696-L715 is ignored.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -

ITEM: inv:eqn-shifted-mono
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-shifted-mono@L677-L677
DISPOSITION: NODE lem-monotone-lim#shifted-mono
REASON: Display (2.7) is the content of the step lem-monotone-lim#shifted-mono.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -

ITEM: inv:eqn-mono-ssl
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-mono-ssl@L682-L682
DISPOSITION: NODE lem-monotone-lim#limits-exist
REASON: Display (2.8) defines the limits lambda-bar^s; it is the content of the step lem-monotone-lim#limits-exist.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-B/sonnet
REVIEWER: -

## Report

**Extractor tag:** `extractor-B/sonnet`. Packet only; nothing merged into the central database.

**Source ranges read**
- Owned lines read in full: paper.tex L380-L721 (L407-L415, L562-L582, L696-L715 are `comment` blocks and were ignored).
- Read-only context: L170-L384 (§1, for the Theorem 1.4 hypotheses at L241-L252 and Prop 1.6), L722-L736 and L826-L837 (slice C consumers of my lemmas), plus a label-usage grep over the whole file to locate cross-slice consumers (L771-L772, L786-L787, L799, L835, L904, L1009, L1054, L1058, L1178).
- Frozen declaration files opened for their statement text only: `Conjugate/Frozen/Proposition_2_1_CondLaw.lean`, `Conjugate/Frozen/Proposition_2_2.lean`, `Conjugate/Frozen/Defs/LogGenFun.lean`. The `by sorry` body and import lines are part of those files; they were not interpreted or used. The `FROZEN_*` fields and `CONTRACT_*` for the three anchors were copied from EXTRACTION_SPEC §8 and checked mechanically against the spec table (all three match).

**Counts**
- Nodes: 53. Roots/anchors: 3 (`prop-cond-on-ext.cond-law`, `prop-conjugate`, `def-log-gf`). Statement-level non-anchor: 8 (`lem-fixed-pos`, `lem-gf-pos`, `lem-gf-bded`, `lem-mono`, `lem-unstable-scaled`, `prop-unstable`, `lem-unstable-ssl`, `lem-monotone-lim`). Others: 2 displays (`eqn-convex-func-n`, `eqn-fixed-pt-equiv`), 1 definition (`def-componentwise`), 25 steps, 7 applications, 7 externals. By KIND: step 25, external 7, application 7, lemma 7, proposition 3, definition 2, display 2.
- Edges: 96 (one EDGE line per DEPS entry; 72 inside this packet, 24 to slice-A IDs). ROUTES: none.
- Coverage: 37 inventory items, each with one disposition: 33 NODE, 4 EXCLUDED (3 headings L380/L384/L525; `inv:L560:g-convex` per spec §7).
- Syntax check: the packet's node and coverage blocks, plus stub leaves for undefined cross-slice IDs, were run through the skill linter in the scratchpad (not in the project). The only diagnostics were the missing dashboard markers and the coverage of the stubs, so frozen-manifest binding, locators, EDGE/DEPS matching and cycles passed. No cycle exists.

**Cross-slice IDs referenced (not defined here)**
- Slice A IDs consumed: `eqn-generating-function` (5 edges), `def-bp-basic.positive-regular` (5), `eqn-gen-func-n` (3), `def:path-law` (3), `def-bp-basic.non-singular` (2), `def:extinction` (2), `eqn-mean-matrix` (2), `claim:mean-matrix-powers` (1), `def:subcritical` (1).
- `thm-fixed` is named only in coverage item `inv:thm-fixed` (node owned by slice C, spec §9); I define no block for it.
- Incoming edges the other slices must supply so that my nodes are in a root closure (only 14 of my 53 nodes reach one of my two roots): `lem-gf-pos` (C L786-L787, D L1009), `lem-gf-bded` (C L771), `lem-mono` (C L772/L799, D L1054), `prop-unstable` (D L1058), `lem-unstable-scaled` (C L835), `lem-monotone-lim` (C L771/L799), `lem-fixed-pos` (C L904, D L1178; also reached here via `prop-conjugate#cond-law-hat`), `eqn-fixed-pt-equiv` (A/C, L553), `def-log-gf` (all of §2.3/§3, D L991), `prop-conjugate` and `prop-cond-on-ext.cond-law` (A: Thm 1.4 equivalence/conjugate roots). `def-componentwise`, `eqn-convex-func-n`, externals and steps are reached through these.
- External IDs defined here (all canonical per spec §5, may be duplicated by other slices and should be deduplicated): `ext:an72-v3-thm2`, `ext:jl08-thm1`, `ext:fatou`, `ext:holder`, `ext:vitali`, `ext:perron-frobenius`, `ext:taylor`. No new `ext:` IDs were introduced.

**Alternate routes:** none found (0 route nodes). The "proven similarly" second half of Lemma 2.13 is a gap, not an alternative derivation.

**SOURCE_GAP nodes (8)**
- `prop-conjugate#abs-continuity`: mutual absolute continuity of first-n-generation laws asserted (L430).
- `prop-conjugate#cond-law-hat`: Prop 2.1's hypothesis `0 < a_k < 1` for `a = 1/A` is not checked (needs Lemma 2.3 via the remark at L437, never cited in the proof); case `A = (1,...,1)` untreated.
- `lem-gf-bded#jacobian`: "M is the Jacobian matrix of f at 1" and quadratic remainder asserted (L510).
- `lem-unstable-scaled#extinction-as`: subcritical => a.s. extinction attributed to Hypothesis I (L628); Def 1.2 (L185) treats it as a separate assumption.
- `lem-unstable-ssl#skeleton-hypotheses`: "One easily verifies" the m-skeleton satisfies Theorem 1.4's hypotheses (L663); no DEPS recorded.
- `lem-unstable-ssl#skeleton-gf` (minor): identification `g-tilde = g^{(m)}` unstated.
- `lem-monotone-lim#limit-fixed`: `g^{(rm)}(lambda-bar^s) = lambda-bar^s` needs continuity of `g^{(m)}`, not argued (L689).
- `lem-monotone-lim#part-b`: second assertion only "proven similarly" (L693); its DEPS are my reading of "similarly".

**Ambiguities / points for the orchestrator to adjudicate**
1. Anchor KIND: spec §8 lists `theorem` for the two propositions; I used `proposition` (and `definition` for `def-log-gf`); both are allowed frozen kinds and the linter does not compare it to the manifest.
2. Markov/branching property has no canonical node. Edges to `def:path-law` stand in for it in `lem-gf-pos#two-individuals`, `lem-gf-pos#kj-descendants`, `lem-mono#positivity-all-n`; a shared claim node in slice A would be cleaner.
3. Definition-unfolding edges (to `def-bp-basic.*`, `def:extinction`, `def:subcritical`, `def-componentwise`, `eqn-generating-function`) are included only where the proof literally unfolds the definition; drop them if spec §8 is read more strictly.
4. `lem-mono` N-scope: the statement introduces `N` after fixed `lambda, eta` (literal reading: may depend on them) while the proof's `N` depends only on X; recorded in CONSTANT_SCOPE, orchestrator to fix the reading (affects slice C/D uses).
5. `prop-cond-on-ext.cond-law` has an edge to `ext:an72-v3-thm2` (the proof cites AN Thm 2 "for the properties of a", i.e. f(a)=a) in addition to `ext:jl08-thm1`; drop if you read the AN citation as covering only paragraph one.
6. `prop-unstable#strict-case -> lem-mono` records an implicit monotonicity step ("this implies", L643); not flagged as a gap.
7. `lem-monotone-lim#shifted-mono`: the finiteness proviso of Lemma 2.9's strict clause is not discussed for "n sufficiently large" (L680); not flagged.
8. L229 "positive regular iff M^N > 0" has no canonical ID; `lem-gf-bded#perron-frobenius` uses `claim:mean-matrix-powers` plus `def-bp-basic.positive-regular` instead.
9. `inv:thm-fixed` is mapped to `NODE thm-fixed` (owned by C); confirm C's packet defines it.
10. Not inventory items but consumed: the standing sentence at L528 (carried as SOURCE_HYPOTHESES, spec §4) and the remark at L437 (used as the evidence for the `lem-fixed-pos` edge).
11. Typos read through: L635 `lim_{k->inf}` as `n -> inf`; L646 `limsup = 0` as `lim`; L431 `(1/A_1,...,1/A_k)` as index `d`; L247 `k in N` as `k in {1,...,d}` (E1); L732 "Definition 2.8" means Def 1.3 (E5, slice C).
12. Prop 2.1's "Moreover, this branching process is subcritical" is covered by `inv:prop-cond-on-ext` but not modeled (consumed by no root).

**Confirmations**
- No Lean evidence was sought: no `Conjugate/Internal`, proof bodies, `sorry`, axioms or Lean status were inspected or used; the three frozen declaration files were opened for statement text only.
- No anchor ABI was edited or inferred: `FROZEN_*`, `CONTRACT_ID` and `CONTRACT_VERSION` of the three anchors were copied verbatim from EXTRACTION_SPEC §8; all other nodes use `-` for the four `FROZEN_*` fields.
- All Lean fields are initialized (`NOT_STARTED`, or `EXTERNAL` for the 7 externals; `LEAN_REF`/`LEAN_NOTE` are `-`).
- The only project file written is `/home/ewain/formalization/graph/packets/slice-B.md`; generator and lint scratch files are under the session scratchpad, outside the project.
