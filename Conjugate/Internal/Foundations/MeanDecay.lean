/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.IsSubcritical
public import Conjugate.Frozen.Defs.MeanMatrix
import Mathlib.Analysis.Matrix.Normed
import Mathlib.Analysis.Normed.Algebra.GelfandFormula
import Mathlib.Analysis.Normed.Algebra.GelfandRadius
import Mathlib.Topology.Algebra.InfiniteSum.ENNReal

/-!
# Decay of the powers of a subcritical mean matrix

For a subcritical mean matrix `M` (all entries finite, spectral radius `< 1`) this file proves

* `tendsto_meanMatrix_pow`: every entry of `Mⁿ` tends to `0`;
* `exists_meanMatrix_superharmonic`: the Neumann series `v = ∑ₙ Mⁿ 𝟙` converges and satisfies
  `M v + 𝟙 = v`.

This is used instead of the Perron–Frobenius theorem (`PLAN.md` §6). The analytic input is
Gelfand's formula for the `L^∞` operator norm on `Matrix ι ι ℂ`: it gives
`‖Mⁿ‖ ≤ C rⁿ` with `r < 1`, and entries are bounded by the norm.
-/

public section

open Filter Topology

open scoped ENNReal NNReal

namespace Conjugate

section Core

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

open scoped Matrix.Norms.Operator in
/-- Every entry of a complex matrix is bounded by its `L^∞` operator norm. -/
private lemma norm_entry_le_linfty (A : Matrix ι ι ℂ) (k j : ι) : ‖A k j‖ ≤ ‖A‖ := by
  rw [← coe_nnnorm, ← coe_nnnorm, NNReal.coe_le_coe, Matrix.linfty_opNNNorm_def]
  exact le_trans (Finset.single_le_sum (f := fun j => ‖A k j‖₊) (fun _ _ => bot_le)
    (Finset.mem_univ j)) (Finset.le_sup (f := fun i => ∑ j, ‖A i j‖₊) (Finset.mem_univ k))

open scoped Matrix.Norms.Operator in
/-- Geometric bound on the entries of the powers of a complex matrix of spectral radius `< 1`
(Gelfand's formula). -/
private lemma exists_norm_entry_pow_le (A : Matrix ι ι ℂ) (hA : spectralRadius ℂ A < 1) :
    ∃ C r : ℝ, 0 < C ∧ 0 ≤ r ∧ r < 1 ∧ ∀ n k j, ‖(A ^ n) k j‖ ≤ C * r ^ n := by
  rw [spectrum.spectralRadius_eq_gelfandRadius] at hA
  have hg : gelfandRadius A < 1 := ENNReal.ofReal_lt_one.1 hA
  have hg0 := gelfandRadius_nonneg A
  obtain ⟨C, hC, h⟩ := norm_pow_le_mul_pow_of_gelfandRadius_lt A
    (r := (gelfandRadius A + 1) / 2) (by linarith)
  exact ⟨C, (gelfandRadius A + 1) / 2, hC, by linarith, by linarith,
    fun n k j => (norm_entry_le_linfty _ k j).trans (h n)⟩

/-- Geometric bound on the entries of the powers of a nonnegative matrix whose complexification
has spectral radius `< 1`. -/
lemma exists_entry_pow_le (N : Matrix ι ι ℝ≥0)
    (hρ : spectralRadius ℂ (N.map fun a => ((a : ℝ) : ℂ)) < 1) :
    ∃ C r : ℝ, 0 < C ∧ 0 ≤ r ∧ r < 1 ∧ ∀ n k j, (((N ^ n) k j : ℝ≥0) : ℝ) ≤ C * r ^ n := by
  obtain ⟨C, r, hC, hr0, hr1, h⟩ := exists_norm_entry_pow_le _ hρ
  refine ⟨C, r, hC, hr0, hr1, fun n k j => ?_⟩
  let φ : ℝ≥0 →+* ℂ := Complex.ofRealHom.comp NNReal.toRealHom
  have hA : N.map (fun a => ((a : ℝ) : ℂ)) = φ.mapMatrix N := rfl
  have hpow : (N.map (fun a => ((a : ℝ) : ℂ))) ^ n = φ.mapMatrix (N ^ n) := by
    rw [hA, map_pow]
  have := h n k j
  rw [hpow] at this
  simpa [φ] using this

end Core

section Entries

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- A matrix of finite extended nonnegative reals is the image of a nonnegative real matrix, and
this is compatible with powers. -/
lemma pow_apply_eq_coe (M : Matrix ι ι ℝ≥0∞) (hfin : ∀ k j, M k j ≠ ∞) (n : ℕ) (k j : ι) :
    (M ^ n) k j = (((M.map ENNReal.toNNReal) ^ n) k j : ℝ≥0) := by
  have hM : M = ENNReal.ofNNRealHom.mapMatrix (M.map ENNReal.toNNReal) := by
    ext k j
    exact (ENNReal.coe_toNNReal (hfin k j)).symm
  conv_lhs => rw [hM, ← map_pow]
  rfl

omit [Fintype ι] [DecidableEq ι] in
/-- The complexification of the nonnegative real matrix underlying a finite `ℝ≥0∞`-matrix. -/
lemma map_toNNReal_complex (M : Matrix ι ι ℝ≥0∞) :
    (M.map ENNReal.toNNReal).map (fun a => ((a : ℝ) : ℂ)) =
      M.map fun x => ((x.toReal : ℝ) : ℂ) := by
  ext k j
  rfl

/-- The entries of the powers of a subcritical matrix decay geometrically. -/
lemma exists_pow_apply_le (M : Matrix ι ι ℝ≥0∞) (hfin : ∀ k j, M k j ≠ ∞)
    (hρ : spectralRadius ℂ (M.map fun x => ((x.toReal : ℝ) : ℂ)) < 1) :
    ∃ C r : ℝ, 0 < C ∧ 0 ≤ r ∧ r < 1 ∧ ∀ n k j, (((M ^ n) k j).toReal) ≤ C * r ^ n := by
  rw [← map_toNNReal_complex] at hρ
  obtain ⟨C, r, hC, hr0, hr1, h⟩ := exists_entry_pow_le _ hρ
  refine ⟨C, r, hC, hr0, hr1, fun n k j => ?_⟩
  rw [pow_apply_eq_coe M hfin, ENNReal.coe_toReal]
  exact h n k j

/-- Every entry of the powers of a subcritical matrix tends to `0`. -/
lemma tendsto_pow_apply_of_spectralRadius_lt_one (M : Matrix ι ι ℝ≥0∞)
    (hfin : ∀ k j, M k j ≠ ∞)
    (hρ : spectralRadius ℂ (M.map fun x => ((x.toReal : ℝ) : ℂ)) < 1) (k j : ι) :
    Tendsto (fun n => (M ^ n) k j) atTop (𝓝 0) := by
  obtain ⟨C, r, hC, hr0, hr1, h⟩ := exists_pow_apply_le M hfin hρ
  have hfinpow : ∀ n, (M ^ n) k j ≠ ∞ := fun n => by
    rw [pow_apply_eq_coe M hfin]
    exact ENNReal.coe_ne_top
  have hreal : Tendsto (fun n => ((M ^ n) k j).toReal) atTop (𝓝 0) := by
    refine squeeze_zero (fun n => ENNReal.toReal_nonneg) (fun n => h n k j) ?_
    simpa using (tendsto_const_nhds (x := C)).mul (tendsto_pow_atTop_nhds_zero_of_lt_one hr0 hr1)
  exact (ENNReal.tendsto_toReal_iff hfinpow ENNReal.zero_ne_top).1 hreal

/-- The sum of the entries `(Mⁿ)_{kj}` over `n` is finite for a subcritical matrix. -/
lemma tsum_pow_apply_ne_top (M : Matrix ι ι ℝ≥0∞) (hfin : ∀ k j, M k j ≠ ∞)
    (hρ : spectralRadius ℂ (M.map fun x => ((x.toReal : ℝ) : ℂ)) < 1) (k j : ι) :
    ∑' n, (M ^ n) k j ≠ ∞ := by
  obtain ⟨C, r, hC, hr0, hr1, h⟩ := exists_pow_apply_le M hfin hρ
  have hsumNN : Summable fun n => (((M.map ENNReal.toNNReal) ^ n) k j : ℝ≥0) := by
    rw [← NNReal.summable_coe]
    refine Summable.of_nonneg_of_le (fun n => NNReal.coe_nonneg _) (fun n => ?_)
      ((summable_geometric_of_lt_one hr0 hr1).mul_left C)
    have := h n k j
    rwa [pow_apply_eq_coe M hfin, ENNReal.coe_toReal] at this
  simp_rw [pow_apply_eq_coe M hfin]
  exact ENNReal.tsum_coe_ne_top_iff_summable.2 hsumNN

end Entries

section Neumann

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

omit [DecidableEq ι] in
/-- The Neumann series `v = ∑ₙ Mⁿ 𝟙` of a subcritical matrix is finite, and it solves
`M v + 𝟙 = v`. -/
lemma exists_superharmonic (M : Matrix ι ι ℝ≥0∞) (hfin : ∀ k j, M k j ≠ ∞)
    (hρ : spectralRadius ℂ (M.map fun x => ((x.toReal : ℝ) : ℂ)) < 1) :
    ∃ v : ι → ℝ≥0∞, (∀ k, 1 ≤ v k ∧ v k < ∞) ∧ ∀ k, (∑ j, M k j * v j) + 1 = v k := by
  classical
  have hid : ∀ k, (∑ j, M k j * ∑' n, ∑ i, (M ^ n) j i) = ∑' n, ∑ i, (M ^ (n + 1)) k i := by
    intro k
    simp_rw [← ENNReal.tsum_mul_left]
    rw [← Summable.tsum_finsetSum (fun _ _ => CompleteLattice.summable)]
    refine tsum_congr fun n => ?_
    simp_rw [Finset.mul_sum]
    rw [Finset.sum_comm]
    refine Finset.sum_congr rfl fun i _ => ?_
    rw [pow_succ', Matrix.mul_apply]
  have hsuper : ∀ k, (∑ j, M k j * ∑' n, ∑ i, (M ^ n) j i) + 1 = ∑' n, ∑ i, (M ^ n) k i := by
    intro k
    rw [hid k, tsum_eq_zero_add' (f := fun n => ∑ i, (M ^ n) k i) CompleteLattice.summable,
      add_comm]
    simp [Matrix.one_apply]
  refine ⟨fun k => ∑' n, ∑ i, (M ^ n) k i, fun k => ⟨?_, ?_⟩, hsuper⟩
  · exact le_add_self.trans_eq (hsuper k)
  · have h1 : ∑' n, ∑ i, (M ^ n) k i = ∑ i, ∑' n, (M ^ n) k i :=
      Summable.tsum_finsetSum fun _ _ => CompleteLattice.summable
    exact h1.trans_lt (ENNReal.sum_lt_top.2 fun i _ =>
      (tsum_pow_apply_ne_top M hfin hρ k i).lt_top)

end Neumann

section Public

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- **Decay of the mean matrix powers**: for a subcritical process every entry of `Mⁿ` tends
to `0` as `n → ∞`. -/
theorem tendsto_meanMatrix_pow (μ : ι → PMF (ι →₀ ℕ)) (hμ : IsSubcritical μ) (k j : ι) :
    Tendsto (fun n => (meanMatrix μ ^ n) k j) atTop (𝓝 0) :=
  tendsto_pow_apply_of_spectralRadius_lt_one (meanMatrix μ) hμ.1 hμ.2 k j

/-- **The Neumann-series vector** of a subcritical mean matrix: there is a finite vector `v ≥ 1`
with `M v + 𝟙 = v`. -/
theorem exists_meanMatrix_superharmonic (μ : ι → PMF (ι →₀ ℕ)) (hμ : IsSubcritical μ) :
    ∃ v : ι → ℝ≥0∞, (∀ k, 1 ≤ v k ∧ v k < ∞) ∧ ∀ k, (∑ j, meanMatrix μ k j * v j) + 1 = v k :=
  exists_superharmonic (meanMatrix μ) hμ.1 hμ.2

end Public

end Conjugate

end
