cow(jo).
lion(jem).
tiger(jar).
animal(X):-cow(X);lion(X);tiger(X).
carnivore(X):-lion(X);tiger(X).

test_tiger_animal:-animal(jar).
 
test_cow_and_tiger:-animal(jo),animal(jar).
 
test_lion_carnivore:-animal(jem),carnivore(jem).
 
test_cow_carnivore:-animal(jo),carnivore(jo).
 
list_carnivores:-animal(X),carnivore(X),write(X), nl.

