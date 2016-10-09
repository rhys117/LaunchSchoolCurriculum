def featured(num) 
  num += 1 until num.odd? && num & 7 == 0

  loop do
    
    return num if num.chars.to_s.split('').uniq == num.to_s.split('')
    num += 14
    break if num >= 987543210
  end
  'There is no number that fulfills the requirements.'
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