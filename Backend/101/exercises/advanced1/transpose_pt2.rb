def transpose(array)
  transposed_array = []
  (0..array[0].length - 1).each do |column|
    temp_array = (0..array.length - 1).map { |row| array[row][column] }
    transposed_array << temp_array
  end
  transposed_array
end

def transpose_old(array)
  transposed_array = []

  (0..array[0].length - 1).each do |column_index|
    temp_array = []
    (0..array.length - 1).each do |row_index|
      temp_array << array[row_index][column_index]
    end
    transposed_array << temp_array
  end
  transposed_array
end


p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]