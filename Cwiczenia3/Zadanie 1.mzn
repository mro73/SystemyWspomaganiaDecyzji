int: nodesNumber;
int: minColorsNumber;
array[int] of int: maxClique;
array[1..nodesNumber, 1..nodesNumber] of bool: edges;

array[1..nodesNumber] of var 1..nodesNumber: nodes;

var 1..nodesNumber: colorsNumber;

constraint colorsNumber = max(nodes);

constraint forall(i, j in 1..nodesNumber where i < j /\ edges[i, j]) (
    nodes[i] != nodes[j]
);

constraint forall(i in 1..minColorsNumber) (
    nodes[i] = i
);

solve minimize colorsNumber;

output [
    "Minimalna liczba kolorów: ", show(colorsNumber), "\n",
    "Kolory wierzchołków: ", show(nodes), "\n"
];