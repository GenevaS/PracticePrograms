/*
 * Geneva Smith
 * ----------------------------------------------------------------------------
 * This program sorts a list of anything using the quicksort algorithm, a
 * provided comparision function, and a provided partition function that uses
 * the comparision function.
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
	
	writeln("Test 1 Descending, Partition Function A Before:");
	int[] a = test1.dup;
	writeln(a);
	FunctionQuickSort(a, &Descending!(int), &TemplatePartitionA!(int));
	writeln("Test 1 Descending, Partition Function A After:");
	writeln(a);
	writeln();

	writeln("Test 1 Descending, Partition Function B Before:");
	a = test1.dup;
	writeln(a);
	FunctionQuickSort(a, &Descending!(int), &TemplatePartitionB!(int));
	writeln("Test 1 Descending, Partition Function B After:");
	writeln(a);
	writeln();

	writeln("Test 2 Ascending, Partition Function A Before:");
	a = test2.dup;
	writeln(a);
	FunctionQuickSort(a, &Ascending!(int), &TemplatePartitionA!(int));
	writeln("Test 2 Ascending, Partition Function A After:");
	writeln(a);
	writeln();

	writeln("Test 2 Ascending, Partition Function B Before:");
	a = test2.dup;
	writeln(a);
	FunctionQuickSort(a, &Ascending!(int), &TemplatePartitionB!(int));
	writeln("Test 2 Ascending, Partition Function B After:");
	writeln(a);
	writeln();

	writeln("Test 3 Descending, Partition Function A Before:");
	a = test3.dup;
	writeln(a);
	FunctionQuickSort(a, &Descending!(int), &TemplatePartitionA!(int));
	writeln("Test 3 Descending, Partition Function A After:");
	writeln(a);
	writeln();

	writeln("Test 3 Descending, Partition Function B Before:");
	a = test3.dup;
	writeln(a);
	FunctionQuickSort(a, &Descending!(int), &TemplatePartitionB!(int));
	writeln("Test 3 Descending, Partition Function B After:");
	writeln(a);
	writeln();

	writeln("Test 4 Ascending, Partition Function A Before:");
	a = test4.dup;
	writeln(a);
	FunctionQuickSort(a, &Ascending!(int), &TemplatePartitionA!(int));
	writeln("Test 4 Ascending, Partition Function A After:");
	writeln(a);
	writeln();

	writeln("Test 4 Ascending, Partition Function B Before:");
	a = test4.dup;
	writeln(a);
	FunctionQuickSort(a, &Ascending!(int), &TemplatePartitionB!(int));
	writeln("Test 4 Ascending, Partition Function B After:");
	writeln(a);
	writeln();

	writeln("Test 5 Descending, Partition Function A Before:");
	a = test5.dup;
	writeln(a);
	FunctionQuickSort(a, &Descending!(int), &TemplatePartitionA!(int));
	writeln("Test 5 Descending, Partition Function A After:");
	writeln(a);
	writeln();

	writeln("Test 5 Descending, Partition Function B Before:");
	a = test5.dup;
	writeln(a);
	FunctionQuickSort(a, &Descending!(int), &TemplatePartitionB!(int));
	writeln("Test 5 Descending, Partition Function B After:");
	writeln(a);
	writeln();

	writeln("Double arrays");

	writeln("Test 6 Ascending, Partition Function A Before:");
	double[] b = test6.dup;
	writeln(b);
	FunctionQuickSort(b, &Ascending!(double), &TemplatePartitionA!(double));
	writeln("Test 6 Ascending, Partition Function A After:");
	writeln(b);
	writeln();

	writeln("Test 6 Ascending, Partition Function B Before:");
	b = test6.dup;
	writeln(b);
	FunctionQuickSort(b, &Ascending!(double), &TemplatePartitionB!(double));
	writeln("Test 6 Ascending, Partition Function B After:");
	writeln(b);
	writeln();

	writeln("Test 7 Descending, Partition Function A Before:");
	b = test7.dup;
	writeln(b);
	FunctionQuickSort(b, &Descending!(double), &TemplatePartitionA!(double));
	writeln("Test 7 Descending, Partition Function A After:");
	writeln(b);
	writeln();

	writeln("Test 7 Descending, Partition Function B Before:");
	b = test7.dup;
	writeln(b);
	FunctionQuickSort(b, &Descending!(double), &TemplatePartitionB!(double));
	writeln("Test 7 Descending, Partition Function B After:");
	writeln(b);
	writeln();

	writeln("Char arrays");

	writeln("Test 8 Ascending, Partition Function A Before:");
	char[] c = test8.dup;
	writeln(c);
	FunctionQuickSort(c, &Ascending!(char), &TemplatePartitionA!(char));
	writeln("Test 8 Ascending, Partition Function A After:");
	writeln(c);
	writeln();

	writeln("Test 8 Ascending, Partition Function B Before:");
	c = test8.dup;
	writeln(c);
	FunctionQuickSort(c, &Ascending!(char), &TemplatePartitionB!(char));
	writeln("Test 8 Ascending, Partition Function B After:");
	writeln(c);
	writeln();

	writeln("String arrays");

	writeln("Test 9 Ascending, Partition Function A Before:");
	string[] d = test9.dup;
	writeln(d);
	FunctionQuickSort(d, &Ascending!(string), &TemplatePartitionA!(string));
	writeln("Test 9 Ascending, Partition Function A After:");
	writeln(d);
	writeln();

	writeln("Test 9 Ascending, Partition Function B Before:");
	d = test9.dup;
	writeln(d);
	FunctionQuickSort(d, &Ascending!(string), &TemplatePartitionB!(string));
	writeln("Test 8 Ascending, Partition Function B After:");
	writeln(d);
	writeln();

	// Pause to view output
	writeln("Press any key to continue");
	getchar();

    return 0;
}


/*
 * FunctionQuickSort
 * ----------------------------------------------------------------------------
 * A boilerplate for the quicksort algorithm that sorts a list of an arbitrary 
 * type.
 */
T[] FunctionQuickSort(T) (T[] array, bool function(T, T) compare, int function(T[], int, int, bool function(T, T)) partition)
{
	// Base cases
	if (array.length < 2) return array;
	// Recursive function
	else array = TemplateQS(array, 0, (array.length) - 1, compare, partition);

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
T[] TemplateQS(T) (ref T[] array, int first, int last, bool function(T, T) compare, int function(T[], int, int, bool function(T, T)) partition)
{
	int pivot;

	// If the front and end indicators have not met, call quicksort
	if (first < last) 
	{
		pivot = partition(array, first, last, compare);

		// <pivot> is not included in the partitions because it is already in the correct location
		TemplateQS(array, first, pivot - 1, compare, partition);
		TemplateQS(array, pivot + 1, last, compare, partition);
	}

	return array;
}

/*
* TemplatePartitionA
* ----------------------------------------------------------------------------
* Divides an array of an arbitrary type into two groups - values less than or 
* equal to the current pivot and values greater than the current pivot.
* <pivot>, <first> and <last> are integers because they hold array indexes, not 
* array values.
*/
int TemplatePartitionA(T) (T[] array, int first, int last, bool function(T, T) compare)
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
* TemplatePartitionB
* ----------------------------------------------------------------------------
* A different approach for partitioning an array.
* Values are not swapped until both <left> and <right> have been moved to their
* appropriate positions.
*/
int TemplatePartitionB(T) (T[] array, int first, int last, bool function(T, T) compare)
{
	// Indexes of the left, right, and pivot values
	int left = first;
	int pivot = first;
	int right = last;

	while (left < right)
	{
		// Start by scanning from right to left until the right index reaches the
		// pivot or the value at the right index is smaller than the pivot value
		while(compare(array[pivot], array[right]) && (pivot != right)) right--;

		// Scan left to right until the left index reaches the pivot or the value
		// at the left index is larger than the pivot value
		while(compare(array[left], array[pivot]) && (pivot != left)) left++;

		if(left < right)
		{	
			TemplateSwap(array[left], array[right]);
		}
	}

	// <left> and <right> agree on a median
	return right;
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
