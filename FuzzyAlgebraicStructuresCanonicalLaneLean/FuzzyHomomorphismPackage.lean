import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzyAlgebraicStructuresCanonicalLaneLean.FuzzyGroupPackage

namespace HautevilleHouse
namespace FuzzyAlgebraicStructuresCanonicalLaneLean

structure FuzzyHomomorphismPackage {F1 F2 : FuzzySetPackage} (G1 : FuzzyGroupPackage F1) (G2 : FuzzyGroupPackage F2) where
  map : G1.carrier → G2.carrier
  preservesOperation : ∀ x y, map (G1.operation x y) = G2.operation (map x) (map y)
  preservesIdentity : map G1.identity = G2.identity
  preservesInverse : ∀ x, map (G1.inverse x) = G2.inverse (map x)
  fuzzyPreservation : ∀ x, F2.membershipFunction (map x) ≥ F1.membershipFunction x

structure FuzzyHomomorphismEvidence {F1 F2 : FuzzySetPackage} {G1 : FuzzyGroupPackage F1} {G2 : FuzzyGroupPackage F2} (H : FuzzyHomomorphismPackage G1 G2) where
  preservesOperationClosed : ∀ x y, H.map (G1.operation x y) = G2.operation (H.map x) (H.map y)
  preservesIdentityClosed : H.map G1.identity = G2.identity
  preservesInverseClosed : ∀ x, H.map (G1.inverse x) = G2.inverse (H.map x)
  fuzzyPreservationClosed : ∀ x, F2.membershipFunction (H.map x) ≥ F1.membershipFunction x

def FuzzyHomomorphismClosed {F1 F2 : FuzzySetPackage} {G1 : FuzzyGroupPackage F1} {G2 : FuzzyGroupPackage F2} (H : FuzzyHomomorphismPackage G1 G2) : Prop :=
  (∀ x y, H.map (G1.operation x y) = G2.operation (H.map x) (H.map y)) ∧
  (H.map G1.identity = G2.identity) ∧
  (∀ x, H.map (G1.inverse x) = G2.inverse (H.map x)) ∧
  (∀ x, F2.membershipFunction (H.map x) ≥ F1.membershipFunction x)

theorem fuzzy_homomorphism_closed_from_evidence {F1 F2 : FuzzySetPackage} {G1 : FuzzyGroupPackage F1} {G2 : FuzzyGroupPackage F2} (H : FuzzyHomomorphismPackage G1 G2) (E : FuzzyHomomorphismEvidence H) :
    FuzzyHomomorphismClosed H := by
  exact And.intro E.preservesOperationClosed
    (And.intro E.preservesIdentityClosed
      (And.intro E.preservesInverseClosed E.fuzzyPreservationClosed))

end FuzzyAlgebraicStructuresCanonicalLaneLean
end HautevilleHouse