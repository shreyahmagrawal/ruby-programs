require "yaml"

class Student
  def initialize(name, email, phone)
    @name = name
    @email = email
    @phone = phone
    @my_file   c 
  end

  def load_file
    unless File.exists? ("test.yml")
      File.new("test.yml", "w+")
    end
    @my_file = YAML::load (File.open('test.yml'))
    @my_file
    @write_into_file =  YAML.dump "test.yml"
  end
end



#class Report
#  1("student_information.yml" , output)
#  end
#end

class Console 
  def self.ask_for_student_details
    puts "Enter name"
    name = gets.chomp

    puts "Enter email"
    email = gets.chomp

    puts "Enter phone"
    phone = gets.chomp

    student = Student.new(name, email, phone)
    student.load_file   
  end
end

Console.ask_for_student_details