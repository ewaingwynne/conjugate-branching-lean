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

(none yet)
