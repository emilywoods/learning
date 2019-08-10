-module(word_counter).

-export([word_counter/1]).

get_length([]) -> 0;
get_length(String) ->
  [_ | Tail] = String,
  get_length(Tail) + 1.

word_counter(Sentence) ->
  Splitted = re:split(Sentence, " "),
  get_length(Splitted).
