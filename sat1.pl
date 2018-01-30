sat(P,Cardapio) :- atom(P), cardapio(Cardapio, P).
sat(e(X,Y), Cardapio) :- sat(X, Cardapio), sat(Y, Cardapio).
sat(ou(X,Y), Cardapio) :- sat(X, Cardapio).
sat(ou(X,Y), Cardapio) :- sat(Y, Cardapio).
% ; sat(Y, Cardapio).
sat(nao(X), Cardapio) :- not(sat(X, Cardapio)).
sat(implica(X,Y), Cardapio) :- not(sat(X, Cardapio)) ; sat(Y, Cardapio).


cardapio(w1, fish).
cardapio(w1, white).
cardapio(w1, icecream).

cardapio(w0, fish).
cardapio(w0, white).
cardapio(w0, cake).

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
