nat(0).
nat(s(X)) :- nat(X).

sum(0, X, X) :- nat(X).
sum(s(X), Y, s(Z)) :- sum(X, Y, Z).

prod(0, X, 0) :- nat(X).
prod(s(X), Y, Z) :- prod(X, Y, W), sum(Y, W, Z).