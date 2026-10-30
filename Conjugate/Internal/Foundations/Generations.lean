/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.MeanMatrix
public import Conjugate.Internal.Foundations.PathLaw
public import Conjugate.Internal.Foundations.StepKernel
import Mathlib.Data.Matrix.Mul

/-!
# The generation-`n` formulas

* `lintegral_pathLaw_prod`: display (1.2), paper.tex:209-213, the generating function of the
  `n`-th generation of the branching process started from `x` is
  `∏_k (f^{(n)}(q))_k ^ {x_k}` (with the product over the types `k` present in `x`, ERRATA E2);
* `lintegral_pathLaw_apply`: paper.tex:219-220, the mean number of type-`j` individuals in
  generation `n` of the process started from one individual of type `k` is `(Mⁿ)_{k,j}`;
* `lintegral_pathLaw_apply_vecMul`: the same for a general starting population `x`, namely the
  row vector `x` times `Mⁿ`.

The proofs go by induction on `n`, via the Markov property
`lintegral_pathLaw_succ` and the one-step formulas of `Conjugate.Internal.Foundations.StepKernel`.
-/

public section

open MeasureTheory ProbabilityTheory

open scoped ENNReal

namespace Conjugate

section Markov

variable {ι : Type*} [Countable ι]

/-- The Markov property at the level of integrals: the expectation of a function of the
generation `n + 1` is the expectation of the one-step expectation from generation `n`. -/
lemma lintegral_pathLaw_succ (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) (n : ℕ)
    (F : (ι →₀ ℕ) → ℝ≥0∞) :
    ∫⁻ ω, F (ω (n + 1)) ∂(pathLaw μ x) =
      ∫⁻ ω, ∫⁻ y, F y ∂(stepKernel μ (ω n)) ∂(pathLaw μ x) := by
  have hF : Measurable fun p : (ι →₀ ℕ) × (ι →₀ ℕ) => F p.2 :=
    (Measurable.of_discrete (f := F)).comp measurable_snd
  have h1 : ∫⁻ ω, F (ω (n + 1)) ∂(pathLaw μ x) =
      ∫⁻ p, F p.2 ∂((pathLaw μ x).map fun ω => (ω n, ω (n + 1))) :=
    (lintegral_map (f := fun p : (ι →₀ ℕ) × (ι →₀ ℕ) => F p.2)
      (g := fun ω : ℕ → ι →₀ ℕ => (ω n, ω (n + 1))) hF
      ((measurable_pi_apply n).prodMk (measurable_pi_apply (n + 1)))).symm
  rw [h1, pathLaw_map_eval_succ, Measure.lintegral_compProd hF,
    lintegral_map (Measurable.of_discrete (f := fun a => ∫⁻ y, F y ∂(stepKernel μ a)))
    (measurable_pi_apply n)]

/-- The generation `0` of the process started from `x` is `x`. -/
lemma lintegral_pathLaw_zero (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) (F : (ι →₀ ℕ) → ℝ≥0∞) :
    ∫⁻ ω, F (ω 0) ∂(pathLaw μ x) = F x := by
  rw [← lintegral_map (Measurable.of_discrete (f := F)) (measurable_pi_apply 0),
    pathLaw_map_eval_zero, lintegral_dirac' _ Measurable.of_discrete]

/-- **Display (1.2)** (paper.tex:209-213, with ERRATA E2: the product runs over the types in
the support of `x`): `𝔼_x[∏_j q_j^{X_j(n)}] = ∏_k (f^{(n)}(q)_k)^{x_k}`. -/
theorem lintegral_pathLaw_prod (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) (n : ℕ) (q : ι → ℝ≥0∞) :
    ∫⁻ ω, (ω n).prod (fun j m => q j ^ m) ∂(pathLaw μ x) =
      x.prod fun k m => (genFun μ)^[n] q k ^ m := by
  induction n generalizing q with
  | zero =>
    exact lintegral_pathLaw_zero μ x (fun a => a.prod fun j m => q j ^ m)
  | succ n ih =>
    rw [lintegral_pathLaw_succ μ x n (fun y => y.prod fun j m => q j ^ m)]
    simp_rw [lintegral_stepKernel_prod]
    rw [ih (genFun μ q), Function.iterate_succ_apply]

end Markov

section Mean

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

omit [DecidableEq ι] in
/-- Linearity of the expectation for a combination of the coordinates of generation `n`. -/
lemma lintegral_pathLaw_sum_mul (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) (n : ℕ) (A : ι → ℝ≥0∞) :
    ∫⁻ ω, ∑ k, (ω n k : ℝ≥0∞) * A k ∂(pathLaw μ x) =
      ∑ k, (∫⁻ ω, (ω n k : ℝ≥0∞) ∂(pathLaw μ x)) * A k := by
  rw [lintegral_finsetSum (f := fun (k : ι) (ω : ℕ → ι →₀ ℕ) => (ω n k : ℝ≥0∞) * A k) _
    (fun k _ => (Measurable.of_discrete (f := fun c : ι →₀ ℕ =>
      (c k : ℝ≥0∞) * A k)).comp (measurable_pi_apply n))]
  refine Finset.sum_congr rfl fun k _ => ?_
  exact lintegral_mul_const _ ((Measurable.of_discrete (f := fun c : ι →₀ ℕ =>
    (c k : ℝ≥0∞))).comp (measurable_pi_apply n))

/-- The mean number of type-`j` individuals in generation `n` of the process started from the
population `x` is the `j`-th coordinate of the row vector `x` times `Mⁿ`. -/
theorem lintegral_pathLaw_apply_vecMul (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) (n : ℕ) (j : ι) :
    ∫⁻ ω, (ω n j : ℝ≥0∞) ∂(pathLaw μ x) =
      Matrix.vecMul (fun k => (x k : ℝ≥0∞)) (meanMatrix μ ^ n) j := by
  induction n generalizing j with
  | zero => simpa using lintegral_pathLaw_zero μ x (fun a => (a j : ℝ≥0∞))
  | succ n ih =>
    rw [lintegral_pathLaw_succ μ x n (fun y => (y j : ℝ≥0∞))]
    simp_rw [lintegral_stepKernel_apply]
    have hsum : ∀ a : ι →₀ ℕ, (a.sum fun k m => (m : ℝ≥0∞) * meanMatrix μ k j) =
        ∑ k, (a k : ℝ≥0∞) * meanMatrix μ k j :=
      fun a => Finsupp.sum_fintype _ _ (fun k => by simp)
    simp_rw [hsum]
    have h := lintegral_pathLaw_sum_mul μ x n (fun k => meanMatrix μ k j)
    beta_reduce at h
    rw [h]
    simp_rw [ih]
    rw [pow_succ, ← Matrix.vecMul_vecMul]
    rfl

end Mean

/-- **Mean matrix powers** (paper.tex:219-220): `𝔼_k[X_j(n)] = (Mⁿ)_{k,j}`. -/
theorem lintegral_pathLaw_apply {ι : Type*} [Fintype ι] [DecidableEq ι]
    (μ : ι → PMF (ι →₀ ℕ)) (k j : ι) (n : ℕ) :
    ∫⁻ ω, (ω n j : ℝ≥0∞) ∂(pathLaw μ (Finsupp.single k 1)) = (meanMatrix μ ^ n) k j := by
  rw [lintegral_pathLaw_apply_vecMul]
  simp [Matrix.vecMul, dotProduct, Finsupp.single_apply]

end Conjugate

end
