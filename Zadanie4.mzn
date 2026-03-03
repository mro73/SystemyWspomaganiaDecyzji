enum POSILEK = { Owoce, Frytki, Salatka, Skrzydelka, Paluszki, Zestaw_probny };

array[POSILEK] of int: ceny = [215, 275, 335, 355, 420, 580];
array[POSILEK] of int: yumyum = [0, 0, 1, 1, 2, 3];
int: budzet = 1505;

int: max_porcji = budzet div min(ceny);
array[POSILEK] of var 0..max_porcji: zamowienie;

constraint 
    sum(p in POSILEK) (zamowienie[p] * ceny[p]) == budzet;

var int: calkowita_smakowitosc = sum(p in POSILEK) (zamowienie[p] * yumyum[p]);

solve maximize calkowita_smakowitosc;

output [ "\(p): \(zamowienie[p])\n" | p in POSILEK ] ++
       ["------------------\n",
        "Wydana kwota: ", show(budzet), "\n",
        "Łączny smak (YumYum): ", show(calkowita_smakowitosc), "\n"];