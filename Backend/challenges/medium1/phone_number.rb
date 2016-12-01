class PhoneNumber
  INVALID_NUMBER = "0000000000".freeze

  attr_reader :number

  def initialize(str)
    @input = str
    @number = convert_input
  end

  def convert_input
    if valid_number?
      digit_number
    else
      INVALID_NUMBER
    end
  end

  def digit_number
    digit_string = @input.gsub(/[^\d]/, '')

    # Remove american code if applicable
    if digit_string.length == 11 && digit_string[0] == '1'
      digit_string[1..-1]
    else
      digit_string
    end
  end

  def valid_number?
    digit_number.length == 10 && @input.scan(/\p{Alpha}/).empty?
  end

  def area_code
    "#{@number[0..2]}"
  end

  def to_s
    "(#{@number[0..2]}) #{@number[3..5]}-#{@number[6..9]}"
  end
end
