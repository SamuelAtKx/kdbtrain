\d .math
PI: 22 % 7;

/ make sure x <= y
random: {[x;y;n] x + n?y-x };

\d .boxMuller
theta: { 2 * .math.PI * x };
r2: { -2 * log x };

basicRand: .math.random[0.0; 1.0; ];
basicZ0: { sqrt[r2 x] * cos theta y };
basicZ1: { sqrt[r2 x] * sin theta y };

polarRand: {
    u: .math.random[-1.0;1.0;x];
    v: .math.random[-1.0;1.0;x];
    ind: where 1 > c & 0 < c:u*u + v*v;     / 0 < s < 1

    if [0 < diff: x - count ind; 
        :(u ind; v ind) ,' polarRand diff
    ];
    (u ind; v ind)
 };
polarZ: { x * sqrt r2[s] % s:(x*x)+y*y };

\d .val
shapiro: { system "python validator.py ", " " sv string x };

\d .
transform: { .boxMuller.basicZ0[.boxMuller.basicRand x; .boxMuller.basicRand x] };
polar: { .[.boxMuller.polarZ; .boxMuller.polarRand x] };
