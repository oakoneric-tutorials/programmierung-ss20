edge(1, 4).
edge(1, 2).
edge(3, 2).
edge(4, 3).
edge(1, 1).

path(U, U).
path(U, W) :- edge(U, V), path(V, W).