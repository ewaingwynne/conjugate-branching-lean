# Queue review — independent topology review of GLOBAL_QUEUE.md

Reviewer: `queue-reviewer/sonnet`. Scope: 75 node records and 58 coverage items of `graph/GLOBAL_QUEUE.md`. Method: every cited source span re-read in `fixed-pt-finite-type.tex` (comment blocks ignored); source-statement fields re-derived from the raw statements; DEPS/EDGE checked against the consumer's text; frozen fields compared with `EXTRACTION_SPEC.md` §8 (all five queued anchors match: `def:population-sigma`, `def-bp-basic.positive-regular`, `thm-fixed-gf.conjugate`, `thm-fixed`, `example-ctble`); non-anchor nodes have `FROZEN_*: -` and `CONTRACT_ID: paper.<id>` / version 1; DEPS and EDGE sets agree for all queued nodes; no dangling or cyclic edge (linter `--report` run, nothing written); no Lean file opened. No file other than this report was modified.

## 1. Verdicts

Nodes: 65 PASS, 10 FAIL. Coverage items: 56 PASS, 2 FAIL.

### 1a. Nodes

FAIL def:population-sigma: NOTE contradicts the graph (it says no definition-to-definition edge is proposed, but def:step-kernel DEPS def:population-sigma; it says the node is consumed through eqn-gen-func-n / claim:mean-matrix-powers, which do not list it) and SOURCE_CONCLUSION carries a process reference ('slice B'); fragment in Q1
PASS def-bp-basic.positive-regular | spans re-read L225-L229
PASS eqn-gen-func-n | spans re-read L209-L213
PASS claim:mean-matrix-powers | spans re-read L219-L220
PASS thm-fixed-gf.fixed-point#reduce-to-thm-2-7 | spans re-read L241-L250, L548-L557
PASS thm-fixed-gf.conjugate | spans re-read L241-L250
PASS thm-fixed-gf.equivalence#hat-differs-from-X | spans re-read L238
PASS thm-fixed-gf.equivalence#fixed-point-to-conjugate | spans re-read L238
FAIL thm-fixed-gf.equivalence#conjugate-regularity: NOTE contains orchestrator-directed text ('retained as an ambiguity for the orchestrator ... if the orchestrator prefers ... must instead be marked DISPUTED') and extractor-process remarks; SOURCE_CONCLUSION has an explanatory parenthetical; topology (leaf, SOURCE_GAP) is accepted; fragment in Q9
FAIL thm-fixed-gf.equivalence#conjugate-is-tilt: NOTE says the edges are 'the reconstruction indicated by the orchestrator' (process text left in a field); edges, fields and SOURCE_GAP tag are otherwise accepted; fragment in Q10
FAIL prop-single-type#mean-eq-derivative: DEPS/EDGE to eqn-mean-matrix is not consumed at L354 (E[X(1)] = f'(1) uses only the definition of f and finiteness near 1) and its rationale cites L510 (a different proof), not the consumer's use site; fragment in Q11
FAIL prop-single-type#f-below-diagonal: conclusion weakened: L354 says f(s) < s for every s > 1 sufficiently close to 1 (a universal statement near 1), the node states only 'there exists s > 1 with f(s) < s'; fragment in Q12
PASS prop-single-type#fixed-point-exists | spans re-read L343-L351, L354
PASS prop-single-type#at-most-two-fixed-points | spans re-read L343-L351, L353-L354
PASS prop-single-type.conjugate#hyps-imply-equivalence-hypotheses | spans re-read L343-L351
PASS prop-single-type.conjugate#existence | spans re-read L343-L351
FAIL rem:hyp-iii-necessary#no-conjugate: SOURCE_HYPOTHESES puts an earlier step's output ('the constants a, b of rem:hyp-iii-necessary#constants-and-hyp-I') into the hypotheses; the sibling nodes (#f-infinite, #hyp-II-regular) state the process without it; fragment in Q17
PASS def-bp-basic.positive-regular#matrix-equiv | spans re-read L225-L229
PASS prop-conjugate#ext-prob-hat | spans re-read L430-L431
PASS lem-gf-pos#two-individuals | spans re-read L493
PASS lem-mono | spans re-read L594-L604
PASS lem-mono#positivity-all-n | spans re-read L602
PASS lem-unstable-scaled#holder-bound | spans re-read L629-L634
PASS prop-unstable#part-i | spans re-read L610-L611, L645-L647
PASS lem-monotone-lim#shifted-mono | spans re-read L675-L680
PASS lem-monotone-lim#limits-zero | spans re-read L687-L691
FAIL eqn-infty-subset#blowup: missing logically consumed edge to eqn-convex-func-n: the claim is about g^{(N)} = log E_k[prod_j e^{lambda_j X_j(N)}] on [0,inf]^d (SKILL Phase 4 'logically consumes'; every other node using that formula has the edge); ADJUDICATION C5 dropped it only because uncited, the NOTE records the omission; reverses C5, orchestrator to adjudicate; fragment in Q27
PASS lem-attractive-zero#orbit-lambda0 | spans re-read L771
PASS lem-attractive-zero#comparison | spans re-read L771-L775
PASS lem-attractive-infty#choose-N-m | spans re-read L786-L791
PASS lem-attractive-infty#lower-bound | spans re-read L792-L798
FAIL lem-attractive-infty#strict-increase: NOTE ends with the dangling pointer 'see report' (no durable path), a placeholder left in a field; fragment in Q32
PASS lem-attractive-infty#divergence | spans re-read L799
PASS lem-attractive-infty | spans re-read L781-L800
PASS eqn-use-attractive-zero | spans re-read L808-L811
PASS lem-basin-open#S0-open | spans re-read L812-L817
PASS lem-basin-open#outside-cube-in-Sinf | spans re-read L820
PASS lem-basin-open#Sinf-open | spans re-read L820
PASS lem-ray-intersect#uniqueness | spans re-read L835
PASS lem-retract#choose-r-R | spans re-read L865
PASS lem-retract#phi-homeomorphism | spans re-read L869-L875
PASS eqn-retract-def | spans re-read L877-L880
PASS lem-retract#H-continuous | spans re-read L882
PASS lem-retract#H-preserves-A | spans re-read L885-L889
FAIL thm-fixed#apply-retract: node boundary: STATEMENT_SOURCE/PROOF_SOURCE are L898-L898 but the conclusion (the retraction H_1 : A -> Lambda) is introduced at L901 and the edge locator already cites L898-L901; fragment in Q45
PASS thm-fixed#A-homeomorphic-to-ball | spans re-read L898
PASS thm-fixed#brouwer-on-A | spans re-read L898-L899
PASS thm-fixed#gH1-self-map | spans re-read L901-L902
PASS thm-fixed#fixed-point-in-Lambda | spans re-read L902
PASS thm-fixed#positivity | spans re-read L902-L904
PASS thm-fixed | spans re-read L555-L557, L894-L905
PASS thm-fixed-pt-infty#reduce-to-g | spans re-read L996
PASS thm-fixed-pt-infty#diagonal-limit | spans re-read L1150-L1155
PASS thm-fixed-pt-infty#before-dct | spans re-read L1155-L1159
PASS thm-fixed-pt-infty#as-convergence | spans re-read L1160-L1163
PASS thm-fixed-pt-infty#dominated-bound | spans re-read L1166-L1171
PASS thm-fixed-pt-infty#interchange | spans re-read L1166-L1176
PASS thm-fixed-pt-infty#nonzero-limit | spans re-read L1178
PASS thm-fixed-pt-infty#positivity | spans re-read L1176-L1178
PASS lem-fixed-limsup | spans re-read L1004-L1025
PASS lem-fixed-limsup#truncation-monotone | spans re-read L1013-L1016
PASS lem-fixed-liminf | spans re-read L1031-L1097
PASS lem-fixed-liminf#case-small-k | spans re-read L1084-L1087
PASS lem-fixed-liminf#case-large-k | spans re-read L1089-L1096
PASS lem-fixed-liminf#step2 | spans re-read L1067-L1096
FAIL lem-1d-soln#diagonal-position: SOURCE_CONCLUSION asserts f~_k(x) <= x on [1,e^{eta_k}] for every k, but the source states it only for k = 1 (L1136); the NOTE admits the general-k case is the extractor's extension; only k = 1 is consumed; fragment in Q66
PASS lem-1d-soln#eta1-lt-log-t | spans re-read L1136
PASS example-ctble | spans re-read L1182-L1201
PASS example-ctble#assume-II | spans re-read L1194-L1195
PASS example-ctble#assume-III | spans re-read L1194-L1198
PASS example-ctble#assume-IV | spans re-read L1194-L1199
PASS example-ctble#choose-s | spans re-read L1195-L1200
PASS example-ctble#choose-t | spans re-read L1195-L1200
PASS example-ctble#apply-thm-3-1 | spans re-read L1182-L1199
PASS claim:branching-property | spans re-read L176-L177

### 1b. Coverage items

PASS inv:L176:bp-setup | spans re-read L176-L177
PASS inv:L229:pos-reg-matrix-equiv | spans re-read L229
FAIL inv:L265:counterexample-claims: SOURCE was narrowed from the inventory span L255-L276 to L262, so the Figure 1 environment and caption (L267-L273) is covered by no item (inv:counterexample covers only L255-L264); needs a covering item (fragment in Q78); the claims on L262 themselves are correctly mapped
PASS inv:L262:robustness-claim | spans re-read L262
PASS inv:L262:d3-seven-fixed-points | spans re-read L262
PASS inv:L263:arbitrarily-many-fixed-points | spans re-read L263
PASS inv:heading:L359 | spans re-read L359
PASS inv:outline:L360 | spans re-read L360-L379
PASS inv:L188:equivalence-preview | spans re-read L188
PASS inv:thm-fixed | spans re-read L555-L557
PASS inv:eqn-infty-subset | spans re-read L732-L735
FAIL inv:L930:ctble-extinction-facts: SOURCE L930-L936 overlaps inv:L936:def-truncation (NODE def:truncation, L936-L937) and its REASON excludes 'the introductory sentence L936', which def-truncation maps to a node: conflicting coverage of L936; narrow to L930-L934; fragment in Q87
PASS inv:L930:global-extinction-def | spans re-read L930
PASS inv:L936:def-truncation | spans re-read L936-L937
PASS inv:L957:assumptions-I-IV | spans re-read L957-L984
PASS inv:L927:ctble-fn-iterate | spans re-read L927
PASS inv:L928:ctble-regularity-extension | spans re-read L928
PASS inv:L1193:concrete-example | spans re-read L1193
PASS inv:L437:fixed-pos-remark | spans re-read L437
PASS inv:L553:thm-equivalence | spans re-read L553
PASS inv:L731:asymmetry-note | spans re-read L731
PASS inv:heading:L1216 | spans re-read L1216
PASS inv:heading:L1218 | spans re-read L1218
PASS inv:cite:L1221:bp-lqg-notes | spans re-read L1221
PASS inv:cite:L1237:shef-cle | spans re-read L1237
PASS inv:cite:L1238:bbg-recursive-approach | spans re-read L1238
PASS inv:cite:L1246:bp-lqg-notes | spans re-read L1246
PASS inv:cite:L1246:gms-tutte.2 | spans re-read L1246
PASS inv:cite:L1246:gms-tutte.3 | spans re-read L1246
PASS inv:cite:L1246:nachmias-circle-packing | spans re-read L1246
PASS inv:cite:L1248:msw-non-simple-cle | spans re-read L1248
PASS inv:cite:L1248:shef-cle | spans re-read L1248
PASS inv:cite:L1253:ag-supercritical-cle4 | spans re-read L1253
PASS inv:cite:L1253:ghpr-central-charge | spans re-read L1253
PASS inv:cite:L1255:ag-supercritical-cle4 | spans re-read L1255
PASS inv:cite:L1255:bgs-supercritical-crt | spans re-read L1255
PASS inv:cite:L1260:aldous-crt1 | spans re-read L1260
PASS inv:cite:L1261:bgs-supercritical-crt | spans re-read L1261
PASS inv:cite:L1261:feng-fk-triviality | spans re-read L1261
PASS inv:cite:L1261:ghpr-central-charge | spans re-read L1261
PASS inv:cite:L1266:apps-central-charge | spans re-read L1266
PASS inv:cite:L1266:bgs-supercritical-crt | spans re-read L1266
PASS inv:cite:L1266:ghpr-central-charge | spans re-read L1266
PASS inv:cite:L1272:ag-supercritical-cle4 | spans re-read L1272
PASS inv:cite:L1274:ag-supercritical-cle4 | spans re-read L1274
PASS inv:cite:L1274:bgs-supercritical-crt.2 | spans re-read L1274
PASS inv:cite:L1274:bgs-supercritical-crt.3 | spans re-read L1274
PASS inv:cite:L1276:ag-supercritical-cle4.2 | spans re-read L1276
PASS inv:cite:L1276:ag-supercritical-cle4.3 | spans re-read L1276
PASS inv:cite:L1284:zinn-justin-six-vertex | spans re-read L1284
PASS inv:heading:L1289 | spans re-read L1289
PASS inv:cite:L1294:Davis2017 | spans re-read L1294
PASS inv:cite:L1296:Durrett2015cancer | spans re-read L1296
PASS inv:cite:L1298:Bozic2010 | spans re-read L1298
PASS inv:cite:L1307:Sottoriva2017 | spans re-read L1307
PASS inv:cite:L1333:Del2009 | spans re-read L1333
PASS inv:cite:L1335:Harnevo1991 | spans re-read L1335
PASS inv:cite:L1335:Jacob2010 | spans re-read L1335

## 2. Replacement fragments

Each fragment replaces only the fields shown; every other field of the record stays as is. `TOPOLOGY_STATUS` and `REVIEWER` are left to the orchestrator (fragments authored by a reviewer are not self-approvable).

### Q1 def:population-sigma

```text
SOURCE_CONCLUSION: the (implicit) measurable structure on the population space ℕ_0^d and on the space of paths of populations with respect to which X_j(n), the laws ℙ_k, the expectations 𝔼_k and the bounded measurable test functions F : ℕ_0^d → ℝ of (2.1) (L402) and (2.2) (L427) are understood; the paper never writes this structure out
NOTE: definition leaf. The statement text is only L176-L177; the manifest source range also cites L402, L427 and L915-L918. Consumed directly by def:step-kernel (edge def:step-kernel -> def:population-sigma: the one-generation kernel is a law on populations, which carry this measurable structure) and, through def:step-kernel and def:path-law, by claim:branching-property, eqn-gen-func-n and claim:mean-matrix-powers (measurability of X(n) for 𝔼_k)
```

### Q9 thm-fixed-gf.equivalence#conjugate-regularity

```text
SOURCE_CONCLUSION: X̂ is positive regular and non-singular and 0 < ℙ̂_k[E] < 1 for each k ∈ {1,…,d}, i.e. every premise of Proposition 2.1 (L391, L397) holds for X̂
NOTE: SOURCE_GAP: Proposition 2.1 (L391, L397) is stated for a positive regular, non-singular process with 0 < a_k < 1 for every k. Definition 1.1 and L238 supply none of these for a conjugate X̂ (clause (b) of Definition 1.1 conditions on extinction, which presupposes ℙ̂_k[E] > 0), and the paper never checks them. This node records the three premises as the package under which thm-fixed-gf.equivalence#conjugate-is-tilt applies Proposition 2.1 to X̂. In particular ℙ̂_k[E] < 1 is not supplied by the source, and no argument for it is given here.
```

### Q10 thm-fixed-gf.equivalence#conjugate-is-tilt

```text
NOTE: SOURCE_GAP: the paper never writes the inverse tilt computation f(A) = A for a given conjugate; it is the converse of the proof of Proposition 2.2 (L430-L431). L238 itself does not invoke Proposition 2.1; the edges to prop-cond-on-ext.cond-law and to the premise node thm-fixed-gf.equivalence#conjugate-regularity are the reconstruction from Propositions 2.1/2.2 (Proposition 2.1 is applied to X̂ here, in the reverse direction of its use at L431)
```

### Q11 prop-single-type#mean-eq-derivative

Delete the dependency on `eqn-mean-matrix` and its EDGE line (L354 asserts `𝔼[X(1)] = f'(1)` from the definition of f and finiteness near 1; the d = 1 reading of `M` and the L510 Jacobian claim are not invoked there). `eqn-mean-matrix` stays reachable through the other consumers.

```text
DEPS: eqn-generating-function, prop-single-type#finite-near-one
EDGE: eqn-generating-function | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L354-L354 | f'(1) is the derivative of f_1(q) = 𝔼[q^{X(1)}] at q = 1
EDGE: prop-single-type#finite-near-one | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#prop-single-type@L353-L354 | differentiability at 1 uses that f is finite on [1,1+ε]
```

### Q12 prop-single-type#f-below-diagonal

(The consumer `prop-single-type#fixed-point-exists` keeps reading `s` as the chosen witness, now a chosen point of `(1,1+ε')`; no change there.)

```text
SOURCE_QUANTIFIERS: X; ∃ ε' > 0 ∀ s ∈ (1, 1+ε')
SOURCE_CONCLUSION: f(s) < s for every s > 1 sufficiently close to 1, i.e. there is ε' > 0 with f(s) < s for all s ∈ (1, 1+ε')
CONSTANT_SCOPE: ε' depends on f only
NOTE: witness choice: the consumer prop-single-type#fixed-point-exists fixes one s ∈ (1, 1+ε'); hypothesis (I) is the root's own
```

### Q17 rem:hyp-iii-necessary#no-conjugate

```text
SOURCE_HYPOTHESES: the single-type branching process X with ℙ[X(1) = m] = a m^{-3} for every m ≥ 1 and ℙ[X(1) = 0] = b, for appropriate constants a, b > 0 (the source does not specify them)
SOURCE_QUANTIFIERS: a, b > 0 as in the hypothesis; the process X above; ∄ X̂ conjugate for X
```

### Q27 eqn-infty-subset#blowup

This reverses ADJUDICATION C5; the orchestrator should adjudicate. Rationale: the claim is a statement about `g^{(N)}` on `[0,∞]^d`, and its only available derivation goes through `g^{(N)}_k = log 𝔼_k[…]` ((2.5)); SKILL Phase 4 keeps edges the target logically consumes, and the node already carries the SOURCE_GAP that exposes this bridge.

```text
DEPS: def-bp-basic.positive-regular, eqn-convex-func-n
EDGE: def-bp-basic.positive-regular | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-infty-subset#blowup@L732-L732 | 'since our branching process is positive regular (Definition 2.8) there exists N such that ...' (E5: Definition 1.3)
EDGE: eqn-convex-func-n | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-infty-subset#blowup@L732-L732 | g^{(N)}_k(λ) = log 𝔼_k[∏_j e^{λ_j X_j(N)}] on [0,∞]^d (conventions ∞^0 = 1, ∞^x = ∞ for x > 0) is the expression in which ℙ_k[X_j(N) ≥ 1] > 0 forces the value ∞ at a point with an infinite coordinate; logically consumed, not cited at L732 (part of the SOURCE_GAP)
NOTE: SOURCE_GAP: asserted ('since our branching process is positive regular, there exists N such that if any of the d coordinates of lambda is equal to inf, then g^{(N)}(lambda) = (inf,...,inf)', L732) with no argument. The source does not show how positive regularity (P_k[X_j(N) >= 1] > 0 for all k, j) interacts with the infinite-coordinate convention for f^{(N)} and the exponential/log carrier. The paper's 'Definition 2.8' here is Definition 1.3 (E5). The source cites only positive regularity; the edge to eqn-convex-func-n records the characterization of g^{(N)} that the missing bridge would consume.
```

### Q32 lem-attractive-infty#strict-increase

```text
NOTE: Ruling E3: the literal text (L799) reads 'if min_j lambda_j >= C ... then g^{(N)}(lambda) > lambda'; the ruled reading uses the lemma's range max_j lambda_j > C (strict). C := log m^{-1} >= 0 because m <= 1; the lemma asserts C > 0 and the source does not comment on this (any larger C also works)
```

### Q45 thm-fixed#apply-retract

```text
STATEMENT_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#apply-retract@L898-L901
PROOF_SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed#apply-retract@L898-L901
```

### Q66 lem-1d-soln#diagonal-position

```text
SOURCE_QUANTIFIERS: X; k; η_k the unique solution of (3.15) supplied by lem-1d-soln#apply-prop-1-6 (f̃_k(e^{η_k})=e^{η_k}); x > e^{η_k} for the first conclusion; k = 1 and x ∈ [1,e^{η_1}] for the second
SOURCE_CONCLUSION: since f̃_k is convex with f̃_k(1)=1 and f̃_k(e^{η_k})=e^{η_k}: x<f̃_k(x) for all x>e^{η_k} (L1134); for k=1 only, as stated at L1136: f̃_1(x)≤x for all x∈[1,e^{η_1}]
NOTE: the inequality f̃_k(x)≤x on [1,e^{η_k}] is stated in the source only for k=1 (L1136, 'By convexity'); only that case is consumed (#eta1-lt-log-t). The strict part for general k is consumed by #bound-by-eta.
```

### Q78 inv:L265:counterexample-claims

The item itself (SOURCE `@L262-L262`, the NODE disposition and the three EXCLUDED sibling items) is correct. The inventory span of this item was L255-L276, and narrowing it to L262 left Figure 1 (L267-L273, caption included) covered by nothing. Add one new item (the ID `inv:L265:…` is cosmetic; the claims sit on L262):

```text
ITEM: inv:fig-counterexample
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#fig-counterexample@L267-L273
DISPOSITION: EXCLUDED
REASON: Figure 1 (plot of the solution sets of f_1(q_1,q_2) = q_1 and f_2(q_1,q_2) = q_2 for the offspring law of Example 1.5, made with Mathematica) illustrates the three fixed points asserted at L262; it states nothing beyond the definition of a fixed point and is not a proof obligation (the three-fixed-points claim itself is the node counterexample#three-fixed-points; spec §7, R4)
COVERAGE_STATUS: PROPOSED
EXTRACTOR: queue-reviewer/sonnet
REVIEWER: -
```

### Q87 inv:L930:ctble-extinction-facts

```text
ITEM: inv:L930:ctble-extinction-facts
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-extinction-facts@L930-L934
DISPOSITION: EXCLUDED
REASON: cited background in L930-L934 on partial and local extinction, the inequalities q ≤ q(A) ≤ q̃ ≤ 1, the fixed-point sets S and Q and their literature (L930-L932) and the countable-type conjugate remark L934 (also item inv:L934:ctble-conjugate-extension) is excluded by spec §7: no step of Theorem 3.1 or Example 3.5 consumes it. Not excluded: the definition of global extinction in L930 (separate item inv:L930:global-extinction-def) and the truncation paragraph L936-L937 (separate item inv:L936:def-truncation)
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: -
```

## 3. Source spans re-read

`source/arxiv-2411.06301v2/fixed-pt-finite-type.tex`, comment blocks (L277-L339, L407-L415, L562-L582, L696-L715, L744-L760, L1204-L1213) ignored:

- L176-L196 (setup, extinction event, Definition 1.1, Remark), L199-L263 (generating function (1.1)-(1.3), L219-L220, Definition 1.3, Theorem 1.4 with L238/L249/L252, Example 1.5), L267-L276 (Figure 1), L341-L379 (Proposition 1.6 and its proof, proof outline);
- L384-L437 (Propositions 2.1, 2.2, remark L437), L440-L515 (Lemmas 2.3-2.5), L525-L557 (Definition 2.6, (2.5), (2.6), Theorem 2.7), L584-L694 (Definition 2.8, Lemmas 2.9, 2.11-2.13, Proposition 2.10), L722-L905 (basins (2.9), (2.10), Lemmas 2.14-2.19, proof of Theorem 2.7);
- L908-L1201 (§3: setup, (3.1)-(3.6), Assumptions I-IV, Theorem 3.1, Lemmas 3.2-3.4, proof of Theorem 3.1, Example 3.5);
- L1216-L1345 (§4): every `\cite` command was matched against the queued `inv:cite:*` items (one item per command, SOURCE line and first key confirmed for all 34 queued citation items) and the headings at L1216, L1218, L1289 were checked; no formal claim or proof step of a root occurs there.

## 4. Non-blocking observations (no verdict changed)

1. Slice-D step nodes use the shorthand `§3.2 setting S (...; full text in SOURCE_HYPOTHESES of lem-fixed-limsup / thm-fixed-pt-infty)` instead of the expanded hypothesis package (thm-fixed-pt-infty#diagonal-limit, #before-dct, #as-convergence, #dominated-bound, #interchange, #nonzero-limit, #positivity, lem-fixed-liminf#case-small-k, #case-large-k, #step2). The content is complete by reference and the form was accepted for the reviewed D nodes; if self-contained fields are wanted before publication, expand them uniformly.
2. Several step nodes name earlier witnesses in SOURCE_HYPOTHESES (`N_0, k_0 as in lem-gf-pos#choose-N0-k0`; `λ-bar^s as in (2.8)`; `X̂ of display (2.2)`), while slice C puts them in SOURCE_QUANTIFIERS. They assert no property of the earlier step, so they were not failed; moving them to SOURCE_QUANTIFIERS would make the convention uniform.
3. `thm-fixed-gf.equivalence#fixed-point-to-conjugate`: the clause `namely the process of display (2.2) with A = q` in SOURCE_CONCLUSION comes from the pointer `(see Proposition 2.2 below)`, not from the statement at L238; it is consistent with the DEPS, so it passes, but it could be dropped.
4. `lem-mono#positivity-all-n`: L602 justifies `P_k[X_j(n) ≥ 1] > 0 for every n ≥ N` only by `From this and the Markov property`; that positive survival to every generation is needed is implicit. Left untagged because the source names the tool; a minor SOURCE_GAP tag would also be defensible.
5. `inv:outline:L360` REASON lists `Lemmas 2.3, 2.16-2.19`; the outline (L362-L378) actually cites Lemmas 2.3, 2.11, 2.17, 2.18, 2.19 and Theorem 3.1. The exclusion (spec §7) is right; the REASON could read `every lemma it cites (Lemmas 2.3, 2.11, 2.17-2.19 and Theorem 3.1)`.
6. Non-queued NOTEs of `def:step-kernel` and `def:path-law` still say they are consumed through eqn-gen-func-n and claim:mean-matrix-powers; the actual consumer chain is claim:branching-property (and def:path-law -> def:step-kernel -> def:population-sigma).
7. `prop-single-type.conjugate#existence`: the last sentence of the NOTE names an alternative derivation (thm-fixed-gf.conjugate at d = 1) that the source does not offer; harmless, but it is argument from outside the source and could be deleted.
8. Some edge locators extend a few lines beyond the consumer's STATEMENT/PROOF span (e.g. example-ctble#assume-II/III/IV cite the domination hypothesis at L1194 while their span starts at L1195; example-ctble#apply-thm-3-1 cites L1195-L1199 with PROOF_SOURCE ending at L1195). Each locator is a true use site; only the node spans are slightly short.
9. `claim:branching-property` carries no SOURCE_GAP tag ('standard defining property'); its statement uses the process started from a general population x, which the paper never defines (only ℙ_k is defined). Accepted as the characterization node of spec §8; flagged so the Lean orchestrator treats it as a new `pathLaw` theorem.

## 5. Follow-up verdicts

Scope: the 11 records rewritten from the global reviewer's fragments G1-G9 and by the orchestrator (current text of `DEPGRAPH.md`), compared with the raw LaTeX (L185, L238, L421, L441, L449; L641-L649, L669-L694; L343-L355; L861-L872, L894-L905; L957-L1002, L1149-L1179) and with `graph/reviews/global.review.md` G1-G9. Linter `--report` still exits 0 (199 nodes, 399 edges, 56 explicit gaps); no dangling or cyclic edge. Nothing but this report was written.

PASS lem-monotone-lim#limit-fixed | L689; the added edge to lem-basin-open#g-iter-continuous is a labelled SOURCE_GAP reconstruction and is mathematically what the step consumes (g^{(m)} continuous on [0,inf)^d); no cycle (that node depends only on def-log-gf)
PASS lem-monotone-lim#part-b | L672, L693; statement fields match L669-L673; the added continuity edge is labelled as a SOURCE_GAP reconstruction (analogue of limit-fixed)
PASS lem-monotone-lim#shifted-mono | L675-L680; only the tag changed to `SOURCE_GAP:` (text identical, so the linter lists it)
PASS lem-monotone-lim#limits-zero | L687-L691; only the tag changed to `SOURCE_GAP:`; DEPS/EDGE unchanged
PASS prop-single-type#f-above-diagonal | L354; fields match ('there exists a sufficiently large t > 1 for which f(t) > t' is existential, as stated); SOURCE_GAP label is correct
PASS thm-fixed#zero-notin-Lambda | L904; SOURCE_GAP label is correct and the NOTE states the reading honestly (see observation 2)
PASS prop-unstable#strict-case | L641-L643; SOURCE_GAP names the unstated monotonicity step and the lem-mono edge records it
PASS lem-retract#radial-bijection | L867-L868; the NOTE correctly says Lemma 2.18 covers only rays through u in B and that 0 not in Lambda is used without reason (stated only at L904)
PASS thm-fixed-pt-infty | PROOF_SOURCE L989-L1179 is right (L989 'We prove Theorem 3.1 by applying Theorem 1.4 ...', L996 the reduction, L1179 `\end{proof}`); the edge locators L996, L1176, L1178 now lie inside the proof span; frozen fields unchanged
PASS thm-fixed-pt-infty#positivity | L1178; the `analogy only:` prefix matches the NOTE (the finite-type step cannot be applied to the countable-type process); edge kept as the source's own pointer
FAIL claim:subcritical-extinction: orchestrator-directed text remains in the NOTE ('orchestrator may decide whether to add it'); in addition SOURCE_CONCLUSION asserts an equivalence 'equivalently (independence of the lines of descent ...)' that is exactly the unwritten bridge, which belongs to the claim:branching-property edge and the NOTE, not to the statement; the widening to every initial population (L421, L441) and the edge to claim:branching-property are accepted; fragment in P1

### P1 claim:subcritical-extinction

```text
SOURCE_CONCLUSION: ℙ_x[E] = 1 for every initial population x ∈ ℕ_0^d, where E is the extinction event; in particular ℙ_k[E] = 1 for every k ∈ {1,…,d}
NOTE: SOURCE_GAP: Definition 1.1 (L185) and Proposition 2.2 (L421) both assume that the extinction probability is one, while L238 and Theorem 1.4 assume only subcriticality, positive regularity and non-singularity; the paper never states that these imply certain extinction. No edge to ext:an72-v3-thm2 is recorded because the source does not invoke it here. Merged per ADJUDICATION A3/C1: the same unproved claim is invoked at L628 ("Since the extinction probability is one (Hypothesis I)") and in the Lemma 2.3 application at L905; all three uses consume this node. Second unwritten step: Definition 1.1 and the argument at L449 use certain extinction per starting type, whereas Proposition 2.2 (L421) and Lemma 2.3 (L441) assume it from any initial population; the bridge (independence of the individuals of the initial population, via claim:branching-property) is not written in the source
```

### Follow-up observations (no verdict changed)

1. Edge policy. The orchestrator keeps 'edges only for cited uses' (Q27 not applied), yet the applied G1-G3 add uncited edges (claim:subcritical-extinction -> claim:branching-property, lem-monotone-lim#limit-fixed and #part-b -> lem-basin-open#g-iter-continuous). All three are explicitly labelled SOURCE_GAP reconstructions, as are earlier ones (eqn-gen-func-n -> claim:branching-property, thm-fixed#positivity -> eqn-fixed-pt-equiv). Under that actual rule ('cited, or a labelled reconstruction inside a SOURCE_GAP node') the Q27 edge `eqn-infty-subset#blowup -> eqn-convex-func-n` is of the same kind; please state the rule once so the two cases are not treated differently.
2. thm-fixed#zero-notin-Lambda: its edges give a reading through Lemma 2.15 (0 in [0,eps]^d); the shorter reading (g(0) = 0 because f(1) = 1, hence 0 in S_0 by (2.9)) uses only eqn-generating-function, def-log-gf and eqn-basin-def.zero. Both are labelled readings, so it passes; the lem-attractive-zero edge is the more roundabout one.

## 6. Final verdicts

Checked against the raw LaTeX (L343-L356, L841-L847, L904-L905, L1134-L1136) and `graph/reviews/global.review.md` §5 (H1, X1); linter `--report` exits 0 (199 nodes, 400 edges, 189 coverage items). Nothing but this report was written.

PASS prop-single-type#f-below-diagonal | L353-L354; hypothesis (III) is a source premise (without it the statement is false: for the a·m^{-3} example of L252 f(s) = ∞ for every s > 1, and my Q12 fragment, like the original record, omitted it); SOURCE_HYPOTHESES, TITLE, SOURCE_QUANTIFIERS/CONCLUSION and NOTE are now consistent with L354 ('if s > 1 is sufficiently close to 1, then f(s) < s'); DEPS and EDGE unchanged and still direct
PASS prop-single-type#fixed-point-exists | L354; the SOURCE_QUANTIFIERS wording ('s a chosen point of the interval (1, 1+ε') of #f-below-diagonal and t the witness of #f-above-diagonal') matches the universal form of #f-below-diagonal; fields, DEPS and EDGE otherwise as already verified
PASS lem-1d-soln#diagonal-position | L1134-L1136; TITLE now agrees with the narrowed SOURCE_CONCLUSION (strict part for every k, f̃_1(x) ≤ x on [1,e^{η_1}] for k = 1 only)
PASS claim:subcritical-extinction | L238, L421, L441, L449, L904; the NOTE now places the Lemma 2.3 application at L904 ('By Lemma 2.3, in fact λ ∈ (0,∞)^d'; L905 is `\end{proof}`); all other fields are as in P1
PASS inv:fig-brouwer-proof | L841-L847 is exactly the figure environment and caption (Figure 2, illustration of the proof of Lemma 2.19 for d = 2); no other item overlaps it; the named nodes (eqn-retract-def, lem-retract#phi-homeomorphism, #H-continuous, #H-fixes-Lambda, #H-preserves-A) exist; EXCLUDED as an illustration with no proof obligation is consistent with spec §7 and with inv:fig-counterexample

Non-blocking: Figure 3 of §4 (`fig-loop-decorated`, L1228-L1233) has no item; it lies in §4, which spec §7 excludes wholesale, so no verdict depends on it.
