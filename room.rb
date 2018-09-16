require('pry')

class Room

  attr_reader :name, :list_of_songs, :max_capacity
  attr_accessor :list_of_guests_and_bills

  def initialize(name,max_capacity,list_of_songs,list_of_guests)
    @name = name
    @max_capacity = max_capacity
    @list_of_songs = list_of_songs
    @list_of_guests_and_bills = Hash.new
    for guest in list_of_guests
      @list_of_guests_and_bills.store(guest, 0)
    end
  end

  def checkin_guest(guest)
    if @list_of_guests_and_bills.length < @max_capacity
      #  binding.pry
      @list_of_guests_and_bills.store(guest, 0)
      if @list_of_songs.include?(guest.favourite_song_title)
        return guest.cheer_loudly
      else
        return "Uff!"
      end
    else
      return false
    end
  end

  def checkout_guest(guest)
    if @list_of_guests_and_bills.keys.include?(guest)
      return {guest => @list_of_guests_and_bills[guest]}
    else
      return false
    end
  end

  def add_song(song)
    @list_of_songs.push(song)
  end


end
