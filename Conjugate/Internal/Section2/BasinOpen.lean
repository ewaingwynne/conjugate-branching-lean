/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.BasinInfty
public import Conjugate.Frozen.Defs.BasinZero
public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsSubcritical
public import Conjugate.Frozen.Defs.LogGenFun
import Conjugate.Internal.Analytic.LogGenFun
import Conjugate.Internal.Section2.Attractive
import Conjugate.Internal.Section2.BasinInvariance
import Conjugate.Internal.Section2.Strict
import Conjugate.Internal.Section2.Unstable

/-!
# The basins of attraction are relatively open (Lemma 2.16)

Paper.tex:804-821. With `g = logGenFun μ` and `[0,∞]^d = {x | ∀ j, 0 ≤ x j}` inside
`[-∞,∞]^d = Fin d → EReal`, relative openness of `S ⊆ [0,∞]^d` is stated as `S = U ∩ [0,∞]^d`
for an open `U ⊆ Fin d → EReal`.

* `exists_isOpen_basinZero`: `S₀` is relatively open;
* `exists_isOpen_basinInfty`: `S∞` is relatively open.

Both follow from `exists_isOpen_eq_inter_orthant`, the topological skeleton of the paper's proof:
if `B ⊆ [0,∞]^d` is invariant under `g^{(-n)}`, contains `V ∩ [0,∞]^d` for an open `V`, and every
point of `B` enters `V` under some `g^{(n)}`, then `B` is relatively open, because each `g^{(n)}`
is continuous on `[0,∞]^d` (`continuousOn_logGenFun_iterate`, Hypothesis III).
For `S₀`, `V = [0,ε)^d` with `ε` from Lemma 2.14; for `S∞`, `V = {∃ j, x_j > C}` with `C` from
Lemma 2.15, where the points with an infinite coordinate lie in `S∞` by display (2.8)
(`mem_basinInfty_of_exists_eq_top`).
-/

public section

open Filter Topology

open scoped ENNReal

namespace Conjugate

variable {d : ℕ}

section Helpers

/-- For `z ∈ [0,∞]`, `|z| < c` forces `z < c`. -/
lemma lt_of_abs_lt_ofReal {z : EReal} (hz : 0 ≤ z) {c : ℝ} (h : z.abs < ENNReal.ofReal c) :
    z < (c : EReal) := by
  by_contra hge
  have h1 : ((c : ℝ) : EReal) ≤ z := not_lt.1 hge
  have h2 := EReal.toENNReal_le_toENNReal h1
  rw [EReal.toENNReal_of_ne_top (EReal.coe_ne_top c), EReal.toReal_coe,
    ← abs_eq_toENNReal hz] at h2
  exact absurd h (not_lt.2 h2)

/-- For `z ∈ [0,∞]`, `c < |z|` forces `c < z`. -/
lemma lt_of_ofReal_lt_abs {z : EReal} (hz : 0 ≤ z) {c : ℝ} (h : ENNReal.ofReal c < z.abs) :
    (c : EReal) < z := by
  by_contra hge
  have h1 : z ≤ ((c : ℝ) : EReal) := not_lt.1 hge
  have h2 := EReal.toENNReal_le_toENNReal h1
  rw [EReal.toENNReal_of_ne_top (EReal.coe_ne_top c), EReal.toReal_coe,
    ← abs_eq_toENNReal hz] at h2
  exact absurd h (not_lt.2 h2)

/-- **The topological skeleton of Lemma 2.16.** -/
lemma exists_isOpen_eq_inter_orthant (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j})
    {B V : Set (Fin d → EReal)} (hV : IsOpen V)
    (hBorth : ∀ x ∈ B, ∀ j, 0 ≤ x j)
    (hVB : ∀ y : Fin d → EReal, (∀ j, 0 ≤ y j) → y ∈ V → y ∈ B)
    (hex : ∀ x ∈ B, ∃ n, (logGenFun μ)^[n] x ∈ V)
    (hinv : ∀ (n : ℕ) (x : Fin d → EReal), (∀ j, 0 ≤ x j) → (logGenFun μ)^[n] x ∈ B → x ∈ B) :
    ∃ U : Set (Fin d → EReal), IsOpen U ∧ B = U ∩ {x | ∀ j, 0 ≤ x j} := by
  have hU : ∀ n, ∃ u : Set (Fin d → EReal), IsOpen u ∧
      (logGenFun μ)^[n] ⁻¹' V ∩ {x | ∀ j, 0 ≤ x j} = u ∩ {x | ∀ j, 0 ≤ x j} := fun n =>
    continuousOn_iff'.1 (continuousOn_logGenFun_iterate μ hIII n) V hV
  choose u hu hueq using hU
  refine ⟨⋃ n, u n, isOpen_iUnion hu, ?_⟩
  ext x
  constructor
  · intro hx
    obtain ⟨n, hn⟩ := hex x hx
    have h1 : x ∈ (logGenFun μ)^[n] ⁻¹' V ∩ {x | ∀ j, 0 ≤ x j} := ⟨hn, hBorth x hx⟩
    rw [hueq n] at h1
    exact ⟨Set.mem_iUnion.2 ⟨n, h1.1⟩, hBorth x hx⟩
  · rintro ⟨hx, hx0⟩
    obtain ⟨n, hn⟩ := Set.mem_iUnion.1 hx
    have h1 : x ∈ u n ∩ {x | ∀ j, 0 ≤ x j} := ⟨hn, hx0⟩
    rw [← hueq n] at h1
    exact hinv n x hx0 (hVB _ ((mapsTo_logGenFun μ).iterate n hx0) h1.1)

end Helpers

/-- **Lemma 2.16** (paper.tex:804-821), `S₀`. -/
theorem exists_isOpen_basinZero (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hI : IsSubcritical μ) (hII : IsPositiveRegular μ ∧ IsNonsingular μ)
    (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j}) :
    ∃ U : Set (Fin d → EReal), IsOpen U ∧ basinZero μ = U ∩ {x | ∀ j, 0 ≤ x j} := by
  obtain ⟨ε, hε0, hε⟩ := exists_mem_basinZero_of_le μ hI hII hIII
  refine exists_isOpen_eq_inter_orthant μ hIII
    (V := ⋂ j, {y : Fin d → EReal | y j < (ε : EReal)})
    (isOpen_iInter_of_finite fun j => isOpen_lt (continuous_apply j) continuous_const)
    (fun x hx => hx.1) ?_ ?_ ?_
  · intro y hy0 hy
    exact hε y fun j => ⟨hy0 j, (Set.mem_iInter.1 hy j).le⟩
  · intro x hx
    have h := hx.2.eventually (gt_mem_nhds (ENNReal.ofReal_pos.2 hε0))
    obtain ⟨n, hn⟩ := h.exists
    refine ⟨n, Set.mem_iInter.2 fun j => ?_⟩
    exact lt_of_abs_lt_ofReal ((mapsTo_logGenFun μ).iterate n hx.1 j)
      (lt_of_le_of_lt (le_iSup (fun j => ((logGenFun μ)^[n] x j).abs) j) hn)
  · intro n x hx0 hx
    exact (iterate_logGenFun_mem_basinZero_iff μ n hx0).1 hx

/-- **Lemma 2.16** (paper.tex:804-821), `S∞`. -/
theorem exists_isOpen_basinInfty (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hI : IsSubcritical μ) (hII : IsPositiveRegular μ ∧ IsNonsingular μ)
    (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j}) :
    ∃ U : Set (Fin d → EReal), IsOpen U ∧ basinInfty μ = U ∩ {x | ∀ j, 0 ≤ x j} := by
  obtain ⟨C, hC0, N, hN1, hC⟩ := exists_attractive_infty μ hI hII hIII
  refine exists_isOpen_eq_inter_orthant μ hIII
    (V := ⋃ j, {y : Fin d → EReal | (C : EReal) < y j})
    (isOpen_iUnion fun j => isOpen_lt continuous_const (continuous_apply j))
    (fun x hx => hx.1) ?_ ?_ ?_
  · intro y hy0 hy
    obtain ⟨j, hj⟩ := Set.mem_iUnion.1 hy
    by_cases hinf : ∃ i, y i = ⊤
    · exact mem_basinInfty_of_exists_eq_top μ hII.1 hy0 hinf
    · push Not at hinf
      exact ⟨hy0, ((hC y (fun i => ⟨hy0 i, lt_top_iff_ne_top.2 (hinf i)⟩) ⟨j, hj⟩).2).limsup_eq⟩
  · intro x hx
    have h : ENNReal.ofReal C < limsup (fun n => ⨆ j, ((logGenFun μ)^[n] x j).abs) atTop := by
      rw [hx.2]
      exact ENNReal.ofReal_lt_top
    obtain ⟨n, hn⟩ := (frequently_lt_of_lt_limsup (by isBoundedDefault) h).exists
    obtain ⟨j, hj⟩ := lt_iSup_iff.1 hn
    exact ⟨n, Set.mem_iUnion.2 ⟨j, lt_of_ofReal_lt_abs ((mapsTo_logGenFun μ).iterate n hx.1 j) hj⟩⟩
  · intro n x hx0 hx
    exact (iterate_logGenFun_mem_basinInfty_iff μ n hx0).1 hx

end Conjugate

end
