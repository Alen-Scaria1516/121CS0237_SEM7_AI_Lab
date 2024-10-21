american(colonel_west).
hostile(nono).
missile(m1).
owns(nono, m1).
sold(colonel_west, m1, nono).
 
 
weapon(X) :- missile(X).
crime(Person) :- american(Person), sells(Person, Weapon, Country), weapon(Weapon), hostile(Country).
sells(Person, Weapon, Country) :- sold(Person, Weapon, Country).