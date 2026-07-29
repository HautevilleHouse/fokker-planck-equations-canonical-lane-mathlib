import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FokkerPlanckEquationsCanonicalLaneLean

structure StationaryDistributionsPackage where
  invariantMeasureExists : Prop
  uniquenessUnderIrreducibility : Prop
  exponentialConvergence : Prop
  poissonEquationWellPosed : Prop

structure StationaryDistributionsEvidence (S : StationaryDistributionsPackage) where
  invariantMeasureExistsClosed : S.invariantMeasureExists
  uniquenessUnderIrreducibilityClosed : S.uniquenessUnderIrreducibility
  exponentialConvergenceClosed : S.exponentialConvergence
  poissonEquationWellPosedClosed : S.poissonEquationWellPosed

def StationaryDistributionsClosed (S : StationaryDistributionsPackage) : Prop :=
  S.invariantMeasureExists ∧ S.uniquenessUnderIrreducibility ∧
  S.exponentialConvergence ∧ S.poissonEquationWellPosed

theorem stationary_distributions_closed_from_evidence
    (S : StationaryDistributionsPackage) (E : StationaryDistributionsEvidence S) :
    StationaryDistributionsClosed S := by
  exact And.intro E.invariantMeasureExistsClosed
    (And.intro E.uniquenessUnderIrreducibilityClosed
      (And.intro E.exponentialConvergenceClosed E.poissonEquationWellPosedClosed))

end FokkerPlanckEquationsCanonicalLaneLean
end HautevilleHouse