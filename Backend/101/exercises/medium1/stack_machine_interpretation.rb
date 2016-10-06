def minilang(str)
  stack = []
  n = 0
  str.split.each do |command|
    case command
    when 'PUSH' then stack.push(n)
    when 'ADD' then n += stack.pop
    when 'SUB' then n -= stack.pop
    when 'MULT' then n *= stack.pop
    when 'DIV' then n /= stack.pop
    when 'MOD' then n %= stack.pop
    when 'POP' then n = stack.pop
    when 'PRINT' then puts n
    else n = command.to_i
    end
  end
end

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')