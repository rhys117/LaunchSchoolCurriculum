=begin

1.
You are given the following code: What is the result of calling
oracle = Oracle.new
oracle.predict_the_future
--
The result will be a return string value of "You will " and one of the
elements from the array in the choice method.

=end

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end
class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

oracle = Oracle.new
oracle.predict_the_future

=begin

2.
We have an Oracle class and a RoadTrip class that inherits from the Oracle
class. What is the result of the following:
trip = RoadTrip.new
trip.predict_the_future
--
The return of a string with 'You will ' and one of the elements from the
choices array in the RoadTrip class as it 'overrides' the choices method in the
Oracle class.

=end

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

=begin

3.
How do you find where Ruby will look for a method when that method is called?
How can you find an object's ancestors? What is the lookup chain for Orange and
HotSauce?
--
We could use HoSauce.ancestors to find out. In this case..
HotSauce, Taste, Object, Kernal, BasicObject

=end

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

=begin

4.
What could you add to this class to simplify it and remove two methods from
the class definition while still maintaining the same functionality?

=end

class BeesWax
  def initialize(type)
    @type = type
  end

  def type
    @type
  end

  def type=(t)
    @type = t
  end

  def describe_type
    puts "I am a #{@type} of Bees Wax"
  end
end

# Simplified
class BeesWax
  attr_accessor :type

  def initialize(type)
    @type = type
  end

  def describe_type
    puts "I am a #{type} of Bees Wax"
  end
end

=begin

5.
There are a number of variables listed below. What are the different types
and how do you know which is which?
excited_dog = "excited dog"
@excited_dog = "excited dog"
@@excited_dog = "excited dog"
--
a local variable, an instance variable and a class variable. we can tell this
because of the lack or addition fo the @ symbol before the name of the
variable.

=end

=begin

6.
If I have the following class: Which one of these is a class method (if any)
and how do you know? How would you call a class method?
--
A method that starts with self is a class method. So in this case the
manufacturer method. A class method can be called by the Class the name
followed by the method.. eg. Television.manufacturer

=end

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

=begin

7.
If we have a class such as the one below: Explain what the @@cats_count
variable does and how it works. What code would you need to write to test your
theory?
--
When a new cat object is initialized the class variable cats_count will
increase by one. To test this we can create a few cat objects and then call
the Class method cats_count to see how many Cat objects there are.

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

#
rocky = Cat.new('turtese_shell')
sleepy = Cat.new('persian')

p Cat.cats_count

=begin

8.
If we have this class:

class Game
  def play
    "Start the game!"
  end
end

And another class:

class Bingo
  def rules_of_play
    #rules of play
  end
end

What can we add to the Bingo class to allow it to inherit the play method
from the Game class?
--
We can make the Game class the Parent Class to Bingo as demonstrated below..

=end

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

=begin

9.
If we have this class: What would happen if we added a play method to the Bingo
class, keeping in mind that there is already a method of this name in the Game
class that the Bingo class inherits from.
--
It would override the play method in Game and therefore no longer use it. This
is because of the chain in finding the method.. Ruby will look in Bingo before
before it looks in Game.

=end

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

=begin

10.
What are the benefits of using Object Oriented Programming in Ruby? Think of as
many as you can.
- Makes larger programs more managable and helps to stop a 'ripple' effect of
breaking code when you're changing small things.
- Allows the programmer to think more abstractly about the problem.
- Allows us to use previous libraries or code to make coding faster.

=end
