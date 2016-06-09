require 'date'

class Calender
	
	def  input_date
		puts "Enter the date in format dd mm(jan format) yr: "
		enter_date = gets.chomp
		@inpute_date = Date.parse(enter_date)
	end 

	def month_starting
		start_pos = '1 ' + @months[@current_month] + ' ' + @current_year.to_s
		@a = Date.parse(start_pos)
	end

	def no_of_days_in_months
		@days = @days_month[@d.mon.to_i].to_i
	end

	def calender_output
		puts "\t\t\t" + @months[@current_month].upcase 
	  puts "S 	M 	T 	W 	Th 	F 	Sa"
	  i = 1
	  counter = 0
	  while i < (@days  + 1) do
	 	format = 0
	  	while (format <7)
		    until counter == @a.wday 
				  print " " + "\t"
				  format = format + 1
				  counter = counter + 1
			  end 
	    	if (i< @days + 1 )
	    		print i.to_s + "\t"
	    		format = format + 1
				  i = i + 1 
				else
					break
			  end
		  end	 
		  puts ""
	  end
	end

	def previous_next_month
		option = ""
		puts "for going to previous month enter previous and for next month enter next"
		puts "\n enter exit when you are done."
		until option.downcase == "exit" do
			option = gets.chomp
			if option.downcase == "previous"
				@current_month = @current_month - 1
				if (@current_month>1)
					month_starting
				  no_of_days_in_months
				  leap_year
				  calender_output
				else
					break
				end

			else 
			if option.downcase == "next"
				@current_month = @current_month + 1
				if current_month < 12
					month_starting
				  no_of_days_in_months
				  leap_year
				  calender_output
				else
					break
				end
			else
				puts "thank you"
			end
		  end
		end
	end

	def previous_next_year
		option = ""
		puts "for going to previous year enter previous and for next year enter next"
		puts "\n enter exit when you are done."
		until option.downcase == "exit" do
			option = gets.chomp
			if option.downcase == "previous"
				@current_year = @current_year - 1
					if (@current_year>1900 && @current_year<2050)
					month_starting
	        no_of_days_in_months
				  leap_year
				  calender_output
				else
					break
				end

			else 
			if option.downcase == "next"
				@current_month = @current_month + 1
				if (@current_year>1900 && @current_year<2050)
					month_starting
				  no_of_days_in_months
				  leap_year
				  calender_output
				else
					break
				end
			else
				puts "thank you"
			end
		  end
		end
	end
end

show_calender = Calender.new
show_calender.input_date
show_calender.no_of_days_in_months
show_calender.month_starting

show_calender.leap_year
show_calender.calender_output
show_calender.previous_next_year
show_calender.previous_next_month
