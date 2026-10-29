/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.IsSubcritical
public import Conjugate.Frozen.Defs.LogGenFun
import Conjugate.Infrastructure.Population
import Conjugate.Internal.Analytic.GenFun
import Conjugate.Internal.Foundations.MeanDecay
import Mathlib.Analysis.SpecialFunctions.Log.ENNRealLogExp
import Mathlib.MeasureTheory.Integral.Lebesgue.DominatedConvergence
import Mathlib.Topology.Instances.ENNReal.Lemmas

/-!
# A point strictly below its image under `f` (Lemma 2.5)

Lemma 2.5 (paper.tex:500-527): under subcriticality and Hypothesis III there is
`q⁰ ∈ (1,∞)^d` with `f_k(q⁰) < q⁰_k` for every `k`.

The paper uses the Perron–Frobenius eigenvector and a Taylor expansion. Here:

* the Neumann-series vector `v ≥ 𝟙` with `M v + 𝟙 = v` (`exists_meanMatrix_superharmonic`)
  replaces the eigenvector, so `(M v)_k = v_k - 1 < v_k`;
* every monomial `∏_j (1 + ε a_j)^{c_j}` is `1 + ε D(ε)` with `D` monotone, continuous and
  `D(0) = ∑_j c_j a_j` (`hasSlope_monomial`), so that `(f_k(𝟙 + ε v) - 1) / ε = ∫ D_c(ε) dμ_k`
  is monotone in `ε`; it converges to `(M v)_k` as `ε → 0` by dominated convergence, since
  `f` is finite at some `𝟙 + ε₀ v` (continuity at `𝟙`, Hypothesis III).

* `exists_genFun_lt_self`: Lemma 2.5;
* `exists_logGenFun_lt_self`: Lemma 2.5 in log coordinates (used in Lemma 2.15).
-/

public section

open MeasureTheory Filter Topology

open scoped ENNReal NNReal

namespace Conjugate

section Poly

/-- `F` is `1 + ε D(ε)` for a monotone continuous `D` with `D 0 = s`. -/
def HasSlope (F : ℝ≥0 → ℝ≥0) (s : ℝ≥0) : Prop :=
  ∃ D : ℝ≥0 → ℝ≥0, Monotone D ∧ Continuous D ∧ D 0 = s ∧ ∀ ε, F ε = 1 + ε * D ε

lemma hasSlope_one : HasSlope (fun _ => 1) 0 :=
  ⟨fun _ => 0, monotone_const, continuous_const, rfl, fun ε => by simp⟩

lemma hasSlope_mul {F G : ℝ≥0 → ℝ≥0} {s t : ℝ≥0} (hF : HasSlope F s) (hG : HasSlope G t) :
    HasSlope (fun ε => F ε * G ε) (s + t) := by
  obtain ⟨D, hDm, hDc, hD0, hD⟩ := hF
  obtain ⟨E, hEm, hEc, hE0, hE⟩ := hG
  refine ⟨fun ε => D ε + E ε + ε * D ε * E ε, ?_, ?_, ?_, ?_⟩
  · intro a b hab
    have h1 := hDm hab
    have h2 := hEm hab
    dsimp only
    gcongr
  · exact (hDc.add hEc).add ((continuous_id.mul hDc).mul hEc)
  · simp [hD0, hE0]
  · intro ε
    dsimp only
    rw [hD ε, hE ε]
    ring

lemma hasSlope_pow {F : ℝ≥0 → ℝ≥0} {s : ℝ≥0} (hF : HasSlope F s) (n : ℕ) :
    HasSlope (fun ε => F ε ^ n) (n * s) := by
  induction n with
  | zero => simpa using hasSlope_one
  | succ n ih =>
    have h := hasSlope_mul ih hF
    simp only [pow_succ]
    convert h using 1
    push_cast
    ring

lemma hasSlope_linear (a : ℝ≥0) : HasSlope (fun ε => 1 + ε * a) a :=
  ⟨fun _ => a, monotone_const, continuous_const, rfl, fun _ => rfl⟩

/-- **Every monomial `∏_j (1 + ε a_j)^{c_j}` is `1 + ε D(ε)`**, with `D` monotone and
continuous and `D(0) = ∑_j c_j a_j`. -/
lemma hasSlope_monomial {ι : Type*} [Fintype ι] (a : ι → ℝ≥0) (c : ι →₀ ℕ) :
    HasSlope (fun ε => c.prod fun j n => (1 + ε * a j) ^ n) (∑ j, (c j : ℝ≥0) * a j) := by
  induction c using Finsupp.induction_linear with
  | zero => simpa using hasSlope_one
  | add f g hf hg =>
    have h := hasSlope_mul hf hg
    convert h using 1
    · funext ε
      rw [Finsupp.prod_add_index' (fun _ => pow_zero _) (fun _ _ _ => pow_add _ _ _)]
    · simp only [Finsupp.add_apply, Nat.cast_add, add_mul, Finset.sum_add_distrib]
  | single j n =>
    classical
    have h := hasSlope_pow (hasSlope_linear (a j)) n
    convert h using 1
    · funext ε
      exact Finsupp.prod_single_index (pow_zero _)
    · simp [Finsupp.single_apply]

end Poly

section Lemma25

variable {d : ℕ}

/-- **Lemma 2.5** (paper.tex:500-527). -/
theorem exists_genFun_lt_self (μ : Fin d → PMF (Fin d →₀ ℕ)) (hI : IsSubcritical μ)
    (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j}) :
    ∃ q : Fin d → ℝ≥0∞, (∀ j, 1 < q j ∧ q j < ∞) ∧ ∀ k, genFun μ q k < q k := by
  obtain ⟨v, hv, hvfix⟩ := exists_meanMatrix_superharmonic μ hI
  have hvtop : ∀ j, v j ≠ ⊤ := fun j => (hv j).2.ne
  set a : Fin d → ℝ≥0 := fun j => (v j).toNNReal with ha
  have hva : ∀ j, (a j : ℝ≥0∞) = v j := fun j => ENNReal.coe_toNNReal (hvtop j)
  have hD : ∀ c : Fin d →₀ ℕ, ∃ D : ℝ≥0 → ℝ≥0, Monotone D ∧ Continuous D ∧
      D 0 = ∑ j, (c j : ℝ≥0) * a j ∧
      ∀ ε, (c.prod fun j n => (1 + ε * a j) ^ n) = 1 + ε * D ε :=
    fun c => hasSlope_monomial a c
  choose D hDm hDc hD0 hDe using hD
  set S : Fin d → ℝ≥0 → ℝ≥0∞ := fun k ε => ∫⁻ c, (D c ε : ℝ≥0∞) ∂(μ k).toMeasure with hS
  set q : ℝ≥0 → Fin d → ℝ≥0∞ := fun ε j => ((1 + ε * a j : ℝ≥0) : ℝ≥0∞) with hq
  -- `f_k(q ε) = 1 + ε S_k(ε)`
  have hgf : ∀ (ε : ℝ≥0) k, genFun μ (q ε) k = 1 + (ε : ℝ≥0∞) * S k ε := by
    intro ε k
    have h1 : ∀ c : Fin d →₀ ℕ, (c.prod fun j n => q ε j ^ n) =
        1 + (ε : ℝ≥0∞) * (D c ε : ℝ≥0∞) := by
      intro c
      have h2 : ((c.prod fun j n => (1 + ε * a j) ^ n : ℝ≥0) : ℝ≥0∞) =
          1 + (ε : ℝ≥0∞) * (D c ε : ℝ≥0∞) := by
        rw [hDe c ε]
        push_cast
        rfl
      rw [← h2]
      simp [Finsupp.prod, hq]
    simp only [genFun, h1]
    rw [lintegral_add_left measurable_const, lintegral_const_mul _ Measurable.of_discrete]
    simp [hS]
  -- the limit `S_k(0) = (M v)_k`
  have hS0 : ∀ k, S k 0 = ∑ j, meanMatrix μ k j * v j := by
    intro k
    simp only [hS, hD0]
    have h1 : ∀ c : Fin d →₀ ℕ, (((∑ j, (c j : ℝ≥0) * a j : ℝ≥0)) : ℝ≥0∞) =
        ∑ j, (c j : ℝ≥0∞) * v j := by
      intro c
      push_cast
      simp [hva]
    simp_rw [h1]
    rw [lintegral_finsetSum _ (fun j _ => Measurable.of_discrete)]
    refine Finset.sum_congr rfl fun j _ => ?_
    rw [lintegral_mul_const _ Measurable.of_discrete]
    rfl
  -- `f` is finite at `q ε₀` for some small `ε₀ > 0` (continuity at `1`, `f(1) = 1`)
  have hcont : Tendsto q (𝓝 0) (𝓝 1) := by
    refine tendsto_pi_nhds.2 fun j => ?_
    have : Continuous fun ε : ℝ≥0 => ((1 + ε * a j : ℝ≥0) : ℝ≥0∞) :=
      ENNReal.continuous_coe.comp (by fun_prop)
    simpa [hq] using this.tendsto 0
  have hfin : ∀ᶠ ε in 𝓝 (0 : ℝ≥0), ∀ k, genFun μ (q ε) k < 2 := by
    refine eventually_all.2 fun k => ?_
    have hopen : IsOpen {q : Fin d → ℝ≥0∞ | ∀ j, 0 < q j} := by
      have : {q : Fin d → ℝ≥0∞ | ∀ j, 0 < q j} = Set.pi Set.univ fun _ => Set.Ioi 0 := by
        ext; simp
      rw [this]
      exact isOpen_set_pi Set.finite_univ fun _ _ => isOpen_Ioi
    have h1 : (1 : Fin d → ℝ≥0∞) ∈ {q : Fin d → ℝ≥0∞ | ∀ j, 0 < q j} := fun j => one_pos
    have hc := (hIII k).continuousAt (hopen.mem_nhds h1)
    have hlt : genFun μ 1 k < 2 := by
      rw [genFun_one]
      exact ENNReal.one_lt_two
    exact hcont.eventually (hc.eventually (eventually_lt_nhds hlt))
  obtain ⟨ε₀, hε₀, hε₀pos⟩ := ((hfin.filter_mono nhdsWithin_le_nhds).and
    (self_mem_nhdsWithin : {ε : ℝ≥0 | 0 < ε} ∈ 𝓝[>] (0 : ℝ≥0))).exists
  have hε₀pos' : (0 : ℝ≥0) < ε₀ := hε₀pos
  have hSfin : ∀ k, S k ε₀ ≠ ⊤ := by
    intro k hk
    have h := hε₀ k
    rw [hgf, hk, ENNReal.mul_top (by exact_mod_cast hε₀pos'.ne')] at h
    simp at h
  -- `S_k(ε) → S_k(0)` as `ε → 0`, by dominated convergence
  have hlim : ∀ k, Tendsto (S k) (𝓝 0) (𝓝 (S k 0)) := by
    intro k
    refine tendsto_lintegral_filter_of_dominated_convergence (μ := (μ k).toMeasure)
      (F := fun (ε : ℝ≥0) (c : Fin d →₀ ℕ) => (D c ε : ℝ≥0∞))
      (fun c => (D c ε₀ : ℝ≥0∞)) (Eventually.of_forall fun _ => Measurable.of_discrete) ?_
      (hSfin k) (ae_of_all _ fun c => ?_)
    · filter_upwards [eventually_lt_nhds hε₀pos'] with ε hε
      exact ae_of_all _ fun c => by exact_mod_cast hDm c hε.le
    · exact (ENNReal.continuous_coe.comp (hDc c)).tendsto 0
  -- `S_k(0) = v_k - 1 < v_k`
  have hSlt : ∀ k, S k 0 < v k := by
    intro k
    have h1 : S k 0 + 1 = v k := by rw [hS0]; exact hvfix k
    have h2 : S k 0 ≠ ⊤ := fun h => by
      rw [h] at h1
      simp at h1
      exact hvtop k h1.symm
    calc S k 0 < S k 0 + 1 := ENNReal.lt_add_right h2 one_ne_zero
      _ = v k := h1
  have hev : ∀ᶠ ε in 𝓝 (0 : ℝ≥0), ∀ k, S k ε < v k :=
    eventually_all.2 fun k => (hlim k).eventually (eventually_lt_nhds (hSlt k))
  obtain ⟨ε, hεlt, hεpos⟩ := ((hev.filter_mono nhdsWithin_le_nhds).and
    (self_mem_nhdsWithin : {ε : ℝ≥0 | 0 < ε} ∈ 𝓝[>] (0 : ℝ≥0))).exists
  have hεpos' : (0 : ℝ≥0) < ε := hεpos
  have hεpos'' : (0 : ℝ≥0∞) < ε := by exact_mod_cast hεpos'
  have hqv : ∀ j, q ε j = 1 + (ε : ℝ≥0∞) * v j := fun j => by
    rw [← hva j]
    simp [hq]
  refine ⟨q ε, fun j => ⟨?_, ENNReal.coe_lt_top⟩, fun k => ?_⟩
  · rw [hqv j]
    refine ENNReal.lt_add_right ENNReal.one_ne_top
      (ENNReal.mul_pos hεpos''.ne' (lt_of_lt_of_le one_pos (hv j).1).ne').ne'
  · rw [hgf, hqv k]
    exact (ENNReal.add_lt_add_iff_left ENNReal.one_ne_top).2
      (ENNReal.mul_lt_mul_right hεpos''.ne' ENNReal.coe_ne_top (hεlt k))

/-- **Lemma 2.5 in log coordinates** (used in Lemma 2.15): there is `x ∈ (0,∞)^d` with
`g_k(x) < x_k` for every `k`. -/
theorem exists_logGenFun_lt_self (μ : Fin d → PMF (Fin d →₀ ℕ)) (hI : IsSubcritical μ)
    (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j}) :
    ∃ x : Fin d → EReal, (∀ j, 0 < x j ∧ x j < ⊤) ∧ ∀ k, logGenFun μ x k < x k := by
  obtain ⟨q, hq, hlt⟩ := exists_genFun_lt_self μ hI hIII
  refine ⟨fun j => ENNReal.log (q j), fun j => ⟨?_, ?_⟩, fun k => ?_⟩
  · exact ENNReal.zero_lt_log_iff.2 (hq j).1
  · exact ENNReal.log_lt_top_iff.2 (hq j).2
  · simp only [logGenFun, ENNReal.exp_log]
    exact ENNReal.log_lt_log (hlt k)

end Lemma25

end Conjugate

end
