def factorial num
if num<0
puts "you can not calculate factorial of negative no's"
else
 if num ==1 || num==0
	1
 else
  num*factorial(num-1)

end 
end
end

puts factorial -2
 puts factorial 1
 puts factorial 5
 puts factorial 0
