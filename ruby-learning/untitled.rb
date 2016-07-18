class Student
  def initialize(name, email, phone)
    @name = name
    @email = email
    @phone = phone
  end

  def save
    yaml_string = File.read "student_information.yml"
    @loaded_student_information = YAML.load yaml_string

    output =YAML.dump data
    File.write("student_information.yml" , output)
  end
end



class Report
  def initialize(name, physics_mark)
    @name = name
  end

  def save
    yaml_string = File.read "student_information.yml"
    @loaded_student_information = YAML.load yaml_string

    output =YAML.dump data
    File.write("student_information.yml" , output)
  end
end

class Console 
  def self.ask_for_student_details
    puts "Enter name"
    name = gets.chomp

    puts "Enter email"
    email = gets.chomp

    puts "Enter phone"
    phone = gets.chomp

    student = Student.new(name, email, phone)
    student.save    
  end
end

console.ask_for_student_details