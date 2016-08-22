#Exercise 1
# [1,2,3,4,5]

#Exercise 2
puts "Type STOP to stop the loop"
input = gets.chomp

while input != "STOP"
  puts "I'm looping"
  input = gets.chomp
end

#Exercise 3
my_array = ["Something one","Something2","something3"]

my_array.each_with_index do | something,index |
  puts "#{index + 1}: #{something}"
end

#Exercise 4
def count_zero(num)
  if num <= 0
    puts num
  else
    puts num
    count_zero(num-1)
  end
end

count_zero(30)