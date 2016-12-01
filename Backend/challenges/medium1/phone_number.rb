class PhoneNumber

  def initialize(str)
    @input = str
    @phone_number = convert_input
  end

  def ten_digit_number
    digit_string = @input.gsub(/[^\d]/, '')
    if digit_string.length == 11 && digit_string[0] == '1'
      digit_string[1..-1]
    else
      digit_string
    end
  end

  def valid_number?
    ten_digit_number.length == 10 && @input.scan(/\p{Alpha}/).empty?
  end

  def convert_input
    if valid_number?
      ten_digit_number
    else
      "0000000000"
    end
  end

  def number
    @phone_number
  end

  def to_s
    "(#{@phone_number[0..2]}) #{@phone_number[3..5]}-#{@phone_number[6..9]}"
  end

  def area_code
    "#{@phone_number[0..2]}"
  end
end

a = PhoneNumber.new('(123) 456-7890')
p a.valid_number?
p a.convert_input