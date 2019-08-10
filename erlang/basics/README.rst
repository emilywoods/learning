======
Erlang
======

Erlang:

- dynamically typed
- no threading, it uses ``actors`` or lightweight processes
- "let it crash" error strategies
- functional language

To compile a program::

  1> c(basic).
  {ok,basic}

To run the function ``mirror`` in ``basic.erl``::

  2> basic:repeat("hey there").
  "hey there"

