/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.BasinInfty
public import Conjugate.Frozen.Defs.BasinZero
public import Conjugate.Frozen.Defs.ExtinctionEvent
public import Conjugate.Frozen.Defs.GenFun
public import Conjugate.Frozen.Defs.IsNonsingular
public import Conjugate.Frozen.Defs.IsPositiveRegular
public import Conjugate.Frozen.Defs.IsSubcritical
public import Conjugate.Frozen.Defs.LogGenFun
public import Conjugate.Frozen.Defs.PathLaw
import Conjugate.Internal.Analytic.LogGenFun
import Conjugate.Internal.Foundations.Extinction
import Conjugate.Internal.Section2.Strict
import Conjugate.Internal.Section2.Unstable

/-!
# Monotone orbits of `g` tend to `0` or to infinity (Lemma 2.13)

Throughout, `g = logGenFun μ` and `x ∈ [0,∞)^d`. Vector inequalities `y < x` of the paper
(`y ≤ x`, `y ≠ x`) are spelled `y ≤ x ∧ y ≠ x`.

* `mem_basinZero_of_iterate_lt`: **Lemma 2.13, first part** (paper.tex:675-697): if
  `g^{(m)}(x) < x` then `g^{(n)}(x) → 0`, i.e. `x ∈ S₀`;
* `tendsto_top_of_lt_iterate`: **Lemma 2.13, second part** (the commented "proven similarly"
  paragraph, paper.tex:698-714): if `g^{(m)}(x) > x` then `|g^{(n)}(x)| → ∞`.

The proofs follow the residue classes `n ≡ s (mod m)` as in the paper, but start each class at the
time `s + N m`, `N` the strictness time of Lemma 2.9 (`exists_logGenFun_iterate_strict`). From
there the class is strictly monotone, so Lemma 2.12 (`tendsto_zero_of_lt`,
`limsup_eq_top_of_lt`) applies directly to the starting point `g^{(s + N m)}(x)`.  In the second
part an infinite coordinate is excluded first (otherwise `g^{(n)}(x) = (∞, …, ∞)` eventually).

Helpers: `tendsto_of_forall_residue` (a sequence tends to `a` if each residue class mod `m`
does), `supAbs_mono`, `supAbs_lt_top`, `iterate_comm_apply`, `limsup_lt_top_of_iterate_le`,
`tendsto_top_of_iterate_class`.
-/

public section

open MeasureTheory ProbabilityTheory Filter Topology
open scoped ENNReal

namespace Conjugate

variable {d : ℕ}

section Helpers

/-- A sequence tends to `a` as soon as each of its `m` residue-class subsequences does. -/
lemma tendsto_of_forall_residue {α : Type*} [TopologicalSpace α] {f : ℕ → α} {a : α} {m : ℕ}
    (hm : 0 < m) (h : ∀ s, s < m → Tendsto (fun r => f (r * m + s)) atTop (𝓝 a)) :
    Tendsto f atTop (𝓝 a) := by
  refine tendsto_def.2 fun U hU => ?_
  have h1 : ∀ s : Fin m, ∀ᶠ r in atTop, f (r * m + s) ∈ U := fun s => h s s.2 hU
  obtain ⟨R, hR⟩ := eventually_atTop.1 (eventually_all.2 h1)
  refine mem_atTop_sets.2 ⟨R * m, fun n hn => ?_⟩
  have hdiv : R ≤ n / m := (Nat.le_div_iff_mul_le hm).2 hn
  have := hR (n / m) hdiv ⟨n % m, Nat.mod_lt _ hm⟩
  simpa [Nat.div_add_mod'] using this

/-- The sup norm is monotone on `[0,∞]^d`. -/
lemma supAbs_mono {y z : Fin d → EReal} (hy : ∀ j, 0 ≤ y j) (hyz : y ≤ z) :
    (⨆ j, (y j).abs) ≤ ⨆ j, (z j).abs :=
  iSup_mono fun j => abs_le_abs_of_nonneg (hy j) (hyz j)

/-- A vector in `[0,∞)^d` has finite sup norm. -/
lemma supAbs_lt_top {y : Fin d → EReal} (hy : ∀ j, 0 ≤ y j ∧ y j < ⊤) :
    (⨆ j, (y j).abs) < ⊤ := by
  refine iSup_lt_iff.2 ⟨∑ j, (y j).abs, ENNReal.sum_lt_top.2 fun j _ => ?_, fun j => ?_⟩
  · rw [abs_eq_toENNReal (hy j).1]
    exact lt_top_iff_ne_top.2 (EReal.toENNReal_ne_top_iff.2 (hy j).2.ne)
  · exact Finset.single_le_sum (f := fun j => (y j).abs) (fun _ _ => zero_le) (Finset.mem_univ j)

/-- Iterates of `g` commute. -/
lemma iterate_comm_apply (μ : Fin d → PMF (Fin d →₀ ℕ)) (a b : ℕ) (x : Fin d → EReal) :
    (logGenFun μ)^[a] ((logGenFun μ)^[b] x) = (logGenFun μ)^[b] ((logGenFun μ)^[a] x) := by
  rw [← Function.iterate_add_apply, ← Function.iterate_add_apply, add_comm]

/-- If `g^{(m)} y ≤ y` for a finite `y ≥ 0`, then `|g^{(r m)} y|` is bounded. -/
lemma limsup_lt_top_of_iterate_le (μ : Fin d → PMF (Fin d →₀ ℕ)) {m : ℕ} {y : Fin d → EReal}
    (hy : ∀ j, 0 ≤ y j ∧ y j < ⊤) (hle : (logGenFun μ)^[m] y ≤ y) :
    limsup (fun r => ⨆ j, ((logGenFun μ)^[r * m] y j).abs) atTop < ⊤ := by
  have hanti : Antitone (fun r => ((logGenFun μ)^[m])^[r] y) :=
    ((logGenFun_mono μ).iterate m).antitone_iterate_of_map_le hle
  have hb : ∀ r, (⨆ j, ((logGenFun μ)^[r * m] y j).abs) ≤ ⨆ j, (y j).abs := by
    intro r
    refine supAbs_mono (fun j => (mapsTo_logGenFun μ).iterate _ (fun j => (hy j).1) j) ?_
    have := hanti (Nat.zero_le r)
    simpa [← Function.iterate_mul, mul_comm] using this
  exact lt_of_le_of_lt (limsup_le_of_le (h := Eventually.of_forall hb)) (supAbs_lt_top hy)

end Helpers

section Lemma212

/-- **Lemma 2.13** (first part, paper.tex:675-697): `g^{(m)}(x) < x` implies `x ∈ S₀`. -/
theorem mem_basinZero_of_iterate_lt (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hI : IsSubcritical μ) (hII : IsPositiveRegular μ ∧ IsNonsingular μ)
    (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j})
    {x : Fin d → EReal} (hx : ∀ j, 0 ≤ x j ∧ x j < ⊤) {m : ℕ} (hm : 1 ≤ m)
    (hle : (logGenFun μ)^[m] x ≤ x) (hne : (logGenFun μ)^[m] x ≠ x) :
    x ∈ basinZero μ := by
  have _ := hIII
  have hext : ∀ k, pathLaw μ (Finsupp.single k 1) (extinctionEvent (Fin d)) = 1 := fun k =>
    pathLaw_extinctionEvent_eq_one μ hI _
  have hpr := hII.1
  have hx0 : ∀ j, 0 ≤ x j := fun j => (hx j).1
  have hbd := limsup_lt_top_of_iterate_le μ hx hle
  have hfin : ∀ n k, (logGenFun μ)^[n] x k ≠ ⊤ := fun n k =>
    logGenFun_iterate_ne_top μ hpr hm hx0 hbd n k
  obtain ⟨N, hN⟩ := exists_logGenFun_iterate_strict μ hpr
  refine ⟨hx0, tendsto_of_forall_residue (Nat.succ_le_iff.1 hm) fun s hs => ?_⟩
  -- the residue class of `s`, started at the time `n = s + N m ≥ N`
  set n : ℕ := s + N * m with hn
  have hNn : N ≤ n := by
    have : N ≤ N * m := Nat.le_mul_of_pos_right N hm
    omega
  set xs : Fin d → EReal := (logGenFun μ)^[n] x with hxs
  have hxs0 : ∀ j, 0 ≤ xs j := fun j => (mapsTo_logGenFun μ).iterate n hx0 j
  have hxsfin : ∀ j, xs j < ⊤ := fun j => lt_top_iff_ne_top.2 (hfin n j)
  have hcomm : (logGenFun μ)^[m] xs = (logGenFun μ)^[n] ((logGenFun μ)^[m] x) :=
    iterate_comm_apply μ m n x
  have hle' : (logGenFun μ)^[m] xs ≤ xs := by
    rw [hcomm]
    exact (logGenFun_mono μ).iterate n hle
  have hne' : (logGenFun μ)^[m] xs ≠ xs := by
    obtain ⟨k, hk⟩ := Function.ne_iff.1 hne
    intro h
    have hlt := hN n hNn ((logGenFun μ)^[m] x) x (fun j => (mapsTo_logGenFun μ).iterate m hx0 j)
      (fun j => (hx j).2) hle hne k (lt_top_iff_ne_top.2 (hfin n k))
    rw [hcomm] at h
    exact (ne_of_lt hlt) (congrFun h k)
  have hbd' := limsup_lt_top_of_iterate_le μ (fun j => ⟨hxs0 j, hxsfin j⟩) hle'
  have h0 := tendsto_zero_of_lt μ hext hpr hm (x := xs) (y := (logGenFun μ)^[m] xs)
    (fun j => ⟨hxs0 j, hxsfin j⟩) hbd' (fun j => (mapsTo_logGenFun μ).iterate m hxs0 j) hle' hne'
  have h1 : ∀ r, ⨆ j, ((logGenFun μ)^[r * m] ((logGenFun μ)^[m] xs) j).abs =
      ⨆ j, ((logGenFun μ)^[(r + (1 + N)) * m + s] x j).abs := by
    intro r
    have : r * m + m + n = (r + (1 + N)) * m + s := by rw [hn]; ring
    rw [← Function.iterate_add_apply, ← Function.iterate_add_apply, this]
  simp_rw [h1] at h0
  exact (tendsto_add_atTop_iff_nat (1 + N)).1 (by simpa [Function.comp_def, add_mul] using h0)

/-- The class lemma behind the second part of Lemma 2.13: if `y ≤ g^{(m)} y` strictly, `y` and
`g^{(m)} y` finite, then `|g^{(r m)} y| → ∞`. -/
lemma tendsto_top_of_iterate_class (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hext : ∀ k, pathLaw μ (Finsupp.single k 1) (extinctionEvent (Fin d)) = 1)
    (hpr : IsPositiveRegular μ) {m : ℕ} (hm : 1 ≤ m) {y : Fin d → EReal}
    (hy : ∀ j, 0 ≤ y j ∧ y j < ⊤) (hy' : ∀ j, (logGenFun μ)^[m] y j < ⊤)
    (hle : y ≤ (logGenFun μ)^[m] y) (hne : y ≠ (logGenFun μ)^[m] y) :
    Tendsto (fun r => ⨆ j, ((logGenFun μ)^[r * m] y j).abs) atTop (𝓝 ⊤) := by
  have hy0 : ∀ j, 0 ≤ y j := fun j => (hy j).1
  set h : ℕ → ℝ≥0∞ := fun r => ⨆ j, ((logGenFun μ)^[r * m] y j).abs with hh
  have hmono : Monotone (fun r => ((logGenFun μ)^[m])^[r] y) :=
    ((logGenFun_mono μ).iterate m).monotone_iterate_of_le_map hle
  have hhmono : Monotone h := by
    intro a b hab
    refine supAbs_mono (fun j => (mapsTo_logGenFun μ).iterate _ hy0 j) ?_
    have := hmono hab
    simpa [← Function.iterate_mul, mul_comm] using this
  have hlim : Tendsto h atTop (𝓝 (⨆ r, h r)) := tendsto_atTop_iSup hhmono
  have hy_ne : y ≠ 0 := by
    intro h0
    apply hne
    rw [h0, Function.iterate_fixed (logGenFun_zero μ)]
  have hpos : 0 < limsup h atTop := by
    obtain ⟨j, hj⟩ := Function.ne_iff.1 hy_ne
    have hjpos : 0 < y j := lt_of_le_of_ne (hy0 j) (Ne.symm hj)
    have h0 : 0 < (y j).abs := by
      rw [abs_eq_toENNReal (hy0 j)]
      exact EReal.toENNReal_pos_iff.2 hjpos
    rw [hlim.limsup_eq]
    refine lt_of_lt_of_le h0 (le_trans (le_iSup (fun j => (y j).abs) j) (le_iSup h 0 |>.trans' ?_))
    simp [hh]
  have htop := limsup_eq_top_of_lt μ hext hpr hm hy0 hpos
    (fun j => ⟨(mapsTo_logGenFun μ).iterate m hy0 j, hy' j⟩) hle hne
  have hshift : limsup h atTop = ⊤ := by
    have h1 : (fun r => ⨆ j, ((logGenFun μ)^[r * m] ((logGenFun μ)^[m] y) j).abs) =
        fun r => h (r + 1) := by
      funext r
      simp only [hh]
      rw [← Function.iterate_add_apply, show r * m + m = (r + 1) * m by ring]
    rw [h1, limsup_nat_add h 1] at htop
    exact htop
  rw [hlim.limsup_eq] at hshift
  rwa [hshift] at hlim

/-- **Lemma 2.13** (second part, paper.tex:698-714): `g^{(m)}(x) > x` implies
`|g^{(n)}(x)| → ∞`. -/
theorem tendsto_top_of_lt_iterate (μ : Fin d → PMF (Fin d →₀ ℕ))
    (hI : IsSubcritical μ) (hII : IsPositiveRegular μ ∧ IsNonsingular μ)
    (hIII : ∀ k, ContinuousOn (fun q => genFun μ q k) {q | ∀ j, 0 < q j})
    {x : Fin d → EReal} (hx : ∀ j, 0 ≤ x j ∧ x j < ⊤) {m : ℕ} (hm : 1 ≤ m)
    (hle : x ≤ (logGenFun μ)^[m] x) (hne : x ≠ (logGenFun μ)^[m] x) :
    Tendsto (fun n => ⨆ j, ((logGenFun μ)^[n] x j).abs) atTop (𝓝 ⊤) := by
  have _ := hIII
  have hext : ∀ k, pathLaw μ (Finsupp.single k 1) (extinctionEvent (Fin d)) = 1 := fun k =>
    pathLaw_extinctionEvent_eq_one μ hI _
  have hpr := hII.1
  have hx0 : ∀ j, 0 ≤ x j := fun j => (hx j).1
  by_cases hinf : ∃ n k, (logGenFun μ)^[n] x k = ⊤
  · -- an infinite coordinate: from some time on, `g^{(n)} x = (∞, …, ∞)`
    obtain ⟨n₀, k₀, hk₀⟩ := hinf
    obtain ⟨N₁, hN₁⟩ := exists_logGenFun_iterate_eq_top μ hpr
    refine tendsto_const_nhds.congr' ?_
    refine eventually_atTop.2 ⟨n₀ + N₁, fun n hn => ?_⟩
    obtain ⟨t, ht⟩ := Nat.exists_eq_add_of_le (show n₀ ≤ n by omega)
    have h1 : (logGenFun μ)^[n] x = fun _ => ⊤ := by
      rw [ht, Nat.add_comm, Function.iterate_add_apply]
      funext j
      exact hN₁ _ ((mapsTo_logGenFun μ).iterate n₀ hx0) ⟨k₀, hk₀⟩ t (by omega) j
    change (⊤ : ℝ≥0∞) = ⨆ j, ((logGenFun μ)^[n] x j).abs
    rw [h1]
    exact (eq_top_iff.2 (le_iSup_of_le k₀ (by simp))).symm
  · push Not at hinf
    obtain ⟨N, hN⟩ := exists_logGenFun_iterate_strict μ hpr
    refine tendsto_of_forall_residue (Nat.succ_le_iff.1 hm) fun s hs => ?_
    set n : ℕ := s + N * m with hn
    have hNn : N ≤ n := by
      have : N ≤ N * m := Nat.le_mul_of_pos_right N hm
      omega
    set xs : Fin d → EReal := (logGenFun μ)^[n] x with hxs
    have hxs0 : ∀ j, 0 ≤ xs j := fun j => (mapsTo_logGenFun μ).iterate n hx0 j
    have hxsfin : ∀ j, xs j < ⊤ := fun j => lt_top_iff_ne_top.2 (hinf n j)
    have hcomm : (logGenFun μ)^[m] xs = (logGenFun μ)^[n] ((logGenFun μ)^[m] x) :=
      iterate_comm_apply μ m n x
    have hle' : xs ≤ (logGenFun μ)^[m] xs := by
      rw [hcomm]
      exact (logGenFun_mono μ).iterate n hle
    have hne' : xs ≠ (logGenFun μ)^[m] xs := by
      obtain ⟨k, hk⟩ := Function.ne_iff.1 hne
      intro h
      have hlt := hN n hNn x ((logGenFun μ)^[m] x) hx0
        (fun j => lt_top_iff_ne_top.2 (hinf m j)) hle hne k
        (by rw [← Function.iterate_add_apply]; exact lt_top_iff_ne_top.2 (hinf _ k))
      rw [hcomm] at h
      exact (ne_of_lt hlt) (congrFun h k)
    have h0 := tendsto_top_of_iterate_class μ hext hpr hm (y := xs)
      (fun j => ⟨hxs0 j, hxsfin j⟩)
      (fun j => by rw [hxs, ← Function.iterate_add_apply]; exact lt_top_iff_ne_top.2 (hinf _ j))
      hle' hne'
    have h1 : ∀ r, ⨆ j, ((logGenFun μ)^[r * m] xs j).abs =
        ⨆ j, ((logGenFun μ)^[(r + N) * m + s] x j).abs := by
      intro r
      have : r * m + n = (r + N) * m + s := by rw [hn]; ring
      rw [hxs, ← Function.iterate_add_apply, this]
    simp_rw [h1] at h0
    exact (tendsto_add_atTop_iff_nat N).1 (by simpa [Function.comp_def, add_mul] using h0)

end Lemma212

end Conjugate

end
