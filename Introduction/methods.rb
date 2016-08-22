#Exercise 1
def greeting(name)
  "Hello #{name!}"
end

puts greeting("Jane")

#Exercise 2
#1. 2
#2. nil
#3. 'Joe'
#4. 'four'
#5. nil

#Exercise 3
def multiply(x,y)
  x * y
end

puts multiply(2,3)

#Exercise 4
#nothing (because the return exits the method before the puts command)

#Exercise 5
def scream(words)
  words = words + "!!!!"
  puts words
end

scream("Yippeee")
#nil

#Exercise 6
#only passed one of two arguements in the method 'calculate_product'