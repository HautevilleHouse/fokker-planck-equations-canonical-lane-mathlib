import canonicalLaneMathlib.AdmissibleClass
import FokkerPlanckEquationsCanonicalLaneLean.FokkerPlanckPDE

namespace HautevilleHouse
namespace FokkerPlanckEquationsCanonicalLaneLean

structure WellPosednessPackage {D : DriftDiffusionPackage} (F : FokkerPlanckPDEPackage D) where
  existenceWeakSolution : Prop
  uniquenessWeakSolution : Prop
  continuousDependence : Prop

structure WellPosednessEvidence {D : DriftDiffusionPackage} {F : FokkerPlanckPDEPackage D}
    (W : WellPosednessPackage F) where
  existenceWeakSolutionClosed : W.existenceWeakSolution
  uniquenessWeakSolutionClosed : W.uniquenessWeakSolution
  continuousDependenceClosed : W.continuousDependence

def WellPosednessClosed {D : DriftDiffusionPackage} {F : FokkerPlanckPDEPackage D}
    (W : WellPosednessPackage F) : Prop :=
  W.existenceWeakSolution ∧ W.uniquenessWeakSolution ∧ W.continuousDependence

theorem well_posedness_closed_from_evidence {D : DriftDiffusionPackage} {F : FokkerPlanckPDEPackage D}
    (W : WellPosednessPackage F) (E : WellPosednessEvidence W) : WellPosednessClosed W := by
  exact And.intro E.existenceWeakSolutionClosed
    (And.intro E.uniquenessWeakSolutionClosed E.continuousDependenceClosed)

end FokkerPlanckEquationsCanonicalLaneLean
end HautevilleHouse