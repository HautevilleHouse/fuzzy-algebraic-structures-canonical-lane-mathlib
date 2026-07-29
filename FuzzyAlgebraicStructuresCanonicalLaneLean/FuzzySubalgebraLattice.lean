import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyAlgebraicStructuresCanonicalLaneLean

structure FuzzySubalgebra (A : Type u) (FA : FuzzyAlgebra A) where
  carrier : Set A
  membershipInherited : ∀ a ∈ carrier, FA.membership a > 0
  closedUnderOperations : Prop

def FuzzySubalgebraLattice (A : Type u) (FA : FuzzyAlgebra A) : Type (u+1) :=
  { S : Set (FuzzySubalgebra FA) // S.Nonempty ? }

end FuzzyAlgebraicStructuresCanonicalLaneLean
end HautevilleHouse