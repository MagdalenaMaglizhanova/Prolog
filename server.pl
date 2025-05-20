:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).
:- use_module(library(http/json)).

:- dynamic server_started/0.

% HTTP handler
:- http_handler(root(hello), say_hello, []).

% Say hello endpoint
say_hello(_Request) :-
    reply_json(json{message:"Hello from Prolog"}).

% Server entry point
server :-
    \+ server_started,
    assert(server_started),
    getenv('PORT', PortAtom),
    atom_number(PortAtom, Port),
    format('Starting server on port ~w~n', [Port]),
    http_server(http_dispatch, [port(Port)]).

:- initialization(server, main).
