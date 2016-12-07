def types(array)
  yield(array)
end

birds = %w(raven finch hawk eagle)
birds # => ['raven','finch','hawk','eagle']

types(bird) do |_,_,*birds_of_prey|
  puts "Two birds of prey are the #{birds_of_prey.join(' and ')}."
end