# AU-7 — seal audit of the five batch-2 anchors (fresh Sonnet auditor, 2026-10-28)

Brief: `briefs/AU-7-batch2-seals.md`. Audited at HEAD 81c5300.

## Part A — all five PASS on checks 1-6

| Anchor | ABI | Binders (SOURCE / TYPING / RULED / EXCESS) |
|---|---|---|
| `proposition_2_1_condLaw_countable` | `6d31e533…` | 4 / 2 / 0 / 0 |
| `proposition_2_2_countable` | `3ce6b759…` | 5 / 2 / 0 / 0 |
| `exists_conjugate_iff_exists_fixedPoint_countable` | `2c68124c…` | 1 / 1 / 2 (`hpr`, `hns`: R8c, E10) / 0 |
| `theorem_3_1_conjugate` | `e83a543b…` | 9 / 3 / 0 / 0; binders `==` the frozen `theorem_3_1` |
| `example_3_5_conjugate` | `976e8353…` | 2 / 1 / 0 / 0; binders `==` the frozen `example_3_5` |

**Bytes.**
- The code blocks in `review/batch-2.md` are identical to `git show e731893:<file>`.
- Since the freeze, only the proof line and the manifest `state` have changed.

**No smuggled steps.**
- Each frozen statement is `Expr ==` to its provider, and `rfl` holds.
- The term closures of the providers reach no batch-2 frozen anchor. #4 reaches only
  `theorem_3_1`, and #5 reaches only `theorem_3_1` and `example_3_5`.

**Content and non-vacuity.**
- All five were instantiated on a concrete countable-type law. It has no children with
  probability `a`, and otherwise two children, of types `Poisson(1)` and `0`; its support is
  infinite. Every hypothesis was proved in Lean:
  - #5 with `(a, p) = (7/8, 1/8)`;
  - #4 from the sealed outputs of Example 3.5;
  - #3, both directions, with `q ≡ 7`;
  - #2 with `A ≡ 7`;
  - #1 with `a_k ∈ [1/4, 1/3]`.
- #4 and #5 assume no positive regularity of `X`. The closure of `isConjugate_of_fixedPoint_nat`
  contains no regularity predicate and no Lemma 2.3. Lemma 2.3 enters only through the sealed
  `theorem_3_1`, which applies it to the truncations.

**Axioms.** Standard throughout.

## Part B — node audit: PASS

All five `Countable/*` public theorems pass. One note: the node
`#conjugate-to-fixed-point` reads `q_k := 1/P̂_k[E]`, which the Lean statement does not state.
It follows from the Lean statement; the auditor proved this in a probe.

## Part C — gate

`tools/check.sh` exits 0: 6956 jobs, 109 modules, guard OK, ABI OK (33).

## Non-blocking notes and disposition

1. **Unused source premises** (`hpr`, `hns` per R8(b), (c)). Accepted.
2. **Provider docstring lines over 100 characters.** Fixed.
3. **Graph DEPS name the cited route,** which Lean avoids. This is by design: the edge policy
   records cited source uses, and the NOTEs name the Lean route. GR-E2 already removed the
   regularity-conditional edge from `#cond-law-hat`. `LEAN_STATUS` fields are planning metadata and
   are not maintained (status lives in `STATUS.md`).
4. **`graph/anchors.json`** is a Phase 2 extraction input with the original 28 anchors. Batch-2
   anchors are identified by the manifest and the graph header. No action.
5. **`definition_closure`** omits Prop-only `Infrastructure` instances. This is the existing
   convention. No action.
