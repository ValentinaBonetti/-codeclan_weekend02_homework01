require("minitest/autorun")
require("minitest/rg")
require_relative("../room")
require_relative("../guest")
require_relative("../song")
require_relative("../karaoke")

class TestKaraoke < Minitest::Test

  def setup
    mammamia = Song.new("Mamma mia","ABBA","3:35")
    stairwaytoheaven = Song.new("Stairway to heaven","Led Zeppelin","8:00")
    filippo = Guest.new("Filippo Schiavone",100,"Mamma mia","Hurra")
    @emily = Guest.new("Emily Strokes",15,"Stairway to heaven","Woow")
    room1 = Room.new("01",30,[mammamia,stairwaytoheaven],[filippo,@emily])
    room2 = Room.new("02",2,[mammamia,stairwaytoheaven],[filippo,@emily])
    @CCC = Karaoke.new("Codeclan Caraoke",[room1,room2],5)
  end

  def test_entry_fee
    assert_equal(5,@CCC.entry_fee)
  end

  def test_checkin_guest
    starting_wallet = @emily.wallet
    @CCC.checkin_guest(@emily)
    expected_wallet_change = 5
    actual_wallet_change = starting_wallet - @emily.wallet
    assert_equal(expected_wallet_change,actual_wallet_change)
  end

  def test_checkout_guest
    @CCC.checkin_guest(@emily)
    checked_out = @CCC.checkout_guest(@emily)
    expected_result = {@emily => 0}
    actual_result = checked_out
    assert_equal(expected_result,actual_result)
  end

  def test_allocate_guest_to_room
    expected_room = @CCC.rooms[0]
    actual_room = @CCC.allocate_guest_to_room(@emily)
    assert_equal(expected_room,actual_room)
  end


end
