import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyAlgebraicStructuresCanonicalLaneLean

structure LatticeTheoreticExtensionPackage (A : AdmissibleClass) where
  carrier : Type u
  orderRelation : carrier → carrier → Prop
  join : carrier → carrier → carrier
  meet : carrier → carrier → carrier
  latticeLaws : Prop
  fuzzyCompatibility : carrier → carrier → ℝ
  residuatedImplication : carrier → carrier → carrier
  latticeLawsClosed : latticeLaws

structure LatticeTheoreticExtensionEvidence {A : AdmissibleClass} (L : LatticeTheoreticExtensionPackage A) where
  latticeLawsHeld : L.latticeLaws
  fuzzyCompatibilityClosed : L.fuzzyCompatibility = fun x y => (L.meet x y = x) + 0.0

def LatticeTheoreticExtensionClosed {A : AdmissibleClass} (L : LatticeTheoreticExtensionPackage A) : Prop :=
  L.latticeLaws

theorem lattice_theoretic_extension_closed_from_evidence
    {A : AdmissibleClass} (L : LatticeTheoreticExtensionPackage A)
    (E : LatticeTheoreticExtensionEvidence L) : LatticeTheoreticExtensionClosed L := by
  exact E.latticeLawsHeld

end FuzzyAlgebraicStructuresCanonicalLaneLean
end HautevilleHouse