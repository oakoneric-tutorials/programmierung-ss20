nat(0).
nat(s(X)) :- nat(X).
sum(0, Y, Y) :- nat(Y).
sum(s(X), Y, s(S)) :- sum(X, Y, S).
eval( X         , X ) :-  nat(X). 
eval( plus (L,R), X ) :-  eval(L, LE), eval(R, RE), sum(LE, RE,  X). 
eval( minus(L,R), X ) :-  eval(L, LE), eval(R, RE), sum(RE,  X, LE).