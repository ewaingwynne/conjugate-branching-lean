/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.LogGenFun
public import Conjugate.Frozen.Defs.Truncate
import Conjugate.Internal.Analytic.GenFun

/-!
# The generating function of a truncation (display (3.2))

Lean indexes types from `0`: paper type `k` is Lean type `k - 1`. For the truncation
`truncate μ d` of a branching process with types `ℕ`:

* `genFun_truncate`: display (3.2), paper.tex:945-951. `f^d_k(q) = f_k(q_1, …, q_d, 1, 1, …)`,
  because `truncate μ d k` is the image of `μ k` under restriction of the offspring vector to
  `Fin d`, and the restricted monomial `∏_{j<d} q_j^{c_j}` is the full monomial with `q_j = 1`
  for `j ≥ d`;
* `logGenFun_truncate`: (3.2) in log coordinates (ERRATA E4: the tail coordinates are `0`);
* `genFun_truncate_le`, `genFun_truncate_iterate_le`: truncation monotonicity of the iterates on
  `[1,∞]^d` (`lem-fixed-limsup#truncation-monotone`, paper.tex:1010-1018).

Helper: `prod_comapDomain_val`.
-/

public section

open MeasureTheory

open scoped ENNReal

namespace Conjugate

/-- The monomial of the restriction of a population to `Fin d` is the full monomial with the
tail variables set to `1`. -/
lemma prod_comapDomain_val (c : ℕ →₀ ℕ) (d : ℕ) (q : Fin d → ℝ≥0∞) :
    (c.comapDomain Fin.val Fin.val_injective.injOn).prod (fun j n => q j ^ n) =
      c.prod (fun j n => (if h : j < d then q ⟨j, h⟩ else 1) ^ n) := by
  unfold Finsupp.prod
  rw [Finsupp.comapDomain_support]
  rw [← Finset.prod_preimage Fin.val c.support Fin.val_injective.injOn
    (fun j => (if h : j < d then q ⟨j, h⟩ else 1) ^ c j)]
  · refine Finset.prod_congr rfl fun j _ => ?_
    simp
  · intro j _ hj
    have : ¬ j < d := fun h => hj ⟨⟨j, h⟩, rfl⟩
    simp [this]

/-- **Display (3.2)** (paper.tex:945-951): `f^d_k(q) = f_k(q_1, …, q_d, 1, 1, …)`. -/
theorem genFun_truncate (μ : ℕ → PMF (ℕ →₀ ℕ)) (d : ℕ) (q : Fin d → ℝ≥0∞) (k : Fin d) :
    genFun (truncate μ d) q k = genFun μ (fun j => if h : j < d then q ⟨j, h⟩ else 1) k := by
  unfold genFun truncate
  rw [← PMF.toMeasure_map _ _ (Measurable.of_discrete), lintegral_map (Measurable.of_discrete)
    (Measurable.of_discrete)]
  simp_rw [prod_comapDomain_val]

/-- **Display (3.2) in log coordinates** (ERRATA E4: the tail coordinates are `0`, so that
`e^0 = 1`): `g^d_k(x) = g_k(x_1, …, x_d, 0, 0, …)`. -/
theorem logGenFun_truncate (μ : ℕ → PMF (ℕ →₀ ℕ)) (d : ℕ) (x : Fin d → EReal) (k : Fin d) :
    logGenFun (truncate μ d) x k =
      logGenFun μ (fun j => if h : j < d then x ⟨j, h⟩ else 0) k := by
  unfold logGenFun
  rw [genFun_truncate]
  congr 2
  funext j
  by_cases h : j < d <;> simp [h]

/-- One step of truncation monotonicity on `[1,∞]^d`: `f^{d'}_k(q|_{d'}) ≤ f^d_k(q)` for
`d' ≤ d`. -/
theorem genFun_truncate_le (μ : ℕ → PMF (ℕ →₀ ℕ)) {d d' : ℕ} (hdd : d' ≤ d)
    (q : Fin d → ℝ≥0∞) (hq : ∀ j, 1 ≤ q j) (k : Fin d') :
    genFun (truncate μ d') (fun j => q (Fin.castLE hdd j)) k ≤
      genFun (truncate μ d) q (Fin.castLE hdd k) := by
  rw [genFun_truncate, genFun_truncate]
  refine genFun_mono μ (fun j => ?_) _
  dsimp only
  by_cases h1 : j < d'
  · have h2 : j < d := lt_of_lt_of_le h1 hdd
    simp [h1, h2]
  · by_cases h2 : j < d
    · simp only [h1, h2, dite_false, dite_true]
      exact hq _
    · simp [h1, h2]

/-- Truncation monotonicity of iterates on `[1,∞]^d` (`lem-fixed-limsup#truncation-monotone`,
paper.tex:1010-1018). -/
theorem genFun_truncate_iterate_le (μ : ℕ → PMF (ℕ →₀ ℕ)) {d d' : ℕ} (hdd : d' ≤ d) (n : ℕ)
    (q : Fin d → ℝ≥0∞) (hq : ∀ j, 1 ≤ q j) (k : Fin d') :
    (genFun (truncate μ d'))^[n] (fun j => q (Fin.castLE hdd j)) k ≤
      (genFun (truncate μ d))^[n] q (Fin.castLE hdd k) := by
  induction n generalizing q k with
  | zero => exact le_rfl
  | succ n ih =>
    rw [Function.iterate_succ_apply, Function.iterate_succ_apply]
    have hq' : ∀ j, 1 ≤ genFun (truncate μ d) q j := fun j => by
      have h := genFun_mono (truncate μ d) (show (1 : Fin d → ℝ≥0∞) ≤ q from hq) j
      rwa [genFun_one] at h
    calc (genFun (truncate μ d'))^[n]
          (genFun (truncate μ d') (fun j => q (Fin.castLE hdd j))) k
        ≤ (genFun (truncate μ d'))^[n] (fun j => genFun (truncate μ d) q (Fin.castLE hdd j)) k :=
          (genFun_mono (truncate μ d')).iterate n
            (fun j => genFun_truncate_le μ hdd q hq j) k
      _ ≤ _ := ih (genFun (truncate μ d) q) hq' k

end Conjugate

end
