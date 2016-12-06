def step(start_num, end_num, increment)
  until start_num == end_num + increment
    yield(start_num)
    start_num += increment
  end
end

step(1, 10, 3) { |value| puts "value = #{value}" }