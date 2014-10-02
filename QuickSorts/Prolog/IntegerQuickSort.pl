/*
 * Geneva Smith
 * ----------------------------------------------------------------------------
 * This program sorts a list of integers using the quicksort algorithm.
 */

/*
 * Rule: integerQuickSort
 * Requires: list of integers, variable for the sorted list
 * ----------------------------------------------------------------------------
 * This is a compound rule used to run the quicksort algorithm. The pivot is
 * taken to be the head of the list.
 */
integerQuickSort([Pivot|Array],SortedList) :-
	partition(Array,Pivot,LeftPart,RightPart),
	integerQuickSort(LeftPart,Ls),
	integerQuickSort(RightPart,Rs),
	append(Ls,[Pivot|Rs],SortedList).
integerQuickSort([],[]). %Base case

/*
 * Rule: partition
 * Requires: list of integers, pivot, two variables for storing the
 * resulting partitions
 * ----------------------------------------------------------------------------
 * There are three rules for partition:
 * 1. The head element is less than/equal to the pivot, recursively call
 *    the parition rule with the tail of the list and pivot. When the
 *    recursive call returns, return a list with the head element
 *    appended to the left side partition (Elm|Ls) and a list of the
 *    right side partition (Rs)
 * 2. The head element is greater than/equal to the pivot, recursively
 *    call the partition rule with the tail of the list and the pivot.
 *    When the recursive call returns, return a list with the head
 *    element appended to the right side partition (Elm|Rs) and a list
 *    of the left side partition (Ls) * 3. The array is empty,
 *    return an empty list
 */
partition([Elm|Array], Pivot, [Elm|Ls], Rs) :-
	Elm =< Pivot, partition(Array, Pivot, Ls, Rs).
partition([Elm|Array], Pivot, Ls, [Elm|Rs]) :-
	Pivot =< Elm, partition(Array, Pivot, Ls, Rs).
partition([], Pivot, [], []). % Base case

/*
 * Rule: append
 * Requires: two lists, variable list to store the new list
 * ----------------------------------------------------------------------------
 * This is a rule to define how two lists should be joined.
 */
append([], Ys, Ys). % Base case
append([X|Xs], Ys, [X|Zs]) :-
	append(Xs, Ys, Zs).



/* Test Cases
 * ----------------------------------------------------------------------------
 * <!> added because Prolog thinks that there is an additional
 * choice point, even though it returns only one answer in the
 * interactive prompt
 * Uses the SWI-Prolog Unit Test module
 */

:- begin_tests(integerquicksort).
test(test1):- integerQuickSort([],[]).
test(test2):- integerQuickSort([1],[1]).
test(test3):- integerQuickSort([1,2,3],[1,2,3]).
test(test4):- integerQuickSort([3,2,1],[1,2,3]), !.
test(test5):- integerQuickSort([3,0,1,8,7,2,5,4,9,6],[0,1,2,3,4,5,6,7,8,9]), !.
:-end_tests(integerquicksort).

:-run_tests.
