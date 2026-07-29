import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzyAlgebraicStructuresCanonicalLaneLean.FuzzySetPackage

namespace HautevilleHouse
namespace FuzzyAlgebraicStructuresCanonicalLaneLean

structure FuzzyGroupPackage (F : FuzzySetPackage) where
  operation : F.carrier → F.carrier → F.carrier
  identity : F.carrier
  inverse : F.carrier → F.carrier
  fuzzyClosure : ∀ x y, F.membershipFunction (operation x y) ≥ min (F.membershipFunction x) (F.membershipFunction y)
  fuzzyAssociative : ∀ x y z, operation (operation x y) z = operation x (operation y z)
  fuzzyIdentity : ∀ x, operation x identity = x ∧ operation identity x = x
  fuzzyInverse : ∀ x, operation x (inverse x) = identity ∧ operation (inverse x) x = identity

structure FuzzyGroupEvidence {F : FuzzySetPackage} (G : FuzzyGroupPackage F) where
  fuzzyClosureClosed : ∀ x y, F.membershipFunction (G.operation x y) ≥ min (F.membershipFunction x) (F.membershipFunction y)
  fuzzyAssociativeClosed : ∀ x y z, G.operation (G.operation x y) z = G.operation x (G.operation y z)
  fuzzyIdentityClosed : ∀ x, G.operation x G.identity = x ∧ G.operation G.identity x = x
  fuzzyInverseClosed : ∀ x, G.operation x (G.inverse x) = G.identity ∧ G.operation (G.inverse x) x = G.identity

def FuzzyGroupClosed {F : FuzzySetPackage} (G : FuzzyGroupPackage F) : Prop :=
  (∀ x y, F.membershipFunction (G.operation x y) ≥ min (F.membershipFunction x) (F.membershipFunction y)) ∧
  (∀ x y z, G.operation (G.operation x y) z = G.operation x (G.operation y z)) ∧
  (∀ x, G.operation x G.identity = x ∧ G.operation G.identity x = x) ∧
  (∀ x, G.operation x (G.inverse x) = G.identity ∧ G.operation (G.inverse x) x = G.identity)

theorem fuzzy_group_closed_from_evidence {F : FuzzySetPackage} (G : FuzzyGroupPackage F) (E : FuzzyGroupEvidence G) :
    FuzzyGroupClosed G := by
  exact And.intro E.fuzzyClosureClosed
    (And.intro E.fuzzyAssociativeClosed
      (And.intro E.fuzzyIdentityClosed E.fuzzyInverseClosed))

end FuzzyAlgebraicStructuresCanonicalLaneLean
end HautevilleHouse