STRING_INTEGERS = { '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
                    '6' => 6, '7' => 7, '8' => 8, '9' => 9, '0' => 0 }.freeze

def string_to_integer(str)
  num_array = str.chars.map { |char| STRING_INTEGERS[char] }

  number = 0
  num_array.each { |num| number = 10 * number + num }
  number
end

def string_to_signed_integer(str)
  if str[0] == '-'
    positive_num = string_to_integer(str[1..-1])
    return negative_number = positive_num - positive_num * 2
  elsif str[0] == '+'
    return string_to_integer(str[1..-1])
  else
    string_to_integer(str)
  end
end

# ls

def string_to_signed_integer_improved(str)
  case str[0]
  when '+' then string_to_integer(str[1..-1])
  when '-' then -string_to_integer(str[1..-1])
  else string_to_integer(str)
  end
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100

puts string_to_signed_integer_improved('4321') == 4321
puts string_to_signed_integer_improved('-570') == -570
puts string_to_signed_integer_improved('+100') == 100
