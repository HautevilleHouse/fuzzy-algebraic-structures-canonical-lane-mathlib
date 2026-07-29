import FuzzyAlgebraicStructuresCanonicalLaneLean.FuzzyAlgebraicStructure

namespace HautevilleHouse
namespace FuzzyAlgebraicStructuresCanonicalLaneLean

structure FuzzySubalgebraEvidence {α : Type u} [Add α] [Mul α]
    (A : FuzzyAlgebraicStructure α) (S : FuzzySubalgebra α A) where
  closureCondition : ∀ x, A.membership x = 1 → x ∈ S.carrier

def FuzzySubalgebraClosed {α : Type u} [Add α] [Mul α]
    (A : FuzzyAlgebraicStructure α) (S : FuzzySubalgebra α A) : Prop :=
  S.closedUnderAdd ∧ S.closedUnderMul ∧ S.membershipClosed

theorem fuzzy_subalgebra_closed_from_evidence {α : Type u} [Add α] [Mul α]
    (A : FuzzyAlgebraicStructure α) (S : FuzzySubalgebra α A)
    (E : FuzzySubalgebraEvidence A S) : FuzzySubalgebraClosed A S := by
  refine ⟨S.closedUnderAdd, S.closedUnderMul, ?_⟩
  intro x; constructor
  · intro h; exact E.closureCondition x h
  · intro h; exact S.membershipClosed x h

end FuzzyAlgebraicStructuresCanonicalLaneLean
end HautevilleHouse