delta(A, B, C, D) :-
    D is (B * B) - (4 * A * C).

kwadrat(A, B, C, X) :-
    delta(A, B, C, D),
    D > 0,
    X is (-B + sqrt(D)) / (2 * A).

kwadrat(A, B, C, X) :-
    delta(A, B, C, D),
    D > 0,
    X is (-B - sqrt(D)) / (2 * A).

kwadrat(A, B, C, X) :-
    delta(A, B, C, D),
    D =:= 0,
    X is -B / (2 * A).
