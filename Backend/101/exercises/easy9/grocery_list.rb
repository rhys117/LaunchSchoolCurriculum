def buy_fruit(array)
  list = []
  array.each do |nested_array| 
    nested_array[1].times { list << nested_array[0] }
  end
  list
end

def buy_fruit(array)
  array.map { |fruit, num| [fruit] * num }.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]