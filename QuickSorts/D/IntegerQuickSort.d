/*
* Geneva Smith
* ----------------------------------------------------------------------------
* This program sorts a list of anything using the quicksort algorithm.
* Compiled using Microsoft Visual Studio Professional 2013
*/

import std.stdio;

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

	writeln("Test 1 Before:");
	writeln(test1);
	IntegerQuickSort(test1);
	writeln("Test 1 After:");
	writeln(test1);
	writeln();

	writeln("Test 2 Before:");
	writeln(test2);
	IntegerQuickSort(test2);
	writeln("Test 2 After:");
	writeln(test2);
	writeln();

	writeln("Test 3 Before:");
	writeln(test3);
	IntegerQuickSort(test3);
	writeln("Test 3 After:");
	writeln(test3);
	writeln();

	writeln("Test 4 Before:");
	writeln(test4);
	IntegerQuickSort(test4);
	writeln("Test 4 After:");
	writeln(test4);
	writeln();

	writeln("Test 5 Before:");
	writeln(test5);
	IntegerQuickSort(test5);
	writeln("Test 5 After:");
	writeln(test5);
	writeln();

	// Pause to view output
	writeln("Press any key to continue");
	getchar();

    return 0;
}


/*
 * IntegerQuickSort
 * ----------------------------------------------------------------------------
 * A boilerplate for the quicksort algorithm that sorts a list of integers.
 */
int[] IntegerQuickSort (int[] array)
{
	// Base cases
	if (array.length < 2) return array;
	// Recursive function
	else array = IntQS(array, 0, (array.length) - 1);

	return array;
}

/*
* IntQS
* ----------------------------------------------------------------------------
* The integer quicksort algorithm. The values of <first> and <last> are used 
* to track the partitions so that only one array is required.
*/
int[] IntQS (int[] array, int first, int last)
{
	int pivot;

	// If the front and end indicators have not met, call quicksort
	if (first < last) 
	{
		pivot = IntegerPartition(array, first, last);
		
		// <pivot> is not included in the partitions because
		// it is already in the correct location
		IntQS(array, first, pivot - 1);
		IntQS(array, pivot + 1, last);
	}

	return array;
}

/*
* IntegerPartition
* ----------------------------------------------------------------------------
* Divides an array of integers into two groups - values less than or equal to 
* the current pivot and values greater than the current pivot.
*/
int IntegerPartition (int[] array, int first, int last)
{
	// Indexes of the left, right, and pivot values
	int left = first;
	int pivot = first;
	int right = last;

	while (left != right)
	{
		// Start by scanning from right to left until the right index reaches the
		// pivot or the value at the right index is smaller than the pivot value
		while((array[pivot] <= array[right]) && (pivot != right)) right--;

		// If the <pivot> and <right> index are not equal, swap values and assign 
		//pivot to the new index <right>
		if (pivot != right) 
		{
			IntegerSwap(array[pivot], array[right]); 
			pivot = right;
		}
	
		// Scan left to right until the left index reaches the pivot or the value
		// at the left index is larger than the pivot value
		while((array[left] <= array[pivot]) && (pivot != left)) left++;
		if(pivot != left)
		{	
			IntegerSwap(array[pivot], array[left]);
			pivot = left;
		}
	}

	// <left> and <right> agree on a median
	return pivot;
}

/*
* IntegerSwap
* ----------------------------------------------------------------------------
* Swaps the values of two integers that are passed by reference.
*/
void IntegerSwap (ref int a, ref int b)
{
	int temp = a;
	a = b;
	b = temp;

	return;
}
