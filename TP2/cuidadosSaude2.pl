:- set_prolog_flag( discontiguous_warnings, off).
:- set_prolog_flag( single_var_warnings, off).
:- set_prolog_flag( unknown, fail).

:- op(900, xfy, '::').
:- op(996, xfy, '&&' ).
:- op(997, xfy, '$$' ).
:- op(998, xfx, '=>' ).
:- op(999, xfx, '<=>' ).
:- dynamic utente/4.
:- dynamic '-'/1.
:- dynamic positivo/2.
:- dynamic negativo/2.
:- dynamic incerto/2.
:- dynamic interdito/2.
:- dynamic impreciso/2.
:- dynamic incertoCuidado/4.
:- dynamic interditoCuidado/4.
:- dynamic imprecisoCuidado/4.
:- dynamic positivoCuidado/4.
:- dynamic negativoCuidado/4.
:- dynamic inc/1.
:- dynamic imp/1.
:- dynamic intr/1.
:- dynamic prestador/4.
:- dynamic cuidado/6.
:- dynamic excecao/1.
:- dynamic nulo/1.

% utente: IdUt, Nome, Idade, Morada --> {V,F,D}
% prestador: IdPrest, Nome, Especialidade, Instituicao --> {V,F,D}
% cuidado: Data, Hora, IdUt, IdPrest, Descricao, Custo --> {V,F,D}
% ------------------------------------------------------------------

% -------------------------------------------------------
% --------------- Base de Conhecimento ------------------
% -------------------------------------------------------

utente(1, 'Joana Antunes', 18, 'Braga').
positivo(1,utente).
utente(2, 'Manuel Sousa', 37, 'Guimaraes').
positivo(2,utente).
utente(3, 'Ricardo Pimenta', 25, 'Braga').
positivo(3,utente).
utente(4, 'Carla Ribeiro', 67, 'Coimbra').
positivo(4,utente).
utente(5, 'Paula Costa', 21, 'Porto').
positivo(5,utente).
utente(6, 'Anabela Silva', 52, 'Braga').
positivo(6,utente).
utente(7, 'Rodrigo Bento', 9, 'Porto').
positivo(7,utente).
utente(12, 'Ricardo Lemos', desconhecido, 'Guarda').
incerto(12,utente).
utente(13, 'Andreia Silva', 17, desconhecido).
incerto(13,utente).
utente(14, desconhecido, 65, 'Algarve').
incerto(14,utente).
utente(16, 'Carlos Costa', semIdade, 'Lisboa').
interdito(16,utente).
utente(18, 'Carlota Carvalho', 25, semMorada).
interdito(18,utente).
-utente( 17, 'Joaquim Meireles', 24,'Faro' ).
negativo(17,utente).
-utente( 34, 'Sara Couto', 38,'Guarda' ).
negativo(34,utente).
-utente( 72, 'Anacleto Sousa', 83,'Setubal' ).
negativo(72,utente).


prestador(1, 'Maria Lemos', 'Psiquiatria', 'Hospital de Braga').
positivo(1,prestador).
prestador(2, 'Carla Sousa', 'Cardiologia', 'Hospital da Luz').
positivo(2,prestador).
prestador(3, 'Catarina Machado', 'Oftalmologia', 'Hospital de Braga').
positivo(3,prestador).
prestador(4, 'Antonio Costa', 'Clinica Geral', 'Santa Maria').
positivo(4,prestador).
prestador(5, 'Ana Sousa', 'Obstetricia', 'CUF Coimbra').
positivo(5,prestador).
prestador(10, desconhecido, 'Psiquiatria', 'CUF Porto').
incerto(10, prestador).
prestador(11, 'Catarina Pereira', desconhecido, 'Hospital da Luz').
incerto(11, prestador).
prestador(12, 'Fernando Silva', 'Cardiologia',desconhecido).
incerto(12, prestador).
prestador(13, 'Antonieta Goncalves', 'Psiquiatria', semInstituicao).
interdito(13, prestador).

-prestador(30,'Pedro Falcão','Oftalmologia','Hospital Sao Joao').
negativo(30,prestador).
-prestador(45,'Hugo Manso','Psiquiatria','Santa Maria').
negativo(45,prestador).
-prestador(98,'Adriana Esteves','Clinica Geral','CUF Coimbra').
negativo(98,prestador).


cuidado('14-03-2017', 16:40, 1, 5, 'Depressao', 30).
positivoCuidado('14-03-2017', 16:40, 5, cuidado).
cuidado('12-03-2017', 14:10, 3, 2, 'Ataque cardiaco',20).
positivoCuidado('12-03-2017', 14:10, 2, cuidado).
cuidado('13-12-2017', 12:15, 4, 2, 'Sopro no coração',10).
positivoCuidado('13-12-2017', 12:15, 2, cuidado).
cuidado('13-03-2017', 19:40, 5, 4, 'Ginecologia',25).
positivoCuidado('13-03-2017', 19:40, 4, cuidado).
cuidado('14-03-2017', 20:00, 2, 3, 'Miopia',35).
positivoCuidado('14-03-2017', 20:00, 3, cuidado).
cuidado('04-04-2017', 21:00, 6, 1, 'Ansiedade',70).
positivoCuidado('04-04-2017', 21:00, 1, cuidado).
cuidado('14-03-2017', 23:00, 7, 4, 'Febre',10).
positivoCuidado('14-03-2017', 23:00, 4, cuidado).
cuidado('15-03-2017', 10:00, 4, 3, desconhecido, 30).
incertoCuidado('15-03-2017', 10:00, 3, cuidado).
cuidado('16-03-2017', 14:00, 6, 3, 'Cataratas', desconhecido).
incertoCuidado('16-03-2017', 14:00, 3, cuidado).
cuidado('17-03-2017', 16:00, 4, 5, semDescricao, 30).
incertoCuidado('17-03-2017', 16:00, 5, cuidado).
cuidado('17-03-2017', 15:15, 5, 3, 'Miopia', semCusto).
interditoCuidado('17-03-2017', 15:15, 3, cuidado).
-cuidado('10-04-2018', 16:00, 1, 1, 'Ansiedade', 4).
negativoCuidado('10-04-2018', 16:00, 1, cuidado).
-cuidado('31-01-2017',10:33,4,2, 'Febre',10 ).
negativoCuidado('31-01-2017',10:33, 2, cuidado).
-cuidado('12-03-2016', 17:45,3, 5, 'Miopia', 20).
negativoCuidado('12-03-2016', 17:45, 5, cuidado).
-cuidado('24-05-2017', 18:45, 2, 8,'Depressao', 60).
negativoCuidado('24-05-2017', 18:45, 8, cuidado).

% meta-redicado conjuncao:
% Q1, Q2, Resposta -> {V,F, D}
conjuncao( verdadeiro, verdadeiro, verdadeiro ).
conjuncao( falso, _, falso ).
conjuncao( _, falso, falso ).
conjuncao( desconhecido, verdadeiro, desconhecido ).
conjuncao( V, desconhecido, desconhecido ) :- V \= falso.

% meta-redicado disjuncao:
% Q1, Q2, Resposta -> {V,F, D}
disjuncao( verdadeiro, _, verdadeiro ).
disjuncao( _, verdadeiro, verdadeiro ).
disjuncao( desconhecido, V, desconhecido ) :- V \= verdadeiro.
disjuncao( V, desconhecido, desconhecido ) :- V \= verdadeiro.
disjuncao( falso, falso, falso ).

% meta-predicado demoLista:
% Lista de questoes, Lista de respostas -> {V,F, D}
demoLista([],[]).
demoLista([Q|T],[R|S]) :- demo(Q,R), demoLista(T,S).

% meta-predicado demoComposicao
% Composicao de questoes, Respost
demoComposicao(Q && C, R) :- demo(Q,RQ), demoComposicao(C,RC), conjuncao(RQ,RC,R).
demoComposicao(Q $$ C, R) :- demo(Q,RQ), demoComposicao(C,RC), disjuncao(RQ,RC,R).
demoComposicao(Q, R) :- demo(Q,R).


% Predicado comprimento:
% Lista, comprimento -> {V,F}
comprimento([], 0).
comprimento([_H|T],N) :- comprimento(T,M), N is M+1.

% Predicado listaSolucoes:
% Termo, Predicado, Lista -> {V,F}
listaSolucoes(T,G,B) :- 
    findall(T,G,B).

% testaInv: L -> {V,F}
testaInv([]).
testaInv([I|Ls]) :- I, testaInv(Ls).

% Predicado de negação nao:
% Predicado -> {V,F}
nao(Q) :- Q,!,false.
nao(_).

insere(T) :- assert(T).
insere(T) :- retract(T), !,fail.

%evolucao: Termo-> {V,F}
evolucao(Termo) :-
        listaSolucoes(Inv,+Termo::Inv,S),
        insere(Termo),
        testaInv(S).
remove(T) :- retract(T).
remove(T) :- assert(T),!,fail.

removeAll([H|T]):-
        remove(H),
        removeAll(T).
removeAll([]).

removeIncerto(IdUt,utente) :-
        incerto(IdUt,utente),
        remove(incerto(IdUt,utente)).
removeIncerto(IdUt,utente).

removeIncerto(Data,Hora,IdPrest,cuidado) :-
        incertoCuidado(Data,Hora,IdPrest,cuidado),
        remove(incertoCuidado(Data,Hora,IdPrest,cuidado)).
removeIncerto(Data,Hora,IdPrest,cuidado).

removeIncerto(IdPrest,prestador) :-
        incerto(IdPrest,prestador),
        remove(incerto(IdPrest,prestador)).
removeIncerto(IdPrest,prestador).

% Vê se existe um predicado negativo do utente com aquele ID e se existir apaga-o
removeNegativo(IdUt,utente) :-
        negativo(IdUt,utente),
        remove(negativo(IdUt,utente)).
removeNegativo(IdUt,utente).

%Ve se existe um predicado negativo do cuidado com uma data,hora e prestador igual e se existir apaga-o
removeNegativo(Data,Hora,IdPrest,cuidado) :-
        negativo(Data,Hora,IdPrest,cuidado),
        remove(negativoCuidado(Data,Hora,IdPrest,cuidado)).
removeNegativo(Data,Hora,IdPrest,cuidado).

% Vê se existe um predicado negativo do prestador com aquele ID e se existir apaga-o
removeNegativo(IdPrest,prestador) :-
        negativo(IdPrest,prestador),
        remove(negativo(IdPrest,prestador)).
removeNegativo(IdPrest,prestador). 	

removeUtenteNegativo(IdUt) :-
      negativo(IdUt,utente),
      remove(utente(IdUt,_,_,_)).
removeUtenteNegativo(IdUt).

% remove utente do conhecimento incerto
removeUtente(IdUt) :-
      incerto(IdUt,utente),
      remove(utente(IdUt,_,_,_)).
removeUtente(IdUt).

% remove prestador do conhecimento incerto
removePrestador(IdPrest) :-
      incerto(IdPrest,prestador),
      remove(prestador(IdPrest,_,_,_)).
removePrestador(IdPrest).

% remove cuidado do conhecimento incerto
removeCuidado(Data,Hora,IdPrest) :- 
      incertoCuidado(Data,Hora,IdPrest,cuidado),
      remove(cuidado(Data,Hora,_,IdPrest,_,_)).
removeCuidado(Data,Hora,IdPrest).

removeImpreciso(IdUt,utente) :-
        impreciso(IdUt,utente),
        listaSolucoes((excecao(utente(IdUt,N,I,M))),excecao(utente(IdUt,N,I,M)),S),
        removeAll(S),
        remove(impreciso(IdUt,utente)).
removeImpreciso(IdUt,utente).

removeImpreciso(IdPrest, prestador) :- 
    impreciso(IdPrest,prestador),
    listaSolucoes(excecao(prestador(IdPrest,No,Esp,Inst)),excecao(prestador(IdPrest,No,Esp,Inst)),S),
    removeAll(S),
    remove(impreciso(IdPrest,prestador)).
removeImpreciso(IdPrest,prestador).

removeImpreciso(Data,Hora,IdPrest,cuidado) :- 
    imprecisoCuidado(Data,Hora,IdPrest,cuidado),
    listaSolucoes(excecao(cuidado(Data,Hora,IdUt,IdP,Desc,C)),excecao(cuidado(Data,Hora,IdUt,IdP,Desc,C)),S),
    removeAll(S),
    remove(imprecisoCuidado(Data,Hora,IdPrest,cuidado)).
removeImpreciso(Data,Hora,IdPrest,cuidado).

% ------------------------------------------------------------------
% -------------------------- Invariantes ---------------------------
% ------------------------------------------------------------------

% Nao permite a insercao de conhecimento repetido
+utente(IdUt,Nome,Idade,Morada)::(listaSolucoes(IdUt,utente(IdUt,Nome,Idade,Morada),L),
                                    comprimento(L,R),
                                    R==1).

+prestador(IdPrest,Nome,Especialidade,Instituicao)::(listaSolucoes(IdPrest,prestador(IdPrest,Nome,Especialidade,Instituicao),L),
                                    comprimento(L,R),
                                    R==1).

+cuidado(Data,Hora,IdUt,IdPrest,Descricao,Custo)::(listaSolucoes((Data,Hora,IdPrest),cuidado(Data,Hora,IdUt,IdPrest,Descricao,Custo),L),
                                     comprimento(L,R),
                                     R==1).

% Nao permite a insercao de conhecimento com o mesmo id
+utente(IdUt,_,_,_)::(listaSolucoes(IdUt,positivo(IdUt,utente),L),
                                    comprimento(L,R),
                                    R==1).

+prestador(IdPrest,_,_,_)::(listaSolucoes(IdPrest,positivo(IdPrest,prestador),L),
                                    comprimento(L,R),
                                    R==1).

+cuidado(Data,Hora,_,IdPrest,_,_)::(listaSolucoes((Data,Hora,IdPrest),positivoCuidado(Data,Hora,IdPrest,cuidado),L),
                                     comprimento(L,R),
                                     R==1).

% Nao permite a evolucao de conhecimento interdito
+utente(IdUt,_,_,_)::(listaSolucoes(IdUt,interdito(IdUt,utente),L),
                                    comprimento(L,R),
                                    R==0).

+prestador(IdPrest,_,_,_)::(listaSolucoes(IdPrest,interdito(IdPrest,prestador),L),
                                    comprimento(L,R),
                                    R==0).

+cuidado(Data,Hora,_,IdPrest,_,_)::(listaSolucoes((Data,Hora,IdPrest),interditoCuidado(Data,Hora,IdPrest,cuidado),L),
                                     comprimento(L,R),
                                     R==0).

% Nao permite conhecimento positivo e negativo simultaneamente
+utente(IdUt,Nome,Idade,Morada)::(listaSolucoes(IdUt,-utente(IdUt,Nome,Idade,Morada),L),
                                    comprimento(L,R),
                                    R==0).

+prestador(IdPrest,Nome,Especialidade,Instituicao)::(listaSolucoes(IdPrest,-prestador(IdPrest,Nome,Especialidade,Instituicao),L),
                                    comprimento(L,R),
                                    R==0).

+cuidado(Data,Hora,IdUt,IdPrest,Descricao,Custo)::(listaSolucoes((Data,Hora,IdPrest),-cuidado(Data,Hora,IdUt,IdPrest,Descricao,Custo),L),
                                     comprimento(L,R),
                                     R==0).

% conhecimento repetido
+(-utente(IdUt,_,_,_))::(listaSolucoes(IdUt,negativo(IdUt,utente),L),
                                    comprimento(L,R),
                                    R==1).

+(-prestador(IdPrest,_,_,_))::(listaSolucoes(IdPrest,negativo(IdPrest,prestador),L),
                                    comprimento(L,R),
                                    R==1).

+(-cuidado(Data,Hora,_,IdPrest,_,_))::(listaSolucoes((Data,Hora,IdPrest),negativoCuidado(Data,Hora,IdPrest,cuidado),L),
                                     comprimento(L,R),
                                     R==1).

% Verifica se nao exite conhecimento positivo contraditorio
+(-utente(IdUt,Nome,Idade,Morada))::(listaSolucoes(IdUt,utente(IdUt,Nome,Idade,Morada),L),
                                    comprimento(L,R),
                                    R==0).

+(-prestador(IdPrest,Nome,Especialidade,Instituicao))::(listaSolucoes(IdPrest,prestador(IdPrest,Nome,Especialidade,Instituicao),L),
                                    comprimento(L,R),
                                    R==0).

+(-cuidado(Data,Hora,IdUt,IdPrest,Descricao,Custo))::(listaSolucoes((Data,Hora,IdPrest),cuidado(Data,Hora,IdUt,IdPrest,Descricao,Custo),L),
                                     comprimento(L,R),
                                     R==0).

% Verifica se nao existe conhecimento Interdito
+(-utente(IdUt,_,_,_))::(listaSolucoes(IdUt,interdito(IdUt,utente),L),
                                    comprimento(L,R),
                                    R==0).

+(-prestador(IdPrest,_,_,_))::(listaSolucoes(IdPrest,interdito(IdPrest,prestador),L),
                                    comprimento(L,R),
                                    R==0).

+(-cuidado(Data,Hora,_,IdPrest,_,_))::(listaSolucoes((Data,Hora,IdPrest),interditoCuidado(Data,Hora,IdPrest,cuidado),L),
                                     comprimento(L,R),
                                     R==0).

% Nao permite a evolucao de conhecimento impreciso
+(-utente(IdUt,_,_,_))::(listaSolucoes(IdUt,impreciso(IdUt,utente),L),
                                    comprimento(L,R),
                                    R==0).

+(-prestador(IdPrest,_,_,_))::(listaSolucoes(IdPrest,impreciso(IdPrest,prestador),L),
                                    comprimento(L,R),
                                    R==0).

+(-cuidado(Data,Hora,_,IdPrest,_,_))::(listaSolucoes((Data,Hora,IdPrest),imprecisoCuidado(Data,Hora,IdPrest,cuidado),L),
                                     comprimento(L,R),
                                     R==0).

% Nao permite a insercao de conhecimento que ja existe
inc(utente(IdUt,_,_,_))::(listaSolucoes(IdUt,utente(IdUt,_,_,_),L),
                                   comprimento(L,R),
                                    R==1).

inc(prestador(IdPrest,_,_,_))::(listaSolucoes(IdPrest,prestador(IdPrest,_,_,_),L),
                                    comprimento(L,R),
                                    R==1).

inc(cuidado(Data,Hora,_,IdPrest,_,_))::(listaSolucoes((Data,Hora,IdPrest),cuidado(Data,Hora,_,IdPrest,_,_),L),
                                     comprimento(L,R),
                                     R==1).

% Nao permitir a insercao de conhecimento no caso de ja exitir conhecimento impreciso
inc(utente(IdUt,_,_,_))::(listaSolucoes(IdUt,impreciso(IdUt,utente),L),
                                   comprimento(L,R),
                                    R==0).

inc(prestador(IdPrest,_,_,_))::(listaSolucoes(IdPrest,impreciso(IdPrest,prestador),L),
                                   comprimento(L,R),
                                    R==0).

inc(cuidado(Data,Hora,_,IdPrest,_,_))::(listaSolucoes((Data,Hora,IdPrest),imprecisoCuidado(Data,Hora,IdPrest,cuidado),L),
                                     comprimento(L,R),
                                     R==0).

% Nao permitir a insercao de conhecimento interdito
imp(utente(IdUt,_,_,_))::(listaSolucoes(IdUt,interdito(IdUt,utente),L),
                                    comprimento(L,R),
                                    R==0).

imp(prestador(IdPrest,_,_,_))::(listaSolucoes(IdPrest,interdito(IdPrest,prestador),L),
                                    comprimento(L,R),
                                    R==0).

imp(cuidado(Data,Hora,_,IdPrest,_,_))::(listaSolucoes((Data,Hora,IdPrest),interditoCuidado(Data,Hora,IdPrest,cuidado),L),
                                     comprimento(L,R),
                                     R==0).

% Nao permitir a insercao de conhecimento interdito
imp(utente(IdUt,_,_,_))::(listaSolucoes(IdUt,positivo(IdUt,utente),L),
                                    comprimento(L,R),
                                    R==0).

imp(prestador(IdPrest,_,_,_))::(listaSolucoes(IdPrest,positivo(IdPrest,prestador),L),
                                    comprimento(L,R),
                                    R==0).

imp(cuidado(Data,Hora,_,IdPrest,_,_))::(listaSolucoes((Data,Hora,IdPrest),positivoCuidado(Data,Hora,IdPrest,cuidado),L),
                                     comprimento(L,R),
                                     R==0).

% Impede a insercao de conhecimento repetido
imp(utente(IdUt,Nome,Idade,Morada)) :: (listaSolucoes((IdUt,Nome,Idade,Morada),
                                             excecao(utente(IdUt,Nome,Idade,Morada)),S ),
                                             comprimento( S,N ),
                                             N==1).

imp(prestador(IdPrest,Nome,Esp,Inst)) :: (listaSolucoes( (IdPrest,Nome,Esp,Inst),
                                               excecao(prestador(IdPrest,Nome,Esp,Inst)),S ),
                                               comprimento( S,N ),
                                               N==1).

imp(cuidado(Data,Hora,IdUt,IdPrest,Desc,Custo)) :: (listaSolucoes( (Data,Hora,IdUt,IdPrest,Desc,Custo),
                                                         excecao(cuidado(Data,Hora,IdUt,IdPrest,Desc,Custo)),S ),
                                                         comprimento( S,N ),
                                                         N==1).

% Nao permite a insercao de conhecimento que ja existe
intr(utente(IdUt,_,_,_))::(listaSolucoes(IdUt,utente(IdUt,_,_,_),L),
                                   comprimento(L,R),
                                    R==1).

intr(prestador(IdPrest,_,_,_))::(listaSolucoes(IdPrest,prestador(IdPrest,_,_,_),L),
                                    comprimento(L,R),
                                    R==1).

intr(cuidado(Data,Hora,_,IdPrest,_,_))::(listaSolucoes((Data,Hora,IdPrest),cuidado(Data,Hora,_,IdPrest,_,_),L),
                                     comprimento(L,R),
                                     R==1).

-utente(IdUt,_,_,_):: (listaSolucoes(IdUt,utente(IdUt,_,_,_),L),
                                  comprimento(L,R),
                                  R == 1).

-prestador(IdPrest,_,_,_):: (listaSolucoes(IdPrest,prestador(IdPrest,_,_,_),L),
                              comprimento(L,R),
                              R == 1).

-cuidado(Data,Hora,_,IdPrest,_,_):: (listaSolucoes((Data,Hora,IdPrest),cuidado(Data,Hora,_,IdPrest,_,_),L),
                                      comprimento(L,R),
                                      R == 1).

-(-utente(IdUt,_,_,_)):: (listaSolucoes(IdUt, negativo(IdUt,utente),L),
                                  comprimento(L,R),
                                  R == 1).

-(-prestador(IdPrest,_,_,_)):: (listaSolucoes(IdPrest,negativo(IdPrest,prestador),L),
                              comprimento(L,R),
                              R == 1).

-(-cuidado(Data,Hora,_,IdPrest,_,_)):: (listaSolucoes((Data,Hora,IdPrest),negativoCuidado(Data,Hora,IdPrest,cuidado),L),
                                      comprimento(L,R),
                                      R == 1).

-inc(utente(IdUt,_,_,_)):: (listaSolucoes(IdUt,incerto(IdUt,utente),L),
                                  comprimento(L,R),
                                  R == 1).

-inc(prestador(IdPrest,_,_,_)):: (listaSolucoes(IdPrest,incerto(IdPrest,prestador),L),
                              comprimento(L,R),
                              R == 1).

-inc(cuidado(Data,Hora,_,IdPrest,_,_)):: (listaSolucoes((Data,Hora,IdPrest),incertoCuidado(Data,Hora,IdPrest,cuidado),L),
                                      comprimento(L,R),
                                      R == 1).

-imp(utente(IdUt,_,_,_)):: (listaSolucoes(IdUt,impreciso(IdUt,utente),L),
                                  comprimento(L,R),
                                  R == 1).

-imp(prestador(IdPrest,_,_,_)):: (listaSolucoes(IdPrest,impreciso(IdPrest,prestador),L),
                              comprimento(L,R),
                              R == 1).

-imp(cuidado(Data,Hora,_,IdPrest,_,_)):: (listaSolucoes((Data,Hora,IdPrest),imprecisoCuidado(Data,Hora,IdPrest,cuidado),L),
                                      comprimento(L,R),
                                      R == 1).

-intr(utente(IdUt,_,_,_)):: (listaSolucoes(IdUt,interdito(IdUt,utente),L),
                                  comprimento(L,R),
                                  R == 1).

-intr(prestador(IdPrest,_,_,_)):: (listaSolucoes(IdPrest,interdito(IdPrest,prestador),L),
                              comprimento(L,R),
                              R == 1).

-intr(cuidado(Data,Hora,_,IdPrest,_,_)):: (listaSolucoes((Data,Hora,IdPrest),interditoCuidado(Hora,Data,IdPrest,cuidado),L),
                                      comprimento(L,R),
                                      R == 1).

-utente(IdUt,_,_,_):: (listaSolucoes(IdUt,cuidado(_,_,IdUt,_,_,_),L),
                                  comprimento(L,R),
                                  R == 0).

-prestador(IdPrest,_,_,_):: (listaSolucoes(IdPrest,cuidado(_,_,_,IdPrest,_,_),L),
                              comprimento(L,R),
                              R == 0).

% ------------------------------------------------------------------
% -------------------------- Evolucao utente -----------------------
% ------------------------------------------------------------------

evolucao( utente( IdUt,Nome,Idade,Morada ), Tipo ) :-
    Tipo == positivo,
    listaSolucoes(I, +utente(IdUt,Nome,Idade,Morada)::I, S),
    insere(utente(IdUt,Nome,Idade,Morada)),
    insere(positivo(IdUt,utente)),
    testaInv(S),
    removeUtente(IdUt),
    removeIncerto(IdUt,utente),
    removeImpreciso(IdUt,utente).

evolucao( utente(IdUt, Nome, Idade ,Morada) , Tipo ) :-
    Tipo == negativo,
    listaSolucoes( I, +(-utente(IdUt, Nome, Idade ,Morada))::I, S ),
    insere(-utente(IdUt, Nome, Idade ,Morada) ),
    insere(negativo(IdUt,utente)),
    testaInv(S).

% Permite evolucao de utentes com idade desconhecida
evolucao( utente( IdUt,Nome,Idade,Morada ), Tipo, Desconhecido ) :-
    Tipo == incerto,
    Desconhecido == idade,
    listaSolucoes(I, inc(utente(IdUt,Nome,desconhecido,Morada))::I, S),
    insere(utente(IdUt,Nome,desconhecido,Morada)),
    testaInv(S),
    insere(incerto(IdUt,utente)).

% Permite evolucao de utentes com nome desconhecida
evolucao( utente( IdUt,Nome,Idade,Morada ), Tipo, Desconhecido ) :-
    Tipo == incerto,
    Desconhecido == nome,
    listaSolucoes(I, inc(utente(IdUt,desconhecido,Idade,Morada))::I, S),
    insere(utente(IdUt,desconhecido,Idade,Morada)),
    testaInv(S),
    insere(incerto(IdUt,utente)).

% Permite evolucao de utentes com morada desconhecida
evolucao( utente( IdUt,Nome,Idade,Morada ), Tipo, Desconhecido ) :-
    Tipo == incerto,
    Desconhecido == morada,
    listaSolucoes(I, inc(utente(IdUt,Nome,Idade,desconhecido))::I, S),
    insere(utente(IdUt,Nome,Idade,desconhecido)),
    testaInv(S),
    insere(incerto(IdUt,utente)).

% Permite evolucao de utentes com morada interdita
evolucao( utente( IdUt,Nome,Idade,Morada ), Tipo, Desconhecido ) :-
    Tipo == interdito,
    Desconhecido == morada,
    listaSolucoes(I, intr(utente(IdUt,Nome,Idade,semMorada))::I, S),
    insere(utente(IdUt,Nome,Idade,semMorada)),
    insere(interdito(IdUt,utente)),
    testaInv(S).

% Permite evolucao de utentes com idade interdita
evolucao( utente( IdUt,Nome,Idade,Morada ), Tipo, Desconhecido ) :-
    Tipo == interdito,
    Desconhecido == idade,
    listaSolucoes(I, intr(utente(IdUt,Nome,semIdade,Morada))::I, S),
    insere(utente(IdUt,Nome,semIdade,Morada)),
    insere(interdito(IdUt,utente)),
    testaInv(S).

evolucao( [utente( IdUt,Nome,Idade,Morada ) | R], Tipo ) :-
    Tipo = impreciso,
    listaSolucoes( I, imp(utente(IdUt,Nome,Idade,Morada))::I, S ),
    insere(excecao(utente(IdUt,Nome,Idade,Morada))),
    insere(impreciso(IdUt,utente)),
    testaInv(S),
    removeUtente(IdUt),
    removeIncerto(IdUt,utente),
    evolucao( R, impreciso ).
evolucao( [], tipo ).


% ------------------------------------------------------------------
% -------------------------- Evolucao prestador --------------------
% ------------------------------------------------------------------

evolucao( prestador( IdPrest,Nome,Especialidade,Instituicao ), Tipo ) :-
    Tipo == positivo,
    listaSolucoes(I, +prestador(IdPrest,Nome,Especialidade,Instituicao)::I, S),
    insere(prestador(IdPrest,Nome,Especialidade,Instituicao)),
    insere(positivo(IdPrest,prestador)),
    testaInv(S),
    removePrestador(IdPrest),
    removeIncerto(IdPrest,prestador),
    removeImpreciso(IdPrest,prestador).

evolucao(prestador(IdPrest, Nome, Especialidade ,Instituicao) , Tipo ) :-
    Tipo == negativo,
    listaSolucoes( I, +(-prestador(IdPrest, Nome, Especialidade ,Instituicao)) ::I, S ),
    insere(-prestador(IdPrest, Nome, Especialidade ,Instituicao) ),
    insere(negativo(IdPrest,prestador)),
    testaInv(S).


% Permite evolucao de prestadores com instituição desconhecida 
evolucao( prestador( IdPrest,Nome,Especialidade,Instituicao ), Tipo, Desconhecido ) :-
    Tipo == incerto,
    Desconhecido == instituicao,
    listaSolucoes(I, inc(prestador(IdPrest,Nome,Especialidade,desconhecido))::I, S),
    insere(prestador(IdPrest,Nome,Especialidade,desconhecido)),
    testaInv(S),
    insere(incerto(IdPrest,prestador)).

% Permite evolucao de prestadores com instituição desconhecida 
evolucao( prestador( IdPrest,Nome,Especialidade,Instituicao ), Tipo, Desconhecido ) :-
    Tipo == incerto,
    Desconhecido == nome,
    listaSolucoes(I, inc(prestador(IdPrest,desconhecido,Especialidade,Instituicao))::I, S),
    insere(prestador(IdPrest,desconhecido,Especialidade,Instituicao)),
    testaInv(S),
    insere(incerto(IdPrest,prestador)).

evolucao( [prestador( IdPrest,Nome,Especialidade,Instituicao ) | R], Tipo ) :-
    Tipo == impreciso,
    listaSolucoes( I, imp(prestador(IdPrest,Nome,Especialidade,Instituicao))::I, S ),
    insere(excecao(prestador(IdPrest,Nome,Especialidade,Instituicao))),
    insere(impreciso(IdPrest,prestador)),
    testaInv(S),
    removePrestador(IdPrest),
    removeIncerto(IdPrest,prestador),
    evolucao( R, impreciso ).
evolucao( [], Tipo ).

% Permite evolucao de prestadores com instituição interdita 
evolucao( prestador( IdPrest,Nome,Especialidade,Instituicao ), Tipo, Desconhecido ) :-
    Tipo == interdito,
    Desconhecido == instituicao,
    listaSolucoes(I, intr(prestador(IdPrest,Nome,Especialidade,semInstituicao))::I, S),
    insere(prestador(IdPrest,Nome,Especialidade,semInstituicao)),
    insere(interdito(IdPrest,prestador)),
    testaInv(S).

% ------------------------------------------------------------------
% -------------------------- Evolucao cuidado ----------------------
% ------------------------------------------------------------------

evolucao( cuidado( Data,Hora,IdUt,IdPrest,Descricao,Custo ), Tipo ) :-
    Tipo == positivo,
    listaSolucoes(I, +cuidado(Data,Hora,IdUt,IdPrest,Descricao,Custo)::I, S),
    insere(cuidado(Data,Hora,IdUt,IdPrest,Descricao,Custo)),
    insere(positivoCuidado(Data,Hora,IdPrest,cuidado)),
    testaInv(S),
    removeCuidado(Data,Hora,IdPrest),
    removeIncerto(Data,Hora,IdPrest,cuidado),
    removeImpreciso(Data,Hora,IdPrest,cuidado).

  evolucao(cuidado( Data,Hora,IdUt,IdPrest,Descricao,Custo ) , Tipo ) :-
    Tipo == negativo,
    listaSolucoes( I, +(-cuidado( Data,Hora,IdUt,IdPrest,Descricao,Custo )) ::I, S ),
    insere(-cuidado( Data,Hora,IdUt,IdPrest,Descricao,Custo ) ),
    insere(negativoCuidado( Data,Hora,IdPrest,cuidado )),
    testaInv(S).


% Permite evolucao de cuidados com custos desconhecidos
evolucao( cuidado( Data,Hora,IdUt,IdPrest,Descricao,Custo ), Tipo, Desconhecido ) :-
    Tipo == incerto,
    Desconhecido == custo,
    listaSolucoes(I, inc(cuidado(Data,Hora,IdUt,IdPrest,Descricao,desconhecido))::I, S),
    insere(cuidado(Data,Hora,IdUt,IdPrest,Descricao,desconhecido)),
    testaInv(S),
    insere(incertoCuidado(Data,Hora,IdPrest,cuidado)).

% Permite evolucao de cuidados com descricao desconhecidos
evolucao( cuidado( Data,Hora,IdUt,IdPrest,Descricao,Custo ), Tipo, Desconhecido ) :-
    Tipo == incerto,
    Desconhecido == descricao,
    listaSolucoes(I, inc(cuidado(Data,Hora,IdUt,IdPrest,desconhecido,Custo))::I, S),
    insere(cuidado(Data,Hora,IdUt,IdPrest,desconhecido,Custo)),
    testaInv(S),
    insere(incertoCuidado(Data,Hora,IdPrest,cuidado)).

% Permite evolucao de cuidados com custo entre dois valores 
evolucao( [cuidado( Data,Hora,IdUt,IdPrest,Descricao,Custo) | R], Tipo ) :-
    Tipo == impreciso,
    listaSolucoes( I, imp(cuidado(Data,Hora,IdUt,IdPrest,Descricao,Custo))::I, S ),
    insere(excecao(cuidado(Data,Hora,IdUt,IdPrest,Descricao,Custo))),
    insere(imprecisoCuidado(Data,Hora,IdPrest,cuidado)),
    testaInv(S),
    removeCuidado(Data,Hora,IdPrest),
    removeIncerto(Data,Hora,IdPrest,cuidado),
    evolucao( R, impreciso ).
evolucao( [], Tipo ).

% Permite evolucao de cuidados com custos interditos
evolucao( cuidado( Data,Hora,IdUt,IdPrest,Descricao,Custo ), Tipo, Desconhecido ) :-
    Tipo == interdito,
    Desconhecido == custo,
    listaSolucoes(I, intr(cuidado(Data,Hora,IdUt,IdPrest,Descricao,semCusto))::I, S),
    insere(cuidado(Data,Hora,IdUt,IdPrest,Descricao,semCusto)),
    insere(interditoCuidado(Data,Hora,IdPrest,cuidado)),
    testaInv(S).

% Permite evolucao de cuidados com custos interditos
evolucao( cuidado( Data,Hora,IdUt,IdPrest,Descricao,Custo ), Tipo, Desconhecido ) :-
    Tipo == interdito,
    Desconhecido == descricao,
    listaSolucoes(I, intr(cuidado(Data,Hora,IdUt,IdPrest,semDescricao,Custo))::I, S),
    insere(cuidado(Data,Hora,IdUt,IdPrest,semDescricao,Custo)),
    insere(interditoCuidado(Data,Hora,IdPrest,cuidado)),
    testaInv(S).

% ------------------------------------------------------------------
% -------------------------- Involução utente --------------------
% ------------------------------------------------------------------

involucao(utente(IdUt, Nome,Idade,Morada), Tipo) :-
    Tipo == positivo,
    listaSolucoes(I, -utente(IdUt, Nome,Idade,Morada)::I, S),
    testaInv(S),
    remove(utente(IdUt, Nome,Idade,Morada)),
    remove(positivo(IdUt, utente)).
    

involucao(utente(IdUt, Nome,Idade,Morada),Tipo ) :-
    Tipo == negativo,
    listaSolucoes( I, -(-utente(IdUt, Nome,Idade,Morada))::I, S ),
    testaInv(S),
    remove(-utente(IdUt, Nome,Idade,Morada)),
    remove(negativo(IdUt, utente)).

involucao( utente(IdUt,Nome,Idade,Morada), Tipo, Desconhecido) :-
    Tipo == incerto,
    Desconhecido == nome,
    listaSolucoes(I, -inc(utente(IdUt,desconhecido,Idade,Morada))::I, S),
    testaInv(S),
    remove(utente(IdUt,desconhecido,Idade,Morada)),
    remove(incerto(IdUt,utente)).

involucao( utente(IdUt,Nome,Idade,Morada), Tipo, Desconhecido) :-
    Tipo == incerto,
    Desconhecido == idade,
    listaSolucoes(I, -inc(utente(IdUt,Nome,desconhecido,Morada))::I, S),
    testaInv(S),
    remove(utente(IdUt,Nome,desconhecido,Morada)),
    remove(incerto(IdUt,utente)).

involucao( utente(IdUt,Nome,Idade,Morada), Tipo, Desconhecido) :-
    Tipo == incerto,
    Desconhecido == morada,
    listaSolucoes(I, -inc(utente(IdUt,Nome,Idade,desconhecido))::I, S),
    testaInv(S),
    remove(utente(IdUt,Nome,Idade,desconhecido)),
    remove(incerto(IdUt,utente)).

involucao( utente(IdUt,Nome,Idade,Morada), Tipo, Desconhecido) :-
    Tipo == interdito,
    Desconhecido == morada,
    listaSolucoes(I, -intr(utente(IdUt,Nome,Idade,semMorada))::I, S),
    testaInv(S),
    remove(utente(IdUt,Nome,Idade,semMorada)),
    remove(interdito(IdUt,utente)).

involucao( utente(IdUt,Nome,Idade,Morada), Tipo, Desconhecido) :-
    Tipo == interdito,
    Desconhecido == idade,
    listaSolucoes(I, -intr(utente(IdUt,Nome,semIdade,Morada))::I, S),
    testaInv(S),
    remove(utente(IdUt,Nome,semIdade,Morada)),
    remove(interdito(IdUt,utente)).

involucao( [utente(IdUt,Nome,Idade,Morada) | R], Tipo ) :-
    Tipo == impreciso,
    listaSolucoes( Inv, -imp(utente(IdUt,Nome,Idade,Morada))::Inv, S),
    testaInv(S),
    remove(excecao(utente(IdUt,Nome,Idade,Morada))),
    remove(impreciso(IdUt,utente)),
    evolucao( R, impreciso ).
involucao( [], Tipo ).

% ------------------------------------------------------------------
% -------------------------- Involução prestador --------------------
% ------------------------------------------------------------------

involucao( prestador(IdPrest, Nome,Especialidade,Instituicao), Tipo) :-
    Tipo == positivo,
    listaSolucoes(I, -prestador(IdPrest,Nome,Especialidade,Instituicao)::I, S),
    testaInv(S),
    remove(prestador(IdPrest, Nome, Especialidade,Instituicao)),
    remove(positivo(IdPrest,prestador)).
    

involucao( prestador(IdPrest,Nome,Especialidade,Instituicao),Tipo ) :-
    Tipo == negativo,
    listaSolucoes( I, -(-prestador(IdPrest,Nome,Especialidade,Instituicao) )::I, S ),
    testaInv(S),
    remove(-prestador(IdPrest,Nome,Especialidade,Instituicao) ),
    remove(negativo(IdPrest,prestador)).

involucao( prestador(IdPrest,Nome,Especialidade,Instituicao), Tipo, Desconhecido) :-
    Tipo == incerto,
    Desconhecido == Nome,
    listaSolucoes(I, -inc(prestador(IdPrest,desconhecido,Especialidade,Instituicao))::I, S),
    testaInv(S),
    remove(prestador(IdPrest,desconhecido,Especialidade,Instituicao)),
    remove(incerto(IdPrest,prestador)).

involucao( prestador(IdPrest,Nome,Especialidade,Instituicao), Tipo, Desconhecido) :-
    Tipo == incerto,
    Desconhecido == instituicao,
    listaSolucoes(I, -inc(prestador(IdPrest,Nome,Especialidade,desconhecido))::I, S),
    testaInv(S),
    remove(prestador(IdPrest,Nome,Especialidade,desconhecido)),
    remove(incerto(IdPrest,prestador)).

involucao( prestador(IdPrest,Nome,Especialidade,Instituicao), Tipo, Desconhecido) :-
    Tipo == interdito,
    Desconhecido == instituicao,
    listaSolucoes(I, -intr(prestador(IdPrest,Nome,Especialidade,semInstituicao))::I, S),
    testaInv(S),
    remove(prestador(IdPrest,Nome,Especialidade,semInstituicao)),
    remove(interdito(IdPrest,prestador)).

involucao( [prestador(IdPrest,Nome,Especialidade,Instituicao) | R], Tipo ) :-
    Tipo == impreciso,
    listaSolucoes( Inv, -imp(prestador(IdPrest,Nome,Especialidade,Instituicao))::Inv, S),
    testaInv(S),
    remove(excecao(prestador(IdPrest,Nome,Especialidade,Instituicao))),
    remove(impreciso(IdPrest,prestador)),
    evolucao( R, impreciso ).
involucao( [], Tipo ).

% ------------------------------------------------------------------
% -------------------------- Involução cuidado --------------------
% ------------------------------------------------------------------

involucao(cuidado(Data,Hora,IdUt,IdPrest,Descricao,Custo), Tipo) :-
    Tipo == positivo,
    listaSolucoes(I, -cuidado(Data,Hora,IdUt,IdPrest,Descricao,Custo)::I, S),
    testaInv(S),
    remove(cuidado(Data,Hora,IdUt,IdPrest,Descricao,Custo)),
    remove(positivoCuidado(Data,Hora,IdPrest,cuidado)).
    

involucao(cuidado(Data,Hora,IdUt,IdPrest,Descricao,Custo),Tipo ) :-
    Tipo == negativo,
    listaSolucoes( I, -(-cuidado(Data,Hora,IdUt,IdPrest,Descricao,Custo) )::I, S ),
    testaInv(S),
    remove(-cuidado(Data,Hora,IdUt,IdPrest,Descricao,Custo) ),
    remove(negativoCuidado(Data,Hora,IdPrest,cuidado)).

involucao( cuidado(Data,Hora,IdUt,IdPrest,Descricao,Custo), Tipo, Desconhecido) :-
    Tipo == incerto,
    Desconhecido == descricao,
    listaSolucoes(I, -inc(cuidado(Data,Hora,IdUt,IdPrest,desconhecido,Custo))::I, S),
    testaInv(S),
    remove(cuidado(Data,Hora,IdUt,IdPrest,desconhecido,Custo)),
    remove(incertoCuidado(Data,Hora,IdPrest,cuidado)).

involucao( cuidado(Data,Hora,IdUt,IdPrest,Descricao,Custo), Tipo, Desconhecido) :-
    Tipo == incerto,
    Desconhecido == custo,
    listaSolucoes(I, -inc(cuidado(Data,Hora,IdUt,IdPrest,Descricao,desconhecido))::I, S),
    testaInv(S),
    remove(cuidado(Data,Hora,IdUt,IdPrest,Descricao,desconhecido)),
    remove(incertoCuidado(Data,Hora,IdPrest,cuidado)).

involucao( cuidado(Data,Hora,IdUt,IdPrest,Descricao,Custo), Tipo, Desconhecido) :-
    Tipo == interdito,
    Desconhecido == custo,
    listaSolucoes(I, -intr(cuidado(Data,Hora,IdUt,IdPrest,Descricao,semCusto))::I, S),
    testaInv(S),
    remove(cuidado(Data,Hora,IdUt,IdPrest,Descricao,semCusto)),
    remove(interditoCuidado(Data,Hora,IdPrest,cuidado)).

involucao( cuidado(Data,Hora,IdUt,IdPrest,Descricao,Custo), Tipo, Desconhecido) :-
    Tipo == interdito,
    Desconhecido == descricao,
    listaSolucoes(I, -intr(cuidado(Data,Hora,IdUt,IdPrest,semDescricao,Custo))::I, S),
    testaInv(S),
    remove(cuidado(Data,Hora,IdUt,IdPrest,semDescricao,Custo)),
    remove(interditoCuidado(Data,Hora,IdPrest,cuidado)).

involucao( [cuidado(Data,Hora,IdUt,IdPrest,Descricao,Custo) | R], Tipo ) :-
    Tipo == impreciso,
    listaSolucoes( Inv, -imp(cuidado(Data,Hora,IdUt,IdPrest,Descricao,Custo))::Inv, S),
    testaInv(S),
    remove(excecao(cuidado(Data,Hora,IdUt,IdPrest,Descricao,Custo))),
    remove(imprecisoCuidado(Data,Hora,IdPrest,cuidado)),
    evolucao( R, impreciso ).
involucao( [], Tipo ).

% Predicado demo:
% Questao, Resposta -> {V,F,D}
demo( Questao,verdadeiro ) :-
    Questao.
demo( Questao,falso ) :-
    -Questao.
demo( Questao,desconhecido ) :-
    nao( Questao ),
    nao( -Questao ).

%--------------------------------------------------------
% --------------- Invariantes de involução --------------
% -------------------------------------------------------
% -------------------------------------------------------

% Pressupostos do mundo fechado
-Q :- nao(Q), nao(excecao(Q)).

% ------------------------------------------------------
% --------------- Conhecimento Incerto -----------------
% ------------------------------------------------------
excecao(utente(IdUt,Nome,_,Morada)):- utente(IdUt,Nome,desconhecido,Morada).
excecao(utente(IdUt,Nome,Idade,_)):- utente(IdUt,Nome,Idade,desconhecido).
excecao(utente(IdUt,_,Idade,Morada)):- utente(IdUt,desconhecido,Idade,Morada).

excecao(prestador(IdPrest,_,Especialidade,Instituicao)) :- prestador(IdPrest,desconhecido,Especialidade,Instituicao).
excecao(prestador(IdPrest,Nome,_,Instituicao)) :- prestador(IdPrest,Nome,desconhecido,Instituicao).
excecao(prestador(IdPrest,Nome,Especialidade,_)) :- prestador(IdPrest,Nome,Especialidade,desconhecido).


excecao(cuidado(Data,Hora,IdUt,IdPrest,_,Custo)) :- cuidado(Data,Hora,IdUt,IdPrest,desconhecido,Custo).
excecao(cuidado(Data,Hora,IdUt,IdPrest,Descricao,_)) :- cuidado(Data,Hora,IdUt,IdPrest,Descricao,desconhecido).
excecao(cuidado(Data,_,IdUt,IdPrest,Descricao,Custo)) :- cuidado(Data,desconhecido,IdUt,IdPrest,Descricao,Custo).
excecao(cuidado(_,Hora,IdUt,IdPrest,Descricao,Custo)) :- cuidado(desconhecido,Hora,IdUt,IdPrest,Descricao,Custo).

% ------------------------------------------------------
% -------------- Conhecimento Impreciso ----------------
% ------------------------------------------------------

% Dúvida sobre o nome do utente, cujo identifcador é 8.
excecao(utente(8, 'Julia Fernandes', 38, 'Braga')).
excecao(utente(8, 'Julia Goncalves', 38, 'Braga')).
impreciso(8, utente).

% Dúvida sobre a morada do utente, cujo identificador é 9.
excecao(utente(10, 'Joao Pereira', 22, 'Lisboa')).
excecao(utente(10, 'Joao Pereira', 22, 'Guarda')).
impreciso(10, utente).

% Dúvida sobre a idade do utente, cujo identificador é 9.
excecao(utente(11, 'Joana Pereira', 21, 'Coimbra')).
excecao(utente(11, 'Joana Pereira', 22, 'Coimbra')).
impreciso(11, utente).

% Dúvida sobre a Morada e a idade do utente cujo identificador é 9.
excecao(utente(9, 'Benedita Andrade', 60, 'Porto')).
excecao(utente(9, 'Benedita Andrade', 61, 'Porto')).
excecao(utente(9, 'Benedita Andrade', 60, 'Braganca')).
excecao(utente(9, 'Benedita Andrade', 61, 'Braganca')).
impreciso(9, utente).

% Duvida sobre a especialidade associada ao prestador cujo identificador é 6.
excecao(prestador(6,'Daniel Ferreira','Pediatria','Hospital de Braga')).
excecao(prestador(6,'Daniel Ferreira','Cirurgia','Hospital de Braga')).
impreciso(6, prestador).

% Duvida sobre a instituicao do prestador cujo identificador é 7.
excecao(prestador(7,'Daniela Ferreira','Pediatria','Hospital de Braga')).
excecao(prestador(7,'Daniela Ferreira','Pediatria','Hospital da Luz')).
impreciso(7, prestador).

% Duvida sobre o nome do prestador cujo identificador é 8.
excecao(prestador(8,'Gabriel Ferreira','Cardiologia','Hospital de Braga')).
excecao(prestador(8,'Gabriel Pereira','Cardiologia','Hospital da Braga')).
impreciso(8, prestador).

% Duvida sobre a instituicao e a espacialidade do prestador cujo identificador é 9.
excecao(prestador(9,'Duarte Silva','Pediatria','Hospital de Braga')).
excecao(prestador(9,'Duarte Silva','Oftalmologia','Hospital de Braga')).
excecao(prestador(9,'Duarte Silva','Pediatria','CUF Coimbra')).
excecao(prestador(9,'Duarte Silva','Oftalmologia','CUF Coimbra')).
impreciso(9, prestador).

% Duvida sobre a descricao do cuidado.
excecao(cuidado('07-02-2019',13:30,1,4,'Febre',30)).
excecao(cuidado('07-02-2019',13:30,1,4,'Ansiedade',30)).
imprecisoCuidado('07-02-2019', 13:30, 4, cuidado).

% Duvida sobre o custo do cuidado.
excecao(cuidado('30-04-2018', 9:30, 4, 3,'Sopro no coracao', 50)).
excecao(cuidado('30-04-2018', 9:30, 4, 3,'Sopro no coracao', 60)).
imprecisoCuidado('30-04-2018', 9:30, 4, cuidado).

% ------------------------------------------------------
% -------------- Conhecimento Interdito ----------------
% ------------------------------------------------------

excecao(utente(IdUt,Nome,_,Morada)):- utente(IdUt,Nome,semIdade,Morada).
excecao(utente(IdUt,Nome,Idade,_)):- utente(IdUt,Nome,Idade,semMorada).

excecao(prestador(IdPrest,Nome,Especialidade,_)) :- prestador(IdPrest,Nome,Especialidade,semInstituicao).

excecao(cuidado(Data,Hora,IdUt,IdPrest,_,Custo)) :- cuidado(Data,Hora,IdUt,IdPrest,semDescricao,Custo).
excecao(cuidado(Data,Hora,IdUt,IdPrest,Descricao,_)) :- cuidado(Data,Hora,IdUt,IdPrest,Descricao,semCusto).

nulo(semIdade).
nulo(semMorada).
nulo(semData).
nulo(semHora).
nulo(semInstituicao).
nulo(semDescricao).
nulo(semCusto).
