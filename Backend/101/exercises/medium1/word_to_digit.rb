require 'pry'
# lots of possible user input issues with the first mehthod.
def word_to_digit(str)
  string = ''
  array_of_words = str.split(/ |(\.+)/)
  array_of_words.each_with_index do |char, index|
    array_of_words[index] =  case char
                             when 'zero'
                              0
                             when 'one'
                              1
                            when 'two'
                              2
                            when 'three'
                              3
                            when 'four'
                              4
                            when 'five'
                              5
                            when 'six'
                              6
                            when 'seven'
                              7
                            when 'eight'
                              8
                            when 'nine'
                              9
                            else
                              char
                            end
    end
  array_of_words.map do |word|
    word = word.to_s
    string << word + ' '
  end
  string.gsub!(' . ','.')
  string
end

HASH_OF_NUMS = { 'zero' => 0, 'one' => 1, 'two' => 2, 'three' => 3, 'four' => 4, 'five' => 5,
                 'six' => 6, 'seven' => 7, 'eight' => 8, 'nine' => 9 }.freeze

def word_to_digit_improved(str)
  HASH_OF_NUMS.keys.each do |word|
    str.gsub!(/\b#{word}\b/, HASH_OF_NUMS[word].to_s)
  end
  str
end




puts word_to_digit('Please call me at five five five one two three four. Thanks.') \
== 'Please call me at 5 5 5 1 2 3 4. Thanks.'

puts word_to_digit_improved('Please call me at five five five one two three four. Thanks.') \
== 'Please call me at 5 5 5 1 2 3 4. Thanks.'