def interleave(array1, array2)
  array1.map { |element| [element, array2[array1.index(element)]] }.flatten
end

puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']