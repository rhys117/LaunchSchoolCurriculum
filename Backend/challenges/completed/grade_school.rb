class School
  attr_reader :class_list

  def initialize
    create_class_list
  end

  def create_class_list
    @class_list = {}
    (1..7).each { |year| @class_list[year] = [] }
  end

  def to_h
    returned_hash = @class_list.select { |_, value| value.any? }
    returned_hash.each { |_, array| array.sort }
  end

  def grade(year)
    class_list[year]
  end

  def add(name, year)
    class_list[year] << name
  end
end

# 2nd way

class School
  attr_reader :class_list

  def initialize
    @class_list = Hash.new { |roster, year| roster[year] = [] }
  end

  def add(name, year)
    class_list[year] << name
  end

  def grade(year)
    class_list[year]
  end

  def to_h
    class_list.sort.map { |year, children| [year, children.sort] }.to_h
  end
end