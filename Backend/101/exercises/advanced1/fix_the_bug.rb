def my_method(array)
  if array.empty?
    []
  elsif array.length > 1
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

# def my_method(array)
#   return array if array.empty?
#   if array.length == 1
#     array[0] = array[0] * 7
#   else
#     array.map! { |num| num ** 2 }
#   end
#   array
# end

p my_method([]) == []
p my_method([3]) == [21]
p my_method([3, 4]) == [9, 16]
p my_method([5, 6, 7]) == [25, 36, 49]
