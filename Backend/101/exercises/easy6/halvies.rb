def halvsies(array)
  half = array.length / 2
  half += 1 if array.length % 2 == 1
  
  first = array[0, half]
  second = array [half..-1]
  [first, second]
end

def halvies_ls(array)
  first_half = array.slice(0, (array.size / 2.0).ceil)
  second_half = array.slice(first_half.size..-1)
  
  [first_half, second_half]
end

puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
puts halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvsies([5]) == [[5], []]
puts halvsies([]) == [[], []]

puts halvies_ls([1, 2, 3, 4]) == [[1, 2], [3, 4]]
puts halvies_ls([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvies_ls([5]) == [[5], []]
puts halvies_ls([]) == [[], []]
