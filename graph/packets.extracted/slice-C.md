## Nodes

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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
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
DEPS: def-bp-basic.positive-regular, eqn-convex-func-n
ROUTES: -
ROUTE_FOR: -
EDGE: def-bp-basic.positive-regular | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-infty-subset#blowup@L732-L732 | 'since our branching process is positive regular (Definition 2.8) there exists N such that ...' (E5: Definition 1.3)
EDGE: eqn-convex-func-n | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-infty-subset#blowup@L732-L732 | g^{(N)}_k(lambda) = log E_k[prod_j e^{lambda_j X_j(N)}] with e^inf = inf is the only available description of g^{(N)} at points with infinite coordinates (not cited by the source)
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: asserted ('since our branching process is positive regular, there exists N such that if any of the d coordinates of lambda is equal to inf, then g^{(N)}(lambda) = (inf,...,inf)', L732) with no argument. The source does not show how positive regularity (P_k[X_j(N) >= 1] > 0 for all k, j) interacts with the infinite-coordinate convention for f^{(N)} and the exponential/log carrier. The paper's 'Definition 2.8' here is Definition 1.3 (E5). The edge to eqn-convex-func-n records the formula through which g^{(N)} can be evaluated at infinite points; the source cites only positive regularity.

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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
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
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); lambda^0 in (0,inf)^d with g(lambda^0) < lambda^0
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; lambda^0
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
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); lambda^0 in (0,inf)^d with lim_n |g^{(n)}(lambda^0)| = 0
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; lambda^0; eps; lambda in [0,eps]^d
SOURCE_CONCLUSION: with eps := min_{j in {1,...,d}} lambda^0_j > 0, for every lambda in [0,eps]^d: lim_{n -> inf} |g^{(n)}(lambda)| = 0
CONSTANT_SCOPE: eps depends only on X (through lambda^0)
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-mono, lem-attractive-zero#orbit-lambda0
ROUTES: -
ROUTE_FOR: -
EDGE: lem-mono | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-zero#comparison@L772-L772 | 'By the monotonicity of g (Lemma 2.9)': lambda <= lambda^0 gives g^{(n)}(lambda) <= g^{(n)}(lambda^0) coordinatewise (first assertion)
EDGE: lem-attractive-zero#orbit-lambda0 | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-zero#comparison@L771-L772 | supplies lim of the norm of g^{(n)}(lambda^0) = 0, which is transferred to every lambda in [0,eps]^d
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
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
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); N and p_{k,j}(N) as in Lemma 2.4 (p_{k,j}(N) := P_k[X_j(N) >= 1 and X_k(N) >= 1] for k != j and p_{k,k}(N) := P_k[X_k(N) >= 2])
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
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); N, m as in lem-attractive-infty#choose-N-m; lambda in [0,inf)^d
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; N; m; lambda in [0,inf)^d; k in {1,...,d}
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
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); N, m as in lem-attractive-infty#choose-N-m; C := log m^{-1}; lambda in [0,inf)^d \ [0,C]^d (i.e. max_j lambda_j > C)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; N; m; C; lambda in [0,inf)^d \ [0,C]^d; k in {1,...,d}
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
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); lambda in [0,inf)^d with g^{(N)}(lambda) > lambda
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; N; lambda in [0,inf)^d
SOURCE_CONCLUSION: lim_{n -> inf} |g^{(n)}(lambda)| = inf
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
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; exists N in N (N as in Lemma 2.4); exists C > 0; for all lambda in [0,inf)^d \ [0,C]^d
SOURCE_CONCLUSION: [Ruled reading E3] there exist N in N (the Lemma 2.4 time with p_{k,j}(N) > 0) and C > 0 such that for every lambda in [0,inf)^d \ [0,C]^d: g^{(N)}(lambda) > lambda (componentwise order of Definition 2.8) and lim_{n -> inf} |g^{(n)}(lambda)| = inf
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
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
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); S_0, S_inf as in (2.9); eps > 0 as in Lemma 2.15
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; eps from Lemma 2.15
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
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); S_0, S_inf as in (2.9); eps > 0 as in Lemma 2.15
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; eps; lambda in S_0; n in N (chosen with g^{(n)}(lambda) in [0,eps)^d)
SOURCE_CONCLUSION: S_0 is a relatively open subset of [0,inf]^d: for each lambda in S_0 there is n with g^{(n)}(lambda) in [0,eps)^d, and (g^{(n)})^{-1}([0,eps)^d) is a neighbourhood of lambda in [0,inf]^d contained in S_0
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
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); S_0, S_inf as in (2.9); C > 0 as in Lemma 2.16
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; C from Lemma 2.16
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
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); S_0, S_inf as in (2.9); C > 0 as in Lemma 2.16
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; C; lambda in S_inf; n in N (chosen with g^{(n)}(lambda) outside [0,C]^d)
SOURCE_CONCLUSION: S_inf is a relatively open subset of [0,inf]^d: for each lambda in S_inf there is n with g^{(n)}(lambda) in [0,inf]^d \ [0,C]^d, and (g^{(n)})^{-1}([0,inf]^d \ [0,C]^d) is a neighbourhood of lambda contained in S_inf
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
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
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); S_0, S_inf as in (2.9); u in [0,inf)^d with |u| = 1; R > r > 0 with ru, Ru in [0,inf)^d \ (S_0 u S_inf)
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
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
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); S_0, S_inf as in (2.9); Lambda := [0,inf)^d \ (S_0 u S_inf); eps and C as in Lemmas 2.15 and 2.16; A(r,R) as in (2.12)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; exists R > r > 0
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
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
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); S_0, S_inf as in (2.9); Lambda := [0,inf)^d \ (S_0 u S_inf); B; pi continuous bijection Lambda -> B with Lambda compact
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; pi; B; phi
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
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); Lambda := [0,inf)^d \ (S_0 u S_inf); r, R and A = A(r,R) as chosen in lem-retract#choose-r-R; B, pi, phi as in the proof of Lemma 2.19
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; r, R; lambda in A; t in [0,1]
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
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); Lambda := [0,inf)^d \ (S_0 u S_inf); A = A(r,R); phi continuous; H as in (2.13)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; (lambda, t) in A x [0,1]
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
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
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); Lambda := [0,inf)^d \ (S_0 u S_inf); A = A(r,R); H as in (2.13); Lambda subset A
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; lambda in A; t in [0,1]
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
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
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); S_0, S_inf as in (2.9); Lambda := [0,inf)^d \ (S_0 u S_inf); r, R as in Lemma 2.19
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; r, R from Lemma 2.19; H_1
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
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); A = A(r,R) as in Lemma 2.19; |.| is any norm on R^d (R1)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; r, R
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
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); A = A(r,R) homeomorphic to a closed d-dimensional Euclidean ball
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; A; F : A -> A
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
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); Lambda := [0,inf)^d \ (S_0 u S_inf); A, H_1 as in thm-fixed#apply-retract; g(Lambda) subset Lambda
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; A; H_1
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
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); Lambda := [0,inf)^d \ (S_0 u S_inf); A, H_1 as in thm-fixed#apply-retract
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; lambda in A
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
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
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); g, g^{(n)} as in Definition 2.6 evaluated on [0,inf]^d; lambda in [0,inf)^d \ {0} with g(lambda) = lambda
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; lambda in [0,inf)^d \ {0} with g(lambda) = lambda
SOURCE_CONCLUSION: lambda in (0,inf)^d (every coordinate of lambda is positive)
CONSTANT_SCOPE: none
FROZEN_FILE: -
FROZEN_DECL: -
FROZEN_ANCHOR_ID: -
FROZEN_ABI_SHA256: -
DEPS: lem-fixed-pos, eqn-fixed-pt-equiv, lem-unstable-scaled#extinction-as, thm-fixed#fixed-point-in-Lambda, thm-fixed#zero-notin-Lambda
ROUTES: -
ROUTE_FOR: -
EDGE: lem-fixed-pos | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#positivity@L904-L904 | 'By Lemma 2.3, in fact lambda in (0,inf)^d': applied to the fixed point q = e^lambda of f in (0,inf)^d, using its second assertion (q_k = 1 for all k or q_k > 1 for all k)
EDGE: eqn-fixed-pt-equiv | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#positivity@L904-L904 | g(lambda) = lambda iff f(e^lambda) = e^lambda: supplies f(q) = q for q = e^lambda (not cited by the source)
EDGE: lem-unstable-scaled#extinction-as | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#positivity@L904-L904 | supplies the premise of Lemma 2.3 that the extinction probability from any state is one, from Hypothesis I of the setting (not discussed at L904)
EDGE: thm-fixed#fixed-point-in-Lambda | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#positivity@L902-L904 | supplies lambda in Lambda with g(lambda) = lambda
EDGE: thm-fixed#zero-notin-Lambda | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#positivity@L904-L904 | gives lambda != 0, so 'lambda in [0,inf)^d \ {0}'; q_k = 1 for all k would force lambda = 0
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: SOURCE_GAP: the source says only 'Since 0 not in Lambda, we have lambda in [0,inf)^d \ {0}. By Lemma 2.3, in fact lambda in (0,inf)^d' (L904). It does not state (a) the translation q := e^lambda with f(q) = q through (2.6); (b) the premise of Lemma 2.3 that the extinction probability is one, which the setting delivers only through Hypothesis I (the same unproved step noted in lem-unstable-scaled#extinction-as at L628); (c) positive regularity (Hypothesis II) for the second assertion; (d) that the dichotomy 'all q_k = 1 or all q_k > 1' together with lambda != 0 gives positivity of every coordinate. lem-unstable-scaled#extinction-as is slice B's node (its fields mention lambda, r and Z_n; the extinction conclusion is what is consumed).

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
DEPS: thm-fixed#positivity
ROUTES: -
ROUTE_FOR: -
EDGE: thm-fixed#positivity | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed@L904-L904 | the proof concludes 'By Lemma 2.3, in fact lambda in (0,inf)^d' for the Brouwer fixed point of g in Lambda
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
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
TOPOLOGY_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
LEAN_STATUS: EXTERNAL
LEAN_REF: -
LEAN_NOTE: -
NOTE: Invoked at L871 ('Therefore, pi restricted to Lambda is a homeomorphism'). Canonical ID from spec section 5.

## Coverage

ITEM: inv:heading:L722
KIND: heading
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#heading-sec-basins@L722-L722
DISPOSITION: EXCLUDED
REASON: Subsection heading 'Basins of attraction of 0 and infinity'; no mathematical content and no proof obligation. The standing sentence of Theorem 1.4 (L528) is carried as SOURCE_HYPOTHESES of each node (spec section 4).
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -

ITEM: inv:eqn-basin-def
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-basin-def@L727-L727
DISPOSITION: NODE eqn-basin-def.zero, eqn-basin-def.infty
REASON: Display (2.9) defines the two basins S_0 and S_inf; it is split into the two frozen definition anchors.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -

ITEM: inv:eqn-infty-subset
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-infty-subset@L733-L733
DISPOSITION: NODE eqn-infty-subset, eqn-infty-subset#blowup
REASON: Display (2.10) is the node eqn-infty-subset; the preceding unproved claim (g^{(N)} blows up when a coordinate is infinite, L732) is the SOURCE_GAP step eqn-infty-subset#blowup.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -

ITEM: inv:lem-basin-closed
KIND: lemma
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-basin-closed@L737-L739
DISPOSITION: NODE lem-basin-closed
REASON: Lemma 2.14 statement.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -

ITEM: inv:proof:lem-basin-closed
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-lem-basin-closed@L740-L742
DISPOSITION: NODE lem-basin-closed
REASON: One-sentence proof ('immediate from the definition (2.9)') is carried by the lemma node and its edges to the two basin definitions; below the step threshold.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -

ITEM: inv:lem-attractive-zero
KIND: lemma
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-zero@L767-L769
DISPOSITION: NODE lem-attractive-zero
REASON: Lemma 2.15 statement.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -

ITEM: inv:proof:lem-attractive-zero
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-lem-attractive-zero@L770-L776
DISPOSITION: NODE lem-attractive-zero#subinvariant-point, lem-attractive-zero#orbit-lambda0, lem-attractive-zero#comparison
REASON: Proof split into: Lemma 2.5 in log coordinates (lambda^0), the application of Lemma 2.13 with m = 1, and the monotone comparison with eps := min_j lambda^0_j.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -

ITEM: inv:lem-attractive-infty
KIND: lemma
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-infty@L781-L784
DISPOSITION: NODE lem-attractive-infty
REASON: Lemma 2.16 statement, read as ruled by E3.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -

ITEM: inv:proof:lem-attractive-infty
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-lem-attractive-infty@L785-L800
DISPOSITION: NODE lem-attractive-infty#choose-N-m, lem-attractive-infty#lower-bound, lem-attractive-infty#strict-increase, lem-attractive-infty#divergence
REASON: Proof split into: the choice of N and m (Lemma 2.4), the lower bound (E3: max_j), the strict increase outside [0,C]^d, and the application of Lemma 2.13(b).
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -

ITEM: inv:lem-basin-open
KIND: lemma
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-basin-open@L804-L806
DISPOSITION: NODE lem-basin-open
REASON: Lemma 2.17 statement.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -

ITEM: inv:proof:lem-basin-open
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-lem-basin-open@L807-L821
DISPOSITION: NODE lem-basin-open#g-iter-continuous, lem-basin-open#S0-open, lem-basin-open#outside-cube-in-Sinf, lem-basin-open#Sinf-open
REASON: Proof split into: continuity of g^{(n)} from Hypothesis III, openness of S_0 via (2.11), the inclusion of the complement of [0,C]^d in S_inf, and openness of S_inf.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -

ITEM: inv:eqn-use-attractive-zero
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-use-attractive-zero@L809-L809
DISPOSITION: NODE eqn-use-attractive-zero
REASON: Display (2.11) is a labeled consequence of Lemma 2.15 used in the openness argument.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -

ITEM: inv:lem-ray-intersect
KIND: lemma
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-ray-intersect@L828-L830
DISPOSITION: NODE lem-ray-intersect
REASON: Lemma 2.18 statement.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -

ITEM: inv:proof:lem-ray-intersect
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-lem-ray-intersect@L831-L836
DISPOSITION: NODE lem-ray-intersect#ray-meets-both, lem-ray-intersect#existence, lem-ray-intersect#uniqueness, ext:connectedness
REASON: Proof split into: the ray meets both basins, the connectedness application (existence), and the contradiction with Lemma 2.11 (uniqueness).
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -

ITEM: inv:lem-retract
KIND: lemma
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-retract@L851-L857
DISPOSITION: NODE lem-retract
REASON: Lemma 2.19 statement.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -

ITEM: inv:eqn-retract-annulus
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-retract-annulus@L853-L853
DISPOSITION: NODE lem-retract
REASON: Display (2.12) defines A(r,R) inside the statement of Lemma 2.19; part of lem-retract, not a separate node.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -

ITEM: inv:proof:lem-retract
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-lem-retract@L858-L891
DISPOSITION: NODE lem-retract#choose-r-R, lem-retract#radial-bijection, lem-retract#Lambda-compact, lem-retract#phi-homeomorphism, lem-retract#H-continuous, lem-retract#H-fixes-Lambda, lem-retract#H-preserves-A, ext:compact-hausdorff
REASON: Proof split into: choice of r, R; the radial bijection; compactness of Lambda; the homeomorphism phi (compact-Hausdorff); and the three verifications for H (continuity, fixing Lambda, mapping A to A); H itself is the node eqn-retract-def.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -

ITEM: inv:eqn-retract-def
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-retract-def@L878-L878
DISPOSITION: NODE eqn-retract-def
REASON: Display (2.13) defines the deformation H_t; labeled display consumed by the verification steps.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -

ITEM: inv:proof:thm-fixed
KIND: proof-region
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-thm-fixed@L894-L905
DISPOSITION: NODE thm-fixed, thm-fixed#g-image-finite, thm-fixed#Lambda-invariant, thm-fixed#apply-retract, thm-fixed#A-homeomorphic-to-ball, thm-fixed#brouwer-on-A, thm-fixed#gH1-self-map, thm-fixed#fixed-point-in-Lambda, thm-fixed#zero-notin-Lambda, thm-fixed#positivity, ext:brouwer
REASON: Proof of Theorem 2.7 split into: invariance of Lambda (with the finiteness bridge), the application of Lemma 2.19, the unproved ball homeomorphism, Brouwer for g o H_1, the fixed point in Lambda, 0 not in Lambda, and the positivity application of Lemma 2.3; assembled in the root node thm-fixed.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -

## Report

**Extractor tag:** `extractor-C/sonnet`. Packet only; nothing merged into the central database.

**Source ranges read**
- Owned lines read in full: paper.tex L722-L907 (the `comment` block L744-L760 was ignored), plus the statement of Theorem 2.7 (L555-L557) and its proof (L894-L905).
- Read-only context: L196-L252 (Theorem 1.4 hypotheses, (1.2)); L436-L475 (Lemma 2.3 statement and proof, for the premises discharged at L904); L525-L604 (standing sentence L528, Definition 2.6, (2.6), Theorem 2.7 statement, Definition 2.8, Lemma 2.9 statement); L606-L649 (Proposition 2.10, Lemma 2.11 and its proof, proof of Proposition 2.10); L690-L721 (end of Lemma 2.13 and its comment block). Slice B's packet was read for node IDs and statement fields (not edited). EXTRACTION_SPEC, INVENTORY (Slice C), DEPGRAPH.header.md and ERRATA.md (author rulings E1-E8) were read; ERRATA was used only to confirm the wording of E3.

**Counts**
- Nodes: 46. Anchors: 3 (`thm-fixed` root, `eqn-basin-def.zero`, `eqn-basin-def.infty`). By KIND: step 23, application 8, lemma 6 (`lem-basin-closed`, `lem-attractive-zero`, `lem-attractive-infty`, `lem-basin-open`, `lem-ray-intersect`, `lem-retract`), display 3 (`eqn-infty-subset`, `eqn-use-attractive-zero`, `eqn-retract-def`), definition 2, theorem 1, external 3 (`ext:brouwer`, `ext:connectedness`, `ext:compact-hausdorff`, none defined in slice B).
- Edges: 104 (one EDGE line per DEPS entry; 86 inside this packet, 18 to slice-B/A IDs). ROUTES: none.
- Coverage: 19 slice-C inventory items, each with exactly one disposition: 18 NODE, 1 EXCLUDED (`inv:heading:L722`). Every node is the target of at least one disposition. `inv:thm-fixed` is slice B's item (disposition `NODE thm-fixed`, already given there); this packet defines `thm-fixed` and also lists it in `inv:proof:thm-fixed`.
- Syntax check: the node and coverage blocks, plus stub leaves for the 12 undefined cross-slice IDs, were run through the skill linter in the scratchpad (not in the project) with `--require-complete-coverage --require-initial-lean-status --require-all-reachable` and `--source-root /home/ewain/formalization`, using a scratch header with `ROOTS: thm-fixed` and the three anchors. Result: no diagnostics (manifest binding of the three anchors, locators, EDGE/DEPS matching, reachability, acyclicity all pass; all 46 nodes feed `thm-fixed`).

**Cross-slice IDs referenced (not defined here)**
- Slice B: `lem-gf-bded` (1 edge: L771), `lem-gf-pos` (1: L786-L787), `lem-mono` (1: L772), `lem-monotone-lim` (2: L771, L799), `lem-unstable-scaled` (1: L835), `lem-fixed-pos` (1: L904), `eqn-fixed-pt-equiv` (1: L904, not cited by the source), `def-log-gf` (4), `def-componentwise` (2), `eqn-convex-func-n` (2), `lem-unstable-scaled#extinction-as` (1: L904, supplies Lemma 2.3's premise "extinction probability one").
- Slice A: `def-bp-basic.positive-regular` (1: L732).
- Not consumed by slice C: `prop-unstable` and its parts (L731 gives Proposition 2.10 only as motivation for the lim/limsup asymmetry and consumes no result, so no edge was added; `prop-unstable` must reach a root through slice D, as slice B already notes), `lem-unstable-ssl`, `eqn-gen-func-n`.
- Canonical IDs defined here and consumed by other slices: `thm-fixed` (consumed by slice A's Theorem 1.4 roots), `lem-basin-closed`, `lem-attractive-zero`, `lem-attractive-infty`, `lem-basin-open`, `lem-ray-intersect`, `lem-retract`, `eqn-infty-subset`, `eqn-basin-def.zero`, `eqn-basin-def.infty`.
- External IDs defined here: `ext:brouwer`, `ext:connectedness`, `ext:compact-hausdorff` (all canonical per spec section 5; dedupe if another slice also defines them). No new `ext:` IDs were introduced.

**Alternate routes:** none found (0 route nodes).

**SOURCE_GAP nodes (5)**
- `eqn-infty-subset#blowup`: positive regularity gives N with g^{(N)}(lambda) = (inf,...,inf) whenever a coordinate of lambda is infinite (L732), asserted without argument.
- `lem-retract#Lambda-compact`: "relatively closed subset of [0,inf]^d by Lemma 2.17" (L870) silently needs (2.10) to identify Lambda with the complement of S_0 u S_inf in [0,inf]^d.
- `thm-fixed#g-image-finite`: "if lambda in Lambda then g(lambda) in Lambda" (L896) does not say why g(lambda) has finite coordinates (needs (2.10)).
- `thm-fixed#A-homeomorphic-to-ball`: "The set A is homeomorphic to a closed d-dimensional Euclidean ball" (L898), asserted without argument, for an arbitrary norm.
- `thm-fixed#positivity`: "By Lemma 2.3, in fact lambda in (0,inf)^d" (L904) leaves unstated the translation q = e^lambda via (2.6), the discharge of Lemma 2.3's premise "extinction probability one" (which the setting gives only through Hypothesis I; the same unproved step as slice B's `lem-unstable-scaled#extinction-as`), and the dichotomy-plus-nonzero argument.

**Rulings and conventions applied**
- E3: `lem-attractive-infty` records the ruled reading in SOURCE_CONCLUSION (g^{(N)}(lambda) > lambda and lim |g^{(n)}(lambda)| = inf, N the Lemma 2.4 time, max_j in the lower bound of `lem-attractive-infty#lower-bound`) and says so in NOTE.
- E5: L732 "Definition 2.8" read as Definition 1.3 (noted in `eqn-infty-subset#blowup`). E1: Hypothesis III read for k in {1,...,d} (standing-setting text copied from slice B). R1: "|.|" is any norm in (2.9).

**Ambiguities and decisions for the orchestrator**
1. `g^{-1}(S)` in Lemma 2.14 is read as the preimage within [0,inf]^d (otherwise `g^{-1}(S_0) subset S_0` fails trivially for points with negative coordinates); the forward inclusions silently use g([0,inf]^d) in [0,inf]^d, which the source states only at L814. No edge from `lem-basin-closed` to `lem-basin-open#g-iter-continuous` was added because the source's proof cites only (2.9).
2. `lem-basin-open#g-iter-continuous` ("By Hypothesis III", L814) is a step but not a SOURCE_GAP (the source names the hypothesis that delivers it); a reviewer may disagree. It is reused at L820, L896 and L902.
3. `lem-attractive-infty`: the literal text proves `>=` only at min_j lambda_j = C and the statement asks for C > 0 while C := log m^{-1} >= 0; both are covered by E3 / "any larger C works" and recorded in NOTE only.
4. `thm-fixed#positivity` reuses slice B's `lem-unstable-scaled#extinction-as` for the extinction premise although that node's fields mention lambda, r and Z_n; recommend factoring a shared "extinction probability one under Hypothesis I" node and pointing both consumers at it.
5. `thm-fixed` does not depend on (2.6) except through `thm-fixed#positivity`; the equivalence of Theorem 1.4 and Theorem 2.7 stated at L553 is consumed by slice A's roots, not by this proof.
6. The reason for "0 not in Lambda" (L904) is not given; modeled as 0 in [0,eps]^d subset S_0 (Lemma 2.15), with Lambda subset A(r,R), r > 0 noted as an alternative reading.
7. "Deformation retracts" (Lemma 2.19) is defined only in the proof (L881-L890); SOURCE_CONCLUSION states the plain claim, NOTE records the strong form the proof verifies (and which Theorem 2.7 uses as a retraction at L901).
8. Boundedness of Lambda (Lemma 2.16, L870) is invoked by the source although closedness in the compact [0,inf]^d already gives compactness; kept as an edge of `lem-retract#Lambda-compact` because the proof explicitly cites it.
9. The two definition anchors record in SOURCE_HYPOTHESES only X, f, g and the norm, with the Theorem 1.4 setting mentioned as paper context, because the definition uses none of Hypotheses I-III (as slice B did for `def-log-gf`). Theorem 1.4's full setting is recorded in every non-definition node. Orchestrator to confirm against the frozen statements.
10. Display (2.11) (`eqn-use-attractive-zero`) is a node because it is labeled and consumed by name at L816; (2.12) is part of `lem-retract`'s statement (not a node), (2.13) is the node `eqn-retract-def`.
11. `eqn-infty-subset#blowup` carries an edge to `eqn-convex-func-n` (the formula through which g^{(N)} is evaluated at infinite points) although the source cites only positive regularity; drop the edge if the reviewer prefers to keep edges to cited results only.

**Confirmations**
- No Lean evidence was sought: no Lean file of any kind was opened (not even the frozen declaration files); `Conjugate/Internal`, proof bodies, `sorry`, axioms and Lean status were not inspected. The only contact with the frozen manifest was through the skill linter run in the scratchpad (which hashes the manifest and binds anchor identities; it prints no Lean status).
- No anchor ABI was edited or inferred: `FROZEN_*`, `CONTRACT_ID` and `CONTRACT_VERSION` of `thm-fixed`, `eqn-basin-def.zero`, `eqn-basin-def.infty` were copied verbatim from EXTRACTION_SPEC section 8 (the linter's manifest binding accepted them); all other nodes use `-` in the four `FROZEN_*` fields.
- All Lean fields are initialized (`NOT_STARTED`, or `EXTERNAL` for the 3 externals; `LEAN_REF` and `LEAN_NOTE` are `-`).
- Files changed: only this packet, `/home/ewain/formalization/graph/packets/slice-C.md`. Scratch files (generator, scratch graph and manifest used for the lint) live only under the session scratchpad.
