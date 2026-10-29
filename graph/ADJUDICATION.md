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

## Slice A review (reviewer-A/sonnet) — applied 2026-10-28
- All 19 node fragments (F1-F19) and 5 coverage fragments (C1-C5) applied verbatim with tools/apply_review.py.
- F3/C2 supersede A1 for the L229 claim: it is consumed by the Perron-Frobenius step at L508, so `def-bp-basic.positive-regular#matrix-equiv` is reinstated as a SOURCE_GAP claim (slice B reviewer agreed the content is consumed).
- F10: `#conjugate-regularity` now exposes 0 < ℙ̂_k[E] < 1 as an unsupplied premise of Prop 2.1 for X̂ (SOURCE_GAP).
- Records authored or rewritten by the reviewer are not self-approvable: they stay PROPOSED until the global review.

## Slice B review (reviewer-B/sonnet) — applied 2026-10-28
- All 8 node NOTE/CONSTANT_SCOPE fragments and 3 coverage fragments applied verbatim (via .lake/slice-B.fixes.md conversion; the `inv:thm-fixed` REASON by hand).
- `lem-mono` CONSTANT_SCOPE: literal reading (N may depend on X, λ, η); the uniform reading is recorded for Lean only.

## Slice C review (reviewer-C/sonnet) — applied 2026-10-28
- All 25 node fragments (F1-F25) and 2 coverage fragments applied verbatim (the reviewer's `<SETTING>` shorthand expanded to its defined string; no placeholder survives).
- F25 adds the direct edge `thm-fixed -> thm-fixed#fixed-point-in-Lambda` (L902 "Thus g(λ) = λ").
- F24 widens the SOURCE_GAP on `thm-fixed#positivity` (translation q = e^λ, extinction premise via claim:subcritical-extinction, positive regularity, dichotomy).
- C2 adds `inv:L731:asymmetry-note` (EXCLUDED, motivational).

## Slice D review (reviewer-D/sonnet) — applied 2026-10-28
- All 23 node fragments and 7 coverage fragments (C1 replacement; C2-C7 new items) applied verbatim.
- A-4: "see Report" notes made durable (path to the packet's Report section).
- A-5: L1127 "For each k ≥ d" read as d ≥ k — new erratum E9, to be put to the author (no frozen statement depends on it).
- A-2: Ex 3.5's "implies the existence of a conjugate" (L1183) stops at the fixed point in the frozen anchor; the countable-type fixed point ⇒ conjugate bridge (L934) is the excluded unproved extension (spec §7) — report to the author.

## Review bookkeeping
- Records given PASS by a slice reviewer: TOPOLOGY_STATUS/COVERAGE_STATUS REVIEWED, REVIEWER = that reviewer.
- Records rewritten from a reviewer's own fragment, orchestrator-authored records (slice O, slice X) and reviewer-added items stay PROPOSED; listed in graph/GLOBAL_QUEUE.md for the fresh global reviewer.

## Global review (global-reviewer/sonnet) and queue review (queue-reviewer/sonnet) — applied 2026-10-28
- Queue fragments Q1, Q9-Q12, Q17, Q32, Q45, Q66, Q78, Q87 applied verbatim. Q27 (re-add `eqn-infty-subset#blowup -> eqn-convex-func-n`) NOT applied: edges only for cited uses (C5; global reviewer Q2 agrees the policy is consistent).
- Global fragments G1-G9 applied verbatim. G1: `claim:subcritical-extinction` now concludes extinction from every initial population and depends on `claim:branching-property` (the per-type → any-state step is unwritten in the source; SOURCE_GAP note extended). Chosen over the alternative new node (global Q1) because the any-state form subsumes the per-type consumers.
- Global Q3: `thm-fixed-pt-infty` PROOF_SOURCE widened to L989-L1179 (graph not yet published; manifest untouched).
- Global Q5: keep the full premise set 0 < ℙ̂_k[E] < 1 on `#conjugate-regularity` (SOURCE_GAP).
- Global Q8: EDGE `thm-fixed-pt-infty#positivity -> lem-fixed-pos#pos-reg-strict` marked "analogy only:".
- Each rewritten record is re-verified by the other final reviewer (global ↔ queue), never by its author.
- Author questions carried to the report: E9 (L1127), Ex 3.5 stops at the fixed point (A-2), StochDominated locator (A-1/Q4), external hypotheses of AN72/JL08 (Q6), per-type reading of "global extinction probability one" in Thm 3.1 (Q10).
- Edge policy (stated once, 2026-10-28): an EDGE records either a use the source cites, or an uncited use that the consuming node's SOURCE_GAP note explicitly names as a reconstruction. Under this rule Q27 is applied (reverses C5), with the NOTE of `eqn-infty-subset#blowup` naming the reconstructed edge; queue follow-up P1 applied to `claim:subcritical-extinction`. Both re-verified by the global reviewer.

## Batch 2 extension (2026-10-28, after the closure; ERRATA R8, E10)

- **Slice E** adds the five frozen batch-2 roots, their proof steps, and the leaf
  `thm-fixed-gf.equivalence.ctble#conjugate-regularity`. The coverage items for L928 and L934 move
  from EXCLUDED to the new nodes, with the Phase 2 disposition kept verbatim in each REASON.
- **Graph review GR-E** (fresh Sonnet) passed 4 of the 10 original nodes and failed 6. All six
  replacement records were applied:
  - `#fixed-point-to-conjugate` now depends on the three unconditional steps of the countable
    Prop 2.2 instead of its root, whose regularity premises Thm 3.1 does not supply.
  - `cond-law ctble` loses its premise-only edges and gains `claim:branching-property`.
  - `#conjugate-to-fixed-point` gains explicit edges and a `#conjugate-regularity` leaf.
  - `thm-fixed-pt-infty.conjugate` and `example-ctble.conjugate` get full source fields.
  - The coverage items `inv:L934`, the two L934 citations, `inv:L957`, `inv:example-ctble`,
    `inv:L930`, `inv:L927` and `inv:thm-fixed-pt-infty` are re-worded.
- **Stale NOTEs** on `example-ctble`, `example-ctble#apply-thm-3-1` and `ext:jl08-thm1` were updated
  to reflect the new scope. These are NOTE-only changes; no DEPS change.
- **Second review.** The rewritten records stay PROPOSED until a second independent reviewer clears
  them.

