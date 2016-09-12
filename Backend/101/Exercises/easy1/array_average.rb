def average(array)
  total = 0
  array.each { |num| total += num }
  total / array.length
end

# ls
def average(array)
  # sum = array.reduce { |sum, number| sum + number }
  sum = array.reduce(:+)
  sum / array.count
end

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40