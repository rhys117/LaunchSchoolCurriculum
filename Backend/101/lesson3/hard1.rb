# Question 1
# greeting is nil

# Question 2
# hi there

# Question 3
# A
# => 1
# => 2
# => 3

# B
# => one
# => two
# => three

# C
# => two
# => three
# => one

# Question 4
def return_uuid
  possible = []
  possible << ('a'..'f').to_a
  possible << ('0'..'9').to_a
  possible.flatten!
  uuid = ''

  sample = [8, 4, 4, 4, 12]

  sample.each_with_index do | value, index |
    value.times { uuid += possible.sample }
    uuid += '-' unless sample.size <= index + 1
  end

  uuid
end

puts return_uuid # For testing purposes

# Question 5
def dot_separated_ip_address?(input_string)
  return false unless input_string.count('.') == 3
  dot_separated_words = input_string.split(".")
# ls method - return false unless dot_seperated_words.size == 4
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_a_number?(word)
  end

  true
end
