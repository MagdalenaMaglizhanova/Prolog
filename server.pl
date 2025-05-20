:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).

:- http_handler(root(hello), say_hello, []).

say_hello(_Request) :-
    reply_json(json{message:"Hello from Prolog"}).

server :-
    getenv('PORT', PortAtom),           % Render задава PORT като env променлива
    atom_number(PortAtom, Port),
    format('Starting server on port ~w~n', [Port]),
    http_server(http_dispatch, [port(Port)]).

:- initialization(server, main).
