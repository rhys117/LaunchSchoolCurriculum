def remove_vowels(array)
  array.each do |str|
    str.delete!('AEIOUaeiou')
  end
  array
end

def remove_vowels(array)
  array.map { |str| str.delete('AEIOUaeiou') }
end

puts remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
puts remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
puts remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']