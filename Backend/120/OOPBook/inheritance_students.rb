class Student
  attr_accessor :grade
  attr_reader :name

  def initialize(n, g)
    @name = n
    @grade = g
  end

  def better_grade_than(student)
    grade > student.grade
  end

  protected

  def grade
    @grade
  end
end

rhys = Student.new("Rhys", 90)
joe = Student.new("Joe", 80)
puts "Well done" if rhys.better_grade_than(joe)

# 3 It is a private method.. this could be fixed by making it a public method.