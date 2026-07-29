import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyAlgebraicStructuresCanonicalLaneLean

structure FuzzySetPackage where
  carrier : Type u
  membershipFunction : carrier → ℝ
  membershipRange : Set ℝ
  membershipInUnitInterval : ∀ x, membershipFunction x ∈ Set.Icc (0 : ℝ) 1

structure FuzzySetEvidence (F : FuzzySetPackage) where
  membershipRangeClosed : F.membershipRange = Set.Icc (0 : ℝ) 1
  membershipInUnitIntervalClosed : F.membershipInUnitInterval

def FuzzySetClosed (F : FuzzySetPackage) : Prop :=
  F.membershipRange = Set.Icc (0 : ℝ) 1 ∧ ∀ x, F.membershipFunction x ∈ Set.Icc (0 : ℝ) 1

theorem fuzzy_set_closed_from_evidence (F : FuzzySetPackage) (E : FuzzySetEvidence F) :
    FuzzySetClosed F := by
  exact And.intro E.membershipRangeClosed (fun x => E.membershipInUnitIntervalClosed x)

end FuzzyAlgebraicStructuresCanonicalLaneLean
end HautevilleHouse