# Question 1
fintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Question 2
flintstones << 'Dino'

# Question 3
flintstones.push('Dino')
flintstones.concat(['Dino','Hoppy'])
flintstones.concat(%w(Dino Hoppy))

flintstones.uniq! # To delete extras from using multiple examples

# Question 4
advice = "Few things in life are as important as house training your pet dinosaur."
advice.slice!(0, advice.index('house'))

advice.slice(0, advice.index('house')) # Does not change the string value in advice

# Question 5
statement = "The Flintstones Rock!"
statement.scan('t').count

# Question 6
title = "Flintstone Family Members"
title.center(40)