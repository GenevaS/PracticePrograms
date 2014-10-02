/*
 * Geneva Smith
 * ----------------------------------------------------------------------------
 * This program sorts a list of any type using the quicksort algorithm
 * and a user-defined comparision rule.
 */

/*
 * Rule: templateQuickSort
 * Requires: list of arbitrary type, comparision rule, variable for the
 * sorted list
 * ---------------------------------------------------------------------------
 * This is a compound rule used to run the quicksort algorithm. The pivot is
 * taken to be the head of the list. Compare is a reference to another
 * rule that is passed to the templateQuickSort rule.
 */
templateQuickSort([Pivot|Array], Compare, SortedList) :-
	templatepartition(Array,Pivot,Compare,LeftPart,RightPart),
	templateQuickSort(LeftPart,Compare,Ls),
	templateQuickSort(RightPart,Compare,Rs),
	templateappend(Ls,[Pivot|Rs],SortedList).
templateQuickSort([],Compare,[]). % Base case

/*
 * Rule: templatepartition
 * Requires: list of arbitrary type, pivot, comparision rule, two
 variables for storing * the resulting partitions * *
 ----------------------------------------------------------------------------
 * There are three rules for partition:
 * 1. The head element and pivot are compared using the Compare rule.
 *    If the result of Compare is true, recursively call the parition
 *    rule with the tail of the list and pivot. When the recursive call
 *    returns, return a list with the head element appended to the left
 *    side partition (Elm|Ls) and a list of the right side
 *    partition (Rs)
 * 2. The pivot and head element are compared using the Compare rule.
 *    If the result of the Compare is true, recursively call the
 *    partition rule with the tail of the list and the pivot. When the
 *    recursive call returns, return a list with the head element
 *    appended to the right side partition (Elm|Rs) and a list
 *    of the left side partition (Ls)
 * 3. The array is empty, return an empty list
 */

templatepartition([Elm|Array], Pivot, Compare, [Elm|Ls], Rs) :-
	Comp=..[Compare,Elm,Pivot],Comp, templatepartition(Array, Pivot, Compare, Ls, Rs).
        % Comp=..[Compare,Elm,Pivot] constructs Compare(Elm,Pivot) and run by calling Comp
templatepartition([Elm|Array], Pivot, Compare, Ls, [Elm|Rs]) :-
	Comp=..[Compare,Pivot,Elm],Comp, templatepartition(Array, Pivot, Compare, Ls, Rs).
templatepartition([], Pivot, Compare, [], []).

/*
 * Rule: templateappend
 * Requires: two lists, variable list to store the new list
 * ----------------------------------------------------------------------------
 * This is a rule to define how two lists should be joined.
 * Renamed to avoid conflicts with the other quicksort modules.
 */

templateappend([], Ys, Ys).
templateappend([X|Xs], Ys, [X|Zs]) :-
	templateappend(Xs, Ys, Zs).

/*
 * Comparision rules for testing
 */

ascend(X,Y) :- X @=< Y.
descend(X,Y) :- X @>= Y.



/* Test Cases
 * ----------------------------------------------------------------------------
 * <!> added because Prolog thinks that there is an additional
 * choice point, even though it returns only one answer in the
 * interactive prompt
 * Uses the SWI-Prolog Unit Test module
 */

:- begin_tests(templatequicksort).
test(test1):- templateQuickSort([],ascend,[]).
test(test2):- templateQuickSort([1],descend,[1]).
test(test3):- templateQuickSort([1,2,3],ascend,[1,2,3]).
test(test4):- templateQuickSort([3,2,1],descend,[3,2,1]), !.
test(test5):- templateQuickSort([3,0,1,8,7,2,5,4,9,6],ascend,[0,1,2,3,4,5,6,7,8,9]), !.
test(test6):- templateQuickSort([3.0,0.0,1.0,8.0,7.0,2.0,5.0,4.0,9.0,6.0],descend,[9.0,8.0,7.0,6.0,5.0,4.0,3.0,2.0,1.0,0.0]), !.
test(test7):- templateQuickSort([4.0,2.0,7.0,3.0,7.0,1.0],ascend,[1.0,2.0,3.0,4.0,7.0,7.0]), !.
test(test8):- templateQuickSort([d,a,b,i,h,c,f,e,j,g],descend,[j,i,h,g,f,e,d,c,b,a]), !.
test(test9):- templateQuickSort(['cat','bat','at','gnat'],ascend,['at','bat','cat','gnat']), !.
:-end_tests(templatequicksort).

:-run_tests.
