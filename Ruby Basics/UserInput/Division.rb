def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

numerator = nil
demoninator = nil

loop do 
  puts "Please enter a numerator..."
  numerator = gets.chomp
  break if valid_number?(numerator)
  puts "Invalid. Please enter an integer."
end

loop do
  puts "Please enter a demoninator..."
  demoninator = gets.chomp
  if demoninator == "0"
    puts "Demonitator must be greater than 0."
  else
    break if valid_number?(demoninator)
    puts "Invalid. Please enter an integer."
  end
end

answer = numerator.to_i / demoninator.to_i

puts "#{numerator} / #{demoninator} is #{answer}!"