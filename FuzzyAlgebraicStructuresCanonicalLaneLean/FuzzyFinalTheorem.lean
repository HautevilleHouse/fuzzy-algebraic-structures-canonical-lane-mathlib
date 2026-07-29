import FuzzyAlgebraicStructuresCanonicalLaneLean.BridgeLemmas
import FuzzyAlgebraicStructuresCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace FuzzyAlgebraicStructuresCanonicalLaneLean

def ConstrainedFuzzyAlgebraicClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_fuzzy_algebraic_endgame (A : AdmissibleClass) :
    ConstrainedFuzzyAlgebraicClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FuzzyAlgebraicStructuresCanonicalLaneLean
end HautevilleHouse