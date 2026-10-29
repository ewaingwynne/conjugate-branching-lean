# Proof dependency database — arXiv:2411.06301v2 (conjugate branching processes)

GRAPH_VERSION: 4
ROOTS: thm-fixed-gf.fixed-point, thm-fixed-gf.conjugate, thm-fixed-gf.equivalence, prop-single-type.fixed-point, prop-single-type.conjugate, prop-cond-on-ext.cond-law, prop-conjugate, thm-fixed, thm-fixed-pt-infty, counterexample, example-ctble, rem:hyp-iii-necessary, rem:hyp-iii-automatic, prop-cond-on-ext.ctble.cond-law, prop-conjugate.ctble, thm-fixed-gf.equivalence.ctble, thm-fixed-pt-infty.conjugate, example-ctble.conjugate
CORPUS: source/arxiv-2411.06301v2/fixed-pt-finite-type.tex sha256:b0fb466bfd59b1fd0e03757eddca48f8e67aa194a43b66880d2caeb677061670
CONVENTIONS: see graph/EXTRACTION_SPEC.md §3 (paper indexing in source fields; f on [0,∞]^d, g on [-∞,∞]^d; M finite inside subcritical; Def 2.8 order; rulings E1-E10, R1-R8)
STANDING_ASSUMPTIONS: -
EXTERNAL_POLICY: cited literature results and named standard theorems explicitly invoked by a proof are KIND external leaves (graph/EXTRACTION_SPEC.md §5); routine facts below the step threshold are not nodes
FROZEN_ANCHORS: def:population-sigma, def:step-kernel, def:path-law, def:extinction, def-conjugate, eqn-generating-function, eqn-mean-matrix, def:subcritical, def-bp-basic.positive-regular, def-bp-basic.non-singular, def-log-gf, eqn-basin-def.zero, eqn-basin-def.infty, def:truncation, def:stoch-dom, thm-fixed-gf.fixed-point, thm-fixed-gf.conjugate, thm-fixed-gf.equivalence, prop-single-type.fixed-point, prop-single-type.conjugate, prop-cond-on-ext.cond-law, prop-conjugate, thm-fixed, thm-fixed-pt-infty, counterexample, example-ctble, rem:hyp-iii-necessary, rem:hyp-iii-automatic, prop-cond-on-ext.ctble.cond-law, prop-conjugate.ctble, thm-fixed-gf.equivalence.ctble, thm-fixed-pt-infty.conjugate, example-ctble.conjugate
FROZEN_MANIFEST: frozen-anchor-manifest.json | sha256:b21e465db5a8dfa5c63f3b4a430bc25116b8d4b6361e8fc69048312da8b85adc
WRITER: orchestrator/opus-5.5/session-f41ccbab
GLOBAL_REVIEWER: global-reviewer/sonnet
GLOBAL_REVIEW_REF: graph/reviews/global.review.md (root verdicts §1, follow-up §5)

The dependency direction is `NODE -> prerequisite`. `DEPS` is conjunctive. `ROUTES` lists
alternative `KIND: route` nodes; one route is sufficient. Lean fields are initialized planning
metadata and are not evaluated here. Node schema: see
`~/.claude/skills/build-proof-dependency-graph/assets/DEPGRAPH.template.md`.

## Nodes

