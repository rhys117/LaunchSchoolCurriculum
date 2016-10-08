require 'date'

def friday_13th?(year)
  # Jan 1 1752 Wednesday
  fridays_on_thirteenth = 0
  thirteenth = Date.new(year, 1, 13)
  11.times do
    fridays_on_thirteenth += 1 if thirteenth.friday?
    thirteenth = thirteenth.next_month
  end
  fridays_on_thirteenth
end

p friday_13th?(2015) == 3
p friday_13th?(1986) == 1