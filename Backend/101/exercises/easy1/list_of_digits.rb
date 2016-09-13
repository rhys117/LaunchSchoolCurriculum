def digit_list(num)
  string_numbers = num.to_s.split('')
  numbers_array = []
  string_numbers.each do |num|
    numbers_array << num.to_i
  end
  numbers_array
end

def digit_list_improved(num)
  num.to_s.chars.map(&:to_i)
                # map { |char| char.to_i }
end

p digit_list(12345)
p digit_list(123)