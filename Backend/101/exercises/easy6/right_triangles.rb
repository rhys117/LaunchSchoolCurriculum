def triangle(num)
  spaces = num - 1
  stars = 1

  num.times do
    puts (' ' * spaces) + ('*' * stars)
    spaces -= 1
    stars += 1
  end
end

triangle(6)