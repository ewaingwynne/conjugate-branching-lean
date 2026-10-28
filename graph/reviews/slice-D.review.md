# Slice D topology review (L908-L1215)

REVIEWER: reviewer-D/sonnet
SCOPE: all 52 node blocks with `EXTRACTOR: extractor-D/sonnet` in `DEPGRAPH.md` (50 slice-D nodes, incl. the two definition anchors `def:truncation`, `def:stoch-dom` and the two roots `thm-fixed-pt-infty`, `example-ctble`, plus the two external leaves `ext:dct`, `ext:diagonal-subsequence`); all 43 coverage records with `EXTRACTOR: extractor-D/sonnet` in `DEPGRAPH_COVERAGE.md`; plus an inventory-completeness pass over L908-L1215.
METHOD: raw-source pass first (L908-L1215 read in full, `\begin{comment}` L1204-L1213 ignored), independent reconstruction of SOURCE_HYPOTHESES / SOURCE_QUANTIFIERS / SOURCE_CONCLUSION / CONSTANT_SCOPE for every node, then edge-by-edge check (direction, directness, AND/OR, consumer locator), conditional-premise discharge at every consumer (Theorem 1.4, Lemma 2.4, Lemma 2.9, Proposition 2.10, Proposition 1.6, Lemmas 3.2-3.4, Theorem 3.1), SOURCE_GAP audit, witness-choice and constant-scope audit. Slice A/B reviews and `graph/ADJUDICATION.md` were read only afterwards, to align the standard below. No file other than this one was written. No Lean proof body, `sorry`, axiom or Lean status was used; the four frozen declaration files named below were read for statement identity only.

TALLY: nodes 52 = 29 PASS + 23 FAIL. Coverage records 43 = 42 PASS + 1 FAIL. Missing inventory items: 6 new items proposed (C2-C7).

MECHANICAL CHECKS (script, all clean): DEPS set == EDGE target set for every slice-D node; no dangling target; no cycle through slice-D nodes; every slice-D node reaches a root (`thm-fixed-pt-infty` or `example-ctble`); no node outside slice D consumes a slice-D node; the four slice-D anchors (`def:truncation`, `def:stoch-dom`, `thm-fixed-pt-infty`, `example-ctble`) carry FROZEN_*/CONTRACT_* identical to EXTRACTION_SPEC section 8; all 48 non-anchor slice-D nodes have `-` in the four FROZEN_* fields, `paper.<id>` CONTRACT_ID and CONTRACT_VERSION 1. (`proof_depgraph.py --check` only reports the stale dashboard.)

STANDARD APPLIED (same as the accepted slice A/B reviews, SKILL Phase 4): a proof-step node's SOURCE_HYPOTHESES records only the setting of its enclosing source statement (theorem or lemma hypotheses; the family `(λ^d)_d` with (3.6) is a hypothesis of Lemmas 3.2-3.4 but NOT of the steps of the proof of Theorem 3.1). Witnesses and properties produced by an earlier step (own DEPS or sibling step) go into SOURCE_QUANTIFIERS (as `X the witness of #node`) and into DEPS, never into SOURCE_HYPOTHESES. A statement field may not carry a proof fact (constant scope read off the proof, "since ..." clauses, proof pointers). A premise stated as a whole display in the source (here (3.23)) is recorded whole, not trimmed to the parts a reviewer knows are needed. Severity: MAJOR = source-statement field or edge/topology wrong; MINOR = hygiene of a field or one edge locator.

MAIN FINDINGS (details below):
1. `lem-fixed-liminf` (Lemma 3.3): CONSTANT_SCOPE is an unresolved placeholder ("orchestrator to fix the reading") and mixes a proof fact in. Literal reading: K is introduced after X, φ, ψ, s, t and the selection (λ^d)_d, so it may depend on all of them and not on d. (F11)
2. Seven steps of the proof of Theorem 3.1 (`#diagonal-limit`, `#before-dct`, `#as-convergence`, `#dominated-bound`, `#interchange`, `#nonzero-limit`, `#positivity`) and `#reduce-to-g` put the output of an earlier step (the selection λ^d of #choose-lambda-d with (3.6); the witness λ with g(λ)=λ) into SOURCE_HYPOTHESES while also (or in the chain) depending on it. (F1-F8)
3. `#positivity` (SOURCE_GAP, correctly tagged) additionally has an uncited, transitively redundant edge to the finite-type (1.2) `eqn-gen-func-n` that misrepresents the countable-type identity as covered, and a proof pointer inside SOURCE_CONCLUSION. (F8)
4. Lemma-internal steps that restate a witness or a property of a DEP in SOURCE_HYPOTHESES (`#truncation-monotone`, `#case-small-k`, `#case-large-k`, `#step2`, `#diagonal-position`, `#eta1-lt-log-t`, `example-ctble#assume-III`, `#assume-IV`); `#eta1-lt-log-t` also misses the direct edge to `#single-type-process` (the identification f̃_1(t)=f_1(t,1,1,…) at L1136). (F10, F12-F16, F19-F20)
5. Example 3.5 verification nodes `#assume-II`, `#choose-s`, `#choose-t` keep only the part of (3.23) a reviewer knows is needed; the source premise is the whole display. (F18, F21, F22)
6. Edge locator of the root `example-ctble` and of `#apply-thm-3-1` to `#finite-offspring` cites L1192, the prerequisite's own site; the consumers use (3.1) at L1195. (F17, F23)
7. Coverage: item `inv:L930:ctble-extinction-facts` is `EXCLUDED` although its own REASON says the global-extinction definition at L930 is consumed (via `def:extinction`, `example-ctble#global-extinction`); six inventory items are missing (definition of X^d L936-L937, Assumptions I-IV with the numbered display (3.4), L927 countable-type f^{(n)}, L928 extension of Definition 1.3, L930 global-extinction definition, L1193 concrete example).

---------------------------------------------------------------------------
## 1. Node verdicts

### Definitions, displays and claims of 3.1

PASS def:truncation | spans re-read L915-L918 ((3.1) setting), L936-L937 (definition of X^d, "individuals of type k >= d+1 killed", "each of its ancestors has type k <= d", X^d_k(1)=0 for k >= d+1), L945, L1117-L1124 (comparison with X~^k: "the individual and all of its ancestors"); frozen `Conjugate/Frozen/Defs/Truncate.lean` read for statement identity only (restriction of offspring vectors to the first d types). Anchor fields equal spec section 8. NOTE remark that the individual's own type must also be <= d is a faithful flag of the source's loose wording, not an added premise. Advisory A-4 ("see Report").
PASS eqn-gf-truncated | spans re-read L920-L926 (countable-type f), L936-L951. Hypotheses (X countable type with (3.1), f of L920-L926, X^d), quantifiers (k in {1..d}) and conclusion match (3.2); edges to def:truncation ("Consequently", L945) and eqn-generating-function are direct; no proof ingredient in the fields. Advisory A-9 (domain (0,inf]^d is inherited from the domain of f, not written at (3.2)).
PASS eqn-log-gf-infty | spans re-read L991-L995, L533-L546 (Definition 2.6 "As in Definition 2.6"). E6 applied (N_0 read as N). Edges def-log-gf (cited), eqn-generating-function, def:truncation (g^d from f^d of X^d) are direct; the anchor def-log-gf has manifest range L533-L546,L991-L995 so depending on it is correct.
PASS eqn-log-gf-truncated | spans re-read L1049, L1074-L1077, L1139-L1141, L945-L951. Reused carrier-change claim (log of (3.2)) consumed at three sites; E4 reading (tail arguments 0,0,... not 1,1,...) correctly recorded in SOURCE_CONCLUSION; both edges direct and located at the consumer's use sites. Not a displayed formula of the paper, but a legitimate reused intermediate claim (spec section 6).
PASS def:stoch-dom | spans re-read L1185-L1195; frozen `Conjugate/Frozen/Defs/StochDominated.lean` read for statement identity only (upper-set domination of offspring laws). Anchor fields equal spec section 8. The source never defines the notion; the record says so. Advisory A-1 (manifest range paper.tex:1188-1190 does not contain the phrase, which is at L1194; locator follows the text).

### Theorem 3.1 (root) and its proof

PASS thm-fixed-pt-infty | spans re-read L241-L250 (Theorem 1.4 hypotheses I-III, E1), L915-L918, L957-L987, L989-L1002, L1149-L1179; frozen `Conjugate/Frozen/Theorem_3_1.lean` read for statement identity only. Hypotheses (finite offspring (3.1), global extinction probability one read for every starting type, Assumptions I-IV with their displays), quantifier order (X; I for all d; phi, psi; s; t; q) and conclusion q in (1,inf)^N with f(q)=q match the source and the anchor term for term (E6, E1). DEPS (#reduce-to-g, #interchange, #positivity) are direct and complete: #reduce-to-g needs both g(lambda)=lambda (#interchange) and lambda in (0,inf)^N (#positivity); #nonzero-limit reaches the root through #positivity. EDGE locators L996, L1176, L1178 are the root's use sites. Anchor fields equal spec section 8. Advisory A-3 (NOTE wording "not consumed by any step").
FAIL thm-fixed-pt-infty#reduce-to-g: MINOR. SOURCE_HYPOTHESES carries "lambda in (0,inf)^N with g(lambda)=lambda", the conclusions of the root's other DEPS (#interchange, #positivity); standard of F6 (slice A): hypotheses = setting, the witness belongs in SOURCE_QUANTIFIERS, where it already is. Fix F1. spans re-read L993-L996.
PASS thm-fixed-pt-infty#choose-lambda-d | spans re-read L989-L1002, L241-L250, L548-L557. Application of Theorem 1.4 (fixed-point form, R3) to X^d with premises supplied by Assumption I (root hypothesis, no node); carrier change q^d -> lambda^d = log q^d by (2.6) for the d-type process X^d is a legitimate edge (the source cites only Theorem 1.4, the NOTE says so); (3.5) for g^d. Witness-choice policy is sound and consistent with the source ("we choose one in an arbitrary manner"): one fixed selection, no property used beyond lambda^d in (0,inf)^d and g^d(lambda^d)=lambda^d, Lemmas 3.2-3.4 carry the family as a conditional premise and every consumer (#diagonal-limit, #before-dct, #dominated-bound, #nonzero-limit) has an edge to this node. CONSTANT_SCOPE faithful.
FAIL thm-fixed-pt-infty#diagonal-limit: MINOR. SOURCE_HYPOTHESES adds "the family lambda^d of (3.6)" = conclusion of its DEP #choose-lambda-d (moves to SOURCE_QUANTIFIERS); SOURCE_CONCLUSION embeds the proof reason "since lambda^d_k>0 and limsup<inf" (statement is L1150-L1153 plus the L1027 membership lambda in [0,inf)^N). Edges (Lemma 3.2 at L1150, ext:diagonal-subsequence, #choose-lambda-d) are correct. Fix F2. spans re-read L1027-L1028, L1150-L1155.
FAIL thm-fixed-pt-infty#before-dct: MINOR. Same: "the family lambda^d of (3.6)" in SOURCE_HYPOTHESES is the conclusion of its DEP #choose-lambda-d. Edges correct (L1156). Fix F3. spans re-read L1155-L1159.
FAIL thm-fixed-pt-infty#as-convergence: MINOR. SOURCE_HYPOTHESES adds the (3.6) property of the family, which this step (L1160, termwise convergence plus a.s. finiteness of the offspring vector) does not use and the source sentence does not state. Edge to #diagonal-limit correct. Fix F4. spans re-read L1160-L1163.
FAIL thm-fixed-pt-infty#dominated-bound: MINOR. "the family lambda^d of (3.6)" in SOURCE_HYPOTHESES (conclusion of DEP #choose-lambda-d); SOURCE_CONCLUSION ends with the proof pointer "using lambda^d_j<=phi(j)log t+log psi(j)". Edges (#lem-1d-soln via "(3.17)", #choose-lambda-d) are correct and located at L1167. Fix F5. spans re-read L1166-L1171, L1101-L1115.
FAIL thm-fixed-pt-infty#interchange: MINOR. "the family lambda^d of (3.6)" in SOURCE_HYPOTHESES (conclusion of #choose-lambda-d behind its DEPS #before-dct, #dominated-bound, #diagonal-limit). All six edges are direct and correctly located (dominated convergence premises are discharged: a.s. convergence by #as-convergence, domination by #dominated-bound, integrability by Assumption IV). Fix F6. spans re-read L1166-L1176.
FAIL thm-fixed-pt-infty#nonzero-limit: MINOR. "the family lambda^d of (3.6)" in SOURCE_HYPOTHESES (conclusion of its DEP #choose-lambda-d). Edges (Lemma 3.3 premise discharge via #choose-lambda-d, limits via #diagonal-limit) correct. Fix F7. spans re-read L1178.
FAIL thm-fixed-pt-infty#positivity: MAJOR (edge) + MINOR (fields). (a) SOURCE_HYPOTHESES carries the family lambda^d of (3.6) and SOURCE_QUANTIFIERS the DEP conclusions "(a fixed point of g by #interchange, non-zero by #nonzero-limit)", and SOURCE_CONCLUSION a proof pointer in quotes; (b) the edge to eqn-gen-func-n is not cited at L1178, is the finite-type claim, is already reached through lem-fixed-pos#pos-reg-strict (transitive), and so misrepresents the countable-type identity f^(N)_k = E_k[prod q_j^{X_j(N)}] (a real unwritten ingredient, correctly listed in the SOURCE_GAP NOTE, item (ii)) as covered. The SOURCE_GAP tag, the edge to lem-fixed-pos#pos-reg-strict (the source's own "similar to the second paragraph of the proof of Lemma 2.3") and the edge to def-bp-basic.positive-regular ("positive regular (Definition 1.3)") are right; nothing is supplied from outside the source. Fix F8. spans re-read L1176-L1178, L440-L472, L224-L234, L927-L928.

### Lemma 3.2

FAIL lem-fixed-limsup: MINOR. CONSTANT_SCOPE reads a proof fact into a statement field ("the proof bound log(1/p_k) depends on k and X only (not on d and not on the selection)"); the statement "limsup_{d->inf} lambda^d_k < inf for each k" names no constant. Hypotheses (setting S incl. (3.1), global extinction, Assumptions I-IV, (3.6) with arbitrary selection) are the displayed premises of the lemma and correct; quantifier order correct; DEP #moment-bound located at L1024. Fix F9 (CONSTANT_SCOPE -> none; the proof fact moves to NOTE). spans re-read L1004-L1025, L957-L984.
PASS lem-fixed-limsup#choose-N | spans re-read L1009-L1012, L477-L494, L241-L250. Lemma 2.4 applied to X^k; premises (positive regular, non-singular) are Assumption I for d=k. N depends on k (literal "depending on k"). Edge direct.
FAIL lem-fixed-limsup#truncation-monotone: MINOR. SOURCE_HYPOTHESES "N and p_k as in lem-fixed-limsup#choose-N" restates the witness of its DEP (the property p_k := P_k[X^k_k(N)>=2] > 0 of #choose-N); goes into SOURCE_QUANTIFIERS (F10-style). Edges to #choose-N and def:truncation direct; "by the definition of X^d" (L1013) is the source's own justification, so no SOURCE_GAP tag is required (advisory A-6). Fix F10. spans re-read L1011-L1016, L936-L937.
PASS lem-fixed-limsup#moment-bound | spans re-read L1017-L1024. Quantifiers bind N, p_k as witnesses of #choose-N (correct form); edges truncation-monotone, choose-N, eqn-convex-func-n ((2.5) for X^d, the identity used at L1019-L1021) are direct and located at the consumer.

### Lemma 3.3

FAIL lem-fixed-liminf: MAJOR (source-statement field). CONSTANT_SCOPE is an unresolved placeholder ("orchestrator to fix the reading") and mixes a proof fact in ("the proof K depends only on phi, psi and delta=log s"). The statement reads "There exists K in N such that liminf_{d->inf} max_{k<=K} lambda^d_k > 0": K is introduced after X, phi, psi, s, t and the selection (lambda^d)_d, so it may depend on all of them and not on d (d is the variable of the liminf); it asserts no independence from the selection. The uniform reading is stronger than the statement and is recorded for Lean planning in NOTE only (same ruling as lem-mono, slice B). Other three source fields, DEPS (#step2, #choose-K) and EDGE locators are correct. Fix F11. spans re-read L1028, L1031-L1036, L1080-L1083, L1095-L1096.
PASS lem-fixed-liminf#subinvariant-weights | spans re-read L1039-L1052, L972-L975, L1041-L1049. delta=log s from Assumption III (setting); (3.7)->(3.8) by the definition (3.5) and (3.8)->(3.9) "by (3.2)" via eqn-log-gf-truncated, edges cite the consumer's lines; the coordinatewise-monotone comparison is below threshold and said so.
PASS lem-fixed-liminf#iterate-subinvariant | spans re-read L1054-L1057, L594-L598. Lemma 2.9 first assertion for X^d, premises = Assumption I (root hypothesis) and lambda <= eta in [0,inf)^d (immediate); edge to the one-step bound (3.9) correct.
PASS lem-fixed-liminf#orbit-decay | spans re-read L1058-L1061, L608-L615. Proposition 2.10(i) for X^d; premises discharged: lambda=(delta phi(j))_j in [0,inf)^d\{0} (phi>=1, delta>0), eta in the box so eta<lambda, limsup |g^(n)(lambda)| < inf by (3.10); edges direct.
PASS lem-fixed-liminf#step1 | spans re-read L1062-L1065. Contradiction argument from (3.11) and g^{d,(n)}(lambda^d)=lambda^d (lemma-level premise (3.6)); single edge to #orbit-decay is the only dependency the source gives.
PASS lem-fixed-liminf#growth-compare | spans re-read L1071-L1078, L970. E4 reading recorded; Assumption II applied at q = exp(lambda^d,0,0,...) in [1,inf)^N; both edges direct.
PASS lem-fixed-liminf#choose-K | spans re-read L1080-L1083, L963-L967. Witness K from lim log psi(k)/phi(k)=0 (Assumption II) with tolerance delta/2 (delta from Assumption III); "not depending on d" is stated in the source; CONSTANT_SCOPE (K depends only on phi, psi, delta) is the step's own definition and is read from the display, not from a later use.
FAIL lem-fixed-liminf#case-small-k: MINOR. SOURCE_HYPOTHESES restates "K as chosen in #choose-K; k(d) as in (3.12)" = witness and property (lambda^d_{k(d)} >= delta phi(k(d))) of DEPS #choose-K and #step1; both go into SOURCE_QUANTIFIERS. Edges correct. Fix F12. spans re-read L1084-L1087.
FAIL lem-fixed-liminf#case-large-k: MINOR. Same ("K as chosen in #choose-K; k(d) as in (3.12)" in SOURCE_HYPOTHESES). Edges to #growth-compare, #step1, #choose-K cite L1089-L1093 and are correct. Fix F13. spans re-read L1089-L1096.
FAIL lem-fixed-liminf#step2: MINOR. SOURCE_HYPOTHESES restates "K as chosen in #choose-K" (witness of DEP). Edges correct (case-small-k, case-large-k, choose-K). The combined bound delta/2 and the liminf are the closing inference the source does not write; correctly stated as such in NOTE and below threshold (advisory A-14). Fix F14. spans re-read L1067-L1096.

### Lemma 3.4

PASS lem-1d-soln | spans re-read L1101-L1115, L1116-L1145. Hypotheses: first two assertions for k with P_k[X_k(1) >= 2] > 0, third assertion for all integers d >= k >= 1 with t, phi, psi from Assumptions IV, II; quantifier order and constant scope (eta_k depends on X, k only by its defining equation; (3.17) right side on phi, psi, t, k) read from the statement. DEPS (#k1-nonsingular for "in particular k=1", #apply-prop-1-6, #bound-by-eta, #growth-bound) are direct. Advisory A-5 (typo "For each k>=d" at L1127 read as d>=k).
PASS lem-1d-soln#k1-nonsingular | spans re-read L1117, L230-L233. X^1 non-singular means P_1[X^1_1(1)>=2] > 0 and X^1_1(1)=X_1(1) under P_1; edges to def-bp-basic.non-singular and def:truncation direct.
PASS lem-1d-soln#single-type-process | spans re-read L1119-L1124, L945-L951. Construction by analogy with (3.2) is a one-line restriction; edges direct; not a gap.
PASS lem-1d-soln#single-type-subcritical | spans re-read L1125. SOURCE_GAP tag correct ("it is immediate" with no argument; the diagonal-entry-below-spectral-radius deduction is not written and is not supplied); edges to #single-type-process and def:subcritical are the source's objects.
PASS lem-1d-soln#single-type-continuous | spans re-read L1125, L348. SOURCE_GAP tag correct; the printed codomain [0,inf] versus the (0,inf] required by Proposition 1.6(III) is recorded and not silently repaired.
PASS lem-1d-soln#apply-prop-1-6 | spans re-read L1119-L1125, L343-L351. Right root (`prop-single-type.fixed-point`, unique q in (1,inf), E7); hypothesis (II) is the lemma's own hypothesis, (I) and (III) discharged by #single-type-subcritical and #single-type-continuous, (X~^k, f~_k) by #single-type-process; edge to eqn-log-gf-infty for eta_k = log q is direct.
PASS lem-1d-soln#convexity | spans re-read L1134. SOURCE_GAP tag correct (second derivative positive asserted in a parenthesis); no edge to the slice-A gap node because the source does not cite it.
FAIL lem-1d-soln#diagonal-position: MINOR. SOURCE_HYPOTHESES "eta_k as in (3.15)" restates the witness and property (f~_k(e^{eta_k}) = e^{eta_k}) of its DEP #apply-prop-1-6; moves to SOURCE_QUANTIFIERS. Edges (#convexity, #apply-prop-1-6) correct. Fix F15. spans re-read L1134-L1136.
PASS lem-1d-soln#bound-by-eta | spans re-read L1127-L1134. Quantifiers bind eta_k as the witness of (3.15); edges to #diagonal-position, eqn-gf-truncated ((3.2) at L1129-L1130), eqn-log-gf-infty and #single-type-process (L1131-L1132) direct; monotonicity of f_k on [1,inf) is below threshold and said so; typo reading flagged.
FAIL lem-1d-soln#eta1-lt-log-t: MAJOR (edge) + MINOR (fields). (a) Missing direct edge to lem-1d-soln#single-type-process: L1136 "by Assumption IV we have f~_1(t) > t" uses f~_1(t) = f_1(t,1,1,...) (L1120-L1124), exactly the identification that #bound-by-eta cites for the same node; the record's "i.e. f~_1(t)>t" in SOURCE_HYPOTHESES is the unlinked use. (b) SOURCE_HYPOTHESES "eta_1 as in (3.15) for k=1" restates the witness of DEP #apply-prop-1-6/#k1-nonsingular. Fix F16. spans re-read L1120-L1124, L1136.
PASS lem-1d-soln#growth-bound | spans re-read L1136-L1144, L970. Chain (3.17): eqn-log-gf-truncated for the two g_k(lambda^d,0,0,...) identifications (source prints 0,0,... here), Assumption II, (3.16) for k=1 via #bound-by-eta, eta_1<log t via #eta1-lt-log-t; all edges direct and at L1139-L1143.

### Example 3.5

FAIL example-ctble: MINOR (edge locator). EDGE to example-ctble#finite-offspring cites L1192, the prerequisite's own statement and proof site; the root consumes (3.1) at L1195 ("for the branching process with offspring distributions {P_k}"), the root's PROOF_SOURCE. Everything else is correct: hypotheses (3.23) for P_1 and (all four conditions, E8) for P_k plus domination, quantifiers (phi=k, psi=1 specified; s, t chosen; q last), conclusion (global extinction, I-IV, q), the nine DEPS as a direct AND (the anchor's conclusion is the conjunction), anchor fields equal spec section 8 and the frozen `Conjugate/Frozen/Example_3_5.lean` statement. Fix F17. spans re-read L1182-L1201; frozen `Example_3_5.lean` statement only.
PASS example-ctble#finite-offspring | spans re-read L1185-L1192. Asserted note with no proof; the content is immediate from E_1[sum jX_j(1)] < 1 and is below the step threshold (not a gap node); E8 read for P_k.
PASS example-ctble#global-extinction | spans re-read L930, L958, L1182-L1201. SOURCE_GAP tag correct: the example never mentions global extinction probability one although it is a hypothesis of Theorem 3.1 and of the anchor's conclusion.
PASS example-ctble#assume-I | spans re-read L961, L1194-L1195. SOURCE_GAP tag correct ("One can easily verify"); unwritten sub-obligations listed; the comment block L1206-L1211 is not used.
FAIL example-ctble#assume-II: MINOR. SOURCE_HYPOTHESES keeps only "domination of P_k"; the source premise for "the assumptions of Theorem 3.1 are satisfied with phi(k)=k, psi(k)=1" is the whole example hypothesis ((3.23) for every P_k and domination); trimming it is choosing which parts suffice, i.e. supplying the omitted argument. Fix F18. spans re-read L1185-L1195.
FAIL example-ctble#assume-III: MINOR. SOURCE_HYPOTHESES contains "s>1 with E_1[s^{sum j X_j(1)}] < s", the property of the witness of its DEP #choose-s; moves to SOURCE_QUANTIFIERS. Edges correct. Fix F19. spans re-read L1195-L1198.
FAIL example-ctble#assume-IV: MINOR. Same for "t>1 with E_1[t^{X_1(1)}] > t" (witness of DEP #choose-t). Edges correct. Fix F20. spans re-read L1195-L1199.
FAIL example-ctble#choose-s: MINOR. SOURCE_HYPOTHESES trims (3.23) to two of its four conditions; the source says existence "follows easily from (3.23)" (the whole display). Fix F21. spans re-read L1186-L1190, L1195-L1200.
FAIL example-ctble#choose-t: MINOR. Same (keeps two of four conditions of (3.23)). Fix F22. spans re-read L1186-L1190, L1195-L1200.
FAIL example-ctble#apply-thm-3-1: MINOR (edge locator). EDGE to #finite-offspring cites L1192 (prerequisite's own site); the application of Theorem 3.1 uses (3.1) at L1195 as part of the countable-type setting. Hypotheses, conclusion and the other six edges are correct (premise discharge of Theorem 3.1: (3.1) by #finite-offspring, global extinction by #global-extinction, I-IV by #assume-I..IV with s, t carried through #assume-III/#assume-IV). Fix F23. spans re-read L1182-L1183, L1192-L1195.

### External leaves

PASS ext:dct | spans re-read L1166-L1176 (invoked by name at L1172). Statement and premise set (a.s. convergence, domination by an integrable Z) match the use; canonical ID of spec section 5.
PASS ext:diagonal-subsequence | spans re-read L1150-L1153 ("a standard compactness argument"). Canonical ID of spec section 5; hypotheses (limsup |a^d_k| < inf for each k) are what Lemma 3.2 supplies.

---------------------------------------------------------------------------
## 2. Replacement fragments for node FAILs

Common text used below: `SETTING-S` = "§3.2 setting S (countable-type X with (3.1), global extinction probability one, Assumptions I-IV with witnesses φ, ψ, s, t; full text in SOURCE_HYPOTHESES of thm-fixed-pt-infty)". Each fragment is written out in full (the macro is only shorthand in this sentence, not in the fragments).

### F1 thm-fixed-pt-infty#reduce-to-g
```
SOURCE_HYPOTHESES: X countable-type branching process with types ℕ and generating function f; g as in (3.5)
SOURCE_QUANTIFIERS: X; λ∈(0,∞)^ℕ with g(λ)=λ (the witness assembled by thm-fixed-pt-infty#interchange and thm-fixed-pt-infty#positivity); q := exp(λ) componentwise
```
(SOURCE_CONCLUSION, DEPS, EDGE unchanged.)

### F2 thm-fixed-pt-infty#diagonal-limit
```
SOURCE_HYPOTHESES: §3.2 setting S (countable-type X with (3.1), global extinction probability one, Assumptions I-IV with witnesses φ, ψ, s, t; full text in SOURCE_HYPOTHESES of thm-fixed-pt-infty)
SOURCE_QUANTIFIERS: X; (λ^d)_{d∈ℕ} the selection of thm-fixed-pt-infty#choose-lambda-d (λ^d∈(0,∞)^d, g^d(λ^d)=λ^d, (3.6)); ∃ a sequence 𝒟 of positive integers tending to ∞ such that for every k∈ℕ the limit lim_{𝒟∋d→∞}λ^d_k exists
SOURCE_CONCLUSION: there is a sequence 𝒟 of positive integers tending to ∞ such that λ_k := lim_{𝒟∋d→∞}λ^d_k exists for every k∈ℕ (3.19); λ := {λ_k}_{k∈ℕ}∈[0,∞)^ℕ (L1027)
```
(CONSTANT_SCOPE, DEPS, EDGE unchanged.)

### F3 thm-fixed-pt-infty#before-dct
```
SOURCE_HYPOTHESES: §3.2 setting S (countable-type X with (3.1), global extinction probability one, Assumptions I-IV with witnesses φ, ψ, s, t; full text in SOURCE_HYPOTHESES of thm-fixed-pt-infty)
SOURCE_QUANTIFIERS: X; (λ^d)_{d∈ℕ} the selection of thm-fixed-pt-infty#choose-lambda-d (λ^d∈(0,∞)^d, g^d(λ^d)=λ^d, (3.6)); d∈ℕ; k∈{1,…,d}
```
(SOURCE_CONCLUSION, DEPS, EDGE unchanged.)

### F4 thm-fixed-pt-infty#as-convergence
```
SOURCE_HYPOTHESES: §3.2 setting S (countable-type X with (3.1), global extinction probability one, Assumptions I-IV with witnesses φ, ψ, s, t; full text in SOURCE_HYPOTHESES of thm-fixed-pt-infty); in particular finite offspring (3.1): ℙ_k-a.s. only finitely many j have X_j(1)≠0
SOURCE_QUANTIFIERS: X; (λ^d)_{d∈ℕ} the selection of thm-fixed-pt-infty#choose-lambda-d; 𝒟 and λ=(λ_j)_j the sequence and limit of thm-fixed-pt-infty#diagonal-limit (3.19); k∈ℕ
```
(SOURCE_CONCLUSION, DEPS, EDGE unchanged.)

### F5 thm-fixed-pt-infty#dominated-bound
```
SOURCE_HYPOTHESES: §3.2 setting S (countable-type X with (3.1), global extinction probability one, Assumptions I-IV with witnesses φ, ψ, s, t; full text in SOURCE_HYPOTHESES of thm-fixed-pt-infty); t>1 from Assumption IV and φ,ψ from Assumption II
SOURCE_QUANTIFIERS: X; (λ^d)_{d∈ℕ} the selection of thm-fixed-pt-infty#choose-lambda-d; d∈ℕ; j≤d; the non-negative integers X_j(1)
SOURCE_CONCLUSION: for every d∈ℕ: exp(Σ_{j=1}^dλ^d_jX_j(1)) ≤ ∏_{j=1}^∞[ψ(j)t^{φ(j)}]^{X_j(1)} (3.22)
```
(CONSTANT_SCOPE, DEPS, EDGE unchanged; the proof facts "λ^d_j≤φ(j)log t+log ψ(j) for d≥j" and the extension of the product from j≤d to all j stay in NOTE.)

### F6 thm-fixed-pt-infty#interchange
```
SOURCE_HYPOTHESES: §3.2 setting S (countable-type X with (3.1), global extinction probability one, Assumptions I-IV with witnesses φ, ψ, s, t; full text in SOURCE_HYPOTHESES of thm-fixed-pt-infty); in particular Assumption IV (f_k({ψ(j)t^{φ(j)}}_j)<∞ for every k) and (3.1)
SOURCE_QUANTIFIERS: X; (λ^d)_{d∈ℕ} the selection of thm-fixed-pt-infty#choose-lambda-d; 𝒟 and λ the sequence and limit of thm-fixed-pt-infty#diagonal-limit (3.19); k∈ℕ
```
(SOURCE_CONCLUSION, DEPS, EDGE unchanged.)

### F7 thm-fixed-pt-infty#nonzero-limit
```
SOURCE_HYPOTHESES: §3.2 setting S (countable-type X with (3.1), global extinction probability one, Assumptions I-IV with witnesses φ, ψ, s, t; full text in SOURCE_HYPOTHESES of thm-fixed-pt-infty)
SOURCE_QUANTIFIERS: X; (λ^d)_{d∈ℕ} the selection of thm-fixed-pt-infty#choose-lambda-d; 𝒟 and λ the sequence and limit of thm-fixed-pt-infty#diagonal-limit (3.19); K from Lemma 3.3 (lem-fixed-liminf); ∃k∈{1,…,K}
```
(SOURCE_CONCLUSION, DEPS, EDGE unchanged.)

### F8 thm-fixed-pt-infty#positivity
```
SOURCE_HYPOTHESES: §3.2 setting S (countable-type X with (3.1), global extinction probability one, Assumptions I-IV with witnesses φ, ψ, s, t; full text in SOURCE_HYPOTHESES of thm-fixed-pt-infty); in particular Assumption I (each truncation X^d is positive regular, Definition 1.3)
SOURCE_QUANTIFIERS: X; λ=(λ_k)_{k∈ℕ} the limit of thm-fixed-pt-infty#diagonal-limit (3.19), with g(λ)=λ (thm-fixed-pt-infty#interchange) and λ∈[0,∞)^ℕ∖{0} (thm-fixed-pt-infty#nonzero-limit); k∈ℕ
SOURCE_CONCLUSION: λ_k>0 for every k∈ℕ, i.e. λ∈(0,∞)^ℕ
DEPS: thm-fixed-pt-infty#nonzero-limit, thm-fixed-pt-infty#interchange, lem-fixed-pos#pos-reg-strict, def-bp-basic.positive-regular
EDGE: thm-fixed-pt-infty#nonzero-limit | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-thm-fixed-pt-infty@L1178-L1178 | supplies λ∈[0,∞)^ℕ∖{0}, i.e. a coordinate j_* with λ_{j_*}>0 (the analogue of q_{j_*}>1 in Lemma 2.3)
EDGE: thm-fixed-pt-infty#interchange | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-thm-fixed-pt-infty@L1176-L1178 | λ is a fixed point g(λ)=λ, hence g^{(N)}(λ)=λ for every N, the identity the argument iterates
EDGE: lem-fixed-pos#pos-reg-strict | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-thm-fixed-pt-infty@L1178-L1178 | 'an argument similar to that in the second paragraph of the proof of Lemma 2.3' (L461-L471): one coordinate q_{j_*}>1 plus positive regularity forces q_k>1 for all k
EDGE: def-bp-basic.positive-regular | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#proof-thm-fixed-pt-infty@L1178-L1178 | 'Since each truncated branching process X^d is positive regular (Definition 1.3)': supplies N with ℙ_k[X_{j_*}(N)≥1]>0
NOTE: SOURCE_GAP: the paper only says an argument similar to the second paragraph of the proof of Lemma 2.3 shows λ∈(0,∞)^ℕ ('an argument similar to that in the second paragraph of the proof of Lemma 2.3 shows', L1178). Unwritten: (i) positive regularity is available for each truncation X^d, not for the countable-type X, and the transfer of ℙ_k[X^d_{j_*}(N)≥1]>0 (k,j_*≤d, N=N(d)) to ℙ_k[X_{j_*}(N)≥1]>0 is not written; (ii) the countable-type identities g^{(N)}(λ)=λ and f^{(N)}_k(q)=𝔼_k[∏_jq_j^{X_j(N)}] ((1.2) for infinitely many types) are not stated anywhere (L927 only defines f^{(n)} as a composition); (iii) the quantifier order of N and d. The edge to lem-fixed-pos#pos-reg-strict is the source's own pointer ('similar') and is a reconstruction by analogy, not a use of its finite-type statement. The earlier edge to eqn-gen-func-n was dropped by review: the source does not cite (1.2) at L1178, the finite-type (1.2) is already reached through lem-fixed-pos#pos-reg-strict, and it cannot discharge the countable-type identity of (ii), which stays an unwritten part of this gap.
```

### F9 lem-fixed-limsup
```
CONSTANT_SCOPE: none (the statement names no constant: limsup_{d→∞}λ^d_k<∞ is asserted for each k∈ℕ and the given selection (λ^d)_d)
NOTE: Lemmas 3.2-3.4 live in the setting of §3.2 (spec §4): global extinction probability one and Assumptions I-IV; no assumption nodes. λ^d_k is defined for d≥k, so the limsup is over d≥k. The proof consumes only Assumption I (through Lemma 2.4 for X^k). Recorded for Lean planning only: the proof's bound log(1/p_k) depends on k and X only (not on d and not on the selection), a stronger uniform reading than the statement.
```

### F10 lem-fixed-limsup#truncation-monotone
```
SOURCE_HYPOTHESES: k∈ℕ; truncations X^d of X (d≥k)
SOURCE_QUANTIFIERS: X; k; N and p_k := ℙ_k[X^k_k(N)≥2] the witnesses of lem-fixed-limsup#choose-N; d≥k
```
(SOURCE_CONCLUSION, CONSTANT_SCOPE, DEPS, EDGE unchanged.)

### F11 lem-fixed-liminf
```
CONSTANT_SCOPE: K is introduced after X, φ, ψ, s, t and the selection (λ^d)_d ('There exists K∈ℕ such that liminf_{d→∞} …'), so the statement lets K depend on all of them but not on d; it asserts no independence of K from the selection
NOTE: The paper says this is where Assumptions II and III are used (L1028); Assumption I enters through Lemma 2.9 and Proposition 2.10 for X^d. Step 1 enters the conclusion through the case split of #step2. Constant scope: literal reading as in CONSTANT_SCOPE; the proof's K (#choose-K) depends only on φ, ψ and δ=log s, a stronger uniform reading recorded for Lean planning only (cf. ADJUDICATION B4 for lem-mono).
```

### F12 lem-fixed-liminf#case-small-k
```
SOURCE_HYPOTHESES: §3.2 setting S (countable-type X with (3.1), global extinction probability one, Assumptions I-IV with witnesses φ, ψ, s, t; full text in SOURCE_HYPOTHESES of lem-fixed-limsup) and the family λ^d of (3.6)
SOURCE_QUANTIFIERS: X; K the witness of lem-fixed-liminf#choose-K; d∈ℕ with k(d)≤K-1, where k(d)∈{1,…,d} is the index of lem-fixed-liminf#step1 (λ^d_{k(d)}≥δφ(k(d)), (3.12))
```
(SOURCE_CONCLUSION, CONSTANT_SCOPE, DEPS, EDGE unchanged.)

### F13 lem-fixed-liminf#case-large-k
```
SOURCE_HYPOTHESES: §3.2 setting S (countable-type X with (3.1), global extinction probability one, Assumptions I-IV with witnesses φ, ψ, s, t; full text in SOURCE_HYPOTHESES of lem-fixed-limsup) and the family λ^d of (3.6)
SOURCE_QUANTIFIERS: X; K the witness of lem-fixed-liminf#choose-K; d∈ℕ with k(d)≥K, where k(d)∈{1,…,d} is the index of lem-fixed-liminf#step1 (λ^d_{k(d)}≥δφ(k(d)), (3.12))
```
(SOURCE_CONCLUSION, CONSTANT_SCOPE, DEPS, EDGE unchanged.)

### F14 lem-fixed-liminf#step2
```
SOURCE_HYPOTHESES: §3.2 setting S (countable-type X with (3.1), global extinction probability one, Assumptions I-IV with witnesses φ, ψ, s, t; full text in SOURCE_HYPOTHESES of lem-fixed-limsup) and the family λ^d of (3.6)
SOURCE_QUANTIFIERS: X; K the witness of lem-fixed-liminf#choose-K; ∀d∈ℕ (d≥K so that the indices ≤K make sense)
```
(SOURCE_CONCLUSION, CONSTANT_SCOPE, DEPS, EDGE unchanged.)

### F15 lem-1d-soln#diagonal-position
```
SOURCE_HYPOTHESES: k∈ℕ with ℙ_k[X_k(1)≥2]>0
SOURCE_QUANTIFIERS: X; k; η_k the unique solution of (3.15) supplied by lem-1d-soln#apply-prop-1-6 (f̃_k(e^{η_k})=e^{η_k}); x≥1
```
(SOURCE_CONCLUSION, CONSTANT_SCOPE, DEPS, EDGE unchanged.)

### F16 lem-1d-soln#eta1-lt-log-t
```
SOURCE_HYPOTHESES: Assumption IV: t>1 with f_1(t,1,1,…)>t
SOURCE_QUANTIFIERS: X; t>1 from Assumption IV; η_1 the solution of (3.15) for k=1 (supplied by lem-1d-soln#apply-prop-1-6, admissible by lem-1d-soln#k1-nonsingular)
DEPS: lem-1d-soln#diagonal-position, lem-1d-soln#k1-nonsingular, lem-1d-soln#single-type-process
EDGE: lem-1d-soln#diagonal-position | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-1d-soln-growth@L1136-L1136 | 'By convexity, f̃_1(x)≤x for all x∈[1,e^{η_1}], so η_1<log t': f̃_1(t)>t with t>1 excludes t∈[1,e^{η_1}], hence t>e^{η_1}
EDGE: lem-1d-soln#k1-nonsingular | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-1d-soln-growth@L1136-L1136 | η_1 is defined by (3.15) for k=1, which requires ℙ_1[X_1(1)≥2]>0
EDGE: lem-1d-soln#single-type-process | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#eqn-1d-soln-growth@L1136-L1136 | 'by Assumption IV we have f̃_1(t)>t': f̃_1(t)=f_1(t,1,1,…) by the definition of f̃_k (L1120-L1124), the identification of Assumption IV with the one-type function to which diagonal-position applies
```
(SOURCE_CONCLUSION, CONSTANT_SCOPE unchanged.)

### F17 example-ctble
```
EDGE: example-ctble#finite-offspring | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1195-L1195 | 'for the branching process with offspring distributions {ℙ_k}, the assumptions of Theorem 3.1 are satisfied': the example process is a countable-type process in the sense of §3.1 only if (3.1) holds, which is the Note at L1192 (the prerequisite's own site, not cited here)
```
(All other fields and the other eight EDGE lines unchanged.)

### F18 example-ctble#assume-II
```
SOURCE_HYPOTHESES: (3.23) for every ℙ_k (E8: all four conditions for each k); domination of ℙ_k (k≥2) by the componentwise sum of k i.i.d. samples from ℙ_1
```
(All other fields unchanged.)

### F19 example-ctble#assume-III
```
SOURCE_HYPOTHESES: (3.23) for every ℙ_k; domination of ℙ_k (k≥2) by the componentwise sum of k i.i.d. samples from ℙ_1
SOURCE_QUANTIFIERS: X; s>1 the witness of example-ctble#choose-s (𝔼_1[s^{Σ_jjX_j(1)}]<s); k∈ℕ
```
(SOURCE_CONCLUSION, CONSTANT_SCOPE, DEPS, EDGE unchanged.)

### F20 example-ctble#assume-IV
```
SOURCE_HYPOTHESES: (3.23) for every ℙ_k (finite exponential moments); domination of ℙ_k (k≥2) by the componentwise sum of k i.i.d. samples from ℙ_1
SOURCE_QUANTIFIERS: X; t>1 the witness of example-ctble#choose-t (𝔼_1[t^{X_1(1)}]>t); k∈ℕ
```
(SOURCE_CONCLUSION, CONSTANT_SCOPE, DEPS, EDGE unchanged.)

### F21 example-ctble#choose-s
```
SOURCE_HYPOTHESES: (3.23) for ℙ_1, all four conditions: ℙ_1[X_j(1)≥1]>0 for all j∈ℕ; ℙ_1[X_1(1)≥2]>0; 𝔼_1[u^{Σ_{j≥1}jX_j(1)}]<∞ for all u>1; 𝔼_1[Σ_{j≥1}jX_j(1)]<1 (the source says only that existence 'follows easily from (3.23)')
```
(All other fields unchanged.)

### F22 example-ctble#choose-t
```
SOURCE_HYPOTHESES: (3.23) for ℙ_1, all four conditions: ℙ_1[X_j(1)≥1]>0 for all j∈ℕ; ℙ_1[X_1(1)≥2]>0; 𝔼_1[u^{Σ_{j≥1}jX_j(1)}]<∞ for all u>1; 𝔼_1[Σ_{j≥1}jX_j(1)]<1 (the source says only that existence 'follows easily from (3.23)')
```
(All other fields unchanged.)

### F23 example-ctble#apply-thm-3-1
```
EDGE: example-ctble#finite-offspring | source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#example-ctble@L1195-L1195 | 'the assumptions of Theorem 3.1 are satisfied': (3.1) is part of the countable-type setting of Theorem 3.1 (L915-L918); it is verified for the example by the Note at L1192 (the prerequisite's own site, not cited here)
```
(All other fields and the other six EDGE lines unchanged.)

---------------------------------------------------------------------------
## 3. Coverage verdicts

PASS inv:heading:L908 | spans re-read L908-L911 (orienting paragraph L911 is expository: "one can prove versions ... roughly speaking")
PASS inv:heading:L913 | spans re-read L913-L915
PASS inv:eqn-finite-offspring | spans re-read L915-L918, L1160. (3.1) is a hypothesis of the countable-type setting; consumed by #as-convergence, root hypotheses, and checked by #finite-offspring.
FAIL inv:L930:ctble-extinction-facts: disposition `EXCLUDED` contradicts its own REASON, which says the global-extinction definition at L930 is consumed (anchor def:extinction has manifest range paper.tex:179,930; `example-ctble#global-extinction` and the L958 hypothesis use it). Split: keep the cited background excluded and add item `inv:L930:global-extinction-def` mapped to nodes. Fix C1 (and new item C2). spans re-read L930-L936, L958.
PASS inv:cite:L930:Bertacchi2014 | spans re-read L930. Advisory A-12 (the item also stands for the keys Bertacchi2017, Braunsteins2019).
PASS inv:cite:L930:Bertacchi2020 | spans re-read L930
PASS inv:cite:L932:Bertacchi2022 | spans re-read L932
PASS inv:cite:L932:Moyal1964 | spans re-read L932
PASS inv:L934:ctble-conjugate-extension | spans re-read L934, L1182-L1183. Exclusion is spec section 7 (countable-type extension of Prop 2.2); the REASON names the obligation not modeled (fixed point implies conjugate process), which the root example-ctble statement mentions at L1183 but whose anchor concludes only the fixed point. See A-2.
PASS inv:cite:L934:jl-cond-on-ext.2 | spans re-read L934
PASS inv:cite:L934:jl-cond-on-ext.3 | spans re-read L934
PASS inv:eqn-gf-truncated | spans re-read L936-L951. Disposition correct; the missing separate item for the definition of X^d (L936-L937) is C3.
PASS inv:cite:L952:hln-ext-prob | spans re-read L952
PASS inv:heading:L955 | spans re-read L955-L959
PASS inv:eqn-weight-function | spans re-read L961-L967 ((3.3) inside Assumption II; consumed by #choose-K)
PASS inv:thm-fixed-pt-infty | spans re-read L957-L987
PASS inv:eqn-log-gf-infty | spans re-read L991-L996
PASS inv:L998:arbitrary-fixed-point-choice | spans re-read L997-L1002
PASS inv:eqn-fixed-pt-trunc | spans re-read L998-L1001
PASS inv:lem-fixed-limsup | spans re-read L1004-L1006
PASS inv:proof:lem-fixed-limsup | spans re-read L1007-L1025
PASS inv:lem-fixed-liminf | spans re-read L1031-L1036
PASS inv:proof:lem-fixed-liminf | spans re-read L1037-L1097
PASS inv:eqn-use-gf-bded-infty | spans re-read L1041-L1048
PASS inv:eqn-gf-truncated-strict | spans re-read L1049-L1052
PASS inv:eqn-use-mono-infty | spans re-read L1054-L1057
PASS inv:eqn-fixed-liminf-zero | spans re-read L1058-L1061
PASS inv:eqn-fixed-pt-one-coord | spans re-read L1062-L1065
PASS inv:eqn-fixed-pt-exp-bd | spans re-read L1071-L1078 (and E4 note on L1075)
PASS inv:eqn-fixed-pt-coord-compare | spans re-read L1089-L1096
PASS inv:lem-1d-soln | spans re-read L1101-L1115
PASS inv:eqn-1d-soln | spans re-read L1102-L1106, L1125
PASS inv:eqn-1d-soln-ineq | spans re-read L1107-L1110, L1127-L1134
PASS inv:eqn-1d-soln-growth | spans re-read L1111-L1114, L1136-L1144
PASS inv:proof:lem-1d-soln | spans re-read L1116-L1145
PASS inv:eqn-fixed-pt-first-coord | spans re-read L1127-L1134
PASS inv:proof:thm-fixed-pt-infty | spans re-read L1149-L1179
PASS inv:eqn-ssl | spans re-read L1150-L1155
PASS inv:eqn-before-fatou | spans re-read L1155-L1159
PASS inv:eqn-fixed-pt-as-conv | spans re-read L1160-L1163
PASS inv:eqn-dominate | spans re-read L1166-L1172
PASS inv:example-ctble | spans re-read L1182-L1201. The REASON names the unmodeled L1193 illustration; the new EXCLUDED item C7 makes that disposition explicit.
PASS inv:eqn-example-condition | spans re-read L1185-L1192
FAIL (missing) inv:L930:global-extinction-def: new item C2.
FAIL (missing) inv:L936:def-truncation: definition of X^d (anchor def:truncation, manifest range L937-L948) has no inventory item of its own (its only mention is the REASON of inv:eqn-gf-truncated). New item C3.
FAIL (missing) inv:L957:assumptions-I-IV: the four labelled assumptions (labels item-gf-trunc-infty, item-gf-growth-infty, item-gf-bded-infty, item-gf-perturb-infty), the numbered display (3.4) at L970 and the unnumbered displays L974, L978-L979 have no item; only (3.3) and the theorem environment are inventoried. New item C4.
FAIL (missing) inv:L927:ctble-fn-iterate: "We also define f^{(n)} to be the composition of f with itself n times" (countable-type f, L927) is the only text behind the unwritten countable-type (1.2) of #positivity. New item C5.
FAIL (missing) inv:L928:ctble-regularity-extension: "Extending d to ℕ, the definitions of positive regularity and non-singularity in Definition 1.3 also apply to the countable-type X" (L928). New item C6.
FAIL (missing) inv:L1193:concrete-example: the sampling recipe of L1193. New item C7.

---------------------------------------------------------------------------
## 4. Replacement fragments for coverage FAILs

### C1 inv:L930:ctble-extinction-facts
```
ITEM: inv:L930:ctble-extinction-facts
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-extinction-facts@L930-L936
DISPOSITION: EXCLUDED
REASON: cited background on partial and local extinction, the inequalities q ≤ q(A) ≤ q̃ ≤ 1, the fixed-point sets S and Q and their literature (L930-L932), the conjugate remark L934 (inv:L934:ctble-conjugate-extension) and the introductory sentence L936 are excluded by spec §7: no step of Theorem 3.1 or Example 3.5 consumes them. The definition of global extinction that Theorem 3.1 and Example 3.5 do use is not excluded: it is the separate item inv:L930:global-extinction-def
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: -
```

### C2 inv:L930:global-extinction-def (new)
```
ITEM: inv:L930:global-extinction-def
KIND: definition
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#global-extinction-def@L930-L930
DISPOSITION: NODE def:extinction, example-ctble#global-extinction
REASON: 'global extinction, defined as lim_{n→∞} Σ_k X_k(n) = 0' is the extinction notion of the hypothesis 'global extinction probability one' of Theorem 3.1 (L958) and of the conclusion of Example 3.5; the frozen anchor def:extinction (owned by slice A, STATEMENT_SOURCE L179) has manifest range paper.tex:179,930, and example-ctble#global-extinction consumes it. No new node
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: -
```

### C3 inv:L936:def-truncation (new)
```
ITEM: inv:L936:def-truncation
KIND: definition
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#truncation@L936-L937
DISPOSITION: NODE def:truncation
REASON: the branching process X^d truncated at level d (individuals of type ≥ d+1 killed immediately, X^d_k(1)=0 for k≥d+1, superscript-d convention for all associated objects) is the frozen definition anchor def:truncation (manifest range paper.tex:937-948); the display (3.2) that follows is inv:eqn-gf-truncated
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: -
```

### C4 inv:L957:assumptions-I-IV (new)
```
ITEM: inv:L957:assumptions-I-IV
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#assumptions-I-IV@L957-L984
DISPOSITION: NODE thm-fixed-pt-infty, lem-fixed-limsup, lem-fixed-liminf, lem-1d-soln, lem-fixed-liminf#choose-K, example-ctble#assume-I, example-ctble#assume-II, example-ctble#assume-III, example-ctble#assume-IV
REASON: the global-extinction sentence (L958) and Assumptions I-IV (labels item-gf-trunc-infty, item-gf-growth-infty, item-gf-bded-infty, item-gf-perturb-infty; numbered display (3.4) at L970 is the inequality of Assumption II; unnumbered displays L974, L978-L979) are a local hypothesis package (spec §4): recorded whole in SOURCE_HYPOTHESES of the root and of the §3.2 lemmas and steps, used by name at L1028 and L1195, and each assumption is verified for Example 3.5 by the example-ctble#assume-I..IV nodes. The weights remark L982-L983 is expository (pointer to Example 3.5) and excluded
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: -
```

### C5 inv:L927:ctble-fn-iterate (new)
```
ITEM: inv:L927:ctble-fn-iterate
KIND: definition
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-fn-iterate@L927-L927
DISPOSITION: NODE thm-fixed-pt-infty#positivity
REASON: 'We also define f^{(n)} to be the composition of f with itself n times' for the countable-type f of L920-L926; its only consumer is the unwritten countable-type identity f^{(N)}_k(q)=𝔼_k[∏_j q_j^{X_j(N)}] behind the SOURCE_GAP of #positivity (L1178); every other iterate in §3 is g^{d,(n)} of a finite-type truncation
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: -
```

### C6 inv:L928:ctble-regularity-extension (new)
```
ITEM: inv:L928:ctble-regularity-extension
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#ctble-regularity-extension@L928-L928
DISPOSITION: EXCLUDED
REASON: extends positive regularity and non-singularity (Definition 1.3) to countable-type X; never consumed: Assumption I (L961), Lemma 3.4 (L1117) and the proof of Theorem 3.1 (L1178) use these notions only for the finite-type truncations X^d
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: -
```

### C7 inv:L1193:concrete-example (new)
```
ITEM: inv:L1193:concrete-example
KIND: claim
SOURCE: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#concrete-example@L1193-L1193
DISPOSITION: EXCLUDED
REASON: illustration of how a ℙ_1 satisfying (3.23) can be sampled (N from a law on ℕ_0 with mean <1 and exponential moments, then a uniform sequence with Σ j X_j(1) = N); the hypotheses of Example 3.5 are the display (3.23), not this recipe, and no root proof consumes it (spec §7: claims that feed no root)
COVERAGE_STATUS: PROPOSED
EXTRACTOR: extractor-D/sonnet
REVIEWER: -
```

---------------------------------------------------------------------------
## 5. Advisories and unresolved questions (non-blocking)

A-1 `def:stoch-dom`: the anchor's manifest range is paper.tex:1188-1190 (also quoted in `StochDominated.lean`), but the phrase "stochastically dominated" occurs at L1194 (L1188-L1190 are rows of display (3.23)). The graph locator follows the text. Author question: confirm the intended range; graph needs no change.
A-2 `example-ctble`: L1183 says Theorem 3.1 "implies the existence of a conjugate branching process", while the anchor (and the graph) conclude the fixed point q only; the bridge fixed point -> conjugate process (L934, excluded per spec section 7) is not modeled. Also the anchor concludes the existence of s and t with the `≤` form of Assumption III (manifest note in `review/batch-1B.md`), whereas the source recipe (L1195-L1198) is strict; the graph follows the paper's recipe.
A-3 `thm-fixed-pt-infty` NOTE says the global-extinction hypothesis "is not consumed by any step of the proof". True of every step the source writes; but the cited finite-type Lemma 2.3 (L1178 pointer) is stated under an extinction hypothesis. Suggest rewording to "no step the source writes down consumes it".
A-4 NOTE texts of `def:truncation`, `def:stoch-dom`, `lem-1d-soln` say "see Report", a non-durable reference; spell the content out.
A-5 L1127 prints "For each k≥d"; the nodes read d≥k (forced by the statement (3.16) and by the definition of λ^d). No author ruling exists for this typo; list it with E1-E8 for the author.
A-6 `#truncation-monotone` is the monotone coupling of X^k inside X^d; the source gives only "by the definition of X^d" and I did not supply the coupling. If the Lean orchestrator needs the coupling written, tag the node SOURCE_GAP then.
A-7 `lem-1d-soln` SOURCE_HYPOTHESES contains the remark "(which in particular holds for k=1)", a conclusion of #k1-nonsingular; harmless (it does not enlarge a premise), may be dropped on the next edit.
A-8 Edges from `example-ctble#assume-I` to `def:subcritical`, `def-bp-basic.positive-regular`, `def-bp-basic.non-singular`, `def:truncation` are obligation edges (the node proves membership), consistent with `#global-extinction -> def:extinction`; accepted.
A-9 `eqn-gf-truncated`: domain (q_1..q_d) in (0,inf]^d is inherited from the domain of f (L204, L920) and not written at (3.2); accepted.
A-10 `#choose-lambda-d` edge to `eqn-fixed-pt-equiv` is not cited at L998; kept because Theorem 1.4 is in f-form and (3.6) is in g-form (same carrier change as slice A `reduce-to-thm-2-7`). No countable-type analogue exists, which is why `#reduce-to-g` correctly has no such edge.
A-11 Expository sentences without inventory items: L911 (covered by the L908 item), L982-L983 (covered by C4), L989 ("We prove Theorem 3.1 by applying Theorem 1.4 and taking a limit"), L1002 (pre-compactness announcement), L1027-L1028 (subsequential-limit and "hardest part" roadmap), L1099 (motivation for Lemma 3.4). None carries an obligation (the claims restated are #diagonal-limit, Lemma 3.3 and Lemma 3.4); add one EXCLUDED roadmap item if the orchestrator wants literal completeness.
A-12 `inv:cite:L930:Bertacchi2014` also stands for Bertacchi2017 and Braunsteins2019; name all three keys in its REASON.
A-13 `example-ctble` lists both the verification nodes and `#apply-thm-3-1` (which lists the same verification nodes again): not a transitive shortcut, because the anchor's conclusion is the conjunction (global extinction, I-IV, q) and the root consumes each conjunct itself.
A-14 `#step2`: the source never writes "max_{k≤K} λ^d_k ≥ δ/2" (Step 2 ends at λ^d_1 ≥ δ/2, L1095, and L1068 gestures at the lemma); the closing inference is two lines and below the step threshold, so no SOURCE_GAP tag; the NOTE says so.
A-15 Witness policy for λ^d (arbitrary selection) verified: one selection, no property used beyond (3.6), Lemmas 3.2-3.4 conditional on it, every consumer discharges the premise through `#choose-lambda-d` (see PASS of that node). No node fixes the selection to a special choice.

---------------------------------------------------------------------------
## 6. Source spans re-read

- Corpus `source/arxiv-2411.06301v2/fixed-pt-finite-type.tex`: L908-L1203 in full (slice D; `\begin{comment}` L1204-L1213 read and ignored per spec); context L170-L260 (setting, Definitions 1.1 and 1.3, Theorem 1.4 L241-L250, remark L252, Example 1.5), L340-L356 (Proposition 1.6), L430-L730 (Lemmas 2.3, 2.4, 2.5, Definition 2.6 with (2.5) and (2.6), Theorem 2.7, Definition 2.8, Lemma 2.9, Proposition 2.10 and its proof, Lemmas 2.11-2.13), L894-L905 (proof of Theorem 2.7, for the Lemma 2.3 consumer).
- Repository records read: `graph/EXTRACTION_SPEC.md`; `DEPGRAPH.md` header and all 52 `extractor-D/sonnet` blocks, plus context blocks `eqn-generating-function`, `def:extinction`, `def:subcritical`, `def-bp-basic.positive-regular`, `def-bp-basic.non-singular`, `eqn-gen-func-n`, `thm-fixed-gf.fixed-point`, `prop-single-type.fixed-point`, `lem-fixed-pos`, `lem-fixed-pos#pos-reg-strict`, `lem-gf-pos`, `def-log-gf`, `eqn-convex-func-n`, `eqn-fixed-pt-equiv`, `lem-mono`, `prop-unstable`; `DEPGRAPH_COVERAGE.md` (all 43 `extractor-D/sonnet` records); `graph/inventory.json` (slice D), `graph/ADJUDICATION.md`, `graph/reviews/slice-A.review.md` and `slice-B.review.md` (read after the raw-source pass, for the field-hygiene standard only), `ERRATA.md`, `review/batch-1B.md` (grep for slice-D anchors), `frozen-anchor-manifest.json` (source ranges of the four slice-D anchors only).
- Lean (statement identity only, as permitted): `Conjugate/Frozen/Theorem_3_1.lean`, `Conjugate/Frozen/Example_3_5.lean`, `Conjugate/Frozen/Defs/Truncate.lean`, `Conjugate/Frozen/Defs/StochDominated.lean` (the files were printed whole, including the frozen placeholder bodies, but only the declared statements were used). No other Lean file was opened; no proof body, axiom, `sorry` or Lean status was consulted or interpreted.
- Read-only command run: `proof_depgraph.py --db DEPGRAPH.md --manifest DEPGRAPH_COVERAGE.md --source-root . --check` (reported only the stale dashboard; nothing written).
