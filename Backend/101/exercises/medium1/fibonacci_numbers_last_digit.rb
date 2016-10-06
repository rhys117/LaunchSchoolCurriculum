def fibonacci_last(num)
  return 1 if num <= 2
  first, last = [1, 1]
  (3..num).each do
    first, last = [last, first + last]    
  end
  last.to_s.chars.last.to_i
end

def fast_last_digit(num)
  array_of_last_60 = 0.upto(60).map { |n| fibonacci_last(n) }
  num = num % 60 if num > 60
  array_of_last_60[num]
end

# def fibonacci_last(nth)
#   last_2 = [1, 1]
#   3.upto(nth) do
#     last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
#   end

#   last_2.last
# end


# knowing last number repeats every 60
def fast_last_digit(num)
  array_of_last_60 = 0.upto(60).map { |n| fibonacci_last(n) }
  num = num % 60 if num > 60
  array_of_last_60[num]
end

puts fast_last_digit(15)        # -> 0  (the 15th Fibonacci number is 610)
puts fast_last_digit(20)        # -> 5 (the 20th Fibonacci number is 6765)
puts fast_last_digit(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
puts fast_last_digit(100_001)   # -> 1 (this is a 20899 digit number)
puts fast_last_digit(1_000_007) # -> 3 (this is a 208989 digit number)
puts fast_last_digit(123_456_789_987_745) # -> 5