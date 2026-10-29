# Audit AU-1 — foundations (W-A1, W-A2), analytic basics (W-A3), and the seal of `remark_hypIII_automatic`

**Role.** You are a fresh, independent auditor. Work **refute-first**: your job is to find
reasons each item should FAIL.
- **Compilation is not a fidelity verdict.** A statement that compiles can still say the wrong
  thing.
- **Read-only.** Edit nothing under `Conjugate/`, nothing in `frozen-anchor-manifest.json`,
  `DEPGRAPH*.md`, `STATUS.md`, `ERRATA.md`, `PLAN.md`, `briefs/`, `tools/`, or the lake
  configuration.
- **Scratch.** You may create scratch Lean files under `.lake/probes/au1/`, for example to test
  semantic claims or to restate a signature. Compile them with `lake env lean`. Delete them
  afterwards.
- **No commits.**

Workflow skill: `~/.claude/skills/lean-statement-audit/SKILL.md`. Read it first and apply its
seal-audit and node-audit checklists.

**Project context.** Read `CLAUDE.md`, `PLAN.md` §6 (approved proof-route deviations) and
`ERRATA.md` (author rulings). Source: `source/arxiv-2411.06301v2/fixed-pt-finite-type.tex`,
cited as `paper.tex:Lx`.

```bash
export PATH="$HOME/.elan/bin:$HOME/.local/bin:$PATH"
```

## Part A — seal audit of `Conjugate.remark_hypIII_automatic` (anchor `thm.remark_hypIII_automatic.v1`)

The frozen file `Conjugate/Frozen/Remark_HypIII_Automatic.lean` now has proof body
`by exact Conjugate.Internal.remark_hypIII_automatic μ hpr hns hfin`, and the manifest state is
`SEALED`. The provider is `Conjugate/Internal/Remark_HypIII_Automatic.lean`, which uses
`Conjugate/Internal/Analytic/GenFunContinuity.lean`.

Verify, with explicit verdicts:
1. **Bytes.** The frozen bytes outside the proof body are unchanged:
   `python3 -I tools/check_frozen_anchors.py --root . --manifest frozen-anchor-manifest.json`,
   plus `git diff 0a46d78 -- Conjugate/Frozen/Remark_HypIII_Automatic.lean`. The only change
   allowed is the body line.
2. **ABI.** The elaborated ABI matches the manifest:
   `python3 -I tools/leanprobe.py verify-abi frozen-anchor-manifest.json`.
3. **Fidelity.** The statement is faithful to paper.tex:252 (last sentence) under the rulings.
   Classify every binder. Then check every meaning-carrying definition the statement uses
   (`genFun`, `IsPositiveRegular`, `IsNonsingular`, the topology on `Fin d → ℝ≥0∞`).
   This statement was already audited at freeze time. Re-check it anyway.
4. **No smuggled steps.** The provider's statement is the frozen type exactly, and no hard step
   is hidden in a hypothesis.
5. **Content.** The provider genuinely proves continuity on `(0,∞]^d`, including points with
   infinite coordinates. Read `GenFunContinuity.lean`. Make sure that nothing is vacuous and
   that the topology is the intended one.
6. **Axioms.** Run
   `python3 -I tools/leanprobe.py axioms Conjugate.Frozen.Remark_HypIII_Automatic Conjugate.remark_hypIII_automatic`.

## Part B — node audit of the internal foundation API

The writers worked from the briefs `briefs/W-A1-path-space-foundations.md`,
`briefs/W-A2-branching-extinction.md` and `briefs/W-A3-genfun-analytic.md`. The files are:
- `Conjugate/Internal/Foundations/{StepKernel,PathLaw,Generations,Branching,Extinction,MeanDecay}.lean`;
- `Conjugate/Internal/Analytic/{GenFun,LogGenFun,GenFunContinuity}.lean`.

For **each public theorem named in those briefs**:
1. **Brief match.** The declared type matches the brief's exact statement (names, binders,
   hypotheses). The writers may only have *generalized* (for example, dropped an unused
   instance argument). Check that any generalization is harmless.
2. **Graph match.** The statement means what the `DEPGRAPH.md` node it serves says. The node IDs
   are listed in each brief; compare with the node's `SOURCE_CONCLUSION` and the paper. Flag any
   place where the Lean statement is weaker than what downstream use needs, or uses a different
   object than the paper (for example, the wrong indexing or the wrong measure).
3. **Helper definitions.** Check every new definition for faithfulness: `Individuals`,
   `offspringPi`, `pathKernel`, `typedSumLaw`, and any `private def`. Check every new
   **instance** (`isProbabilityMeasure_pathLaw`, `isProbabilityMeasure_pathLaw_map_eval`, …):
   could it create a diamond or change the meaning of anything frozen?
4. **No hidden assumptions.** There are no `sorry`/axioms; probe a sample with `leanprobe.py axioms`.
   No hypothesis is conclusion-shaped. No file imports a non-`Defs` frozen file or a quarantined
   provider; the anchor checker in Part A checks quarantine.
5. **Faithfulness of formulas.** Spot-check the key mathematical identities against the paper:
   - (1.2) at paper.tex:209-213 with ERRATA E2;
   - `M^n` at paper.tex:219-220;
   - the extinction product formula;
   - the Neumann vector `M v + 𝟙 = v`;
   - (2.5) at paper.tex:540;
   - (2.6) at paper.tex:546-549.

   Where cheap, test one or two semantic sanity claims in a scratch file. For example, take a
   concrete one-type law with a computable generating function and check that the generic
   lemmas specialize correctly.

## Report format

```text
PART A: PASS | FAIL — one line per check 1-6, with evidence (command + output excerpt)
PART B: per theorem: PASS | FAIL | NOTE — reason
Helper definitions/instances: PASS | FAIL — reason
Blocking findings: <list, or none>
Non-blocking notes: <list>
Commands run: <exact commands with output excerpts>
```

A single unjustified premise, a wrong object, or a mismatch with a brief is a FAIL. Report it
even if everything compiles.
