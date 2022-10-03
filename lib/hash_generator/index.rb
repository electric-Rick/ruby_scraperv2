module Generator
	
	def generate_hash(arr, columns)
		hash_var = {}		
		columns.each do |columns|
			arr.each do |i|
				hash_var[columns] =  i
			end
		end	
		return hash_var
	end	
end
