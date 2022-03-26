% Um robô de conversação muito básico

respostas([
    ['Eu te ouvi!'],
    ['Ah, tu tá falando comigo...'],
    ['Continua, tô ouvindo.'],
    ['Que conversa interessante.'],
    ['Conte-me mais...']
]).

selecionar(0, [C|_], C).
selecionar(N, [_|R], L) :-
    N > 0,
    N1 is N - 1,
    selecionar(N1, R, L).

sair(X) :-
    X = 'Tchau',
    nl, write('Foi bom falar com você, até a próxima!').

escreve_string([C|_]) :-
    write(C).

chatterbot :-
    repeat,
    nl, write('>'),
    read(Input),
    respostas(ListaDeRespostas),
    Index is integer(random(5)),
    selecionar(Index, ListaDeRespostas, Resposta),
    escreve_string(Resposta),
    sair(Input).