def triangle(num_1, num_2, num_3)
  

  return :equilateral if num_1 == num_2 && num_1 == num_3
  return :isosceles if num_1 || num_2 == 
  return :invalid if num_1 || num_2 || num_3 == 0
  return :scalene 
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid