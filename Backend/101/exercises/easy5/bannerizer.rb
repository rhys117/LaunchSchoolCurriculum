def print_in_box(str)
  top_and_bottom = "+#{'-' * (str.size + 2)}+"
  space_line = "|#{' ' * (str.size + 2)}|"

  puts top_and_bottom
  puts space_line
  puts "| #{str} |"
  puts space_line
  puts top_and_bottom
end

print_in_box('To boldly go where no one has gone before.')