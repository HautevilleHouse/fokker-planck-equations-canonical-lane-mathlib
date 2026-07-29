import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FokkerPlanckEquationsCanonicalLaneLean

structure StochasticProcessBasePackage where
  filteredProbabilitySpace : Prop
  adaptedProcess : Prop
  itoIntegralDefined : Prop
  semimartingaleDecomposition : Prop

structure StochasticProcessBaseEvidence (S : StochasticProcessBasePackage) where
  filteredProbabilitySpaceClosed : S.filteredProbabilitySpace
  adaptedProcessClosed : S.adaptedProcess
  itoIntegralDefinedClosed : S.itoIntegralDefined
  semimartingaleDecompositionClosed : S.semimartingaleDecomposition

def StochasticProcessBaseClosed (S : StochasticProcessBasePackage) : Prop :=
  S.filteredProbabilitySpace ∧ S.adaptedProcess ∧
  S.itoIntegralDefined ∧ S.semimartingaleDecomposition

theorem stochastic_process_base_closed_from_evidence
    (S : StochasticProcessBasePackage) (E : StochasticProcessBaseEvidence S) :
    StochasticProcessBaseClosed S := by
  exact And.intro E.filteredProbabilitySpaceClosed
    (And.intro E.adaptedProcessClosed
      (And.intro E.itoIntegralDefinedClosed E.semimartingaleDecompositionClosed))

end FokkerPlanckEquationsCanonicalLaneLean
end HautevilleHouse