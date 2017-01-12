# Object
  object = "string text"
  object.class # => String


# Classes
  class WhatAreClasses
    def initialize
      @data = "I'm instance data of this object. Hello!" # state
    end

    def method # behaivor
      puts @data.gsub("instance", "altered")
    end
  end

  object = WhatAreClasses.new
  object.method # => I'm altered data of this object. Hello!


# Class Variables
  class ClassVariableCounts
    @@count = 0

    def initialize
      @@count += 1
    end

    def self.count
      @@count
    end
  end

  first = ClassVariableCounts.new
  second = ClassVariableCounts.new

  ClassVariableCounts.count # => 2


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
  module AMixIn
    def a_method
      "I'm a module method"
    end
  end

  class AClass
    # as CLASS methods
    extend AMixIn

    # as INSTANCE methods
    include AMixIn
  end


# Module Namespace
  module ANamespace
    class AClass
      def initialize
        puts "Another object, coming right up!"
      end
    end
  end

  ANamespace::AClass.new #=> Another object, coming right up!


# Method Lookup
  module LookedInFirst
    #
  end

  module LookedInSecond
    #
  end

  class HigherInHierachy
    include LookedInSecond
    include LookedInFirst
    # include LookedInFirst, LookedInSecond
  end

  class LowerInHierachy < HigherInHierachy
    #
  end

  LowerInHierachy.ancestors #=> [LowerInHierachy, HigherInHierachy, LookedInFirst, LookedInSecond, Object, Kernal, BasicObject]


# Access Controls
  class AccessLevel
    def something_interesting
      another = AccessLevel.new
      another.public_method
      another.protected_method
      another.private_method
    end

    def public_method
      puts "Public method"
    end

    protected

    def protected_method
      puts "Protected method"
    end

    private

    def private_method
      puts "exception will be raised"
    end
  end

  AccessLevel.new.something_interesting
  #=> Public Method
  #=> Protected Method
  #=> NoMethodError: private method


# Accessor Methods
  # Getter :attr_reader
  def instance_var
    @instance_var
  end

  # Setter :attr_writer
  def instance_var=(value)
    @instance_var = value
  end

  # Both :attr_accessor

  # Custom Getter method
  def instance_var
    'Mr ' + @instance_var.split.last
  end


# Self
  class WhatIsSelf
    def test
      puts "At the instance level, self is #{self}"
    end

    def self.test
      puts "At the class level self is #{self}"
    end
  end

  WhatIsSelf.test #=> At the class level self is WhatIsSelf

  WhatIsSelf.new.test #=> At the instance level, self is #<WhatIsSelf:memorylocation>


# Closures
  def none?(array)
    array.each { |el| return false if yield(el) }
    true
  end

  # As sandwich code
  def time_taken
    start = Time.now
    yield
    finish = Time.now

    start - finish
  end

  # Procs
  example = proc { |var| puts var }
  example.call(2) # => 2 (returns nil due to puts)

  example.call(1, 2) # => 1 (returns nil due to puts)

  # Lambdas
  example = lambda { |var| puts var }
  example.call(2) # => 2 (returns nil due to puts)

  example.call(1, 2) # => wrong number of args

  # Passing blocs to methods


# Testing
  require 'minitest/autorun'

  class EqualityTest < Minitest::Test
    def test_for_equal_values
      first = 'example'
      second = 'example'

      assert_equal(first, second)
    end
  end

=begin
assert(test)                      Fails unless test is truthy.
assert_equal(exp, act)            Fails unless exp == act.
assert_nil(obj)                   Fails unless obj is nil.
assert_raises(*exp) { ... }       Fails unless block raises one of *exp.
assert_instance_of(cls, obj)      Fails unless obj is an instance of cls.
assert_includes(collection, obj)  Fails unless collection includes obj.
=end



