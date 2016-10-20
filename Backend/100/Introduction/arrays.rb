#Exercise 1
arr = [1, 3, 5, 7, 9, 11]
number = 3

arr.each do |x|
  if x == number 
    puts "#{number} is in the array!"
  else
    puts "#{number} is not in the array"
  end
end

#Exercise 2
#returns 1
#arr = [["b"], ["b", 2], ["b", 3], ["a", 1], ["a", 2], ["a", 3]]

#returns [1,2,3]
#arr = [["b"], ["a", [1, 2, 3]]]

#Exercise 3
arr = [["test", "hello", "world"],["example", "mem"]]
puts arr[1[0]]

#or

puts arr.last.first

#Exercise 4
#1. 3
#2. undefined method (because of the wrong brackets)
#3. 8

#Exercise 5
#1. e
#2. A
#2. nil

#Exercise 6
#'margaret' is not a valid array index. You could change 'margaret' to 3.

#Exercise 7
arr1 = [1,2,3]
arr2 = []

arr1.each do |x|
  arr2 << x + 2
end

p arr1
p arr2