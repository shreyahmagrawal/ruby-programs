require 'yaml'

class Test_file

	def initialize
		@previous = ''
		@add = ''
		@save = ''
	end

	def load_previous_contents_of_file
		unless File.exists? ("testing.yml")
      File.new("testing.yml", "w+")
    end
    @my_file = YAML::load (File.open('testing.yml'))
  end

  def add_data
  	puts "Enter name"
    name = gets.chomp

    puts "Enter email"
    email = gets.chomp

    puts "Enter phone"
    phone = gets.chomp

    @my_file = { :name => name, :phone_no => phone, :email => email }
  end

  def save
  	load_previous_contents_of_file
  	add_data
  	@save_data = YAML::dump (File.write('testing.yml', @my_file))
	end

end

testing = Test_file.new
testing.save