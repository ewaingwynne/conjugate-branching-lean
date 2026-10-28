# Author rulings and errata

Every ruling has an ID cited by the manifest (`approval_ref`, `split_policy.ruling_ref`)
and by `DEPGRAPH.md`. Rulings are made only by the author. Entries are append-only.

## Open (proposed by the orchestrator, awaiting the author)

| ID | Source | Issue | Proposed ruling |
|----|--------|-------|-----------------|
| E1 | paper.tex, Thm 1.4 Hyp. III | "for each `k ∈ ℕ`" | read as `k ∈ {1,…,d}` |
| E2 | paper.tex, (1.2) | `∏_{j=1}^{k}` | read as `∏_{j=1}^{d}` |
| E3 | paper.tex, Lemma 2.16 | statement `g(λ) > λ` can fail; proof gives `g^{(N)}(λ) > λ`; display uses `min_j λ_j` where `max_j` is needed | anchor states `g^{(N)}(λ) > λ` and `g^{(n)}(λ) → ∞` |
| E4 | paper.tex, (3.13) | `g_k(λ^d, 1, 1, …)` | read as `g_k(λ^d, 0, 0, …)` |
| E5 | paper.tex, §2.3 | "positive regular (Definition 2.8)" | read as Definition 1.3 |
| E6 | paper.tex, §3.2 | "`(1,∞)^{ℕ_0}`" | read as `(1,∞)^{ℕ}` |

## Decided

| ID | Date | Ruling (by the author, Ewain Gwynne) | Record |
|----|------|--------------------------------------|--------|
| R1 | 2026-10-28 | Batch 1A: all 14 definitions approved exactly as written, together with the 8 conventions listed in the packet (offspring-law encoding with 0-indexed types; `ℙ_k = pathLaw μ (single k 1)`; one-generation quantities via `μ k`; `f` on `[0,∞]^ι`, `g` on `[-∞,∞]^ι`; finiteness of `M` inside `IsSubcritical`, `ρ` = complex spectral radius; sup norm in (2.9); `N ≥ 1`; Def 1.1 context not inside `IsConjugate`). | `review/batch-1A.md` |
| R2 | 2026-10-28 | Anchor surface: freeze roots and definitions only (≈25 declarations). Numbered lemmas are proved as audited dependency-graph nodes without frozen statements. | this table |
| R3 | 2026-10-28 | Theorem 1.4 is split into three anchors: (i) fixed point in `(1,∞)^d`; (ii) a conjugate exists; (iii) the equivalence of paper.tex:238. Each anchor's witness is independent. | this table |
| R4 | 2026-10-28 | Example 1.5 is anchored as "at least three distinct fixed points in `(1,∞)²`" (plus the hypotheses of Thm 1.4). | this table |
