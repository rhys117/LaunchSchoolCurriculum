names = ['Sally', 'Joe', 'Lisa', 'Henry']

#Method 1
loop do
  x = names[0]
  puts x
  names.delete_at(0)
  break if names.length == 0
end

names2 = ['Sally', 'Joe', 'Lisa', 'Henry']

#Method 2
loop do
  puts names2.shift
  break if names2.empty?
end

names3 = ['Sally', 'Joe', 'Lisa', 'Henry']

#Reverse order
loop do
  names3.reverse!
  puts names3.shift
  break if names3.empty?
end