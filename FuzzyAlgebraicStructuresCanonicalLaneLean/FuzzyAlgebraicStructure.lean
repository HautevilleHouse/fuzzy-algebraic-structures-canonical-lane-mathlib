import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyAlgebraicStructuresCanonicalLaneLean

structure FuzzyAlgebraicStructure where
  carrier : Type u
  membershipFunction : carrier → ℝ
  operations : List (carrier → carrier → carrier)
  fuzzyClosure : Prop

structure FuzzyAlgebraicStructureEvidence (F : FuzzyAlgebraicStructure) where
  membershipValuesInUnitInterval : ∀ x : F.carrier, 0 ≤ F.membershipFunction x ∧ F.membershipFunction x ≤ 1
  operationRespectsMembership : Prop

end FuzzyAlgebraicStructuresCanonicalLaneLean
end HautevilleHouse