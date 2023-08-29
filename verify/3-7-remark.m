/*
    Checking that the parametrisation in Remark 3.7 works.
*/
load "../Z2_3_4/polys.m"; 
load "../Z2_3_4/iscongruent.m";
QQ := Rationals();
K<a,b> := FunctionField(QQ, 2);
_<x> := PolynomialRing(K);

//-------------------------------
// (N, r) = (2, 1)
K<a,c> := FunctionField(QQ, 2);
E1, E2 := eval Read("../Z2_3_4/families/2-1.m");

E1 := EllipticCurve(E1);
E2 := EllipticCurve(E2);

assert IsNrCongruent(2, 1, E1, E2);

//-------------------------------
// (N, r) = (3, 1)
E1, E2 := eval Read("../Z2_3_4/families/3-1.m");

E1 := EllipticCurve(E1);
E2 := EllipticCurve(E2);

assert IsNrCongruent(3, 1, E1, E2);

//-------------------------------
// (N, r) = (3, 2)
E1, E2 := eval Read("../Z2_3_4/families/3-2.m");

E1 := EllipticCurve(E1);
E2 := EllipticCurve(E2);

assert IsNrCongruent(3, 2, E1, E2);

//-------------------------------
// (N, r) = (4, 1)
E1, E2 := eval Read("../Z2_3_4/families/4-1.m");

E1 := EllipticCurve(E1);
E2 := EllipticCurve(E2);

assert IsNrCongruent(4, 1, E1, E2);

//-------------------------------
// (N, r) = (4, 3)
E1, E2 := eval Read("../Z2_3_4/families/4-3.m");

E1 := EllipticCurve(E1);
E2 := EllipticCurve(E2);

assert IsNrCongruent(4, 3, E1, E2);
