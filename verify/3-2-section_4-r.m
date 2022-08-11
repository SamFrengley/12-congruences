/*
    Computational verifications for Section 3.2, when (N,r) = (4,r).
*/

QQ := Rationals();
K<i> := QuadraticField(-1); 
PK<a> := PolynomialRing(K); 
KK<a> := ext<K | a^2 +2>;
PP<x0,x1,y0,y1> := PolynomialRing(KK, 4);
RR<w0,w1,w2,w3> := PolynomialRing(QQ, 4);

//----------------------
// Define some groups
GL4 := GL(4, KK);
g := GL4![1,0,0,0,  0,i,0,0,  0,0,1,0,  0,0,0,i]; 
h := GL4![1/a,1/(2*a),0,0,  2/a,-1/a,0,0, 0,0,1/a,1/(2*a),  0,0,2/a,-1/a]; 

G_4 := sub<GL4 | g,h>;
G_tilde_4 := CommutatorSubgroup(G_4);

k11 := GL4![-1,0,0,0, 0,-1,0,0, 0,0,1,0, 0,0,0,1];
k21 := GL4![0,1/2,0,0, -2,0,0,0, 0,0,1,0, 0,0,0,1];
k31 := GL4![i,0,0,0, 0,-i,0,0, 0,0,1,0, 0,0,0,1];
k12 := GL4![1,0,0,0, 0,1,0,0, 0,0,-1,0, 0,0,0,-1];
k22 := GL4![1,0,0,0, 0,1,0,0, 0,0,0,1/2, 0,0,-2,0];
k32 := GL4![1,0,0,0, 0,1,0,0, 0,0,i,0, 0,0,0,-i];

H := sub<GL4 | k11,k21,k31,k12,k22,k32>;

//----------------------
// Define some invariants

D := 16*x0^5*x1 - x0*x1^5;
c4 := 256*x0^8 + 224*x0^4*x1^4 + x1^8;
c6 := 4096*x0^12 - 8448*x0^8*x1^4 - 528*x0^4*x1^8 + x1^12;

assert IsInvariant(D, G_tilde_4);
assert IsInvariant(c4, G_tilde_4);
assert IsInvariant(c6, G_tilde_4);
assert c4^3 - c6^2 eq 1728*D^4;

I11 := 4*(x0*y1 - x1*y0);
I44 := 256*x0^4*y0^4 + 16*x0^4*y1^4 + 192*x0^2*x1^2*y0^2*y1^2 + 16*x1^4*y0^4 + x1^4*y1^4;

II := [ I44^3, 
        2*I44*c4*Evaluate(c4, [y0,y1,0,0]),
        3*I11^4*I44^2,
        72*I11^2*I44*D*Evaluate(D, [y0,y1,0,0])
    ];

for inv in II do
    assert IsInvariant(inv, G_4);
end for;

forgetful := [  II[1],
                II[2],
                ExactQuotient(II[4]^2, II[3])
            ];

for inv in forgetful do
    assert IsInvariant(inv, G_4);
    assert IsInvariant(inv, H);
end for;

//----------------------
// Check relations
f := 192*w0^2 - 96*w0*w1 + 128*w0*w3 + 48*w0*w2 - w2^2;
c6c6 := 4*w0 - 3/2*w1 - (w3^2/w2);

assert Evaluate(f, II) eq 0;
assert Evaluate(c6c6, II) eq c6*Evaluate(c6, [y0,y1,0,0]);