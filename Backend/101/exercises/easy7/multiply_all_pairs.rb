def multiply_all_pairs(array1, array2)
  multiples_array = []
  array1.each do |num|
    array2.each do |num2|
      multiples_array << num * num2
    end
  end
  multiples_array.sort
end

def multiply_all_pairs_improved(array1, array2)
  array1.product(array2).map{ |paired| paired.inject(:*) }.sort
end

puts multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

puts multiply_all_pairs_improved([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]