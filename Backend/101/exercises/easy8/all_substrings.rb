def substrings(str)
  new_array = []
  counter = 1
  str.chars.each_with_index do |_, index|
    loop do
      new_array << str[index, counter]
      counter += 1
      break if counter == str.length + 1
    end
    counter = 1
  end
  new_array.uniq
end

p substrings('abcde')

puts substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
  ]