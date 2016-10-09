def sum_square_difference(num)
  array = []
  1.upto(num) do |num|
    array << num
  end
  first = array.inject(:+) ** 2
  second = array.map { |num| num ** 2 }.inject(:+)
  first - second
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150