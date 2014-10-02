(*
 * Geneva Smith
 * ----------------------------------------------------------------------------
 * This program sorts a list of anything using the quicksort algorithm and a
 * provided comparision function.
 * Tested types: int, float, char, string
 *)

(*
 * Function: print_char_list
 * Arguments: list of chars
 * ----------------------------------------------------------------------------
 * This function takes in a list of chars and pattern matches it with one of 
 * two cases:
 *  Case 1: The list is empty so print an empty string
 *  Case 2: The list is non-empty, so print the  head char and recursively call
 *          this function on the tail.
 *)
let rec print_char_list cList =
	match cList with
	| [] -> print_string ""
	| head :: tail -> print_char head; print_string " "; print_char_list tail
	;;
	
(*
 * Function: templateQuickSort
 * Arguments: list of anything, comparison function
 * ----------------------------------------------------------------------------
 * This function takes in a comparison function and list of anything which is 
 * pattern matched with one of two cases:
 *  Case 1: The list is empty, return empty list
 *  Case 2: The list is non-empty, take the head of the list as the pivot and
 *          filter the rest into two more lists that are less than the pivot
 *          (leftSide) and greater/equal to the pivot (rightSide) using the 
 *          provided comparision function. It then uses the two new lists to
 *          recursively call this function and append it to the pivot.
 * Note: Used the partition function to try it out.
 *)
let rec templateQuickSort intList comp =
	match intList with
	| [] -> []
	| pivot :: tail -> 
		(*let leftSide = List.filter (fun x -> x < pivot) t in
		let rightSide = List.filter (fun x -> x >= pivot) t in*)
		let leftSide, rightSide = List.partition (fun x -> comp x pivot) tail in
		(templateQuickSort leftSide comp) @ [pivot] @ (templateQuickSort rightSide comp)
	;;


(* Test Cases *)
let test1 = [ ];;
let test2 = [ 1; ];;
let test3 = [ 1; 2; 3; ];;
let test4 = [ 3; 2; 1; ];;
let test5 = [ 3; 0; 1; 8; 7; 2; 5; 4; 9; 6; ];;
let test6 = [ 3.0; 0.0; 1.0; 8.0; 7.0; 2.0; 5.0; 4.0; 9.0; 6.0; ];;
let test7 = [ 4.0; 2.0; 7.0; 3.0; 7.0; 1.0; ];;
let test8 = [ 'd'; 'a'; 'b'; 'i'; 'h'; 'c'; 'f'; 'e'; 'j'; 'g'; ];;
let test9 = [ "cat"; "bat"; "at"; "gnat"; ];;

(* Comparision functions *)
let ascend = fun x y ->	x <= y ;;
let descend = fun x y -> x >= y ;;

let test1Result = templateQuickSort test1  ascend ;;
let test2Result = templateQuickSort test2 descend ;;
let test3Result = templateQuickSort test3  ascend ;;
let test4Result = templateQuickSort test4 descend ;;
let test5Result = templateQuickSort test5  ascend ;;
let test6Result = templateQuickSort test6 descend ;;
let test7Result = templateQuickSort test7  ascend ;;
let test8Result = templateQuickSort test8 descend ;;
let test9Result = templateQuickSort test9  ascend ;;

print_endline("\nInteger Lists\n");;

print_string("Test 1 Ascend before: [" ^ String.concat " " (List.map string_of_int test1)); print_endline("]");;
print_string("Test 1 Ascend after: [" ^ String.concat " " (List.map string_of_int test1Result)); print_endline("]\n");;

print_string("Test 2 Descend before: [" ^ String.concat " " (List.map string_of_int test2)); print_endline("]");;
print_string("Test 2 Descend after: [" ^ String.concat " " (List.map string_of_int test2Result)); print_endline("]\n");;

print_string("Test 3 Ascend before: [" ^ String.concat " " (List.map string_of_int test3)); print_endline("]");;
print_string("Test 3 Ascend after: [" ^ String.concat " " (List.map string_of_int test3Result)); print_endline("]\n");;

print_string("Test 4 Descend before: [" ^ String.concat " " (List.map string_of_int test4)); print_endline("]");;
print_string("Test 4 Descend after: [" ^ String.concat " " (List.map string_of_int test4Result)); print_endline("]\n");;

print_string("Test 5 Ascend before: [" ^ String.concat " " (List.map string_of_int test5)); print_endline("]");;
print_string("Test 5 Ascend after: [" ^ String.concat " " (List.map string_of_int test5Result)); print_endline("]\n");;

print_endline("\nFloat Lists\n");;

print_string("Test 6 Descend before: [" ^ String.concat " " (List.map string_of_float test6)); print_endline("]");;
print_string("Test 6 Descend after: [" ^ String.concat " " (List.map string_of_float test6Result)); print_endline("]\n");;

print_string("Test 7 Ascend before: [" ^ String.concat " " (List.map string_of_float test7)); print_endline("]");;
print_string("Test 7 Ascend after: [" ^ String.concat " " (List.map string_of_float test7Result)); print_endline("]\n");;

print_endline("\nChar Lists\n");;

print_string("Test 8 Descend before: [ "); print_char_list test8; print_endline("]");
print_string("Test 8 Descend after: [ "); print_char_list test8Result; print_endline("]\n");;

print_endline("\nString Lists\n");;

print_string("Test 9 Ascend before: [ " ^ String.concat " " test9); print_endline("]");
print_string("Test 9 Ascend after: [ " ^ String.concat " " test9Result); print_endline("]\n");;
