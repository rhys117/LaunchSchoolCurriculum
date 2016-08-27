#method 1
number = 0

until number == 10
  number += 1
  puts number if number.even?
end

#method2
number = 0

until number == 10
  number += 1
  next if number.odd?
  puts number
end