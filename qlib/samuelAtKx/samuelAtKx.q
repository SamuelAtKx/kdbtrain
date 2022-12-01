
d) module
 samuelAtKx
 samuelAtKx to set up a samuelAtKx library. 
 q).import.module`samuelAtKx

.samuelAtKx.basicZ0: { sqrt[-2 * log x] * cos 6.2857142857142857142857142857143 * y };
.samuelAtKx.basicZ1: { sqrt[-2 * log x] * sin 6.2857142857142857142857142857143 * y };

.samuelAtKx.polarRand: { if [0 < diff: x - count valInd: where and[0 < s; 1 > s: (u*u: -1 + x?2.0) + v*v: -1 + x?2.0]; :(u valInd; v valInd) ,' .samuelAtKx.polarRand diff]; (u valInd; v valInd) };
.samuelAtKx.polarZ: { x * sqrt (-2 * log s) % s:(x*x)+y*y };

.samuelAtKx.basic: { .samuelAtKx.basicZ1[x?1.0; x?1.0] };

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