import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FokkerPlanckEquationsCanonicalLaneLean

structure OrnsteinUhlenbeckProcess where
  linearDrift : Prop
  constantDiffusion : Prop
  exactSolution : Prop

structure OrnsteinUhlenbeckEvidence (O : OrnsteinUhlenbeckProcess) where
  linearDriftClosed : O.linearDrift
  constantDiffusionClosed : O.constantDiffusion
  exactSolutionClosed : O.exactSolution

def OrnsteinUhlenbeckClosed (O : OrnsteinUhlenbeckProcess) : Prop :=
  O.linearDrift ∧ O.constantDiffusion ∧ O.exactSolution

theorem ornstein_uhlenbeck_closed_from_evidence (O : OrnsteinUhlenbeckProcess)
    (E : OrnsteinUhlenbeckEvidence O) : OrnsteinUhlenbeckClosed O := by
  exact And.intro E.linearDriftClosed
    (And.intro E.constantDiffusionClosed E.exactSolutionClosed)

end FokkerPlanckEquationsCanonicalLaneLean
end HautevilleHouse