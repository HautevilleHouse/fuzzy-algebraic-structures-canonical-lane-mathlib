import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzyAlgebraicStructuresCanonicalLaneLean.FuzzyAlgebraicStructure

namespace HautevilleHouse
namespace FuzzyAlgebraicStructuresCanonicalLaneLean

structure FuzzySubalgebra (X : FuzzyAlgebraicStructure) where
  subcarrier : Set X.carrier
  membershipRestriction : X.carrier → ℝ
  closedUnderOperations : ∀ (f : X.operations) (a b : X.carrier), a ∈ subcarrier → b ∈ subcarrier → f a b ∈ subcarrier
  membershipPreserved : ∀ x : X.carrier, membershipRestriction x = X.membershipFunction x

structure FuzzySubalgebraEvidence {X : FuzzyAlgebraicStructure} (S : FuzzySubalgebra X) where
  subcarrierNonempty : S.subcarrier.Nonempty
  closedUnderOperationsClosed : S.closedUnderOperations
  membershipPreservedClosed : S.membershipPreserved

def FuzzySubalgebraClosed {X : FuzzyAlgebraicStructure} (S : FuzzySubalgebra X) : Prop :=
  S.subcarrier.Nonempty ∧ S.closedUnderOperations ∧ S.membershipPreserved

theorem fuzzy_subalgebra_closed_from_evidence
    {X : FuzzyAlgebraicStructure} (S : FuzzySubalgebra X)
    (E : FuzzySubalgebraEvidence S) : FuzzySubalgebraClosed S :=
  And.intro E.subcarrierNonempty (And.intro E.closedUnderOperationsClosed E.membershipPreservedClosed)

end FuzzyAlgebraicStructuresCanonicalLaneLean
end HautevilleHouse