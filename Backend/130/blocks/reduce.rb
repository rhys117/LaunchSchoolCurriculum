def reduce(array, default=0)
  counter = 0
  total = default

  while counter < array.size
    total = yield(total, array[counter])
    counter += 1
  end
  total
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }
p reduce(array, 10) { |acc, num| acc + num }