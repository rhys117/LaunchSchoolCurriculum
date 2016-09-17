def short_long_short(str_one, str_two)
  if str_one.length > str_two.length
    str_two + str_one + str_two
  else
    str_one + str_two + str_one
  end
end

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"