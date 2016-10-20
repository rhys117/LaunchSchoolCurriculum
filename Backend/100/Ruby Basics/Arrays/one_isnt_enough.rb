pets = ['cat', 'dog', 'fish', 'lizard']
my_pets = pets[2..3]
my_pets.pop

pets.each do |pet|
  if pet == 'dog'
    my_pets << pet
  end
end

puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}"

# ls 
my_pets.push(pets[1])

puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}!"