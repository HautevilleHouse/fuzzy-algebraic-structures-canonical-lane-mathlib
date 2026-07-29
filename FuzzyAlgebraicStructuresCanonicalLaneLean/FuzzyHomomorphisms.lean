import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyAlgebraicStructuresCanonicalLaneLean

structure FuzzyHomomorphism (U V : Type u) (F : FuzzySubalgebra U) (G : FuzzySubalgebra V) where
  map : U → V
  membershipPreserved : ∀ x : U, F.carrier x ≤ G.carrier (map x)
  multiplicative : ∀ x y : U, map (x * y) = map x * map y
  unitPreserved : map (1 : U) = (1 : V)

structure FuzzyHomomorphismEvidence (U V : Type u) (F : FuzzySubalgebra U) (G : FuzzySubalgebra V)
    (H : FuzzyHomomorphism U V F G) where
  membershipPreservedTerm : H.membershipPreserved
  multiplicativeTerm : H.multiplicative
  unitPreservedTerm : H.unitPreserved

def FuzzyHomomorphismClosed (U V : Type u) (F : FuzzySubalgebra U) (G : FuzzySubalgebra V)
    (H : FuzzyHomomorphism U V F G) : Prop :=
  H.membershipPreserved ∧ H.multiplicative ∧ H.unitPreserved

theorem fuzzy_homomorphism_closed_from_evidence (U V : Type u) (F : FuzzySubalgebra U)
    (G : FuzzySubalgebra V) (H : FuzzyHomomorphism U V F G)
    (E : FuzzyHomomorphismEvidence U V F G H) : FuzzyHomomorphismClosed U V F G H := by
  exact And.intro E.membershipPreservedTerm (And.intro E.multiplicativeTerm E.unitPreservedTerm)

end FuzzyAlgebraicStructuresCanonicalLaneLean
end HautevilleHouse
