nat(0).
nat(s(X)) :- nat(X).

sum(0, Y, Y) :- nat(Y).
sum(s(X), Y, s(S)) :- sum(X, Y, S).

even(0).
even(s(s(N))) :- even(N).

div2(0, 0).
div2(s(0), 0).
div2(s(s(N)), s(M)) :- div2(N, M).

lt(0, s(M)) :- nat(M).
lt(s(N), s(M)) :- lt(N, M).

div(0, M, 0) :- lt(0, M).
div(N, M, 0) :- lt(N, M).
div(N, M, s(Q)) :- lt(0, M), sum(M, V, N), div(V, M, Q).