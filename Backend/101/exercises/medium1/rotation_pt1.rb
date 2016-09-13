def rotate_array(array)
  array << array.shift
  array
end

# ls
def rotate_array(array)
  array[1..-1] + [array[0]]
end


puts rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
puts rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
puts rotate_array(['a']) == ['a']