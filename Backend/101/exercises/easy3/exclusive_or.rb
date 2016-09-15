def xor?(first, second)
  if first || second == true
    return false if first && second == true
    true
  else
    false
  end
end

def xor_improved?(first, second)
  return true if first && !second
  return true if second && !first
  false
end

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false

puts xor_improved?(5.even?, 4.even?) == true
puts xor_improved?(5.odd?, 4.odd?) == true
puts xor_improved?(5.odd?, 4.even?) == false
puts xor_improved?(5.even?, 4.odd?) == false