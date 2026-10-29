# Audit AU-2 — §2 lemmas (W-A4, W-A5, W-A6), Brouwer (W-B1), and the seal of `proposition_1_6_fixedPoint`

**Role.** You are a fresh, independent auditor. Work **refute-first**: look for reasons each item
should FAIL.
- Compilation is not a fidelity verdict.
- Read-only: edit nothing under `Conjugate/`, and none of `frozen-anchor-manifest.json`,
  `DEPGRAPH*.md`, `STATUS.md`, `ERRATA.md`, `PLAN.md`, `briefs/`, `tools/` or the lake
  configuration.
- Scratch Lean files go under `.lake/probes/au2/`. Compile with `lake build`-equivalent options
  (a bare `lake env lean` ignores the lakefile's `autoImplicit false`). Delete them afterwards.
- No commits.

Workflow skill: `~/.claude/skills/lean-statement-audit/SKILL.md`. Read it first.

**Context.** Read:
- `CLAUDE.md`;
- `PLAN.md` §6 (approved route deviations: Lemma 2.5 via the Neumann vector; Lemma 2.11 via
  Hölder without Vitali; Lemma 2.13 along `r*m` without a skeleton process; Brouwer on the
  simplex);
- `ERRATA.md`, especially E3 (Lemma 2.15) and E7 (Prop 1.6);
- the previous audit `review/audits/AU-1.md`.

Source: `source/arxiv-2411.06301v2/fixed-pt-finite-type.tex`, cited as `paper.tex:Lx`.

```bash
export PATH="$HOME/.elan/bin:$HOME/.local/bin:$PATH"
```

## Part A — seal audit of `Conjugate.proposition_1_6_fixedPoint` (`thm.prop1_6_fixedPoint.v1` or as in the manifest)

The frozen file is `Conjugate/Frozen/Proposition_1_6_FixedPoint.lean`. Its body is
`by exact Conjugate.Internal.proposition_1_6_fixedPoint μ hI hII hIII`, and its state is
`SEALED`. The provider is `Conjugate/Internal/Proposition_1_6_FixedPoint.lean`, with the
development in `Conjugate/Internal/SingleType/`.

Verify, with explicit verdicts, as in AU-1 Part A:
1. **Bytes.** Only the body line changed since `0a46d78`. Use the checker and `git diff`.
2. **ABI.** Run `verify-abi`.
3. **Fidelity.** Compare to paper.tex:343-356 under ERRATA R5 and E7. Classify every binder,
   and check `hI` (the mean as `meanMatrix μ 0 0`), `hII`, and the `hIII` topology on `(0,∞]`.
4. **No smuggled steps.** The provider type equals the frozen type, and no hard step is a
   hypothesis.
5. **Content.** The development really proves existence **and** uniqueness in `(1,∞)`. Check the
   bridge `genFun μ (fun _ => q) 0 = pgf …`. Test non-vacuity on a concrete law if cheap.
6. **Axioms.**

## Part B — node audit of the §2 internal lemmas

The files are `Conjugate/Internal/Section2/{Positivity,Strict,BasinInvariance,SubBound,Unstable,MonotoneLimit,Attractive,BasinOpen,Ray}.lean`.
The briefs are `briefs/W-A4-positivity-layer.md`, `briefs/W-A5-instability.md` and
`briefs/W-A6-basins.md`.

For **each public theorem named in those briefs** (including the ray corollaries and the iterate
or disjointness lemmas that the writers added on request):
1. **Brief match.** The type matches the brief exactly, or is a harmless generalization.
2. **Graph match.** It means what the `DEPGRAPH.md` node it serves says, read against the paper
   and the rulings. Flag any weaker-than-needed form, wrong object, or wrong quantifier order.
   Check in particular:
   - Lemma 2.15 against ERRATA E3: strict in **every** coordinate, `max_j`;
   - Lemma 2.17: the norm-free form, every nonzero `u ≥ 0`;
   - Lemma 2.16: relatively open in `[0,∞]^d` with the `EReal` product topology;
   - the definitions `basinZero`/`basinInfty` (sup of `EReal.abs` in `ℝ≥0∞`).
3. **No hidden assumptions.** No conclusion-shaped or excess hypotheses, no `sorry`/axioms (probe a
   sample), and no imports of non-`Defs` frozen files or quarantined providers. Hypotheses kept
   but unused are acceptable if they match the brief, for example `hIII` in Lemma 2.12.
4. **Route deviations.** Confirm each deviation from the paper's proof is one of the approved
   routes, or is purely internal (for example, Lemma 2.12 without the limit-point step), and that
   no external result is silently assumed.

## Part C — Brouwer (W-B1, `Conjugate/Infrastructure/Brouwer*.lean`)

1. **Statement.** `Conjugate.Infrastructure.brouwer_simplex` is Brouwer's theorem for continuous
   self-maps of the standard simplex `{x | (∀ i, 0 ≤ x i) ∧ ∑ i, x i = 1}` in `ι → ℝ`,
   `[Fintype ι] [Nonempty ι]`. It must be the statement in `briefs/W-B1-brouwer.md` exactly.
2. **Axioms.** Only standard axioms, for `brouwer_simplex`, `brouwer_cube`, `brouwer_cube_fin`
   and `Sperner.sperner_cube`.
3. **Plausibility.** Check the combinatorial core: Kuhn cells and the `Admissible` labelling
   condition. Is `sperner_cube` a correct Sperner statement? Is `cubeLabel` admissible for the
   map at hand? This is a sanity read, not a line-by-line proof check; the kernel has checked
   the proofs. Make sure nothing makes the theorem vacuous, for example an empty `cells`.
4. **Housekeeping.** No `sorry`, no forbidden constructs, and files ≤ 1500 lines.

## Report format

```text
PART A: PASS | FAIL — checks 1-6 with evidence
PART B: per theorem: PASS | FAIL | NOTE — reason
PART C: PASS | FAIL — checks 1-4
Blocking findings: <list, or none>
Non-blocking notes: <list>
Commands run: <exact commands with output excerpts>
```
