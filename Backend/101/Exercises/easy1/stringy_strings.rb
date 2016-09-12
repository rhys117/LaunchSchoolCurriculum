def stringy(num)
  string = ''
  if num % 2 == 0
    string = '10' * (num / 2)
  else
    string = '10' * ((num - 1) / 2) + '1'
  end
  string
end

# ls
def stringy(size)
  numbers = []

  size.times do |index|
    number = index.even? ? 1 : 0
    numbers << number
  end
  numbers.join
end


puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'