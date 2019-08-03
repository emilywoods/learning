parent(sarah, mary).
parent(mary, jim).

ancestor(X, Y) :- parent(X,  Y).
ancestor(X, Y) :- parent(X,  Z), ancestor(Z, Y).

