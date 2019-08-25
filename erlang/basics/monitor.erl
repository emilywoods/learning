-module(monitor).
-export([loop/0]).

loop() ->
  process_flag(trap_exit, true),
  receive
    new -> io:format("Creating and monitoring process. ~n"),
    register(translate, spawn_link(fun async_translate:loop/0)),
    loop();
    {'EXIT', From, Reason} ->
      io:format("Translation service ~p terminated with reason ~p", [From, Reason]),
                io:format(" Restarting. ~n"),
      self() ! new,
      loop()
  end.
