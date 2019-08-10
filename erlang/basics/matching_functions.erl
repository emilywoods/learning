-module(matching_functions).

-export([squared/1]).
-export([factorial/1]).

squared(N) -> N * N.

factorial(0) -> 1;
factorial(N) -> N * factorial(N-1).

