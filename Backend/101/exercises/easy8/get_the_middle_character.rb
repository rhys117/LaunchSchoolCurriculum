def center_of(str)
  middle = str.length / 2
  return str[middle - 1..middle] if str.length.even?
  str[middle]
end

puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'