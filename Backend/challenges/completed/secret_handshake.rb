class SecretHandshake
  SECRET_CODE = { 1 => 'wink',
                  10 => 'double blink',
                  100 => 'close your eyes',
                  1000 => 'jump' }

  def initialize(num)
    @input = num
    @binary = convert_to_binary
  end

  def commands
    result = []
    reverse = false

    if @binary >= 10000
      reverse = true
      @binary -= 10000
    end

    SECRET_CODE.reverse_each do |key, value|
      if @binary >= key
        result.unshift(value)
        @binary -= key
      end
    end
    result.reverse! if reverse
    result
  end

  def convert_to_binary
    return @input.to_i if @input.class == String
    @input.to_s(2).to_i
  end
end
