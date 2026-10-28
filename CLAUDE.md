# Conjugate branching processes — Lean formalization

Formalization of arXiv:2411.06301v2 (Gwynne–Liu, "Inverting the operation of
conditioning a branching process on extinction"). Workflow: LeanAutoformalizationSkills
(`lean-orchestrator`, `build-proof-dependency-graph`, `lean-statement-audit`),
installed in `~/.claude/skills/`. Plan: `PLAN.md`. Status ledger: `STATUS.md`.
Author rulings and errata: `ERRATA.md`.

## Source of truth

- Source: `source/arxiv-2411.06301v2/fixed-pt-finite-type.tex`
  (sha256 `b0fb466bfd59b1fd0e03757eddca48f8e67aa194a43b66880d2caeb677061670`).
  Cite it as `paper.tex:Lx-Ly`. The PDF in `source/` is for reading only.
- Text inside `\begin{comment} … \end{comment}` is not part of the paper.
- Toolchain and Mathlib pins (`lean-toolchain`, `lake-manifest.json`) are frozen.
  Do not update them.

## Environment

```bash
export PATH="$HOME/.elan/bin:$HOME/.local/bin:$PATH"
```

`lake`/`lean` print harmless `getpwuid_r` and `could not canonicalize path` warnings.

- Compile one file: `lake env lean Conjugate/Path/To/File.lean`
- Build one module: `lake build Conjugate.Path.To.File`
- Full gate (orchestrator): `tools/check.sh`
- Probes: `python3 -I tools/leanprobe.py axioms MODULE DECL` / `abi MODULE DECL`

## Layout

- `Conjugate/Frozen/` — author-approved anchors, **one public declaration per file**,
  bound by `frozen-anchor-manifest.json`. **Read-only for everyone except the
  orchestrator, and only after an author ruling.**
- `Conjugate/Internal/` — providers (implementation modules) below the anchors.
- `Conjugate/Infrastructure/` — reusable, source-independent mathematics (e.g. Brouwer).
- There is no root aggregator module (it would import draft anchors); `lake build`
  builds every module under `Conjugate/` via a glob.

## Hard rules (repeat verbatim in every worker brief)

1. Never edit a file under `Conjugate/Frozen/`, `frozen-anchor-manifest.json`,
   `DEPGRAPH*.md`, `STATUS.md`, `ERRATA.md`, `lakefile.toml`, `lean-toolchain`
   or `lake-manifest.json`. If a frozen declaration looks wrong, stop and report.
2. No `sorry`, `admit`, `axiom`, `opaque` placeholders, `native_decide`,
   `implemented_by`, `@[extern]`, `unsafe`, or `set_option maxHeartbeats`
   (or any other heartbeat / recursion / debug override) anywhere in tracked files.
   Unfinished work stays out of `Conjugate/` or is reported as unfinished.
3. Never add a hypothesis to a source-facing statement to make a proof go through.
   A needed intermediate result is proved, not assumed.
4. Never import a frozen anchor that is in state `DRAFT_SORRY`, nor its provider
   module (see the manifest). Consume only sealed anchors and your own files.
5. Every Lean file is a `module`: copyright comment, `module`, imports
   (`public import` for anything statements need), module docstring,
   `public section` (`@[expose] public section` for source-facing definitions).
6. At most 1500 lines per file. Split larger files.
7. Do not run `lake clean`, delete anything under `.lake/`, or modify Mathlib.
8. Do not commit; the orchestrator commits. Do not touch files you were not given.
9. Scratch and probe files go outside `Conjugate/` (e.g. `.lake/probes/`) and are
   deleted after use.
10. Report exactly: files changed, approach, the exact commands run and their output,
    `#print axioms` for every new public theorem, and anything unproved or uncertain.
