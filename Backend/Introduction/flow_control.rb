#Exercise 1
#1. false
#2. false
#3. false
#4. true
#5. true

#Exercise 2
def all_caps(str)
  if str.length > 10 
    str.upcase
  else
    str
  end
end

puts all_caps("Rhys Murray")
puts all_caps("aaa")

#Exercise 3
puts "Please enter a number between 0 and 100"
num = gets.chomp.to_i

if num < 0
  puts "We asked for a number greater than 0!"
elsif num <= 50
  puts "Your number is between 0 and 50"
elsif num <= 100
  puts "Your number is between 51 and 100"
else 
  puts "Your number is over 100..."
end

#Exercise 4 
#1. 'FALSE'
#2. 'Did you get it right'
#3. 'Alright now!'

#Exercise 5
def greater_than(num)
case
when < 0
  puts "We asked for a number greater than 0!"
when <= 50
  puts "Your number is between 0 and 50"
when <= 100 
  puts "Your number is between 51 and 100"
else
  puts "Your number is over 100..."
end

puts "Enter a number betwen 0 and 100"
num = gets.chomp.to_i

greater_than(num)

#Exercise 6
# Did not close the if statement. Add another end between lines 5 and 6.