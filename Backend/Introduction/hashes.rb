#Exercise 1
family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

immediate_family = family.select { |k,v| k == :sisters || k == :brothers }

imm_fam_array = immediate_family.values.flatten

p imm_fam_array

#Exercise 2
#exclamation mark would alter the value in the hash. without it the changes would only be returned.
name = { name: "Rhys" }
last_name = { surname: "Murray" }
puts name.merge(last_name)
puts name
name.merge!(last_name)
puts name

#Exercise 3
family.each_key { |key| puts key }
family.each_value { |value| puts value }
family.each { |key,value| puts "key: #{key} value: #{value}" }

#Exercise 4
person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}
person[:mame]

#Exercise 5
#has_value?
if family.has_value?("bob")
  puts "bob is in the hash"
else
  puts "bob is not in the hash"
end

#Exercise 6
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
## look up answer could not figure out.

#Exercise 7 
x = "hi there"
my_hash = {x: "some value"}
my_hash2 = {x => "some value"}
#second hash is a string value.

#Exercise 8
#no keys in the array 