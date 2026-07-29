import canonicalLaneMathlib.AdmissibleClass
import FokkerPlanckEquationsCanonicalLaneLean.StochasticAnalysisPackage

/-!
# Entropy Production Package
-/

namespace HautevilleHouse
namespace FokkerPlanckEquationsCanonicalLaneLean

structure EntropyProductionPackage {F : FokkerPlanckPDEPackage}
    {P : ProbabilityFlowPackage F} {S : StochasticAnalysisPackage P} where
  relativeEntropy : Prop
  entropyProductionRate : Prop
  hTheorem : Prop
  fluctuationTheorem : Prop

structure EntropyProductionEvidence {F : FokkerPlanckPDEPackage}
    {P : ProbabilityFlowPackage F} {S : StochasticAnalysisPackage P}
    (E : EntropyProductionPackage S) where
  relativeEntropyClosed : E.relativeEntropy
  entropyProductionRateClosed : E.entropyProductionRate
  hTheoremClosed : E.hTheorem
  fluctuationTheoremClosed : E.fluctuationTheorem

def EntropyProductionClosed {F : FokkerPlanckPDEPackage}
    {P : ProbabilityFlowPackage F} {S : StochasticAnalysisPackage P}
    (E : EntropyProductionPackage S) : Prop :=
  E.relativeEntropy ∧ E.entropyProductionRate ∧ E.hTheorem ∧ E.fluctuationTheorem

theorem entropy_production_closed_from_evidence
    {F : FokkerPlanckPDEPackage} {P : ProbabilityFlowPackage F}
    {S : StochasticAnalysisPackage P} (Epkg : EntropyProductionPackage S)
    (E : EntropyProductionEvidence Epkg) : EntropyProductionClosed Epkg := by
  exact And.intro E.relativeEntropyClosed
    (And.intro E.entropyProductionRateClosed
      (And.intro E.hTheoremClosed E.fluctuationTheoremClosed))

end FokkerPlanckEquationsCanonicalLaneLean
end HautevilleHouse