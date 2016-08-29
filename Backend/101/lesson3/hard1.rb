# Question 1
# greeting is nil

# Question 2
# hi there

# Question 3
# A
# => 1
# => 2
# => 3

# B
# => one
# => two
# => three

# C
# => two
# => three
# => one

# Question 4
def UUID
  POSSIBLE = (('a'..'f').to_a + (0..9).to_a)
  sample = [8, 4, 4, 4, 12]
  
  sections.each_with_index do | item, index |
    
  return (0...8).map { |number| POSSIBLE.sample }.join
end