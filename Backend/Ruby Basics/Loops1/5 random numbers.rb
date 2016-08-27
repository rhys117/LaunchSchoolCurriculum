#5 RANDOM NUMBERS LESS THAN 100

#method 1
numbers = []
i = 0

while i < 5
  numbers[i] = Random.rand(100)
  i += 1
end

puts 'Method 1'
puts numbers

#method 2

numbers2 = []

while numbers2.size < 5
  numbers2 << rand(100)
end

puts 'Method 2'
puts numbers2