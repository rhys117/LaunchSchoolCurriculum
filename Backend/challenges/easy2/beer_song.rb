class BeerSong

  def initialize
    @beers = 99
  end

  def verse(num_of_beers, limit=num_of_beers)
    msg = ''
    until num_of_beers == limit - 1 do
      return last_verse if num_of_beers.zero?
      msg << "#{num_of_beers} bottles of beer on the wall, #{num_of_beers} bottles of beer.\n" \
             "Take one down and pass it around, #{num_of_beers - 1} bottles of beer on the wall.\n"
      num_of_beers -= 1
    end
    msg
  end
  alias_method :verses, :verse

  def the_whole_song
    verse(@beers, 0)
  end

  def last_verse
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end
end

p BeerSong.new.verse(3)