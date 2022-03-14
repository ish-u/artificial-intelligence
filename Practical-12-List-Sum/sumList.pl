% 12. Write a Prolog program to implement sumlist(L, S) so that S is the sum of a given list
% L.
sumist([], 0).
sumist([H|T], S) :-
    sumlist(T, S1),
    write(S1),
    S is H+S1.
