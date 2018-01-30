mem(X, [X|_]).
mem(X, [_|Y]) :-
   mem(X, Y).

% sel(+Elem, +List, -List)
sel(X, [X|Y], Y).
sel(X, [Y|Z], [Y|T]) :-
   sel(X, Z, T).

% filter(+ListOfList, +Elem, +Elem, -ListOfList)
filter([], _, _, []).
filter([K|F], L, M, [J|G]) :-
   sel(M, K, J), !,
   J \== [],
   filter(F, L, M, G).
filter([K|F], L, M, G) :-
   mem(L, K), !,
   filter(F, L, M, G).
filter([K|F], L, M, [K|G]) :-
   filter(F, L, M, G).

% sat(+ListOfLists, -List)
sat([[L|_]|F], [L|V]):-
   M is -L,
   filter(F, L, M, G),
   sat(G, V).
sat([[L|K]|F], [M|V]):-
   K \== [],
   M is -L,
   filter(F, M, L, G),
   sat([K|G], V).
sat([], []).
