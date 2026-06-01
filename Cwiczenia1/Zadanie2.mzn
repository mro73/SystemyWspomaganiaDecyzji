enum POSILEK = { Owoce, Frytki, Salatka, Skrzydelka, Paluszki, Zestaw_probny };

array[POSILEK] of int: ceny = [215, 275, 335, 355, 420, 580];

int: budzet = 1505;

int: max_porcji = budzet div min(ceny);
array[POSILEK] of var 0..max_porcji: zamowienie;

constraint 
    sum(p in POSILEK) (zamowienie[p] * ceny[p]) == budzet;

solve satisfy;

output [ "\(p): \(zamowienie[p])\n" | p in POSILEK ] ++
       ["------------------\n",
        "Suma kosztów: ", show(budzet), "\n"];