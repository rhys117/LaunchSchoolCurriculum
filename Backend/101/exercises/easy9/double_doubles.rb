def twice(num)
  str_num = num.to_s
  middle = str_num.length / 2
  return num if str_num[0..middle - 1] == str_num[middle..-1] && middle > 0
  num * 2
end

puts twice(37) == 74
puts twice(44) == 44
puts twice(334433) == 668866
puts twice(444) == 888
puts twice(107) == 214
puts twice(103103) == 103103 #
puts twice(3333) == 3333 #
puts twice(7676) == 7676
puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789 #
puts twice(5) == 10