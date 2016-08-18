def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

firstnumber = nil
secondnumber = nil

loop do
  puts "Please enter a positive or negative integer..."
  firstnumber = gets.chomp

  puts "Please enter a positive or negative integer..."
  secondnumber = gets.chomp

  if valid_number?(firstnumber) == false || valid_number?(secondnumber) == false
    puts "Invalid Input. Only non-zero integers are allowed"
  end

  break if firstnumber.to_i * secondnumber.to_i < 0

  puts "One number must be positive and the other negative. Please try again"
end

answer = firstnumber.to_i + secondnumber.to_i

puts "#{firstnumber} + #{secondnumber} = #{answer}"