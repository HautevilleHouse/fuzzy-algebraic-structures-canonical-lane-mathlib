import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzyAlgebraicStructuresCanonicalLaneLean.FuzzyGroupPackage

namespace HautevilleHouse
namespace FuzzyAlgebraicStructuresCanonicalLaneLean

structure FuzzySubgroupPackage {F : FuzzySetPackage} (G : FuzzyGroupPackage F) where
  carrierSubset : Set F.carrier
  membershipSubset : F.carrier → ℝ
  subsetMembership : ∀ x, x ∈ carrierSubset → membershipSubset x = F.membershipFunction x
  containsIdentity : G.identity ∈ carrierSubset
  closedUnderOp : ∀ x y, x ∈ carrierSubset → y ∈ carrierSubset → G.operation x y ∈ carrierSubset
  closedUnderInv : ∀ x, x ∈ carrierSubset → G.inverse x ∈ carrierSubset
  fuzzySubsetCondition : ∀ x, membershipSubset x ≤ F.membershipFunction x

structure FuzzySubgroupEvidence {F : FuzzySetPackage} {G : FuzzyGroupPackage F} (S : FuzzySubgroupPackage G) where
  containsIdentityClosed : S.G.identity ∈ S.carrierSubset
  closedUnderOpClosed : ∀ x y, x ∈ S.carrierSubset → y ∈ S.carrierSubset → S.G.operation x y ∈ S.carrierSubset
  closedUnderInvClosed : ∀ x, x ∈ S.carrierSubset → S.G.inverse x ∈ S.carrierSubset
  fuzzySubsetConditionClosed : ∀ x, S.membershipSubset x ≤ F.membershipFunction x

def FuzzySubgroupClosed {F : FuzzySetPackage} {G : FuzzyGroupPackage F} (S : FuzzySubgroupPackage G) : Prop :=
  (S.G.identity ∈ S.carrierSubset) ∧
  (∀ x y, x ∈ S.carrierSubset → y ∈ S.carrierSubset → S.G.operation x y ∈ S.carrierSubset) ∧
  (∀ x, x ∈ S.carrierSubset → S.G.inverse x ∈ S.carrierSubset) ∧
  (∀ x, S.membershipSubset x ≤ F.membershipFunction x)

theorem fuzzy_subgroup_closed_from_evidence {F : FuzzySetPackage} {G : FuzzyGroupPackage F} (S : FuzzySubgroupPackage G) (E : FuzzySubgroupEvidence S) :
    FuzzySubgroupClosed S := by
  exact And.intro E.containsIdentityClosed
    (And.intro E.closedUnderOpClosed
      (And.intro E.closedUnderInvClosed E.fuzzySubsetConditionClosed))

end FuzzyAlgebraicStructuresCanonicalLaneLean
end HautevilleHouse