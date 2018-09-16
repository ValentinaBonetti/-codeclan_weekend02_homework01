require("minitest/autorun")
require("minitest/rg")
require_relative("../room")
require_relative("../guest")
require_relative("../song")

class TestRoom < Minitest::Test

  def setup
    mammamia = Song.new("Mamma mia","ABBA","3:35")
    stairwaytoheaven = Song.new("Stairway to heaven","Led Zeppelin","8:00")
    filippo = Guest.new("Filippo Schiavone",100,"Mamma mia","Hurra")
    @emily = Guest.new("Emily Strokes",15,"Stairway to heaven","Woow")
    @nick = Guest.new("Nick Harris",149,"Buonanotte fiorellino","Yuppie")
    @room1 = Room.new("01",30,[mammamia,stairwaytoheaven],[filippo,@emily])
    @room2 = Room.new("02",2,[mammamia,stairwaytoheaven],[filippo,@emily])
  end

  def test_room_name
    assert_equal("01",@room1.name)
  end

  def test_checkin_guest__accepted
    accepted = @room1.checkin_guest(@nick)
    expected_result = "Uff!"
    actual_result = accepted
    assert_equal(expected_result,actual_result)
    expected_length_of_guests = 3
    actual_length_of_guests = @room1.list_of_guests_and_bills.length
    assert_equal(expected_length_of_guests,actual_length_of_guests)
  end

  def test_checkin_guest__refused
    accepted = @room2.checkin_guest(@nick)
    expected_result = false
    actual_result = accepted
    assert_equal(expected_result,actual_result)
    expected_length_of_guests = 2
    actual_length_of_guests = @room2.list_of_guests_and_bills.length
    assert_equal(expected_length_of_guests,actual_length_of_guests)
  end

  def test_checkout_guest
    checked_out = @room2.checkout_guest(@emily)
    expected_result = {@emily => 0}
    actual_result = checked_out
    assert_equal(expected_result,actual_result)
  end

  def test_add_song
    comeasyouare = Song.new("Come as you are","Nirvana","3:38")
    @room1.add_song(comeasyouare)
    expected_song = comeasyouare
    actual_song = @room1.list_of_songs.last
    assert_equal(expected_song,actual_song)
  end


end
