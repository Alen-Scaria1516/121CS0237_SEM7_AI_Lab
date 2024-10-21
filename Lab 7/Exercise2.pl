animal(mammal, tiger, carnivore, stripes).
animal(mammal, hyena, carnivore, ugly).
animal(mammal, lion, carnivore, mane).
animal(mammal, zebra, herbivore, stripes).
animal(bird, eagle, carnivore, large).
animal(bird, sparrow, scavenger, small).
animal(reptile, snake, carnivore, long).
animal(reptile, lizard, scavenger, small).

% test_all_mammals:-animal(mammal, X,Y,Z).
% test_mammals_carnivore:-animal(mammal,X,carnivore,_).
% test_mammals_stripes:-animal(mammal,Name,_,stripes).
% test_reptile_with_mane:-animal(reptile,_,_,mane).