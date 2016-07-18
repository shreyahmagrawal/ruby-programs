def two_times_explicit (&i_am_block)
	return "No block" if i_am_block.nil?
	i_am_block.call
	i_am_block.call
end

puts two_times_explicit
two_times_explicit { puts "Hello" }
