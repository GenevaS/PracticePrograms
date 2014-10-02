(*
 * Geneva Smith 
 * ----------------------------------------------------------------------------
 * This program sorts a list of integers using the quicksort algorithm.
 *)

(*
 * Function: intQuickSort
 * Arguments: list of integers
 * ----------------------------------------------------------------------------
 * This function takes in a list of integers and pattern matches it with one of
 * two cases:
 *  Case 1: The list is empty, return empty list
 *  Case 2: The list is non-empty, take the head of the list as the pivot and
 *          filter the rest into two more lists that are less than the pivot
 *          (leftSide) and greater/equal to the pivot (rightSide). It then
 *          uses the two new lists to recursively call this function and append
 *          it to the pivot.
 *)
let rec intQuickSort intList =
	match intList with
	| [] -> []
	| pivot :: rest ->
		let leftSide = List.filter (fun x -> x < pivot) rest in
		let rightSide = List.filter (fun x -> x >= pivot) rest in
		(intQuickSort leftSide) @ [pivot] @ (intQuickSort rightSide)
;;

(* Test Cases *)
let test1 = [ ];;
let test2 = [ 1; ];;
let test3 = [ 1; 2; 3; ];;
let test4 = [ 3; 2; 1; ];;
let test5 = [ 3; 0; 1; 8; 7; 2; 5; 4; 9; 6; ];;

let test1Result = intQuickSort test1 ;;
let test2Result = intQuickSort test2 ;;
let test3Result = intQuickSort test3 ;;
let test4Result = intQuickSort test4 ;;
let test5Result = intQuickSort test5 ;;

print_string("\nTest 1 before: [" ^ String.concat " " (List.map string_of_int test1)); print_endline("]");;
print_string("Test 1 after: [" ^ String.concat " " (List.map string_of_int test1Result)); print_endline("]\n");;

print_string("Test 2 before: [" ^ String.concat " " (List.map string_of_int test2)); print_endline("]");;
print_string("Test 2 after: [" ^ String.concat " " (List.map string_of_int test2Result)); print_endline("]\n");;

print_string("Test 3 before: [" ^ String.concat " " (List.map string_of_int test3)); print_endline("]");;
print_string("Test 3 after: [" ^ String.concat " " (List.map string_of_int test3Result)); print_endline("]\n");;

print_string("Test 4 before: [" ^ String.concat " " (List.map string_of_int test4)); print_endline("]");;
print_string("Test 4 after: [" ^ String.concat " " (List.map string_of_int test4Result)); print_endline("]\n");;

print_string("Test 5 before: [" ^ String.concat " " (List.map string_of_int test5)); print_endline("]");;
print_string("Test 5 after: [" ^ String.concat " " (List.map string_of_int test5Result)); print_endline("]\n");;
