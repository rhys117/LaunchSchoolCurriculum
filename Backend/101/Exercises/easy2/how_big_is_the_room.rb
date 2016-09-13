puts "what is the length of the room? (in meters)"
length = gets.chomp.to_f

puts "what is the width of the room? (in meters)"
width = gets.chomp.to_f

area_meters = (length * width)
puts "The area of the room is #{area_meters}. "\
  "(#{(area_meters * 10.7639).round(2)} square feet)"