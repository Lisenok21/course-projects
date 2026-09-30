fish_is("himera"):-
it_is("hryachevaya"),
positive("imeet","celnuy golovu"),
positive("imeet","ostrye zubi"),
positive("imeet","krylonidnye plavniki").
fish_is("shark"):-
it_is("hryachevaya"),
positive("imeet","plastozabri"),
positive("imeet","ostrye zubi"),
positive("imeet","horoshi nuh").
fish_is("skat"):-
it_is("hryachevaya"),
positive("imeet","plastozabri"),
positive("imeet","krulya"),
positive("imeet","dlinny hvost").
fish_is("seld"):-
it_is("morskaya"),
positive("imeet","bones"),
positive("imeet","big cheshuya"),
positive("imeet","polosu").
fish_is("losos"):-
it_is("morskaya"),
positive("imeet","bones"),
positive("imeet","ciklovidnaya cheshuya"),
positive("imeet","pyatna").
fish_is("treska"):-
it_is("morskaya"),
positive("imeet","bones"),
positive("imeet","small cheshuyu"),
positive("imeet","usy").
fish_is("karp"):-
it_is("rechnaya"),
rositive("imeet","bones"),
positive("imeet","malo cheshui"). 

it_is("hryachevaya"):- positive("imeet","celnuy golovu"),
positive("imeet","ostrye zubi"),positive("imeet","krylonidnye plavniki").
it_is("hryachevaya"):- positive("imeet","plastozabri"),positive("imeet","ostrye zubi"),positive("imeet","horoshi nuh").
it_is("hryachevaya"):- positive("imeet", "plastozabri"),positive("imeet", "krylya"),positive("imeet","dlinny hvost").
it_is("morskaya"):- positive("imeet","bones"),positive("imeet", "big cheshuya"),positive("imeet","polosu").
it_is("morskaya"):- positive("imeet","bones"),positive("imeet", "ciklovidnaya cheshuya"),positive("imeet","pyatna").
it_is("morskaya"):- positive("imeet","bones"),positive("imeet", "small cheshuyu"),positive("imeet","usy").
it_is("rechnaya"):- positive("imeet","bones"),positive("imeet", "malo cheshui").

it_is("morskaya"):- positive("imeet","bones"),positive("imeet", "ciklovidnaya cheshuya"),positive("imeet","pyatna").


positive(X,Y):- xpositive(X,Y),!.
positive(X,Y):- not(negative(X, Y)),!.

positive(X,Y):- xpositive(X, Y),!.
positive(X,Y):- not(xnegative(X,Y)), ask(X,Y).
negative(X,Y):- xnegative(X,Y),!.
negative(X,Y):- not(xpositive(X,Y)), ask(X, Y).
ask(X,Y):- write(" on "), write(X), write(" "), write(Y), write("?\n"),
read(Reply,"Vopros"),
remember(X,Y,Reply).

clear_facts:-retract(xpositive(_,_)),fail.
clear_facts:-retract(xnegative(_,_)),fail.
clear_facts:-write("\n\n Nazhmite probel, chtoby vyyti iz programmy."),
readchar(_).


run:- fish_is(X),
write(" Vasha fish - "), write(X),nl,nl.

addition(X,Y, [X|Y] ).

remember(X,Y,yes) :- asserta_in(xpositive(X,Y)),fail.
remember(X,Y,no) :- asserta_in(xnegative(X,Y)),fail.
remember(X,Y,why):-addition(X,Y,T),write("Po pravily it fish"), write(T),nl,nl, fail.

remember(X,Y,no) :- asserta_in(xnegative(X,Y)),fail.
run:- write("\nNevozmozhno opredelit "),
write("\nKakoy fish Vy imeete v vidu?"),read(X),
write("\nKakomu klassu on otnositsya?"),read(K),
write("\nKakie svoystva etogo fisha?"),read(S),read(Q),read(W),
asserta_in(fish_is(X):-it_is(K),positive("imeet",S), ("imeet",Q), ("imeet",W)),
positive("imeet",Q), positive("imeet",W)),
asserta_in(it_is(K):-positive("imeet",S), positive("imeet",Q), positive("imeet",W)),clear_facts.
?-run.