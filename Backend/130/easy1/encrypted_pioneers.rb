ALPHABET = ('a'..'z').to_a * 2

def rot_decode(str)
  split_chars = str.split('')
  split_chars.map! do |char|
    if char =~ /[[:alpha:]]/
      adjust_index = ALPHABET.index(char.downcase) + 13
      adjusted_char = ALPHABET[adjust_index]
    else
      char
    end
  end
  split_chars.join('')

end

names = "Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unyog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Wbua Ngnanfbss
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu"

decoded = rot_decode(names)

puts decoded