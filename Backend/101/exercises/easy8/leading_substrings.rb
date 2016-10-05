def substrings_at_start(str)
  new_array = []
  str.chars.each_index do |index|
    new_array << str[0..index]
  end
  new_array
end

puts substrings_at_start('abc') == ['a', 'ab', 'abc']
puts substrings_at_start('a') == ['a']
puts substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']