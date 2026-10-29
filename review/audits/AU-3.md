# AU-3 — audit report (fresh Sonnet auditor, 2026-10-28)

Brief: `briefs/AU-3-pathspace-thm27-seals.md`. Audited at HEAD 01a5293; freeze baseline 0a46d78.

## Part A — seal audits: PASS for all four (checks 1-6 each)

| Anchor | Bytes | ABI | Fidelity | No smuggling | Content | Axioms |
|---|---|---|---|---|---|---|
| `proposition_2_1_condLaw` | PASS (one-line diff; prefix/suffix recomputed) | PASS `c35be098…` | PASS (`cond` = `(μ s)⁻¹ • μ.restrict s` by `rfl`; R6 respected; EXCESS 0) | PASS (`rfl`) | PASS | standard |
| `proposition_2_2` | PASS | PASS `927d2807…` | PASS (three clauses; `hext` is ∀ x; EXCESS 0) | PASS | PASS (also covers `A = 𝟙`, a gap in the paper's proof) | standard |
| `theorem_2_7` | PASS | PASS `0e7b189b…` | PASS (E1; EXCESS 0) | PASS | PASS (Brouwer applied to a proved continuous self-map; fixed point lies in `Λ` by ray uniqueness; positivity by Lemma 2.3) | standard |
| `theorem_1_4_fixedPoint` | PASS | PASS `60a9a3c7…` | PASS (R3) | PASS (imports the sealed `Frozen.Theorem_2_7`, then (2.6)) | PASS | standard |

**Composition witness.**
- The auditor wrote an explicit `PMF` for the Example 1.5 law.
- At term level they applied, in order: `example_1_5`, then `theorem_2_7` and `theorem_1_4_fixedPoint`, then `proposition_2_2` with `A = q`.
- They then applied `proposition_2_1_condLaw` to the tilted process, with `a = q⁻¹` and that process's regularity proved from scratch.
- The result compiled with standard axioms. All four seals therefore compose on a concrete `d = 2` law.

## Part B — node audit: PASS

**PathSpace theorems.** All six are `Expr ==` to the brief. The extra lemmas are faithful.

**`tilt`.** It is a genuine `PMF`, with no default or `ite`. `tilt_apply` holds by `rfl`.

**`measure_eq_of_cylinder`.** The π-system and `generateFrom` arguments are correct, so it gives equality
on the full product σ-algebra.

**`pathLaw_cylinder_inter_shift`.** It is a correct Markov property, including the edge cases.

**Assembly definitions** (`toE`, `rayPt`, `gMap`, `simplexMap`) and their lemmas: faithful.

**`rayParam`.** `Classical.epsilon` over an `∃!`, with every use guarded. It is internal only.

**Imports and placeholders.** The closure contains no DRAFT module and no forbidden construct.
All 40 public declarations use standard axioms only.

## Route deviations, all approved or internal

1. The h-transform replaces [JL08] Thm 1.
2. The extinction probability of `X̂` comes from generation-`n` laws instead of [AN72].
3. Continuity of `ρ` uses open basins instead of compactness and a homeomorphism.
4. Brouwer is applied on the simplex instead of the annulus.
5. *(internal)* Prop 2.2's conditional law is proved by the Markov property for `μ̂`, without
   needing `X̂` to be positive regular.

## Non-blocking notes and disposition

1. **Stale lemma numbers** in the `AssemblyRay`, `AssemblyMap` and `Theorem_2_7` docstrings, the same
   issue as AU-2 note 1. Sweep pending.
2. **`hpr` and `hns` unused** in the Prop 2.1 and 2.2 proofs. Accepted as source context.
3. **`rayParam` is a total `epsilon` def.** Internal and guarded. Accepted.
4. **Generic public names.** Same as AU-1 note 5.
5. **`definition_closure` omits `Defs/StepKernel.lean`.** Known AU-1 metadata gap, revisit at
   closure.
6. **Prop 2.1 uses `a_k < 1` only for finiteness.** The statement is correct as the source gives it.
