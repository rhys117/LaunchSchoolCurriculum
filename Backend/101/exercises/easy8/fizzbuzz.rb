def fizzbuzz(num1, num2)
  num1.upto(num2).each do |num|
    if num % 3 == 0 && num % 5 == 0
      print 'FizzBuzz'
    elsif num % 3 == 0
      print 'Fizz'
    elsif num % 5 == 0
      print 'Buzz'
    else
      print num
    end
    print ', ' unless num == num2
    puts if num == num2
  end
end

## Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", 
# if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, 
# print "FizzBuzz".


fizzbuzz(1, 15)