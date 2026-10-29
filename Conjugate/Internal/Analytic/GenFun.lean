/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.PathLaw
import Conjugate.Internal.Foundations.Generations

/-!
# Elementary facts about the generating function `f`

* `genFun_mono`: `f` is monotone (coordinatewise);
* `genFun_one`: `f(1) = 1`;
* `genFun_iterate_eq`: display (2.5) of paper.tex:540 in its `f`-form,
  `f^{(n)}(q)_k = 𝔼_k[∏_j q_j^{X_j(n)}]`, which is `lintegral_pathLaw_prod` for the start
  population `δ_k`.
-/

public section

open MeasureTheory ProbabilityTheory

open scoped ENNReal

namespace Conjugate

variable {ι : Type*} [Countable ι]

omit [Countable ι] in
/-- The generating function is monotone in `q`. -/
theorem genFun_mono (μ : ι → PMF (ι →₀ ℕ)) : Monotone (genFun μ) := by
  intro q r hqr k
  refine lintegral_mono fun c => ?_
  exact Finset.prod_le_prod fun j _ => pow_le_pow_left' (hqr j) _

omit [Countable ι] in
/-- `f(1) = 1`. -/
theorem genFun_one (μ : ι → PMF (ι →₀ ℕ)) : genFun μ 1 = 1 := by
  funext k
  simp [genFun]

/-- **Display (2.5)** (paper.tex:540): `f^{(n)}(q)_k = 𝔼_k[∏_j q_j^{X_j(n)}]`. -/
theorem genFun_iterate_eq (μ : ι → PMF (ι →₀ ℕ)) (n : ℕ) (q : ι → ℝ≥0∞) (k : ι) :
    (genFun μ)^[n] q k =
      ∫⁻ ω, (ω n).prod (fun j m => q j ^ m) ∂pathLaw μ (Finsupp.single k 1) := by
  rw [lintegral_pathLaw_prod μ (Finsupp.single k 1) n q,
    Finsupp.prod_single_index (by simp)]
  simp

end Conjugate

end
