def substrings_at_start(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end

def substrings(str)
  substrings = []
  (0..str.size - 1).each do |index|
    substr = str[index..-1]
    substrings.concat(substrings_at_start(substr))
  end
  substrings
end

def palindromes(str)
  palindromes = []
  substrings_array = substrings(str)
  substrings_array.each do |substr|
    palindromes << substr if substr == substr.reverse && substr.size > 1
  end
  palindromes
end

puts palindromes('abcd') == []
puts palindromes('madam') == ['madam', 'ada']
puts palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
puts palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
