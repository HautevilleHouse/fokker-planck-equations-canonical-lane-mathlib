import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FokkerPlanckEquationsCanonicalLaneLean

structure ForwardBackwardKolmoPackage where
  forwardEquationFormulated : Prop
  backwardEquationFormulated : Prop
  dualityRelation : Prop
  transitionDensityFormulated : Prop

structure ForwardBackwardKolmoEvidence (K : ForwardBackwardKolmoPackage) where
  forwardEquationFormulatedClosed : K.forwardEquationFormulated
  backwardEquationFormulatedClosed : K.backwardEquationFormulated
  dualityRelationClosed : K.dualityRelation
  transitionDensityFormulatedClosed : K.transitionDensityFormulated

def ForwardBackwardKolmoClosed (K : ForwardBackwardKolmoPackage) : Prop :=
  K.forwardEquationFormulated ∧ K.backwardEquationFormulated ∧
  K.dualityRelation ∧ K.transitionDensityFormulated

theorem forward_backward_kolmo_closed_from_evidence
    (K : ForwardBackwardKolmoPackage) (E : ForwardBackwardKolmoEvidence K) :
    ForwardBackwardKolmoClosed K := by
  exact And.intro E.forwardEquationFormulatedClosed
    (And.intro E.backwardEquationFormulatedClosed
      (And.intro E.dualityRelationClosed E.transitionDensityFormulatedClosed))

end FokkerPlanckEquationsCanonicalLaneLean
end HautevilleHouse