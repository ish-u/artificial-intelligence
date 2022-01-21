% facts
% binary relations 
parent(tom, bob).
parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

%  unary relations 
male(tom).
male(bob).
male(jim).
female(pam).
female(liz).
female(pat).
female(ann).
f(1, one).
f(s(1), two).
f(s(s(1)), three).
f(s(s(s(X))), N) :-
    f(X, N).

% rules 
% condition :- conclusion 
offspring(Y, X) :-
    parent(X, Y).
mother(X, Y) :-
    parent(X, Y),
    female(X).
father(X, Y) :-
    parent(X, Y),
    male(X).
grandparent(X, Z) :-
    parent(X, Y),
    parent(Y, Z).  
sister(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    female(X),
    X\=Y.
hasChild(X) :-
    parent(X, _).

%  recursive relation 
predecessor(X, Z) :-
    parent(X, Z).
predecessor(X, Z) :-
    parent(X, Y),
    predecessor(Y, Z).

sum(X, Y) :-
    S is X+Y,
    write("SUM : "),
    write(S).