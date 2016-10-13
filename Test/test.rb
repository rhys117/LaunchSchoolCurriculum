beginning_time = Time.now
(1..10000000).map { |n| n + 1 }
end_time = Time.now
puts "Time elapsed #{(end_time - beginning_time)*1000} milliseconds"

beginning_time = Time.now
(1..10000000).map { |n| n += 1 }
end_time = Time.now
puts "Time elapsed #{(end_time - beginning_time)*1000} milliseconds"