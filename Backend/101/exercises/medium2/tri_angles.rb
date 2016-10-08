def triangle(num_1, num_2, num_3)
  array_of_angles = [num_1, num_2, num_3]

  not_valid = array_of_angles.inject(:+) != 180
  return :invalid if not_valid || array_of_angles.include?(0)
  return :right if array_of_angles.include?(90)
  return :acute  if array_of_angles.select { |angle| angle < 90 }.length == 3
  return :obtuse if array_of_angles.any? { |angle| angle > 90 }
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid