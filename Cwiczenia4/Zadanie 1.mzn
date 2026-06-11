include "globals.mzn";

int: N = 16;

array[1..N] of var 1..N: rows;

constraint alldifferent(rows);

constraint alldifferent([rows[i] + i | i in 1..N]);
constraint alldifferent([rows[i] - i | i in 1..N]);

constraint rows[1] = 1;

constraint rows[8] != 8;

solve satisfy;

output [
    "Rozwiązanie dla N = 16:\n\n"
] ++ [
    if fix(rows[c]) == r then " Q " else " . " endif ++
    if c == N then "\n" else "" endif
    | r in 1..N, c in 1..N
];