class String
  def is_i?
    /\A[-+]?\d+\z/ === self
  end
end

class Minilang
  def initialize(str)
    @input = str
    @commands = convert_input_to_commands
  end

  def convert_input_to_commands
    array = @input.split
    array.each_with_index do |el, idx|
      if el.is_i?
        
    end
  end


end
Minilang.new('5 PUSH 3 MULT PRINT')


Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)