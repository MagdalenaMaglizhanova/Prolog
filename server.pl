:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).

:- http_handler(root(hello), say_hello, []).

say_hello(_Request) :-
    reply_json(json{message: "Hello from Prolog API"}).

server(Port) :-
    format("Starting server on port ~w~n", [Port]),
    http_server(http_dispatch, [port(Port)]).

:- initialization(main).

main :-
    getenv('PORT', PortAtom),         % <- взима порт от Railway
    atom_number(PortAtom, Port),
    server(Port).
