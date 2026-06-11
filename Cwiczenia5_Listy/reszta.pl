moneta(5).
moneta(2).
moneta(1).

rozmien(0, []).

rozmien(Kwota, [Moneta | ResztaMonet]) :-
    Kwota > 0,
    moneta(Moneta),
    Kwota >= Moneta,
    NowaKwota is Kwota - Moneta,
    rozmien(NowaKwota, ResztaMonet).
