import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FokkerPlanckEquationsCanonicalLaneLean

structure DiffusionOperator where
  stateSpace : Type u
  driftField : stateSpace → stateSpace
  diffusionMatrix : stateSpace → stateSpace → stateSpace
  smoothCoefficients : Prop
  uniformlyElliptic : Prop
  fokkerPlanckEquationWellDefined : Prop
  invariantMeasureExists : Prop

structure PotentialFunction where
  potential : Type u → ℝ
  confining : Prop
  gradientLipschitz : Prop
  hessianBounded : Prop

structure InvariantMeasurePackage (D : DiffusionOperator) where
  stationaryDensity : D.stateSpace → ℝ
  densityPositivity : Prop
  densitySmoothness : Prop
  satisfiesStationaryFokkerPlanck : Prop
  uniquenessEstablished : Prop

structure InvariantMeasureEvidence (D : DiffusionOperator) (M : InvariantMeasurePackage D) where
  densityPositivityClosed : M.densityPositivity
  densitySmoothnessClosed : M.densitySmoothness
  satisfiesStationaryFokkerPlanckClosed : M.satisfiesStationaryFokkerPlanck
  uniquenessEstablishedClosed : M.uniquenessEstablished

def InvariantMeasureClosed (D : DiffusionOperator) (M : InvariantMeasurePackage D) : Prop :=
  M.densityPositivity ∧ M.densitySmoothness ∧ M.satisfiesStationaryFokkerPlanck ∧ M.uniquenessEstablished

theorem invariant_measure_closed_from_evidence (D : DiffusionOperator) (M : InvariantMeasurePackage D) (E : InvariantMeasureEvidence D M) :
    InvariantMeasureClosed D M := by
  exact And.intro E.densityPositivityClosed (And.intro E.densitySmoothnessClosed (And.intro E.satisfiesStationaryFokkerPlanckClosed E.uniquenessEstablishedClosed))

end FokkerPlanckEquationsCanonicalLaneLean
end HautevilleHouse