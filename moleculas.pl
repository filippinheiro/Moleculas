%%prolog
:- dynamic ligacaodupla/3.
:- dynamic ligacaosimples/3.
:- dynamic ligacaotripla/3.
:- dynamic atomo/3.


                    %átomos
%%Coloque os átomos todos aqui


                    %ligações

%%Coloque as ligações simples aqui (Se houver)


%%Duplas aqui (Se houver)



%%Triplas aqui (Se houver)



%Predicados
ligacaoS(M, A1, A2) :-
    ligacaosimples(M, A1, A2).
ligacaoS(M, A1, A2) :-
    ligacaosimples(M, A2, A1).
ligacaoD(M, A1, A2) :-
    ligacaodupla(M, A1, A2).
ligacaoD(M, A1, A2) :-
    ligacaodupla(M, A2, A1).
ligacaoT(M, A1, A2) :-
    ligacaotripla(M, A1, A2).
ligacaoT(M, A1, A2) :-
    ligacaotripla(M, A2, A1).


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


alcool(M) :- 
    ligacaoS(M, C, O), 
    ligacaoS(M, O, H),
    not(ligacaoD(M, C, X)),
    atomo(M, C, carbono),
    atomo(M, O, oxigenio),
    atomo(M, H, hidrogenio),
    atomo(M, X, oxigenio),
    X\=O, 
    !. 

haleto(M) :-
    (ligacaoS(M, _, F);
    ligacaoD(M, _, F);
    ligacaoT(M, _, F);
    ligacaoS(M, _, C);
    ligacaoD(M, _, C);
    ligacaoT(M, _, C);
    ligacaoS(M, _, B);
    ligacaoD(M, _, B);
    ligacaoT(M, _, B);
    ligacaoS(M, _, I);
    ligacaoD(M, _, I);
    ligacaoT(M, _, I)),
    (atomo(M, F, fluor);
    atomo(M, C, cloro);
    atomo(M, B, bromo);
    atomo(M, I, iodo)), !.

identifica(M) :-
    (acido(M), writeln("Primário: Ácido Carboxílico, sufixo oico")),
    ((aldeido(M), writeln("Secundário: aldeido"));
    (cetona(M), writeln("Secundário: cetona"));
    (amina(M), writeln("Secundário: amina"));
    (alcool(M), writeln("Secundário: álcool"));
    (haleto(M), writeln("Secundário: haleto"))), fail.
identifica(M) :-
    (aldeido(M), not(acido(M)), writeln("Primário: Aldeido, sulfixo al")),
    ((cetona(M), writeln("Secundário: cetona"));
    (amina(M), writeln("Secundário: amina"));
    (alcool(M), writeln("Secundário: álcool"));
    (haleto(M), writeln("Secundário: haleto"))), fail.
identifica(M) :-
    (cetona(M),not(acido(M)), not(aldeido(M)), writeln("Primário: Cetona, sufixo ona")), 
    ((amina(M),  writeln("Secundário: amina"));
    (alcool(M), writeln("Secundário: álcool"));
    (haleto(M), writeln("Secundário: haleto"))), fail.
identifica(M) :-
    (amina(M), not(cetona(M)), not(aldeido(M)), not(acido(M)), writeln("Primário: Amina, sufixo amina")),
    ((alcool(M), writeln("Secundário: alcool"));
    (haleto(M), writeln("Secundário: haleto"))), fail.
identifica(M) :-
    (alcool(M), not(acido(M)), not(aldeido(M)), not(cetona(M)), not(amina(M)), writeln("Primário: Alcool, sufixo ol")),
    (haleto(M), writeln("Secundário: haleto")), fail.
identifica(M) :-
    haleto(M), not(acido(M)), not(aldeido(M)), not(cetona(M)), not(amina(M)), not(alcool(M)), writeln("Primário: Haleto, sufixo eto"), fail.
identifica(M) :-
    not(acido(M)),
    not(aldeido(M)),
    not(cetona(M)),
    not(amina(M)),
    not(alcool(M)),
    not(haleto(M)), writeln("Não apresenta nenhuma dessas funções"), fail.