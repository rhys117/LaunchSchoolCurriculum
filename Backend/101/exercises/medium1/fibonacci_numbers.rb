def fibonacci(num)
  return 0 if num == 0
  return 1 if num == 1
  return fibonacci(num - 1) + fibonacci(num -2)
end

p fibonacci(1)
p fibonacci(2)
p fibonacci(3)
p fibonacci(4)
p fibonacci(5)
p fibonacci(10)
p fibonacci(30)