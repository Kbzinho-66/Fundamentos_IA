
:-dynamic capital/2.

% Lista de capitais
capital(rio_branco, acre).
capital(maceio, alagoas).
capital(macapa, amapa).
capital(manaus, amazonas).
capital(salvador, bahia).
capital(fortaleza, ceara).
capital(brasilia, distrito_federal).
capital(vitoria, espirito_santo).
capital(goiania, goias).
capital(sao_luis, maranhao).
capital(cuiaba, mato_grosso).
capital(campo_grande, mato_grosso_do_sul).
capital(belo_horizonte, minas_gerais).
capital(belem, para).
capital(joao_pessoa, paraiba).
capital(curitiba, parana).
capital(recife, pernambuco).
capital(teresina, piaui).
capital(rio_de_janeiro, rio_de_janeiro).
capital(natal, rio_grande_do_norte).
capital(porto_alegre, rio_grande_do_sul).
capital(porto_velho, rondonia).
capital(boa_vista, roraima).
capital(florianopolis, santa_catarina).
capital(sao_paulo, sao_paulo).
capital(aracaju, sergipe).
capital(tocantins, palmas).

encontraCapital :-
    write('Informe o Estado:'),
    read(Estado),
    pesquisaCapital(Estado).

pesquisaCapital(Estado) :-
    capital(Capital, Estado),
    write('A Capital é '),
    write(Capital), nl.

pesquisaCapital(Estado) :-
    write('Não conheço esse estado.'), nl,
    write('Quer me informar a capital?'), nl,
    write('Eu me lembrarei da proxima vez.'), nl,
    write('Pode digitar: '),
    read(Capital),
    assertz(capital(Capital, Estado)),
    write('Obrigado!'), nl.

