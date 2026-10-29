# Graph review GR-E — slice E (batch-2 countable-type roots) and the L928/L934 coverage re-scoping

**Role.** You are a fresh, independent topology reviewer, following the
`build-proof-dependency-graph` skill (`~/.claude/skills/build-proof-dependency-graph/SKILL.md`; read
it first). Work refute-first.
- Read-only: do not edit `graph/`, `DEPGRAPH*.md` or any other project file.
- Write your verdicts and any replacement records into your report. The orchestrator applies them.

**Context.**
- **What changed.** The author froze five new root anchors (`review/batch-2.md`; ERRATA R8 and
  E10). They are the countable-type versions of (2.1) and Prop 2.2, the countable-type equivalence
  "conjugate ⟺ fixed point in `(1,∞)^ℕ`", and the conjugate forms of Thm 3.1 and Ex 3.5.
- **Source.** `source/arxiv-2411.06301v2/fixed-pt-finite-type.tex`, especially L928-934, L957-987 and
  L1182-1201, plus the finite-type models (Prop 2.1 at L390-403, Prop 2.2 at L420-432, L238).
- **Graph conventions.** `graph/EXTRACTION_SPEC.md` and `graph/ADJUDICATION.md`. The edge policy:
  an EDGE records a use the source cites, or an uncited use that the consuming node's SOURCE_GAP
  note names explicitly.
- **Frozen files.** You may read the five frozen batch-2 files in `Conjugate/Frozen/` and
  `frozen-anchor-manifest.json`, to identify the anchors. Do not read implementation modules.

**Review targets.**
1. **The 10 new nodes in `graph/packets/slice-E.md`.** Each is `TOPOLOGY_STATUS: PROPOSED`. For
   each node give PASS or FAIL. Check:
   - source locators and line ranges;
   - the source fields (hypotheses, quantifiers, conclusion) against the paper and R8;
   - frozen-anchor fields against the manifest (path, export, anchor ID, ABI hash, contract ID and
     version);
   - DEPS and EDGEs: are they complete, correctly directed, and justified by the source or by a
     named SOURCE_GAP;
   - any missing external input (for example, is `ext:an72-v3-thm2` wrongly omitted or wrongly
     needed?);
   - any hidden conditional premise;
   - whether each SOURCE_GAP note is accurate. In particular, the claim that the finite proof's
     use of [AN72] / Prop 2.1(a) fails for countable types (L930: a continuum of fixed points),
     and the claim that Assumptions I-IV of Thm 3.1 do not include positive regularity of `X`.
2. **The four re-scoped coverage items in `graph/packets/slice-D.md`.** These are
   `inv:L934:ctble-conjugate-extension`, `inv:cite:L934:jl-cond-on-ext.2`,
   `inv:cite:L934:jl-cond-on-ext.3` and `inv:L928:ctble-regularity-extension`, all
   `COVERAGE_STATUS: PROPOSED`. Check two further things:
   - the two dispositions extended with the new roots (`inv:L957:assumptions-I-IV` and
     `inv:example-ctble`);
   - whether any other unit of L928-934, L958-959 or L1183 should now be re-scoped. For example,
     should `inv:L930:ctble-extinction-facts` stay EXCLUDED?
3. **The whole graph.** Run
   `python3 -I tools/proof_depgraph.py --db DEPGRAPH.md --manifest DEPGRAPH_COVERAGE.md --source-root . --require-complete-coverage --require-all-reachable --check`
   and report the output. It should pass except for the review queue.

**Report format.**
```text
NODE <id>: PASS | FAIL — reason; if FAIL, a full replacement NODE record in a fenced block
ITEM <id>: PASS | FAIL — reason; if FAIL, a full replacement ITEM record
Other re-scoping recommendations: …
Linter output: …
```
