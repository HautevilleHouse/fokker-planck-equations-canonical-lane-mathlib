import canonicalLaneMathlib.AdmissibleClass
import FokkerPlanckEquationsCanonicalLaneLean.DriftDiffusion

namespace HautevilleHouse
namespace FokkerPlanckEquationsCanonicalLaneLean

structure InvariantMeasuresPackage (D : DriftDiffusionPackage) where
  stationaryDensity : Prop
  invariantMeasureExists : Prop
  ergodicityProperty : Prop

structure InvariantMeasuresEvidence (D : DriftDiffusionPackage)
    (I : InvariantMeasuresPackage D) where
  stationaryDensityClosed : I.stationaryDensity
  invariantMeasureExistsClosed : I.invariantMeasureExists
  ergodicityPropertyClosed : I.ergodicityProperty

def InvariantMeasuresClosed (D : DriftDiffusionPackage)
    (I : InvariantMeasuresPackage D) : Prop :=
  I.stationaryDensity ∧ I.invariantMeasureExists ∧ I.ergodicityProperty

theorem invariant_measures_closed_from_evidence (D : DriftDiffusionPackage)
    (I : InvariantMeasuresPackage D) (E : InvariantMeasuresEvidence D I) :
    InvariantMeasuresClosed D I := by
  exact And.intro E.stationaryDensityClosed
    (And.intro E.invariantMeasureExistsClosed E.ergodicityPropertyClosed)

end FokkerPlanckEquationsCanonicalLaneLean
end HautevilleHouse