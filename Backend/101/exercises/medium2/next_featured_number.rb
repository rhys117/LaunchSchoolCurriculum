def featured(num)
  
  next_num = num + 0
  loop do
    next_num += 1
    no_recurring_digits = next_num.to_s.split('').uniq.length == next_num.to_s.split('').length
    return "not" if next_num.to_s.length > 10
    break if next_num.odd? && next_num % 7 == 0 && no_recurring_digits
  end
  p next_num
end

# must be odd. multiple of 7. no recurring digits.

puts featured(12) == 21
puts featured(20) == 21
puts featured(21) == 35
puts featured(997) == 1029
puts featured(1029) == 1043
puts featured(999_999) == 1_023_547
puts featured(999_999_987) == 1_023_456_987

puts featured(9_999_999_999) 