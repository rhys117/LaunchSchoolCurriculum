# Exercise 1
class MyCar
  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def speed_up(num)
    @speed += num
    puts "You accelerate #{num} km/h more."
  end

  def brake(num)
    @speed -= num
    puts "You decelerate #{num} km/h less."
  end

  def current_speed
    puts "You're traveling at #{@speed} km/h."
  end

  def shut_off
    @speed = 0
    puts "You've stopped the car."
  end
end

getz = MyCar.new(2009, 'yellow', 'Hyonda Getz')
getz.speed_up(20)
getz.current_speed
getz.brake(10)
getz.current_speed
getz.shut_off
getz.current_speed

# Exercise 2
class MyCarExer2
  attr_accessor :color
  attr_reader :year

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def speed_up(num)
    @speed += num
    puts "You accelerate #{num} km/h more."
  end

  def brake(num)
    @speed -= num
    puts "You decelerate #{num} km/h less."
  end

  def current_speed
    puts "You're traveling at #{@speed} km/h"
  end

  def shut_off
    @speed = 0
    puts "You've stopped the car."
  end
end

mx5 = MyCarExer2.new(2001, 'blue', 'Mazda Mx5')
puts mx5.color
mx5.color = 'black'
puts mx5.color
puts mx5.year


# Exercise 3
class MyCarExer3
  attr_accessor :color
  attr_reader :year

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def spray_paint(color)
    self.color = color
    puts "You spray painted your car #{color}."
  end
end

focus = MyCarExer3.new(2010, 'silver', 'Ford Focus')
focus.spray_paint('red')