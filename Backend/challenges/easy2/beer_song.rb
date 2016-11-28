class BeerSong

  def initialize
    @beers = 99
  end

  def verses(num_of_beers, limit=num_of_beers)
    msg = ''
    until num_of_beers == limit - 1 do
      msg << verse(num_of_beers)
      msg << "\n" unless num_of_beers == limit
      num_of_beers -= 1
    end
    msg
  end

  def num_bottles(num_of_beers)
    case num_of_beers
    when 0
      'no more bottles'
    when 1
      '1 bottle'
    else
      "#{num_of_beers} bottles"
    end
  end

  def verse(num_of_beers)
    msg = ''
    case num_of_beers
    when 0
      msg << last_verse
    when 1
      msg << one_verse
    else
      num_bottle_str = num_bottles(num_of_beers)
      msg << "#{num_bottle_str} of beer on the wall, #{num_bottle_str}"\
             " of beer.\n"
      num_of_beers -= 1
      num_bottle_str = num_bottles(num_of_beers)
      msg << "Take one down and pass it around, #{num_bottle_str} of beer on"\
             " the wall.\n"
    end
    msg
  end

  def lyrics
    verses(@beers, 0)
  end

  def one_verse
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def last_verse
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end
end

puts BeerSong.new.verses(2, 0)
puts BeerSong.new.verses(99, 98)