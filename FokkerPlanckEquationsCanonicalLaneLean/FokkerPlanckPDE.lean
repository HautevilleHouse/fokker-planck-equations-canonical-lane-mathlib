import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FokkerPlanckEquationsCanonicalLaneLean

structure FokkerPlanckPDEPackage where
  stateSpace : Type u
  topology : TopologicalSpace stateSpace
  driftField : stateSpace → stateSpace
  diffusionField : stateSpace → (stateSpace → ℝ)
  initialDensity : stateSpace → ℝ
  timeDomain : Type v
  timeTopology : TopologicalSpace timeDomain
  fokkerPlanckEquation : Prop
  normalizationPreserved : Prop
  positivityPreserved : Prop

structure FokkerPlanckPDEEvidence (F : FokkerPlanckPDEPackage) where
  fokkerPlanckEquationClosed : F.fokkerPlanckEquation
  normalizationPreservedClosed : F.normalizationPreserved
  positivityPreservedClosed : F.positivityPreserved

def FokkerPlanckPDEClosed (F : FokkerPlanckPDEPackage) : Prop :=
  F.fokkerPlanckEquation ∧ F.normalizationPreserved ∧ F.positivityPreserved

theorem fokker_planck_pde_closed_from_evidence (F : FokkerPlanckPDEPackage)
    (E : FokkerPlanckPDEEvidence F) : FokkerPlanckPDEClosed F := by
  exact And.intro E.fokkerPlanckEquationClosed
    (And.intro E.normalizationPreservedClosed E.positivityPreservedClosed)

end FokkerPlanckEquationsCanonicalLaneLean
end HautevilleHouse