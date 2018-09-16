require("minitest/autorun")
require("minitest/rg")
require_relative("../guest")


class TestGuest < Minitest::Test

  def setup
    @filippo = Guest.new("Filippo Schiavone",100,"Mamma mia","Hurra")
  end

  def test_guest_name
    assert_equal("Filippo Schiavone",@filippo.name)
  end

  def test_cheer_loudly
    expected_sound = "HURRA!! HURRA!!"
    actual_sound = @filippo.cheer_loudly
    assert_equal(expected_sound,actual_sound)
  end

end
