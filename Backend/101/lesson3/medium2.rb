# Question 1
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}

total_age_males = 0

munsters.each do |_, contents|
  if contents["gender"] == "male"
    total_age_males = total_age_males + contents["age"]
  end
end

total_age_males = 0

munsters.each do |_, contents|
  total_age_males += contents["age"] if contents["gender"] == "male" #one liner
end

# Question 2
def print_details(hash)
  hash.each do |name, contents|
    puts "#{name} is a #{contents["age"]} year old #{contents["gender"]}"
  end
end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

print_details(munsters)

# Question 3
def fixed_method(str, arr)
  str += 'gibberish'
  arr << ['gibberish']

  return str, arr
end

my_string = "Apples"
my_array = ["Apples"]
my string, my_array = fixed_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Question 4
sentence = "Humpty Dumpty sat on a wall."
sentence.split(/\W/).reverse!.join(' ') + '.'

# Question 5
# 34

# Question 6
# It changes the actual hash

# Question 7
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end
 
puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock") # paper

# Question 8
# no