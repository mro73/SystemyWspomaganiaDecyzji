include "alldifferent.mzn";

int: S = 3;   % rozmiar małego kwadratu
int: N = S * S; % rozmiar dużego kwadratu (planszy 9 x 9)
set of int: PuzzleRange = 1..N; % zakres indeksów planszy od 1 do 9

array[PuzzleRange, PuzzleRange] of 0..N: board = 
[| 5,3,0, 0,7,0, 0,0,0
 | 6,0,0, 1,9,5, 0,0,0
 | 0,9,8, 0,0,0, 0,6,0
 | 8,0,0, 0,6,0, 0,0,3
 | 4,0,0, 8,0,3, 0,0,1
 | 7,0,0, 0,2,0, 0,0,6
 | 0,6,0, 0,0,0, 2,8,0
 | 0,0,0, 4,1,9, 0,0,5
 | 0,0,0, 0,8,0, 0,7,9 |];

array[PuzzleRange, PuzzleRange] of var PuzzleRange: puzzle; 

constraint forall(r, c in PuzzleRange)(
    if board[r,c] > 0 then puzzle[r,c] = board[r,c] else true endif
);

constraint forall(r in PuzzleRange)(
    alldifferent([puzzle[r, c] | c in PuzzleRange])
);

constraint forall(c in PuzzleRange)(
    alldifferent([puzzle[r, c] | r in PuzzleRange])
);

constraint forall(row_block, col_block in 0..S-1)(
    alldifferent([puzzle[row_block * S + r, col_block * S + c] | r, c in 1..S])
);

solve satisfy;

output [
    show(puzzle[r,c]) ++ 
    if c mod S == 0 /\ c != N then " | " else " " endif ++
    if c == N then 
        if r mod S == 0 /\ r != N then "\n---------------------\n" else "\n" endif
    else "" endif
| r, c in PuzzleRange ];