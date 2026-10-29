# AU-2 — audit report (fresh Sonnet auditor, 2026-10-28)

Brief: `briefs/AU-2-section2-brouwer-prop16.md`. Tree audited: HEAD 7581f95 (with another agent's
uncommitted files present; the auditor neither built nor used them).

## Part A — seal audit of `Conjugate.proposition_1_6_fixedPoint`: PASS (all six checks)

- **Bytes.** Only the body line changed. The prefix and suffix hashes were recomputed and match.
- **ABI.** `ed854fd7…a736` matches the manifest and the graph.
- **Fidelity.** SOURCE 3, TYPING 1, EXCESS 0. Matches E7 and R5.
- **No smuggled steps.** `@frozen = @provider := rfl`.
- **Content.**
  - Existence: the difference quotient, the intermediate value theorem, and `F(t) ≥ P[X≥2] t²`.
  - Uniqueness: strict monotonicity of the difference quotient.
  - Non-vacuity: the law "0 w.p. 3/4, 2 w.p. 1/4", whose fixed point is `q = 3`.
- **Axioms.** Standard.

## Part B — §2 internal lemmas (W-A4, W-A5, W-A6): PASS on all 21 brief theorems and the added lemmas

- **Brief match.** All 21 brief signatures elaborate `Expr ==` to the project theorems.
- **Axioms.** 70 declarations probed, all standard.
- **Imports and style.** The import closure contains no non-`Defs` frozen module and no provider.
  There are no forbidden constructs, and nothing produces a warning under `autoImplicit false`.
- **Non-vacuity.** The basin, ray and attractive lemmas were instantiated on a concrete law. The
  ray lemma pins `r = log 3`, the true fixed point.
- **Route deviations.** All are approved or internal: the Neumann vector, Hölder without Vitali,
  the `r*m` subsequence, and residue classes for Lemma 2.13.

## Part C — Brouwer: PASS

- **Statement.** It is `Expr ==` to the brief.
- **Axioms.** Standard.
- **Combinatorics.** The Kuhn cells are genuine: `card (cells 3 2) = 48`, and the vertex chains
  were checked. `Admissible` is the standard cube-Sperner condition, and `cubeLabel` is admissible.
- **Non-vacuity.** Tested on the swap map of the 1-simplex.

## Non-blocking notes and disposition

1. **Lemma numbering.** Briefs W-A4 to W-A7 and the Lean docstrings number §2 off by one from
   Lemma 2.12 on, and call display (2.10) "(2.8)". The compiled numbering, checked against the PDF,
   is:
   - Lemma 2.12 = `lem-unstable-ssl`;
   - Lemma 2.13 = `lem-monotone-lim`;
   - Lemma 2.14 = `lem-basin-closed`;
   - Lemma 2.15 = `lem-attractive-zero`;
   - Lemma 2.16 = `lem-attractive-infty`;
   - Lemma 2.17 = `lem-basin-open`;
   - Lemma 2.18 = `lem-ray-intersect`;
   - Lemma 2.19 = `lem-retract`;
   - (2.9) = basin definitions, (2.10) = infinity subset.

   `DEPGRAPH.md`, `ERRATA.md` (E3 = Lemma 2.16) and all frozen files are correct. Disposition:
   fix the Lean docstrings in a quiet window, when no writer is building `Section2`. The briefs
   are historical and are not rewritten.
2. **Generic public names.** Same disposition as AU-1 note 5.
3. **Unused source hypotheses kept per brief** (`hIII` in Lemma 2.13 and the ray corollaries).
   Accepted.
4. **`exists_genFun_lt_self` needs only `hI`, `hIII`.** Noted.
5. **Hyp. III of Prop 1.6 is used only on `(1,∞)`.** Noted.
