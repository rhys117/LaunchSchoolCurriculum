def swapcase(str)
  chars = str.chars.map do |char|
            if char =~ /[[:lower:]]/
              char.upcase
            else
              char.downcase
            end
          end
  chars.join
end
puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'