def triangle(num_1, num_2, num_3)
  array_of_sides = [num_1, num_2, num_3].sort
  uniq_length = array_of_sides.uniq.length
  not_valid = array_of_sides[0] + array_of_sides[1] < array_of_sides[2]
  
  return :invalid if not_valid || array_of_sides.include?(0)
  return :equilateral if uniq_length == 1
  return :isosceles if uniq_length == 2
  return :scalene if uniq_length == 3
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid