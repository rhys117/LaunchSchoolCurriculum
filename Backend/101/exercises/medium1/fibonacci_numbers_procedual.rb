def fibonacci(num)
  return 1 if num <= 2
  first, last = [1, 1]
  (3..num).each do
    first, last = [last, first + last]    
  end
  last
end

p fibonacci(1)
p fibonacci(2)
p fibonacci(3)
p fibonacci(4)
p fibonacci(5)
p fibonacci(10)
p fibonacci(50)