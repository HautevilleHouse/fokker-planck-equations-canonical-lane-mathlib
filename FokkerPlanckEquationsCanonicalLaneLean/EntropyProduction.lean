import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FokkerPlanckEquationsCanonicalLaneLean

structure EntropyProductionRate where
  freeEnergyDissipation : Prop
  fisherInformation : Prop
  entropyMonotonicity : Prop

structure EntropyProductionEvidence (E : EntropyProductionRate) where
  freeEnergyDissipationClosed : E.freeEnergyDissipation
  fisherInformationClosed : E.fisherInformation
  entropyMonotonicityClosed : E.entropyMonotonicity

def EntropyProductionClosed (E : EntropyProductionRate) : Prop :=
  E.freeEnergyDissipation ∧ E.fisherInformation ∧ E.entropyMonotonicity

theorem entropy_production_closed_from_evidence (E : EntropyProductionRate)
    (Ev : EntropyProductionEvidence E) : EntropyProductionClosed E := by
  exact And.intro Ev.freeEnergyDissipationClosed
    (And.intro Ev.fisherInformationClosed Ev.entropyMonotonicityClosed)

end FokkerPlanckEquationsCanonicalLaneLean
end HautevilleHouse