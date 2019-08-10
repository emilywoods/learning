-module(square).
-export([square_all/1]).

square_all([]) -> [];
square_all([First|Rest]) -> [First * First| square_all(Rest)].
