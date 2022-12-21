
d) module
 samuelAtKx
 samuelAtKx to set up a samuelAtKx library. 
 q).import.module`samuelAtKx

.samuelAtKx.PI: 22 % 7;
.samuelAtKx.basicZ0: { (sqrt -2 * log x) * cos 2 * .samuelAtKx.PI * y };
.samuelAtKx.basicZ1: { (sqrt -2 * log x) * sin 2 * .samuelAtKx.PI * y };

.samuelAtKx.polarRand: { 
    u: -1 + x?2.0;
    v: -1 + x?2.0;
    s: (u*u) + v*v;
    valInd: where (0 < s) and 1 > s;

    if [0 < diff: x - count valInd;
        :(u valInd; v valInd) ,' .z.s diff
    ];

    (u; v)
 };
.samuelAtKx.polarZ: { x * sqrt (-2 * log s) % s:(x*x)+y*y };

.samuelAtKx.basic: { 
    x# (.samuelAtKx.basicZ0 . u), .samuelAtKx.basicZ1 . u: half cut (2 * half: ceiling 0.5 * x)?1.0
 };   / generated 20 samples, u0+u1 = 20 samples. we want u0+u1 = 10 samples

d) function
 samuelAtKx
 .samuelAtKx.basic
 generate random normal distributed numbers using basic method
 q) .samuelAtKx.basic 10


.samuelAtKx.polar: { .samuelAtKx.polarZ . .samuelAtKx.polarRand x };

d) function
 samuelAtKx
 .samuelAtKx.polar
 generate random normal distributed numbers using polar method
 q) .samuelAtKx.polar 10


.import.require`random

.samuelAtKx.monteCarlo.sde0: {[x0; a; b; dt; pathNum]
    / x0: pathNum#x0;
    / dwt: pathNum cut .random.normal0.basic pathNum*count dt;

    flip x0, (pathNum#x0) +\ (a * dt) +' b *' pathNum cut .random.normal0.basic pathNum*count dt
 };

d) function
 samuelAtKx
 .samuelAtKx.monteCarlo.sde0
 generate n path for stochastic differential equation dXt = a(Xt, t) * dt + b(Xt, t) * dWt
 can be displayed by the following: q) choice: raze x sampleSize? nrow: count data; r) matplot(t(as.data.frame(matrix(`choice, nrow=`sampleSize, byrow=TRUE))), type="l");
 q) .samuelAtKx.monteCarlo.sde0[100; 0; 1f; 0.1 * til 11; 100]

/ .import.require`rlang

/ .samuelAtKx.monteCarlo.plot: {[data; sampleSize]
/     choice: raze x sampleSize? nrow: count data;
/     r) matplot(t(as.data.frame(matrix(`choice, nrow=`sampleSize, byrow=TRUE))), type="l");
/  };

/ d) function
/  samuelAtKx
/  .samuelAtKx.monteCarlo.plot
/  plot matrix of sample data
/  q) .samuelAtKx.monteCarlo.plot[data; 20]