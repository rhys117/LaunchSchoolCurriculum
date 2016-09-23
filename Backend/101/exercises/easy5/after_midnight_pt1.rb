MINUTES_PER_DAY = 1440.freeze

def time_of_day(num) # without ruby Time or Date
  loop do
    num = num - 1440 if num > 1440
    break if num < 1440
  end

  loop do
    num = num + 1440 if num < -1440
    break if num > -1440
  end

  hours = num / 60
  hours = hours + 24 if hours < 0
  hours = hours.to_s
  hours.prepend('0') if hours.length < 2
  minutes = (num % 60).to_s
  minutes.prepend('0') if minutes.length < 2

  time = hours + ':' + minutes
end

# ls and divmod

def time_of_day_2(delta_minutes)
  delta_minutes = delta_minutes % 1440
  hours, minutes = delta_minutes.divmod(60)
  format('%02d:%02d', hours, minutes)
end

puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"

puts time_of_day_2(0) == "00:00"
puts time_of_day_2(-3) == "23:57"
puts time_of_day_2(35) == "00:35"
puts time_of_day_2(-1437) == "00:03"
puts time_of_day_2(3000) == "02:00"
puts time_of_day_2(800) == "13:20"
puts time_of_day_2(-4231) == "01:29"
