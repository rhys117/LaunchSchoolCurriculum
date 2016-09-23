def running_total(array)
  running_totals = []
  array.each_index do |index|
    nums_to_add = array[0, index + 1]
    running_totals << nums_to_add.inject(:+)
  end
  running_totals
end

def running_total_improved(array)
  sum = 0
  array.map { |number| sum += number }
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []

puts running_total_improved([2, 5, 13]) == [2, 7, 20]
puts running_total_improved([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total_improved([3]) == [3]
puts running_total_improved([]) == []