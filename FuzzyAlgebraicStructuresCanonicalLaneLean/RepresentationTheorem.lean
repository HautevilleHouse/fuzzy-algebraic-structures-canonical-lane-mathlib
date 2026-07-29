import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyAlgebraicStructuresCanonicalLaneLean

structure RepresentationTheoremPackage {A : AdmissibleClass} (L : LatticeTheoreticExtensionPackage A) where
  embeddingMap : L.carrier → (L.carrier → ℝ)
  embeddingPreservesOperations : Prop
  fuzzySetRepresentation : Prop
  completeness : Prop
  embeddingPreservesOperationsClosed : embeddingPreservesOperations
  fuzzySetRepresentationClosed : fuzzySetRepresentation
  completenessClosed : completeness

structure RepresentationTheoremEvidence {A : AdmissibleClass} {L : LatticeTheoreticExtensionPackage A}
    (R : RepresentationTheoremPackage L) where
  embeddingPreservesOperationsHeld : R.embeddingPreservesOperations
  fuzzySetRepresentationHeld : R.fuzzySetRepresentation
  completenessHeld : R.completeness

def RepresentationTheoremClosed {A : AdmissibleClass} {L : LatticeTheoreticExtensionPackage A}
    (R : RepresentationTheoremPackage L) : Prop :=
  R.embeddingPreservesOperations ∧ R.fuzzySetRepresentation ∧ R.completeness

theorem representation_theorem_closed_from_evidence
    {A : AdmissibleClass} {L : LatticeTheoreticExtensionPackage A}
    (R : RepresentationTheoremPackage L) (E : RepresentationTheoremEvidence R) :
    RepresentationTheoremClosed R := by
  exact And.intro E.embeddingPreservesOperationsHeld
    (And.intro E.fuzzySetRepresentationHeld E.completenessHeld)

end FuzzyAlgebraicStructuresCanonicalLaneLean
end HautevilleHouse