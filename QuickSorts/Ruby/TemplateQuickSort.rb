# Geneva Smith
# ----------------------------------------------------------------------------
# This program sorts a list of anything using the quicksort algorithm and a
# provided comparision function.
# Tested types: int, float, char, string

class QuickSort
	# Public function: TemplateQuickSort
	# ----------------------------------------------------------------------------
	# A boilerplate for the quicksort algorithm that sorts a list of 
	# anything and uses a provided comparision function.
	def TemplateQuickSort (array=[], compare)
		if array.length < 2
			return array
		else
			array = TemplateQS(array, 0, array.length - 1, compare)
		end
		
		return array
	end

	# Privatefunction: TemplateQS
	# ----------------------------------------------------------------------------
	# The  quicksort algorithm.
	private
	def TemplateQS (array=[], first=0, last=0, compare)
		if first < last
			pivot = TemplatePartition(array, first, last, compare)
			
			TemplateQS(array, first, pivot - 1, compare)
			TemplateQS(array, pivot + 1, last, compare)
		end
		
		return array
	end

	# Privatefunction: TemplatePartition
	# ----------------------------------------------------------------------------
	# Divides an array of integers into two groups based on the 
	# provided comparision function.
	# <left> and <right> track indexes in the array to compare with the <pivot>
	private
	def TemplatePartition (array=[], first=0, last=0, compare)
		left = first
		pivot = first
		right = last
		
		while left != right
			while compare.call(array[pivot], array[right]) && pivot != right
				right = right -1
			end
			
			if pivot != right
				array[pivot], array[right] = array[right], array[pivot]
				pivot = right
			end
			
			while compare.call(array[left], array[pivot]) && pivot != left
				left = left + 1
			end
			
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
	test6 = [3.0, 0.0, 1.0, 8.0, 7.0, 2.0, 5.0, 4.0, 9.0, 6.0];
	test7 = [4.0, 2.0, 7.0, 3.0, 7.0, 1.0];
	test8 = ['d', 'a', 'b', 'i', 'h', 'c', 'f', 'e', 'j', 'g'];
	test9 = [ "cat", "bat", "at", "gnat" ];
	
	ascending = Proc.new { |a, b| a <= b }
	descending = Proc.new { |a, b| a >= b }

	puts "START"
	puts ""
	puts "Integer QuickSort"
	puts ""
	puts "Test 1 Ascending Before: #{test1.inspect}"
	QS.TemplateQuickSort(test1, ascending)
	puts "Test 1 After: #{test1.inspect}"
	puts ""
	puts "Test 2 Descending Before: #{test2.inspect}"
	QS.TemplateQuickSort(test2, descending)
	puts "Test 2 After: #{test2.inspect}"
	puts ""
	puts "Test 3 Ascending Before: #{test3.inspect}"
	QS.TemplateQuickSort(test3, ascending)
	puts "Test 3 After: #{test3.inspect}"
	puts ""
	puts "Test 4 Descending Before: #{test4.inspect}"
	QS.TemplateQuickSort(test4, descending)
	puts "Test 4 After: #{test4.inspect}"
	puts ""
	puts "Test 5 Ascending Before: #{test5.inspect}"
	QS.TemplateQuickSort(test5, ascending)
	puts "Test 5 After: #{test5.inspect}"
	puts ""
	puts ""
	puts "Double/Float QuickSorts"
	puts""
	puts "Test 6 Descending Before: #{test6.inspect}"
	QS.TemplateQuickSort(test6, descending)
	puts "Test 6 After: #{test6.inspect}"
	puts ""
	puts "Test 7 Ascending Before: #{test7.inspect}"
	QS.TemplateQuickSort(test7, ascending)
	puts "Test 7 After: #{test7.inspect}"
	puts ""
	puts ""
	puts "Character QuickSorts"
	puts ""
	puts "Test 8 Descending Before: #{test8.inspect}"
	QS.TemplateQuickSort(test8, descending)
	puts "Test 8 After: #{test8.inspect}"
	puts ""
	puts ""
	puts "String QuickSorts"
	puts ""
	puts "Test 9 Descending Before: #{test9.inspect}"
	QS.TemplateQuickSort(test9, descending)
	puts "Test 9 Descending After: #{test9.inspect}"
	puts ""
	puts "END"
end