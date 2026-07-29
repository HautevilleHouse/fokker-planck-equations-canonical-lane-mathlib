import FokkerPlanckEquationsCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace FokkerPlanckEquationsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure FokkerPlanckSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure FokkerPlanckAdmittedObject where
  space : FokkerPlanckSpace
  smoothManifold : Prop
  driftDiffusionSystem : Prop
  invariantMeasure : Prop
  conclusion : invariantMeasure

structure FokkerPlanckEndgameState where
  object : FokkerPlanckAdmittedObject

def FokkerPlanckWitnessClosed (O : FokkerPlanckAdmittedObject) : Prop :=
  O.invariantMeasure

end FokkerPlanckEquationsCanonicalLaneLean
end HautevilleHouse