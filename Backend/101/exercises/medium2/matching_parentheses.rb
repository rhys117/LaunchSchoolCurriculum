def balanced?(str)
  balance  = 0
  str.each_char do |char|
    balance += 1 if char == '('
    balance -= 1 if char == ')'
    return false if balance < 0
  end
  balance.zero?
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false