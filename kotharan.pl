% Bhavya Parikh (932 811 918)
% Munisha Parikh (932 981 839)
% Anand Kothari (933 032 430)
% Homework 5

% Here are a bunch of facts describing the Simpson's family tree.
% Don't change them!

% Mod sign used for commenting

female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

male(abe).
male(clancy).
male(herb).
male(homer).
male(bart).

married_(abe,mona).
married_(clancy,jackie).
married_(homer,marge).

married(X,Y) :- married_(X,Y).
married(X,Y) :- married_(Y,X).

parent(abe,herb).
parent(abe,homer).
parent(mona,homer).

parent(clancy,marge).
parent(jackie,marge).
parent(clancy,patty).
parent(jackie,patty).
parent(clancy,selma).
parent(jackie,selma).

parent(homer,bart).
parent(marge,bart).
parent(homer,lisa).
parent(marge,lisa).
parent(homer,maggie).
parent(marge,maggie).

parent(selma,ling).


%%
% Part 1. Family relations
%%

% 1. Define a predicate `child/2` that inverts the parent relationship.
child(X,Y) :- parent(Y,X).

% 2. Define two predicates `isMother/1` and `isFather/1`.
isMother(X) :- parent(X,_) , female(X).              % should be a female and a parent
isFather(x) :- parent(x,_) , male(x).                % should be a male and a parent


% 3. Define a predicate `grandparent/2`.
grandparent(X,Z) :- parent(X,Y), parent(Y,Z).          % same as example lt example given in class


% 4. Define a predicate `sibling/2`. Siblings share at least one parent.
sibling(X,Y) :- parent(P,X), parent(P,Y), X \= Y.      % Shares parent(Z)

% 5. Define two predicates `brother/2` and `sister/2`.
brother(X,Y) :- sibling(X,Y), male(X).                 % Brother should be a male and a sibling which shares parent
sister(X,Y)  :- sibling(X,Y), female(X).

% 6. Define a predicate `siblingInLaw/2`. A sibling-in-law is either married to
%    a sibling or the sibling of a spouse.
siblingInLaw(X,Y) :- married(X,S), sibling(S,Y), X \= Y.  % Using Predefined head - married [Married to a sibling]
siblingInLaw(X,Y) :- sibling(X,S), married(S,Y), X \= Y.   % Sibling of a spouse

% 7. Define two predicates `aunt/2` and `uncle/2`. Your definitions of these
%    predicates should include aunts and uncles by marriage.
% unifier is produced more than once becuase of the definition above
aunt(X,Z)  :- siblingInLaw(X,Y), parent(Y,Z), female(X).
aunt(X,Z)  :- sister(X,Y), parent(Y,Z).
uncle(X,Z) :- siblingInLaw(X,Y), parent(Y,Z), male(X).
uncle(X,Z) :- brother(X,Y), parent(Y,Z).

% 8. Define the predicate `cousin/2`.
cousin(X,Y) :- child(X,P1), sibling(P1,P2), parent(P2,Y).  % P1 & P2 are parents which are siblings therefore the childen X and Y are cousins


% 9. Define the predicate `ancestor/2`.
ancestor(X,Y) :- parent(X,Y).
ancestor(X,Y) :- parent(X,Z), ancestor(Z,Y).

% Extra credit: Define the predicate `related/2`.

% Helper Predicate
descendent(X,Y) :- parent(Y,X).
descendent(X,Y) :- parent(P,X), descendent(P,Y).

related(X,Y) :- child(X,Y).
related(X,Y) :- parent(X,Y).
related(X,Y) :- sibling(X,Y).
related(X,Y) :- descendent(X,Y).
related(X,Y) :- ancestor(X,Y).
related(X,Y) :- descendent(X,A), sibling(A,Y), X \= Y.
related(X,Y) :- ancestor(X,D), sibling(D,Y), X \= Y.
related(X,Y) :- ancestor(X,D), related(D,Y), X \= Y.



%%
% Part 2. Language implementation
%%

% Boolean type
bool(t).
bool(f).

% 1. Define the predicate `cmd/3`, which describes the effect of executing a
%    command on the stack.
cmd(C,S1,S2)                  :- number(C), S2 = [C|S1].
cmd(C,S1,S2)                  :- string(C), S2 = [C|S1].
cmd(C,S1,S2)                  :- bool(C), S2 = [C|S1].
cmd(add,[First,Second|S1],S2) :- S2 = [Result|S1], Result is First + Second.
cmd(lte,[First,Second|S1],S2) :- S2 = [t|S1], First =< Second.
cmd(lte,[First,Second|S1],S2) :- S2 = [t|S1], First =< Second.
cmd(lte,[_,_|S1],S2)          :- S2 = [f|S1].
cmd(if(P1,_),[t|S1],S2)       :- prog(P1,S1,S2).
cmd(if(_,P2),[f|S1],S2)       :- prog(P2,S1,S2).


% 2. Define the predicate `prog/3`, which describes the effect of executing a
%    program on the stack.
prog([Cmd],S1,S2)      :- cmd(Cmd,S1,S2).
prog([Cmd|Cmds],S1,S3) :- cmd(Cmd,S1,S2), prog(Cmds,S2,S3).
