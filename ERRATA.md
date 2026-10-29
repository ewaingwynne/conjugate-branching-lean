# Author rulings and errata

Every ruling has an ID cited by the manifest (`approval_ref`, `split_policy.ruling_ref`)
and by `DEPGRAPH.md`. Rulings are made only by the author. Entries are append-only.

## Open (proposed by the orchestrator, awaiting the author)

_(none)_

## Decided

| ID | Date | Ruling (by the author, Ewain Gwynne) | Record |
|----|------|--------------------------------------|--------|
| R1 | 2026-10-28 | Batch 1A: all 14 definitions approved exactly as written, together with the 8 conventions listed in the packet (offspring-law encoding with 0-indexed types; `ℙ_k = pathLaw μ (single k 1)`; one-generation quantities via `μ k`; `f` on `[0,∞]^ι`, `g` on `[-∞,∞]^ι`; finiteness of `M` inside `IsSubcritical`, `ρ` = complex spectral radius; sup norm in (2.9); `N ≥ 1`; Def 1.1 context not inside `IsConjugate`). | `review/batch-1A.md` |
| R2 | 2026-10-28 | Anchor surface: freeze roots and definitions only (≈25 declarations). Numbered lemmas are proved as audited dependency-graph nodes without frozen statements. | this table |
| R3 | 2026-10-28 | Theorem 1.4 is split into three anchors: (i) fixed point in `(1,∞)^d`; (ii) a conjugate exists; (iii) the equivalence of paper.tex:238. Each anchor's witness is independent. | this table |
| R4 | 2026-10-28 | Example 1.5 is anchored as "at least three distinct fixed points in `(1,∞)²`" (plus the hypotheses of Thm 1.4). | this table |
| E1 | 2026-10-28 | paper.tex, Thm 1.4 Hyp. III: "for each `k ∈ ℕ`" → **read as `k ∈ {1,…,d}`** | `review/batch-1B.md` |
| E2 | 2026-10-28 | paper.tex, (1.2): `∏_{j=1}^{k}` → **read as `∏_{j=1}^{d}`** | `review/batch-1B.md` |
| E3 | 2026-10-28 | paper.tex, Lemma 2.16: statement `g(λ) > λ` can fail; proof gives `g^{(N)}(λ) > λ`; display uses `min_j λ_j` where `max_j` is needed → **anchor states `g^{(N)}(λ) > λ` and `g^{(n)}(λ) → ∞`** | `review/batch-1B.md` |
| E4 | 2026-10-28 | paper.tex, (3.13): `g_k(λ^d, 1, 1, …)` → **read as `g_k(λ^d, 0, 0, …)`** | `review/batch-1B.md` |
| E5 | 2026-10-28 | paper.tex, §2.3: "positive regular (Definition 2.8)" → **read as Definition 1.3** | `review/batch-1B.md` |
| E6 | 2026-10-28 | paper.tex, §3.2: "`(1,∞)^{ℕ_0}`" → **read as `(1,∞)^{ℕ}`** | `review/batch-1B.md` |
| E7 | 2026-10-28 | paper.tex:350, Prop 1.6: "unique value of `q > 1`": `f(∞) = ∞`, so `q = ∞` is always a second solution in `(1,∞]` → **read as unique `q ∈ (1,∞)` (the proof finds a finite root)** | `review/batch-1B.md` |
| E8 | 2026-10-28 | paper.tex:1188-1190, Ex 3.5: "(3.23) with `𝔼_k` in place of `𝔼_1`": changing only the expectations allows `ℙ_k = δ_0` for `k ≥ 2`, which breaks positive regularity of `X^d` → **read as: all four conditions of (3.23) hold with `ℙ_k`, `𝔼_k` in place of `ℙ_1`, `𝔼_1`** | `review/batch-1B.md` |
| R5 | 2026-10-28 | Prop 1.6: split → **two anchors: fixed-point form (unique `q`) and conjugate form (exists, unique in law); independent witnesses** | `review/batch-1B.md` |
| R6 | 2026-10-28 | Prop 2.1: partial anchor → **anchor only the conditional-law paragraph (2.1), without "Moreover, this branching process is subcritical"; part (a) and the subcriticality claim are not frozen (author's earlier decision); part (a) may still be proved as a graph node** | `review/batch-1B.md` |
| E9 | 2026-10-28 | paper.tex:1127, proof of Lemma 3.4: "For each k ≥ d" → **read as `d ≥ k`** (forced by (3.16) and the definition of λ^d); graph-level only, no frozen statement depends on it. Accepted with the instruction to start Phase 3. | Phase 2 report |
| R7 | 2026-10-28 | Thm 3.1 (paper.tex:957-987): "global extinction probability one" is read **per starting type** (`∀ k`, from one individual of each type), as in the frozen `theorem_3_1`; no step of the proof uses the hypothesis beyond this reading. Accepted with the instruction to start Phase 3. | Phase 2 report (global review Q10) |
