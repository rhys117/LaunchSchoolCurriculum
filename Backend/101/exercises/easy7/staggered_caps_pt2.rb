def staggered_case(str)
  capitalize = true
  chars = str.chars.each do |char|
            if capitalize && char =~ /[A-z]/
              capitalize = !capitalize
              char.upcase!
            elsif capitalize == false && char =~ /[A-z]/
              capitalize = !capitalize
              char.downcase!
            else
              char
            end
          end
  chars.join
end

puts staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'