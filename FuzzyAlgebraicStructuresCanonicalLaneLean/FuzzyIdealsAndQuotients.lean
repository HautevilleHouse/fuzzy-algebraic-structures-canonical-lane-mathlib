import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyAlgebraicStructuresCanonicalLaneLean

structure FuzzyIdeal (A : Type u) (FA : FuzzyAlgebra A) extends FuzzySubalgebra FA where
  absorbent : ∀ x ∈ carrier, ∀ y : A, FA.membership (x*y) >= FA.membership x

def FuzzyQuotientAlgebra (A : Type u) (FA : FuzzyAlgebra A) (I : FuzzyIdeal FA) : FuzzyAlgebra (A/I) :=
  { membership := λ xI => max_{a∈xI} FA.membership a,
    operations := [],
    closureUnderOps := by trivial }

end FuzzyAlgebraicStructuresCanonicalLaneLean
end HautevilleHouse