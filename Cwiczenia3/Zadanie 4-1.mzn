include "globals.mzn";

int: N = 8; 

array[1..N] of var 1..N: rows;

array[1..N] of var 1..N: cols;

constraint alldifferent(rows);

constraint alldifferent([rows[i] + i | i in 1..N]);

constraint alldifferent([rows[i] - i | i in 1..N]);

constraint inverse(rows, cols);


solve satisfy;

output [
    "Rozwiązanie dla N = ", show(N), "\n\n",
    "Perspektywa kolumn (rows): ", show(rows), "\n",
    "Perspektywa wierszy (cols): ", show(cols), "\n\n",
    "Szachownica:\n"
] ++
[
    if c == 1 then " " else "" endif ++
    if fix(cols[r]) == c then " Q " else " . " endif ++
    if c == N then "\n" else "" endif
    | r in 1..N, c in 1..N
];