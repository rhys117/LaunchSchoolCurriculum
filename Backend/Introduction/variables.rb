#Exercise 1
puts "What's your name?"
name = gets.chomp
puts "Hello #{name}"

#Exercise 2
puts "How old are you?"
age = gets.chomp.to_i

puts "In 10 years you will be:"
puts age + 10
puts "In 20 years you will be:"
puts age + 20
puts "In 30 years you will be:"
puts age + 30
puts "In 40 years you will be:"
puts age + 40

#Exercise 3
10.times do 
  puts name
end

#Exercise 4
puts "What's your first name?"
first_name = gets.chomp
puts "What's your last name?"
last_name = gets.chomp

full_name = "#{first_name} #{last_name}"
puts full_name

#Exercise 5
#The first is 3. The second program would result in x undefined

#Exercise 6
#Shoes has not be defined in the program (or outside the scope).