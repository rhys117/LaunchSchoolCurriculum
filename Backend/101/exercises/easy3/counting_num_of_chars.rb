puts "Please write a word or sentence."
words = gets.chomp

puts "There are #{words.gsub(' ', '').chars.count} characters in \"#{words}\"."