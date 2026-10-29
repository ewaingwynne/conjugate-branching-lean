# Audit AU-6 — Phase 4 full-closure audit

**Role.** You are a fresh, independent auditor performing the **closure audit** of the whole
campaign. Work refute-first.
- Read-only. Scratch files go under `.lake/probes/au6/`; delete them afterwards.
- No commits.
- Use the `lean-orchestrator` skill's evidence rules (`~/.claude/skills/lean-orchestrator/SKILL.md`)
  and `~/.claude/skills/lean-statement-audit/SKILL.md`.

**Context.** Read:
- `CLAUDE.md` and `PLAN.md` (§6, route deviations);
- `ERRATA.md` (all rulings E1–E9, R1–R7);
- `STATUS.md`;
- `RESULTS.md` (the paper result → Lean map);
- the audits `review/audits/AU-1.md` … `AU-5.md`.

Source: `source/arxiv-2411.06301v2/fixed-pt-finite-type.tex`. Compiled numbering:
`source/2411.06301v2.pdf`.

```bash
export PATH="$HOME/.elan/bin:$HOME/.local/bin:$PATH"
```

## Checks (give a verdict with evidence for each)

1. **Whole-project build and gate.**
   - Run `tools/check.sh` (full: `lake build` of every module, the module checker, the anchor
     checker, `verify-abi`, the forbidden-construct grep).
   - Report every warning. Classify each as accepted (unused source hypotheses) or not.
2. **Frozen surface integrity.**
   - All 28 manifest entries are SEALED.
   - For every theorem anchor, `git diff 0a46d78 HEAD` of its frozen file shows only the
     proof-body line.
   - The definition files are byte-identical to their freeze commits (`5e9f6ab`, `0a46d78`).
   - `verify-abi` is OK.
3. **Axioms.** Run `python3 -I tools/leanprobe.py axioms` on all 13 frozen theorem exports, and on a
   sample of 10 internal lemmas. Only `propext`, `Classical.choice` and `Quot.sound` are allowed.
4. **No placeholders.** Grep all of `Conjugate/` for `sorry`, `admit`, `axiom` declarations,
   `opaque`, `native_decide`, `implemented_by`, `@[extern]`, `unsafe`, `set_option` overrides,
   `Lean.ofReduceBool` and `trustCompiler`. Every Lean file is a `module` and at most 1500 lines.
5. **Lemma 2.19 node audit** (not covered by AU-5).
   - Target: `Conjugate.exists_deformationRetract` in `Conjugate/Internal/Section2/Retract.lean`,
     brief `briefs/W-A13-lemma-2-19.md`.
   - Check the brief match.
   - Check fidelity to paper.tex:851-891: a strong deformation retraction of
     `A = {u ≥ 0 : r ≤ ‖u‖ ≤ R}` onto `Λ`, with the sup norm per R1.
   - Check content and axioms. Confirm that `H` is jointly continuous on `[0,1] × A`, maps into
     `A`, and fixes `Λ` pointwise.
6. **`RESULTS.md` correctness.** For each row, confirm that the named declaration exists in the
   named file. For at least 8 rows of your choice, including Lemmas 2.13, 2.16, 2.18 and 3.4,
   confirm that the Lean statement is a faithful formalization of that numbered result.
7. **Coverage.** Every theorem-like unit of the paper (§1–§3) is either mapped in `RESULTS.md` or
   listed there as not formalized with a reason. Use `DEPGRAPH_COVERAGE.md` and the PDF. Flag any
   omission.
8. **Route deviations.** Each deviation in `RESULTS.md` is approved in `PLAN.md` §6, or confirmed
   in an earlier audit, and none changes a statement.
9. **Docstring numbering.** The §2 lemma and display numbers in Lean docstrings match the compiled
   numbering (AU-2 note 1; a renumbering sweep was applied). List any remaining mismatch.
10. **Rulings.** Every ruling cited in Lean docstrings or `RESULTS.md` (E1–E9, R1–R7) exists in
    `ERRATA.md`, with the stated content.

## Report format

```text
CHECK 1..10: PASS | FAIL | NOTE — evidence
Blocking findings: <list, or none>
Non-blocking notes: <list>
Closure verdict: CLOSED | NOT CLOSED
Commands run: <exact commands with output excerpts>
```
