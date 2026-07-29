import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzyAlgebraicStructuresCanonicalLaneLean.FuzzyAlgebraicStructure

namespace HautevilleHouse
namespace FuzzyAlgebraicStructuresCanonicalLaneLean

structure FuzzyHomomorphism (X Y : FuzzyAlgebraicStructure) where
  map : X.carrier → Y.carrier
  respectsMembership : ∀ x : X.carrier, Y.membershipFunction (map x) ≤ X.membershipFunction x
  respectsOperations : ∀ (f : X.operations) (a b : X.carrier), map (f a b) = (f.map? (map a) (map b))
  where
    map? : (X.carrier → X.carrier → X.carrier) → (Y.carrier → Y.carrier → Y.carrier)

structure FuzzyHomomorphismEvidence {X Y : FuzzyAlgebraicStructure} (φ : FuzzyHomomorphism X Y) where
  respectsMembershipClosed : φ.respectsMembership
  respectsOperationsClosed : φ.respectsOperations

def FuzzyHomomorphismClosed {X Y : FuzzyAlgebraicStructure} (φ : FuzzyHomomorphism X Y) : Prop :=
  φ.respectsMembership ∧ φ.respectsOperations

theorem fuzzy_homomorphism_closed_from_evidence
    {X Y : FuzzyAlgebraicStructure} (φ : FuzzyHomomorphism X Y)
    (E : FuzzyHomomorphismEvidence φ) : FuzzyHomomorphismClosed φ :=
  And.intro E.respectsMembershipClosed E.respectsOperationsClosed

end FuzzyAlgebraicStructuresCanonicalLaneLean
end HautevilleHouse