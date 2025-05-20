:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).
:- use_module(library(http/json)).

% Дефинираме маршрут /hello
:- http_handler(root(hello), say_hello, []).

% Стартираме сървъра на порт, даден от Render
server :-
    getenv('PORT', PortAtom),
    atom_number(PortAtom, Port),
    format('Starting server on port ~w~n', [Port]),
    http_server(http_dispatch, [port(Port)]).

% Обработваме заявката /hello
say_hello(_Request) :-
    reply_json(json{message: "Hello from Prolog"}).

:- initialization(server).
