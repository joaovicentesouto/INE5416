/*
   Programacao Logica - Prof. Alexandre G. Silva - 30set2015
     Versao inicial     : 30set2015
     Ultima atualizacao : 12set2017

   RECOMENDACOES:

   - O nome deste arquivo deve ser 'programa.pl'

   - O nome do banco de dados deve ser 'desenhos.pl'

   - Dicas de uso podem ser obtidas na execucação:
     ?- menu.

   - Exemplo de uso:
     ?- load.
     ?- searchAll(id1).

   - Colocar o nome e matricula de cada integrante do grupo
     nestes comentarios iniciais do programa
*/

:- initialization(load).

% Exibe menu principal
menu :-
    write('load.         -> Carrega todos os desenhos do banco de dados para a memoria'), nl,
    write('commit.       -> Grava alteracoes de todos os desenhos no banco de dados'), nl,
    write('new(Id,X,Y).  -> Insere ponto/deslocamento no desenho com identificador <Id>'), nl,
    write('search.       -> Consulta pontos/deslocamentos dos desenhos'), nl,
    write('remove.       -> Remove pontos/deslocamentos dos desenhos'), nl,
    write('svg.          -> Cria um arquivo de imagem vetorial SVG (aplica "commit." antes'), nl.

% Apaga os predicados 'xy' da memoria e carrega os desenhos a partir de um arquivo de banco de dados
load :-
    retractall(xy(_,_,_)),
    open('desenhos.pl', read, Stream),
    repeat,
        read(Stream, Data),
        (Data == end_of_file -> true ; assert(Data), fail),
        !,
        close(Stream).

% Grava os desenhos da memoria em arquivo
commit :-
    open('desenhos.pl', write, Stream),
    telling(Screen),
    tell(Stream),
    listing(xy),  %listagem dos predicados 'xy'
    tell(Screen),
    close(Stream).

% Ponto de deslocamento, se <Id> existente
new(Id,X,Y) :-
    xy(Id,_,_),
    assertz(xy(Id,X,Y)),
    !.

% Ponto inicial, caso contrario
new(Id,X,Y) :-
    asserta(xy(Id,X,Y)),
    !.

% Exibe opcoes de busca
search :-
    write('searchId(Id,L).  -> Monta lista <L> com ponto inicial e todos os deslocamentos de <Id>'), nl,
    write('searchFirst(L).  -> Monta lista <L> com pontos iniciais de cada <Id>'), nl,
    write('searchLast(L).   -> Monta lista <L> com pontos/deslocamentos finais de cada <Id>'), nl.

% Exibe opcoes de remocao
remove :-
    write('removeLast.      -> Remove todos os pontos/deslocamentos de <Id>'), nl,
    write('removeLast(Id).  -> Remove o ultimo ponto de <Id>'), nl.

% Grava os desenhos em SVG
svg :-
    commit,
    open('desenhos.svg', write, Stream),
    telling(Screen),
    tell(Stream),
    consult('db2svg.pl'),  %programa para conversao
    tell(Screen),
    close(Stream).

%------------------------------------
% t2A
% -----------------------------------

% Questao 1 (resolvida)
% Monta lista <L> com ponto inicial e todos os deslocamentos de <Id>
searchId(Id,L) :-
    bagof([X,Y], xy(Id,X,Y), L).

% Questao 2
% Monta lista <L> com pontos iniciais de cada <Id>
searchFirst(L) :-
    setof(X, Y^Z^xy(X,Y,Z), Set),
    searchFirst_aux(Set, [], L).
searchFirst_aux([], A, L) :-
    reverse(A, L),
    !.
searchFirst_aux([H|T], A, L) :-
    searchId(H, [H1|_]),
    append([H1], A, A1),
    searchFirst_aux(T, A1, L).

% Questao 3
% Monta lista <L> com pontos ou deslocamentos finais de cada <Id>
searchLast(L) :-
    setof(X, Y^Z^xy(X,Y,Z), Set),
    searchLast_aux(Set, [], L).
searchLast_aux([], A, L) :-
    reverse(A, L),
    !.
searchLast_aux([H|T], A, L) :-
    searchId(H, L1),
    last(L1, X),
    append([X], A, A1),
    searchLast_aux(T, A1, L).

search_t(L) :-
    bagof(X, Y^Z^xy(X,Y,Z), S),
    list_to_set(S, L).

% Questao 4
% Remove todos os pontos ou deslocamentos do ultimo <Id>
removeLast :-
    setof(X, Y^Z^xy(X,Y,Z), S),
    last(S, Out),
    retractall(xy(Out,_,_)).

% Questao 5
% Remove o ultimo ponto ou deslocamento de <Id>
removeLast(Id) :-
    searchId(Id, L),
    last(L, [X,Y]),
    retract(xy(Id,X,Y)).

% Questao 6
% Determina um novo <Id> na sequencia numerica existente
newId(Id) :-
    setof(X, Y^Z^xy(X,Y,Z), S),
    last(S, Last),
    N is Last + 1,
    between(1, N, X),
    \+member(X, S),
    Id = X,
    !.

% Questao 7
% Duplica a figura com <Id> a partir de um nova posicao (X,Y)
% Deve ser criado um <Id_novo> conforme a sequencia (questao 6)
cloneId_aux(_, []) :- !.
cloneId_aux(N, [[X,Y]|T]) :-
	assert(xy(N, X, Y)),
	cloneId_aux(N, T).
cloneId(Id,X,Y) :-
    newId(N),
    searchId(Id, [[Xold,Yold]|T]),
    Xnew is Xold + X,
    Ynew is Yold + Y,
    assert(xy(N, Xnew, Ynew)),
    cloneId_aux(N, T).
	 	  	 	     	      	 	  	     	      	     	 	
