import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyAlgebraicStructuresCanonicalLaneLean

structure SpectralTheoremPackage {A : AdmissibleClass} (L : LatticeTheoreticExtensionPackage A)
    (R : RepresentationTheoremPackage L) (D : StructureDecompositionPackage L R) where
  primeSpectrum : Type u
  spectralTopology : TopologicalSpace primeSpectrum
  hullKernelOperator : (Set primeSpectrum) → (Set primeSpectrum)
  spectralMap : L.carrier → (Set primeSpectrum)
  spectralPreservesOperations : Prop
  spectralIsomorphism : Prop
  spectralPreservesOperationsClosed : spectralPreservesOperations
  spectralIsomorphismClosed : spectralIsomorphism

structure SpectralTheoremEvidence {A : AdmissibleClass} {L : LatticeTheoreticExtensionPackage A}
    {R : RepresentationTheoremPackage L} {D : StructureDecompositionPackage L R}
    (S : SpectralTheoremPackage L R D) where
  spectralPreservesOperationsHeld : S.spectralPreservesOperations
  spectralIsomorphismHeld : S.spectralIsomorphism

def SpectralTheoremClosed {A : AdmissibleClass} {L : LatticeTheoreticExtensionPackage A}
    {R : RepresentationTheoremPackage L} {D : StructureDecompositionPackage L R}
    (S : SpectralTheoremPackage L R D) : Prop :=
  S.spectralPreservesOperations ∧ S.spectralIsomorphism

theorem spectral_theorem_closed_from_evidence
    {A : AdmissibleClass} {L : LatticeTheoreticExtensionPackage A}
    {R : RepresentationTheoremPackage L} {D : StructureDecompositionPackage L R}
    (S : SpectralTheoremPackage L R D) (E : SpectralTheoremEvidence S) :
    SpectralTheoremClosed S := by
  exact And.intro E.spectralPreservesOperationsHeld E.spectralIsomorphismHeld

end FuzzyAlgebraicStructuresCanonicalLaneLean
end HautevilleHouse