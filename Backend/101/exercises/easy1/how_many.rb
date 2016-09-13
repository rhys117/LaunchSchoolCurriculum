def count_occurrences(array)
  occurences = {}

  array.uniq.each do |vehicle|
    occurences[vehicle] = array.count(vehicle)
  end

  occurences.each { |vehicle, count| puts "#{vehicle} => #{count}" }
end

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

count_occurrences(vehicles)