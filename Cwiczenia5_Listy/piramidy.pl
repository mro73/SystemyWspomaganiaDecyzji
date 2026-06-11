cyfra(X) :- between(1, 9, X).

calc(B, C, A) :- A is B + C, cyfra(A).
calc(B, C, A) :- A is abs(B - C), cyfra(A).

row_calc([], [_]).
row_calc([A|As], [B1, B2|Bs]) :-
    calc(B1, B2, A),
    row_calc(As, [B2|Bs]).

all_unique(List) :-
    list_to_set(List, Set),
    length(List, L),
    length(Set, L).

has_duplicate(List) :-
    list_to_set(List, Set),
    length(List, L),
    length(Set, S),
    S < L.

solve_p1(R1, R2, R3, R4, R5, R6) :-
    R1 = [2],
    R2 = [_, _],
    R3 = [_, _, _],
    R4 = [5, _, _, 4],
    R5 = [_, _, 8, _, _],
    R6 = [V61, 1, V63, V64, 6, V66],

    cyfra(V61), cyfra(V63), cyfra(V64), cyfra(V66),
    
    all_unique(R6),
    row_calc(R5, R6), has_duplicate(R5),
    row_calc(R4, R5), has_duplicate(R4),
    row_calc(R3, R4), has_duplicate(R3),
    row_calc(R2, R3), all_unique(R2),
    row_calc(R1, R2).


solve_p2(R1, R2, R3, R4, R5, R6, R7, R8, R9) :-
    R1 = [_],
    R2 = [_, _],
    R3 = [_, 2, _],
    R4 = [7, _, _, 2],
    R5 = [_, _, _, _, _],
    R6 = [_, 5, _, _, 2, _],
    R7 = [5, _, _, 5, _, _, 1],
    R8 = [_, _, 8, _, _, 6, _, _],
    R9 = [6, V92, V93, 5, V95, V96, V97, V98, 7],

    cyfra(V93), calc(V93, 5, 8), 
    
    cyfra(V95), cyfra(V96), calc(V95, V96, 6), 

    cyfra(V92), cyfra(V97), cyfra(V98),
    
    all_unique(R9),
    
    row_calc(R8, R9),
    row_calc(R7, R8),
    row_calc(R6, R7),
    row_calc(R5, R6),
    row_calc(R4, R5),
    row_calc(R3, R4),
    row_calc(R2, R3),
    row_calc(R1, R2).

rozwiaz :-
    write('ROZWIAZANIE PIRAMIDY 1:'), nl,
    solve_p1(A1, A2, A3, A4, A5, A6),
    wypisz([A1, A2, A3, A4, A5, A6]),
    nl,
    write('ROZWIAZANIE PIRAMIDY 2:'), nl,
    solve_p2(B1, B2, B3, B4, B5, B6, B7, B8, B9),
    wypisz([B1, B2, B3, B4, B5, B6, B7, B8, B9]).

wypisz([]).
wypisz([R|Rs]) :-
    write(R), nl,
    wypisz(Rs).
