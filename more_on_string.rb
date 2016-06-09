name= 'Ms. Shreya'
arr= name[2]
puts arr

puts "V".ord
puts 86.chr

#another program
str= "Hi, my name is Shreya"
puts str[15, 6]
puts str[3..21]

def is_jpg? filename
filename.downcase[-4..-1]== '.jpg'
end

puts is_jpg? ('shreya.avi')
puts is_jpg? ('file.jpg') 