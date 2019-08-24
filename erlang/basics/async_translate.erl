%%1. compile: c(translate).
%%2. spawn a process: pid = spawn(fun translate:loop/0).
%%3. send a message: Pid ! "good morning".

-module(async_translate).
-export([loop/0]).

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
