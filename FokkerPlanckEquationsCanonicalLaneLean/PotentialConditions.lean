import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FokkerPlanckEquationsCanonicalLaneLean

structure PotentialCondition where
  gradientFlowStructure : Prop
  detailedBalance : Prop
  reversibleMeasure : Prop

structure PotentialConditionEvidence (P : PotentialCondition) where
  gradientFlowStructureClosed : P.gradientFlowStructure
  detailedBalanceClosed : P.detailedBalance
  reversibleMeasureClosed : P.reversibleMeasure

def PotentialConditionClosed (P : PotentialCondition) : Prop :=
  P.gradientFlowStructure ∧ P.detailedBalance ∧ P.reversibleMeasure

theorem potential_condition_closed_from_evidence (P : PotentialCondition)
    (E : PotentialConditionEvidence P) : PotentialConditionClosed P := by
  exact And.intro E.gradientFlowStructureClosed
    (And.intro E.detailedBalanceClosed E.reversibleMeasureClosed)

end FokkerPlanckEquationsCanonicalLaneLean
end HautevilleHouse