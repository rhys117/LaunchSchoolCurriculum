require 'pry'

def rotate_array(array)
  array << array.shift
  array
end

# ls
def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(number, digit)
  num_array = number.to_s.split(//).map(&:to_i)
  something = num_array.length - digit
  num_array << num_array.delete_at(something)
  num_array.join('').to_i
end

# ls
def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

puts rotate_rightmost_digits(735291, 1) == 735291
puts rotate_rightmost_digits(735291, 2) == 735219
puts rotate_rightmost_digits(735291, 3) == 735912
puts rotate_rightmost_digits(735291, 4) == 732915  
puts rotate_rightmost_digits(735291, 5) == 752913
puts rotate_rightmost_digits(735291, 6) == 352917