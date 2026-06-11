silnia(0, 1).

silnia(N, Wynik) :-
    N > 0,
    N1 is N - 1,
    silnia(N1, Wynik1),
    Wynik is N * Wynik1.

fib(0, 0).
fib(1, 1).

fib(N, Wynik) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fib(N1, Wynik1),
    fib(N2, Wynik2),
    Wynik is Wynik1 + Wynik2.
