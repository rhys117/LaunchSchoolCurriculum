# Question 1
#1
#2
#2
#3

# Question 2
# The explanation mark is general used when altering the variable
# or also used as a way to check if arguements are false. The
# question mark is used on calls that generally check to see if
# something is true or not as a ternary operator

#1. means is not equal to. checking values for arguements
#2. would return false. (is user_name NOT user_name = false)
#3. changes the variable words with the value from the unique method
#4. depends what follows it... as a ternary value as explained on stack overflow
# => if_this_is_a_true_value ? then_the_result_is_this : else_it_is_this
#5. depends if it's a valid method. otherwise an error
#6. would return true.

# Question 3
advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub!('important','urgent')

# Question 4
# The first method deletes the array index of 1 which would be 2 seeing as 
# => the array starts 0.
# The second method would search the array for any instances of the number 1
# => and delete them.

# Question 5
# Programmatically determine if 42 lies between 10 and 100.
(10..100).include?(42)
(10..100).cover?(42) # after looking at documentation this would be better

# Question 6
famous_words = "seven years ago..."
"Four score and " + famous_words
"Four score and" << famous_words # changes varibale

# Question 7
# 42

# Question 8
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

flintstones.flatten!

# Question 9
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

flintstones.assoc("Barney")

#Question 10
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones_hash = {}

flintstones.each_with_index do |name, idx|
  flintstones_hash[name] = idx
end
