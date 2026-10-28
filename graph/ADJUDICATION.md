# Orchestrator adjudication log (Phase 2)

## Slice B packet (extractor-B/sonnet), 2026-10-28
- B1 Anchor KIND `proposition` / `definition` for slice-B anchors: accepted (allowed frozen-anchor kinds; manifest kind is the Lean `theorem`).
- B2 Branching/Markov property: create one shared node `claim:branching-property` (source L176-177) at merge; repoint `lem-gf-pos#two-individuals`, `lem-gf-pos#kj-descendants`, `lem-mono#positivity-all-n` from `def:path-law` to it (pending slice A's packet).
- B3 Edges to definition nodes only where a proof unfolds the definition: accepted.
- B4 `lem-mono` constant scope (N after λ, η in the literal statement; proof's N depends only on X): keep the literal reading in the source fields, note the stronger uniform reading for Lean.
- B5 `prop-cond-on-ext.cond-law` -> `ext:an72-v3-thm2`: keep (the proof cites AN72 "for the properties of a").
- B6 `prop-conjugate` -> `lem-fixed-pos` only via the L437 remark: keep as SOURCE_GAP on `prop-conjugate#cond-law-hat`.

## Slice A packet (extractor-A/sonnet), 2026-10-28
- A1 Unreachable from A's roots alone: `def:population-sigma`, `def:step-kernel`, `def:path-law`, `eqn-gen-func-n`, `claim:mean-matrix-powers`, `def-bp-basic.positive-regular#matrix-equiv`. Resolve at merge: B consumes `def:path-law`, `eqn-gen-func-n`, `claim:mean-matrix-powers`; the new `claim:branching-property` (B2) consumes `def:path-law`; `def:path-law` consumes `def:step-kernel`, which consumes `def:population-sigma` (definition-on-definition use of the body). Exclude `#matrix-equiv` if still unreachable.
- A2 L238 converse direction: keep A's modeling (premises positive regular, non-singular, ℙ̂_k[E] > 0; edges follow L437); record the A = 1 subtlety in NOTE.
- A3 "subcritical + positive regular + non-singular ⇒ certain extinction" is used but never stated: add one shared SOURCE_GAP step `claim:subcritical-extinction` (consumers: thm-fixed-gf.conjugate / equivalence and §2 nodes that use "extinction probability one"), at merge.
- A4 Dedupe `ext:*` blocks across packets at merge (keep one block per ID, union of nothing — externals are leaves).
- A5 Split `inv:L265:counterexample-claims`: keep as one item mapped to the Example 1.5 nodes, with REASON naming the excluded robustness / d = 3 / "arbitrarily large" sub-claims.

## Slice C packet (extractor-C/sonnet), 2026-10-28
- C1 Extinction premise: replace B's `lem-unstable-scaled#extinction-as` and A's A3 gap with one shared node `claim:subcritical-extinction` ("subcritical ⇒ ℙ_k-extinction probability one", used at L628 and in the Lemma 2.3 application at L905; SOURCE_GAP at L628, which says "(Hypothesis I)" without argument). Repoint consumers at merge.
- C2 L731 mention of Prop 2.10 is motivation only: no edge (accepted); `prop-unstable` is reached via `lem-unstable-ssl` / `lem-monotone-lim`.
- C3 Definition anchors carry no Hyp. I–III in SOURCE_HYPOTHESES: accepted (the frozen definitions are unconditional).
- C4 `g^{-1}(S)` read as preimage within [0,∞]^d: accepted (matches (2.9) carrier).
- C5 Drop the uncited `eqn-convex-func-n` edge from `eqn-infty-subset#blowup`: accepted.
