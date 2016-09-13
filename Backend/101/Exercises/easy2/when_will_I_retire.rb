puts "What is your age?"
age = gets.chomp.to_i

puts "At what age would you like to retire?"
retire_age = gets.chomp.to_i

current_year = Time.new.year
retire_year = current_year + retire_age - age

puts "It's #{current_year}. You will retire in #{retire_year}."
puts "You have #{retire_year - current_year} years of work to go!"