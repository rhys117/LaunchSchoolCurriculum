STRING_INTEGERS = { '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
                    '6' => 6, '7' => 7, '8' => 8, '9' => 9, '0' => 0 }.freeze

def string_to_integer(str)
  num_array = str.chars.map { |char| STRING_INTEGERS[char] }

  number = 0
  num_array.each { |num| number = 10 * number + num }
  number
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570