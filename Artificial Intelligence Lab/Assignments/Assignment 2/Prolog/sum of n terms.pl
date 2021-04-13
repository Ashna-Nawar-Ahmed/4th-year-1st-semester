sum1(1,F, F,_):-!.
sum1(N, S,F,I):-N1 is N-1,sum1(N1, S1,F,I), S is S1+F+N1*I.
