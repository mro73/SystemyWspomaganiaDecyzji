% Use this editor as a MiniZinc scratch book
int: N = 8;
array[1..N] of var 1..N: rows;

include "alldifferent.mzn";

constraint alldifferent(rows);
constraint alldifferent([rows[i] + i | i in 1..N]);
constraint alldifferent([rows[i] - i | i in 1..N]);

solve satisfy;

output [if j == fix(rows[i]) then "H" else "." endif ++ 
        if j == N then "\n" else " " endif | i in 1..N, j in 1..N];
