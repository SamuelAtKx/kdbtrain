args:.Q.def[`name`port!("ex1.q";9082);].Q.opt .z.x

/ remove this line when using in production
/ ex1.q:localhost:9082::
{ if[not x=0; @[x;"\\\\";()]]; value"\\p 9082"; } @[hopen;`:localhost:9082;0];

\l qlib.q

.import.summary`samuelAtKx
.import.module`samuelAtKx

data: .samuelAtKx.monteCarlo.sde0[100; 0; 1f; 0.1 * til 11; 100]
.samuelAtKx.monteCarlo.plot[data; 20]
