args:.Q.def[`name`port!("ex1.q";9082);].Q.opt .z.x

/ remove this line when using in production
/ ex1.q:localhost:9082::
{ if[not x=0; @[x;"\\\\";()]]; value"\\p 9082"; } @[hopen;`:localhost:9082;0];

\l qlib.q

.import.summary`samuelAtKx
.import.module`samuelAtKx


0= sum null .samuelAtKx.polar 100000 / please fix this

(::)basic: ([] rnn: .samuelAtKx.basic 100000)
select cnt:count i  by 0.1 xbar rnn from basic / this looks good
