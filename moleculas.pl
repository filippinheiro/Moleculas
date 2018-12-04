%%prolog

%%Acetona
%átomos
atomo(acetona, h1, hidrogenio).
atomo(acetona, h2, hidrogenio).
atomo(acetona, h3, hidrogenio).
atomo(acetona, h4, hidrogenio).
atomo(acetona, h5, hidrogenio).
atomo(acetona, h6, hidrogenio).
atomo(acetona, c, carbono).
atomo(acetona, c1, carbono).
atomo(acetona, c2, carbono).
atomo(acetona, o1, oxigenio).

%ligações
ligacaosimples(acetona, h1, c).
ligacaosimples(acetona, c, c1).
ligacaosimples(acetona, c1, c2).
ligacaosimples(acetona, c, h2).
ligacaosimples(acetona, c, h3).
ligacaosimples(acetona, c1, o1).
ligacaosimples(acetona, c2, h4).
ligacaosimples(acetona, c2, h5).
ligacaosimples(acetona, c2, h6).

ligacaodupla(acetona, c1, o1).

%idMolecula(M) :- acido(M).

acido(M) :- (ligacaodupla(M, C, O), ligacaosimples(M, C, O1), ligacaosimples(M, O1, H)), (atomo(M, O1, oxigenio), atomo(M, O, oxigenio), atomo(M, C, carbono), atomo(M, H, hidrogenio)), O \= O1, !. 

aldeido(M) :- (ligacaosimples(M, C, C1), ligacaosimples(M, C1, H), ligacaodupla(M, C1, O)), (atomo(M, C, carbono), atomo(M, C1, carbono), atomo(M, O, oxigenio), atomo(M, H, hidrogenio)), C\=C1, !.

cetona(M) :- (ligacaosimples(M, C, C1), ligacaodupla(M, C1, O), ligacaosimples(M, C1, C2)), (atomo(M, C, carbono), atomo(M, C1, carbono), atomo(M, C2, carbono), atomo(M, O, oxigenio)), C\=C2, !.

amina(M) :- (ligacaosimples(M, C, N), ligacaosimples(M, N, H1), ligacaosimples(M, N, H2), H1\=H2, atomo(M,C, carbono), atomo(M, N, nitrogenio), atomo(M, H1, hidrogenio), atomo(M, H1, hidrogenio)); 
    (ligacaosimples(M, C, N), ligacaosimples(M, N, C1), ligacaosimples(M, N, H), C\=C1, atomo(M,C, carbono), atomo(M, N, nitrogenio), atomo(M, H, hidrogenio), atomo(M, C1, carbono));
    (ligacaosimples(M, C, N), ligacaosimples(M, N, C1), ligacaosimples(M, N, C2), C\=C1, C\=C2, C1\=C2, atomo(M, C, carbono), atomo(M, N, nitrogenio), atomo(M, C1, carbono), atomo(M, C2, carbono)).
