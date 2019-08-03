reverse([], X, X).
reverse([HEAD | TAIL], X, ACCUMULATOR) :- reverse(TAIL, X, [HEAD | ACCUMULATOR]).
