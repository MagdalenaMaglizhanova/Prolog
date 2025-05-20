:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).
:- use_module(library(http/json)).

:- http_handler(root(hello), say_hello, []).

server(Port) :-
    http_server(http_dispatch, [port(Port)]).

say_hello(_Request) :-
    reply_json(json{message: "Hello from Prolog API"}).

start_server :-
    (   getenv('PORT', PortAtom)
    ->  atom_number(PortAtom, Port)
    ;   Port = 8080
    ),
    server(Port).

:- initialization(start_server, main).
