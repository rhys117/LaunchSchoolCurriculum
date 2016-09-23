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

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'