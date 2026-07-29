import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyAlgebraicStructuresCanonicalLaneLean

structure FuzzyAlgebraicAdmittedObject where
  carrier : Type u
  fuzzyRelation : carrier → carrier → ℝ
  fuzzyTransitivity : Prop
  fuzzySymmetry : Prop
  fuzzyReflexivity : Prop
  conclusion : fuzzyReflexivity ∧ fuzzySymmetry ∧ fuzzyTransitivity

structure AdmissibleClass where
  object : FuzzyAlgebraicAdmittedObject
  endpointSatisfied : object.conclusion
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.conclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end FuzzyAlgebraicStructuresCanonicalLaneLean
end HautevilleHouse