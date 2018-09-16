require('pry')

class Karaoke

  attr_reader :name, :entry_fee, :rooms

  def initialize(name,rooms,entry_fee)
    @name = name
    @rooms = rooms
    @max_capacity = 0
    for room in @rooms
      @max_capacity += room.max_capacity
    end
    @entry_fee = entry_fee
    @list_of_guests_and_bills = Hash.new
  end

  def checkin_guest(guest)
    guests_in_karaoke = 0
    for room in @rooms
      guests_in_karaoke += room.list_of_guests_and_bills.length
    end
    if @list_of_guests_and_bills.include?(guest) == false &&
      guests_in_karaoke < @max_capacity
        guest.wallet -= @entry_fee
        @list_of_guests_and_bills.store(guest, 0)
        return true
      else
        return false
      end
  end

  def checkout_guest(guest)
    if @list_of_guests_and_bills.include?(guest) == true
      return {guest => @list_of_guests_and_bills[guest]}
    else
      return false
    end
  end

  def allocate_guest_to_room(guest)
    # allocate guest to first room with free space
    for room in @rooms
      if room.max_capacity > room.list_of_guests_and_bills.length
        room.checkin_guest(guest)
        return room
      end
    end
    return false
  end


end
