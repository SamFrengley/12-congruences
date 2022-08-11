This directory contains `Magma` scripts which verify the calculations in the article.

- The files `3-2-section_...` verify some of the invariant theoretic claims.

- The script in `3-3-thm.m` verifyies the claims made in the proof of Thm 3.3. Moreover `3-3-thm_fishereqnproof.m` gives the transformation from Fisher's model for X_E^r(N) in *The Hessian of a genus one curve* (one could also do this using the equations of Rubin--Silverberg).

- The file `3-4-remark.m` gives 2-parameter families (and verifies that they are indeed congruent).

- The scripts in `5-2-section.m` and `5-3-section.m` are minimal, i.e., they verify the claims made in those sections. In particular, they also record the equations/transformations.

- In the files `...-example.m` we verify the examples in the paper. 

- In order to run the script `6-7-thm.m` you should clone Rouse--Sutherland--Zeurick-Brown's repository [*ell-adic-galois-images*](https://github.com/AndrewVSutherland/ell-adic-galois-images.git) locally and direct the script to the `gl2.m` file by editing the `RSZB_GL2_WHERE_IS_IT` string. Their repository is associated to the paper [*l-adic images of Galois for elliptic curves over Q*](https://arxiv.org/abs/2106.11141) arXiv:2106.11141 (2021). 