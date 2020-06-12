1 subt(X, X).
2 subt(S1 , s(_, T2)) :- subt(S1 , T2).
3 subt(S1 , s(T1 , _)) :- subt(S1 , T1).