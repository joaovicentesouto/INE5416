:- initialization(load).

load :-
    consult('img.pl').

patternE([[0,0,0],
          [0,1,0],
          [1,1,1]]).
patternF([[0,0,0],
          [1,1,1],
          [1,1,1]]).

coord_pattern(0, [(0,0,0),(0,1,0),(0,2,0),
                  (1,0,x),(1,1,1),(1,2,x),
                  (2,0,1),(2,1,1),(2,2,1)]).
coord_pattern(45, [(0,0,x),(0,1,0),(0,2,0),
                   (1,0,1),(1,1,1),(1,2,0),
                   (2,0,1),(2,1,1),(2,2,x)]).
coord_pattern(90, [(0,0,1),(0,1,x),(0,2,0),
                   (1,0,1),(1,1,1),(1,2,0),
                   (2,0,1),(2,1,x),(2,2,0)]).
coord_pattern(135, [(0,0,1),(0,1,1),(0,2,x),
                    (1,0,1),(1,1,1),(1,2,0),
                    (2,0,x),(2,1,0),(2,2,0)]).
coord_pattern(180, [(0,0,1),(0,1,1),(0,2,1),
                    (1,0,x),(1,1,1),(1,2,x),
                    (2,0,0),(2,1,0),(2,2,0)]).
coord_pattern(225, [(0,0,x),(0,1,1),(0,2,1),
                    (1,0,0),(1,1,1),(1,2,1),
                    (2,0,0),(2,1,0),(2,2,x)]).
coord_pattern(270, [(0,0,0),(0,1,x),(0,2,1),
                    (1,0,0),(1,1,1),(1,2,1),
                    (2,0,0),(2,1,x),(2,2,1)]).
coord_pattern(315, [(0,0,0),(0,1,0),(0,2,x),
                    (1,0,0),(1,1,1),(1,2,1),
                    (2,0,x),(2,1,1),(2,2,1)]).
coord_pattern(c1, [(0,0,1),(0,1,0),(0,2,0),
                   (1,0,1),(1,1,1),(1,2,1),
                   (2,0,1),(2,1,1),(2,2,1)]).
coord_pattern(c2, [(0,0,0),(0,1,0),(0,2,1),
                   (1,0,1),(1,1,1),(1,2,1),
                   (2,0,1),(2,1,1),(2,2,1)]).
coord_pattern(c3, [(0,0,0),(0,1,1),(0,2,1),
                   (1,0,0),(1,1,1),(1,2,1),
                   (2,0,1),(2,1,1),(2,2,1)]).
coord_pattern(c4, [(0,0,1),(0,1,1),(0,2,1),
                   (1,0,0),(1,1,1),(1,2,1),
                   (2,0,0),(2,1,1),(2,2,1)]).
coord_pattern(c5, [(0,0,1),(0,1,1),(0,2,1),
                   (1,0,1),(1,1,1),(1,2,1),
                   (2,0,0),(2,1,0),(2,2,1)]).
coord_pattern(c6, [(0,0,1),(0,1,1),(0,2,1),
                   (1,0,1),(1,1,1),(1,2,1),
                   (2,0,1),(2,1,0),(2,2,0)]).
coord_pattern(c7, [(0,0,1),(0,1,1),(0,2,1),
                   (1,0,1),(1,1,1),(1,2,0),
                   (2,0,1),(2,1,1),(2,2,0)]).
coord_pattern(c8, [(0,0,1),(0,1,1),(0,2,0),
                   (1,0,1),(1,1,1),(1,2,0),
                   (2,0,1),(2,1,1),(2,2,1)]).
coord_pattern(ponta1, [(0,0,0),(0,1,0),(0,2,0),
                       (1,0,0),(1,1,1),(1,2,0),
                       (2,0,x),(2,1,1),(2,2,x)]).
coord_pattern(ponta2, [(0,0,x),(0,1,0),(0,2,0),
                       (1,0,1),(1,1,1),(1,2,0),
                       (2,0,x),(2,1,0),(2,2,0)]).
coord_pattern(ponta3, [(0,0,x),(0,1,1),(0,2,x),
                       (1,0,0),(1,1,1),(1,2,0),
                       (2,0,0),(2,1,0),(2,2,0)]).
coord_pattern(ponta4, [(0,0,0),(0,1,0),(0,2,x),
                       (1,0,0),(1,1,1),(1,2,1),
                       (2,0,0),(2,1,0),(2,2,x)]).

getAbove(S, X, Y, [(0,1,V)]) :-
    above(S, (X, Y, _), (_,_,V)),
    !.
getAbove(_, _, _, []).

getBelow(S, X, Y, [(2,1,V)]) :-
    below(S, (X, Y, _), (_,_,V)),
    !.
getBelow(_, _, _, []).

getLeft(S, X, Y, [(1,0,V)]) :-
    left(S, (X, Y, _), (_,_,V)),
    !.
getLeft(_, _, _, []).

getRight(S, X, Y, [(1,2,V)]) :-
    right(S, (X, Y, _), (_,_,V)),
    !.
getRight(_, _, _, []).

getUpperLeft(S, X, Y, [(0,0,V)]) :-
    Yleft is Y - 1,
    above(S, (X, Yleft, _), (_,_,V)),
    !.
getUpperLeft(_, _, _, []).

getUpperRight(S, X, Y, [(0,2,V)]) :-
    Yright is Y + 1,
    above(S, (X, Yright, _), (_,_,V)),
    !.
getUpperRight(_, _, _, []).

getLowerLeft(S, X, Y, [(2,0,V)]) :-
    Yleft is Y - 1,
    below(S, (X, Yleft, _), (_,_,V)),
    !.
getLowerLeft(_, _, _, []).

getLowerRight(S, X, Y, [(2,2,V)]) :-
    Yright is Y + 1,
    below(S, (X, Yright, _), (_,_,V)),
    !.
getLowerRight(_, _, _, []).

% Pega todos os pontos no alcance inclusive a origem, porém deixando
% com os indices entre 0 e 3 para facilitar na comparação com os padrões.
getBox(S, (X, Y, V), B) :-
    getUpperLeft(S, X, Y, UpperL),
    append(UpperL, [], N0),
    getAbove(S, X, Y, Above),
    append(N0, Above, N1),
    getUpperRight(S, X, Y, UpperR),
    append(N1, UpperR, N2),
    getLeft(S, X, Y, Left),
    append(N2, Left, N_3),
    append(N_3, [(1,1,V)], N3),
    getRight(S, X, Y, Right),
    append(N3, Right, N4),
    getLowerLeft(S, X, Y, LowerL),
    append(N4, LowerL, N5),
    getBelow(S, X, Y, Below),
    append(N5, Below, N6),
    getLowerRight(S, X, Y, LowerR),
    append(N6, LowerR, B).

% 1) Operador hit-or-miss, encontra o padrão na imagem A e retorna a imagem R contendo
%    apenas os pontos que respeitem o padrão:
%    Considerações:
%       - A e R são matrizes que correspondem as imagens.
%       - E e F também são matrizes sendo que E está contida ou igual a F.
pattern_hit([], _, _) :-
    !.
pattern_hit([(X,Y,V)|Tail], E, F) :-
    getPixel(E, (X,Y,V)),
    pattern_hit(Tail, E, F).
pattern_hit([(X,Y,V)|Tail], E, F) :-
    getPixel(F, (X,Y,V)),
    pattern_hit(Tail, E, F).

hitmiss_aux(S, E, F, Rest) :-
    hitmiss_aux(S, S, E, F, Rest),
    !.

hitmiss_aux([], _, _, _, []).

hitmiss_aux([(X, Y, V)|Tail], S, E, F, [(X, Y, 1)|Rest]) :-
    getBox(S, (X, Y, V), B),
    pattern_hit(B, E, F),
    hitmiss_aux(Tail, S, E, F, Rest).

hitmiss_aux([(X, Y, _)|Tail], S, E, F, [(X, Y, 0)|Rest]) :-
    hitmiss_aux(Tail, S, E, F, Rest).

hitmiss(A,E,F,R) :-
    write('Hit or miss:\n'),
    coord(A, CA),
    coord(E, CE),
    coord(F, CF),
    hitmiss_aux(CA, CE, CF, CR),
    coord2matrix(CR, R).

% 2) Operador de afinamento aplicado à imagem A, de modo a produzir,
%    como resposta, uma imagem R:
pattern_or(x, _).
pattern_or(0, 0).
pattern_or(1, 1).

pattern_aux([], _) :-
    !.
pattern_aux([(X,Y,V)|Tail], P) :-
    getPixel(P, (X,Y,VP)),
    pattern_or(VP, V),
    pattern_aux(Tail, P).

pattern_afinamento(B, Etapa) :-
    coord_pattern(Etapa, P),
    pattern_aux(B, P),
    !.

% (Imagem, ImagemOriginal, AcumuladorR, R, AcumuladorQ, Q, Etapa).
encontra_substitui([], _, Return, Return, Q, Q, 315) :-
    !.
encontra_substitui([], _, R0, Return, Q0, Q1, Etapa0) :-
    Etapa1 is Etapa0 + 45,
    encontra_substitui(R0, R0, [], Return, Q0, Q1, Etapa1),
    !.

encontra_substitui([(X,Y,V)|Tail], A, R0, Return, Q0, Quant, Etapa) :-
    getBox(A, (X,Y,V), B),
    pattern_afinamento(B, Etapa),
    Q1 is Q0 + 1,
    encontra_substitui(Tail, A, [(X,Y,0)|R0], Return, Q1, Quant, Etapa).
encontra_substitui([(X,Y,V)|Tail], A, R0, Return, Q0, Quant, Etapa) :-
    encontra_substitui(Tail, A, [(X,Y,V)|R0], Return, Q0, Quant, Etapa).

encontra_inicio(A, Return, Q1) :-
    encontra_substitui(A, A, [], Return, 0, Q1, 0),
    !.

afinamento_aux(R, R, 0) :-
    !.
afinamento_aux(A, R, _) :-
    encontra_inicio(A, B, Modified),
    write('Pontos Modificados nesta iteração: '), write(Modified), write('\n'),
    afinamento_aux(B, R, Modified),
    !.

afinamento(A, R) :-
    write('Afinamento:\n'),
    coord(A, CA),
    afinamento_aux(CA, CR, 1),
    coord2matrix(CR, R),
    !.

% 3) Como aplicação foi escolhido a detecção de pontos finais, onde eu retorno uma imagem R
%    contendo apenas os pontos finais de A.

% Cada um implementa um padrão diferente porém necessário para encontrar o contorno
pattern_contorno(B) :-
   (coord_pattern(0,   P0),   pattern_aux(B, P0)   ;
    coord_pattern(45,  P45),  pattern_aux(B, P45)  ;
    coord_pattern(90,  P90),  pattern_aux(B, P90)  ;
    coord_pattern(135, P135), pattern_aux(B, P135) ;
    coord_pattern(180, P180), pattern_aux(B, P180) ;
    coord_pattern(225, P225), pattern_aux(B, P225) ;
    coord_pattern(270, P270), pattern_aux(B, P270) ;
    coord_pattern(315, P315), pattern_aux(B, P315) ;
    coord_pattern(c1,  PC1),  pattern_aux(B, PC1)  ;
    coord_pattern(c2,  PC2),  pattern_aux(B, PC2)  ;
    coord_pattern(c3,  PC3),  pattern_aux(B, PC3)  ;
    coord_pattern(c4,  PC4),  pattern_aux(B, PC4)  ;
    coord_pattern(c5,  PC5),  pattern_aux(B, PC5)  ;
    coord_pattern(c6,  PC6),  pattern_aux(B, PC6)  ;
    coord_pattern(c7,  PC7),  pattern_aux(B, PC7)  ;
    coord_pattern(c8,  PC8),  pattern_aux(B, PC8)  ;
    coord_pattern(ponta1, PP1), pattern_aux(B, PP1);
    coord_pattern(ponta2, PP2), pattern_aux(B, PP2);
    coord_pattern(ponta3, PP3), pattern_aux(B, PP3);
    coord_pattern(ponta4, PP4), pattern_aux(B, PP4)),
    !.

encontra_contorno([], _, R0, R1) :-
    reverse(R0, R1),
    
    !.
encontra_contorno([(X, Y, V)|Tail], S, Rest, Return) :-
    getBox(S, (X, Y, V), B),
    pattern_contorno(B),
    encontra_contorno(Tail, S, [(X, Y, V)|Rest], Return).
encontra_contorno([(X, Y, _)|Tail], S, Rest, Return) :-
    encontra_contorno(Tail, S, [(X, Y, 0)|Rest], Return).

contorno(A, R) :-
    encontra_contorno(A, A, [], R),
    !.

aplicacao(A, R) :-
    write('Aplicação:\n'),
    coord(A, CA),
    contorno(CA, CR),
    coord2matrix(CR, R),
    !.

% Para realizar um teste, passe onde a imagem está e onde deve ser salva a resposta.
test_hitmiss(File, Resp) :-
    readPGM(File, M),
    patternE(E),
    patternF(F),
    hitmiss(M, E, F, R),
    writePGM(Resp, R).
test_afinamento(File, Resp) :-
    readPGM(File, M),
    afinamento(M, R),
    writePGM(Resp, R).
test_aplicacao(File, Resp) :-
    readPGM(File, M),
    aplicacao(M, R),
    writePGM(Resp, R).

