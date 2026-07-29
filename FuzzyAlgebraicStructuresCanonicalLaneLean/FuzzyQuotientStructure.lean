import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzyAlgebraicStructuresCanonicalLaneLean.FuzzyAlgebraicStructure
import HautevilleHouse.FuzzyAlgebraicStructuresCanonicalLaneLean.FuzzyCongruence

namespace HautevilleHouse
namespace FuzzyAlgebraicStructuresCanonicalLaneLean

structure FuzzyQuotientStructure (X : FuzzyAlgebraicStructure) (C : FuzzyCongruence X) where
  quotientCarrier : Type u
  membershipFunctionQ : quotientCarrier → ℝ
  operationsQ : List (quotientCarrier → quotientCarrier → quotientCarrier)
  projectionMap : X.carrier → quotientCarrier
  respectsCongruence : ∀ x y : X.carrier, C.fuzzyRelation x y ≤ membershipFunctionQ (projectionMap x) ∧
    membershipFunctionQ (projectionMap x) = membershipFunctionQ (projectionMap y)

structure FuzzyQuotientStructureEvidence {X : FuzzyAlgebraicStructure} {C : FuzzyCongruence X}
    (Q : FuzzyQuotientStructure X C) where
  projectionMapClosed : ∀ x : X.carrier, Q.membershipFunctionQ (Q.projectionMap x) = X.membershipFunction x
  respectsCongruenceClosed : Q.respectsCongruence

def FuzzyQuotientStructureClosed {X : FuzzyAlgebraicStructure} {C : FuzzyCongruence X}
    (Q : FuzzyQuotientStructure X C) : Prop :=
  (∀ x : X.carrier, Q.membershipFunctionQ (Q.projectionMap x) = X.membershipFunction x) ∧
  Q.respectsCongruence

theorem fuzzy_quotient_structure_closed_from_evidence
    {X : FuzzyAlgebraicStructure} {C : FuzzyCongruence X}
    (Q : FuzzyQuotientStructure X C) (E : FuzzyQuotientStructureEvidence Q) :
    FuzzyQuotientStructureClosed Q :=
  And.intro E.projectionMapClosed E.respectsCongruenceClosed

end FuzzyAlgebraicStructuresCanonicalLaneLean
end HautevilleHouse