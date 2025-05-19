:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).

:- http_handler(root(hello), say_hello, []).

server(Port) :-
    format('Starting server on port ~w~n', [Port]),
    http_server(http_dispatch, [port(Port)]).

say_hello(_Request) :-
    reply_json(json{message:"Hello from Prolog"}).

:- initialization(start_server).

start_server :-
    getenv('PORT', PortAtom),      % взимаме порта от средата
    atom_number(PortAtom, Port),   % превръщаме го в число
    server(Port).
