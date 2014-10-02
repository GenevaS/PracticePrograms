/*
 * Geneva Smith
 * ----------------------------------------------------------------------------
 * This program sorts a list of anything using the quicksort algorithm and a
 * provided comparision function.
 * Tested types: int, float, char, string
 * Compiled using Microsoft Visual Studio Professional 2013
*/

import std.stdio;
import std.string;

/*	MAIN	*/
int main(string[] argv)
{
	int i;

	// Test cases
	int[] test1 = [];
	int[] test2 = [1];
	int[] test3 = [1, 2, 3];
	int[] test4 = [3, 2, 1];
	int[] test5 = [3, 0, 1, 8, 7, 2, 5, 4, 9, 6];
	double[] test6 = [3, 0, 1, 8, 7, 2, 5, 4, 9, 6];
	double[] test7 = [4, 2, 7, 3, 7, 1];
	char[] test8 = ['d', 'a', 'b', 'i', 'h', 'c', 'f', 'e', 'j', 'g'];
	string[] test9 = [ "cat", "bat", "at", "gnat" ];

	writeln("Integer arrays");
	
	writeln("Test 1 Descending Before:");
	writeln(test1);
	TemplateQuickSort(test1, &Descending!(int));
	writeln("Test 1 Descending After:");
	writeln(test1);
	writeln();

	writeln("Test 2 Ascending Before:");
	writeln(test2);
	TemplateQuickSort(test2, &Ascending!(int));
	writeln("Test 2 Ascending After:");
	writeln(test2);
	writeln();

	writeln("Test 3 Descending Before:");
	writeln(test3);
	TemplateQuickSort(test3, &Descending!(int));
	writeln("Test 3 Descending After:");
	writeln(test3);
	writeln();

	writeln("Test 4 Ascending Before:");
	writeln(test4);
	TemplateQuickSort(test4, &Ascending!(int));
	writeln("Test 4 Ascending After:");
	writeln(test4);
	writeln();

	writeln("Test 5 Descending Before:");
	writeln(test5);
	TemplateQuickSort(test5, &Descending!(int));
	writeln("Test 5 Descending After:");
	writeln(test5);
	writeln();

	writeln("Double arrays");

	writeln("Test 6 Ascending Before:");
	writeln(test6);
	TemplateQuickSort(test6, &Ascending!(double));
	writeln("Test 6 Ascending After:");
	writeln(test6);
	writeln();

	writeln("Test 7 Descending Before:");
	writeln(test7);
	TemplateQuickSort(test7, &Descending!(double));
	writeln("Test 7 Descending After:");
	writeln(test7);
	writeln();

	writeln("Char arrays");

	writeln("Test 8 Descending Before:");
	writeln(test8);
	TemplateQuickSort(test8, &Descending!(char));
	writeln("Test 8 Descending After:");
	writeln(test8);
	writeln();

	writeln("String arrays");

	writeln("Test 9 Ascending Before:");
	string[] d = test9.dup;
	writeln(d);
	TemplateQuickSort(d, &Ascending!(string));
	writeln("Test 9 Ascending After:");
	writeln(d);
	writeln();

	// Pause to view output
	writeln("Press any key to continue");
	getchar();

    return 0;
}


/*
 * TemplateQuickSort
 * ---------------------------------------------------------------------------
 * A boilerplate for the quicksort algorithm that sorts a list of an arbitrary 
 * type.
 */
T[] TemplateQuickSort(T) (T[] array, bool function(T, T) compare)
{
	// Base cases
	if (array.length < 2) return array;
	// Recursive function
	else array = TemplateQS(array, 0, (array.length) - 1, compare);

	return array;
}

/*
* TemplateQS
* ----------------------------------------------------------------------------
* The arbitrary type quicksort algorithm. The values of <first> and <last> are  
* used to track the partitions so that only one array is required.
* <pivot>, <first> and <last> are integers because they hold array indexes, 
* not array values.
*/
T[] TemplateQS(T) (ref T[] array, int first, int last, bool function(T, T) compare)
{
	int pivot;

	// If the front and end indicators have not met, call quicksort
	if (first < last) 
	{
		pivot = TemplatePartition(array, first, last, compare);

		// <pivot> is not included in the partitions because
		// it is already in the correct location
		TemplateQS(array, first, pivot - 1, compare);
		TemplateQS(array, pivot + 1, last, compare);
	}

	return array;
}

/*
* TemplatePartition
* ----------------------------------------------------------------------------
* Divides an array of an arbitrary type into two groups - values less than or 
* equal to the current pivot and values greater than the current pivot.
* <pivot>, <first> and <last> are integers because they hold array indexes, 
* not array values.
*/
int TemplatePartition(T) (T[] array, int first, int last, bool function(T, T) compare)
{
	// Indexes of the left, right, and pivot values
	int left = first;
	int pivot = first;
	int right = last;

	while (left != right)
	{
		// Start by scanning from right to left until the right index reaches the
		// pivot or the value at the right index is smaller than the pivot value
		while(compare(array[pivot], array[right]) && (pivot != right)) right--;

		// If the <pivot> and <right> index are not equal, swap values and assign 
		//pivot to the new index <right>
		if (pivot != right) 
		{
			TemplateSwap(array[pivot], array[right]); 
			pivot = right;
		}
	
		// Scan left to right until the left index reaches the pivot or the value
		// at the left index is larger than the pivot value
		while(compare(array[left], array[pivot]) && (pivot != left)) left++;
		if(pivot != left)
		{	
			TemplateSwap(array[pivot], array[left]);
			pivot = left;
		}
	}

	// <left> and <right> agree on a median
	return pivot;
}

/*
* TemplateSwap
* ----------------------------------------------------------------------------
* Swaps the values of two values of an arbitrary type that are passed by 
* reference.
*/
void TemplateSwap(T) (ref T a, ref T b)
{
	T temp = a;
	a = b;
	b = temp;

	return;
}

/*
 * Ascending
 * ----------------------------------------------------------------------------
 * This function provides the comparison function required to sort a list in 
 * ascending order.
 */
bool Ascending(T) (T a, T b)
{
	return (a <= b);
}

/*
* Descending
* ----------------------------------------------------------------------------
* This function provides the comparison function required to sort a list in 
* descending order.
*/
bool Descending(T) (T a, T b)
{
	return (a >= b);
}
