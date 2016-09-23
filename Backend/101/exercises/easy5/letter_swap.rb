def swap(str)
  swapped = []
  str.split.each do |word| 
    chars = word.chars
    chars.unshift(chars.pop)
    chars << chars.delete_at(1)
    swapped << chars.join
  end
  swapped.join(' ')
end

# ls
def swap_2(str)
  swapped = []
  str.split.map do |word|
  word[0], word[-1] = word[-1], word[0]
  swapped << word
  end
  swapped.join(' ')
end

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'

puts swap_2('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap_2('Abcde') == 'ebcdA'
puts swap_2('a') == 'a'
