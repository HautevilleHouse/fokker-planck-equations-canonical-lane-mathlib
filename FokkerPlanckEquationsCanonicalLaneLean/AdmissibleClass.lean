import FokkerPlanckEquationsCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace FokkerPlanckEquationsCanonicalLaneLean

structure AdmissibleClass where
  object : FokkerPlanckAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  FokkerPlanckWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end FokkerPlanckEquationsCanonicalLaneLean
end HautevilleHouse