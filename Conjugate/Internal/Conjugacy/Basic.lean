/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.PathLaw
import Conjugate.Internal.Foundations.PathLaw
import Conjugate.Internal.Foundations.StepKernel
import Mathlib.MeasureTheory.Integral.Lebesgue.Countable

/-!
# Elementary helpers for the equivalence of conjugates and fixed points

* `genFun_eq_tsum`: `f_k(q) = ∑_c μ_k(c) ∏_j q_j^{c_j}`;
* `inv_prod_pow`: `(∏_j a_j^{c_j})⁻¹ = ∏_j (a_j⁻¹)^{c_j}` for finite `a_j`;
* `pathLaw_cylinder_one`: the probability that the process started from one individual of type
  `k` has first generation `c` is `μ_k(c)`, as a statement about a cylinder set of length `1`.

The helpers live in the namespace `Conjugate.Conjugacy`.
-/

public section

open MeasureTheory ProbabilityTheory

open scoped ENNReal

namespace Conjugate.Conjugacy

variable {ι : Type*} [Countable ι]

/-- `f_k(q) = ∑_c μ_k(c) ∏_j q_j^{c_j}`. -/
lemma genFun_eq_tsum (μ : ι → PMF (ι →₀ ℕ)) (q : ι → ℝ≥0∞) (k : ι) :
    genFun μ q k = ∑' c : ι →₀ ℕ, μ k c * c.prod fun j n => q j ^ n := by
  rw [genFun, lintegral_countable']
  simp_rw [PMF.toMeasure_apply_singleton _ _ (measurableSet_singleton _)]
  exact tsum_congr fun c => mul_comm _ _

omit [Countable ι] in
/-- The inverse of `∏_j a_j^{c_j}` is `∏_j (a_j⁻¹)^{c_j}`, for finite `a_j`. -/
lemma inv_prod_pow {a : ι → ℝ≥0∞} (htop : ∀ k, a k ≠ ∞) (c : ι →₀ ℕ) :
    (c.prod fun j n => a j ^ n)⁻¹ = c.prod fun j n => (a j)⁻¹ ^ n := by
  rw [Finsupp.prod, Finsupp.prod,
    ENNReal.prod_inv_distrib (fun i _ j _ _ => Or.inr (ENNReal.pow_ne_top (htop j)))]
  exact Finset.prod_congr rfl fun k _ => ENNReal.inv_pow

/-- The cylinder fixing the first generation of the process started from one individual of
type `k` to be `c` has probability `μ_k(c)`. -/
lemma pathLaw_cylinder_one (ν : ι → PMF (ι →₀ ℕ)) (k : ι) (c : ι →₀ ℕ) :
    pathLaw ν (Finsupp.single k 1)
      {ω | ∀ i ≤ 1, ω i = if i = 0 then Finsupp.single k 1 else c} = ν k c := by
  have h := pathLaw_cylinder ν (Finsupp.single k 1) 1
    (fun i => if i = 0 then Finsupp.single k 1 else c)
  simp only [Finset.range_one, Finset.prod_singleton] at h
  rw [h]
  simp [stepKernel_single, PMF.toMeasure_apply_singleton _ _ (measurableSet_singleton _)]

end Conjugate.Conjugacy

end
