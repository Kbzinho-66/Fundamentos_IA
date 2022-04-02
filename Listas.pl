% Exercícios Listas

% 1. Considere o seguinte predicado misterioso x de um argumento definido em

% Prolog pelas seguintes cláusulas:
    % x([]).
    % x([A]).
    % x([A,B|C]) :-
    % A < B,
    % x([B|C]).

% a) O que ocorre quando a consulta
    % ?- x([1,2,4,8,5]).
% é feita? A resposta é yes ou no?

    % Não, esse predicado verifica se a lista está em ordem crescente.

% b) Para quais listas de valores x vai ser satisfeito?

    % De 1 a 8.

%------------------------------------------------------------------------------%
% 2. Seja o seguinte programa:
    % p(X,[],[X]).
    % p(X,[Y|L],[X,Y|L]):-
    % X < Y.
    % p(X,[Y|L],[Y|R]):-
    % p(X,L,R).

% Mostre passo a passo qual será o resultado da seguinte chamada:
% ?- p(5,[2,3,9],Z).

% p(5, [2,3,9], Z). => false
% p(5, [2|3,9], [5,2|3,9]) :-
%     5 < 2. => false.
% p(5, [2|3,9], [2,R]) :-
%     p(5, [3,9], [R]).

%     p(5, [3,9], Z). => false
%     p(5, [3|9], [5,3|9]) :-
%         5 < 3. => false
%     p(5, [3|9], [3|R]) :-
%         p(5, [9], [3|R]).

%         p(5, [9], Z). => false
%         p(5, [9| ], [5,9|R]) :-
%             4 < 9. => true

%         <~ [3|5,9]

%     <~ [3,5,9]

% p(5, [2,3,9], [2,3,5,9]). => true.

% 3) Escreva um predicado que verifica se um elemento pertence a uma lista.

pertence(X, [X]) :- !.
pertence(X, [C|_]) :-
    X == C, !.
pertence(X, [_|R]) :-
    pertence(X, R).

% 4) Teste os predicados fat e fib.

fat(0, 1) :- !.
fat(1, 1) :- !.
fat(N, F) :-
    N1 is N - 1,
    fat(N1, F1),
    F is N * F1.

fib(N, F) :- 
    fibx(N, 1, 1, F), !.
fibx(0, A, _, A).
fibx(N, A, B, F) :-
    N1 is N - 1,
    AB is A + B,
    fibx(N1, B, AB, F).

% 5) Defina um predicado que determina o último item em uma lista.

ultimo([U], U) :- !.
ultimo([_|R], U) :-
    ultimo(R, U).

% 6) Defina um predicado que determina o número de itens em uma lista.

tam([], 0) :- !.
tam([_], 1) :- !.
tam([_|R], N) :-
    tam(R, T),
    N is T + 1.

% 7) Defina um predicado que some todos os itens da lista.

soma([], 0) :- !.
soma([N], N) :- !.
soma([N|R], S) :-
    soma(R, SR),
    S is N + SR.

% 8) Defina um predicado que determine o item máximo em uma lista.
maior(A, B, A) :-
    A >= B, !.
maior(_, B, B) :- !.
max([M], M) :- !.
max([C|R], M) :- 
    max(R, Resto),
    maior(C, Resto, M).

