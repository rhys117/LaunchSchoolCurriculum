password = "1337"
username = "Rick"

userinput = nil
passinput = nil

loop do
  puts "Please enter your username"
  userinput = gets.chomp

  puts "Please enter your password"
  passinput = gets.chomp

  break if userinput == username && passinput == password
  puts ">> Invalid Authorization. Try Again."
end

puts "Welcome #{username}!"