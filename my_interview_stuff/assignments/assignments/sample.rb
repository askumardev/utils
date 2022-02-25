# arr = [1,2,3,4,5,6,7,8,9,10]
# input_array =Array.new([1,2,3,4,5,6,7,8,9,10])



class Array
	
	# def initialize(arr) 
	# 	@arr=arr
	# end

	def filter_even
		select{|x| x%2==0}
	end
	def multiply_ten
		map{|x| x*10}
	end
end

input_array =Array.new([1,2,3,4,5,6,7,8,9,10])
puts input_array.filter_even.multiply_ten

# def filter_even(array)
# 	new = []
# 	new << array.select{|x| puts x if x%2==0}
# 	puts new

	

# 	output = input_array.filter_even().multiply_ten()


# end


#even(arr)

