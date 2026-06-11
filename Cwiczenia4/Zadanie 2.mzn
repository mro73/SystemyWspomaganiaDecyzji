include "diffn.mzn";
include "cumulative.mzn";

int: n;

array[1..n] of int: sizes = [i | i in 1..n];

int: max_dim = sum(sizes);

var 1..max_dim: width;
var 1..max_dim: height;
var 1..max_dim*max_dim: area;

array[1..n] of var 0..max_dim: x;
array[1..n] of var 0..max_dim: y;


constraint area = width * height;

constraint forall(i in 1..n)(
    x[i] + sizes[i] <= width /\
    y[i] + sizes[i] <= height
);

constraint diffn(x, y, sizes, sizes);

constraint cumulative(x, sizes, sizes, height);
constraint cumulative(y, sizes, sizes, width);


constraint x[n] = 0;

constraint exists(i in 1..n)(y[i] = 0);

solve minimize area;

output [
    "Powierzchnia najmniejszego kontenera: ", show(area), " (szer. ", show(width), " x wys. ", show(height), ")\n\n",
    "Rozmiary kwadratów: ", show(sizes), "\n",
    "Pozycje osi X (lewy dół): ", show(x), "\n",
    "Pozycje osi Y (lewy dół): ", show(y), "\n"
];