/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.IsSubcritical
public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.Truncate
public import Conjugate.Frozen.Defs.ExtinctionEvent
public import Conjugate.Frozen.Defs.PathLaw
public import Conjugate.Frozen.Defs.StepKernel
public import Conjugate.Frozen.Defs.StochDominated
import Conjugate.Frozen.Theorem_3_1
import Conjugate.Internal.Examples.Example35Choices
import Conjugate.Internal.Examples.Example35Domination
import Conjugate.Internal.Examples.Example35Extinction
import Conjugate.Internal.Examples.Example35Truncation
import Conjugate.Internal.Examples.Example35Weight

/-!
# Provider for `Conjugate.example_3_5`

Implementation module for the frozen anchor `Conjugate/Frozen/Example_3_5.lean`.
The anchor is SEALED (its body is `by exact` of the theorem below).

The proof follows paper.tex:1182-1203 (with ERRATA E8, all four conditions of (3.23) hold for
every `ℙ_k`). Lean indexes types from `0`, so the paper's weight `φ(k) = k` is
`W(c) = ∑_j (j+1) c_j` (`Example35.wt`). With `e_k = 𝔼_k[W(X(1))] < 1`:

* global extinction (`Example35Extinction`): `𝔼_x[W(X(n))] ≤ θⁿ W(x)`, `θ = max (e_0, 1/2)`;
* Hypothesis I (`Example35Truncation`): row sums, `N = 1`, non-singularity, finiteness of `f^d`
  and the sealed `remark_hypIII_automatic`;
* Hypothesis II (`Example35Domination`): `hdom` and the layer-cake formula give
  `f_k(q) ≤ f_0(q)^{k+1}`;
* Hypotheses III and IV (`Example35Domination`, `Example35Choices`): `s` from
  `SingleType.exists_pgf_lt`, `t = 2 / ℙ_0[c_0 ≥ 2]`;
* the conclusion is the sealed `Conjugate.theorem_3_1` with `φ k = k + 1`, `ψ ≡ 1`.
-/

public section

open MeasureTheory Filter Topology

open scoped ENNReal

namespace Conjugate.Internal

theorem example_3_5 (μ : ℕ → PMF (ℕ →₀ ℕ))
    (h323 : ∀ k,
      (∀ j, 0 < (μ k).toMeasure {c | 1 ≤ c j}) ∧
      0 < (μ k).toMeasure {c | 2 ≤ c 0} ∧
      (∀ u : ℝ, 1 < u →
        ∫⁻ c, ENNReal.ofReal (u ^ (c.sum fun j n => ((j : ℝ) + 1) * n)) ∂(μ k).toMeasure < ∞) ∧
      ∫⁻ c, ((c.sum fun j n => (j + 1) * n : ℕ) : ℝ≥0∞) ∂(μ k).toMeasure < 1)
    (hdom : ∀ k, 1 ≤ k →
      StochDominated (μ k).toMeasure (stepKernel μ (Finsupp.single 0 (k + 1)))) :
    (∀ k, pathLaw μ (Finsupp.single k 1) (extinctionEvent ℕ) = 1) ∧
    (∀ d, 1 ≤ d →
      IsSubcritical (truncate μ d) ∧
        (IsPositiveRegular (truncate μ d) ∧ IsNonsingular (truncate μ d)) ∧
        ∀ k, ContinuousOn (fun q => genFun (truncate μ d) q k) {q | ∀ j, 0 < q j}) ∧
    (∀ k (q : ℕ → ℝ≥0∞), (∀ j, 1 ≤ q j ∧ q j < ∞) →
      genFun μ q k ≤ ENNReal.ofReal 1 * genFun μ q 0 ^ ((k : ℝ) + 1)) ∧
    (∃ s : ℝ, 1 < s ∧ ∀ k,
      ∫⁻ c, ENNReal.ofReal (s ^ (c.sum fun j n => ((j : ℝ) + 1) * n)) ∂(μ k).toMeasure ≤
        ENNReal.ofReal (s ^ ((k : ℝ) + 1))) ∧
    (∃ t : ℝ, 1 < t ∧
      ENNReal.ofReal t < genFun μ (fun j => if j = 0 then ENNReal.ofReal t else 1) 0 ∧
      ∀ k, genFun μ (fun j => ENNReal.ofReal (1 * t ^ ((j : ℝ) + 1))) k < ∞) ∧
    ∃ q : ℕ → ℝ≥0∞, (∀ j, 1 < q j ∧ q j < ∞) ∧ genFun μ q = q := by
  -- the four conditions of (3.23), in the form used by the helper modules
  have h1 : ∀ k j, 0 < (μ k).toMeasure {c | 1 ≤ c j} := fun k => (h323 k).1
  have h2 : 0 < (μ 0).toMeasure {c | 2 ≤ c 0} := (h323 0).2.1
  have h3 : ∀ k, ∀ u : ℝ, 1 < u →
      ∫⁻ c, ENNReal.ofReal (u ^ Example35.wt c) ∂(μ k).toMeasure < ∞ := by
    intro k u hu
    simpa only [Example35.wt_rpow] using (h323 k).2.2.1 u hu
  have h4 : ∀ k, ∫⁻ c, (Example35.wt c : ℝ≥0∞) ∂(μ k).toMeasure < 1 := by
    intro k
    simpa only [Example35.wt_eq] using (h323 k).2.2.2
  -- global extinction
  have hext := fun k => Example35.pathLaw_extinctionEvent_eq_one_of_wt h4 k
  -- Hypothesis I
  have hI := fun d hd => Example35.hypI h1 h2 h3 h4 d hd
  -- Hypothesis II, with `ψ = 1`, `φ k = k + 1`
  have hII : ∀ k (q : ℕ → ℝ≥0∞), (∀ j, 1 ≤ q j ∧ q j < ∞) →
      genFun μ q k ≤ ENNReal.ofReal 1 * genFun μ q 0 ^ ((k : ℝ) + 1) := by
    intro k q hq
    have h := Example35.genFun_le_pow_of_dom hdom hq k
    rw [ENNReal.ofReal_one, one_mul, show ((k : ℝ) + 1) = ((k + 1 : ℕ) : ℝ) by push_cast; ring,
      ENNReal.rpow_natCast]
    exact h
  -- Hypothesis III
  have hIII : ∃ s : ℝ, 1 < s ∧ ∀ k,
      ∫⁻ c, ENNReal.ofReal (s ^ (c.sum fun j n => ((j : ℝ) + 1) * n)) ∂(μ k).toMeasure ≤
        ENNReal.ofReal (s ^ ((k : ℝ) + 1)) := by
    obtain ⟨s, hs1, hs⟩ := Example35.exists_pow_wt_le h3 h4
    refine ⟨s, hs1, fun k => ?_⟩
    simp_rw [Example35.wt_rpow]
    rw [show ((k : ℝ) + 1) = ((k + 1 : ℕ) : ℝ) by push_cast; ring, Real.rpow_natCast]
    calc ∫⁻ c, ENNReal.ofReal (s ^ Example35.wt c) ∂(μ k).toMeasure
        ≤ (∫⁻ c, ENNReal.ofReal (s ^ Example35.wt c) ∂(μ 0).toMeasure) ^ (k + 1) :=
          Example35.lintegral_pow_wt_le_of_dom hdom hs1.le k
      _ ≤ ENNReal.ofReal s ^ (k + 1) := by gcongr
      _ = ENNReal.ofReal (s ^ (k + 1)) := (ENNReal.ofReal_pow (by linarith) _).symm
  -- Hypothesis IV
  have hIV : ∃ t : ℝ, 1 < t ∧
      ENNReal.ofReal t < genFun μ (fun j => if j = 0 then ENNReal.ofReal t else 1) 0 ∧
      ∀ k, genFun μ (fun j => ENNReal.ofReal (1 * t ^ ((j : ℝ) + 1))) k < ∞ := by
    obtain ⟨t, ht1, ht⟩ := Example35.exists_lt_genFun h2
    exact ⟨t, ht1, ht, Example35.genFun_ofReal_rpow_lt_top h3 ht1⟩
  refine ⟨hext, hI, hII, hIII, hIV, ?_⟩
  -- Theorem 3.1 with `φ k = k + 1`, `ψ ≡ 1`
  refine Conjugate.theorem_3_1 μ hext hI (fun k => (k : ℝ) + 1) (fun _ => 1)
    (fun k => by linarith [(Nat.cast_nonneg k : (0 : ℝ) ≤ k)]) (fun _ => le_rfl)
    (tendsto_atTop_add_const_right _ 1 tendsto_natCast_atTop_atTop) ?_ hII hIII hIV
  simp

end Conjugate.Internal

end
