# Object
  object = "string text"
  object.class # => String

# Classes
  class WhatAreClasses
    def initialize
      @data = "I'm instance data of this object. Hello!"
    end

    def method
      puts @data.gsub("instance", "altered")
    end
  end

  object = WhatAreClasses.new
  object.method # => I'm altered data of this object. Hello!

# Inheritance
  class HigherInHierachy
    def inherited_method
      "I've been inherited!"
    end
  end

  class LowerInHierachy < HigherInHierachy
    #
  end

  LowerInHierachy.new.inherited_method # => I've been inherited!

# Super
  class HigherInHierachy
    def initialize(first_element)
      @first_var = first_element
    end
  end

  class LowerInHierachy < HigherInHierachy
    def initialize(second_element)
      super
      @second_var = second_element
    end
  end

  object = LowerInHierachy.new('example_el') # => #<LowerInHierachy:0x007fdef3827d08 @second_var="example_el", @first_var="example_el">

  class HigherInHierachy
    def initialize(first_element)
      @first_var = first_element
    end
  end

  class LowerInHierachy < HigherInHierachy
    def initialize(first_element, second_element)
      super(first_element)
      @second_var = second_element
    end
  end

  object = LowerInHierachy.new('first_el', 'second_el') # => #<LowerInHierachy:0x007fdef392bdd0 @first_var="first_el", @second_var="second_el">

# Module Methods