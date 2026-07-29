import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FokkerPlanckEquationsCanonicalLaneLean

structure ProbabilityCurrentDensity where
  driftCurrent : Prop
  diffusionCurrent : Prop
  totalCurrentConservation : Prop

structure ProbabilityCurrentEvidence (J : ProbabilityCurrentDensity) where
  driftCurrentClosed : J.driftCurrent
  diffusionCurrentClosed : J.diffusionCurrent
  totalCurrentConservationClosed : J.totalCurrentConservation

def ProbabilityCurrentClosed (J : ProbabilityCurrentDensity) : Prop :=
  J.driftCurrent ∧ J.diffusionCurrent ∧ J.totalCurrentConservation

theorem probability_current_closed_from_evidence (J : ProbabilityCurrentDensity)
    (E : ProbabilityCurrentEvidence J) : ProbabilityCurrentClosed J := by
  exact And.intro E.driftCurrentClosed
    (And.intro E.diffusionCurrentClosed E.totalCurrentConservationClosed)

end FokkerPlanckEquationsCanonicalLaneLean
end HautevilleHouse