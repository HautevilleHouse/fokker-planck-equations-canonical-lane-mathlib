import FokkerPlanckEquationsCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace FokkerPlanckEquationsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  FokkerPlanckWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end FokkerPlanckEquationsCanonicalLaneLean
end HautevilleHouse