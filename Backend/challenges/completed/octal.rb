class Octal

  def initialize(num_str)
    @number_string = num_str
  end

  def to_decimal
    return 0 if not_valid?
    split_numbers = @number_string.split('').map(&:to_i)
    split_numbers.reverse.each_with_index.map do |num, index|
      num * 8 ** (index)
    end
    .inject(:+)
  end

  def not_valid?
    @number_string.to_i == 8 ||
    @number_string.split('').last.to_i > 8 ||
    @number_string =~ /[Az]/
  end
end

p test_var = Octal.new('233').to_decimal