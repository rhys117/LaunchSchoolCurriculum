puts "Do you want to print something? (y/n)"

loop do  
  input = gets.chomp.downcase
  puts "Error! please select either y or n" if input != "y" || input != "n"
  break if input == "y" || input == "n"
end

if input == "y"
  puts "something"
end
   
