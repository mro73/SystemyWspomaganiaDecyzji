var 0..10: owoce;
var 0..10: frytki;
var 0..10: salatka;
var 0..10: skrzydelka;
var 0..10: paluszki;
var 0..10: zestaw_probny;

constraint 
    215 * owoce + 
    275 * frytki + 
    335 * salatka + 
    355 * skrzydelka + 
    420 * paluszki + 
    580 * zestaw_probny == 1505;
    
solve satisfy;

output [
    "Suma kosztów: 1505\n",
    "------------------\n",
    "Owoce: ", show(owoce), "\n",
    "Frytki: ", show(frytki), "\n",
    "Sałatka: ", show(salatka), "\n",
    "Skrzydełka: ", show(skrzydelka), "\n",
    "Paluszki: ", show(paluszki), "\n",
    "Zestaw próbny: ", show(zestaw_probny), "\n"
];