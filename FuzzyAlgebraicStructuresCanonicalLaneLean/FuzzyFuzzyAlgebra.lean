import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyAlgebraicStructuresCanonicalLaneLean

structure FuzzyAlgebra (A : Type u) where
  membership : A → ℝ
  operations : List (A → A → A)
  closureUnderOps : Prop

def FuzzyAdmittedObject (A : Type u) (FA : FuzzyAlgebra A) : Prop :=
  FA.closureUnderOps

end FuzzyAlgebraicStructuresCanonicalLaneLean
end HautevilleHouse