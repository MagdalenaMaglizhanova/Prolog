:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).

:- http_handler(root(hello), say_hello, []).

% Стартирай сървъра на даден порт
server(Port) :-
    http_server(http_dispatch, [port(Port)]).

% Обработва заявката към /hello
say_hello(_Request) :-
    reply_json(json{message:"Hello from Prolog"}).

% Автоматично стартиране при пускане на файла
:- initialization(server(8080)).
