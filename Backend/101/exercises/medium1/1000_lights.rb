
lights_hash = Hash.new

(1..1000).each { |num| lights_hash[num] = false }

(1..1000).each do |num|
  lights_hash.keys.each do |key|
    lights_hash[key] = !lights_hash[key] if key % num == 0
  end
end

num_on_lights = lights_hash.values.count(true)
off_lights = lights_hash.select { |key, value| value == false}.keys

puts "Number of lights on: #{num_on_lights}" 
puts "Current lights off: #{off_lights.join(', ')}"

# on_lights = lights_hash.select { |key, value| value == true }.keys
# num_of_lights_on = on_lights.count
# num_of_lights_off = off_lights.count
