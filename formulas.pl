formula(P) :- atom(P).
formula(e(X,Y)) :- formula(X), formula(Y).
formula(ou(X,Y)) :- formula(X) ; formula(Y).
formula(nao(X)) :- not(formula(X)).
formula(implica(X,Y)) :- not(formula(X)) ; formula(Y).
formula(xor(X,Y)) :- e(X,nao(Y)) ; e(nao(X),Y).
formula(xnor(X,Y)) :- e(X,Y) ; e(nao(X),nao(Y)).
