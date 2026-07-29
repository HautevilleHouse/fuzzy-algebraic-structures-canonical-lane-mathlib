import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzyAlgebraicStructuresCanonicalLaneLean.FuzzyAlgebraicStructure
import HautevilleHouse.FuzzyAlgebraicStructuresCanonicalLaneLean.FuzzyHomomorphism

namespace HautevilleHouse
namespace FuzzyAlgebraicStructuresCanonicalLaneLean

structure FuzzyFreeStructure (X : Set Type) where
  carrier : Type u
  membershipFunction : carrier → ℝ
  basis : X → carrier
  universalProperty : ∀ (Y : FuzzyAlgebraicStructure) (f : X → Y.carrier),
    ∃! φ : FuzzyHomomorphism (FuzzyAlgebraicStructure.mk carrier membershipFunction []) Y,
      ∀ x : X, φ.map (basis x) = f x

structure FuzzyFreeStructureEvidence (F : FuzzyFreeStructure X) where
  universalPropertyClosed : F.universalProperty

def FuzzyFreeStructureClosed (F : FuzzyFreeStructure X) : Prop :=
  F.universalProperty

theorem fuzzy_free_structure_closed_from_evidence
    (F : FuzzyFreeStructure X) (E : FuzzyFreeStructureEvidence F) :
    FuzzyFreeStructureClosed F :=
  E.universalPropertyClosed

end FuzzyAlgebraicStructuresCanonicalLaneLean
end HautevilleHouse