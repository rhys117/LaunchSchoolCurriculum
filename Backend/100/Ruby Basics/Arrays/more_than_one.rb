pets = ['cat', 'dog', 'fish', 'lizard']

my_pets = pets.select { |pet| pet == 'fish' || pet == 'lizard'}.join(' and a pet ')

puts "I have a pet #{my_pets}!"