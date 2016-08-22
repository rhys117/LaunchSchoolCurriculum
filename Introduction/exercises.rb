#Exercise 1
arr =  [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.each do |x|
  puts x
end

arr.each { |x| puts x }

#Exercise 2
arr.each do |x|
  if x > 5
    puts x
  end
end

arr.each { |x| puts x if x > 5 }

#Exercise 3
arr_odds = arr.select { |x| x.odd? }

#Exercise 4
arr << 11
arr.unshift(0)

#Exercise 5
arr.delete(arr.last)

#OR

arr.pop 

#Exercise 6 
arr_unique = arr.uniq

#Exercise 7
#A hash contains paired content (with a key generally)

#Exercise 8
my_hash = { examplekey: "value" }
my_hash = { :examplekey => "value" }

#Exercise 9
h = {a:1, b:2, c:3, d:4}

h.each { |key,value| puts value if key == :b } #this is wrong
h[:b]
h[:e] = 5
h.delete_if { |key, value| value < 3.5 }

#Exercise 10 
#yes
array_in_hash = { examplekey: [1,23,41,"exampe"] }
hash_in_array = [ { key: "value" } ]

#Exercise 11
#http://docs.ruby-lang.org/ or https://ruby-doc.org/

#Exercise 12
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
contacts["Joe Smith"][:email] = contact_data[0][0]
contacts["Joe Smith"][:address] = contact_data[0][1]
contacts["Joe Smith"][:phone] = contact_data[0][2]
contacts["Sally Johnson"][:email] = contact_data[1][0]
contacts["Sally Johnson"][:address] = contact_data[1][1]
contacts["Sally Johnson"][:phone] = contact_data[1][2]

#Exercise 13
contacts["Joe Smith"][:email]
contacts["Sally Johnson"][:phone]

#Exercise 14
contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
contacts = {"Joe Smith" => {}}
fields = [:email, :address, :phone]

contacts.each do |name, hash|
  fields.each do |field|
    hash[field] = contact_data.shift
  end
end

#Could not figure out next bit (copied) ### LOOK HERE and figure out.
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
fields = [:email, :address, :phone]

contacts.each_with_index do |(name, hash), idx|
  fields.each do |field|
    hash[field] = contact_data[idx].shift
  end
end

#Exercise 15
arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if { |value| value.start_with?("s") }

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if { |value| value.start_with?("s","w") }

#Exercise 16
a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

a = a.map { |words| words.split }
a = a.flatten

#Exercise 17
#same