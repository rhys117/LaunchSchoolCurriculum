def diamond(odd_num)
 middle = odd_num / 2
  (1..odd_num).each do |num|
    line = '*'
    line << '*' * (2 * (num - 1)) if num <= middle + 1  
    line << '*' * (2 * (odd_num - num)) if num > middle + 1
    spaces = ' ' * ((odd_num - line.length) / 2)
    line.prepend(spaces)
    puts line
  end
end

diamond(9)