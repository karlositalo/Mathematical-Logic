% modificado em 5 de maio de 2017

% A consulta deste programa deve ser do tipo penalidade(w0,p1,X)  ou penalidade(w6,p1,X)


sat(P,Cardapio) :- atom(P), cardapio(Cardapio, P).
sat(e(X,Y), Cardapio) :- sat(X, Cardapio), sat(Y, Cardapio).
sat(ou(X,Y), Cardapio) :- sat(X, Cardapio).
sat(ou(X,Y), Cardapio) :- sat(Y, Cardapio).
sat(nao(X), Cardapio) :- not(sat(X, Cardapio)).


% NOVA TENTATIVA de fazer recursivo e geral. Deu errado.
penalidadeN(NroCardapio,SomaPenalidadeAnt,SomaPenalidade) :- preferencia(NroPreferencia,_,_), penalidade(NroCardapio,NroPreferencia,Penalidade),
                                           penalidadeN(NroCardapio,SomaPenalidadeAnt,SomaPenalidade), SomaPenalidade is SomaPenalidadeAnt + Penalidade.

penalidadeN(NroCardapio,0,0).

% Esta definição deu certo mas é muito particular. Tem sempre que incluir todas as penalidades nesta regra.
% penalidadeN(NroCardapio,SomaPenalidade) :- penalidade(NroCardapio,p1,Penalidade1), penalidade(NroCardapio,p2,Penalidade2),
%                                           SomaPenalidade is Penalidade1 + Penalidade2.


dof(NroCardapio,X,0) :- atom(X).
dof(NroCardapio,X,1) :- not(atom(X)).
dof(NroCardapio,e(X,Y),D) :- dof(NroCardapio, X, D1), dof(NroCardapio,Y,D2), D is D1+D2.
dof(NroCardapio,ou(X,Y),D) :- dof(NroCardapio, X, D1), dof(NroCardapio,Y,D2), D is min(D1,D2).
dof(NroCardapio,Preferencia,0).
dofN(NroCardapio,NroPreferencia,Peso) :- preferencia(NroPreferencia, Preferencia, Penalidade), cardapio(NroCardapio,Opcao), not(sat(Preferencia,NroCardapio)), dof(NroCardapio,Preferencia,Peso).

penalidade(NroCardapio,NroPreferencia,Penalidade) :- preferencia(NroPreferencia, Preferencia, Penalidade), cardapio(NroCardapio,Y), not(sat(Preferencia,NroCardapio)).
penalidade(NroCardapio,NroPreferencia,0).


preferencia(p1,e(fish,white),10).
preferencia(p2,ou(white,cake),6).


cardapio(w0, fish).
cardapio(w0, white).
cardapio(w0, cake).

cardapio(w1, fish).
cardapio(w1, white).
cardapio(w1, icecream).

cardapio(w2, fish).
cardapio(w2, red).
cardapio(w2, cake).

cardapio(w3, fish).
cardapio(w3, red).
cardapio(w3, icecream).

cardapio(w4, meat).
cardapio(w4, white).
cardapio(w4, cake).

cardapio(w5, meat).
cardapio(w5, white).
cardapio(w5, icecream).

cardapio(w6, meat).
cardapio(w6, red).
cardapio(w6, cake).

cardapio(w7, meat).
cardapio(w7, red).
cardapio(w7, icecream).
