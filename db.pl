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
% conclusion :- condition 
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

% point(X,Y).
% seg(P1,P2).
% vertical(seg(point(X,Y),point(X,Y1))).
% horizontal(seg(point(X1,Y),point(X,Y))).

% LIST

% membership
% member(X, [H|T]) :-
%     (   X is H
%     ;   member(X, T)
%     ).
member(X, [X|_]).
member(X, [_|T]) :-
    member(X, T).

% concatenation
conc([], L, L).
conc([X|L1], L2, [X|L3]) :-
    conc(L1, L2, L3).

% write list
writeList([]).
writeList([H|T]) :-
    write(H),
    write('\n'),
    writeList(T).

% write list reverse
writeListRev([]).
writeListRev([H|T]) :-
    writeListRev(T),
    write(H),
    write('\n').

% sum list
sumList([], 0).
sumList([H|T], S) :-
    sumList(T, S1),
    write(S1),
    S is H+S1.

% reverse list
% reverseList([], _).
% reverseList([H|T], [L]) :-
%     reverseList(T, [L|H]).

% last element
% last(Item,List):-
%     conc(_,[Item],List).
last(X, [_, X]).
last(Item, [_|T]) :-
    last(Item, T).

% add an element to list
% add(X, L, [X|L]).
add(X, L, [L|X]).

% delete an element from list
delete(X, [X], []).
delete(X, [X|L], L).
delete(X, [Y|L], [Y|L1]) :-
    delete(X, L, L1).
% delete(X, [X|_]).
% delete(X, [_|L]) :-
%     delete(X, L),
%     write(L).

% sublist
subList(S, L) :-
    conc(_, L2, L),
    conc(S, _, L2).

% permutation
insert(X, L, L1) :-
    delete(X, L1, L).

permutation([], []).
permutation([X|L], P) :-
    permutation(L, L1),
    insert(X, L1, P).

%length of a list
lengthList([], 0).
lengthList([_|L], Length) :-
    lengthList(L, Length1),
    Length is Length1+1.

% check whether the list is odd or even length
evenLength(L) :-
    lengthList(L, X),
    Y is X mod 2,
    Y==0.
    
oddLength(L) :-
    lengthList(L, X),
    Y is X mod 2,
    Y==1.

% reverse list
% reverseList([H|T], Reverse) :-
%     reverseList(T, Reverse1),
%     insert(H, Reverse1, Reverse).
reverseList([], []).
reverseList([H|T], Reverse) :-
    reverseList(T, Reverse1),
    conc(Reverse1, [H], Reverse).


% pallindrome
pallindrome(L1) :-
    reverseList(L1, L2),
    L1=L2.

% shift
shift([H|T], L2) :-
    conc(T, [H], L2).

% translate
means(0, zero).
means(1, one).
means(2, two).
means(3, three).
means(4, four).
means(5, five).
means(6, six).
means(7, seven).
means(8, eight).
means(9, eight).
translate([], []).
translate([H|T], L) :-
    translate(T, L1),
    means(H, A),
    conc([A], L1, L).



