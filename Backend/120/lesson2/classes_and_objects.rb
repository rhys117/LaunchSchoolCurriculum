class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    name_array = full_name.split
    @first_name = name_array.first
    @last_name = name_array.size > 1 ? name_array.last : ''
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    name_array = full_name.split
    self.first_name = name_array.first
    self.last_name = name_array.size > 1 ? name_array.last : ''
  end

  def to_s
    name
  end
end

# 1
bob = Person.new('bob')
p bob.name                  # => 'bob'
bob.name = 'Robert'
p bob.name

# 2
bob = Person.new('Robert')
bob.name                  # => 'Robert'
bob.first_name            # => 'Robert'
bob.last_name             # => ''
bob.last_name = 'Smith'
bob.name                  # => 'Robert Smith'

# 3
bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

# 4
bob.name == rob.name

# 5
# The person's name is: <objectid>
# The persons's name is: Robert Smith


