# Geneva Smith
# ----------------------------------------------------------------------------
# This program sorts a list of anything using the quicksort algorithm, a
# provided comparision function, and a provided partition function. If
# functions are not provided, defaults are used.
# Tested types: int, float, char, string

class QuickSort
	# Public function: FunctionQuickSort
	# ----------------------------------------------------------------------------
	# A boilerplate for the quicksort algorithm that sorts a list of 
	# anything and uses a provided partition and comparision function.
	def FuntionQuickSort (array=[], compare=Proc.new { |a, b| a <= b }, partition=nil)
		if array.length < 2
			return array
		else
			array = FuntionQS(array, 0, array.length - 1, compare, partition)
		end
		
		return array
	end

	# Privatefunction: FunctionQS
	# ----------------------------------------------------------------------------
	# The  quicksort algorithm.
	private
	def FuntionQS (array=[], first=0, last=0, compare, partition)
		if first < last
			if partition == nil
				pivot = FuntionPartition(array, first, last, compare)
			else
				pivot = partition.call(array, first, last, compare)
			end
			
			FuntionQS(array, first, pivot - 1, compare, partition)
			FuntionQS(array, pivot + 1, last, compare, partition)
		end
		
		return array
	end

	# Privatefunction: TemplatePartition
	# ----------------------------------------------------------------------------
	# This function is used if a paritition function is not provided.
	# Divides an array of integers into two groups based on the 
	# provided comparision function.
	# <left> and <right> track indexes in the array to compare with the <pivot>
	private
	def FuntionPartition (array=[], first=0, last=0, compare)
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
	customPartition = Proc.new { | array, first, last, compare |
		left = first
		pivot = first
		right = last
		
		while left < right
			while compare.call(array[pivot], array[right]) && pivot != right
				right = right -1
			end
			
			while compare.call(array[left], array[pivot]) && pivot != left
				left = left + 1
			end
			
			if left < right
				array[left], array[right] = array[right], array[left]
			end
		end
		
		right = right	#Forces Proc to return the value of <right>
	}

	puts "START"
	puts ""
	puts "Integer QuickSorts"
	puts ""
	
	a = test1.dup
	puts "Test 1 Ascending, Default Before: #{a.inspect}"
	QS.FuntionQuickSort(a, ascending)
	puts "Test 1 Ascending, Default After: #{a.inspect}"
	puts ""
	
	b = test1.dup
	puts "Test 1 Ascending, Custom Before: #{b.inspect}"
	QS.FuntionQuickSort(b, ascending, customPartition)
	puts "Test 1 Ascending, Custom After: #{b.inspect}"
	puts ""
	
	a = test2.dup
	puts "Test 2 Descending, Default Before: #{a.inspect}"
	QS.FuntionQuickSort(a, descending)
	puts "Test 2 Descending, Default After: #{a.inspect}"
	puts ""
	
	b = test2.dup
	puts "Test 2 Descending, Custom Before: #{b.inspect}"
	QS.FuntionQuickSort(b, descending, customPartition)
	puts "Test 2 Descending, Custom After: #{b.inspect}"
	puts ""
	
	a = test3.dup
	puts "Test 3 Ascending, Default Before: #{a.inspect}"
	QS.FuntionQuickSort(a, ascending)
	puts "Test 3 Ascending, Default After: #{a.inspect}"
	puts ""
	
	b = test3.dup
	puts "Test 3 Ascending, Custom Before: #{b.inspect}"
	QS.FuntionQuickSort(b, ascending, customPartition)
	puts "Test 3 Ascending, Custom After: #{b.inspect}"
	puts ""
	
	a = test4.dup
	puts "Test 4 Descending, Default Before: #{a.inspect}"
	QS.FuntionQuickSort(a, descending)
	puts "Test 4 Descending, Default After: #{a.inspect}"
	puts ""
	
	b = test4.dup
	puts "Test 4 Descending, Custom Before: #{b.inspect}"
	QS.FuntionQuickSort(b, descending, customPartition)
	puts "Test 4 Descending, Custom After: #{b.inspect}"
	puts ""
	
	a = test5.dup
	puts "Test 5 Ascending, Default Before: #{a.inspect}"
	QS.FuntionQuickSort(a, ascending)
	puts "Test 5 Ascending, Default After: #{a.inspect}"
	puts ""
	
	b = test5.dup
	puts "Test 5 Ascending, Custom Before: #{b.inspect}"
	QS.FuntionQuickSort(b, ascending, customPartition)
	puts "Test 5 Ascending, Custom After: #{b.inspect}"
	puts ""
	puts ""
	puts "Double/Float QuickSorts"
	puts""
	
	a = test6.dup
	puts "Test 6 Descending, Default Before: #{a.inspect}"
	QS.FuntionQuickSort(a, descending)
	puts "Test 6 Descending, Default After: #{a.inspect}"
	puts ""
	
	b = test6.dup
	puts "Test 6 Descending, Custom Before: #{b.inspect}"
	QS.FuntionQuickSort(b, descending, customPartition)
	puts "Test 6 Descending, Custom After: #{b.inspect}"
	puts ""
	
	a = test7.dup
	puts "Test 7 Ascending, Default Before: #{a.inspect}"
	QS.FuntionQuickSort(a, ascending)
	puts "Test 7 Ascending, Default After: #{a.inspect}"
	puts ""
	
	b = test7.dup
	puts "Test 7 Ascending, Custom Before: #{b.inspect}"
	QS.FuntionQuickSort(b, ascending, customPartition)
	puts "Test 7 Ascending, Custom After: #{b.inspect}"
	puts ""
	puts ""
	puts "Character QuickSorts"
	puts ""
	
	a = test8.dup
	puts "Test 8 Descending, Default Before: #{a.inspect}"
	QS.FuntionQuickSort(a, descending)
	puts "Test 8 Descending, Default After: #{a.inspect}"
	puts ""
	
	b = test8.dup
	puts "Test 8 Descending, Custom Before: #{b.inspect}"
	QS.FuntionQuickSort(b, descending, customPartition)
	puts "Test 8 Descending, Custom After: #{b.inspect}"
	puts ""
	puts ""
	puts "String QuickSorts"
	puts ""
	
	a = test9.dup
	puts "Test 9 Descending, Default Before: #{a.inspect}"
	QS.FuntionQuickSort(a, descending)
	puts "Test 9 Descending, Default After: #{a.inspect}"
	puts ""
	
	b = test9.dup
	puts "Test 9 Descending, Custom Before: #{b.inspect}"
	QS.FuntionQuickSort(b, descending, customPartition)
	puts "Test 9 Descending, Custom After: #{b.inspect}"
	puts ""
	puts "END"
end