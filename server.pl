:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).
:- use_module(library(system)).

:- http_handler(root(hello), say_hello, []).

say_hello(_Request) :-
    reply_json(json{message:"Hello from Prolog"}).

% Вземи порта от променлива на средата или използвай 8080 по подразбиране
get_port(Port) :-
    getenv('PORT', PortString) ->
    atom_number(PortString, Port)
    ;
    Port = 8080.

:- initialization(main).

main :-
    get_port(Port),
    format('Starting server on port ~w~n', [Port]),
    server(Port).

server(Port) :-
    http_server(http_dispatch, [port(Port)]).

