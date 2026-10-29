/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsSubcritical
import Conjugate.Frozen.Remark_HypIII_Automatic
import Conjugate.Internal.Examples.Example15Law
import Conjugate.Internal.Examples.Example15Numerics

/-!
# Provider for `Conjugate.example_1_5`

Implementation module for the frozen anchor `Conjugate/Frozen/Example_1_5.lean`.
The anchor is SEALED (its body is `by exact` of the theorem below).

The proof, with `k' = k.rev` (paper.tex:255-262):

* `Example15Law`: the four masses force `f_k(q) = 49/100 + q_k/4 + q_k²/4 + q_k² q_{k'}²/100`;
  row sums of the mean matrix are `79/100` (hypothesis I, `isSubcritical_of_sum_lt_one`);
  `ℙ_k[X_j(1) ≥ 1] > 0` and `ℙ_k[|X(1)| ≥ 2] ≥ 1/4` (hypothesis II); `f` is finite, so
  hypothesis III is `Conjugate.remark_hypIII_automatic`.
* `Example15Numerics`: real roots by the intermediate value theorem: the symmetric point
  `(t, t)`, `t ∈ (3/2, 2)`, and the asymmetric points `(a, b)` and `(b, a)`, `1 < a < b`.
* Three distinct fixed points in `(1, ∞)²`, mapped by `ENNReal.ofReal`.
-/

public section

open scoped ENNReal

namespace Conjugate.Internal

open Example15

/-- The provider of `Conjugate.example_1_5`, with exactly its type. -/
theorem example_1_5 (μ : Fin 2 → PMF (Fin 2 →₀ ℕ))
    (hμ : ∀ k : Fin 2,
      μ k (Finsupp.single k 1) = 1 / 4 ∧ μ k (Finsupp.single k 2) = 1 / 4 ∧
      μ k (Finsupp.single k 2 + Finsupp.single k.rev 2) = 1 / 100 ∧ μ k 0 = 49 / 100) :
    (IsSubcritical μ ∧ (IsPositiveRegular μ ∧ IsNonsingular μ) ∧
      ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j}) ∧
    3 ≤ {q : Fin 2 → ℝ≥0∞ | (∀ j, 1 < q j ∧ q j < ∞) ∧ genFun μ q = q}.encard := by
  have hs : Spec μ := hμ
  have hpr := isPositiveRegular hs
  have hns := isNonsingular hs
  refine ⟨⟨isSubcritical hs, ⟨hpr, hns⟩,
    Conjugate.remark_hypIII_automatic μ hpr hns fun k q hq =>
      genFun_lt_top hs q (fun j => (hq j).2) k⟩, ?_⟩
  obtain ⟨t, ht1, ht2, ht⟩ := exists_symmetric_root
  obtain ⟨a, b, ha, hab, ha', hb'⟩ := exists_asymmetric_root
  have hmem : ∀ p : Fin 2 → ℝ, (∀ j, 1 < p j) → (∀ k, fReal k p = p k) →
      (fun j => ENNReal.ofReal (p j)) ∈
        {q : Fin 2 → ℝ≥0∞ | (∀ j, 1 < q j ∧ q j < ∞) ∧ genFun μ q = q} := fun p hp hfix =>
    ⟨fun j => ⟨ENNReal.one_lt_ofReal.2 (hp j), ENNReal.ofReal_lt_top⟩,
      genFun_ofReal_eq_self hs p (fun j => (zero_lt_one.trans (hp j)).le) hfix⟩
  have hb1 : 1 < b := by linarith
  have ha1 : 1 < a := by linarith
  have hbpos : 0 < b := by linarith
  -- the three fixed points `(t, t)`, `(a, b)`, `(b, a)`
  have m1 := hmem (fun _ => t) (fun _ => by linarith) fun k => by
    simp only [fReal]; linarith
  have m2 := hmem ![a, b] (fun j => by fin_cases j <;> simp [ha1, hb1]) fun k => by
    fin_cases k <;> simp [fReal, Fin.rev] <;> linarith
  have m3 := hmem ![b, a] (fun j => by fin_cases j <;> simp [ha1, hb1]) fun k => by
    fin_cases k <;> simp [fReal, Fin.rev] <;> linarith
  have hlt : ENNReal.ofReal a < ENNReal.ofReal b := (ENNReal.ofReal_lt_ofReal_iff hbpos).2 hab
  have h12 : (fun _ : Fin 2 => ENNReal.ofReal t) ≠ fun j => ENNReal.ofReal (![a, b] j) := by
    intro h
    have h0 := congr_fun h 0
    have h1 := congr_fun h 1
    simp only [Matrix.cons_val_zero, Matrix.cons_val_one] at h0 h1
    exact hlt.ne (h0.symm.trans h1)
  have h13 : (fun _ : Fin 2 => ENNReal.ofReal t) ≠ fun j => ENNReal.ofReal (![b, a] j) := by
    intro h
    have h0 := congr_fun h 0
    have h1 := congr_fun h 1
    simp only [Matrix.cons_val_zero, Matrix.cons_val_one] at h0 h1
    exact hlt.ne (h1.symm.trans h0)
  have h23 : (fun j => ENNReal.ofReal (![a, b] j)) ≠ fun j => ENNReal.ofReal (![b, a] j) := by
    intro h
    have h0 := congr_fun h 0
    simp only [Matrix.cons_val_zero] at h0
    exact hlt.ne h0
  have hcard : ({fun _ : Fin 2 => ENNReal.ofReal t, fun j => ENNReal.ofReal (![a, b] j),
      fun j => ENNReal.ofReal (![b, a] j)} : Set (Fin 2 → ℝ≥0∞)).encard = 3 :=
    Set.encard_eq_three.2 ⟨_, _, _, h12, h13, h23, rfl⟩
  rw [← hcard]
  refine Set.encard_le_encard ?_
  intro q hq
  rcases hq with rfl | rfl | rfl
  exacts [m1, m2, m3]

end Conjugate.Internal

end
