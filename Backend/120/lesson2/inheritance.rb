class Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Cat < Pet
  def speak
    'meow!'
  end
end

class Dog < Pet
   def speak
    'bark!'
  end

  def fetch
    'fetching!'
  end

  def swim
    'swimming!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim"
  end
end

teddy = Dog.new
puts teddy.speak           # => "bark!"
puts teddy.swim           # => "swimming!"

karl = Bulldog.new
puts karl.speak           # => "bark!"
puts karl.swim            # => "can't swim!"

kitty = Cat.new
puts kitty.speak

# 3
# Pet > Dog > Bulldog
# Pet > Cat

# 4
# The order in which ruby will search for approriate methods etc
puts "Bulldog Hiararchy"
puts Bulldog.ancestors