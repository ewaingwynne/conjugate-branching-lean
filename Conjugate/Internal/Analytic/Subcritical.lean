/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.IsSubcritical
import Mathlib.Analysis.Matrix.Normed
import Mathlib.Analysis.Normed.Algebra.Spectrum

/-!
# Two criteria for subcriticality

* `isSubcritical_of_sum_lt_one`: if every row sum of the mean matrix is `< 1`, the process is
  subcritical. The spectral radius is bounded by the norm, and the `L^∞` operator norm of a
  matrix is its maximal absolute row sum (`Matrix.linfty_opNNNorm_def`).
* `isSubcritical_fin_one_iff`: for a single type, subcriticality is `𝔼[X(1)] < 1`. For `⇒`,
  the spectrum of the `1 × 1` matrix `[z]` contains `z`, so the spectral radius is at least `‖z‖`.
-/

public section

open scoped ENNReal NNReal

namespace Conjugate

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

open scoped Matrix.Norms.Operator in
/-- **Row-sum criterion for subcriticality**: if `∑_j M_{kj} < 1` for every type `k`, then the
mean matrix has finite entries and spectral radius `< 1`. -/
theorem isSubcritical_of_sum_lt_one (μ : ι → PMF (ι →₀ ℕ))
    (h : ∀ k, ∑ j, meanMatrix μ k j < 1) : IsSubcritical μ := by
  have hfin : ∀ k j, meanMatrix μ k j ≠ ∞ := fun k j =>
    ((Finset.single_le_sum (f := fun j => meanMatrix μ k j) (fun _ _ => zero_le)
      (Finset.mem_univ j)).trans_lt ((h k).trans ENNReal.one_lt_top)).ne
  refine ⟨hfin, ?_⟩
  set A : Matrix ι ι ℂ := (meanMatrix μ).map fun x => ((x.toReal : ℝ) : ℂ) with hA
  refine lt_of_le_of_lt (spectralRadius_le_nnnorm (𝕜 := ℂ) A) ?_
  have hnorm : ‖A‖₊ < 1 := by
    rw [Matrix.linfty_opNNNorm_def]
    refine (Finset.sup_lt_iff (by simp)).2 fun k _ => ?_
    have hk : ((∑ j, ‖A k j‖₊ : ℝ≥0) : ℝ≥0∞) = ∑ j, meanMatrix μ k j := by
      push_cast
      refine Finset.sum_congr rfl fun j _ => ?_
      have : ‖A k j‖₊ = (meanMatrix μ k j).toNNReal := by
        ext
        simp [hA]
        rfl
      rw [this, ENNReal.coe_toNNReal (hfin k j)]
    have : ((∑ j, ‖A k j‖₊ : ℝ≥0) : ℝ≥0∞) < 1 := hk ▸ h k
    exact_mod_cast this
  exact_mod_cast hnorm

/-- **Single-type subcriticality**: a branching process with one type is subcritical exactly when
its mean offspring number is `< 1`. -/
theorem isSubcritical_fin_one_iff (μ : Fin 1 → PMF (Fin 1 →₀ ℕ)) :
    IsSubcritical μ ↔ meanMatrix μ 0 0 < 1 := by
  constructor
  · rintro ⟨hfin, hρ⟩
    set A : Matrix (Fin 1) (Fin 1) ℂ := (meanMatrix μ).map fun x => ((x.toReal : ℝ) : ℂ) with hA
    have hmem : A 0 0 ∈ spectrum ℂ A := by
      rw [spectrum.mem_iff]
      have h0 : algebraMap ℂ (Matrix (Fin 1) (Fin 1) ℂ) (A 0 0) - A = 0 := by
        ext i j
        fin_cases i
        fin_cases j
        simp [Matrix.algebraMap_eq_diagonal]
      rw [h0]
      exact not_isUnit_zero
    have hle : ((‖A 0 0‖₊ : ℝ≥0) : ℝ≥0∞) ≤ spectralRadius ℂ A :=
      le_iSup₂ (f := fun k (_ : k ∈ quasispectrum ℂ A) => ((‖k‖₊ : ℝ≥0) : ℝ≥0∞)) (A 0 0)
        (spectrum_subset_quasispectrum ℂ A hmem)
    have hlt : ((‖A 0 0‖₊ : ℝ≥0) : ℝ≥0∞) < 1 := hle.trans_lt hρ
    have hnn : ‖A 0 0‖₊ = (meanMatrix μ 0 0).toNNReal := by
      ext
      simp [hA]
      rfl
    rwa [hnn, ENNReal.coe_toNNReal (hfin 0 0)] at hlt
  · intro h
    refine isSubcritical_of_sum_lt_one μ fun k => ?_
    rwa [Fin.sum_univ_one, Subsingleton.elim k 0]

end Conjugate

end
