def multisum(num)
  multiples = []
  1.upto(num) do |i|
    multiples << i if i % 3 == 0
    multiples << i if i % 5 == 0 && !multiples.include?(i)
  end
  multiples.inject(0, :+)
end

# ls

def multisum_ls(num)
  sum = 0
  1.upto(num) do |number|
    if number % 3 == 0 || number % 5 == 0
      sum += number
    end
  end
  sum
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168

puts multisum_ls(3) == 3
puts multisum_ls(5) == 8
puts multisum_ls(10) == 33
puts multisum_ls(1000) == 234168