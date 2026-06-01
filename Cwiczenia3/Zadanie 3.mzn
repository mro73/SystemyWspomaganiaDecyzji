int: n = 10; 

set of int: range = 0..n-1;

array[range] of var range: magic;

constraint forall(i in range) (
    magic[i] = sum(j in range)(bool2int(magic[j] == i))
);

constraint sum(magic) = n;

constraint sum([magic[j] * j | j in range]) = n;

solve satisfy;

output ["magic = ", show(magic), "\n"];