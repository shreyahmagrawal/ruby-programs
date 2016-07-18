count=0
while (count!=3)
ask = gets.chomp
if (ask==ask.upcase)
	puts "NO, Not since " + (rand(20)+1930).to_s
else
	puts "HUH! Speak up Sonny"
end
end