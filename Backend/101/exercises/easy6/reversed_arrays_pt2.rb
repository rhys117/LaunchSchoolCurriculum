def reverse(array)
  1.upto(array.length).map { |index| array[-index] }
end

def reverse_2(array)
  reversed = []
  array.reverse_each { |element| reversed << element }
  reversed
end

# arr.reduce([]) { |result, el| result.unshift el }


def reverse_mutate(array)
  left_index = 0
  right_index = -1

  while left_index < array.size / 2
    array[left_index], array[right_index] = array[right_index], array[left_index]
    left_index += 1
    right_index -= 1
  end
  array
end
array = [1, 2, 3, 4, 5]

reversed = reverse(array)

puts array
puts reversed
puts array
