puts "Please enter an integer greater than 0:"
number = gets.chomp.to_i

puts "Enter 's' to compute the sum, 'p' to compute the product."
sum_or_product = gets.chomp

if sum_or_product == 's'
  sum = (1..number).reduce(:+)
  puts "The sum between 1 and #{number} is #{sum}"
else
  product = (1..number).inject(:*)
  puts "The product between 1 and #{number} is #{product}"
end
