import Mathlib.Topology.Basic

/-!
# Drift-Diffusion Package
-/

namespace HautevilleHouse
namespace FokkerPlanckEquationsCanonicalLaneLean

structure DriftDiffusionPackage where
  stateSpace : Type u
  topology : TopologicalSpace stateSpace
  driftField : Type v
  diffusionMatrix : Type w
  smoothStateSpace : Prop
  driftSmooth : Prop
  diffusionSmooth : Prop
  uniformEllipticity : Prop

structure DriftDiffusionEvidence (D : DriftDiffusionPackage) where
  smoothStateSpaceClosed : D.smoothStateSpace
  driftSmoothClosed : D.driftSmooth
  diffusionSmoothClosed : D.diffusionSmooth
  uniformEllipticityClosed : D.uniformEllipticity

def DriftDiffusionClosed (D : DriftDiffusionPackage) : Prop :=
  D.smoothStateSpace ∧
  D.driftSmooth ∧
  D.diffusionSmooth ∧
  D.uniformEllipticity

theorem drift_diffusion_closed_from_evidence
    (D : DriftDiffusionPackage) (E : DriftDiffusionEvidence D) :
    DriftDiffusionClosed D := by
  exact And.intro E.smoothStateSpaceClosed
    (And.intro E.driftSmoothClosed
      (And.intro E.diffusionSmoothClosed E.uniformEllipticityClosed))

end FokkerPlanckEquationsCanonicalLaneLean
end HautevilleHouse