

input = nil
loop do  
  puts "Do you want to print something? (y/n)"
  input = gets.chomp.downcase
  break if input == "y" || input == "n"
  puts "Invalid input!"
end

puts "something" if input == "y"