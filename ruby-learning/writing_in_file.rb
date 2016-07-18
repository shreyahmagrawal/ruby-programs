require 'yaml'
class Student
	def intialize
		@student ={}
	end

	def students_id_name
		File.open( "student_id.yaml", "w" ) do |file|
			puts "enter the no of students you have: "
			#no_of_students = gets.chomp
			gets.chomp.to_i.times do |id|
	    		@student= { id => gets.chomp }
	    		file.puts @student
			end
		end
	end

	def students_marks
		File.open("student_marks.yaml" , "w") do |file|
			file.puts @student
		end
	end
end

school = Student.new
school.students_id_name
school.students_marks



