:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).

:- http_handler(root(hello), say_hello, []).

server(Port) :-
    http_server(http_dispatch, [port(Port)]).

say_hello(_Request) :-
    reply_json_dict(_{message:"Hello from Prolog REST API"}).

:- initialization(main, main).

main :-
    (   getenv('PORT', PortAtom) -> % прочитаме порт от променлива
        atom_number(PortAtom, Port)
    ;   Port = 8080                 % ако няма, използвай 8080 по подразбиране
    ),
    server(Port).
