int: N = 3;
int: max_val = N * N;
int: magic_sum = (N * (N * N + 1)) div 2;

array[1..N] of var 1..max_val: series;

include "alldifferent.mzn";

constraint alldifferent(series);

constraint forall(i in 1..N-1)(
    series[i] < series[i+1]
);

constraint sum(series) == magic_sum;

solve satisfy;

output ["Seria sumująca się do stałej magicznej (\(magic_sum)): ", show(series), "\n"];