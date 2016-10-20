input = nil

loop do
  puts "How many number of lines of would you like to print? Must be three or more"
  input = gets.chomp.to_i
  break if input >= 3
  puts "Thats not enough lines"
end

while input > 0
  puts "Launch School is the best!"
  input -= 1
end

