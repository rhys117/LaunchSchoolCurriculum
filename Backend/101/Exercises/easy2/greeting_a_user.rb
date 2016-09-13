puts "What is your name?"
name = gets.chomp

if name.chars.last == '!'
  puts "HELLO #{name}. WHY ARE YOU SCREAMING?"
else
  puts "Hello #{name}."
end