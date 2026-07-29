import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzyAlgebraicStructuresCanonicalLaneLean.FuzzyAlgebraicStructure
import HautevilleHouse.FuzzyAlgebraicStructuresCanonicalLaneLean.FuzzySubalgebra
import HautevilleHouse.FuzzyAlgebraicStructuresCanonicalLaneLean.FuzzyHomomorphism

namespace HautevilleHouse
namespace FuzzyAlgebraicStructuresCanonicalLaneLean

structure FuzzyRepresentationTheorem (X : FuzzyAlgebraicStructure) where
  subalgebraFamily : Set (FuzzySubalgebra X)
  homomorphismFamily : Set (FuzzyHomomorphism X X)
  representationProperty : ∀ x : X.carrier, X.membershipFunction x = sup (λ S : subalgebraFamily => S.membershipRestriction x)

structure FuzzyRepresentationTheoremEvidence {X : FuzzyAlgebraicStructure}
    (R : FuzzyRepresentationTheorem X) where
  representationPropertyClosed : R.representationProperty

def FuzzyRepresentationTheoremClosed {X : FuzzyAlgebraicStructure}
    (R : FuzzyRepresentationTheorem X) : Prop :=
  R.representationProperty

theorem fuzzy_representation_theorem_closed_from_evidence
    {X : FuzzyAlgebraicStructure} (R : FuzzyRepresentationTheorem X)
    (E : FuzzyRepresentationTheoremEvidence R) : FuzzyRepresentationTheoremClosed R :=
  E.representationPropertyClosed

end FuzzyAlgebraicStructuresCanonicalLaneLean
end HautevilleHouse