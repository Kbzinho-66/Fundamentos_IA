% Numeros romanos entre 1 <= X <= 399
romano(X) :-
      X > 399,
      write('Numero deve estar entre 1 e 399'), nl, !.
romano(X) :-
      X < 0,
      write('Numero deve estar entre 1 e 399'), nl, !.
romano(X) :-
      X >= 100,
      write('C'),
      Y is X - 100,
      romano(Y).
romano(X) :-
      X >= 90,
      write('XC'),
      Y is X - 90,
      romano(Y).
romano(X) :-
      X >= 50, X < 90,
      write('L'),
      Y is X - 50,
      romano(Y).
romano(X) :-
      X >= 40, X < 50,
      write('XL'),
      Y is X - 40,
      romano(Y).
romano(X) :-
      X >= 10, X < 40,
      write('X'),
      Y is X - 10,
      romano(Y).
romano(X) :-
      X == 9,
      write('IX'), !.
romano(X) :-
      X >= 5, X < 9,
      write('V'),
      Y is X - 5,
      romano(Y).
romano(X) :-
      X == 4,
      write('IV'), !.
romano(X) :-
      X >= 1, X < 4,
      write('I'),
      Y is X - 1,
      romano(Y).
romano(0) :- nl.
