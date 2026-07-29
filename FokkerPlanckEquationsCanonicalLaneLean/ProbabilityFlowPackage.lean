import canonicalLaneMathlib.AdmissibleClass
import FokkerPlanckEquationsCanonicalLaneLean.FokkerPlanckPDEPackage

/-!
# Probability Flow Package
-/

namespace HautevilleHouse
namespace FokkerPlanckEquationsCanonicalLaneLean

structure ProbabilityFlowPackage {F : FokkerPlanckPDEPackage} where
  sdeRepresentation : Prop
  diffusionBridge : Prop
  fluctuationDissipation : Prop
  entropyProduction : Prop

structure ProbabilityFlowEvidence {F : FokkerPlanckPDEPackage}
    (P : ProbabilityFlowPackage F) where
  sdeRepresentationClosed : P.sdeRepresentation
  diffusionBridgeClosed : P.diffusionBridge
  entropyProductionClosed : P.entropyProduction

def ProbabilityFlowClosed {F : FokkerPlanckPDEPackage}
    (P : ProbabilityFlowPackage F) : Prop :=
  P.sdeRepresentation ∧ P.diffusionBridge ∧ P.entropyProduction

theorem probability_flow_closed_from_evidence
    {F : FokkerPlanckPDEPackage} (P : ProbabilityFlowPackage F)
    (E : ProbabilityFlowEvidence P) : ProbabilityFlowClosed P := by
  exact And.intro E.sdeRepresentationClosed
    (And.intro E.diffusionBridgeClosed E.entropyProductionClosed)

end FokkerPlanckEquationsCanonicalLaneLean
end HautevilleHouse