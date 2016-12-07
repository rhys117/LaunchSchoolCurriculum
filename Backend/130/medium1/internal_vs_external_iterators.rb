factorial = Enumerator.new do |yielder|
  total = 1
  number = 0
  loop do
    total = number.zero? ? 1 : total * number
    yielder << total
    number += 1
  end
end

7.times { puts factorial.next }

factorial.rewind

factorial.each_with_index do |number, index|
  puts number
  break if index == 6
end
