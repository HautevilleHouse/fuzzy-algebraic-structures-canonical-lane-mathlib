import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyAlgebraicStructuresCanonicalLaneLean

structure FuzzyDecomposition (A : Type u) (FA : FuzzyAlgebra A) where
  factors : List (Type u)
  factorAlgebras : List (FuzzyAlgebra (head factors))
  directSumIso : FuzzyHomomorphism FA (ProductFuzzyAlgebra factorAlgebras)

def ProductFuzzyAlgebra (FAs : List (FuzzyAlgebra ?)) : FuzzyAlgebra (ProductType FAs) :=
  {
    membership := λ (a : ProductType FAs) => min_{i} FAs[i].membership (a.i),
    operations := [],
    closureUnderOps := by trivial
  }

end FuzzyAlgebraicStructuresCanonicalLaneLean
end HautevilleHouse