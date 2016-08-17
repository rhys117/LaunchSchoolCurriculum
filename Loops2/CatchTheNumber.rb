loop do
  number = rand(100)
  puts number
  if number.between?(1,10)
    break
  end
end