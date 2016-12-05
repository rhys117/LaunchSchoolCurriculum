def one?(array)
  found = false
  array.each do |element|
    next unless yield(element)
    return false if found
    found = true
  end
  found
end

p one?([1, 3, 5, 6]) { |value| value.even? }
p one?([1, 3, 5, 7]) { |value| value.odd? }
p one?([2, 4, 6, 8]) { |value| value.even? }
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 }
p one?([1, 3, 5, 7]) { |value| true }
p one?([1, 3, 5, 7]) { |value| false }
p one?([]) { |value| true }