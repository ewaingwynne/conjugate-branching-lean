/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.PathLaw
public import Conjugate.Frozen.Defs.Truncate
import Conjugate.Internal.Analytic.GenFun
import Conjugate.Internal.Foundations.PathLaw
import Conjugate.Internal.Section3.Truncation

/-!
# Truncated iterates below the full iterates, and positivity (Theorem 3.1, last step)

Lean indexes types from `0`: paper type `k` is Lean type `k - 1`.

* `genFun_truncate_le_genFun`, `genFun_truncate_iterate_le_genFun`: for `q ∈ [1,∞]^ℕ`,
  `(f^d)^{(n)}_k(q|_d) ≤ f^{(n)}_k(q)`, by display (3.2) and monotonicity (the tail coordinates
  `q_j ≥ 1` are replaced by `1`);
* `one_add_mul_le_genFun_iterate`: the estimate of Lemma 2.3 (paper.tex:460-466) for an
  arbitrary `q ∈ [1,∞]^ι`: `f^{(N)}_k(q) ≥ 1 + (q_j - 1) ℙ_k[X_j(N) ≥ 1]`;
* `one_lt_of_genFun_eq_self_of_truncate`: `thm-fixed-pt-infty#positivity` (paper.tex:1178). A
  fixed point `q ∈ [1,∞]^ℕ` of `f` with one coordinate `> 1` has every coordinate `> 1`, by the
  two previous estimates applied to a truncation `X^d` containing both types, with `N` from the
  positive regularity of `X^d`.
-/

public section

open MeasureTheory ProbabilityTheory Filter Topology

open scoped ENNReal

namespace Conjugate

/-- One step: `f^d_k(q|_d) ≤ f_k(q)` for `q ∈ [1,∞]^ℕ`. -/
theorem genFun_truncate_le_genFun (μ : ℕ → PMF (ℕ →₀ ℕ)) (d : ℕ) (q : ℕ → ℝ≥0∞)
    (hq : ∀ j, 1 ≤ q j) (k : Fin d) :
    genFun (truncate μ d) (fun j => q j) k ≤ genFun μ q k := by
  rw [genFun_truncate]
  refine genFun_mono μ (fun j => ?_) k
  dsimp only
  by_cases h : j < d
  · simp [h]
  · simp only [h, dite_false]
    exact hq j

/-- Truncated iterates are dominated by full iterates on `[1,∞]^ℕ`. -/
theorem genFun_truncate_iterate_le_genFun (μ : ℕ → PMF (ℕ →₀ ℕ)) (d n : ℕ)
    (q : ℕ → ℝ≥0∞) (hq : ∀ j, 1 ≤ q j) (k : Fin d) :
    (genFun (truncate μ d))^[n] (fun j => q j) k ≤ (genFun μ)^[n] q k := by
  induction n generalizing q k with
  | zero => exact le_rfl
  | succ n ih =>
    rw [Function.iterate_succ_apply, Function.iterate_succ_apply]
    have hq' : ∀ j, 1 ≤ genFun μ q j := fun j => by
      have h := genFun_mono μ (show (1 : ℕ → ℝ≥0∞) ≤ q from hq) j
      rwa [genFun_one] at h
    calc (genFun (truncate μ d))^[n] (genFun (truncate μ d) (fun j => q j)) k
        ≤ (genFun (truncate μ d))^[n] (fun j : Fin d => genFun μ q j) k :=
          (genFun_mono (truncate μ d)).iterate n
            (fun j => genFun_truncate_le_genFun μ d q hq j) k
      _ ≤ _ := ih (genFun μ q) hq' k

/-- **The estimate of Lemma 2.3** (paper.tex:460-466) for an arbitrary `q ∈ [1,∞]^ι`:
`f^{(N)}_k(q) ≥ 1 + (q_j - 1) ℙ_k[X_j(N) ≥ 1]`. -/
theorem one_add_mul_le_genFun_iterate {ι : Type*} [Countable ι] (μ : ι → PMF (ι →₀ ℕ))
    (N : ℕ) {q : ι → ℝ≥0∞} (h1 : ∀ i, 1 ≤ q i) (k j : ι) :
    1 + (q j - 1) * pathLaw μ (Finsupp.single k 1) {ω | 1 ≤ ω N j} ≤
      (genFun μ)^[N] q k := by
  set P := pathLaw μ (Finsupp.single k 1) with hP
  have hA : MeasurableSet {ω : ℕ → ι →₀ ℕ | 1 ≤ ω N j} := by
    have hs : MeasurableSet {c : ι →₀ ℕ | 1 ≤ c j} := MeasurableSet.of_discrete
    exact hs.preimage (measurable_pi_apply N)
  set A : Set (ℕ → ι →₀ ℕ) := {ω | 1 ≤ ω N j} with hAdef
  have hpt : ∀ ω, 1 + A.indicator (fun _ => q j - 1) ω ≤ (ω N).prod (fun i m => q i ^ m) := by
    intro ω
    have hone : 1 ≤ (ω N).prod (fun i m => q i ^ m) :=
      Finset.one_le_prod fun i _ => one_le_pow_of_one_le' (h1 i) _
    by_cases hω : ω ∈ A
    · rw [Set.indicator_of_mem hω, add_tsub_cancel_of_le (h1 j)]
      have hmem : j ∈ (ω N).support := Finsupp.mem_support_iff.2 (by
        have : 1 ≤ ω N j := hω
        omega)
      refine le_trans ?_ (Finset.single_le_prod (f := fun i => q i ^ ω N i)
        (fun i _ => one_le_pow_of_one_le' (h1 i) _) hmem)
      exact le_self_pow (h1 j) (by
        have : 1 ≤ ω N j := hω
        omega)
    · rw [Set.indicator_of_notMem hω, add_zero]
      exact hone
  calc 1 + (q j - 1) * P A = ∫⁻ ω, 1 + A.indicator (fun _ => q j - 1) ω ∂P := by
        rw [lintegral_add_left measurable_const, lintegral_indicator_const hA, hP,
          lintegral_one, measure_univ]
    _ ≤ (genFun μ)^[N] q k := by
        rw [genFun_iterate_eq]
        exact lintegral_mono hpt

/-- **`thm-fixed-pt-infty#positivity`** (paper.tex:1178): if every truncation is positive
regular, a fixed point `q ∈ [1,∞]^ℕ` of `f` with one coordinate `q_{j₀} > 1` has every
coordinate `> 1`. -/
theorem one_lt_of_genFun_eq_self_of_truncate (μ : ℕ → PMF (ℕ →₀ ℕ))
    (hpr : ∀ d, 1 ≤ d → IsPositiveRegular (truncate μ d)) {q : ℕ → ℝ≥0∞}
    (hq1 : ∀ j, 1 ≤ q j) (hfix : genFun μ q = q) {j₀ : ℕ} (hj₀ : 1 < q j₀) (k : ℕ) :
    1 < q k := by
  set d : ℕ := max k j₀ + 1 with hd
  have hk : k < d := by omega
  have hj : j₀ < d := by omega
  obtain ⟨N, -, hN⟩ := hpr d (by omega)
  have h1 := one_add_mul_le_genFun_iterate (truncate μ d) N (q := fun j => q j)
    (fun i => hq1 i) ⟨k, hk⟩ ⟨j₀, hj⟩
  have h2 := genFun_truncate_iterate_le_genFun μ d N q hq1 ⟨k, hk⟩
  rw [Function.iterate_fixed hfix] at h2
  calc (1 : ℝ≥0∞)
      < 1 + (q j₀ - 1) * pathLaw (truncate μ d) (Finsupp.single ⟨k, hk⟩ 1)
          {ω | 1 ≤ ω N ⟨j₀, hj⟩} :=
        ENNReal.lt_add_right ENNReal.one_ne_top
          (ENNReal.mul_pos (tsub_pos_iff_lt.2 hj₀).ne' (hN ⟨k, hk⟩ ⟨j₀, hj⟩).ne').ne'
    _ ≤ (genFun (truncate μ d))^[N] (fun j => q j) ⟨k, hk⟩ := h1
    _ ≤ q k := h2

end Conjugate

end
