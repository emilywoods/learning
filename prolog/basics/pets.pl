likes(emily, dogs).
likes(mary, dogs).
likes(laura, cats).

friend(X, Y) :- \+(X = Y), likes(X, Z), likes(Y, Z).
