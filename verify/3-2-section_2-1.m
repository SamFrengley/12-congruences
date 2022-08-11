/*
    Computational verifications for Section 3.2, when (N,r) = (2,1).
*/
QQ := Rationals();
PP<x0,x1,y0,y1> := PolynomialRing(QQ, 4);
RR<w0,w1,w2> := PolynomialRing(QQ, 3);
//----------------------
// Define some groups
GL4 := GL(4, QQ); 
g := GL4![1,0,0,0,  0,-1,0,0,  0,0,1,0,  0,0,0,-1]; 
h := GL4![1/2,1/16,0,0,  12,-1/2,0,0,  0,0,1/2,1/16,  0,0,12,-1/2];

G_2 := sub<GL4 | h,g>;
G_tilde_2 := CommutatorSubgroup(G_2);

//----------------------
// Define some invariants
D := x0*(64*x0^2 - x1^2);
c4 := 192*x0^2 + x1^2;
c6 := x1*(576*x0^2 - x1^2);

assert IsInvariant(D, G_tilde_2);
assert IsInvariant(c4, G_tilde_2);
assert IsInvariant(c6, G_tilde_2);
assert c4^3 - c6^2 eq 1728*D^2;

I11 := 192*x0*y0 + x1*y1;

assert IsInvariant(I11, G_2);

II := [ I11^3, 
        2*I11*c4*Evaluate(c4, [y0,y1,0,0]),
        1728*D*Evaluate(D, [y0,y1,0,0])
    ];

for inv in II do
    assert IsInvariant(inv, G_2);
end for;

//----------------------
// Check relations
JJ := w1^3/(8*w0*w2^2);
JJ_1 := ((4*w0 - 3/2*w1 - w2)/w2)^2;

assert 1728^2*Evaluate(JJ, II) eq c4^3/D^2*Evaluate(c4^3/D^2, [y0,y1,0,0]);
assert 1728^2*Evaluate(JJ_1, II) eq (c6^2/D^2)*Evaluate(c6^2/D^2, [y0,y1,0,0]);