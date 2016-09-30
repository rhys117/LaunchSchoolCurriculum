def find_fibonacci_index_by_length(num)
  first_num = 1
  second_num = 1
  index_num = 2

  loop do
    index_num += 1
    added_nums = first_num + second_num
    break if added_nums.to_s.size >= num

    first_num = second_num
    second_num = added_nums
  end
  index_num
end

puts find_fibonacci_index_by_length(2) == 7
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
puts find_fibonacci_index_by_length(1000) == 4782
puts find_fibonacci_index_by_length(10000) == 47847