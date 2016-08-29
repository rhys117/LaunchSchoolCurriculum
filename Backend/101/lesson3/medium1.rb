# Question 1
10.times { |num| puts (" " * num) + 'The Flintstones Rock' }

# Question 2
statement = "The Flintstones Rock"

statement_hash = {}
letter_count = {}

statement.each_char do |char|
  next if char == " "
  letter_count[char] = 0 unless letter_count.include?(char)
  letter_count[char] += 1
end

letter_count = letter_count.sort.to_h # to sort it alephetically like the example
puts letter_count

# solution from Lauch school
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end

# Question 3
puts "the value of 40 + 2 is " + (40 + 2).to_s

# Question 4
# 1
# 3

# 1
# 2

# Question 5
def factors(number)
  dividend = number
  divisors = []
  while dividend > 0 do
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end 
  divisors
end

# determines if it has a remainder or not

# what the method returns

# Question 6
# The append changes the variable whilst adding would mean that you'd still have
# => input array variable unchanged

# Question 7
# def is below the limit variable. Methods should always be above needed variables.

# Question 8
def titleize(str)
  str.split.each{ |word| word.capitalize! }.join(' ')
end

words.split.map { |word| word.capitalize }.join(' ') # Launch school solution

# Question 9
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, contents|
  case contents["age"]
  when 0...18
    name[age_group] = "kid"
  when 18...65
    name[age_group] = "adult"
  when >= 65
    name[age_group] = "senior"
  end