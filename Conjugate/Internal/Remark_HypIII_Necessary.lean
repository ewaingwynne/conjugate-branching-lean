/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.IsSubcritical
public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.IsConjugate
import Conjugate.Internal.Examples.HypIIINecessary

/-!
# Provider for `Conjugate.remark_hypIII_necessary`

Implementation module for the frozen anchor `Conjugate/Frozen/Remark_HypIII_Necessary.lean`.
The anchor is SEALED (its body is `by exact` of the theorem below).

The example is built in `Conjugate.Internal.Examples.HypIIINecessary`: `a = 1/4`,
`b = 1 - a ζ(3)`, and the offspring law is the push-forward of the PMF
`ℙ[X = 0] = b`, `ℙ[X = m] = a m⁻³` under `m ↦ single 0 m`.
-/

public section

open scoped ENNReal

namespace Conjugate.Internal

theorem remark_hypIII_necessary :
    ∃ a b : ℝ≥0∞, 0 < a ∧ 0 < b ∧ ∃ μ : Fin 1 → PMF (Fin 1 →₀ ℕ),
      μ 0 0 = b ∧ (∀ m : ℕ, 1 ≤ m → μ 0 (Finsupp.single 0 m) = a * ((m : ℝ≥0∞) ^ 3)⁻¹) ∧
      IsSubcritical μ ∧ (IsPositiveRegular μ ∧ IsNonsingular μ) ∧
      (∀ q : ℝ≥0∞, 1 < q → q < ∞ → genFun μ (fun _ => q) 0 = ∞) ∧
      ¬ ∃ μHat, IsConjugate μ μHat :=
  Examples.HypIII.exists_example

end Conjugate.Internal

end
