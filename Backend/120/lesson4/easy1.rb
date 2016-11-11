=begin

1.
Which of the following are objects in Ruby? If they are objects, how can you
find out what class they belong to?

All of these are objects. Everything in ruby is an object. To find the class
of an object we can call the .class method on the object.

true.class => TrueClass
"hello".class => String
[1, 2, 3, "happy days"].class => Array
142.class => Fixnum

=end

=begin

2.
If we have a Car class and a Truck class and we want to be able to
go_fast, how can we add the ability for them to go_fast using the module Speed?
How can you check if your Car or Truck can now go fast?

=end

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
	include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
	include Speed
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

test_car = Car.new
test_car.go_fast

test_truck = Truck.new
test_truck.go_fast

=begin

3.
When we called the go_fast method from an instance of the Car class (as shown
below) you might have noticed that the string printed when we go fast includes
the name of the type of vehicle we are using. How is this done?
--
This is achieved by by the return value of self.class. The self refers to the
object in question and the .class will return its class (duh!). Because it's
being interpolated to_s is already taken care of.

=end

=begin

4.
If we have a class AngryCat how do we create a new instance of this class?

=end

class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end

AngryCat.new

=begin

5.
Which of these two classes has an instance variable and how do you know?

=end

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

# Pizza has an instance variable (@name)
hot_pizza = Pizza.new("cheese")
orange    = Fruit.new("apple")

hot_pizza.instance_variables # [:@name]
orange.instance_variables # []

=begin

6.
What could we add to the class below to access the instance variable @volume?

=end

class Cube
  def initialize(volume)
    @volume = volume
  end

  ## added
  def get_volume
  	@volume
  end
end

test_cube.new(4000)
test_cube.get_volume

=begin

7.
What is the default thing that Ruby will print to the screen if you call to_s
on an object? Where could you go to find out if you want to be sure?
--
The to_s method will print the objects class and the object id.

=end

=begin

8.
If we have a class such as the one below. You can see in the
make_one_year_older methodwe have used self. What does self refer to here?
--
self refers to the instance that called the method you're currently working with.

=end

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

=begin

9.
If we have a class such as the one below: In the name of the cats_count method
we have used self. What does self refer to in this context?
--
it refers to the class method Cat

=end

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

=begin

10.
If we have the class below, what would you need to call to create a new
instance of this class?

=end

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

# added
tets_bag = Bag.new('red', 'cotton')