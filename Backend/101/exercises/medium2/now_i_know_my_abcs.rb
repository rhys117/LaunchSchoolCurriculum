BLOCK = [['B', 'O'], ['X', 'K'], ['D', 'Q'],
         ['C', 'P'], ['N', 'A'], ['G', 'T'],
         ['R', 'E'], ['F', 'S'], ['J', 'W'],
         ['H', 'U'], ['V', 'I'], ['L', 'Y'],
         ['Z', 'M']]  
         # B:O   X:K   D:Q   C:P   N:A
         # G:T   R:E   F:S   J:W   H:U
         # V:I   L:Y   Z:M

def block_word?(str)
  str.each_char do |char| 
    BLOCK.each do 
      |array| p array.include?(char) 
    end
  end
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true