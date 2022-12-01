
d) module
 samuelAtKx
 samuelAtKx to set up a samuelAtKx library. 
 q).import.module`samuelAtKx

.samuelAtKx.PI: 22 % 7;

/ make sure x <= y
.samuelAtKx.random: {[x;y;n] x + n?y-x };

.samuelAtKx.theta: { 2 * .samuelAtKx.PI * x };
.samuelAtKx.r2: { -2 * log x };

.samuelAtKx.basicRand: .samuelAtKx.random[0.0; 1.0; ];
.samuelAtKx.basicZ0: { sqrt[.samuelAtKx.r2 x] * cos .samuelAtKx.theta y };
.samuelAtKx.basicZ1: { sqrt[.samuelAtKx.r2 x] * sin .samuelAtKx.theta y };

.samuelAtKx.polarRand: {
    u: .samuelAtKx.random[-1.0;1.0;x];
    v: .samuelAtKx.random[-1.0;1.0;x];
    ind: where 1 > c & 0 < c:u*u + v*v;     / 0 < s < 1

    if [0 < diff: x - count ind; 
        :(u ind; v ind) ,' .samuelAtKx.polarRand diff
    ];
    (u ind; v ind)
 };

.samuelAtKx.polarZ: { x * sqrt .samuelAtKx.r2[s] % s:(x*x)+y*y };


.samuelAtKx.basic: { .samuelAtKx.basicZ0[.samuelAtKx.basicRand x; .samuelAtKx.basicRand x] };

d) function
 samuelAtKx
 .samuelAtKx.basic
 generate random normal distributed numbers using basic method
 q) .samuelAtKx.basic 10


.samuelAtKx.polar: { .[.samuelAtKx.polarZ; .samuelAtKx.polarRand x] };
d) function
 samuelAtKx
 .samuelAtKx.polar
 generate random normal distributed numbers using polar method
 q) .samuelAtKx.polar 10