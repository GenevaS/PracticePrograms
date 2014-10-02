# Geneva Smith 
# ----------------------------------------------------------------------------
# This program sorts a list of integers using the quicksort algorithm.

class QuickSort
    # Public function: IntegerQuickSort
	# ----------------------------------------------------------------------------
	# A boilerplate for the quicksort algorithm that sorts a list of integers.
	def IntegerQuickSort (array=[])
		if array.length < 2
			return array
		else
			array = IntQS(array, 0, array.length - 1)
		end
		
		return array
	end

	# Privatefunction: IntQS
	# ----------------------------------------------------------------------------
	# The  quicksort algorithm.
	private
	def IntQS (array=[], first=0, last=0)
		if first < last
			pivot = IntegerPartition(array, first, last)
			
			IntQS(array, first, pivot - 1)
			IntQS(array, pivot + 1, last)
		end
		
		return array
	end

	# Privatefunction: IntegerPartition
	# ----------------------------------------------------------------------------
	# Divides an array of integers into two groups - values less than or equal to 
	# the current pivot and values greater than the current pivot.
	# <left> and <right> track indexes in the array to compare with the <pivot>
	private
	def IntegerPartition (array=[], first=0, last=0)
		left = first
		pivot = first
		right = last
		
		while left != right
			# Looking for a value smaller than the pivot
			while array[pivot] <= array[right] && pivot != right
				right = right -1
			end
			
			# Swap values if one is found
			if pivot != right
				array[pivot], array[right] = array[right], array[pivot]
				pivot = right
			end
			
			# Looking for a value larger the the pivot
			while array[left] <= array[pivot] && pivot != left
				left = left + 1
			end
			
			# Swap values if you found one
			if left != pivot
				array[left], array[pivot] = array[pivot], array[left]
				pivot = left
			end
		end
		
		return pivot
	end
end

# MAIN (Test Cases)
if __FILE__ == $0
	QS = QuickSort.new()
	test1 = [];
	test2 = [1];
	test3 = [1, 2, 3];
	test4 = [3, 2, 1];
	test5 = [3, 0, 1, 8, 7, 2, 5, 4, 9, 6];

	puts "Test 1 Before: #{test1.inspect}"
	QS.IntegerQuickSort(test1)
	puts "Test 1 After: #{test1.inspect}"
	puts ""
	puts "Test 2 Before: #{test2.inspect}"
	QS.IntegerQuickSort(test2)
	puts "Test 2 After: #{test2.inspect}"
	puts ""
	puts "Test 3 Before: #{test3.inspect}"
	QS.IntegerQuickSort(test3)
	puts "Test 3 After: #{test3.inspect}"
	puts ""
	puts "Test 4 Before: #{test4.inspect}"
	QS.IntegerQuickSort(test4)
	puts "Test 4 After: #{test4.inspect}"
	puts ""
	puts "Test 5 Before: #{test5.inspect}"
	QS.IntegerQuickSort(test5)
	puts "Test 5 After: #{test5.inspect}"
	puts ""
end