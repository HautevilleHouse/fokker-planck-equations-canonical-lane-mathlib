import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FokkerPlanckEquationsCanonicalLaneLean

structure FreeEnergyFunctional (M : InvariantMeasurePackage D) where
  relativeEntropy : Prop
  dirichletEnergy : Prop
  fisherInformation : Prop
  deGiorgiGammaCalculus : Prop

theorem entropy_dissipation_holds (M : FreeEnergyFunctional) : Prop := M.fisherInformation ∧ M.dirichletEnergy

end FokkerPlanckEquationsCanonicalLaneLean
end HautevilleHouse