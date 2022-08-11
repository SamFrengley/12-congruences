/*
    Computational verifications for Theorem 6.7.
*/
RSZB_GL2_WHERE_IS_IT := "EDIT THIS STRING WITH THE DIRECTORY OF gl2.m";
Attach(RSZB_GL2_WHERE_IS_IT cat "/gl2.m");
load "../Z12-r/Z12equations.m";

//---------------------------
// Isogenous Claim
t := 2;
xi, eta := Explode([0,4]);

aa := eval Read("../Z12-r/infinitefamilies/12-1.m");
E1_12_1 := EllipticCurve(aa[1]);
assert not jInvariant(E1_12_1) in {0, 1728};
E1_12_11 := MinimalTwist(E1_12_1);
assert #IsogenousCurves(E1_12_1) eq 1;

aa := eval Read("../Z12-r/infinitefamilies/12-5.m");
E1_12_5 := EllipticCurve(aa[1]);
assert not jInvariant(E1_12_5) in {0, 1728};
E1_12_5 := MinimalTwist(E1_12_5);
assert #IsogenousCurves(E1_12_5) eq 1;

aa := eval Read("../Z12-r/infinitefamilies/12-7.m");
E1_12_7 := EllipticCurve(aa[1]);
assert not jInvariant(E1_12_7) in {0, 1728};
E1_12_11 := MinimalTwist(E1_12_7);
assert #IsogenousCurves(E1_12_7) eq 1;

aa := eval Read("../Z12-r/infinitefamilies/12-11.m");
E1_12_11 := EllipticCurve(aa[1]);
assert not jInvariant(E1_12_11) in {0, 1728};
E1_12_11 := MinimalTwist(E1_12_11);
assert #IsogenousCurves(E1_12_11) eq 1;

//---------------------------
// Surjectivity Claim
G := GL(2, Integers(12));
M := [H`subgroup : H in MaximalSubgroups(G)];

for H in M do
    // GL2InvariantTest from RSZ21 the 1000 is just an upper bound to check until
    // probably could be less
    assert not GL2jInvariantTest(H, jInvariant(E1_12_1), 1000); 
    assert not GL2jInvariantTest(H, jInvariant(E1_12_5), 1000);
    assert not GL2jInvariantTest(H, jInvariant(E1_12_7), 1000);
    assert not GL2jInvariantTest(H, jInvariant(E1_12_11), 1000);
end for;