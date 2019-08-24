%%1. compile: c(translate).
%%2. spawn a process: Translator = spawn(fun sync_translate:loop/0).
%%3. send a message: sync_translate:translate(Translator, "good morning").

-module(sync_translate).
-export([loop/0, translate/2]).

loop() ->
  receive
    "good morning" ->
      io:format("maidin mhaith~n"),
      loop();
    "good night" ->
      io:format("oíche mhaith~n"),
      loop();
    _ ->
      io:format("ní thuigim~n"),
      loop()
  end.

translate(To, From) ->
  To ! {self(), From},
  receive
    Translation -> Translation
  end.
