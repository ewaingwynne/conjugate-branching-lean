/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.ExtinctionEvent
public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Internal.Foundations.Branching
public import Conjugate.Internal.Foundations.Extinction
public import Conjugate.Internal.Foundations.StepKernel

/-!
# The extinction probabilities are a fixed point of the generating function

`genFun_extinction`: for any countable type set, `q_k = ℙ_k[E]` satisfies `f(q) = q`.

We condition on the first generation. By the Chapman–Kolmogorov equation for the generation laws,
`ℙ_k[X(1 + m) = 0] = 𝔼_k[ℙ_{X(1)}[X(m) = 0]]`, where `X(1) ∼ μ_k`. Taking the supremum over `m`
(monotone convergence) gives `ℙ_k[E] = 𝔼_k[ℙ_{X(1)}[E]]`, and the extinction product formula
`ℙ_c[E] = ∏_j q_j^{c_j}` identifies the right-hand side with `f_k(q)`.
-/

public section

open MeasureTheory ProbabilityTheory

open scoped ENNReal

namespace Conjugate

variable {ι : Type*} [Countable ι]

/-- **The extinction probabilities are a fixed point of `f`** (any countable type set). -/
theorem genFun_extinction (μ : ι → PMF (ι →₀ ℕ)) :
    genFun μ (fun k => pathLaw μ (Finsupp.single k 1) (extinctionEvent ι)) =
      fun k => pathLaw μ (Finsupp.single k 1) (extinctionEvent ι) := by
  funext k
  set x : ι →₀ ℕ := Finsupp.single k 1 with hx
  -- the law of the first generation is the offspring law
  have h1 : (pathLaw μ x).map (fun ω => ω 1) = (μ k).toMeasure := by
    have h := pathLaw_map_eval_succ_bind μ x 0
    rw [pathLaw_map_eval_zero, Measure.dirac_bind Measurable.of_discrete, hx,
      stepKernel_single] at h
    exact h
  -- conditioning on the first generation, `m` further generations
  have hstep : ∀ m : ℕ, pathLaw μ x {ω | ω (m + 1) = 0} =
      ∫⁻ y, pathLaw μ y {ω | ω m = 0} ∂(μ k).toMeasure := by
    intro m
    have hmap : ∀ (z : ι →₀ ℕ) (m : ℕ), pathLaw μ z {ω | ω m = 0} =
        ((pathLaw μ z).map fun ω => ω m) {0} := fun z m => by
      rw [Measure.map_apply (measurable_pi_apply m) (measurableSet_singleton 0)]
      rfl
    rw [hmap, Nat.add_comm, pathLaw_map_eval_add_time,
      Measure.bind_apply (measurableSet_singleton 0) Measurable.of_discrete.aemeasurable, h1]
    exact lintegral_congr fun y => (hmap y m).symm
  calc genFun μ (fun k => pathLaw μ (Finsupp.single k 1) (extinctionEvent ι)) k
      = ∫⁻ y, pathLaw μ y (extinctionEvent ι) ∂(μ k).toMeasure := by
        rw [genFun]
        exact lintegral_congr fun y => (pathLaw_extinctionEvent_eq_prod μ y).symm
    _ = ∫⁻ y, ⨆ m, pathLaw μ y {ω | ω m = 0} ∂(μ k).toMeasure := by
        simp_rw [pathLaw_extinctionEvent_eq_iSup]
    _ = ⨆ m, ∫⁻ y, pathLaw μ y {ω | ω m = 0} ∂(μ k).toMeasure :=
        lintegral_iSup (fun m => Measurable.of_discrete) fun m n hmn y =>
          pathLaw_eval_eq_zero_mono μ y hmn
    _ = ⨆ m, pathLaw μ x {ω | ω (m + 1) = 0} := by simp_rw [hstep]
    _ = ⨆ m, pathLaw μ x {ω | ω m = 0} :=
        (pathLaw_eval_eq_zero_mono μ x).iSup_nat_add 1
    _ = pathLaw μ x (extinctionEvent ι) := (pathLaw_extinctionEvent_eq_iSup μ x).symm

end Conjugate

end
