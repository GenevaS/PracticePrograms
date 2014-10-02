/*
 * Geneva Smith
 * ----------------------------------------------------------------------------
 * This program sorts a list of any type using the quicksort algorithm,
 * a user-defined comparision rule, and a user-defined partition rule.
 */

/*
 * Rule: functionQuickSort
 * Requires: list of arbitrary type, comparision rule, partition
 rule, variable for the * sorted list *
 *---------------------------------------------------------------------------
 * This is a compound rule used to run the quicksort algorithm. The pivot is
 * taken to be the head of the list. Compare and Partition are
 * references to other rules that are passed to the functionQuickSort rule.
 */

functionQuickSort([Pivot|Array], Compare, Partition, SortedList) :-
	Part=..[Partition,Array,Pivot,Compare,LeftPart,RightPart],Part,
	functionQuickSort(LeftPart,Compare,Partition,Ls),
	functionQuickSort(RightPart,Compare,Partition,Rs),
	functionappend(Ls,[Pivot|Rs],SortedList).
functionQuickSort([],Compare,Partition,[]).

/*
 * Rule: functionappend
 * Requires: two lists, variable list to store the new list
 * ----------------------------------------------------------------------------
 * This is a rule to define how two lists should be joined.
 * Renamed to avoid conflicts with the other quicksort modules.
 */

functionappend([], Ys, Ys).
functionappend([X|Xs], Ys, [X|Zs]) :-
	functionappend(Xs, Ys, Zs).

/*
 * Partition rule for testing
 * Renamed to avoid conflicts with other quicksort modules
 */
fpartition([Elm|Array], Pivot, Compare, [Elm|Ls], Rs) :-
	Comp=..[Compare,Elm,Pivot],Comp, fpartition(Array, Pivot, Compare, Ls, Rs).
fpartition([Elm|Array], Pivot, Compare, Ls, [Elm|Rs]) :-
	Comp=..[Compare,Pivot,Elm],Comp, fpartition(Array, Pivot, Compare, Ls, Rs).
fpartition([], Pivot, Compare, [], []).

/*
 * Comparision rules for testing
 * Renamed to avoid conflicts with other quicksort modules
 */
fascend(X,Y) :- X @=< Y.
fdescend(X,Y) :- X @>= Y.

/* Test Cases
 * ----------------------------------------------------------------------------
 * <!> added because Prolog thinks that there is an additional
 * choice point, even though it returns only one answer in the
 * interactive prompt
 * Uses the SWI-Prolog Unit Test module
 */

:- begin_tests(functionquicksort).
test(test1):- functionQuickSort([],fascend,fpartition,[]).
test(test2):- functionQuickSort([1],fdescend,fpartition,[1]).
test(test3):- functionQuickSort([1,2,3],fascend,fpartition,[1,2,3]).
test(test4):- functionQuickSort([3,2,1],fdescend,fpartition,[3,2,1]), !.
test(test5):- functionQuickSort([3,0,1,8,7,2,5,4,9,6],fascend,fpartition,[0,1,2,3,4,5,6,7,8,9]), !.
test(test6):- functionQuickSort([3.0,0.0,1.0,8.0,7.0,2.0,5.0,4.0,9.0,6.0],fdescend,fpartition,[9.0,8.0,7.0,6.0,5.0,4.0,3.0,2.0,1.0,0.0]), !.
test(test7):- functionQuickSort([4.0,2.0,7.0,3.0,7.0,1.0],fascend,fpartition,[1.0,2.0,3.0,4.0,7.0,7.0]), !.
test(test8):- functionQuickSort([d,a,b,i,h,c,f,e,j,g],fdescend,fpartition,[j,i,h,g,f,e,d,c,b,a]), !.
test(test9):- functionQuickSort(['cat','bat','at','gnat'],fascend,fpartition,['at','bat','cat','gnat']), !.
:-end_tests(functionquicksort).

:-run_tests.
