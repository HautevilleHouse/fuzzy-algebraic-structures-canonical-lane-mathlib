import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyAlgebraicStructuresCanonicalLaneLean

structure FuzzySubalgebra (U : Type u) where
  carrier : U → ℝ
  multiplicationClosed : ∀ x y : U, min (carrier x) (carrier y) ≤ carrier (x * y)
  unitClosed : carrier (1 : U) = 1

structure FuzzySubalgebraEvidence (U : Type u) (F : FuzzySubalgebra U) where
  multiplicationClosedTerm : F.multiplicationClosed
  unitClosedTerm : F.unitClosed

def FuzzySubalgebraClosed (U : Type u) (F : FuzzySubalgebra U) : Prop :=
  F.multiplicationClosed ∧ F.unitClosed

theorem fuzzy_subalgebra_closed_from_evidence (U : Type u) (F : FuzzySubalgebra U)
    (E : FuzzySubalgebraEvidence U F) : FuzzySubalgebraClosed U F := by
  exact And.intro E.multiplicationClosedTerm E.unitClosedTerm

end FuzzyAlgebraicStructuresCanonicalLaneLean
end HautevilleHouse
