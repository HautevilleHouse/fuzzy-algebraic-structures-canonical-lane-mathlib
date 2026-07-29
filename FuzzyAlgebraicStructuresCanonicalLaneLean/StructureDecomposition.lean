import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyAlgebraicStructuresCanonicalLaneLean

structure StructureDecompositionPackage {A : AdmissibleClass} (L : LatticeTheoreticExtensionPackage A)
    (R : RepresentationTheoremPackage L) where
  subdirectProduct : Prop
  factorsClassified : Prop
  decompositionUnique : Prop
  fuzzyCongruenceLattice : Prop
  subdirectProductClosed : subdirectProduct
  factorsClassifiedClosed : factorsClassified
  decompositionUniqueClosed : decompositionUnique
  fuzzyCongruenceLatticeClosed : fuzzyCongruenceLattice

structure StructureDecompositionEvidence {A : AdmissibleClass} {L : LatticeTheoreticExtensionPackage A}
    {R : RepresentationTheoremPackage L} (D : StructureDecompositionPackage L R) where
  subdirectProductHeld : D.subdirectProduct
  factorsClassifiedHeld : D.factorsClassified
  decompositionUniqueHeld : D.decompositionUnique
  fuzzyCongruenceLatticeHeld : D.fuzzyCongruenceLattice

def StructureDecompositionClosed {A : AdmissibleClass} {L : LatticeTheoreticExtensionPackage A}
    {R : RepresentationTheoremPackage L} (D : StructureDecompositionPackage L R) : Prop :=
  D.subdirectProduct ∧ D.factorsClassified ∧ D.decompositionUnique ∧ D.fuzzyCongruenceLattice

theorem structure_decomposition_closed_from_evidence
    {A : AdmissibleClass} {L : LatticeTheoreticExtensionPackage A}
    {R : RepresentationTheoremPackage L} (D : StructureDecompositionPackage L R)
    (E : StructureDecompositionEvidence D) : StructureDecompositionClosed D := by
  exact And.intro E.subdirectProductHeld
    (And.intro E.factorsClassifiedHeld
      (And.intro E.decompositionUniqueHeld E.fuzzyCongruenceLatticeHeld))

end FuzzyAlgebraicStructuresCanonicalLaneLean
end HautevilleHouse