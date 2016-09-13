require 'pry'

def rotate_rightmost_digits(number, digit)
  num_array = number.to_s.split(//).map(&:to_i)
  something = num_array.length - digit
  num_array << num_array.delete_at(something)
  num_array.join('').to_i
end

def max_rotation(num)
  length = num.to_s.length
  length.downto(2) do |digit|
    num = rotate_rightmost_digits(num, digit)
  end
  num
end


puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) == 7_321_609_845