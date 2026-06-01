include "globals.mzn";

int: N = 8; 

array[1..N] of var 1..N: rows;



constraint alldifferent(rows);

constraint alldifferent([rows[i] + i | i in 1..N]);

constraint alldifferent([rows[i] - i | i in 1..N]);


solve satisfy;

output [
    "Rozwiązanie dla N = ", show(N), "\n\n",
    "Perspektywa kolumn (rows): ", show(rows), "\n\n",
    "Szachownica:\n"
] ++
[
    if c == 1 then " " else "" endif ++
    if fix(rows[c]) == r then " Q " else " . " endif ++
    if c == N then "\n" else "" endif
    | r in 1..N, c in 1..N
];