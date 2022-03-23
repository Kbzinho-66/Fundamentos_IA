%Enunciado: Pouco se sabe da história passada da família Pinheiro. 
% Existem alguns registos antigos que indicam que o casal José e Maria criou dois filhos, o João e a Ana. 
% Que a Ana teve duas filhas, a Helena e a Joana, também parece ser verdade, segundo os
% mesmos registos. Além disso, o Mário é filho do João, pois muito se orgulha disso. 
% Estranho também, foi constatar que o Carlos nasceu da relação entre a Helena e o Mário.

progenitor(jose, joao).
progenitor(jose, ana).
progenitor(maria, joao).
progenitor(maria, ana).
progenitor(ana, helena).
progenitor(ana, joana).
progenitor(joao, mario).
progenitor(helena, carlos).
progenitor(mario, carlos).

sexo(jose, masc).
sexo(joao, masc).
sexo(mario, masc).
sexo(carlos, masc).
sexo(maria, fem).
sexo(ana, fem).
sexo(helena, fem).
sexo(joana, fem).

% X é descendente de Y se 
    % Y for um dos progenitores de X.
descendente(X,Y) :-
    progenitor(Y,X).
% X é descendente de Y se
    % existe um progenitor Z de X e 
    % Z é descendente de Y.
descendente(X,Y) :-
    progenitor(Z,X),
    descendente(Z,Y).

pai(X,Y) :-
    progenitor(X,Y),
    sexo(X, masc).

mae(X,Y) :-
    progenitor(X,Y),
    sexo(X, fem).

irmaos(X,Y) :-
    progenitor(Z,X),
    progenitor(Z,Y),
    X \== Y.

irmao(X,Y) :-
    irmaos(X,Y),
    sexo(X, masc).

irma(X,Y) :-
    irmaos(X,Y),
    sexo(X, fem).

% X é tio de Y se 
    % X for homem e
    % X for um dos irmaos de Z e
    % Z é um dos progenitores de Y.
tio(X,Y) :-
    sexo(X, masc),
    irmaos(X,Z),
    progenitor(Z,Y).

% X é tia de Y se 
    % X for mulher e
    % X for um dos irmaos de Z e
    % Z é um dos progenitores de Y.
tia(X,Y) :-
    sexo(X, fem),
    irmaos(X,Z),
    progenitor(Z,Y).

primos(X,Y) :-
    X \= Y,
    progenitor(Px,X),
    progenitor(Py,Y),
    irmaos(Px, Py).

primo(X,Y) :-
    primos(X,Y),
    sexo(X, masc).

prima(X,Y) :-
    primos(X,Y),
    sexo(X, fem).

avoo(X,Y) :-
    sexo(X, masc),
    progenitor(X,Z),
    progenitor(Z,Y).

avoh(X,Y) :-
    sexo(X, fem),
    progenitor(X,Z),
    progenitor(Z,Y).


% 1) João é filho de José?

% ?- progenitor(jose, joao).

% 2) Quem são os filhos da Maria?

% mae(maria, F).

% 3) Quem são os primos do Mário?

