def multiplicative_average(array)
  result = array.inject(:*).to_f
  return format('%.3f', result / array.length)
end

puts multiplicative_average([3, 5]) == "7.500"
puts multiplicative_average([2, 5, 7, 11, 13, 17]) == "28361.667"