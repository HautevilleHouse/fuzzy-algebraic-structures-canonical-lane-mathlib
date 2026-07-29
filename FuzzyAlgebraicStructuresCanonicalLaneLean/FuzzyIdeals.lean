import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyAlgebraicStructuresCanonicalLaneLean

structure FuzzyIdeal {U : Type u} (F : FuzzySubalgebra U) where
  carrier : U → ℝ
  absorbing : ∀ (x : U) (y : U), carrier x ≤ carrier (x * y) ∧ carrier x ≤ carrier (y * x)

structure FuzzyIdealEvidence {U : Type u} {F : FuzzySubalgebra U} (I : FuzzyIdeal F) where
  absorbingTerm : I.absorbing

def FuzzyIdealClosed {U : Type u} {F : FuzzySubalgebra U} (I : FuzzyIdeal F) : Prop :=
  I.absorbing

theorem fuzzy_ideal_closed_from_evidence {U : Type u} {F : FuzzySubalgebra U}
    (I : FuzzyIdeal F) (E : FuzzyIdealEvidence I) : FuzzyIdealClosed I := by
  exact E.absorbingTerm

end FuzzyAlgebraicStructuresCanonicalLaneLean
end HautevilleHouse
