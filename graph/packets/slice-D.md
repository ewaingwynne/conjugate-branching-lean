## Nodes

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
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed-pt-infty@L989-L1179
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
REVIEWER: queue-reviewer/sonnet
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
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: queue-reviewer/sonnet
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
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: queue-reviewer/sonnet
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
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: queue-reviewer/sonnet
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
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: queue-reviewer/sonnet
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
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: queue-reviewer/sonnet
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
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: queue-reviewer/sonnet
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
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: queue-reviewer/sonnet
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
EDGE: lem-fixed-pos#pos-reg-strict | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-thm-fixed-pt-infty@L1178-L1178 | analogy only: 'an argument similar to that in the second paragraph of the proof of Lemma 2.3' (L461-L471): one coordinate q_{j_*}>1 plus positive regularity forces q_k>1 for all k
EDGE: def-bp-basic.positive-regular | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-thm-fixed-pt-infty@L1178-L1178 | 'Since each truncated branching process X^d is positive regular (Definition 1.3)': supplies N with ℙ_k[X_{j_*}(N)≥1]>0
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: queue-reviewer/sonnet
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
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: queue-reviewer/sonnet
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
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: queue-reviewer/sonnet
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
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: queue-reviewer/sonnet
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
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: queue-reviewer/sonnet
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
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: queue-reviewer/sonnet
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
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: queue-reviewer/sonnet
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
TITLE: Position of f̃_k relative to the diagonal: f̃_k(x)>x for x>e^{η_k}; f̃_1(x)≤x on [1,e^{η_1}]
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-1d-soln@L1134-L1136
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-1d-soln@L1134-L1136
CONTRACT_ID: paper.lem-1d-soln#diagonal-position
CONTRACT_VERSION: 1
SOURCE_HYPOTHESES: k∈ℕ with ℙ_k[X_k(1)≥2]>0
SOURCE_QUANTIFIERS: X; k; η_k the unique solution of (3.15) supplied by lem-1d-soln#apply-prop-1-6 (f̃_k(e^{η_k})=e^{η_k}); x > e^{η_k} for the first conclusion; k = 1 and x ∈ [1,e^{η_1}] for the second
SOURCE_CONCLUSION: since f̃_k is convex with f̃_k(1)=1 and f̃_k(e^{η_k})=e^{η_k}: x<f̃_k(x) for all x>e^{η_k} (L1134); for k=1 only, as stated at L1136: f̃_1(x)≤x for all x∈[1,e^{η_1}]
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
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: queue-reviewer/sonnet
LEAN_STATUS: NOT_STARTED
LEAN_REF: -
LEAN_NOTE: -
NOTE: the inequality f̃_k(x)≤x on [1,e^{η_k}] is stated in the source only for k=1 (L1136, 'By convexity'); only that case is consumed (#eta1-lt-log-t). The strict part for general k is consumed by #bound-by-eta.

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
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: queue-reviewer/sonnet
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
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: queue-reviewer/sonnet
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
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: queue-reviewer/sonnet
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
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: queue-reviewer/sonnet
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
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: queue-reviewer/sonnet
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
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: queue-reviewer/sonnet
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
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: queue-reviewer/sonnet
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
TOPOLOGY_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: queue-reviewer/sonnet
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

## Coverage

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
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-extinction-facts@L930-L934
DISPOSITION: EXCLUDED
REASON: cited background in L930-L934 on partial and local extinction, the inequalities q ≤ q(A) ≤ q̃ ≤ 1, the fixed-point sets S and Q and their literature (L930-L932) and the countable-type conjugate remark L934 (also item inv:L934:ctble-conjugate-extension) is excluded by spec §7: no step of Theorem 3.1 or Example 3.5 consumes it. Not excluded: the definition of global extinction in L930 (separate item inv:L930:global-extinction-def) and the truncation paragraph L936-L937 (separate item inv:L936:def-truncation)
COVERAGE_STATUS: REVIEWED
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
DISPOSITION: NODE prop-cond-on-ext.ctble.cond-law, prop-conjugate.ctble, prop-conjugate.ctble#offspring-law, prop-conjugate.ctble#ext-prob-hat, prop-conjugate.ctble#cond-law-hat, thm-fixed-gf.equivalence.ctble, thm-fixed-gf.equivalence.ctble#fixed-point-to-conjugate, thm-fixed-gf.equivalence.ctble#conjugate-to-fixed-point
REASON: Re-scoped by the author's ruling R8 (2026-10-28): the countable-type (2.1), Proposition 2.2 and the conjugate/fixed-point correspondence are now frozen roots (batch 2); E10 records that the correspondence needs positive regularity. The partial-extinction remark (last sentence) remains excluded (R8(e)). [Phase 2 disposition was EXCLUDED: countable-type extension of (2.1) and Proposition 2.2 (conjugate processes correspond to fixed points in (1,∞)^ℕ) is excluded by spec §7: the proof of Theorem 3.1 constructs only a fixed point and does not consume it. Proof obligation not modeled: the step fixed point implies conjugate process asserted at L934 and in the first sentence of Example 3.5 (L1183)]
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:cite:L934:jl-cond-on-ext.2
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L934-jl-cond-on-ext-2@L934-L934
DISPOSITION: NODE prop-cond-on-ext.ctble.cond-law
REASON: Re-scoped by R8: the citation supports the countable-type (2.1), now the root prop-cond-on-ext.ctble.cond-law (edge to ext:jl08-thm1). [Phase 2 disposition was EXCLUDED: citation supporting the countable-type extension of (2.1) and Proposition 2.2 (L934, excluded by spec §7); Theorem 3.1 and Example 3.5 produce a fixed point of f and never consume this extension]
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: reviewer-D/sonnet

ITEM: inv:cite:L934:jl-cond-on-ext.3
KIND: citation
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#cite-L934-jl-cond-on-ext-3@L934-L934
DISPOSITION: NODE prop-cond-on-ext.ctble.cond-law
REASON: Re-scoped by R8: as inv:cite:L934:jl-cond-on-ext.2. [Phase 2 disposition was EXCLUDED: citation supporting the countable-type extension of (2.1) and Proposition 2.2 (L934, excluded by spec §7); Theorem 3.1 and Example 3.5 produce a fixed point of f and never consume this extension]
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
DISPOSITION: NODE thm-fixed-pt-infty
REASON: Theorem 3.1 statement node (the frozen root)
COVERAGE_STATUS: REVIEWED
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
REASON: Example 3.5 root, the asserted verifications (global extinction, Assumptions I-IV, existence of s and t, each a SOURCE_GAP step), the note on finite offspring (L1192), the application of Theorem 3.1 (L1183), and the frozen definition anchor for stochastic domination (L1194). L1193 (concrete sampling construction) is an illustration with no claim and is not modeled
COVERAGE_STATUS: REVIEWED
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
REASON: the global-extinction sentence (L958) and Assumptions I-IV (labels item-gf-trunc-infty, item-gf-growth-infty, item-gf-bded-infty, item-gf-perturb-infty; numbered display (3.4) at L970 is the inequality of Assumption II; unnumbered displays L974, L978-L979) are a local hypothesis package (spec §4): recorded whole in SOURCE_HYPOTHESES of the root and of the §3.2 lemmas and steps, used by name at L1028 and L1195, and each assumption is verified for Example 3.5 by the example-ctble#assume-I..IV nodes. The weights remark L982-L983 is expository (pointer to Example 3.5) and excluded
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: queue-reviewer/sonnet

ITEM: inv:L927:ctble-fn-iterate
KIND: definition
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-fn-iterate@L927-L927
DISPOSITION: NODE thm-fixed-pt-infty#positivity
REASON: 'We also define f^{(n)} to be the composition of f with itself n times' for the countable-type f of L920-L926; its only consumer is the unwritten countable-type identity f^{(N)}_k(q)=𝔼_k[∏_j q_j^{X_j(N)}] behind the SOURCE_GAP of #positivity (L1178); every other iterate in §3 is g^{d,(n)} of a finite-type truncation
COVERAGE_STATUS: REVIEWED
EXTRACTOR: extractor-D/sonnet
REVIEWER: queue-reviewer/sonnet

ITEM: inv:L928:ctble-regularity-extension
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-regularity-extension@L928-L928
DISPOSITION: NODE def-bp-basic.positive-regular, def-bp-basic.non-singular
REASON: Re-scoped by R8: positive regularity and non-singularity for countable types are now consumed as premises of the batch-2 roots (R8(b), (c), E10). [Phase 2 disposition was EXCLUDED: extends positive regularity and non-singularity (Definition 1.3) to countable-type X; never consumed: Assumption I (L961), Lemma 3.4 (L1117) and the proof of Theorem 3.1 (L1178) use these notions only for the finite-type truncations X^d]
COVERAGE_STATUS: PROPOSED
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


## Report

**Extractor tag:** `extractor-D/sonnet`. Packet only; nothing merged into the central database; every record is PROPOSED with no reviewer.

**Source ranges read**
- Owned lines read in full: paper.tex L908-L1215 (§3; the `comment` block L1204-L1213 was read only to confirm it is not part of the paper and was not used).
- Read-only context: L440-L472 (Lemma 2.3 proof, for the final positivity step), a grep for `dominated`/`stochastic` over the whole file, and L900-L907 (end of the proof of Theorem 2.7).
- Packets read (read-only) for cross-slice IDs: `packets/slice-A.md` (node blocks L1-L864, i.e. through `prop-single-type.fixed-point` and its step nodes, and the report), `packets/slice-B.md` (externals, `prop-cond-on-ext.cond-law`, Lemmas 2.3-2.5, Def 2.6, (2.5)-(2.6), Lemma 2.9, Prop 2.10 and its parts, plus coverage and report samples), and the node list of `packets/slice-O.md` (`claim:branching-property`, which this slice does not need). Also the skill, both templates, `graph/EXTRACTION_SPEC.md`, `graph/INVENTORY.md` (Slice D), `graph/DEPGRAPH.header.md`.

**Counts**
- Nodes: 52. Anchors: 4 (roots `thm-fixed-pt-infty`, `example-ctble`; definition anchors `def:truncation`, `def:stoch-dom`). By KIND: step 31, application 9, lemma 3 (`lem-fixed-limsup`, `lem-fixed-liminf`, `lem-1d-soln`), definition 2, display 2 (`eqn-gf-truncated`, `eqn-log-gf-infty`), theorem 2, external 2 (`ext:dct`, `ext:diagonal-subsequence`), claim 1 (`eqn-log-gf-truncated`).
- Edges: 122 (one EDGE line per DEPS entry; no ROUTES). 101 inside this packet, 21 to slice-A/B IDs.
- Coverage: 43 inventory items, each with one disposition: 31 NODE, 12 EXCLUDED (3 headings L908/L913/L955; the L930 extinction-facts claim and 4 citations Bertacchi2014/Bertacchi2020/Bertacchi2022/Moyal1964; the L934 countable-conjugate-extension claim and its 2 jl-cond-on-ext citations; the L952 hln-ext-prob attribution). Every one of the 52 nodes is named by at least one item.
- Structural check: the final packet was merged on a scratch copy outside the project with the current packets of slices A, B, C and the orchestrator-owned slice O (header from `graph/DEPGRAPH.header.md`, `--source-root` set, flags `--require-complete-coverage --require-initial-lean-status --require-all-reachable --check`). The only diagnostics were non-slice-D: `def-bp-basic.positive-regular#matrix-equiv` outside every root closure (slice A), `claim:branching-property` not named by any coverage item (slice O), and the stale dashboard. No diagnostic mentions a slice-D node: no dangling or duplicate ID, cycle, frozen-binding, locator or EDGE/DEPS-count error, every slice-D node is covered and inside a root closure.

**Cross-slice IDs consumed (not defined here)**
- Slice A: `eqn-generating-function` (4 edges), `def-bp-basic.positive-regular` (2), `def-bp-basic.non-singular` (2), `def:subcritical` (2), `def:extinction` (1), `eqn-gen-func-n` (1), `thm-fixed-gf.fixed-point` (1), `prop-single-type.fixed-point` (1).
- Slice B: `def-log-gf` (1), `eqn-fixed-pt-equiv` (1), `eqn-convex-func-n` (1), `lem-gf-pos` (1), `lem-mono` (1), `prop-unstable` (1), `lem-fixed-pos#pos-reg-strict` (1; a sub-step ID defined by slice B, not the canonical `lem-fixed-pos`; see ambiguity 11).
- Incoming edges slice D provides for others: none (§3 is the last slice). Nodes of other slices that become reachable only through slice D: `lem-gf-pos` (L1009), `lem-mono` (L1054), `prop-unstable` (L1058), `lem-fixed-pos#pos-reg-strict` (L1178), `thm-fixed-gf.fixed-point` (L998), `prop-single-type.fixed-point` (L1125), `eqn-fixed-pt-equiv` (L998-L1000), `eqn-convex-func-n` (L1019), `eqn-gen-func-n` (L1178), `def-bp-basic.non-singular` (L1117).
- New external IDs defined here (canonical per spec §5, not defined by slices A/B): `ext:dct`, `ext:diagonal-subsequence`. No new non-canonical `ext:` IDs. Non-canonical internal IDs: the step/application nodes `<parent>#<slug>`, plus `eqn-log-gf-infty` (display (3.5)) and `eqn-log-gf-truncated` (log form of (3.2)); canonical IDs defined here: `thm-fixed-pt-infty`, `example-ctble`, `def:truncation`, `def:stoch-dom`, `eqn-gf-truncated`, `lem-fixed-limsup`, `lem-fixed-liminf`, `lem-1d-soln`.

**Alternate routes:** none found (0 route nodes).

**SOURCE_GAP nodes (11)**
- `thm-fixed-pt-infty#positivity`: strict positivity only by "an argument similar to the second paragraph of the proof of Lemma 2.3" (L1178); transfer of positive regularity from the truncations X^d to X, the countable-type (1.2) and g^{(N)}(λ)=λ, and the N/d order are unwritten.
- `lem-1d-soln#single-type-subcritical`, `lem-1d-soln#single-type-continuous`: "it is immediate that X̃^k is subcritical and f̃_k is continuous" (L1125).
- `lem-1d-soln#convexity`: "(its second derivative is positive)" (L1134) with no computation.
- `example-ctble#global-extinction`, `#assume-I`, `#assume-II`, `#assume-III`, `#assume-IV`: "One can easily verify … the assumptions of Theorem 3.1 are satisfied" (L1195) with no argument; global extinction is never even mentioned.
- `example-ctble#choose-s`, `#choose-t`: "existence of such an s and t follows easily from (3.23)" (L1200).
The roots `thm-fixed-pt-infty` and `example-ctble` carry no SOURCE_GAP marker themselves; their children do.

**Ambiguities / points for the orchestrator**
1. Manifest range of `def:stoch-dom` is paper.tex:1188-1190, which holds the display (3.23); the phrase "stochastically dominated" occurs only at L1194. The locator follows the text (L1194); no anchor field was touched.
2. L937 (definition of X^d) says "an individual of X corresponds to one of X^d iff each of its ancestors has type k≤d", omitting the individual's own type; (3.2) and L1120 (for X̃^k: "the individual and all of its ancestors") show the own type must be ≤ d too. Source field copies the paper's wording; flagged in the node NOTE.
3. L1127 prints "For each k≥d" for the statement of (3.18); read as d≥k (the lemma says "for each d≥k"). Not an author ruling; consider adding to ERRATA.
4. E4 applied at L1075 (tail arguments 1,1,… of g_k in (3.13) read as 0,0,…; L1139 prints 0,0,…). Carried by the claim node `eqn-log-gf-truncated` (not a printed display) so that (3.9), (3.13), (3.17) and (3.20) share one reading.
5. "Global extinction probability one" (L958) does not say for which starting type; read as for every k∈ℕ. The hypothesis is not consumed by any step of the proof of Theorem 3.1 (the finite-type results are applied to X^d via Assumption I). It is modeled only in `example-ctble#global-extinction`.
6. Witness-choice policy: the selection d↦λ^d (3.6, "chosen in an arbitrary manner") is carried as a hypothesis (3.6) of Lemmas 3.2-3.4 and as an application node `thm-fixed-pt-infty#choose-lambda-d`; the lemmas and the proof use only λ^d∈(0,∞)^d and g^d(λ^d)=λ^d. Lemma 3.3's K is, literally, introduced after the selection; the proof's K depends only on φ, ψ, δ=log s. Recorded in CONSTANT_SCOPE/NOTE; orchestrator to fix the reading. The assumption witnesses are read with the quantifier order φ,ψ then s (for this φ) then t (for these φ,ψ).
7. L1125 prints f̃_k "continuous from (0,∞] to [0,∞]" while Proposition 1.6 (III) needs codomain (0,∞]; values are in (0,∞] because f̃_k(x)=𝔼_k[x^{X_k(1)}]>0 (not written). Source field keeps the printed [0,∞].
8. L1183 says Theorem 3.1 "implies the existence of a conjugate branching process", while the formal content of the example is that the assumptions hold and hence a fixed point exists; the fixed-point-to-conjugate step (L934) is excluded by spec §7. I read the sentence as part of the claim (so `example-ctble` depends on `thm-fixed-pt-infty` through `example-ctble#apply-thm-3-1`) with conclusion "∃q∈(1,∞)^ℕ, f(q)=q"; the frozen Example 3.5 statement agrees with this reading. If the root should stop at "assumptions satisfied", drop `#apply-thm-3-1` and its two edges.
9. L1192 states finite support only for ℙ_1; by E8 the same holds for each ℙ_k, so `example-ctble#finite-offspring` records it for all k. It is below the step threshold in difficulty (Markov-type); included because (3.1) is a premise of the countable-type setting and is invoked at L1160.
10. `thm-fixed-pt-infty#positivity` also uses `eqn-gen-func-n` (finite-type (1.2)) by analogy, since the countable-type iteration identity is never stated; drop the edge if the orchestrator prefers to record only the pointer to Lemma 2.3.
11. The positivity step points to "the second paragraph of the proof of Lemma 2.3"; I used slice B's sub-step ID `lem-fixed-pos#pos-reg-strict` (L461-L471) rather than the canonical `lem-fixed-pos`, because Lemma 2.3 itself is stated for finitely many types and only that paragraph is imitated. Retarget if slice B renames it.
12. `inv:eqn-log-gf-infty`: the anchor `def-log-gf` already has manifest range L533-L546,L991-L995. I nevertheless created a display node `eqn-log-gf-infty` (depending on that anchor) so that the item has a slice-D node and downstream steps point at the countable-type/truncated version. Alternative: map the item to `def-log-gf` and retarget the 10 edges to it.
13. `lem-1d-soln#convexity` makes the same claim as slice A's `prop-single-type#strict-convexity` (Prop 1.6 proof); the source of Lemma 3.4 does not cite that proof, so no edge is added. An edge could be added after the premises of Proposition 1.6 for X̃^k are discharged.
14. Definition-unfolding edges in `example-ctble#assume-I` (to `def:subcritical`, `def-bp-basic.positive-regular`, `def-bp-basic.non-singular`, `def:truncation`) record the obligation to verify those definitions and are not source-stated proof steps; drop them if spec §8 is read strictly.
15. Equation numbers used in titles (3.1)-(3.22) were obtained by counting numbered environments (`\eqb`, `\allb`) in §3: (3.3) is `eqn-weight-function` (L963); the displays at L969-L971 (growth inequality of Assumption II), L1046-L1048 ((3.8)) and the final display L1196-L1199 (unnumbered) are not labelled in the source. (3.23) is `eqn-example-condition`. The numbers match the orchestrator's (3.6), (3.13), (3.19)-(3.22) and E4's (3.13).
16. Lemma 3.3: Step 2 never writes the closing inequality for all d (it ends at λ^d_1≥δ/2, L1095); the liminf conclusion is the two-case inference recorded in `#step2` (below the step threshold, not a gap).

**Inventory gaps (proposed supplementary items, not in the Coverage section above)**
The inventory has no item for: the truncation definition L936-L937 (→ `def:truncation`); the countable-type f and f^{(n)} at L920-L928 (→ anchors `eqn-generating-function`, `def:population-sigma`; no slice-D node); the assumption list L960-L981 (→ `thm-fixed-pt-infty`, and consumers); the growth inequality L969-L971 (→ `thm-fixed-pt-infty`, `lem-fixed-liminf#growth-compare`, `lem-1d-soln#growth-bound`); the display (3.8) at L1046-L1048 (→ `lem-fixed-liminf#subinvariant-weights`); the sentence L996 "it suffices to find λ…" (→ `thm-fixed-pt-infty#reduce-to-g`; currently mapped through `inv:eqn-log-gf-infty`); the note L1192 (→ `example-ctble#finite-offspring`); the display L1196-L1199 (→ `example-ctble#choose-s`, `#choose-t`); the sentence L1194 "stochastically dominated" (→ `def:stoch-dom`). Each is already carried by a node; they are mentioned so the orchestrator can add items if it wants a one-to-one inventory.

**Confirmations**
- No Lean evidence was sought. I opened the statement text of exactly four frozen declaration files named in the anchor table, `Conjugate/Frozen/Defs/Truncate.lean`, `Conjugate/Frozen/Defs/StochDominated.lean`, `Conjugate/Frozen/Theorem_3_1.lean` and `Conjugate/Frozen/Example_3_5.lean`, to cross-check source-field wording and the reading in ambiguity 8; the `by sorry` bodies and import lines belong to those files and were not interpreted or used. Source-statement fields were written from the LaTeX; the stochastic-domination definition in `StochDominated.lean` was not copied into `def:stoch-dom` (the node says the paper uses the notion without defining it). No `Conjugate/Internal` file, `STATUS.md`, proof body or axiom/status material was opened.
- No anchor ABI was edited or inferred. All `FROZEN_*`, `CONTRACT_ID` and `CONTRACT_VERSION` values of the four anchors were copied by script from the spec §8 table; the other 48 nodes use `-` for the four `FROZEN_*` fields and `paper.<node-id>` / `1`.
- The only project file written is this packet, `/home/ewain/formalization/graph/packets/slice-D.md`. Generator scripts, the report draft and the lint copy are scratch files under the session scratchpad, outside the project; no other slice packet was edited.
