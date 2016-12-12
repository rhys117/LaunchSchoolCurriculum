class String
  def is_i?
    /\A[-+]?\d+\z/ === self
  end
end

class MinilangRuntimeError < RuntimeError; end
class BadTokenError < MinilangRuntimeError; end
class EmptyStackError < MinilangRuntimeError; end

class Minilang
  ACTIONS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

  def initialize(str)
    @commands = str.split
    @stack = []
    @register = 0
  end

  def eval
    @commands.each do |command|
      check_if_valid(command)
      if command.is_i?
        @register = command.to_i
      else
        send(command.downcase)
      end
    end
  end

  private

  def check_if_valid(command)
    unless command.is_i? || ACTIONS.include?(command)
      raise BadTokenError, "Invalid token: #{command}"
    end
  end

  def push
    @stack.push(@register)
  end

  def add
    @register += pop
  end

  def pop
    raise EmptyStackError, "Empty stack!" if @stack.empty?
    @register = @stack.pop
  end

  def sub
    @register -= pop
  end

  def mult
    @register *= pop
  end

  def div
    @register /= pop
  end

  def mod
    @register %= pop
  end

  def print
    puts @register
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

# Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

# Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)