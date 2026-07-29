import canonicalLaneMathlib.AdmissibleClass
import FokkerPlanckEquationsCanonicalLaneLean.WellPosedness

namespace HautevilleHouse
namespace FokkerPlanckEquationsCanonicalLaneLean

structure LargeDeviationsPackage {D : DriftDiffusionPackage} {F : FokkerPlanckPDEPackage D}
    (W : WellPosednessPackage F) where
  rateFunction : Type u
  largeDeviationPrinciple : Prop
  exitTimeEstimates : Prop

structure LargeDeviationsEvidence {D : DriftDiffusionPackage} {F : FokkerPlanckPDEPackage D}
    {W : WellPosednessPackage F} (L : LargeDeviationsPackage W) where
  largeDeviationPrincipleClosed : L.largeDeviationPrinciple
  exitTimeEstimatesClosed : L.exitTimeEstimates

def LargeDeviationsClosed {D : DriftDiffusionPackage} {F : FokkerPlanckPDEPackage D}
    {W : WellPosednessPackage F} (L : LargeDeviationsPackage W) : Prop :=
  L.largeDeviationPrinciple ∧ L.exitTimeEstimates

theorem large_deviations_closed_from_evidence {D : DriftDiffusionPackage} {F : FokkerPlanckPDEPackage D}
    {W : WellPosednessPackage F} (L : LargeDeviationsPackage W)
    (E : LargeDeviationsEvidence L) : LargeDeviationsClosed L := by
  exact And.intro E.largeDeviationPrincipleClosed E.exitTimeEstimatesClosed

end FokkerPlanckEquationsCanonicalLaneLean
end HautevilleHouse