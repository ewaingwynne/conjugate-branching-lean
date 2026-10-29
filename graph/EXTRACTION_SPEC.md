# Dependency-graph extraction specification (frozen before extraction)

Writer (single merger and adjudicator): `orchestrator/opus-5.5/session-f41ccbab`.
Workflow: `~/.claude/skills/build-proof-dependency-graph/SKILL.md` and its
`references/agent-packets.md`. This file is the extraction spec required by its Phase 1.

## 1. Roots (author-frozen theorem anchors)

`thm-fixed-gf.fixed-point`, `thm-fixed-gf.conjugate`, `thm-fixed-gf.equivalence`, `prop-single-type.fixed-point`, `prop-single-type.conjugate`, `prop-cond-on-ext.cond-law`, `prop-conjugate`, `thm-fixed`, `thm-fixed-pt-infty`, `counterexample`, `example-ctble`, `rem:hyp-iii-necessary`, `rem:hyp-iii-automatic`

Every graph root is one of these. Every other graph node must feed at least one root.

## 2. Corpus

`source/arxiv-2411.06301v2/fixed-pt-finite-type.tex` (arXiv:2411.06301v2, sha256 `b0fb466bfd59b1fd0e03757eddca48f8e67aa194a43b66880d2caeb677061670`).
Locators: `source/arxiv-2411.06301v2/fixed-pt-finite-type.tex#<stable-anchor>@Lx-Ly` (anchor = LaTeX label or semantic slug; line numbers are
revisable locators only, never part of a node ID). External results: `external:<bib-key>#<result>`
(bib keys as in the `\cite` commands; for unnamed standard results use `external:standard#<name>`).
Text inside `\begin{comment}…\end{comment}` (L277-339, L407-415, L562-582, L696-715, L744-760,
L1204-1213) is not part of the paper.

## 3. Conventions and author rulings to track (see `ERRATA.md`)

- Paper type `k ∈ {1,…,d}` (or `k ∈ ℕ`) is Lean index `k-1`; this is a Lean convention only —
  source-statement fields use the paper's indexing.
- A branching process is its family of offspring laws; `ℙ_k` starts from one type-`k` individual.
- `f` is defined on `[0,∞]^d`, `g` on `[-∞,∞]^d` (same formulas); `ρ` = spectral radius; `M_kj < ∞`
  is part of "subcritical" (R1); `|·|` in (2.9) is any norm (sup norm in Lean, R1); `N ≥ 1` in Def 1.3.
- Def 2.8 componentwise order: `λ ≤ η` coordinatewise; `λ < η` means `≤` and one strict coordinate.
- Errata (decided): E1 Hyp. III is for `k ∈ {1,…,d}`; E2 (1.2) product over `j ≤ d`;
  **E3 Lemma 2.16 is read as "`g^{(N)}(λ) > λ` and `g^{(n)}(λ) → ∞`", with `max_j` in the
  proof's display** (the stated `g(λ) > λ` can fail); E4 (3.13) has `0,0,…` not `1,1,…`;
  E5 §2.3 "Definition 2.8" means Definition 1.3; E6 `ℕ_0` in §3.2 means `ℕ`;
  E7 Prop 1.6's `q > 1` means `q ∈ (1,∞)`; E8 Ex 3.5 applies all of (3.23) to each `ℙ_k`.
- Splits: R3 Thm 1.4 → `thm-fixed-gf.fixed-point`, `.conjugate`, `.equivalence` (the last is the
  claim at L238); R5 Prop 1.6 → `.fixed-point`, `.conjugate`; R6 Prop 2.1 → only the conditional-law
  paragraph is anchored (`prop-cond-on-ext.cond-law`); part (a) ("only fixed points in `[0,1]^d` are
  `a` and `1`") and "Moreover, … subcritical" are cited results, modeled as external inputs if used.

## 4. Standing assumptions

`STANDING_ASSUMPTIONS: -`. "Throughout the rest of this section, we assume … the setting of
Theorem 1.4" (L528) and the §3.2 assumptions I–IV (L957-984) are **local hypothesis packages**:
record them in each consuming lemma's `SOURCE_HYPOTHESES`, and at each application record which
node supplies them. Do not create `assumption` nodes.

## 5. External-input policy

Cited literature results and named standard theorems that a proof explicitly invokes are
`KIND: external` leaves (`LEAN_STATUS: EXTERNAL`). Use these canonical IDs (add new ones only with
prefix `ext:` and report them):

| ID | Statement source |
|---|---|
| `ext:an72-v3-thm2` | `external:an-branching-processes#thm-V.3.2` (fixed points of `f` in the unit cube; Prop 2.1 first paragraph) |
| `ext:jl08-thm1` | `external:jl-cond-on-ext#thm-1` (law of a branching process conditioned on extinction) |
| `ext:brouwer` | `external:standard#brouwer-fixed-point` |
| `ext:perron-frobenius` | `external:standard#perron-frobenius` |
| `ext:fatou` | `external:standard#fatou-lemma` |
| `ext:holder` | `external:standard#holder-inequality` |
| `ext:vitali` | `external:standard#vitali-convergence` |
| `ext:dct` | `external:standard#dominated-convergence` |
| `ext:taylor` | `external:standard#first-order-taylor` |
| `ext:compact-hausdorff` | `external:standard#continuous-bijection-compact-hausdorff` |
| `ext:connectedness` | `external:standard#connected-not-union-of-disjoint-open` |
| `ext:diagonal-subsequence` | `external:standard#diagonal-subsequence` |

Routine algebra, monotonicity of `x ↦ x^n`, and textbook facts used without name below the step
threshold are not nodes.

## 6. Step threshold

Create a `step` / `application` node when omitting it would hide a plausible independent Lean
lemma or an independently failing obligation: a nontrivial estimate, construction, case split,
witness or parameter choice, application of a theorem whose premises must be discharged,
quantifier closure, carrier change (e.g. `f` ↔ `g`, `q` ↔ `λ = log q`), or a reused claim. Also
create nodes for unlabeled claims that a proof uses (e.g. L220 `(M^n)_kj = 𝔼_k[X_j(n)]`, (1.2),
(2.6), (2.10), (3.2)). An asserted-but-unproved bridge is a `step` with `NOTE: SOURCE_GAP: …`.
Alternatives in the source are separate `KIND: route` nodes.

## 7. Exclusions (orchestrator decides; extractors may propose more with reasons)

- §1.3 proof outline (L359-379) and the Remark at L193-196: expository, no proof obligation.
- §4 (L1216-1345) and the bibliography: applications/discussion, no formal claims.
- Claims that feed no root (R2 anchors only roots): e.g. L560 convexity of `g_k`; L252 "Hypothesis I is
  necessary"; Example 1.5's robustness / `d = 3` / "arbitrarily large" claims; §3.1's cited
  global/partial/local extinction facts (L930-936); the countable-type extension of Prop 2.2 (L934).
  Mark them `EXCLUDED` with that reason, unless a root's proof actually consumes them.

## 8. Frozen anchors (copy these fields exactly; never infer or edit)

Manifest: `frozen-anchor-manifest.json | sha256:a735f3ce9e29a57154affcc72f18e05490295a40306a231e960ef604bfca2844`.

| NODE | kind | FROZEN_ANCHOR_ID | FROZEN_FILE | FROZEN_DECL | CONTRACT_ID / VERSION | FROZEN_ABI_SHA256 | manifest source range |
|---|---|---|---|---|---|---|---|
| `def:population-sigma` | definition | `def.populationMeasurableSpace.v1` | `Conjugate/Frozen/Defs/PopulationMeasurableSpace.lean` | `Conjugate.populationMeasurableSpace` | `paper.def.populationMeasurableSpace` / `1` | `98d6e8f17a8fbbf47f2376e7f4b24e45caeebc5a06a5eae8bbb2a81a7deb1613` | paper.tex:176,402,427,915-918 |
| `def:step-kernel` | definition | `def.stepKernel.v1` | `Conjugate/Frozen/Defs/StepKernel.lean` | `Conjugate.stepKernel` | `paper.def.stepKernel` / `1` | `adde03310e606b6255e52a5077af0424ba2bc245679ea0e947f3f0c43b928a7a` | paper.tex:176-177 |
| `def:path-law` | definition | `def.pathLaw.v1` | `Conjugate/Frozen/Defs/PathLaw.lean` | `Conjugate.pathLaw` | `paper.def.pathLaw` / `1` | `2372048aaa8bc54fbfa32e7bd267288703d52bd79a97acbf3e07309474f3d1a1` | paper.tex:176-177 |
| `def:extinction` | definition | `def.extinctionEvent.v1` | `Conjugate/Frozen/Defs/ExtinctionEvent.lean` | `Conjugate.extinctionEvent` | `paper.def.extinctionEvent` / `1` | `029afe3845b4a340f7f51ca5ad0c46ac5c86167dee9a1668f6910cc3bcdfcace` | paper.tex:179,930 |
| `def-conjugate` | definition | `def.IsConjugate.v1` | `Conjugate/Frozen/Defs/IsConjugate.lean` | `Conjugate.IsConjugate` | `paper.def.IsConjugate` / `1` | `f6bcafcfaf8bd0ae3f9ee76d0e290d7c7ae70a0c175ef00027da56e0a789c22d` | paper.tex:184-187,934 |
| `eqn-generating-function` | definition | `def.genFun.v1` | `Conjugate/Frozen/Defs/GenFun.lean` | `Conjugate.genFun` | `paper.def.genFun` / `1` | `5d96211315214940f56bc4128ab12c73b79fa91d079d185c1f50b4be8f3b0d1c` | paper.tex:203-208,919-925 |
| `eqn-mean-matrix` | definition | `def.meanMatrix.v1` | `Conjugate/Frozen/Defs/MeanMatrix.lean` | `Conjugate.meanMatrix` | `paper.def.meanMatrix` / `1` | `dff61f8e61cbe15e3579255adc6f1d37b5baa6abcd5ae5f6899ace77e6f66cbb` | paper.tex:215-218 |
| `def:subcritical` | definition | `def.IsSubcritical.v1` | `Conjugate/Frozen/Defs/IsSubcritical.lean` | `Conjugate.IsSubcritical` | `paper.def.IsSubcritical` / `1` | `e70d8da7c37614b34bd483024a839f1be91c19ee7b6bd021bdd6c99df38a5e4a` | paper.tex:219-220 |
| `def-bp-basic.positive-regular` | definition | `def.IsPositiveRegular.v1` | `Conjugate/Frozen/Defs/IsPositiveRegular.lean` | `Conjugate.IsPositiveRegular` | `paper.def.IsPositiveRegular` / `1` | `e05d2b9a55ef42cf5628e1a4460361152c5d0f0c198614c69ef3e769a4291435` | paper.tex:225-229 |
| `def-bp-basic.non-singular` | definition | `def.IsNonsingular.v1` | `Conjugate/Frozen/Defs/IsNonsingular.lean` | `Conjugate.IsNonsingular` | `paper.def.IsNonsingular` / `1` | `246bd29740c5ec0b8a051ef2c5dd283b578c5d27bcb90febab7318df7452d5d9` | paper.tex:230-233 |
| `def-log-gf` | definition | `def.logGenFun.v1` | `Conjugate/Frozen/Defs/LogGenFun.lean` | `Conjugate.logGenFun` | `paper.def.logGenFun` / `1` | `6323bd49d4d920a8615979bad829c80575e5cb2287b49079f468a1078067da2a` | paper.tex:533-546,991-995 |
| `eqn-basin-def.zero` | definition | `def.basinZero.v1` | `Conjugate/Frozen/Defs/BasinZero.lean` | `Conjugate.basinZero` | `paper.def.basinZero` / `1` | `f2c0dd7ccb2b062e31b279ed5f2ef546f4ff7baed6bab7b69c5125a00dfbb702` | paper.tex:726-729 |
| `eqn-basin-def.infty` | definition | `def.basinInfty.v1` | `Conjugate/Frozen/Defs/BasinInfty.lean` | `Conjugate.basinInfty` | `paper.def.basinInfty` / `1` | `5b77ae3e04c31f9db7d9bdc3f5c0959e35d4398ebc99896298879a88133e8a0c` | paper.tex:726-729 |
| `def:truncation` | definition | `def.truncate.v1` | `Conjugate/Frozen/Defs/Truncate.lean` | `Conjugate.truncate` | `paper.def.truncate` / `1` | `8c0eb7b86da143d341441e880b49fe6eb178b6132f157ba5ed5f491598122531` | paper.tex:937-948 |
| `def:stoch-dom` | definition | `def.StochDominated.v1` | `Conjugate/Frozen/Defs/StochDominated.lean` | `Conjugate.StochDominated` | `paper.def.StochDominated` / `1` | `44d5e5c00d3f94614e3c4473d3b4ab45776539b0144ee18d9b356f065dc58567` | paper.tex:1188-1190 |
| `thm-fixed-gf.fixed-point` | theorem | `thm.theorem_1_4_fixedPoint.v1` | `Conjugate/Frozen/Theorem_1_4_FixedPoint.lean` | `Conjugate.theorem_1_4_fixedPoint` | `paper.thm1_4.fixedPoint` / `1` | `60a9a3c78807be049624125acbefc987e9480282f5407f9e72fbf8b1be682e79` | paper.tex:241-250 |
| `thm-fixed-gf.conjugate` | theorem | `thm.theorem_1_4_conjugate.v1` | `Conjugate/Frozen/Theorem_1_4_Conjugate.lean` | `Conjugate.theorem_1_4_conjugate` | `paper.thm1_4.conjugate` / `1` | `ae0441875035cde86a0846001f3021e499f947d76f759864ce855d4b578c761f` | paper.tex:241-250 |
| `thm-fixed-gf.equivalence` | theorem | `thm.exists_conjugate_iff_exists_fixedPoint.v1` | `Conjugate/Frozen/ExistsConjugateIff.lean` | `Conjugate.exists_conjugate_iff_exists_fixedPoint` | `paper.thm1_4.equivalence` / `1` | `8b5e83dea9a90b228d39d3b5cd00e167176f545879b0d61eaa1a780b1b761ae3` | paper.tex:238 |
| `prop-single-type.fixed-point` | theorem | `thm.proposition_1_6_fixedPoint.v1` | `Conjugate/Frozen/Proposition_1_6_FixedPoint.lean` | `Conjugate.proposition_1_6_fixedPoint` | `paper.prop1_6.fixedPoint` / `1` | `ed854fd7bac3e9807f038336520fdb6c369ad7ea86bc3b07fefa04eb0836a736` | paper.tex:343-356 |
| `prop-single-type.conjugate` | theorem | `thm.proposition_1_6_conjugate.v1` | `Conjugate/Frozen/Proposition_1_6_Conjugate.lean` | `Conjugate.proposition_1_6_conjugate` | `paper.prop1_6.conjugate` / `1` | `eb22dc06b010505b63a7a7772da6a03209fe64a2c23b3d1e8654107c9313ea16` | paper.tex:343-356 |
| `prop-cond-on-ext.cond-law` | theorem | `thm.proposition_2_1_condLaw.v1` | `Conjugate/Frozen/Proposition_2_1_CondLaw.lean` | `Conjugate.proposition_2_1_condLaw` | `paper.prop2_1.condLaw` / `1` | `c35be0988368897ab13b4adf2f5ddc76f65b47041e3a2c331794933fc10ab6de` | paper.tex:390-403 |
| `prop-conjugate` | theorem | `thm.proposition_2_2.v1` | `Conjugate/Frozen/Proposition_2_2.lean` | `Conjugate.proposition_2_2` | `paper.prop2_2` / `1` | `927d2807e8bf34483ea1bcff664f03c4646ec4c310bcbfa0d6cc200dc7476939` | paper.tex:420-428 |
| `thm-fixed` | theorem | `thm.theorem_2_7.v1` | `Conjugate/Frozen/Theorem_2_7.lean` | `Conjugate.theorem_2_7` | `paper.thm2_7` / `1` | `0e7b189be47e05741d5424232b7bda2d63fd1958f0dce6b3d8873519c8bfe314` | paper.tex:555-557 |
| `thm-fixed-pt-infty` | theorem | `thm.theorem_3_1.v1` | `Conjugate/Frozen/Theorem_3_1.lean` | `Conjugate.theorem_3_1` | `paper.thm3_1` / `1` | `068d102eb9de927f8f4534494b8a560ad89f1fefedd48d8163838ea19d070819` | paper.tex:957-987 |
| `counterexample` | theorem | `thm.example_1_5.v1` | `Conjugate/Frozen/Example_1_5.lean` | `Conjugate.example_1_5` | `paper.ex1_5` / `1` | `b00c67e0781cfdc17a070d2527c868c04f159bf161b256fbf7e30c07ea5b3287` | paper.tex:255-276 |
| `example-ctble` | theorem | `thm.example_3_5.v1` | `Conjugate/Frozen/Example_3_5.lean` | `Conjugate.example_3_5` | `paper.ex3_5` / `1` | `625ddeabe869ec4d90a0ad4400b19dbf048cdbc9e6c26909e7b081695f1f85a9` | paper.tex:1182-1203 |
| `rem:hyp-iii-necessary` | theorem | `thm.remark_hypIII_necessary.v1` | `Conjugate/Frozen/Remark_HypIII_Necessary.lean` | `Conjugate.remark_hypIII_necessary` | `paper.rem1_4.hypIII_necessary` / `1` | `040e7973829d9af59daafcc3ff36fdf466f78258759694f79b4f8b781b024a11` | paper.tex:252 |
| `rem:hyp-iii-automatic` | theorem | `thm.remark_hypIII_automatic.v1` | `Conjugate/Frozen/Remark_HypIII_Automatic.lean` | `Conjugate.remark_hypIII_automatic` | `paper.rem1_4.hypIII_automatic` / `1` | `7345689e590028548ae2178c9699138a6af41eec25eb8cd7bf186444f8ed77ef` | paper.tex:252 |

Every frozen-anchor node uses these exact `FROZEN_FILE`, `FROZEN_DECL`, `FROZEN_ANCHOR_ID`,
`FROZEN_ABI_SHA256`, `CONTRACT_ID`, `CONTRACT_VERSION`. All other nodes use `-` for the four
`FROZEN_*` fields and their own `CONTRACT_ID` (`paper.<node-id>`) with `CONTRACT_VERSION: 1`.
Definitions: a node depends on a definition node only where its proof uses a property of that
definition beyond the statement (typically characterization nodes such as (1.2), (3.2), the
branching property); downstream nodes consume those characterizations.

## 9. Slices (node ownership is exclusive; read-only context may overlap)

| Slice | Lines | Owns |
|---|---|---|
| A | L170-L379 | §1: Def 1.1, (1.1)-(1.3), Def 1.3, Thm 1.4 (all three root parts), L252 remarks, Ex 1.5, Prop 1.6 |
| B | L380-L721 | §2.1-2.2: Props 2.1-2.2, Lemmas 2.3-2.5, Def 2.6, (2.5)-(2.6), Def 2.8, Lemma 2.9, Prop 2.10, Lemmas 2.11-2.13 |
| C | L722-L907 | §2.3: (2.9)-(2.10), Lemmas 2.14-2.19, and the node `thm-fixed` (Thm 2.7: statement L555-557, proof L894-905) |
| D | L908-L1215 | §3: setup, (3.1)-(3.2), assumptions I-IV, Thm 3.1, Lemmas 3.2-3.4, proof of Thm 3.1, Ex 3.5 |

Definition anchor nodes are owned by the slice that contains their source: A owns
`def:population-sigma`, `def:step-kernel`, `def:path-law`, `def:extinction`, `def-conjugate`,
`eqn-generating-function`, `eqn-mean-matrix`, `def:subcritical`, `def-bp-basic.positive-regular`,
`def-bp-basic.non-singular`; B owns `def-log-gf`; C owns `eqn-basin-def.zero`, `eqn-basin-def.infty`;
D owns `def:truncation`, `def:stoch-dom`. Proofs of roots in another slice (e.g. Thm 1.4's proof is
assembled from §2) — the owner of the root records its DEPS on the cross-slice node IDs listed below.

Canonical cross-slice IDs (use exactly): `prop-cond-on-ext.cond-law`, `prop-conjugate`,
`lem-fixed-pos`, `lem-gf-pos`, `lem-gf-bded`, `thm-fixed`, `lem-mono`, `prop-unstable`,
`lem-unstable-scaled`, `lem-unstable-ssl`, `lem-monotone-lim`, `lem-basin-closed`,
`lem-attractive-zero`, `lem-attractive-infty`, `lem-basin-open`, `lem-ray-intersect`, `lem-retract`,
`thm-fixed-pt-infty`, `lem-fixed-limsup`, `lem-fixed-liminf`, `lem-1d-soln`, `prop-single-type.fixed-point`,
`eqn-gen-func-n` (the (1.2) claim), `claim:mean-matrix-powers` (L220), `eqn-fixed-pt-equiv` ((2.6)),
`eqn-infty-subset` ((2.10)), `eqn-gf-truncated` ((3.2)).

## 10. Field rules (from the template)

Every node block uses exactly the schema in `~/.claude/skills/build-proof-dependency-graph/assets/DEPGRAPH.template.md`.
Initial Lean fields: `LEAN_STATUS: NOT_STARTED` (`EXTERNAL` for external nodes), `LEAN_REF: -`,
`LEAN_NOTE: -`. `TOPOLOGY_STATUS: PROPOSED`, `REVIEWER: -`. One `EDGE:` line per DEPS/ROUTES entry,
citing where the **consumer's** proof uses it. `DEPS` direction is `NODE -> prerequisite`.

## Addendum (2026-10-28): batch 2

The author's ruling R8 adds five frozen roots for the countable-type passage:
- `prop-cond-on-ext.ctble.cond-law`;
- `prop-conjugate.ctble`;
- `thm-fixed-gf.equivalence.ctble`;
- `thm-fixed-pt-infty.conjugate`;
- `example-ctble.conjugate`.

The passage is paper.tex:934, with L958-959 and L1183. The §7 exclusion of "the countable-type
extension of Prop 2.2 (L934)" is withdrawn for these statements. The remark on partial
extinction (the last sentence of L934) stays excluded (R8(e)). The anchors are listed in
`frozen-anchor-manifest.json` and in the graph header. §1 and §8 above predate batch 2.

