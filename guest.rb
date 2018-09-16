require('pry')

class Guest

  attr_reader :name, :cheer_loudly, :favourite_song_title
  attr_accessor :wallet

  def initialize(name,wallet,favourite_song_title,cheer_sound)
    @name = name
    @wallet = wallet
    @favourite_song_title = favourite_song_title
    @cheer_sound = cheer_sound
  end


  def cheer_loudly
    return "#{@cheer_sound.upcase}!! #{@cheer_sound.upcase}!!"
  end


end
