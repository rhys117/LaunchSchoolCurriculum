class SumOfMultiples
  DEFAULT_MULTIPLES = [3, 5]

  initialize(multiples=DEFAULT_MULTIPLES)
    @multiples = *multiples
  end

  def self.to(max, multiples=DEFAULT_MULTIPLES)
    SumOfMultiples.new(multiples).to(max)
  end

  def to(max)
    self.class.to(max, @multiples)
  end

  def find_multiples_of_sum
    result = []
    @multiples.each do |multiple|
      result << multiple if num % multiple == 0
    end
    result.uniq
  end

  def find_sum_of_multiples
    find_multiples_of_sum.inject(:+)
  end
end

SumOfMultiples.to(10)