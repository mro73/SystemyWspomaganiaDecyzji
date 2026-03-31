% Use this editor as a MiniZinc scratch book
% Kolorowanie wierzchołków grafu
int: n = 5; % liczba wierzchołków
int: m = 6; % liczba krawędzi

array[1..m, 1..2] of int: edges = 
[| 1, 2
 | 1, 5
 | 2, 3
 | 3, 4
 | 4, 5
 | 5, 3 |];

array[1..n] of var 1..n: nodes;
var 1..n: colorsNumber = max(nodes);

constraint forall(i in 1..m)(
    nodes[edges[i, 1]] != nodes[edges[i, 2]]
);

solve minimize colorsNumber;

output ["Liczba kolorów: ", show(colorsNumber), "\nKolory wierzchołków (od 1 do 5): "] ++ 
       [show(nodes[i]) ++ " " | i in 1..n];