def oddities(array)
  odd_array = []
  array.each_with_index do |value, index|
    odd_array << value if (index + 1).odd?
  end
  odd_array
end

def oddities_improved(array)
  array.select.with_index { |_, index| (index + 1).odd? }
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []

puts oddities_improved([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities_improved(['abc', 'def']) == ['abc']
puts oddities_improved([123]) == [123]
puts oddities_improved([]) == []