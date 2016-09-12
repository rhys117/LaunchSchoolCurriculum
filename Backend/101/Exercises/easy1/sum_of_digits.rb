def sum(num)
  num.to_s.split('').map(&:to_i).reduce(:+)
end

#ls
num_to_s.chars.map(&:to_i).reduce(:+)


puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45