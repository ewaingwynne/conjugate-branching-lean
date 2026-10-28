# Slice C topology review — reviewer-C/sonnet

Scope: slice C (paper.tex L722-L907, plus the statement of Theorem 2.7 at L555-L557) of `DEPGRAPH.md` / `DEPGRAPH_COVERAGE.md`.
Nodes reviewed: all 46 blocks with `EXTRACTOR: extractor-C/sonnet` (2 frozen definition anchors `eqn-basin-def.zero/.infty`, the frozen root `thm-fixed`, 40 other lemma/step/application/display nodes, 3 `ext:*` leaves).
Coverage reviewed: all 19 records with `EXTRACTOR: extractor-C/sonnet`, plus an inventory-completeness pass over L722-L907.
No file other than this one was written. No Lean proof body, `sorry`, axiom or Lean status was used. Frozen declaration files were read for statement identity only
(`Conjugate/Frozen/Theorem_2_7.lean`, `Conjugate/Frozen/Defs/BasinZero.lean`, `Conjugate/Frozen/Defs/BasinInfty.lean`); the proof/`sorry` text visible in the first was not interpreted.
`graph/reviews/slice-A.review.md` was read for the record format and for the standard it applied to "earlier step's output used as hypothesis"; none of its verdicts were reused.

Tally: nodes PASS 21 / FAIL 25 (11 major, 14 minor); coverage PASS 18 / FAIL 1; inventory-completeness FAIL 1 (missing item for the L731 cross-reference to Proposition 2.10).

Mechanical checks done by script (all clean): DEPS and EDGE target sets coincide for every slice-C node; no dangling DEPS target; no cycle in the whole 199-node graph;
every slice-C node is reachable from a declared root; the three slice-C anchors (`eqn-basin-def.zero`, `eqn-basin-def.infty`, `thm-fixed`) carry FROZEN_*/CONTRACT_* fields equal to the EXTRACTION_SPEC section 8 table;
every non-anchor slice-C node has `-` in all four FROZEN_* fields, `CONTRACT_ID: paper.<node-id>`, `CONTRACT_VERSION: 1`, `TOPOLOGY_STATUS: PROPOSED`, `REVIEWER: -`, `LEAN_STATUS: NOT_STARTED` (`EXTERNAL` for the three ext nodes);
every slice-C node is mapped by at least one coverage record and every `DISPOSITION: NODE` id in the 19 slice-C records exists.
Every EDGE locator was compared with the raw line; all cite a line inside the consumer's own statement/proof span (none cites the prerequisite's own proof site).
No route (`KIND: route`) is needed in this slice: the source offers no alternative derivation anywhere in L722-L907 (so there is no AND/OR error); no `assumption` node is needed (spec section 4).
Statement identity of the three anchors: `thm-fixed` fields agree with `Conjugate.theorem_2_7` (hypotheses I-III of Thm 1.4 with hIII on `{q | all q j > 0}`, conclusion exists x in (0,inf)^d with `logGenFun x = x`); `eqn-basin-def.zero/.infty` agree with `Conjugate.basinZero/basinInfty` (domain `[0,inf]^d`, `lim` resp. `limsup` of the norm, sup norm in Lean per R1).

Main failure themes (details and fixes below):
1. [major] Nine step/application nodes carry, in SOURCE_HYPOTHESES, the *conclusion of a node they list in DEPS* (the property of a witness, not just its name):
   `#orbit-lambda0` (g(lambda^0) < lambda^0), `#comparison` (lim |g^(n)(lambda^0)| = 0), `#divergence` (g^(N)(lambda) > lambda), `#phi-homeomorphism` (continuous bijection from a compact set),
   `#H-continuous` (phi continuous), `#H-preserves-A` (Lambda subset A), `thm-fixed#brouwer-on-A` (A homeomorphic to a ball), `thm-fixed#gH1-self-map` (g(Lambda) subset Lambda), `thm-fixed#positivity` (the fixed point and lambda != 0).
   `#uniqueness` puts the proof-by-contradiction premise (R > r > 0 with both points in Lambda) into SOURCE_HYPOTHESES while its conclusion says that no such R, r exist (self-contradictory record).
2. [major] `thm-fixed` consumes the equation g(lambda) = lambda from `thm-fixed#fixed-point-in-Lambda` (L902 "Thus g(lambda) = lambda") but lists only `thm-fixed#positivity` (whose conclusion is only lambda in (0,inf)^d once repaired).
3. [minor] Thirteen nodes mention an earlier node's witness ("eps / C / N, m / r, R / A, H_1 as in ...") in SOURCE_HYPOTHESES or over-specify it in the conclusion (E3 N "as in Lemma 2.4"); witnesses belong in SOURCE_QUANTIFIERS (the slice-A convention).
4. [minor] `eqn-infty-subset#blowup` NOTE describes an edge to `eqn-convex-func-n` that was dropped (ADJUDICATION C5).
5. Coverage: `inv:eqn-infty-subset` has SOURCE L733 only but its REASON owns the L732 claim; the L731 cross-reference to Proposition 2.10 has no inventory item.
Things that were checked and are correct: the SOURCE_GAP nodes `#blowup`, `#Lambda-compact`, `thm-fixed#g-image-finite`, `thm-fixed#A-homeomorphic-to-ball`, `thm-fixed#positivity` expose genuine omissions in the source (see their NOTEs); the E3 reading of Lemma 2.16 (max_j in the lower bound, N before C before lambda, g^(N)(lambda) > lambda and divergence) is mathematically consistent with the proof; the Brouwer / connectedness / compact-Hausdorff externals are the only named theorems invoked in L722-L907.

---

## 1. Node verdicts

PASS eqn-basin-def.zero
PASS eqn-basin-def.infty
FAIL eqn-infty-subset#blowup: [minor] NOTE says 'The edge to eqn-convex-func-n records the formula ...', but DEPS/EDGE contain only `def-bp-basic.positive-regular` (ADJUDICATION C5 dropped the uncited edge); the NOTE contradicts the record. Fix F1.
PASS eqn-infty-subset
PASS lem-basin-closed
PASS lem-attractive-zero#subinvariant-point
FAIL lem-attractive-zero#orbit-lambda0: [major] SOURCE_HYPOTHESES contains 'lambda^0 in (0,inf)^d with g(lambda^0) < lambda^0', the conclusion of its DEP `lem-attractive-zero#subinvariant-point`; the hypotheses may carry only the Theorem 1.4 setting (SKILL Phase 4). Fix F2.
FAIL lem-attractive-zero#comparison: [major] SOURCE_HYPOTHESES contains 'lambda^0 in (0,inf)^d with lim_n |g^(n)(lambda^0)| = 0', the conclusion of its DEP `#orbit-lambda0`. Also eps := min_j lambda^0_j > 0 consumes lambda^0 in (0,inf)^d, the conclusion of `#subinvariant-point`, which is not a direct DEP. Fix F3.
PASS lem-attractive-zero
FAIL lem-attractive-infty#choose-N-m: [minor] SOURCE_HYPOTHESES says 'N and p_{k,j}(N) as in Lemma 2.4' while the conclusion re-derives 'there exists N with p_{k,j}(N) > 0'; the Lemma 2.4 witness is an output of its DEP `lem-gf-pos`. Keep the definition of p_{k,j}(N) as notation only. Fix F4.
FAIL lem-attractive-infty#lower-bound: [minor] SOURCE_HYPOTHESES 'N, m as in lem-attractive-infty#choose-N-m' names the witness of a DEP; move it to SOURCE_QUANTIFIERS. Fix F5.
FAIL lem-attractive-infty#strict-increase: [minor] SOURCE_HYPOTHESES 'N, m as in lem-attractive-infty#choose-N-m; C := log m^{-1}' names the witnesses of a DEP and defines C from them; move to SOURCE_QUANTIFIERS. Fix F6.
FAIL lem-attractive-infty#divergence: [major] SOURCE_HYPOTHESES contains 'lambda in [0,inf)^d with g^(N)(lambda) > lambda', the conclusion of its DEP `#strict-increase`; with it the node is just Lemma 2.13(b) with m = N and the claim being consumed (lim |g^(n)(lambda)| = inf for lambda outside [0,C]^d) is not the node's statement. Fix F7.
FAIL lem-attractive-infty: [minor] Against the ruled reading E3: SOURCE_QUANTIFIERS 'exists N in N (N as in Lemma 2.4)' and SOURCE_CONCLUSION 'N in N (the Lemma 2.4 time with p_{k,j}(N) > 0)' add a proof ingredient (the output of `lem-gf-pos`) to the statement; E3 says only 'g^(N)(lambda) > lambda and g^(n)(lambda) -> inf'. The faithful reading is: exists N in N and exists C > 0 (both before lambda, depending only on X) such that for all lambda in [0,inf)^d \ [0,C]^d both conjuncts hold. Fix F8.
PASS lem-basin-open#g-iter-continuous
FAIL eqn-use-attractive-zero: [minor] SOURCE_HYPOTHESES 'eps > 0 as in Lemma 2.15' names the witness of its DEP `lem-attractive-zero` (already in SOURCE_QUANTIFIERS). Fix F9.
FAIL lem-basin-open#S0-open: [minor] SOURCE_HYPOTHESES 'eps > 0 as in Lemma 2.15' names a proof witness although the claim 'S_0 is relatively open' does not depend on eps; SOURCE_CONCLUSION also carries proof detail (choice of n, the neighbourhood). Fix F10.
FAIL lem-basin-open#outside-cube-in-Sinf: [minor] SOURCE_HYPOTHESES 'C > 0 as in Lemma 2.16' names the witness of its DEP `lem-attractive-infty` (SOURCE_QUANTIFIERS already has it). Fix F11.
FAIL lem-basin-open#Sinf-open: [minor] SOURCE_HYPOTHESES 'C > 0 as in Lemma 2.16' names a proof witness although the claim 'S_inf is relatively open' does not depend on C; SOURCE_CONCLUSION also carries proof detail. Fix F12.
PASS lem-basin-open
PASS lem-ray-intersect#ray-meets-both
PASS lem-ray-intersect#existence
FAIL lem-ray-intersect#uniqueness: [major] SOURCE_HYPOTHESES contains 'R > r > 0 with ru, Ru in [0,inf)^d \ (S_0 u S_inf)' while SOURCE_CONCLUSION says 'there do not exist R > r > 0 with both ...': the contradiction hypothesis is made a premise of its own negation. The premise is not a hypothesis of Lemma 2.18; it belongs only in the quantifier/conclusion. Fix F13.
PASS lem-ray-intersect
FAIL lem-retract#choose-r-R: [minor] SOURCE_HYPOTHESES 'eps and C as in Lemmas 2.15 and 2.16' names the witnesses of two DEPS; move to SOURCE_QUANTIFIERS. Fix F14.
PASS lem-retract#radial-bijection
PASS lem-retract#Lambda-compact
FAIL lem-retract#phi-homeomorphism: [major] SOURCE_HYPOTHESES contains 'pi continuous bijection Lambda -> B with Lambda compact', the conclusions of its DEPS `#radial-bijection` and `#Lambda-compact` (and exactly the premises of `ext:compact-hausdorff` that the edges are supposed to discharge). Fix F15.
FAIL eqn-retract-def: [minor] SOURCE_HYPOTHESES 'r, R and A = A(r,R) as chosen in lem-retract#choose-r-R; B, pi, phi as in the proof of Lemma 2.19' names witnesses of its DEPS (choose-r-R, phi-homeomorphism); move to SOURCE_QUANTIFIERS. Fix F16.
FAIL lem-retract#H-continuous: [major] SOURCE_HYPOTHESES contains 'phi continuous', the conclusion of its DEP `#phi-homeomorphism` (the source's reason: 'Since phi is continuous'). Fix F17.
PASS lem-retract#H-fixes-Lambda
FAIL lem-retract#H-preserves-A: [major] SOURCE_HYPOTHESES contains 'Lambda subset A', the conclusion of its DEP `#choose-r-R` (the source's reason: 'Since Lambda subset A'). Fix F18.
PASS lem-retract
PASS thm-fixed#g-image-finite
PASS thm-fixed#Lambda-invariant
FAIL thm-fixed#apply-retract: [minor] SOURCE_HYPOTHESES 'r, R as in Lemma 2.19' means r, R such that A(r,R) deformation retracts onto Lambda, i.e. the conclusion of the DEP `lem-retract`; the conclusion of the node then merely restates it. Fix F19.
FAIL thm-fixed#A-homeomorphic-to-ball: [minor] SOURCE_HYPOTHESES 'A = A(r,R) as in Lemma 2.19' names the witnesses of its DEP `lem-retract`; move to SOURCE_QUANTIFIERS. Fix F20.
FAIL thm-fixed#brouwer-on-A: [major] SOURCE_HYPOTHESES contains 'A = A(r,R) homeomorphic to a closed d-dimensional Euclidean ball', the conclusion of its DEP `#A-homeomorphic-to-ball` (and the premise of `ext:brouwer` that the edge is supposed to discharge). Fix F21.
FAIL thm-fixed#gH1-self-map: [major] SOURCE_HYPOTHESES contains 'g(Lambda) subset Lambda' (conclusion of DEP `#Lambda-invariant`) and 'A, H_1 as in thm-fixed#apply-retract' (witnesses of DEP `#apply-retract`). Fix F22.
FAIL thm-fixed#fixed-point-in-Lambda: [minor] SOURCE_HYPOTHESES 'A, H_1 as in thm-fixed#apply-retract' names witnesses of a DEP although the claim (a fixed point of g in Lambda exists) does not depend on them; move to SOURCE_QUANTIFIERS. Fix F23.
PASS thm-fixed#zero-notin-Lambda
FAIL thm-fixed#positivity: [major] SOURCE_HYPOTHESES contains 'lambda in [0,inf)^d \ {0} with g(lambda) = lambda', i.e. the conclusions of its DEPS `#fixed-point-in-Lambda` (g(lambda) = lambda, lambda in Lambda) and `#zero-notin-Lambda` (lambda != 0). The NOTE also still points at the superseded `lem-unstable-scaled#extinction-as` instead of the shared `claim:subcritical-extinction` (ADJUDICATION C1). Fix F24.
FAIL thm-fixed: [major] Missing direct edge: the proof ends 'Thus g(lambda) = lambda' (L902) and then 'By Lemma 2.3, in fact lambda in (0,inf)^d' (L904); the equation g(lambda) = lambda is delivered by `thm-fixed#fixed-point-in-Lambda`, while `thm-fixed#positivity` delivers only lambda in (0,inf)^d (once F24 is applied). The theorem's conclusion (exists lambda in (0,inf)^d with g(lambda) = lambda) consumes both directly. Statement fields, locators and FROZEN_*/CONTRACT_* are correct. Fix F25.
PASS ext:brouwer
PASS ext:connectedness
PASS ext:compact-hausdorff

---

## 2. Replacement fragments for node FAILs

Each fragment replaces the whole field line / EDGE line of the same name in the named block; fields not listed stay unchanged.
No FROZEN_*, CONTRACT_ID, CONTRACT_VERSION, STATEMENT_SOURCE or PROOF_SOURCE of any anchor is altered (the only anchor touched is `thm-fixed`, and only its DEPS/EDGE).
`<SETTING>` below stands for the exact string used in every slice-C record:

```
Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf])
```

### F1 eqn-infty-subset#blowup
```
NOTE: SOURCE_GAP: asserted ('since our branching process is positive regular, there exists N such that if any of the d coordinates of lambda is equal to inf, then g^{(N)}(lambda) = (inf,...,inf)', L732) with no argument. The source does not show how positive regularity (P_k[X_j(N) >= 1] > 0 for all k, j) interacts with the infinite-coordinate convention for f^{(N)} and the exponential/log carrier. The paper's 'Definition 2.8' here is Definition 1.3 (E5). The only edge is to the definition of positive regularity; the edge to eqn-convex-func-n was dropped (ADJUDICATION C5) because the source cites only positive regularity.
```

### F2 lem-attractive-zero#orbit-lambda0
```
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf])
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; lambda^0 the witness of lem-attractive-zero#subinvariant-point (lambda^0 in (0,inf)^d with g(lambda^0) < lambda^0)
```
(SOURCE_CONCLUSION, DEPS, EDGE lines unchanged.)

### F3 lem-attractive-zero#comparison
```
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf])
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; lambda^0 the witness of lem-attractive-zero#subinvariant-point (lambda^0 in (0,inf)^d) with lim_n |g^{(n)}(lambda^0)| = 0 by lem-attractive-zero#orbit-lambda0; eps := min_{j in {1,...,d}} lambda^0_j; lambda in [0,eps]^d
DEPS: lem-mono, lem-attractive-zero#orbit-lambda0, lem-attractive-zero#subinvariant-point
EDGE: lem-attractive-zero#subinvariant-point | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#lem-attractive-zero#comparison@L772-L775 | 'eps := min_j lambda^0_j > 0': positivity of eps and lambda <= lambda^0 for lambda in [0,eps]^d use lambda^0 in (0,inf)^d, the conclusion of the node that chooses lambda^0
```
(add the new EDGE line; the existing two EDGE lines and SOURCE_CONCLUSION stay.)

### F4 lem-attractive-infty#choose-N-m
```
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); p_{k,j}(N) for N in N as defined in Lemma 2.4 (p_{k,j}(N) := P_k[X_j(N) >= 1 and X_k(N) >= 1] for k != j and p_{k,k}(N) := P_k[X_k(N) >= 2])
```
(SOURCE_QUANTIFIERS 'exists N in N; m := min over k, j of p_{k,j}(N)' and SOURCE_CONCLUSION unchanged; N is the existential witness delivered by the DEP `lem-gf-pos`.)

### F5 lem-attractive-infty#lower-bound
```
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); lambda in [0,inf)^d
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; N, m the witnesses of lem-attractive-infty#choose-N-m; lambda in [0,inf)^d; k in {1,...,d}
```

### F6 lem-attractive-infty#strict-increase
```
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); lambda in [0,inf)^d \ [0,C]^d (i.e. max_j lambda_j > C)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; N, m the witnesses of lem-attractive-infty#choose-N-m; C := log m^{-1}; lambda in [0,inf)^d \ [0,C]^d; k in {1,...,d}
```

### F7 lem-attractive-infty#divergence
```
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); g, g^{(n)} as in Definition 2.6 evaluated on [0,inf]^d
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; N, C the witnesses of lem-attractive-infty#strict-increase (g^{(N)}(lambda) > lambda for every lambda in [0,inf)^d \ [0,C]^d); lambda in [0,inf)^d \ [0,C]^d
SOURCE_CONCLUSION: for every lambda in [0,inf)^d \ [0,C]^d: lim_{n -> inf} |g^{(n)}(lambda)| = inf
```

### F8 lem-attractive-infty
```
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; exists N in N; exists C > 0; for all lambda in [0,inf)^d \ [0,C]^d
SOURCE_CONCLUSION: [Ruled reading E3] there exist N in N and C > 0 such that for every lambda in [0,inf)^d \ [0,C]^d: g^{(N)}(lambda) > lambda (componentwise order of Definition 2.8) and lim_{n -> inf} |g^{(n)}(lambda)| = inf
```
(CONSTANT_SCOPE 'N and C depend only on X (both precede lambda)', DEPS and EDGE lines unchanged; the proof's choice of N as the Lemma 2.4 time stays in `lem-attractive-infty#choose-N-m`. If the orchestrator wants N pinned to the Lemma 2.4 time, that is a new author ruling, not part of E3 as recorded.)

### F9 eqn-use-attractive-zero
```
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); S_0, S_inf as in (2.9)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; eps the witness of lem-attractive-zero (Lemma 2.15)
```

### F10 lem-basin-open#S0-open
```
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); S_0, S_inf as in (2.9)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; eps the witness of lem-attractive-zero; lambda in S_0; n in N (chosen with g^{(n)}(lambda) in [0,eps)^d)
SOURCE_CONCLUSION: S_0 is a relatively open subset of [0,inf]^d
```

### F11 lem-basin-open#outside-cube-in-Sinf
```
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); S_0, S_inf as in (2.9)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; C the witness of lem-attractive-infty (Lemma 2.16)
```

### F12 lem-basin-open#Sinf-open
```
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); S_0, S_inf as in (2.9)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; C the witness of lem-attractive-infty; lambda in S_inf; n in N (chosen with g^{(n)}(lambda) in [0,inf]^d \ [0,C]^d)
SOURCE_CONCLUSION: S_inf is a relatively open subset of [0,inf]^d
```

### F13 lem-ray-intersect#uniqueness
```
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); S_0, S_inf as in (2.9); u in [0,inf)^d with |u| = 1
```
(SOURCE_QUANTIFIERS 'Theorem 1.4 setting; d in N; X; u; R > r > 0' and SOURCE_CONCLUSION unchanged.)

### F14 lem-retract#choose-r-R
```
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); S_0, S_inf as in (2.9); Lambda := [0,inf)^d \ (S_0 u S_inf); A(r,R) as in (2.12)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; eps, C the witnesses of lem-attractive-zero and lem-attractive-infty; exists R > r > 0
```

### F15 lem-retract#phi-homeomorphism
```
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); S_0, S_inf as in (2.9); Lambda := [0,inf)^d \ (S_0 u S_inf); B := {lambda in [0,inf)^d : |lambda| = 1}; pi(lambda) := lambda/|lambda| on [0,inf)^d \ {0}
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; pi restricted to Lambda is the bijection onto B of lem-retract#radial-bijection, with Lambda compact by lem-retract#Lambda-compact; phi
```

### F16 eqn-retract-def
```
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); Lambda := [0,inf)^d \ (S_0 u S_inf); B := {lambda in [0,inf)^d : |lambda| = 1}; pi(lambda) := lambda/|lambda|
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; r, R the witnesses of lem-retract#choose-r-R (A = A(r,R) as in (2.12)); phi the continuous inverse of pi restricted to Lambda from lem-retract#phi-homeomorphism; lambda in A; t in [0,1]
```

### F17 lem-retract#H-continuous
```
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); Lambda := [0,inf)^d \ (S_0 u S_inf); A = A(r,R); H as in (2.13)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; phi continuous by lem-retract#phi-homeomorphism; (lambda, t) in A x [0,1]
```

### F18 lem-retract#H-preserves-A
```
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); Lambda := [0,inf)^d \ (S_0 u S_inf); A = A(r,R); H as in (2.13)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; r, R the witnesses of lem-retract#choose-r-R (Lambda subset A(r,R)); lambda in A; t in [0,1]
```

### F19 thm-fixed#apply-retract
```
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); S_0, S_inf as in (2.9); Lambda := [0,inf)^d \ (S_0 u S_inf)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; r, R the witnesses of lem-retract (Lemma 2.19); H_1
```

### F20 thm-fixed#A-homeomorphic-to-ball
```
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); |.| is any norm on R^d (R1)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; r, R the witnesses of lem-retract (A = A(r,R) as in Lemma 2.19)
```

### F21 thm-fixed#brouwer-on-A
```
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf])
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; A = A(r,R), homeomorphic to a closed d-dimensional Euclidean ball by thm-fixed#A-homeomorphic-to-ball; F : A -> A continuous
```

### F22 thm-fixed#gH1-self-map
```
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); Lambda := [0,inf)^d \ (S_0 u S_inf)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; A, H_1 as given by thm-fixed#apply-retract; g(Lambda) subset Lambda by thm-fixed#Lambda-invariant
```

### F23 thm-fixed#fixed-point-in-Lambda
```
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); Lambda := [0,inf)^d \ (S_0 u S_inf)
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; A, H_1 as given by thm-fixed#apply-retract; lambda in A
```

### F24 thm-fixed#positivity
```
SOURCE_HYPOTHESES: Theorem 1.4 setting (L528): X is a d-type branching process with generating function f and mean matrix M (all M_kj finite); (I) X subcritical (spectral radius rho < 1); (II) X positive regular and non-singular (Def 1.3); (III) each f_k, k in {1,...,d}, is continuous from (0,inf]^d to (0,inf] (half-open-interval topology on (0,inf]); g, g^{(n)} as in Definition 2.6 evaluated on [0,inf]^d
SOURCE_QUANTIFIERS: Theorem 1.4 setting; d in N; X; lambda in Lambda with g(lambda) = lambda (the witness of thm-fixed#fixed-point-in-Lambda), lambda != 0 (thm-fixed#zero-notin-Lambda); q := e^lambda
NOTE: SOURCE_GAP: the source says only 'Since 0 not in Lambda, we have lambda in [0,inf)^d \ {0}. By Lemma 2.3, in fact lambda in (0,inf)^d' (L904). It does not state (a) the translation q := e^lambda with f(q) = q through (2.6); (b) the premise of Lemma 2.3 that the extinction probability is one, which the setting delivers only through Hypothesis I (modeled by the shared SOURCE_GAP node claim:subcritical-extinction, the same unproved step as at L628); (c) positive regularity (Hypothesis II) for the second assertion; (d) that the dichotomy 'all q_k = 1 or all q_k > 1' together with lambda != 0 gives positivity of every coordinate.
```
(SOURCE_CONCLUSION 'lambda in (0,inf)^d (every coordinate of lambda is positive)', DEPS and the five EDGE lines unchanged.)

### F25 thm-fixed
```
DEPS: thm-fixed#fixed-point-in-Lambda, thm-fixed#positivity
EDGE: thm-fixed#fixed-point-in-Lambda | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#thm-fixed@L902-L902 | 'Thus g(lambda) = lambda': the Brouwer fixed point lambda in Lambda found at L902 supplies the equation g(lambda) = lambda of the theorem's conclusion; positivity (L904) supplies lambda in (0,inf)^d for the same lambda
```
(add the new EDGE line; the existing EDGE to thm-fixed#positivity stays. Anchor fields, STATEMENT_SOURCE, PROOF_SOURCE, FROZEN_* and CONTRACT_* unchanged.)

---

## 3. Coverage verdicts (records with EXTRACTOR: extractor-C/sonnet)

PASS inv:heading:L722
PASS inv:eqn-basin-def
FAIL inv:eqn-infty-subset: SOURCE is `#eqn-infty-subset@L733-L733` (the `\eqb\label` line) but the REASON assigns the L732 sentence ('since our branching process is positive regular, there exists N ...') to this item via the node `eqn-infty-subset#blowup`; the SOURCE range excludes that claim. Fix C1.
PASS inv:lem-basin-closed
PASS inv:proof:lem-basin-closed
PASS inv:lem-attractive-zero
PASS inv:proof:lem-attractive-zero
PASS inv:lem-attractive-infty
PASS inv:proof:lem-attractive-infty
PASS inv:lem-basin-open
PASS inv:proof:lem-basin-open
PASS inv:eqn-use-attractive-zero
PASS inv:lem-ray-intersect
PASS inv:proof:lem-ray-intersect
PASS inv:lem-retract
PASS inv:eqn-retract-annulus
PASS inv:proof:lem-retract
PASS inv:eqn-retract-def
PASS inv:proof:thm-fixed
FAIL inventory-completeness (slice C): L731 'Note the asymmetry in the definitions: we have a lim in the definition of S_0, but a limsup in the definition of S_infty. The reason for this asymmetry comes from Proposition 2.10' is an explicit cross-reference to Proposition 2.10 with no inventory item; ADJUDICATION C2 decided it is motivation only (no edge) but that decision is recorded only in node NOTEs, not in the coverage manifest. Fix C2.

Inventory comparison against the raw text (L722-L907): every theorem-like environment (Lemmas 2.14-2.19), every labeled display ((2.9), (2.10), (2.11), (2.12), (2.13)), the heading, every proof environment (Lemmas 2.14-2.19, Theorem 2.7) and every named external (Brouwer L899, connectedness L833, the compact-to-Hausdorff step L871) has an item or is covered by a proof-region item; comment block L744-L760 is correctly ignored; the narrative sentences at L725, L763-L764, L779, L825-L826 and the figure at L841-L847 state no obligation beyond Lemmas 2.15-2.19 and are not required items (see advisory 5).
The record `inv:thm-fixed` (L555-L557) belongs to extractor-B and was not judged; its target node `thm-fixed` (owned by slice C) exists and its STATEMENT_SOURCE `#thm-fixed@L555-L557` matches the raw `\begin{thm}...\end{thm}` span exactly.

---

## 4. Replacement fragments for coverage FAILs

### C1 inv:eqn-infty-subset
```
ITEM: inv:eqn-infty-subset
KIND: display
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-infty-subset@L732-L735
DISPOSITION: NODE eqn-infty-subset, eqn-infty-subset#blowup
REASON: Display (2.10) is the node eqn-infty-subset; the preceding unproved claim (g^{(N)} blows up when a coordinate is infinite, L732) is the SOURCE_GAP step eqn-infty-subset#blowup.
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
```

### C2 new item (inventory completeness; extractor tag to be assigned by the orchestrator)
```
ITEM: inv:L731:asymmetry-note
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-basin-def@L731-L731
DISPOSITION: EXCLUDED
REASON: motivational remark: it cites Proposition 2.10 (prop-unstable) as the origin of the lim / limsup asymmetry in (2.9) but no proof in the root closure consumes it as an input (ADJUDICATION C2); prop-unstable is reached through lem-unstable-ssl and lem-monotone-lim, whose own proofs are owned by slice B
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-C/sonnet
REVIEWER: -
```

---

## 5. Non-blocking advisories (no verdict change)

1. `lem-basin-closed`: the forward inclusions g(S_0) subset S_0, g(S_inf) subset S_inf need g([0,inf]^d) subset [0,inf]^d (so that g(lambda) is a point of the carrier of S_0). The node records this in its NOTE and adds no edge because the source cites only (2.9); but `thm-fixed#g-image-finite` and `#gH1-self-map` do add an edge to `lem-basin-open#g-iter-continuous` for the same fact. If the orchestrator wants one policy, add `DEPS: ..., lem-basin-open#g-iter-continuous` and an EDGE at L741 to `lem-basin-closed`; I left the node PASS because the source's stated basis is exactly (2.9).
2. `lem-retract#radial-bijection`: pi is only defined on [0,inf)^d \ {0}, so 'pi restricted to Lambda is a bijection' needs 0 not in Lambda, which follows from Lambda subset A(r,R), r > 0 (`#choose-r-R`, L865). The NOTE records this; no edge is added because L867-L868 cites only Lemma 2.18. PASS, but an edge to `lem-retract#choose-r-R` would make the dependency explicit.
3. `thm-fixed#zero-notin-Lambda`: the source gives no reason for 'Since 0 not in Lambda'; the node's two edges (Lemma 2.15 and (2.9)) are the extractor's documented reading and the alternative (Lambda subset A(r,R) with r > 0, or simply g(0) = 0) is also recorded. It is a one-line routine claim, so I left it PASS without a SOURCE_GAP prefix (cf. slice-A advisory 4); a SOURCE_GAP label would be harmless.
4. `eqn-infty-subset`: 'This implies that (2.10)' needs g^{(kN)}(lambda) = (inf,...,inf) for all k, i.e. N uniform in lambda applied repeatedly. The uniformity is recorded in the CONSTANT_SCOPE of `#blowup` and in the NOTE; routine induction, PASS.
5. Source discrepancy outside the graph: the goal sentence at L825-L826 says [0,inf)^d \ (S_0 u S_inf) is a retract 'of an open subset of (0,inf)^d with the topology of a closed disk', while Lemma 2.19 itself retracts the closed set A(r,R) subset [0,inf)^d. The graph follows the formal statement (Lemma 2.19) and the proof; no node or edge depends on the narrative sentence, so no inventory item is needed. The figure at L841-L847 only illustrates Lemma 2.19 for d = 2.
6. `lem-attractive-infty#strict-increase`: C := log m^{-1} is >= 0, not necessarily > 0 (m <= 1); the lemma asserts C > 0. Enlarging C only shrinks the set of lambda, so C > 0 follows trivially; the NOTE already says so. No SOURCE_GAP needed.
7. `lem-retract#H-fixes-Lambda`: H_t(lambda) for lambda in Lambda is only meaningful because Lambda subset A (`#choose-r-R`); the lemma node `lem-retract` supplies this, so I did not require a separate edge.
8. Norm equivalence (S_0-open: |g^(n)(lambda)| < eps' implies g^(n)(lambda) in [0,eps)^d; S_inf-open; ray-meets-both small/large radii) is used without comment under R1 ('|.| is any norm'); it is a textbook fact below the step threshold and is correctly not an `ext:` node.
9. `inv:thm-fixed` (extractor-B, L555-L557): its REASON still says 'this packet defines no block for it'; after the merge the block exists (owned by slice C), so the wording is stale but the disposition (`NODE thm-fixed`) is right.
10. No external input is hidden in slice C beyond the three declared `ext:` leaves and the unproved `thm-fixed#A-homeomorphic-to-ball` bridge (annulus of an arbitrary norm intersected with the orthant is a closed ball); Heine-Borel ('closed and bounded implies compact', L870) and the connectedness of a ray (L833) are routine facts and are not nodes.

---

## 6. Source spans re-read (PASS evidence)

- paper.tex L722-L907 in full, line by line (comment block L744-L760 skipped as non-source): (2.9) L726-L731; (2.10) L732-L735; Lemma 2.14 L737-L742; Lemma 2.15 L767-L776; Lemma 2.16 L781-L800; Lemma 2.17 L804-L821; Lemma 2.18 L828-L836; figure L841-L847; Lemma 2.19 L851-L891; proof of Theorem 2.7 L894-L905.
- paper.tex L555-L557 (Theorem 2.7 statement) and L525-L560 (Section 2.2 opening: standing sentence L528, Definition 2.6 L533-L546, (2.5), (2.6) L548-L553).
- Context for consumed results: Lemma 2.3 L440-L472 (second assertion, extinction-probability premise L441, positive regularity L445), Lemma 2.4 L477-L494, Lemma 2.5 L500-L515, Definition 2.8 L587-L589, Lemma 2.9 L594-L604, Proposition 2.10 L608-L649 with Lemma 2.11 L619-L636, Lemma 2.12 L653-L664, Lemma 2.13 L669-L694 (comment L696-L715 skipped); L380-L437 for the Proposition 2.1/2.2 background.
- paper.tex L195-L260 (Theorem 1.4 setting, hypotheses I-III, M finite at L219, Definition 1.3 at L225-L233, the infinity convention at L208) and L908-L911 (start of Section 3, to confirm the end of slice C).
- PASS evidence by node (raw spans re-read): `eqn-basin-def.zero/.infty` L726-L731; `eqn-infty-subset` L731-L735; `lem-basin-closed` L737-L742; `#subinvariant-point`, `lem-attractive-zero` L767-L776 (with Lemma 2.5 L500-L515, Def 2.6 L533-L546); `lem-basin-open#g-iter-continuous`, `lem-basin-open` L804-L821 (with L241-L250 for Hyp. III, item-gf-cont at L247); `#ray-meets-both`, `#existence`, `lem-ray-intersect` L828-L836 (with L619-L636 for Lemma 2.11); `#radial-bijection`, `#Lambda-compact`, `#H-fixes-Lambda`, `lem-retract` L851-L891; `thm-fixed#g-image-finite`, `#Lambda-invariant`, `#zero-notin-Lambda` L894-L905; `ext:brouwer` L899, `ext:connectedness` L833, `ext:compact-hausdorff` L871.
- DEPGRAPH.md blocks: the 46 `extractor-C/sonnet` blocks (DEPGRAPH.md L2790-L4088) and context blocks `lem-mono`, `lem-monotone-lim`, `lem-gf-pos`, `lem-gf-bded`, `lem-fixed-pos`, `lem-unstable-scaled`, `lem-unstable-scaled#extinction-as`, `eqn-fixed-pt-equiv`, `eqn-convex-func-n`, `eqn-gen-func-n`, `def-componentwise`, `def-log-gf`, `def-bp-basic.positive-regular`, `claim:subcritical-extinction`.
- DEPGRAPH_COVERAGE.md: the 19 `extractor-C/sonnet` records, and `inv:thm-fixed` (context); graph/INVENTORY.md slice-C rows; graph/ADJUDICATION.md (B2-B6, C1-C5); graph/EXTRACTION_SPEC.md (all); ERRATA.md rows R1-R6 and E1-E8 (E3 for Lemma 2.16).
- Frozen declaration statements (identity only): `Conjugate.theorem_2_7`, `Conjugate.basinZero`, `Conjugate.basinInfty`. The slice-C source-statement fields of all three were reconstructed from the raw LaTeX and agree on hypotheses, quantifier order, conclusion and constant scope.
