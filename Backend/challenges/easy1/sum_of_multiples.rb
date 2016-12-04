class SumOfMultiples
  DEFAULT_MULTIPLES = [3, 5]

  def initialize(multiples=DEFAULT_MULTIPLES)
    @multiples = *multiples
  end

  def self.to(limit, multiples=DEFAULT_MULTIPLES)
    result = []
    multiples.each do |multiple|
      result << (1..limit).select { |num| num % multiple == 0 }
    end
    result.flatten.uniq.inject(:+)
  end

  def to(max)
    self.class.to(limit, @multiples)
  end
end

SumOfMultiples.to(10)