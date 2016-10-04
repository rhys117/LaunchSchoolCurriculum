def multiply_list(array1, array2)
  new_array = []
  array1.each_with_index do |num, index|
    new_array << num * array2[index]
  end
  new_array
end

def multiply_list_zip(array1, array2)
  array1.zip(array2).map { |combined_array| combined_array.inject(:*) }
end

puts multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

puts multiply_list_zip([3, 5, 7], [9, 10, 11]) == [27, 50, 77]