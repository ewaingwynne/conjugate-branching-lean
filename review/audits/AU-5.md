# AU-5 — audit report (fresh Sonnet auditor, 2026-10-28)

Brief: `briefs/AU-5-section3-lemma219.md`. Audited at HEAD a79ee2e; the audited files are unchanged
since bab0794. Lemma 2.19 was skipped as instructed and is covered by AU-6.

## Part A — seal audits: PASS (checks 1-6 each)

### `theorem_3_1`
- **ABI:** `068d102e…`.
- **Binders:** SOURCE 9, TYPING 3, with overlays R7, E1 and E6; EXCESS 0. An independent
  restatement in different syntax elaborates.
- **Unused hypotheses.** `hext` and `hφ_lim` are unused. This is mathematically correct, not a
  weakening:
  - every `X^d` is subcritical, which supplies the finite-type extinction Lemma 3.3 needs (R7);
  - `K` comes only from `log ψ/φ → 0` and `φ ≥ 1`.
- **Non-vacuity.** Fed term by term on a concrete law, it yields a genuine `q ∈ (1,∞)^ℕ`.

### `example_3_5`
- **ABI:** `625ddeab…`.
- **Binders:** SOURCE 2, TYPING 1, with overlay E8; EXCESS 0.
- **Reading of the hypotheses.**
  - E8: all four conditions of (3.23) hold for every `ℙ_k`.
  - The weights carry the index shift.
  - `hdom` is "dominated by the sum of `k+1` i.i.d. type-0 offspring vectors", and the direction
    of the domination was checked.
- **Conclusion.** It instantiates Theorem 3.1 with `φ k = k+1`, `ψ ≡ 1`.
- **Non-vacuity.** The auditor built an explicit PMF `ν`, with factorial weights on `single j 1`,
  that satisfies `h323` and `hdom`. The anchor applies to it and returns a real fixed point. The same
  law instantiates Lemmas 3.2, 3.3 and 3.4 (a)-(c).

## Part B — node audit: PASS

- **Brief signatures.** All ten §3 brief signatures are `Expr ==`, with identical binder names and
  infos. `restrictType` matches up to an auxiliary name.
- **Display (3.2) and its log form (E4).** Correct.
- **Lemma 3.2.** `B` precedes `d` and `x`, so the bound is uniform. It harmlessly allows any
  `x ∈ [0,∞)^d`.
- **Lemma 3.3.** `K` and `c` are uniform.
- **Lemma 3.4 (a)-(c).** Correct; (b) carries E9.
- **`restrictType`.** Faithful to paper.tex:1120.
- **Statements.** No `choose` or `epsilon` leaks into any statement.
- **Hygiene.** The checker is OK and the modules pass. All 77 declarations use standard axioms. No
  DRAFT module appears in any closure.

## Route deviations: all approved and internal

- Lemma 3.2 uses truncation monotonicity instead of a coupling.
- Theorem 3.1 gets compactness from Lemma 3.4(c), in place of Lemma 3.2.
- Positivity uses truncation monotonicity.

## Non-blocking notes and disposition

1. **Docstring indexing in the frozen Example 3.5.** It uses paper numbering, and the Lean binder is
   correct. The frozen bytes cannot change. No action.
2. **Trivial facts.** The Example 3.5 conclusion omits the trivial `φ, ψ` side facts; the provider
   proves them inline. No action.
3. **Lemma 3.2 has no Lean consumer.** The Thm 3.1 proof bounds via (3.17) instead. `DEPGRAPH.md`
   keeps the paper's edge. This is recorded in `RESULTS.md` and is acceptable, because Lemma 3.2 is
   proved as a paper result in its own right.
4. **Hypothesis shapes match the source.** No action.
5. **`definition_closure` gap.** Known (AU-1).
6. **Generic helper names.** Cosmetic.
7. **Lemma 2.19 landed during the audit.** Audited in AU-6.
