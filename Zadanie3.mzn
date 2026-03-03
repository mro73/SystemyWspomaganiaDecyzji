enum POSILEK;
array[POSILEK] of int: ceny;
int: budzet;

int: max_porcji = budzet div min(ceny);
array[POSILEK] of var 0..max_porcji: zamowienie;

constraint 
    sum(p in POSILEK) (zamowienie[p] * ceny[p]) == budzet;

solve satisfy;

output [ "\(p): \(zamowienie[p])\n" | p in POSILEK ] ++
       ["------------------\n",
        "Wydany budżet: ", show(budzet), "\n"];