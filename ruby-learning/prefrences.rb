puts "......Welcome......."
puts "You can state your preferences amongst the following:"



class Consumer_preferences
	def checkbox 
		puts "Enter your name: "
		name = gets.chomp
		preferences = [ "Email", "SMS" , "PN"  , "Call"  ]
 		value = ''
 		@mask = []
		for i in 0..3
			puts "enter your preference(True/False) for " + preferences[i]
			value = gets.chomp
		
			if value.downcase == "true"
				@mask[i] = 1
			else
				@mask[i] = 0
			end	
		end
		puts @mask
	end
	
end

puts "How many consumers do you have? \n"
no = gets.chomp

consumers = [] 
for consumer_id in 1..no.to_i
	consumers[consumer_id] = Consumer_preferences.new
	consumers[consumer_id].checkbox
end
