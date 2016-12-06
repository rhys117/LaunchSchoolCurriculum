def zip(first_array, second_array)
  result =[]
  counter = 0
  until result.size == first_array.size
    result << [first_array[counter], second_array[counter]]
    counter += 1
  end
  result
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]