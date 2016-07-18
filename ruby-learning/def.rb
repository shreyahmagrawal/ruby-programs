
def ask question 
	while true
		puts question 
		reply = gets.chomp.downcase
		if reply == "shreya"
			puts question
		else
			return 'hi'
		end
		break
	end
end
ask "what is your name?"
a="hi"
return a 