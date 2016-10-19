class MyCar
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

  def spray_paint(color)
    self.color = color
    puts "You spray painted your car #{color}."
  end

  def self.petrol_mileage(litres, km)
    puts "#{km / litres} km per litre."
  end

  def to_s
    "My car is a #{color}, #{year}, #{@model}."
  end
end

getz = MyCar.new(2009, 'yellow', 'Hyonda Getz')

MyCar.petrol_mileage(10, 50)
puts getz.to_s