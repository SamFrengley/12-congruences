/*
    Computational verifications for Section 3.2, when (N,r) = (3,2).
*/

QQ := Rationals();
K<z> := CyclotomicField(3); 
PK<a> := PolynomialRing(K); 
KK<a> := ext<K | a^2 - 3>;
PP<x0,x1,y0,y1> := PolynomialRing(KK, 4);
RR<w0,w1,w2> := PolynomialRing(QQ, 3);

//----------------------
// Define some groups
GL4 := GL(4, KK); 
g := GL4![1,0,0,0,  0,z,0,0,  0,0,1,0,  0,0,0,z^2]; 
h := GL4![1/a,(1/3)/a,0,0,  6/a,-1/a,0,0,  0,0,1/a,(1/3)/a,  0,0,6/a,-1/a];

G_3 := sub<GL4 | g,h>;
G_tilde_3 := CommutatorSubgroup(G_3);

//----------------------
// Define some invariants

D := -(27*x0^4 + x0*x1^3);
c4 := -(216*x0^3*x1 - x1^4);
c6 := 5832*x0^6 - 540*x0^3*x1^3 - x1^6;

assert IsInvariant(D, G_tilde_3);
assert IsInvariant(c4, G_tilde_3);
assert IsInvariant(c6, G_tilde_3);
assert c4^3 - c6^2 eq 1728*D^3;

I11 := 18*x0*y0 + x1*y1;

II := [ (3/2)*(3*I11^4 - c4*Evaluate(c4, [y0,y1,0,0]) - 144*D*Evaluate(D, [y0,y1,0,0])), 
        c4*Evaluate(c4, [y0,y1,0,0]),
        144*D*Evaluate(D, [y0,y1,0,0])
    ];

for inv in II do
    assert IsInvariant(inv, G_3);
end for;

//----------------------
// Check relations
JJ := (w1/w2)^3;
JJ_1 := (w0^2 - 3*w1^2 - 3*w1*w2 - 3*w2^2)^2/(4*w2^3*(2*w0 + 3*w1 + 3*w2));

assert 1728^2*Evaluate(JJ, II) eq c4^3/D^3*Evaluate(c4^3/D^3, [y0,y1,0,0]);
assert 1728^2*Evaluate(JJ_1, II) eq (c6^2/D^3)*Evaluate(c6^2/D^3, [y0,y1,0,0]);