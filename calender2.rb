require 'date'
require 'time'
require 'active_support/all'

class Calender2

	attr_reader :inpute_date

	def take_input
		puts "Enter the date in format dd mm(jan format) yr: "
		@inpute_date = Date.parse(gets.chomp)
	end

	def print_calender
		print_intialis
		print_tabs
		print_first_line
	end

	def next_month
		puts "next for next month"
		request = gets.chomp
    if request == "next"
			@inpute_date = @inpute_date.next_month
			print_calender
		end
	end
	
	def previous_month
		puts "previous for previous month"
		request = gets.chomp
		if request == "previous"
			@inpute_date = @inpute_date.last_month
			print_calender
		end
	end		

	private

	def print_intialis
		puts @inpute_date.strftime("%b").center(50)

		puts "S\tM\tT\tW\tTh\tF\tSa"
	end

	def  print_tabs
			@tab_count	= @inpute_date.beginning_of_month.wday 
			print "\t"*@tab_count
	end

	def  print_first_line
		
		@day = 1
		(7 - @tab_count).times do
				print @day.to_s+"\t"
				@day = @day + 1
		end
		puts ""
		print_days_after_first_line(@day)
	end

	def print_days_after_first_line (day)
		while @day < (Time.days_in_month(@inpute_date.mon, @inpute_date.year) + 1)
			7.times do
				if @day < (Time.days_in_month(@inpute_date.mon, @inpute_date.year)+1)
					print @day.to_s+"\t"
					@day = @day + 1
				else
					break
				end
			end	
			puts ""
		end	
	end

	

end



calender = Calender2.new
calender.take_input
calender.print_calender
calender.next_month
calender.previous_month
