def star(num)
  return 'error: number must be odd' if num.even?
  
  center_less_one = num / 2 - 1
  middle_line = '*' * num
  
  (0..center_less_one).reverse_each do |count|
    line_uncentered = ('*' + ' ' * count) * 2 + '*'
    start_spaces = ' ' * ((num - line_uncentered.length) / 2)
    puts line_centered = start_spaces + line_uncentered
  end

  puts middle_line

  (0..center_less_one).each do |count|
    line_uncentered = ('*' + ' ' * count) * 2 + '*'
    start_spaces = ' ' * ((num - line_uncentered.length) / 2)
    puts line_centered = start_spaces + line_uncentered
  end
end

star(9)