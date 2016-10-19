# Exercise 1
class ClassName
end

object_name = ClassName.new

# Exercise 2
# A module is where we can create reusable code and include it in 
# multiple areas of our program.

module ModuleName
end

class ClassName
  include ModuleName
end

object_name = ClassName.new