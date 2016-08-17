#Method 1

for i in 1..100
  if i % 2 != 0
    puts i
  end
end

#Method 2

for i in 1..100
  puts i if i.odd?
end