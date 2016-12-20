class Robot
  ORIENTS = %i(north east south west).freeze
  attr_accessor :bearing, :coordinates

  def initialize
    @bearing = :north
    @coordinates = [0, 0]
  end

  def orient(direction)
    raise ArgumentError.new('must be compass direction') unless
      ORIENTS.include?(direction)
    self.bearing = direction
  end

  def turn_right
    rotated_orients = ORIENTS.rotate
    self.bearing = rotated_orients[ORIENTS.index(bearing)]
  end

  def turn_left
    rotated_orients = ORIENTS.rotate(-1)
    self.bearing = rotated_orients[ORIENTS.index(bearing)]
  end

  def at(x, y)
    self.coordinates = [x, y]
  end

  def advance
    case @bearing
    when :north
      @coordinates[1] += 1
    when :east
      @coordinates[0] += 1
    when :south
      @coordinates[1] -= 1
    when :west
      @coordinates[0] -= 1
    end
  end
end

class Simulator
  def instructions(str)
    commands = []
    str.split('').each do |command_letter|
      commands << case command_letter
                  when 'L'
                    :turn_left
                  when 'R'
                    :turn_right
                  when 'A'
                    :advance
                  end
    end
    commands
  end

  def place(robot, data)
    robot.at(data[:x], data[:y])
    robot.orient(data[:direction])
  end

  def evaluate(robot, commands)
    instructions(commands).each do |command|
      robot.send command
    end
  end
end
