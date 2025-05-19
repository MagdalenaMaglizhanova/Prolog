:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).

:- http_handler('/prolog_query', prolog_query, []).

prolog_query(Request) :-
    format('Content-type: text/plain~n~n'),
    format('Hello from Prolog!~n').
