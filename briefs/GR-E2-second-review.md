# Graph review GR-E2 — second review of the records rewritten in GR-E

**Role.** You are a fresh, independent topology reviewer, distinct from the GR-E reviewer, who
authored these rewritten records. Follow `~/.claude/skills/build-proof-dependency-graph/SKILL.md`.
- Read-only. Put verdicts and any replacements in your report.
- Do not read `Conjugate/Internal/*`.

**Context.**
- `graph/ADJUDICATION.md`, last section ("Batch 2 extension");
- `briefs/GR-E-slice-E-review.md`;
- `ERRATA.md` R8 and E10;
- `review/batch-2.md`;
- source paper.tex L928-934, L957-987, L1182-1201, plus the finite-type models (L238, L390-432).

**Targets.** These are the records still `PROPOSED`. Run
`python3 -I tools/proof_depgraph.py --db DEPGRAPH.md --manifest DEPGRAPH_COVERAGE.md --source-root . --require-reviewed --require-complete-coverage --require-all-reachable --check`
to list them. The working copies are in `graph/packets/slice-E.md` (7 nodes) and
`graph/packets/slice-D.md` (8 coverage items). For each record give PASS or FAIL. Check:
- source fields;
- DEPS and EDGEs: complete, correctly directed, and source-cited or named in a SOURCE_GAP;
- no hidden conditional premises, especially regularity premises that a consumer cannot supply;
- the accuracy of each SOURCE_GAP note;
- that each coverage disposition is correct and complete.

**Report.** For each record: PASS, or FAIL with a full replacement record. Also report the linter
output.
