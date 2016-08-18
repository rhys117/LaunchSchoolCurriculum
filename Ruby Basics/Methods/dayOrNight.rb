daylight = [true, false].sample

def dayornight(time)
  if time == true
    puts "It's daytime!"
  else
    puts "It's nighttime!"
  end
end

dayornight(daylight)