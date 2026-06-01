include "globals.mzn";

int: items_n;
int: knapsacks_n;
int: capacity;

array[1..items_n] of int: values;
array[1..items_n] of int: weights;

array[1..knapsacks_n, 1..items_n] of var 0..1: taken;

var int: total_value = sum(i in 1..knapsacks_n, j in 1..items_n)(taken[i, j] * values[j]);


constraint forall(j in 1..items_n) (
    sum(i in 1..knapsacks_n)(taken[i, j]) <= 1
);

constraint forall(i in 1..knapsacks_n) (
    sum(j in 1..items_n)(taken[i, j] * weights[j]) <= capacity
);

constraint forall(i in 1..knapsacks_n-1) (
    lex_lesseq([taken[i, j] | j in 1..items_n], [taken[i+1, j] | j in 1..items_n])
);

solve maximize total_value;

output [
    "Maksymalna łączna wartość: ", show(total_value), "\n\n",
    "Rozkład przedmiotów w plecakach (1 = spakowany, 0 = pominięty):\n"
] ++
[
    "Plecak " ++ show(i) ++ ": " ++ show([taken[i,j] | j in 1..items_n]) ++ "\n"
    | i in 1..knapsacks_n
];