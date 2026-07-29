import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FokkerPlanckEquationsCanonicalLaneLean

structure DriftDiffusionPackage where
  driftRegularity : Prop
  diffusionRegularity : Prop
  uniformEllipticity : Prop
  growthCondition : Prop

structure DriftDiffusionEvidence (D : DriftDiffusionPackage) where
  driftRegularityClosed : D.driftRegularity
  diffusionRegularityClosed : D.diffusionRegularity
  uniformEllipticityClosed : D.uniformEllipticity
  growthConditionClosed : D.growthCondition

def DriftDiffusionClosed (D : DriftDiffusionPackage) : Prop :=
  D.driftRegularity ∧ D.diffusionRegularity ∧ D.uniformEllipticity ∧ D.growthCondition

theorem drift_diffusion_closed_from_evidence (D : DriftDiffusionPackage)
    (E : DriftDiffusionEvidence D) : DriftDiffusionClosed D := by
  exact And.intro E.driftRegularityClosed
    (And.intro E.diffusionRegularityClosed
      (And.intro E.uniformEllipticityClosed E.growthConditionClosed))

end FokkerPlanckEquationsCanonicalLaneLean
end HautevilleHouse