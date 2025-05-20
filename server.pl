:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).

:- http_handler(root(hello), say_hello, []).

server(Port) :-
    format('Starting server on port ~w~n', [Port]),
    catch(
        http_server(http_dispatch, [port(Port)]),
        Error,
        (format('Server failed: ~w~n', [Error]), fail)
    ).

say_hello(_Request) :-
    reply_json(json{message: "Hello from Prolog"}).

:- initialization(main).

main :-
    getenv('PORT', PortAtom),
    atom_number(PortAtom, Port),
    server(Port).
