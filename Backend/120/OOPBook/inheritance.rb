module Towable
  def can_tow?(kg)
    kg < 1000 ? true : false
  end
end

class Vehicle
  attr_accessor :color
  attr_reader :model, :year
  
  @@number_of_vehicles = 0
  
  def self.number_of_vehicles
    puts "There are #{@@number_of_vehicles} created."
  end

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
    @@number_of_vehicles += 1
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

  def age
    "Your #{self.model}, is #{years_old} years old."
  end

  private

  def years_old
    Time.now.year - self.year
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "My car is a #{self.color}, #{self.year}, #{self.model}."
  end
end

class MyTruck < Vehicle
  include Towable

  NUMBER_OF_DOORS = 2

  def to_s
    puts "My Truck is a #{self.color}, #{self.year}, #{self.model}"
  end
end

getz = MyCar.new(2009, 'yellow', 'Hyonda Getz')

MyCar.petrol_mileage(10, 50)
puts getz.to_s
puts getz.age

puts "MyCar Ancestors"
puts MyCar.ancestors
puts "MyTruck Ancestors"
puts MyTruck.ancestors
puts "Vehicle Ancestors"
puts Vehicle.ancestors