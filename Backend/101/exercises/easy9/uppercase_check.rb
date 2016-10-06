def uppercase?(str)
  lower_case_chars = str.chars.select { |char| char =~ /[a-z]/ }
  return false if lower_case_chars.length > 0
  true
end

def uppercase?(str)
  str == str.upcase
end

puts uppercase?('t') == false
puts uppercase?('T') == true
puts uppercase?('Four Score') == false
puts uppercase?('FOUR SCORE') == true
puts uppercase?('4SCORE!') == true
puts uppercase?('') == true