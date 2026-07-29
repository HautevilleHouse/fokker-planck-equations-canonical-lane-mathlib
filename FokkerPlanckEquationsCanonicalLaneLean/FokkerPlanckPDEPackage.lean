import canonicalLaneMathlib.AdmissibleClass

/-!
# Fokker-Planck PDE Package
-/

namespace HautevilleHouse
namespace FokkerPlanckEquationsCanonicalLaneLean

structure FokkerPlanckPDEPackage where
  stateSpace : Type u
  driftField : stateSpace → stateSpace
  diffusionCoefficient : stateSpace → (stateSpace → ℝ)
  initialCondition : stateSpace → ℝ
  timeInterval : ℝ × ℝ
  fokkerPlanckEquation : Prop
  wellPosedness : Prop

structure FokkerPlanckPDEEvidence (F : FokkerPlanckPDEPackage) where
  fokkerPlanckEquationClosed : F.fokkerPlanckEquation
  wellPosednessClosed : F.wellPosedness

def FokkerPlanckPDEClosed (F : FokkerPlanckPDEPackage) : Prop :=
  F.fokkerPlanckEquation ∧ F.wellPosedness

theorem fokker_planck_pde_closed_from_evidence (F : FokkerPlanckPDEPackage)
    (E : FokkerPlanckPDEEvidence F) : FokkerPlanckPDEClosed F := by
  exact And.intro E.fokkerPlanckEquationClosed E.wellPosednessClosed

end FokkerPlanckEquationsCanonicalLaneLean
end HautevilleHouse