predicate cumulative(array[int] of var int: s, array[int] of int: d, array[int] of int: r, var int: b) =      
    let {
        int: max_time = sum(d);
    } in
    forall(t in 0..max_time) (
        sum(i in index_set(s)) (
            bool2int(s[i] <= t /\ t < s[i] + d[i]) * r[i]
        ) <= b
    );