filename ='quote.txt'
test_string ='This is being appended to the file'+'In write mode'

File.open filename, 'w' do |a|
a.write test_string
end

read_string = File.read filename
puts(read_string==test_string)
puts read_string