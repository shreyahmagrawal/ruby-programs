begin

	File.foreach('do_not_exist.txt' ) do |line|
		puts line.chomp
	end

rescue Exception  => e
	puts e.message
	puts "Lets pretend this is did not happen..."
end