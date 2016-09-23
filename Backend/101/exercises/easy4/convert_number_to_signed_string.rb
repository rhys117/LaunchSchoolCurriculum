INTEGERS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'].freeze

def integer_to_string(num)
  string = ''
  loop do
    string.prepend(INTEGERS[num % 10])
    num = (num / 10).round(0)
    break if num <= 0
  end
  string
end

def signed_integer_to_string(num) 
  if num > 0
    integer_to_string(num).prepend('+')
  elsif num < 0 
    integer_to_string(-num).prepend('-')
  else 
    '0'
  end
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'
