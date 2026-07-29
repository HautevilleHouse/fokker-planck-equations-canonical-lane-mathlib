import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FokkerPlanckEquationsCanonicalLaneLean

structure DriftDiffusionPackage where
  driftVectorField : Type u
  diffusionMatrix : Type v
  positiveDefiniteDiffusion : Prop
  driftRegularity : Prop
  diffusionRegularity : Prop

structure DriftDiffusionEvidence (D : DriftDiffusionPackage) where
  positiveDefiniteDiffusionClosed : D.positiveDefiniteDiffusion
  driftRegularityClosed : D.driftRegularity
  diffusionRegularityClosed : D.diffusionRegularity

def DriftDiffusionClosed (D : DriftDiffusionPackage) : Prop :=
  D.positiveDefiniteDiffusion ∧ D.driftRegularity ∧ D.diffusionRegularity

theorem drift_diffusion_closed_from_evidence (D : DriftDiffusionPackage)
    (E : DriftDiffusionEvidence D) : DriftDiffusionClosed D := by
  exact And.intro E.positiveDefiniteDiffusionClosed
    (And.intro E.driftRegularityClosed E.diffusionRegularityClosed)

end FokkerPlanckEquationsCanonicalLaneLean
end HautevilleHouse