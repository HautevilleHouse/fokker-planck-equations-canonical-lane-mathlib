import canonicalLaneMathlib.AdmissibleClass
import FokkerPlanckEquationsCanonicalLaneLean.ProbabilityFlowPackage

/-!
# Stochastic Analysis Package
-/

namespace HautevilleHouse
namespace FokkerPlanckEquationsCanonicalLaneLean

structure StochasticAnalysisPackage {F : FokkerPlanckPDEPackage}
    (P : ProbabilityFlowPackage F) where
  itoCalculus : Prop
  girsanovTransform : Prop
  stationaryDistribution : Prop
  invariantMeasure : Prop

structure StochasticAnalysisEvidence {F : FokkerPlanckPDEPackage}
    {P : ProbabilityFlowPackage F} (S : StochasticAnalysisPackage P) where
  itoCalculusClosed : S.itoCalculus
  girsanovTransformClosed : S.girsanovTransform
  stationaryDistributionClosed : S.stationaryDistribution
  invariantMeasureClosed : S.invariantMeasure

def StochasticAnalysisClosed {F : FokkerPlanckPDEPackage}
    {P : ProbabilityFlowPackage F} (S : StochasticAnalysisPackage P) : Prop :=
  S.itoCalculus ∧ S.girsanovTransform ∧ S.stationaryDistribution ∧ S.invariantMeasure

theorem stochastic_analysis_closed_from_evidence
    {F : FokkerPlanckPDEPackage} {P : ProbabilityFlowPackage F}
    (S : StochasticAnalysisPackage P) (E : StochasticAnalysisEvidence S) :
    StochasticAnalysisClosed S := by
  exact And.intro E.itoCalculusClosed
    (And.intro E.girsanovTransformClosed
      (And.intro E.stationaryDistributionClosed E.invariantMeasureClosed))

end FokkerPlanckEquationsCanonicalLaneLean
end HautevilleHouse