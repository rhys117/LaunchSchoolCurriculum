number = 0
array_of_5 = []
last_num = nil

def number_ending(number)
  case number
  when 1
    '1st'
  when 2
    '2nd'
  when 3
    '3rd'
  when 4..5
    "#{number}th"
  end
end

loop do
  number += 1
  break if last_num != nil
  if number <= 5
    puts "==> Enter the #{number_ending(number)} number:"
    array_of_5 << gets.chomp.to_i
  else
    puts "==> Enter the last number:"
    last_num = gets.chomp.to_i
  end
end

if array_of_5.include?(last_num)
  puts "The number #{last_num} does appear in #{array_of_5}"
else
  puts "The number #{last_num} does not appear in #{array_of_5}"
end