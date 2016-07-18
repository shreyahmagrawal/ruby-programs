letters ='a'..'c'
puts(['a','b','c']==letters.to_a)
('A'..'Z').each do |letter|
	print letter 
end

puts

my_life= 1994..2016

puts my_life.min
puts my_life.max 
puts my_life.include?(1956)
puts my_life.include?(2010)