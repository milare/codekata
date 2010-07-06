class KarateChop


	def KarateChop.chop(value, array)
		recursive_binary_search(array, value, 0, array.size)
	end
	
	

	private
	
		def KarateChop.recursive_binary_search(array, value, left_boundary, right_boundary)
	
			middle = left_boundary + ((right_boundary - left_boundary) / 2)

			if right_boundary < left_boundary or array.size == 0 or !array[middle]
			  return -1
			end
			
			if array[middle] == value
			  return middle		  
			end
			
			if array[middle] > value
			  return recursive_binary_search(array, value, left_boundary, middle-1)
			else
			  return recursive_binary_search(array, value, middle+1, right_boundary)			
			end
			
		end
		
end

