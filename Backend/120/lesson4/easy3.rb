# 1.
# If we have this code:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# What happens in each of the following cases:

# case 1:

hello = Hello.new
hello.hi

# The program would print 'Hello' to the console.

# case 2:

hello = Hello.new
hello.bye

# No method error

# case 3:

hello = Hello.new
hello.greet

# Arguement Error due to the lack of variable given to the method

# case 4:

hello = Hello.new
hello.greet("Goodbye")

# The program would print 'Goodbye' to the console.

# case 5:

Hello.hi

# Undefined method.

# 2
# In the last question we had the following classes:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# If we call Hello.hi we get an error message. How would you fix this?

# We could make this a class variable or create an object to call the method
# from.

=begin

3.
When objects are created they are a separate realization of a particular class.
Given the class below, how do we create two different instances of this class,
both with separate names and ages?

=end

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

##
first = AngryCat.new(2, 'larry')
second = AngryCat.new(5, 'spiffy')

=begin

4.
Given the class below, if we created a new instance of the class and then
called to_s on that instance we would get something like
"#<Cat:0x007ff39b356d30>"

How could we go about changing the to_s output on this method to look like
this: I am a tabby cat? (this is assuming that "tabby" is the type we passed
in during initialization).

=end

class Cat
  def initialize(type)
    @type = type
  end

  #
  def to_s
    "I am a #{type} cat"
  end
end

# 5.
# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

=begin

What would happen if I called the methods like shown below?
--
a new Television object would be assigned to the variable tv both the methods
manufacturer and model would be called on the variable and invoked. However
the tv.manufacturer method would result in an undefined method as it is a Class
method.

Because the Television manufacturer method is a Class method it would still
work on line 173 however the model method would not.


=end

tv = Television.new
tv.manufacturer
tv.model

Television.manufacturer
Television.model


# 6.
# If we have a class such as the one below:

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

In the make_one_year_older method we have used self. What is another way we
could write this method so we don't have to use the self prefix?

=end

  def make_one_year_older
    @age += 1
  end

# 7
# What is used in this class but doesn't add any value?
# The attr_accessor variables brightness and color are not used.
# there is also a redundant return on line 217

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super "\
           "high and a color of green"
  end

end


