def greetings(name_array, job_hash)
  name = name_array.join(' ')
  job = job_hash.values.join (' ')
  puts "Hey there #{name}. Nice to have a #{job} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# Hello, John Q Doe! Nice to have a Master Plumber around.
