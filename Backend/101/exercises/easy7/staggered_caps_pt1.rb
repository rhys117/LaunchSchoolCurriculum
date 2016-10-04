def staggered_case(str)
  capitalize = true
  chars = str.chars.each do |char|
            if capitalize
              capitalize = !capitalize
              char.upcase!
            elsif capitalize == false
              capitalize = !capitalize
              char.downcase!
            else
              capitalize = !capitalize
              char
            end
          end
  chars.join
end

puts staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'