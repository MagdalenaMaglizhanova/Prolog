:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).

% Регистрираме обработчик за пътя /hello
:- http_handler(root(hello), say_hello, []).

% Стартира сървъра на посочен порт
server(Port) :-
    http_server(http_dispatch, [port(Port)]).

% Обработва заявка към /hello
say_hello(_Request) :-
    reply_json(json{message: "Hello from Prolog API"}).

% Функция за стартиране на сървъра с порт от променлива на средата PORT
start_server :-
    getenv('PORT', PortAtom),
    atom_number(PortAtom, Port),
    server(Port).

% Автоматично стартира сървъра при инициализация
:- initialization(start_server).
