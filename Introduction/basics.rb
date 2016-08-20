#Exercise 1
"Rhys" + "Murray"

#Exercise 2
thousands = 1000 / 1000
hundreds 1000 % 1000 / 100
tens 1000 % 100 / 10
ones 1000 % 10

#Exercise 3
movies = { matrix: 1999, 
           sin_city: 2009,
           star_wars: 1992 }

puts movies[:matrix]
puts movies[:sin_city]
puts movies[:star_wars]

#or

movies.each do |x,y|
  puts y
end

#Exercise 4
movie_dates = [1999,2009,1992]

movie_dates.each do |x|
  puts x
end

#Exercise 5
puts 5 * 4 * 3 * 2 * 1
puts 6 * 5 * 4 * 3 * 2 * 1
puts 7 * 6 * 5 * 4 * 3 * 2 * 1
puts 8 * 7 * 6 * 5 * 4 * 3 * 2 * 1

#Exercise 6
def puts_square(x)
  puts x * x
end

puts_square(1.23)
puts_square(423.12)
puts_square(2.22)

#Exercise 7
#The program was expecting to see a } closing bracket, instead encounted )
