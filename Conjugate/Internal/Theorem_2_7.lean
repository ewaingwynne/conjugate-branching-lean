/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsSubcritical
public import Conjugate.Frozen.Defs.LogGenFun
import Conjugate.Frozen.Defs.ExtinctionEvent
import Conjugate.Frozen.Defs.PathLaw
import Conjugate.Internal.Analytic.LogGenFun
import Conjugate.Internal.Foundations.Extinction
import Conjugate.Internal.Section2.AssemblyMap
import Conjugate.Internal.Section2.AssemblyRay
import Conjugate.Internal.Section2.Positivity

/-!
# Provider for `Conjugate.theorem_2_7`

Implementation module for the frozen anchor `Conjugate/Frozen/Theorem_2_7.lean`.
The anchor is SEALED (its body is `by exact` of the theorem below).

Proof (paper.tex:894-905), by Brouwer's theorem on the standard simplex `Δ` applied to
`u ↦ π(g(φ(u)))` with `φ(u) = ρ(u) u` (`rayParam`, Lemma 2.18) and `π(λ) = λ / ∑_j λ_j`
(this replaces the paper's annulus and its homeomorphism with a ball, `PLAN.md` §6):

* `Conjugate.continuousOn_rayParam`: `ρ` is continuous on `Δ` (Lemmas 2.17, 2.11, 2.14);
* `Conjugate.simplexMap_mem`, `Conjugate.continuousOn_simplexMap`: `u ↦ π(g(φ(u)))` is a
  continuous self-map of `Δ` (`g(Λ) ⊆ Λ`, Lemma 2.14 and display (2.10));
* `Conjugate.exists_logGenFun_rayPt_eq`: a fixed point `u*` gives `g(φ(u*)) = φ(u*)`, by
  uniqueness in Lemma 2.18;
* positivity of the fixed point `λ = φ(u*)` (paper.tex:904): `e^λ` is a fixed point of `f`
  (2.6) different from `𝟙`, so `e^{λ_k} > 1` for all `k` by Lemma 2.3.
-/

public section

open scoped ENNReal

namespace Conjugate.Internal

theorem theorem_2_7 {d : ℕ} (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hI : IsSubcritical μ) (hII : IsPositiveRegular μ ∧ IsNonsingular μ)
    (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j}) :
    ∃ x : Fin d → EReal, (∀ j, 0 < x j ∧ x j < ⊤) ∧ logGenFun μ x = x := by
  obtain ⟨u, hu, hfix⟩ := exists_logGenFun_rayPt_eq μ hI hII hIII
  have hρ : 0 < rayParam μ u := rayParam_pos μ hI hII hIII hu
  refine ⟨rayPt (rayParam μ u) u, fun j => ⟨?_, EReal.coe_lt_top _⟩, hfix⟩
  have hq : genFun μ (fun j => EReal.exp (rayPt (rayParam μ u) u j)) =
      fun j => EReal.exp (rayPt (rayParam μ u) u j) :=
    (logGenFun_eq_self_iff μ _).1 hfix
  have hext : ∀ k, pathLaw μ (Finsupp.single k 1) (extinctionEvent (Fin d)) = 1 := fun k =>
    pathLaw_extinctionEvent_eq_one μ hI _
  rcases eq_one_or_one_lt_of_genFun_eq_self μ hII.1 hext hq with h | h
  · exfalso
    have hzero : ∀ k, u k = 0 := fun k => by
      have h1 : rayPt (rayParam μ u) u k ≤ 0 := EReal.exp_le_one_iff.1 (h k).le
      have h2 : rayParam μ u * u k ≤ 0 := by
        simp only [rayPt, toE] at h1
        exact_mod_cast h1
      exact (mul_eq_zero.1 (le_antisymm h2 (mul_nonneg hρ.le (hu.1 k)))).resolve_left hρ.ne'
    have := hu.2
    simp [hzero] at this
  · exact EReal.one_lt_exp_iff.1 (h j)

end Conjugate.Internal

end
