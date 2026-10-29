# Audit AU-5 — §3 (W-A10, W-A11), Example 3.5 (W-A12), Lemma 2.19 (W-A13): seal and node audits

**Role.** You are a fresh, independent auditor. Work **refute-first**.
- Compilation is not a fidelity verdict.
- Read-only: edit nothing under `Conjugate/`, nor any of `frozen-anchor-manifest.json`,
  `DEPGRAPH*.md`, `STATUS.md`, `ERRATA.md`, `PLAN.md`, `briefs/`, `tools/` or the lake
  configuration.
- Scratch Lean files go under `.lake/probes/au5/`. Compile them with the lakefile options
  (`-DautoImplicit=false -DrelaxedAutoImplicit=false`, or a module target). Delete them afterwards.
- No commits.

Workflow skill: `~/.claude/skills/lean-statement-audit/SKILL.md`. Read it first.

**Context.** Read:
- `CLAUDE.md`;
- `PLAN.md` §6;
- `ERRATA.md`: E4 (tail coordinates `0` in (3.13)), E6, E8 (Ex 3.5 reading), E9 (`d ≥ k` at
  paper.tex:1127), and R7 (Thm 3.1 global extinction per starting type);
- the earlier audits in `review/audits/`.

Source: `source/arxiv-2411.06301v2/fixed-pt-finite-type.tex`. Use the compiled numbering from the
PDF (`source/2411.06301v2.pdf`): §3 displays are (3.1) to (3.23), Lemmas 3.2 to 3.4, Example 3.5.
§2 numbering is in `review/audits/AU-2.md` note 1.

**Indexing.** Lean indexes types from `0`: paper type `k` is Lean type `k - 1`.

```bash
export PATH="$HOME/.elan/bin:$HOME/.local/bin:$PATH"
```

## Part A — seal audits (as in `review/audits/AU-1.md` Part A, checks 1-6 each)

- **`Conjugate.theorem_3_1`** (paper.tex:957-987), provider `Conjugate/Internal/Theorem_3_1.lean`.
  - `hext` and `hφ_lim` are unused in the proof. Confirm that this is mathematically right, not a
    sign of a weakened statement: Lemma 3.3 uses only `log ψ/φ → 0`, and R7 says no step uses
    `hext`.
  - Check the encoding of hypotheses II–IV: `rpow` with real `φ k`, `ENNReal.ofReal`, and the real
    `s^{∑ φ_j c_j}`.
- **`Conjugate.example_3_5`** (paper.tex:1182-1201), provider `Conjugate/Internal/Example_3_5.lean`,
  **if it is SEALED in the manifest when you start**. Otherwise skip it and say so.
  - Check the E8 reading, and `hdom` as Lean's form of "dominated by the sum of `k` i.i.d. copies
    of `ℙ_1`", with the index shift.
  - Check `φ k = k + 1` and `ψ ≡ 1` in the conclusion.

## Part B — node audit

The files are:
- `Conjugate/Internal/Section3/*.lean`;
- `Conjugate/Internal/Examples/Example35*.lean`;
- `Conjugate/Internal/Section2/Retract.lean`, **if present**.

The briefs are `briefs/W-A10-truncation-lemmas.md`, `briefs/W-A11-theorem-3-1.md`,
`briefs/W-A12-example-3-5.md` and `briefs/W-A13-lemma-2-19.md`.

For each public theorem named in those briefs:
1. The brief match is exact, or a harmless generalization.
2. It is faithful to the `DEPGRAPH.md` node, the paper and the rulings. In particular:
   - (3.2) and its log form with E4;
   - Lemma 3.2: the bound is uniform in `d` and in the fixed point;
   - Lemma 3.3: `K`, `c` uniform;
   - Lemma 3.4 (a)-(c) with E9;
   - Lemma 2.19: a genuine strong deformation retraction of `A = {r ≤ ‖u‖ ≤ R} ∩ [0,∞)^d` onto
     `Λ`, with the sup norm per R1.
3. **Definitions.** Check `restrictType` for faithfulness to paper.tex:1120. Check that no choice
   from a mere `∃` leaks into a statement. In Theorem 3.1, the choice of the `λ^d` is
   proof-internal; that is fine.
4. **Hygiene.** No hidden assumptions, no `sorry`/axioms, no DRAFT imports. Run the anchor checker.

**Route deviations to confirm.**
- Lemma 3.2 uses truncation monotonicity of generating-function iterates instead of a coupling of
  `X^d` with `X^{k+1}`.
- Theorem 3.1 uses Lemma 3.4(c) for compactness.
- The positivity step uses truncation monotonicity.
- Lemma 2.19 projects radially onto the simplex instead of the unit sphere.

Approved or internal?

## Report format

```text
PART A: per anchor, PASS | FAIL | SKIPPED — checks 1-6 with evidence
PART B: per theorem / definition: PASS | FAIL | NOTE — reason
Route deviations: verdicts
Blocking findings: <list, or none>
Non-blocking notes: <list>
Commands run: <exact commands with output excerpts>
```
