:- op(900, xfy, '::').
:- dynamic utente/4.
:- dynamic consulta/5.
:- dynamic servico/4.
:- dynamic medico/3.
:- dynamic enfermeiro/3.
:- dynamic turno/2.
:- dynamic escalonamento/4.

% utente: IdUt, Nome, Idade, Cidade --> {V,F}
% servico: IdServ, Descricao, Instituicao, Cidade --> {V,F}
% medico:  IdMed, Nome, Idade --> {V, F}
% consulta: Data, IdUt, IdServ, Custo, IdMed --> {V,F}
% enfermeiro: IdEnf, Nome, Idade --> {V, F}
% turno: IdTurno, Horas --> {V,F}
% escalonamento: Data, IdEnf, IdTurno, Instituicao --> {V, F}
% -------------------------------------------------------

% -------------------------------------------------------
% --------------- Base de Conhecimento ------------------
% -------------------------------------------------------

utente(1, 'Joana Antunes', 18, 'Braga').
utente(2, 'Manuel Sousa', 37, 'Guimaraes').
utente(3, 'Ricardo Pimenta', 25, 'Braga').
utente(4, 'Carla Ribeiro', 67, 'Coimbra').
utente(5, 'Paula Costa', 21, 'Porto').
utente(6, 'Anabela Silva', 52, 'Braga').
utente(7, 'Rodrigo', 9, 'Porto').
utente(8, 'Joel Fernandes', 34, 'Porto').
utente(9, 'Jessica Pereira', 41, 'Guimaraes').
utente(10, 'Adriana Teixeira', 85, 'Braga').
utente(11, 'Roberto Leal', 7, 'Guimaraes').
utente(12, 'Anibal Esteves', 24, 'Coimbra').
utente(13, 'Joana Peixoto', 17, 'Porto').
utente(14, 'Raquel Gomes', 50, 'Braga').
utente(15, 'Hugo Silva', 71, 'Coimbra').

servico(1, 'Pediatria', 'Hospital de Braga', 'Braga').
servico(2, 'Cirurgia', 'Hospital de Braga', 'Braga').
servico(3, 'Reabilitacao', 'Hospital da Luz', 'Guimaraes').
servico(4, 'Oftalmologia', 'Santa Maria', 'Porto').
servico(5, 'Ortopedia', 'Santa Maria', 'Porto').
servico(6, 'Cirurgia', 'CUF Coimbra', 'Coimbra').
servico(7, 'Neurologia', 'Sao Joao', 'Porto').

medico(1,'Maria Lemos',35).
medico(2,'Carla Sousa',40).
medico(3,'Catarina Machado',35).
medico(4,'Antonio Costa',40).
medico(5,'Ana Sousa',56).
medico(6,'Josefina Costa',34).
medico(7,'Carlos Andrade',22).
medico(8,'Andre Barbosa',32).

consulta(2019-01-02,1,1,40,1).
consulta(2019-01-02,2,1,50,1).
consulta(2019-01-03,1,2,90,2).
consulta(2019-01-03,3,3,70,3).
consulta(2019-01-03,4,3,70,3).
consulta(2019-01-04,5,3,80,3).
consulta(2019-01-04,6,3,50,4).
consulta(2019-01-06,2,4,35,5).
consulta(2019-01-06,1,4,40,5).
consulta(2019-01-06,4,4,40,6).
consulta(2019-01-07,5,5,60,8).
consulta(2019-01-07,3,6,90,6).
consulta(2019-01-08,6,6,100,6).
consulta(2019-01-09,6,7,120,7).

enfermeiro(1,'Joao Antunes',32).
enfermeiro(2,'Catia Aveiro',29).
enfermeiro(3,'Alexandre Torres',47).
enfermeiro(4,'Silvia Sousa',50).
enfermeiro(5,'Andre Ferreira',42).
enfermeiro(6,'Madalena Soares',23).

turno(1,'01h-07h').
turno(2,'07h-13h').
turno(3,'13h-19h').
turno(4,'19h-01h').

escalonamento(2019-01-02,1,1,'Hospital de Braga').
escalonamento(2019-01-03,2,2,'Hospital de Braga').
escalonamento(2019-01-03,3,2,'CUF Coimbra').
escalonamento(2019-01-04,4,3,'Santa Maria').
escalonamento(2019-01-06,5,4,'Santa Maria').
escalonamento(2019-01-08,6,4,'Hospital da Luz').

% Predicado nao:
% Q -> {V,F}
nao(_Q) :- _Q,!,false.
nao(_Q).

% Predicado listaSolucoes:
% Termo, Predicado, Lista -> {V,F}
listaSolucoes(T,G,B) :- 
	findall(T,G,B).

% Predicado soma:
% Lista, valor -> {V,F}
soma([],0).
soma([H|L],R) :-
	soma(L,X), R is X+H.

% Predicado comprimento:
% Lista, comprimento -> {V,F}
comprimento([], 0).
comprimento([_H|T],N) :- comprimento(T,M), N is M+1.

% Predicado pertence:
% Elemento, Lista -> {V,F}
pertence(H,[H|_T]).
pertence(X,[H|_T]) :-
	X \= H,
pertence(X,_T).

% Predicado semRepetidos:
% ListaA, ListaB -> {V,F}
semRepetidos([],[]).
semRepetidos([H|T], R) :-
	pertence(H,T),
	semRepetidos(T,R).
semRepetidos([H|T], [H|R]) :-
	nao(pertence(H,T)),
	semRepetidos(T,R).

testaInv([]).
testaInv([H|T]) :- H, testaInv(T).

%Determinar a maior entre duas datas
data_Maior(Y1-M1-D1,Y2-M2-D2,Y2-M2-D2) :- Y2 > Y1;
                                         (Y2 == Y1, M2 > M1);
                                         (Y2 == Y1, M2 == M1, D2 >= D1).
data_Maior(Y1-M1-D1,Y2-M2-D2,Y1-M1-D1) :- Y2 < Y1;
                                         (Y2 == Y1, M2 < M1);
(Y2 == Y1, M2 == M1, D2 < D1).

%Verifica se a data de uma determinada consulta está entre duas datas.
testa_Data_Consulta(D1,D2,C) :- data_Maior(D1,C,C),data_Maior(D2,C,D2).

% ---------------------------------------------------
% Invariantes para a remocao
% ---------------------------------------------------

-utente(Id,N,I,C):: (listaSolucoes(Id,utente(Id,N,I,C),L),
					 comprimento(L,R),
					 R == 1).

-servico(Id,S,I,C):: (listaSolucoes(Id,servico(Id,S,I,C),L),
					 comprimento(L,R),
					 R == 1).

-consulta(D,IdU,IdS,C,IdMed):: (listaSolucoes((D,IdU,IdS),consulta(D,IdU,IdS,C,IdMed),L),
					 comprimento(L,R),
					 R == 1).

-utente(Id,_,_,_):: (listaSolucoes(Id,consulta(_,Id,_,_,_),L),
					 comprimento(L,R),
					 R == 0).

-servico(Id,_,_,_):: (listaSolucoes(Id,consulta(_,Id,_,_),L),
					 comprimento(L,R),
					 R == 0).

-medico(IdMed,N,I):: (listaSolucoes(IdMed,medico(IdMed,N,I),L),
					        comprimento(L,R),
					        R == 1).

-medico(IdMed,_,_):: (listaSolucoes(IdMed,consulta(_,_,_,_,IdMed),L),
					        comprimento(L,R),
					        R == 0).

-enfermeiro(IdEnf,N,I):: (listaSolucoes(IdEnf,enfermeiro(IdEnf,N,I),L),
					          comprimento(L,R),
					          R == 1).

-enfermeiro(IdEnf,_,_) :: ( listaSolucoes(IdEnf, escalonamento(_,IdEnf,_,_), L ),
					                                comprimento(L,R),
					                                 R == 0 ).

-turno(IdTurno,H):: (listaSolucoes(IdTurno,turno(IdTurno,H),L),
					          comprimento(L,R),
					          R == 1).

-turno(IdTurno,_):: (listaSolucoes(IdTurno,escalonamento(_,_,IdTurno,_),L),
					          comprimento(L,R),
					          R == 0).

-escalonamento(D,IdEnf,IdT,I):: (listaSolucoes(IdT,escalonamento(D,IdEnf,IdT,I),L),
					            comprimento(L,R),
					            R == 1).

%-----------------------------------------------------------
% Invariantes para a inserção
% -------------------------------------------------
+utente(IdUt,_,_,_)::(listaSolucoes(IdUt,utente(IdUt,_,_,_),L),
                                    comprimento(L,R),
                                    R==1).

+servico(Id,_,_,_):: (listaSolucoes(Id,servico(Id,_,_,_),L),
                                         comprimento(L,R),
                                         R == 1).

+enfermeiro(IdEnf,_,_):: (listaSolucoes(IdEnf,enfermeiro(IdEnf,_,_),L),
                                                  comprimento(L,R),
                                                  R == 1).

+medico(IdMed,_,_):: (listaSolucoes(IdMed,medico(IdMed,_,_),L),
                                                comprimento(L,R),
                                                        R == 1).

+servico(_,D,I,C):: (listaSolucoes((D,I),servico(_,D,I,C),L),
                          comprimento(L,R),
                          R==1).


+consulta(_,IdU,IdS,_,IdMed):: (utente(IdU,_,_,_),
                          servico(IdS,_,_,_),
			  medico(IdMed,_,_)).

+turno(IdT,_)::(listaSolucoes(IdT,turno(IdT,_),L),
                         comprimento(L,R),
                         R==1).

 +turno(_,H)::(listaSolucoes(H,turno(_,H),L),
                        comprimento(L,R),
                        R==1).
+escalonamento(D,IdEnf,IdT,I):: (listaSolucoes(IdT,escalonamento(D,IdEnf,IdT,I),L),
                                                    comprimento(L,R),
                                                    R == 1).


+escalonamento(_,IdEnf,IdT,I):: (enfermeiro(IdEnf,_,_),turno(IdT,_), servico(_,_,I,_)).

%----------------------------------------------------------------------------
% Registar utentes,serviços,consultas 
%----------------------------------------------------------------------------
insere(T) :- assert(T).
insere(T) :- retract(T), !,fail.

adiciona(Termo) :-
        listaSolucoes(Inv,+Termo::Inv,S),
        insere(Termo),
        testaInv(S).
%----------------------------------------------------------------------------

% ---------------------------------------------------
% Eliminar utentes,servicos e consultas
% ---------------------------------------------------

remove(T) :- retract(T).
remove(T) :- assert(T),!,fail.

elimina(Termo) :- listaSolucoes(Inv, -Termo :: Inv, S),
                     testaInv(S),
                     remove(Termo).

% ---------------------------------------------------
% Identificar  as  instituições prestadoras de  serviços
% ---------------------------------------------------
% Predicado prestadoras_servicos:
% Resultado -> {V,F}

prestadoras_servicos(R1) :-
    listaSolucoes((Inst,Cidade), servico(_, _, Inst, Cidade), R), semRepetidos(R, R1).

% ---------------------------------------------------
% Identificar consultas realizados por utente
% ---------------------------------------------------
% Predicado consultas_utente:
% Id Utente, Resultado -> {V,F}

consultas_utente(IdUt, R) :-
    listaSolucoes((Data, IdUt, IdServ, Custo, IdMed), (utente(IdUt, _, _, _), consulta(Data, IdUt, IdServ, Custo, IdMed)), R).

% ---------------------------------------------------
% Identificar consultas realizados por instituição
% ---------------------------------------------------
% Predicado consultas_instituicao:
% Instituicao, Resultado -> {V,F}
consultas_instituicao(Instituicao, R) :-
    listaSolucoes((Data, IdUt, IdServ, Custo, IdMed), (consulta(Data, IdUt, IdServ, Custo, IdMed), servico(IdServ, _, Instituicao, _)), R).

% ---------------------------------------------------
% Identificar consultas realizados por cidade
% ---------------------------------------------------
% Predicado consultas_cidade:
% Cidade, Resultado -> {V,F}
consultas_cidade(Cidade, R) :-
    listaSolucoes((Data, IdUt, IdServ, Custo, IdMed), (consulta(Data, IdUt, IdServ, Custo, IdMed), servico(IdServ, _, _, Cidade)), R).

% ---------------------------------------------------
% Identificar consultas realizados por medico
% ---------------------------------------------------
% Predicado consultas_medico:
% Id Medico, Resultado -> {V,F}
consultas_medico(IdMed, R) :-
    listaSolucoes((Data, IdUt, IdServ, Custo, IdMed), (medico(IdMed, _, _), consulta(Data, IdUt, IdServ, Custo, IdMed)), R).

% ---------------------------------------------------
% Identificar consultas realizados por data
% ---------------------------------------------------
% Predicado consulta_data:
% Data, Resultado -> {V,F}
consultas_data(Data,C) :-
listaSolucoes((Data, IdUt, IdServ, Custo, IdMed),consulta(Data,IdUt,IdServ,Custo, IdMed),C).

% ---------------------------------------------------
% Identificar consultas realizados por data
% ---------------------------------------------------
% Predicado consulta_custo:
% Custo, Resultado -> {V,F}
consultas_custo(Custo,C) :-
listaSolucoes((Data, IdUt, IdServ, Custo, IdMed),consulta(Data,IdUt,IdServ,Custo, IdMed),C).

% ---------------------------------------------------
% Identificar utentes (critérios de seleção)
% ---------------------------------------------------

% Predicado utente_idUt:
% Id utente, Lista de Utentes -> {V,F}
utente_idUt(IdUt,U) :- 
	listaSolucoes(utente(IdUt, Nome, Idade, Cidade),utente(IdUt, Nome, Idade, Cidade),U).

% Predicado utente_nome:
% Nome, Lista de Utentes -> {V,F}
utente_nome(Nome,U) :- 
	listaSolucoes(utente(IdUt, Nome, Idade, Cidade),utente(IdUt, Nome, Idade, Cidade),U).

% Predicado utente_Idade:
% Idade, Lista de Utentes -> {V,F}
utente_idade(Idade,U) :- 
	listaSolucoes(utente(IdUt, Nome, Idade, Cidade),utente(IdUt, Nome, Idade, Cidade),U).

% Predicado utente_cidade:
% Morada, Lista de Utentes -> {V,F}
utente_cidade(Cidade,U) :- 
	listaSolucoes(utente(IdUt, Nome, Idade, Cidade),utente(IdUt, Nome, Idade, Cidade),U).


% ---------------------------------------------------
% Identificar serviço (critérios de seleção)
% ---------------------------------------------------

% Predicado servico_idServ:
% Id, Lista de Servico -> {V,F}
servico_idServ(IdServ,S) :- 
	listaSolucoes(servico(IdServ, Descricao, Instituicao, Cidade),servico(IdServ, Descricao, Instituicao, Cidade),S).

% Predicado servico_descricao:
% Descricao, Lista de Servico -> {V,F}
servico_descricao(Descricao,S) :- 
	listaSolucoes(servico(IdServ, Descricao, Instituicao, Cidade),servico(IdServ, Descricao, Instituicao, Cidade),S).

% Predicado servico_instituicao:
% Instituicao, Lista de Servico -> {V,F}
servico_instituicao(Instituicao,S) :- 
	listaSolucoes(servico(IdServ, Descricao, Instituicao, Cidade),servico(IdServ, Descricao, Instituicao, Cidade),S).

% Predicado servico_cidade:
% Cidade, Lista de Servico -> {V,F}
servico_cidade(Cidade,S) :- 
	listaSolucoes(servico(IdServ, Descricao, Instituicao, Cidade),servico(IdServ, Descricao, Instituicao, Cidade),S).

% ---------------------------------------------------
% Identificar consultas (critérios de seleção)
% ---------------------------------------------------

% Predicado consulta_data:
% Data, Lista de Consultas -> {V,F}
consulta_data(Data,C) :- 
	listaSolucoes(consulta(Data, IdUt, IdServ, Custo,IdMed),consulta(Data, IdUt, IdServ, Custo,IdMed),C).

% Predicado consulta_idUt:
% Id utente, Lista de Consultas -> {V,F}
consulta_idUt(IdUt,C) :- 
	listaSolucoes(consulta(Data, IdUt, IdServ, Custo,IdMed),consulta(Data, IdUt, IdServ, Custo,IdMed),C).

% Predicado consulta_IdServ:
% Id servico, Lista de Consultas -> {V,F}
consulta_idServ(IdServ,C) :- 
	listaSolucoes(consulta(Data, IdUt, IdServ, Custo,IdMed),consulta(Data, IdUt, IdServ, Custo,IdMed),C).

% Predicado consulta_custo:
% Custo, Lista de Consultas -> {V,F}
consulta_custo(Custo,C) :- 
	listaSolucoes(consulta(Data, IdUt, IdServ, Custo,IdMed),consulta(Data, IdUt, IdServ, Custo,IdMed),C).

% Predicado consulta_medico:
% Id medico, Lista de Consultas -> {V,F}
consulta_medico(IdMed,C) :-
        listaSolucoes(consulta(Data, IdUt, IdServ, Custo,IdMed),consulta(Data,IdUt,IdServ,Custo,IdMed),C).

% ---------------------------------------------------
% Identificar medicos (critérios de seleção)
% ---------------------------------------------------

% Predicado medico_idMed:
% Id medico, Lista de Medicos -> {V,F}
medico_idMed(IdMed,M) :- 
	listaSolucoes(medico(IdMed, Nome, Idade),medico(IdMed, Nome, Idade),M).

% Predicado medico_nome:
% Nome Medico, Lista de Medicos -> {V,F}
medico_nome(Nome,M) :- 
	listaSolucoes(medico(IdMed, Nome, Idade),medico(IdMed, Nome, Idade),M).

% Predicado medico_idade:
% Idade, Lista de Medicos -> {V,F}
medico_idade(Idade,M) :- 
	listaSolucoes(medico(IdMed, Nome, Idade),medico(IdMed, Nome, Idade),M).

% ---------------------------------------------------
% Identificar enfermeiros (critérios de seleção)
% ---------------------------------------------------

% Predicado enfermeiro_idEnf:
% Id enfermeiro, Lista de Enfermeiro -> {V,F}
enfermeiro_idEnf(IdEnf,M) :- 
	listaSolucoes(enfermeiro(IdEnf, Nome, Idade),enfermeiro(IdEnf, Nome, Idade),M).

% Predicado enfermeiro_nome:
% Nome Medico, Lista de Enfermeiro -> {V,F}
enfermeiro_nome(Nome,M) :- 
	listaSolucoes(enfermeiro(IdEnf, Nome, Idade),enfermeiro(IdEnf, Nome, Idade),M).

% Predicado enfermeiro_idade:
% Idade, Lista de Enfermeiro -> {V,F}
enfermeiro_idade(Idade,M) :- 
	listaSolucoes(enfermeiro(IdEnf, Nome, Idade),enfermeiro(IdEnf, Nome, Idade),M).

% ---------------------------------------------------
% Identificar turno (critérios de seleção)
% ---------------------------------------------------

% Predicado turno_idTurno:
% Id turno, Lista de Turnos -> {V,F}
turno_idTurno(IdTurno,T) :- 
	listaSolucoes(turno(IdTurno, Horas),turno(IdTurno, Horas),T).

% Predicado turno_horas:
% Horas, Lista de Turnos -> {V,F}
turno_horas(Horas,T) :- 
	listaSolucoes(turno(IdTurno, Horas),turno(IdTurno, Horas),T).

% ---------------------------------------------------
% Identificar escalonamento (critérios de seleção)
% ---------------------------------------------------

% Predicado escalonamento_data:
% Data, Lista de Escalonamentos -> {V,F}
escalonamento_data(Data,T) :- 
	listaSolucoes(escalonamento(Data, IdEnf, IdTurno, Instituicao),escalonamento(Data, IdEnf, IdTurno, Instituicao),T).

% Predicado escalonamento_IdEnf:
% Id Enfermeiro, Lista de Escalonamentos -> {V,F}
escalonamento_IdEnf(IdEnf,T) :- 
	listaSolucoes(escalonamento(Data, IdEnf, IdTurno, Instituicao),escalonamento(Data, IdEnf, IdTurno, Instituicao),T).

% Predicado escalonamento_idTurno:
% Id turno, Lista de Escalonamentos -> {V,F}
escalonamento_idTurno(IdTurno,T) :- 
	listaSolucoes(escalonamento(Data, IdEnf, IdTurno, Instituicao),escalonamento(Data, IdEnf, IdTurno, Instituicao),T).

% Predicado escalonamento_instituicao:
% Instituicao, Lista de Escalonamentos -> {V,F}
escalonamento_instituicao(Instituicao,T) :- 
	listaSolucoes(escalonamento(Data, IdEnf, IdTurno, Instituicao),escalonamento(Data, IdEnf, IdTurno, Instituicao),T).


% --------------------------------------------------------------------------------
% Identificar serviços prestados por instituição/cidade/datas/custo/medico/utente
% --------------------------------------------------------------------------------

% Extensão do predicado servico_Instituicao: Instituição, Resultado -> {V,F}
servico_Instituicao(Instituicao,S) :-
       	listaSolucoes(D,servico(_,D,Instituicao,_),S).
	                

% Extensão do predicado servico_Cidade: Cidade, Resultado -> {V,F}
servico_Cidade(Cidade,S) :-
     	listaSolucoes(D,servico(_,D,_,Cidade),S).

% Extensão do predicado servico_Data: Data, Resultado -> {V,F}
servico_Data(Data,S) :-
	listaSolucoes(D,(consulta(Data,_,IdServ,_,_),servico(IdServ,D,_,_)),L),
	semRepetidos(L,S).
	                                      

% Extensão do predicado servico_Custo: Custo, Resultado -> {V,F}
servico_Custo(Custo,S) :-
	listaSolucoes(D,(consulta(_,_,IdServ,Custo,_),servico(IdServ,D,_,_)),L),
	semRepetidos(L,S).
	                                                     
%Predicado servico_medico:
% Id medico, Lista de Servicos -> {V,F}
servico_Medico(IdM,S) :-
        listaSolucoes(D,(medico(IdM,_,_),consulta(_,_,IdServ,_,IdM),servico(IdServ,D,_,_)),L),
	semRepetidos(L,S).

%Predicado servico_utente:
%%IdUtente, Lista de Servicos ->{V,F}
servico_Utente(IdU,S) :-
	listaSolucoes(D,(utente(IdU,_,_,_),consulta(_,IdU,IdServ,_,_),servico(IdServ,D,_,_)),L),
	semRepetidos(L,S).
                     
 
% -------------------------------------------------------------------
%  Identificar utentes de um serviço/instituição:
% -------------------------------------------------------------------

% Predicado utente_serviço:
% Id servico, Lista de Utentes -> {V,F}
utente_servico(IdS,S) :- listaSolucoes((IdU,N,I,C),(consulta(_,IdU,IdS,_,_),utente(IdU,N,I,C)),L),
						     semRepetidos(L,S).

% Predicado utente_instituicao:
% Instituicao, Lista de Utentes -> {V,F}
utente_instituicao(Instituicao,S) :- listaSolucoes((IdU,N,I,C),(consulta(_,IdU,IdS,_,_),servico(IdS,_,Instituicao,_), utente(IdU,N,I,C)),L),
						  			 semRepetidos(L,S).
						  			 
%------------------------------------------------------------------------------------------
%Servicos que ocorreram entre duas datas
%------------------------------------------------------------------------------------------
%Extensão do predicado servico_entre_Datas: Data1, Data2, Resultado ->{V,F}
servico_entre_Datas(Data1,Data2,S) :-
	listaSolucoes((IdServ,D,I,C),(servico(IdServ,D,I,C),
	                              consulta(DC,_,IdServ,_,_),
				      testa_Data_Consulta(Data1,Data2,DC)),L),
				      semRepetidos(L,S).
%-------------------------------------------------------------------------------

% ---------------------------------------------------
% Custo total dos cuidados de saúde por utente
% ---------------------------------------------------
% Predicado custo_utente:
% Id utente, Custo total -> {V,F}
custo_utente(IdUt, CustoTotal) :-
    listaSolucoes(Custo, consulta(_, IdUt, _, Custo,_), C),
    soma(C, CustoTotal).

% ---------------------------------------------------
% Custo total dos cuidados de saúde por serviço
% ---------------------------------------------------
% Predicado custo_servico:
% Id servico, Custo total -> {V,F}
custo_servico(IdServ, CustoTotal) :-
    listaSolucoes(Custo, consulta(_, _, IdServ, Custo,_), C),
    soma(C, CustoTotal).

% ---------------------------------------------------
% Custo total dos cuidados de saúde por instituição
% ---------------------------------------------------
% Predicado custo_servico:
% Id servico, Custo total -> {V,F}
custo_instituicao(Instituicao, CustoTotal) :-
    listaSolucoes(Custo, (consulta(_, _, IdServ, Custo,_), servico(IdServ,_,Instituicao,_)), C),
    soma(C, CustoTotal).

% ---------------------------------------------------
% Custo total dos cuidados de saúde por data
% ---------------------------------------------------
% Predicado custo_data:
% Data, Custo total -> {V,F}
custo_data(Data, CustoTotal) :-
    listaSolucoes(Custo, consulta(Data, _, _, Custo,_), C),
    soma(C, CustoTotal).

% ---------------------------------------------------
% Pontos extras
% ---------------------------------------------------

% ---------------------------------------------------
% Consultas de um determinado medico numa determinada data
% ---------------------------------------------------
% Predicado consultas_data_nome:
% Data, Nome, Resultado -> {V,F}

consultas_data_nome(Data, Nome, R1) :-
    listaSolucoes((Data, IdUt, IdServ, Custo, IdMed), (medico(IdMed, Nome, _), consulta(Data, IdUt, IdServ, Custo, IdMed)), R), semRepetidos(R, R1).


% ---------------------------------------------------
% Enfermeiros por data
% ---------------------------------------------------
% Predicado enfermeiros_data:
% Data, Resultado -> {V,F}
enfermeiros_data(Data, R) :-
    listaSolucoes((IdEnf, Nome, Idade), (enfermeiro(IdEnf, Nome, Idade), escalonamento(Data, IdEnf, _, _)), R).

% ---------------------------------------------------
% Enfermeiros por instituição
% ---------------------------------------------------
% Predicado enfermeiros_instituicao:
% Instituicao, Resultado -> {V,F}
enfermeiros_instituicao(Instituicao, R) :-
    listaSolucoes((IdEnf, Nome, Idade), (enfermeiro(IdEnf, Nome, Idade), escalonamento(_, IdEnf, _, Instituicao)), R).


% -------------------------------------------------------------------
%  Medicos por Instituicao
% -------------------------------------------------------------------
% Predicado Medico_ instituicao:
% Instituicao, Resultado -> {V,F}
medico_instituicao(Instituicao,S) :-
       	listaSolucoes((IdM,N,I),(servico(IdServ,_,Instituicao,_),consulta(_,_,IdServ,_,IdM),medico(IdM,N,I)),L),
	                                                       semRepetidos(L,S).
                                                   
% -------------------------------------------------------------------
%  Identificar utentes de um medico:
% -------------------------------------------------------------------
% Predicado utente_medico:
% Id medico, Lista de Utentes -> {V,F}
utente_medico(Id,S) :- listaSolucoes((IdU,N,I,C),(consulta(_,IdU,_,_,Id),utente(IdU,N,I,C)),L),
					   semRepetidos(L,S).

% -------------------------------------------------------------------
%  Idade media por servico/instituicao
% -------------------------------------------------------------------
% Predicado media:
% Lista, Media -> {V,F}
media([],0).
media(L,R) :-
    soma(L,X),
    comprimento(L,S),
    R is (div(X,S)).

% Predicado servico_idade_media:
% Id servico, Idade -> {V,F}
servico_idade_media(IdServ,M) :- listaSolucoes(Idade,(consulta(_,IdUt,IdServ,_,_),utente(IdUt,_,Idade,_)),S),
								 semRepetidos(S,R),
    						     media(R,M).

% Predicado instituicao_idade_media:
% Instituicao, Idade -> {V,F}
instituicao_idade_media(Instituicao,M) :- listaSolucoes(Idade,(consulta(_,IdUt,IdServ,_,_),servico(IdServ,_,Instituicao,_), utente(IdUt,_,Idade,_)),S),
    						              semRepetidos(S,R),
    						              media(R,M).

% -------------------------------------------------------------------
%  Preco medio por servico/instituicao
% -------------------------------------------------------------------
% Predicado servico_custo_medio:
% Id servico, Custo medio -> {V,F}
servico_custo_medio(IdServ,M) :- listaSolucoes(Custo,consulta(_,_,IdServ,Custo,_),S),
    						     media(S,M).

% Predicado instituicao_custo_medio:
% Instituicao, Custo medio -> {V,F}
instituicao_custo_medio(Instituicao,M) :- listaSolucoes(Custo,(consulta(_,_,IdServ,Custo,_),servico(IdServ,_,Instituicao,_)),S),
    						              media(S,M).

% -------------------------------------------------------------------
%  Instituicoes por cidade
% -------------------------------------------------------------------
% Predicado instituicao_cidade:
% Cidade, Lista de instiuicoes -> {V,F}
instituicao_cidade(Cidade,L) :- listaSolucoes(Instituicao,servico(_,_,Instituicao,Cidade),S),
    						    semRepetidos(S,L).
