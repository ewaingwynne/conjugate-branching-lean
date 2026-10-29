# AU-B2 — pre-approval statement audit of batch 2 (fresh Sonnet auditor, 2026-10-28)

Target: the five proposed declarations in `review/batch-2.md`.

**Verdict.** DECLARATION_FIDELITY PASS for all five, conditional on the author's ruling R8.
All five are TRUE as stated. This was Lean-checked in scratch probes: the sealed finite-type
providers were ported to `ℕ`, and #4 and #5 were composed from the sealed `theorem_3_1` and
`example_3_5`.

| # | Declaration | Binders (SOURCE / TYPING / RULED / EXCESS) | Notes |
|---|---|---|---|
| 1 | `proposition_2_1_condLaw_countable` | 4 / 2 / – / 0 | `hpr`, `hns` are SOURCE but unused in the proof. Non-vacuity: an iid example with `a_k = 1/3`. |
| 2 | `proposition_2_2_countable` | 5 / 2 / – / 0 | No uniqueness of fixed points is needed: `P̂_k[E] = A_k⁻¹ lim P_k[X(N)=0]`. Non-vacuity checked. |
| 3 | `exists_conjugate_iff_exists_fixedPoint_countable` | 1 / 1 / 2 (`hpr`, `hns`) / 0 | `hpr` is **necessary**: a sterile type 0 plus self-reproducing types gives a conjugate but no fixed point in `(1,∞)^ℕ`. So L934 read literally is false, which calls for erratum E10. `hns` is unused; keep it for parity. |
| 4 | `theorem_3_1_conjugate` | 9 / 3 / – / 0 | Binders are byte-identical to the frozen `theorem_3_1`. Note that `X` itself is not assumed positive regular. |
| 5 | `example_3_5_conjugate` | 2 / 1 / – / 0 | Binders are byte-identical to the frozen `example_3_5` (E8). |

R8(a) was checked in Lean: `ω ∈ extinctionEvent ℕ ↔ ∑_k ω n k → 0`.

**Recommended docstring changes (applied).** These change no statement.
- #3: say that finite-type subcriticality is replaced by `hext`, note the necessity of `hpr`
  (E10) and that `hns` is kept for parity, and cite R3 (iii).
- #4: note that `ℕ_0` is read as `ℕ` (E6).

**Questions for the author.**
1. Should `hns` in #3 be kept for parity, or dropped?
2. Should the necessity of positive regularity be recorded as E10?
3. Is "correspond" the existence equivalence, or a bijection between conjugates and fixed points?
4. Confirm R8(b): `hpr` and `hns` are kept verbatim in #1 and #2.
5. Confirm R8(e): the remark is not anchored.
