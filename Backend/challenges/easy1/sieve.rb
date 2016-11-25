class Sieve

  def initialize(limit)
    @limit = limit
  end

  def primes
    number_array = 2.upto(@limit).to_a
    # index = 0
    # number_array.size.times do |num|
    #   number_array.each do [num]



    number_array.each do |num|
      number_array.each_with_index do |sec_num, sec_num_index|
        if sec_num % num == 0 && num != sec_num
          number_array.delete_at(sec_num_index)
        end
      end
    end
    number_array
  end
end

test_var = Sieve.new(50)
test_var.primes