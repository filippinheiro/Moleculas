%%prolog

%%Acetona
%átomos
atomo(m1, c1, carbono).
atomo(m1, n1, nitrogenio).
atomo(m1, c2, carbono).
atomo(m1, c3, carbono).

%ligações
ligacaosimples(m1, c1, n1).
ligacaosimples(m1, n1, c2).
ligacaosimples(m1, n1, c3).
ligacaodupla(m1, aa, aa).

%idMolecula(M) :- acido(M).


ligacaoS(M, A1, A2) :-
    ligacaosimples(M, A1, A2).
ligacaoS(M, A1, A2) :-
    ligacaosimples(M, A2, A1).

ligacaoD(M, A1, A2) :-
    ligacaodupla(M, A1, A2).
ligacaoD(M, A1, A2) :-
    ligacaodupla(M, A2, A1).

acido(M) :- ligacaoD(M, C, O), 
    ligacaoS(M, C, O1), 
    ligacaoS(M, O1, H), 
    atomo(M, O1, oxigenio), 
    atomo(M, O, oxigenio), 
    atomo(M, C, carbono), 
    atomo(M, H, hidrogenio),
    O \= O1,
    !. 

aldeido(M) :- 
    ligacaoS(M, C, C1), 
    ligacaoS(M, C1, H), 
    ligacaoD(M, C1, O), 
    atomo(M, C, carbono), 
    atomo(M, C1, carbono), 
    atomo(M, O, oxigenio), 
    atomo(M, H, hidrogenio), 
    C\=C1,
    !.

cetona(M) :- ligacaoS(M, C, C1), 
    ligacaoD(M, C1, O), 
    ligacaoS(M, C1, C2), 
    atomo(M, C, carbono), 
    atomo(M, C1, carbono), 
    atomo(M, C2, carbono), 
    atomo(M, O, oxigenio), 
    C\=C2, !.

amina(M) :- ligacaoS(M, C, N), 
    ligacaoS(M, N, H1), 
    ligacaoS(M, N, H2), 
    H1\=H2, 
    atomo(M,C, carbono), 
    atomo(M, N, nitrogenio), 
    atomo(M, H1, hidrogenio), 
    atomo(M, H1, hidrogenio), !. 
amina(M) :- ligacaoS(M, C, N), 
    ligacaoS(M, N, C1), 
    ligacaoS(M, N, H), C\=C1, 
    atomo(M,C, carbono), 
    atomo(M, N, nitrogenio), 
    atomo(M, H, hidrogenio),
    atomo(M, C1, carbono), !.
amina(M) :- ligacaoS(M, C, N), 
    ligacaoS(M, N, C1), 
    ligacaoS(M, N, C2),
     C\=C1, C\=C2, C1\=C2, 
     atomo(M, C, carbono), 
     atomo(M, N, nitrogenio), 
     atomo(M, C1, carbono), 
     atomo(M, C2, carbono), !.


alcool(M) :- ligacaoS(M, C, O), 
    ligacaoS(M, O, H),
    not(ligacaoD(M, C, O)),
    atomo(M, C, carbono),
    atomo(M, O, oxigenio),
    atomo(M, H, hidrogenio).