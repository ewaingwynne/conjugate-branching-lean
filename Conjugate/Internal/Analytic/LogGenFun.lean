/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.LogGenFun
public import Mathlib.Analysis.SpecialFunctions.Log.ENNRealLogExp
import Conjugate.Internal.Analytic.GenFun

/-!
# Elementary facts about the log-coordinate generating function `g`

For `g = logGenFun μ`, `g_k(λ) = log f_k(e^{λ})`:

* `logGenFun_iterate`: display (2.5), paper.tex:540, in its `g`-form: the iterates of `g` are the
  conjugates of the iterates of `f` by `exp`;
* `logGenFun_mono`, `logGenFun_zero`, `mapsTo_logGenFun`: monotonicity, `g(0) = 0`, and the
  invariance of the orthant `[0,∞]^ι` (`lem-mono`, first assertion, paper.tex:593);
* `logGenFun_eq_self_iff`: the fixed-point equivalence (2.6), paper.tex:546-549;
* `continuousOn_logGenFun_iterate`: `lem-basin-open#g-iter-continuous` (paper.tex:814), the
  iterates of `g` are continuous on `[0,∞]^d` under Hypothesis III.
-/

public section

open MeasureTheory ProbabilityTheory Filter Topology

open scoped ENNReal

namespace Conjugate

variable {ι : Type*}

/-- **Display (2.5)** (paper.tex:540), `g`-form: `g^{(n)}(x)_k = log f^{(n)}(e^x)_k`. -/
theorem logGenFun_iterate (μ : ι → PMF (ι →₀ ℕ)) (n : ℕ) (x : ι → EReal) :
    (logGenFun μ)^[n] x = fun k => ENNReal.log ((genFun μ)^[n] (fun j => EReal.exp (x j)) k) := by
  induction n generalizing x with
  | zero => funext k; simp
  | succ n ih =>
    rw [Function.iterate_succ_apply, ih, Function.iterate_succ_apply]
    funext k
    simp [logGenFun]

/-- `g` is monotone. -/
theorem logGenFun_mono (μ : ι → PMF (ι →₀ ℕ)) : Monotone (logGenFun μ) := by
  intro x y hxy k
  exact ENNReal.log_monotone (genFun_mono μ (fun j => EReal.exp_monotone (hxy j)) k)

/-- `g(0) = 0`. -/
theorem logGenFun_zero (μ : ι → PMF (ι →₀ ℕ)) : logGenFun μ 0 = 0 := by
  funext k
  have h : genFun μ (fun j => EReal.exp ((0 : ι → EReal) j)) = 1 := by
    have h1 : (fun j : ι => EReal.exp ((0 : ι → EReal) j)) = 1 := by funext j; simp
    rw [h1, genFun_one]
  change ENNReal.log (genFun μ (fun j => EReal.exp ((0 : ι → EReal) j)) k) = 0
  rw [h]
  simp

/-- `g` maps the orthant `[0,∞]^ι` into itself, because `f(q) ≥ f(1) = 1` for `q ≥ 1`. -/
theorem mapsTo_logGenFun (μ : ι → PMF (ι →₀ ℕ)) :
    Set.MapsTo (logGenFun μ) {x | ∀ j, 0 ≤ x j} {x | ∀ j, 0 ≤ x j} := by
  intro x hx k
  have h1 : (1 : ι → ℝ≥0∞) ≤ fun j => EReal.exp (x j) := fun j => EReal.one_le_exp_iff.2 (hx j)
  have h2 := genFun_mono μ h1 k
  rw [genFun_one] at h2
  exact ENNReal.zero_le_log_iff.2 h2

/-- **The fixed-point equivalence (2.6)** (paper.tex:546-549): `g(x) = x` iff `f(e^x) = e^x`. -/
theorem logGenFun_eq_self_iff (μ : ι → PMF (ι →₀ ℕ)) (x : ι → EReal) :
    logGenFun μ x = x ↔ genFun μ (fun j => EReal.exp (x j)) = fun j => EReal.exp (x j) := by
  constructor
  · intro h
    funext k
    have hk : ENNReal.log (genFun μ (fun j => EReal.exp (x j)) k) = x k := congrFun h k
    rw [← hk, ENNReal.exp_log]
  · intro h
    funext k
    have hk := congrFun h k
    simp only [logGenFun]
    rw [hk, EReal.log_exp]

/-- **Iterates of `g` are continuous on `[0,∞]^d` under Hypothesis III**
(`lem-basin-open#g-iter-continuous`, paper.tex:814). -/
theorem continuousOn_logGenFun_iterate {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j}) (n : ℕ) :
    ContinuousOn (logGenFun μ)^[n] {x | ∀ j, 0 ≤ x j} := by
  have hg : ContinuousOn (logGenFun μ) {x | ∀ j, 0 ≤ x j} := by
    refine continuousOn_pi.2 fun k => ?_
    have hexp : Continuous fun x : Fin d → EReal => fun j => EReal.exp (x j) :=
      continuous_pi fun j => EReal.expHomeomorph.continuous.comp (continuous_apply j)
    have hmaps : Set.MapsTo (fun x : Fin d → EReal => fun j => EReal.exp (x j))
        {x | ∀ j, 0 ≤ x j} {q | ∀ j, 0 < q j} := by
      intro x hx j
      exact lt_of_lt_of_le one_pos (EReal.one_le_exp_iff.2 (hx j))
    exact ENNReal.continuous_log.comp_continuousOn ((hIII k).comp hexp.continuousOn hmaps)
  induction n with
  | zero => exact continuousOn_id
  | succ n ih =>
    rw [Function.iterate_succ]
    exact ih.comp hg (mapsTo_logGenFun μ)

end Conjugate

end
