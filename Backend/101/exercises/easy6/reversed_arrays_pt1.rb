def reverse!(array)
  new_array = []
  array.length.times do
    new_array << array.pop
  end
  new_array
end

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

puts reverse!([1, 2, 3, 4, 5])
