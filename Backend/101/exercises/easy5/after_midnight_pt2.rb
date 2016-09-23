def after_midnight(time_str)
  time = [time_str[0, 2].to_i, time_str[3, 5].to_i]
  total_minutes = time[0] * 60 + time[1]
  total_minutes = 0 if total_minutes == 1440
  total_minutes
end

def before_midnight(time_str)
  time = [time_str[0, 2].to_i, time_str[3, 5].to_i]
  total_minutes = time[0] * 60 + time[1]
  return total_minutes = 0 if total_minutes == 1440 || total_minutes == 0
  1440 - total_minutes
end

# ls

HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def after_midnight(time_str)
  hours, minutes = time_str.split(':').map(&:to_i)
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
end

def before_midnight(time_str)
  delta_minutes = MINUTES_PER_DAY - after_midnight(time_str)
  delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
  delta_minutes
end


puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0