%Enunciado: Pouco se sabe da história passada da família Pinheiro. 
% Existem alguns registos antigos que indicam que o casal José e Maria criou dois filhos, o João e a Ana. 
% Que a Ana teve duas filhas, a Helena e a Joana, também parece ser verdade, segundo os
% mesmos registos. Além disso, o Mário é filho do João, pois muito se orgulha disso. 
% Estranho também, foi constatar que o Carlos nasceu da relaçãoo entre a Helena e o Mário.

pais(X,Y).
pais(jose, joao).
pais(jose, ana).
pais(maria, joao).
pais(maria, ana).
pais(ana, helena).
pais(ana, joana).
pais(joao, mario).
pais(helena, carlos).
pais(mario, carlos).

sexo(jose, masc).
sexo(joao, masc).
sexo(mario, masc).
sexo(carlos, masc).
sexo(maria, fem).
sexo(ana, fem).
sexo(helena, fem).
sexo(joana, fem).

irmao(X,Y) :-
    X \= Y,
    pais(Z,X),
    pais(Z,Y),
    sexo(X, masc).

irma(X,Y) :-
    X \= Y,
    pais(Z,X),
    pais(Z,Y),
    sexo(X, fem).

descendente(E1,E2) :-
    pais(E2,E1).
descendente(E1,E2) :-
    pais(E2,E1),
    descendente(E2,E3).

pai(X,Y) :-
    pais(X,Y),
    sexo(X, masc).

mae(X,Y) :-
    pais(X,Y),
    sexo(X, fem).

avoo(X,Y) :-
    sexo(X, masc),
    pais(X,Z),
    pais(Z,Y).

avoh(X,Y) :-
    sexo(X, fem),
    pais(X,Z),
    pais(Z,Y).

irmaos(X,Y) :-
    X \= Y,
    pais(Z,X),
    pais(Z,Y).

tio(X,Y) :-
    sexo(X, masc),
    irmaos(X,Z),
    pais(Z,Y).

tia(X,Y) :-
    sexo(X, fem),
    irmaos(X,Z),
    pais(Z,Y).

primos(X,Y) :-
    X \= Y,
    pais(Px,X),
    pais(Py,Y),
    irmaos(Px, Py).

primo(X,Y) :-
    primos(X,Y),
    sexo(X, masc).

prima(X,Y) :-
    primos(X,Y),
    sexo(X, fem).

% 1) João é filho de José?

% ?- pais(jose, joao).

% 2) Quem são os filhos da Maria?

pais()
