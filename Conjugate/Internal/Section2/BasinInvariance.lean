/-
Conjugate branching processes: a formalization of arXiv:2411.06301v2 (Gwynne–Liu).
-/
module

public import Conjugate.Frozen.Defs.BasinInfty
public import Conjugate.Frozen.Defs.BasinZero
import Conjugate.Internal.Analytic.LogGenFun

/-!
# Invariance of the basins of attraction (Lemma 2.18)

For `g = logGenFun μ`, paper.tex:737-742 states `g(S₀) ⊆ S₀`, `g(S∞) ⊆ S∞`, `g⁻¹(S₀) ⊆ S₀` and
`g⁻¹(S∞) ⊆ S∞`. For `x ∈ [0,∞]^ι` this is the pair of equivalences

* `logGenFun_mem_basinZero_iff`: `g(x) ∈ S₀ ↔ x ∈ S₀`;
* `logGenFun_mem_basinInfty_iff`: `g(x) ∈ S∞ ↔ x ∈ S∞`.

Further statements:

* `iterate_logGenFun_mem_basinZero_iff`, `iterate_logGenFun_mem_basinInfty_iff`: the same for
  `g^{(n)}`;
* `logGenFun_mapsTo_basinZero`, `logGenFun_mapsTo_basinInfty`: `g(S) ⊆ S` as `Set.MapsTo`;
* `basinZero_inter_basinInfty`: `S₀ ∩ S∞ = ∅`.

The proofs use `g^{(n)}(g(x)) = g^{(n+1)}(x)`, so that the sequences defining the basins for `x`
and for `g(x)` differ by a shift, and `g` maps `[0,∞]^ι` into itself.
-/

public section

open Filter Topology

open scoped ENNReal

namespace Conjugate

variable {ι : Type*} [Fintype ι] (μ : ι → PMF (ι →₀ ℕ))

/-- **Lemma 2.18 for `S₀`**: `g(S₀) ⊆ S₀` and `g⁻¹(S₀) ⊆ S₀` (on `[0,∞]^ι`). -/
theorem logGenFun_mem_basinZero_iff {x : ι → EReal} (hx : ∀ j, 0 ≤ x j) :
    logGenFun μ x ∈ basinZero μ ↔ x ∈ basinZero μ := by
  have hgx : ∀ j, 0 ≤ logGenFun μ x j := mapsTo_logGenFun μ hx
  have key : ∀ n, (logGenFun μ)^[n] (logGenFun μ x) = (logGenFun μ)^[n + 1] x := fun n =>
    (Function.iterate_succ_apply _ n x).symm
  simp only [basinZero, Set.mem_ofPred_eq, key]
  constructor
  · rintro ⟨-, h⟩
    exact ⟨hx, (tendsto_add_atTop_iff_nat 1).1 h⟩
  · rintro ⟨-, h⟩
    exact ⟨hgx, (tendsto_add_atTop_iff_nat 1).2 h⟩

/-- **Lemma 2.18 for `S∞`**: `g(S∞) ⊆ S∞` and `g⁻¹(S∞) ⊆ S∞` (on `[0,∞]^ι`). -/
theorem logGenFun_mem_basinInfty_iff {x : ι → EReal} (hx : ∀ j, 0 ≤ x j) :
    logGenFun μ x ∈ basinInfty μ ↔ x ∈ basinInfty μ := by
  have hgx : ∀ j, 0 ≤ logGenFun μ x j := mapsTo_logGenFun μ hx
  have key : ∀ n, (logGenFun μ)^[n] (logGenFun μ x) = (logGenFun μ)^[n + 1] x := fun n =>
    (Function.iterate_succ_apply _ n x).symm
  simp only [basinInfty, Set.mem_ofPred_eq, key]
  rw [limsup_nat_add (fun n => ⨆ j, ((logGenFun μ)^[n] x j).abs) 1]
  exact ⟨fun h => ⟨hx, h.2⟩, fun h => ⟨hgx, h.2⟩⟩

/-- Lemma 2.18 for the iterates, `S₀` (on `[0,∞]^ι`): `g^{(n)}(x) ∈ S₀ ↔ x ∈ S₀`. -/
theorem iterate_logGenFun_mem_basinZero_iff (n : ℕ) {x : ι → EReal} (hx : ∀ j, 0 ≤ x j) :
    (logGenFun μ)^[n] x ∈ basinZero μ ↔ x ∈ basinZero μ := by
  induction n generalizing x with
  | zero => rfl
  | succ n ih =>
    rw [Function.iterate_succ_apply, ih (mapsTo_logGenFun μ hx), logGenFun_mem_basinZero_iff μ hx]

/-- Lemma 2.18 for the iterates, `S∞` (on `[0,∞]^ι`): `g^{(n)}(x) ∈ S∞ ↔ x ∈ S∞`. -/
theorem iterate_logGenFun_mem_basinInfty_iff (n : ℕ) {x : ι → EReal} (hx : ∀ j, 0 ≤ x j) :
    (logGenFun μ)^[n] x ∈ basinInfty μ ↔ x ∈ basinInfty μ := by
  induction n generalizing x with
  | zero => rfl
  | succ n ih =>
    rw [Function.iterate_succ_apply, ih (mapsTo_logGenFun μ hx),
      logGenFun_mem_basinInfty_iff μ hx]

/-- `g(S₀) ⊆ S₀`, as a `Set.MapsTo`. -/
theorem logGenFun_mapsTo_basinZero : Set.MapsTo (logGenFun μ) (basinZero μ) (basinZero μ) :=
  fun _ hx => (logGenFun_mem_basinZero_iff μ hx.1).2 hx

/-- `g(S∞) ⊆ S∞`, as a `Set.MapsTo`. -/
theorem logGenFun_mapsTo_basinInfty : Set.MapsTo (logGenFun μ) (basinInfty μ) (basinInfty μ) :=
  fun _ hx => (logGenFun_mem_basinInfty_iff μ hx.1).2 hx

/-- The basins of attraction of `0` and `∞` are disjoint. -/
theorem basinZero_inter_basinInfty : basinZero μ ∩ basinInfty μ = ∅ := by
  refine Set.eq_empty_of_forall_notMem fun x hx => ?_
  have h0 := hx.1.2.limsup_eq
  have h1 := hx.2.2
  rw [h0] at h1
  exact ENNReal.zero_ne_top h1

end Conjugate

end
