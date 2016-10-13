def transpose(array)
  transposed_array = []

  (0..array[0].length).each do |column_index|
    temp_array = []
    (0..array.length - 1).each do |row_index|
      temp_array << array[num][counter]
    end
    transposed_array << temp_array
  end
  transposed_array
end

def transpose_improved(array)
  transposed_array = []
  (0..2).each do |column_index|
    temp_array = (0..2).map { |row_index| array[row_index][column_index] }
    transposed_array << temp_array
  end
  transposed_array
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

p transpose(matrix)
new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]