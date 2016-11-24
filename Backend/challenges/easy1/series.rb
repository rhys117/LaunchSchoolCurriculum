class Series

  def initialize(str_num)
    @number = str_num
  end

  def slices(series)
    broken_string = @number.split('').map(&:to_i)
    index = 0
    result = []
    loop do
      p broken_string[index]

      break if series == index - 1
      index += 1
    end
    result
  end

  def something(num_array, series)
    series = 3
    num_array.each do do |num|
      num_array[index] == num_array[index + num]

  end
end

a = Series.new('01234')
p a.slices(3)