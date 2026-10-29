# Results index — arXiv:2411.06301v2 in Lean

Every numbered result of the paper, mapped to its Lean declaration(s). The numbering is the
compiled numbering of the PDF.

- **Frozen anchors** (author-approved statements, `Conjugate/Frozen/`) are the source-facing
  theorems. Their state is tracked in `STATUS.md`.
- **Graph-node lemmas** (R2: not frozen) are internal theorems in `Conjugate/Internal/`, audited
  against `DEPGRAPH.md`.
- **Indexing.** Lean indexes types from `0`: paper type `k` is Lean type `k − 1`. The paper's `ℙ_k`
  is `pathLaw μ (Finsupp.single k 1)`.

## §1 — Definitions and main results

| Paper | Lean | File |
|---|---|---|
| (1.1) generating function `f` | `Conjugate.genFun` (frozen def) | `Frozen/Defs/GenFun.lean` |
| (1.2) `f^{(n)}_k(q) = 𝔼_k[∏ q_j^{X_j(n)}]` (E2) | `Conjugate.lintegral_pathLaw_prod`, `genFun_iterate_eq` | `Internal/Foundations/Generations.lean`, `Internal/Analytic/GenFun.lean` |
| (1.3) mean matrix `M`; `(M^n)_{kj} = 𝔼_k[X_j(n)]` | `Conjugate.meanMatrix` (frozen def); `lintegral_pathLaw_apply` | `Frozen/Defs/MeanMatrix.lean`, `Internal/Foundations/Generations.lean` |
| Definition 1.1 (conjugate) | `Conjugate.IsConjugate` (frozen def) | `Frozen/Defs/IsConjugate.lean` |
| Definition 1.3 (positive regular, non-singular) | `Conjugate.IsPositiveRegular`, `Conjugate.IsNonsingular` (frozen defs) | `Frozen/Defs/` |
| subcritical (largest eigenvalue of `M` `< 1`) | `Conjugate.IsSubcritical` (frozen def) | `Frozen/Defs/IsSubcritical.lean` |
| Theorem 1.4, fixed-point form (R3) | `Conjugate.theorem_1_4_fixedPoint` | `Frozen/Theorem_1_4_FixedPoint.lean` |
| Theorem 1.4, conjugate form (R3) | `Conjugate.theorem_1_4_conjugate` | `Frozen/Theorem_1_4_Conjugate.lean` |
| paper.tex:238, conjugate ⟺ fixed point in `(1,∞)^d` (R3) | `Conjugate.exists_conjugate_iff_exists_fixedPoint` | `Frozen/ExistsConjugateIff.lean` |
| Remark after Thm 1.4: Hyp. III is necessary (`a m⁻³` example) | `Conjugate.remark_hypIII_necessary` | `Frozen/Remark_HypIII_Necessary.lean` |
| Remark after Thm 1.4: Hyp. III is automatic if `f < ∞` | `Conjugate.remark_hypIII_automatic` | `Frozen/Remark_HypIII_Automatic.lean` |
| Example 1.5, at least three fixed points (R4) | `Conjugate.example_1_5` | `Frozen/Example_1_5.lean` |
| Proposition 1.6, fixed-point form, unique `q ∈ (1,∞)` (R5, E7) | `Conjugate.proposition_1_6_fixedPoint` | `Frozen/Proposition_1_6_FixedPoint.lean` |
| Proposition 1.6, conjugate form, exists and unique in law (R5) | `Conjugate.proposition_1_6_conjugate` | `Frozen/Proposition_1_6_Conjugate.lean` |
| subcritical ⇒ extinction a.s. from every population (paper.tex:238, unstated) | `Conjugate.pathLaw_extinctionEvent_eq_one`, `pathLaw_extinctionEvent_eq_prod` | `Internal/Foundations/Extinction.lean` |

## §2 — Proof of Theorem 1.4

| Paper | Lean | File |
|---|---|---|
| Proposition 2.1, conditional law (2.1) (R6; (a), (c) not formalized) | `Conjugate.proposition_2_1_condLaw` | `Frozen/Proposition_2_1_CondLaw.lean` |
| Proposition 2.2 | `Conjugate.proposition_2_2` | `Frozen/Proposition_2_2.lean` |
| Lemma 2.3 | `Conjugate.one_le_of_genFun_eq_self`, `eq_one_or_one_lt_of_genFun_eq_self` | `Internal/Section2/Positivity.lean` |
| Lemma 2.4 | `Conjugate.exists_pos_two_individuals` | `Internal/Section2/Positivity.lean` |
| Lemma 2.5 | `Conjugate.exists_genFun_lt_self`, `exists_logGenFun_lt_self` | `Internal/Section2/SubBound.lean` |
| Definition 2.6 (`g`) and (2.5) | `Conjugate.logGenFun` (frozen def), `logGenFun_iterate` | `Frozen/Defs/LogGenFun.lean`, `Internal/Analytic/LogGenFun.lean` |
| (2.6) `g(λ) = λ ⟺ f(e^λ) = e^λ` | `Conjugate.logGenFun_eq_self_iff` | `Internal/Analytic/LogGenFun.lean` |
| Theorem 2.7 | `Conjugate.theorem_2_7` | `Frozen/Theorem_2_7.lean` |
| Definition 2.8 (componentwise order) | the order on `Fin d → EReal`: `≤`, with `≤ ∧ ≠` for `<` | — |
| Lemma 2.9 (monotonicity; strict part) | `Conjugate.logGenFun_mono`, `exists_logGenFun_iterate_strict` | `Internal/Analytic/LogGenFun.lean`, `Internal/Section2/Strict.lean` |
| Proposition 2.10 (i), (ii) | `Conjugate.tendsto_zero_of_lt`, `limsup_eq_top_of_lt` (with `m = 1`) | `Internal/Section2/Unstable.lean` |
| Lemma 2.11 | `Conjugate.tendsto_logGenFun_iterate_smul` (`φ = id`) | `Internal/Section2/Unstable.lean` |
| Lemma 2.12 (along `r m`) | `Conjugate.tendsto_zero_of_lt`, `limsup_eq_top_of_lt` (general `m`) | `Internal/Section2/Unstable.lean` |
| Lemma 2.13 | `Conjugate.mem_basinZero_of_iterate_lt`, `tendsto_top_of_lt_iterate` | `Internal/Section2/MonotoneLimit.lean` |
| (2.9) basins `S₀`, `S∞` (sup norm, R1) | `Conjugate.basinZero`, `Conjugate.basinInfty` (frozen defs) | `Frozen/Defs/` |
| (2.10) `[0,∞]^d ∖ [0,∞)^d ⊆ S∞` | `Conjugate.mem_basinInfty_of_exists_eq_top` | `Internal/Section2/Strict.lean` |
| Lemma 2.14 | `Conjugate.logGenFun_mem_basinZero_iff`, `logGenFun_mem_basinInfty_iff` | `Internal/Section2/BasinInvariance.lean` |
| Lemma 2.15 | `Conjugate.exists_mem_basinZero_of_le` | `Internal/Section2/Attractive.lean` |
| Lemma 2.16 (E3) | `Conjugate.exists_attractive_infty` | `Internal/Section2/Attractive.lean` |
| Lemma 2.17 | `Conjugate.exists_isOpen_basinZero`, `exists_isOpen_basinInfty` | `Internal/Section2/BasinOpen.lean` |
| Lemma 2.18 (norm-free: every nonzero `u ≥ 0`) | `Conjugate.existsUnique_ray` | `Internal/Section2/Ray.lean` |
| Lemma 2.19 | `Conjugate.exists_deformationRetract` | `Internal/Section2/Retract.lean` |
| Brouwer fixed point theorem (cited) | `Conjugate.Infrastructure.brouwer_simplex` (proved in-project) | `Infrastructure/Brouwer.lean` |

## §3 — Countable types

| Paper | Lean | File |
|---|---|---|
| truncation `X^d` | `Conjugate.truncate` (frozen def) | `Frozen/Defs/Truncate.lean` |
| (3.1) finite offspring | automatic: offspring vectors are `ℕ →₀ ℕ` | — |
| (3.2) `f^d_k(q) = f_k(q, 1, 1, …)` | `Conjugate.genFun_truncate`, `logGenFun_truncate` (E4) | `Internal/Section3/Truncation.lean` |
| Theorem 3.1 (E6, R7) | `Conjugate.theorem_3_1` | `Frozen/Theorem_3_1.lean` |
| Lemma 3.2 | `Conjugate.exists_bound_fixedPoint_truncate` | `Internal/Section3/LimsupBound.lean` |
| Lemma 3.3 | `Conjugate.exists_liminf_fixedPoint_truncate` | `Internal/Section3/Liminf.lean` |
| Lemma 3.4 (a), (b) (E9), (c) | `Conjugate.existsUnique_fixedPoint_restrictType`, `exp_fixedPoint_truncate_le`, `fixedPoint_truncate_le_growth` | `Internal/Section3/SingleTypeFixedPoint.lean` |
| Example 3.5 (E8) | `Conjugate.example_3_5` | `Frozen/Example_3_5.lean` |
| stochastic domination (Ex 3.5) | `Conjugate.StochDominated` (frozen def) | `Frozen/Defs/StochDominated.lean` |

### §3 — countable-type conjugates (batch 2, ERRATA R8, E10)

| Paper | Lean | File |
|---|---|---|
| L934: (2.1) still holds for countable types | `Conjugate.proposition_2_1_condLaw_countable` | `Frozen/Proposition_2_1_CondLaw_Countable.lean` |
| L934: Proposition 2.2 for countable types (global extinction) | `Conjugate.proposition_2_2_countable` | `Frozen/Proposition_2_2_Countable.lean` |
| L934: conjugate ⟺ fixed point in `(1,∞)^ℕ`, needing positive regularity (E10) | `Conjugate.exists_conjugate_iff_exists_fixedPoint_countable` | `Frozen/ExistsConjugateIffCountable.lean` |
| L958-959: Theorem 3.1 gives a conjugate | `Conjugate.theorem_3_1_conjugate` | `Frozen/Theorem_3_1_Conjugate.lean` |
| L1183: Example 3.5 gives a conjugate | `Conjugate.example_3_5_conjugate` | `Frozen/Example_3_5_Conjugate.lean` |
| fixed point ⇒ conjugate, countable types, no regularity of `X` | `Conjugate.isConjugate_of_fixedPoint_nat` | `Internal/Countable/FixedPointToConjugate.lean` |
| conjugate ⇒ fixed point, countable types | `Conjugate.exists_fixedPoint_of_isConjugate_nat` | `Internal/Countable/ConjugateToFixedPoint.lean` |

## Not formalized (author rulings or outside the formal content)

Each item is EXCLUDED with a reason in `DEPGRAPH_COVERAGE.md`.

- **Prop 2.1 (a) and (c)** (cited from Athreya–Ney). Excluded by the author.
- **Remark 1.2** (paper.tex:193-196). A literature remark on other ways to condition.
- **"Hypothesis I is necessary"** (paper.tex:252). A supercritical process conditioned on extinction
  is subcritical; this is cited background, with no proof obligation.
- **Example 1.5, beyond the anchored statement.**
  - "Robust under perturbation" (paper.tex:262), asserted without proof.
  - The `d = 3` example with seven fixed points (paper.tex:262), asserted without proof.
  - The expectation that the number of fixed points can be arbitrarily large (paper.tex:263).
  - The exact count of three: the anchor states "at least three" (R4).
- **Convexity of `g_k`** (paper.tex:560). The paper notes it is not needed, and its lemma is
  commented out of the source.
- **§3.1 background** (paper.tex:930-934):
  - partial and local extinction (L930-932), cited;
  - the remark at the end of L934 that the conjugate's partial extinction probability may be 1
    (R8(e)). The rest of L934 is formalized in batch 2 (above).
- **Illustrations.**
  - The sampling recipe in Example 3.5 (paper.tex:1193).
  - The proof outline in §1.3.
  - Figures 1-2.
  - The remark on the lim / limsup asymmetry (paper.tex:731).
- **§4 (Liouville quantum gravity, biology).** Discussion only.

## Proof-route deviations

These are approved in `PLAN.md` §6, or are internal. They change proofs, never statements.

- **Brouwer** is proved in-project (Kuhn triangulation, Sperner), and applied on the simplex rather
  than to the annulus `A`. Lemma 2.19 is still proved.
- **Lemma 2.5** uses the Neumann vector `∑ M^n 𝟙`, not Perron–Frobenius.
- **Lemma 2.11** uses Hölder without Vitali.
- **Lemma 2.12** works along the times `r m`, without the skeleton process.
- **Lemma 2.13** starts each residue class at a time where monotonicity is strict. This replaces
  the limit-point step.
- **Theorem 2.7: continuity of the ray parameter** follows from the open basins (Lemma 2.17),
  replacing the compactness / homeomorphism argument.
- **Props 2.1 (b) and 2.2** are proved as a Doob h-transform on cylinder sets. [JL08, Thm 1] and
  [AN72, V.3 Thm 2] are not used.
- **Conjugate ⇒ fixed point:** the tilt is read off generation 1. This replaces applying Prop 2.1
  to `X̂`.
- **Lemma 3.2 and the positivity in Thm 3.1** use truncation monotonicity of the generating-function
  iterates, in place of couplings.
- **Theorem 3.1** gets compactness from Lemma 3.4(c), (3.17), which the paper itself uses for
  domination, instead of Lemma 3.2. Lemma 3.2 is still proved, as stated.
- **Lemma 2.19** builds its homotopy with the radial projection onto the simplex and the Theorem 2.7
  ray parameter. This replaces the unit sphere and the compactness / homeomorphism step. The
  statement, a strong deformation retraction in the sup norm (R1), is the paper's.
- **Countable Prop 2.2 (batch 2):** the global extinction probability of `X̂` is computed
  directly. The finite proof's appeal to [AN72] (uniqueness of fixed points in `[0,1]^d`) fails for
  countable types (L930).
- **Conjugate forms of Thm 3.1 and Ex 3.5:** these use a "fixed point ⇒ conjugate" step with no
  regularity of `X`. Thm 3.1 assumes regularity only for the truncations `X^d`.
- **Lemma 2.18** is stated norm-free, for every nonzero `u ≥ 0`. This implies the paper's `|u| = 1`
  form.
