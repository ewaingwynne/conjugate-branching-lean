/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Infrastructure.StepKernel
public import Mathlib.Probability.Kernel.IonescuTulcea.Traj

/-!
# The law of a branching process
-/

@[expose] public section

open MeasureTheory ProbabilityTheory

namespace Conjugate

/-- **The law of a branching process started from a population** (paper.tex:176-177).

`pathLaw μ x` is the law on trajectories `ω : ℕ → (ι →₀ ℕ)` of the generation process
`X = (X(n))_{n ∈ ℕ₀}`, `X(n) = ω n`, of the branching process with offspring laws `μ`,
started from `X(0) = x`: the Markov chain whose transition from `X(n)` to `X(n+1)` is
`stepKernel μ`. The paper's `ℙ_k` (start from a single individual of type `k`) is
`pathLaw μ (Finsupp.single k 1)`, and `𝔼_k` is integration against it. -/
noncomputable def pathLaw {ι : Type*} [Countable ι] (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) :
    Measure (ℕ → ι →₀ ℕ) :=
  Kernel.trajMeasure (X := fun _ => ι →₀ ℕ) (Measure.dirac x) fun n =>
    (stepKernel μ).comap
      (fun ω : (Π _ : Finset.Iic n, ι →₀ ℕ) => ω ⟨n, Finset.mem_Iic.2 le_rfl⟩)
      (measurable_pi_apply _)

end Conjugate

end
