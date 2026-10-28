# Conjugate branching processes in Lean 4

A Lean 4 / Mathlib formalization of

> E. Gwynne and J. Liu, *Inverting the operation of conditioning a branching
> process on extinction*, arXiv:2411.06301v2.

Status: setup. See `PLAN.md` for the plan and `STATUS.md` for the current state.

The workflow follows LeanAutoformalizationSkills
(github.com/scottnarmstrong/LeanAutoformalizationSkills, CC-BY 4.0):
author-frozen anchors, a source-level dependency graph, and independently audited
proofs. The checker scripts in `tools/check_frozen_anchors.py`,
`tools/proof_depgraph.py` and `tools/check_lean_modules.py` are copied from that
collection (revision `05a07311`) under CC-BY 4.0.

Build:

```bash
export PATH="$HOME/.elan/bin:$HOME/.local/bin:$PATH"
lake build
tools/check.sh
```
