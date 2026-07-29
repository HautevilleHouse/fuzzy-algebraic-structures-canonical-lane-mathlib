import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzyAlgebraicStructuresCanonicalLaneLean.FuzzyHomomorphismPackage

namespace HautevilleHouse
namespace FuzzyAlgebraicStructuresCanonicalLaneLean

structure FuzzyIsomorphismPackage {F1 F2 : FuzzySetPackage} (G1 : FuzzyGroupPackage F1) (G2 : FuzzyGroupPackage F2) extends FuzzyHomomorphismPackage G1 G2 where
  invMap : G2.carrier → G1.carrier
  leftInverse : ∀ x, invMap (map x) = x
  rightInverse : ∀ y, map (invMap y) = y
  fuzzyInvPreservation : ∀ y, F1.membershipFunction (invMap y) ≥ F2.membershipFunction y

structure FuzzyIsomorphismEvidence {F1 F2 : FuzzySetPackage} {G1 : FuzzyGroupPackage F1} {G2 : FuzzyGroupPackage F2} (I : FuzzyIsomorphismPackage G1 G2) where
  preservesOperationClosed : ∀ x y, I.map (G1.operation x y) = G2.operation (I.map x) (I.map y)
  preservesIdentityClosed : I.map G1.identity = G2.identity
  preservesInverseClosed : ∀ x, I.map (G1.inverse x) = G2.inverse (I.map x)
  fuzzyPreservationClosed : ∀ x, F2.membershipFunction (I.map x) ≥ F1.membershipFunction x
  leftInverseClosed : ∀ x, I.invMap (I.map x) = x
  rightInverseClosed : ∀ y, I.map (I.invMap y) = y
  fuzzyInvPreservationClosed : ∀ y, F1.membershipFunction (I.invMap y) ≥ F2.membershipFunction y

def FuzzyIsomorphismClosed {F1 F2 : FuzzySetPackage} {G1 : FuzzyGroupPackage F1} {G2 : FuzzyGroupPackage F2} (I : FuzzyIsomorphismPackage G1 G2) : Prop :=
  (∀ x y, I.map (G1.operation x y) = G2.operation (I.map x) (I.map y)) ∧
  (I.map G1.identity = G2.identity) ∧
  (∀ x, I.map (G1.inverse x) = G2.inverse (I.map x)) ∧
  (∀ x, F2.membershipFunction (I.map x) ≥ F1.membershipFunction x) ∧
  (∀ x, I.invMap (I.map x) = x) ∧
  (∀ y, I.map (I.invMap y) = y) ∧
  (∀ y, F1.membershipFunction (I.invMap y) ≥ F2.membershipFunction y)

theorem fuzzy_isomorphism_closed_from_evidence {F1 F2 : FuzzySetPackage} {G1 : FuzzyGroupPackage F1} {G2 : FuzzyGroupPackage F2} (I : FuzzyIsomorphismPackage G1 G2) (E : FuzzyIsomorphismEvidence I) :
    FuzzyIsomorphismClosed I := by
  exact And.intro E.preservesOperationClosed
    (And.intro E.preservesIdentityClosed
      (And.intro E.preservesInverseClosed
        (And.intro E.fuzzyPreservationClosed
          (And.intro E.leftInverseClosed
            (And.intro E.rightInverseClosed E.fuzzyInvPreservationClosed)))))

end FuzzyAlgebraicStructuresCanonicalLaneLean
end HautevilleHouse