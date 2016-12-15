class Series

  def initialize(str_num)
    @string_number = str_num
  end

  def slices(series)
    broken_number = @string_number.split('').map(&:to_i)
    raise ArgumentError.new('too large') if series > broken_number.size
    broken_number.each_cons(series).to_a
  end
end