class BeerSong
  def verses(num_of_beers, limit=num_of_beers)
    msg = ''
    until num_of_beers == limit - 1 do
      msg << verse(num_of_beers)
      msg << "\n" unless num_of_beers == limit
      num_of_beers -= 1
    end
    msg
  end

  def verse(num_of_beers)
    msg = ''
    case num_of_beers
    when 0
      msg << last_verse
    when 1
      msg << one_verse
    when 2
      msg << two_verse
    else
      msg << "#{num_of_beers} bottles of beer on the wall, #{num_of_beers} "\
             "bottles of beer.\n"
      num_of_beers -= 1
      msg << "Take one down and pass it around, #{num_of_beers} bottles of "\
             "beer on the wall.\n"
    end
    msg
  end

  def lyrics
    verses(99, 0)
  end

  def two_verse
    "2 bottles of beer on the wall, 2 bottles of beer.\n"\
    "Take one down and pass it around, 1 bottle of beer on the wall.\n"
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