import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzyAlgebraicStructuresCanonicalLaneLean.FuzzyAlgebraicStructure

namespace HautevilleHouse
namespace FuzzyAlgebraicStructuresCanonicalLaneLean

structure FuzzyCongruence (X : FuzzyAlgebraicStructure) where
  fuzzyRelation : X.carrier → X.carrier → ℝ
  reflexive : ∀ x : X.carrier, fuzzyRelation x x = 1
  symmetric : ∀ x y : X.carrier, fuzzyRelation x y = fuzzyRelation y x
  transitive : ∀ x y z : X.carrier, fuzzyRelation x z ≥ min (fuzzyRelation x y) (fuzzyRelation y z)
  compatible : ∀ (f : X.operations) (a b c d : X.carrier),
    min (fuzzyRelation a c) (fuzzyRelation b d) ≤ fuzzyRelation (f a b) (f c d)

structure FuzzyCongruenceEvidence {X : FuzzyAlgebraicStructure} (C : FuzzyCongruence X) where
  reflexiveClosed : C.reflexive
  symmetricClosed : C.symmetric
  transitiveClosed : C.transitive
  compatibleClosed : C.compatible

def FuzzyCongruenceClosed {X : FuzzyAlgebraicStructure} (C : FuzzyCongruence X) : Prop :=
  C.reflexive ∧ C.symmetric ∧ C.transitive ∧ C.compatible

theorem fuzzy_congruence_closed_from_evidence
    {X : FuzzyAlgebraicStructure} (C : FuzzyCongruence X)
    (E : FuzzyCongruenceEvidence C) : FuzzyCongruenceClosed C :=
  And.intro E.reflexiveClosed
    (And.intro E.symmetricClosed
      (And.intro E.transitiveClosed E.compatibleClosed))

end FuzzyAlgebraicStructuresCanonicalLaneLean
end HautevilleHouse