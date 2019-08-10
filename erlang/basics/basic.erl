-module(basic).
-export([repeat/1]).
-export([hello/1]).

repeat(Anything) -> Anything.

hello(Name) -> "Hello " ++ Name.
