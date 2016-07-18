require 'yaml'

class TestLoadDump
	def initialize
		@my_file = []
		load_file
	end		

	def load_file
		unless File.exists? ("test.yml")
			File.new("test.yml", "w+")
		end
		@my_file = YAML.load_file "test.yml"
	end

	def save_content_into_file
		puts "name: "
		name = gets.chomp
		puts "email: "
		email = gets.chomp
		puts "phone_no: "
		phone_no = gets.chomp
		@new_data = [name , email , phone_no]

		File.open("test.yml", "r+") do |f|
			f.write(@my_file.to_yaml)
		end
	end

end

ob = TestLoadDump.new
ob.save_content_into_file