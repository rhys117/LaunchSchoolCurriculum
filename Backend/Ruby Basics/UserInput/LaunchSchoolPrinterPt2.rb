loop do
  input = nil
  num_of_lines = nil

  puts "How many number of lines of would you like to print? Must be three or more. Press Q to Quit."
  input = gets.chomp
  break if input == "Q" || input == "q"

  num_of_lines = input.to_i
  if num_of_lines >= 3
  puts "Thats not enough lines"
  end

  while num_of_lines > 0
    puts "Launch School is the best!"
    num_of_lines -= 1
  end
end