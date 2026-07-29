import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzyAlgebraicStructuresCanonicalLaneLean.FuzzyGroupPackage

namespace HautevilleHouse
namespace FuzzyAlgebraicStructuresCanonicalLaneLean

structure FuzzyProductPackage (F1 F2 : FuzzySetPackage) where
  productCarrier : F1.carrier × F2.carrier
  membershipProduct : productCarrier → ℝ
  membershipProductDef : ∀ (x : F1.carrier) (y : F2.carrier), membershipProduct (x, y) = min (F1.membershipFunction x) (F2.membershipFunction y)

structure FuzzyProductGroupPackage {F1 F2 : FuzzySetPackage} (G1 : FuzzyGroupPackage F1) (G2 : FuzzyGroupPackage F2) (P : FuzzyProductPackage F1 F2) where
  op : P.productCarrier → P.productCarrier → P.productCarrier
  ident : P.productCarrier
  inv : P.productCarrier → P.productCarrier
  opDef : ∀ (x1 y1 : F1.carrier) (x2 y2 : F2.carrier), op (x1, x2) (y1, y2) = (G1.operation x1 y1, G2.operation x2 y2)
  identDef : ident = (G1.identity, G2.identity)
  invDef : ∀ (x : F1.carrier) (y : F2.carrier), inv (x, y) = (G1.inverse x, G2.inverse y)

structure FuzzyProductGroupEvidence {F1 F2 : FuzzySetPackage} {G1 : FuzzyGroupPackage F1} {G2 : FuzzyGroupPackage F2} {P : FuzzyProductPackage F1 F2} (GP : FuzzyProductGroupPackage G1 G2 P) where
  opDefClosed : ∀ (x1 y1 : F1.carrier) (x2 y2 : F2.carrier), GP.op (x1, x2) (y1, y2) = (G1.operation x1 y1, G2.operation x2 y2)
  identDefClosed : GP.ident = (G1.identity, G2.identity)
  invDefClosed : ∀ (x : F1.carrier) (y : F2.carrier), GP.inv (x, y) = (G1.inverse x, G2.inverse y)

def FuzzyProductGroupClosed {F1 F2 : FuzzySetPackage} {G1 : FuzzyGroupPackage F1} {G2 : FuzzyGroupPackage F2} {P : FuzzyProductPackage F1 F2} (GP : FuzzyProductGroupPackage G1 G2 P) : Prop :=
  (∀ (x1 y1 : F1.carrier) (x2 y2 : F2.carrier), GP.op (x1, x2) (y1, y2) = (G1.operation x1 y1, G2.operation x2 y2)) ∧
  (GP.ident = (G1.identity, G2.identity)) ∧
  (∀ (x : F1.carrier) (y : F2.carrier), GP.inv (x, y) = (G1.inverse x, G2.inverse y))

theorem fuzzy_product_group_closed_from_evidence {F1 F2 : FuzzySetPackage} {G1 : FuzzyGroupPackage F1} {G2 : FuzzyGroupPackage F2} {P : FuzzyProductPackage F1 F2} (GP : FuzzyProductGroupPackage G1 G2 P) (E : FuzzyProductGroupEvidence GP) :
    FuzzyProductGroupClosed GP := by
  exact And.intro E.opDefClosed (And.intro E.identDefClosed E.invDefClosed)

end FuzzyAlgebraicStructuresCanonicalLaneLean
end HautevilleHouse