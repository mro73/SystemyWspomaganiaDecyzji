int: len = 5; 
array[1..len] of var 0..len: magic;

constraint 
    forall(i in 1..len)(
        magic[i] == sum(j in 1..len)(bool2int(magic[j] == i - 1))
    );

constraint sum(magic) == len;

solve satisfy;

output ["Magiczna seria dla długości ", show(len), ":\n", show(magic), "\n"];