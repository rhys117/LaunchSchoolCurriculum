def repeater(str)
  str.each_char.map { |char| char * 2 }.join
end 

puts repeater('Hello') == "HHeelllloo"
puts repeater("Good job!") == "GGoooodd  jjoobb!!"
puts repeater('') == ''