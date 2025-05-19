:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).

% Стартира HTTP сървър на порт 8000
server(Port) :-
    http_server(http_dispatch, [port(Port)]).

% Маршрут /query приема POST заявки с JSON
:- http_handler(root(query), handle_query, []).

% Обработчик на заявка
handle_query(Request) :-
    http_read_json_dict(Request, DictIn),
    GoalString = DictIn.get(goal),
    % Превръщаме низ в Prolog терм
    term_string(GoalTerm, GoalString),
    % Оценяваме терма (върни true/false)
    (call(GoalTerm) -> Result = true ; Result = false),
    reply_json_dict(_{result: Result}).
