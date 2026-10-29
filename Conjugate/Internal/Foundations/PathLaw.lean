/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.PathLaw
public import Conjugate.Infrastructure.Population

/-!
# Finite-dimensional distributions of `pathLaw`

`pathLaw μ x` is the law of the generation process `X = (X(n))_n` of the branching process
with offspring laws `μ`, started from the population `x`: the Markov chain with transition
kernel `stepKernel μ`. This file proves that it is indeed that Markov chain:

* `pathLaw_map_eval_zero`: `X(0) = x`;
* `pathLaw_map_eval_succ`: the joint law of `(X(n), X(n+1))` is the law of `X(n)` composed
  with the kernel `stepKernel μ`;
* `pathLaw_cylinder`: the finite-dimensional distributions, i.e. the measure of the event
  `{X(0) = y₀, …, X(n) = yₙ}` (the Markov part of the branching property, paper.tex:176-177).
-/

public section

open MeasureTheory ProbabilityTheory

open scoped ENNReal

namespace Conjugate

variable {ι : Type*} [Countable ι]

/-- The time-`n` transition kernel of `pathLaw μ x`: `stepKernel μ` applied to the position
at time `n` of the trajectory up to time `n`. -/
noncomputable abbrev pathKernel (μ : ι → PMF (ι →₀ ℕ)) (n : ℕ) :
    Kernel (Π _ : Finset.Iic n, ι →₀ ℕ) (ι →₀ ℕ) :=
  (stepKernel μ).comap
    (fun ω : (Π _ : Finset.Iic n, ι →₀ ℕ) => ω ⟨n, Finset.mem_Iic.2 le_rfl⟩)
    (measurable_pi_apply _)

lemma pathLaw_eq_trajMeasure (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) :
    pathLaw μ x =
      Kernel.trajMeasure (X := fun _ => ι →₀ ℕ) (Measure.dirac x) (pathKernel μ) := rfl

instance isProbabilityMeasure_pathLaw (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) :
    IsProbabilityMeasure (pathLaw μ x) := by
  rw [pathLaw_eq_trajMeasure]
  infer_instance

lemma pathKernel_apply (μ : ι → PMF (ι →₀ ℕ)) (n : ℕ) (u : Π _ : Finset.Iic n, ι →₀ ℕ) :
    pathKernel μ n u = stepKernel μ (u ⟨n, Finset.mem_Iic.2 le_rfl⟩) := rfl

/-- The joint law of the trajectory up to time `n` and the position at time `n + 1`. -/
lemma pathLaw_map_frestrictLe_compProd (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) (n : ℕ) :
    (pathLaw μ x).map (Preorder.frestrictLe n) ⊗ₘ pathKernel μ n =
      (pathLaw μ x).map fun ω => (Preorder.frestrictLe n ω, ω (n + 1)) :=
  Kernel.map_frestrictLe_trajMeasure_compProd_eq_map_trajMeasure
    (X := fun _ => ι →₀ ℕ) (κ := pathKernel μ) (μ₀ := Measure.dirac x) (a := n)

/-- Composing a kernel with a measurable map of its source commutes with the composition
product. -/
lemma map_prodMap_compProd_comap {α β γ : Type*} [MeasurableSpace α] [MeasurableSpace β]
    [MeasurableSpace γ] (ν : Measure α) [SFinite ν] (f : α → β) (hf : Measurable f)
    (κ : Kernel β γ) [IsSFiniteKernel κ] :
    (ν ⊗ₘ κ.comap f hf).map (Prod.map f id) = ν.map f ⊗ₘ κ := by
  ext s hs
  have hm : Measurable (Prod.map f (id : γ → γ)) := hf.prodMap measurable_id
  rw [Measure.map_apply hm hs, Measure.compProd_apply (hm hs), Measure.compProd_apply hs,
    lintegral_map (Kernel.measurable_kernel_prodMk_left hs) hf]
  rfl

/-- The generation `0` of the process started from `x` is `x`. -/
theorem pathLaw_map_eval_zero (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) :
    (pathLaw μ x).map (fun ω => ω 0) = Measure.dirac x := by
  have h0 : (pathLaw μ x).map (Preorder.frestrictLe 0) =
      (Measure.dirac x).map (MeasurableEquiv.piUnique fun _ : Finset.Iic 0 => ι →₀ ℕ).symm := by
    rw [pathLaw_eq_trajMeasure, Kernel.trajMeasure, Measure.map_comp _ _ (by fun_prop),
      Kernel.traj_map_frestrictLe, Kernel.partialTraj_self, Measure.id_comp]
  have he : (fun ω : ℕ → ι →₀ ℕ => ω 0) =
      (fun u : Π _ : Finset.Iic 0, ι →₀ ℕ => u ⟨0, Finset.mem_Iic.2 le_rfl⟩) ∘
        Preorder.frestrictLe 0 := rfl
  rw [he, ← Measure.map_map (measurable_pi_apply _) (by fun_prop), h0,
    Measure.map_dirac' (by fun_prop), Measure.map_dirac' (by fun_prop)]
  rfl

/-- The Markov property: the joint law of `(X(n), X(n+1))` is the law of `X(n)` composed with
the one-step kernel. -/
theorem pathLaw_map_eval_succ (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) (n : ℕ) :
    (pathLaw μ x).map (fun ω => (ω n, ω (n + 1))) =
      ((pathLaw μ x).map fun ω => ω n) ⊗ₘ stepKernel μ := by
  have h := congrArg (Measure.map (Prod.map
    (fun u : Π _ : Finset.Iic n, ι →₀ ℕ => u ⟨n, Finset.mem_Iic.2 le_rfl⟩) (id : (ι →₀ ℕ) → _)))
    (pathLaw_map_frestrictLe_compProd μ x n)
  rw [map_prodMap_compProd_comap, Measure.map_map (by fun_prop) (by fun_prop),
    Measure.map_map (by fun_prop) (by fun_prop)] at h
  exact h.symm

/-- The finite-dimensional distributions of the generation process:
`ℙ_x[X(0) = y₀, …, X(n) = yₙ] = 1_{x = y₀} ∏_{i<n} ℙ_{y_i}[X(1) = y_{i+1}]`. -/
theorem pathLaw_cylinder (μ : ι → PMF (ι →₀ ℕ)) (x : ι →₀ ℕ) (n : ℕ) (y : ℕ → ι →₀ ℕ) :
    pathLaw μ x {ω | ∀ i ≤ n, ω i = y i} =
      Measure.dirac x {y 0} * ∏ i ∈ Finset.range n, stepKernel μ (y i) {y (i + 1)} := by
  induction n with
  | zero =>
    have hset : {ω : ℕ → ι →₀ ℕ | ∀ i ≤ 0, ω i = y i} = (fun ω => ω 0) ⁻¹' {y 0} := by
      ext ω
      simp
    rw [hset, ← Measure.map_apply (measurable_pi_apply 0) (measurableSet_singleton _),
      pathLaw_map_eval_zero]
    simp
  | succ n ih =>
    set u₀ : Π _ : Finset.Iic n, ι →₀ ℕ := fun i => y i with hu₀
    have hset : {ω : ℕ → ι →₀ ℕ | ∀ i ≤ n + 1, ω i = y i} =
        (fun ω : ℕ → ι →₀ ℕ => (Preorder.frestrictLe n ω, ω (n + 1))) ⁻¹'
          ({u₀} ×ˢ {y (n + 1)}) := by
      ext ω
      simp only [Set.mem_ofPred_eq, Set.mem_preimage, Set.mem_prod, Set.mem_singleton_iff]
      constructor
      · intro h
        refine ⟨?_, h _ le_rfl⟩
        funext i
        exact h i (Nat.le_succ_of_le (Finset.mem_Iic.1 i.2))
      · rintro ⟨h1, h2⟩ i hi
        rcases Nat.le_succ_iff.1 hi with hi | rfl
        · exact congrFun h1 ⟨i, Finset.mem_Iic.2 hi⟩
        · exact h2
    have hcyl : (pathLaw μ x).map (Preorder.frestrictLe n) {u₀} =
        pathLaw μ x {ω | ∀ i ≤ n, ω i = y i} := by
      rw [Measure.map_apply (by fun_prop) (measurableSet_singleton _)]
      congr 1
      ext ω
      simp only [Set.mem_preimage, Set.mem_singleton_iff, Set.mem_ofPred_eq]
      constructor
      · intro h i hi
        exact congrFun h ⟨i, Finset.mem_Iic.2 hi⟩
      · intro h
        funext i
        exact h i (Finset.mem_Iic.1 i.2)
    rw [hset, ← Measure.map_apply (by fun_prop)
        ((measurableSet_singleton _).prod (measurableSet_singleton _)),
      ← pathLaw_map_frestrictLe_compProd, Measure.compProd_apply_prod
        (measurableSet_singleton _) (measurableSet_singleton _), lintegral_singleton, hcyl, ih,
      Finset.prod_range_succ, pathKernel_apply]
    ring

end Conjugate

end
